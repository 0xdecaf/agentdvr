FROM balenalib/raspberry-pi-debian:buster

RUN apt update && apt install -y \
  unzip ffmpeg \
  libtbb-dev libc6-dev gss-ntlmssp libatlas-base-dev \
  libvlc-dev vlc libx11-dev \
  alsa-utils

ADD https://download.visualstudio.microsoft.com/download/pr/a119100f-e7b3-4c30-a91a-d6ce6b02b51a/196c932070dd023726664a9789e4dc83/dotnet-runtime-3.1.11-linux-arm.tar.gz /tmp

ENV DOTNET_ROOT=/opt/dotnet
ENV PATH="${PATH}:${DOTNET_ROOT}"

RUN mkdir -p ${DOTNET_ROOT} \
  && tar zxf /tmp/dotnet-runtime-3.1.11-linux-arm.tar.gz -C ${DOTNET_ROOT}

ADD https://ispyfiles.azureedge.net/downloads/Agent_ARM32_3_5_7_0.zip /tmp

RUN mkdir -p /opt/agentdvr
RUN unzip -d /opt/agentdvr /tmp/Agent_ARM32_3_5_7_0.zip

EXPOSE 8090
EXPOSE 50000-50010

CMD dotnet /opt/agentdvr/Agent.dll
