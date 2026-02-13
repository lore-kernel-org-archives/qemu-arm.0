Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA336EDF17D
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Feb 2026 15:50:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqvPp-0001sB-N2; Fri, 13 Feb 2026 10:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vqvPn-0001qC-ML
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 10:49:07 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vqvPk-0007w0-4g
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 10:49:07 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b885e8c6700so161673766b.0
 for <qemu-arm@nongnu.org>; Fri, 13 Feb 2026 07:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770997742; x=1771602542; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bjMR3n3zfNN/dHezbD8OCjTnCddT84IPJuAh06w58cA=;
 b=yF2opGb2+SLdF18Z1I4HnktySS8R2tqXMALw1ZxUz4a9C10X7et220IEaCyRcFYG/b
 jqJ5V64GUKT07MJnasgo1NWrg7IXdXHuaQABTMmRqmFKHn0WFOBtrd1mCz3ydFpU6bJZ
 Sf+nT/9Aoo/DKipEMc3ZJ89eAvvRNGqi36bq7I1VPa3Ps1md4iE0/Fb0CypwDwprVWyN
 u5QSBepMlvGueOId8uqa5iYSDwGQjqE1dP0AF586LtjXWbIm9huOW9RQa/yK/yWBPPec
 bjIhfXGtHU9PNNStTSRQ3UcgIpa3YtBqHbsibI85EuqJbGpYEn329TyTnk+s373GC8hl
 Rvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770997742; x=1771602542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bjMR3n3zfNN/dHezbD8OCjTnCddT84IPJuAh06w58cA=;
 b=L3QfCyF46122jJTn7WGvoA93AbN1gHQjHdX07BCIMnPWJo504thzvwNQ2cmV6wOZqv
 vBV9ZAKXwP0Ufnx2ndW8jQ9RKcsCK8Th95py3kKPnx5gk3DoNsAu/W15GYUZFlfYn3El
 8bsixLYLXTQMFTt736DYe5wxEyUUu8TN30jELYGzPLoxbmd/DnweXIq4jjZKGxV3wCYb
 qQ3F3F8vwKS4fs//sJITfYs+QyDMNdGrLYaXDwLxdJr5Y+lDdjdTkc9J8SPbSq8oEXNC
 YW27p7FN+rs4vcJnh/YKedeaHGrVQDmWoIZ8nrboiCDRlwN+XIox88m6+gvwm89O1JEF
 Oqzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKl4IxJt5AiBH1sJMj4RLXxGToB/K7NC7Q7LCwtid6WfutrMgUgbf0iP3jsChjV6Db3qEaQ0oSsw==@nongnu.org
X-Gm-Message-State: AOJu0YwLlJblYjXQHz0uD7ttEG2qpZoh6y1TMBuqThB/YY/iBn0uG4La
 PfxlCBOb2wI/rFn+PyK1axVO3G35JtcdN1SWVbZ2m/AzNQQaKtGDKx91lXj+6sSLQmc=
X-Gm-Gg: AZuq6aL3S1cvaMwPgc6lZwUC9P67Hvlq2xWWRhIK7AgmGsIOUpiem+DWEfpfi2Sopjv
 MrfoTj5N36dQq8ahICtQ4ORglzTjOuJk+xc/dbGHN+39GoxM3Hbd1+dr6R7sFkGdHC1aq3C5baT
 ZHAoPNP7b02ZzZd2OecGPSqxIIwU9wpjP3oH3oqmGfHP9+pgIObrLSjTVV99C9hE+MFWnwhlrPq
 f+10WpCkkyaRnpJfHKDyza9yWmJ0eVRsldTwTzkoCkC36/Wabk0U+3tYU9oYZu6D/Desel+s6UJ
 sz3BorSZIyxa/ZZ0yKTGCDWh3OMulFw4I/Q6PZFs83/eO2Uzz6gvmDq9paFYRi3EU5pdHavAL+z
 3PQTWQ1Yi69MizxDn6wTaL1eFejsPa5WB2RdXxyOpQzEnOal6Fk2kx8lg1hTy0tB41SvYGC51i7
 fzbfGOfSPtH8XLGr4nwm1pg6g=
X-Received: by 2002:a17:907:9283:b0:b88:775c:bd6b with SMTP id
 a640c23a62f3a-b8face4ddd4mr171241666b.46.1770997741554; 
 Fri, 13 Feb 2026 07:49:01 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8f6ebd76a6sm272259266b.40.2026.02.13.07.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 07:49:00 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id EEC955FC78;
 Fri, 13 Feb 2026 15:48:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH 1/6] tests: bump libvirt-ci to latest state
Date: Fri, 13 Feb 2026 15:48:54 +0000
Message-ID: <20260213154859.1551283-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260213154859.1551283-1-alex.bennee@linaro.org>
References: <20260213154859.1551283-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This entails updating alpine and fedora images to more recent versions
as well as the missing macos-14.vars update missed from last time.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/alpine.docker        |   4 +-
 tests/docker/dockerfiles/centos9.docker       | 240 ++++++++--------
 .../dockerfiles/fedora-rust-nightly.docker    | 262 +++++++++---------
 .../dockerfiles/fedora-win64-cross.docker     | 162 +++++------
 tests/docker/dockerfiles/fedora.docker        | 262 +++++++++---------
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/refresh                         |   8 +-
 7 files changed, 470 insertions(+), 470 deletions(-)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 03dd6851f60..76d8dd8cfc7 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all alpine-321 qemu
+#  $ lcitool dockerfile --layers all alpine-323 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM docker.io/library/alpine:3.21
+FROM docker.io/library/alpine:3.23
 
 RUN apk update && \
     apk upgrade && \
diff --git a/tests/docker/dockerfiles/centos9.docker b/tests/docker/dockerfiles/centos9.docker
index 670e22be5ad..90ac1f7fade 100644
--- a/tests/docker/dockerfiles/centos9.docker
+++ b/tests/docker/dockerfiles/centos9.docker
@@ -6,126 +6,126 @@
 
 FROM quay.io/centos/centos:stream9
 
-RUN dnf distro-sync -y && \
-    dnf install 'dnf-command(config-manager)' -y && \
-    dnf config-manager --set-enabled -y crb && \
-    dnf install -y epel-release && \
-    dnf install -y epel-next-release && \
-    dnf install -y \
-        SDL2-devel \
-        alsa-lib-devel \
-        bash \
-        bc \
-        bindgen-cli \
-        bison \
-        brlapi-devel \
-        bzip2 \
-        bzip2-devel \
-        ca-certificates \
-        capstone-devel \
-        ccache \
-        clang \
-        compiler-rt \
-        coreutils-single \
-        ctags \
-        cyrus-sasl-devel \
-        daxctl-devel \
-        dbus-daemon \
-        device-mapper-multipath-devel \
-        diffutils \
-        findutils \
-        flex \
-        fuse3-devel \
-        gcc \
-        gettext \
-        git \
-        glib2-devel \
-        glib2-static \
-        glibc-langpack-en \
-        glibc-static \
-        gnutls-devel \
-        gtk3-devel \
-        hostname \
-        jemalloc-devel \
-        json-c-devel \
-        libaio-devel \
-        libasan \
-        libattr-devel \
-        libbpf-devel \
-        libcacard-devel \
-        libcap-ng-devel \
-        libcmocka-devel \
-        libcurl-devel \
-        libdrm-devel \
-        libepoxy-devel \
-        libfdt-devel \
-        libffi-devel \
-        libgcrypt-devel \
-        libiscsi-devel \
-        libjpeg-devel \
-        libnfs-devel \
-        libpmem-devel \
-        libpng-devel \
-        librbd-devel \
-        libseccomp-devel \
-        libselinux-devel \
-        libslirp-devel \
-        libssh-devel \
-        libtasn1-devel \
-        libubsan \
-        liburing-devel \
-        libusbx-devel \
-        libxdp-devel \
-        libzstd-devel \
-        llvm \
-        lttng-ust-devel \
-        lzo-devel \
-        make \
-        mesa-libgbm-devel \
-        meson \
-        mtools \
-        ncurses-devel \
-        nettle-devel \
-        ninja-build \
-        nmap-ncat \
-        numactl-devel \
-        openssh-clients \
-        pam-devel \
-        pcre-static \
-        pipewire-devel \
-        pixman-devel \
-        pkgconfig \
-        pulseaudio-libs-devel \
-        python3 \
-        python3-PyYAML \
-        python3-numpy \
-        python3-pillow \
-        python3-pip \
-        python3-sphinx \
-        python3-sphinx_rtd_theme \
-        python3-tomli \
-        rdma-core-devel \
-        rust \
-        rust-std-static \
-        sed \
-        snappy-devel \
-        socat \
-        spice-protocol \
-        swtpm \
-        systemd-devel \
-        systemtap-sdt-devel \
-        tar \
-        usbredir-devel \
-        util-linux \
-        vte291-devel \
-        vulkan-tools \
-        which \
-        xorriso \
-        zlib-devel \
-        zlib-static \
-        zstd && \
-    dnf autoremove -y && \
-    dnf clean all -y && \
+RUN dnf --quiet distro-sync -y && \
+    dnf --quiet install 'dnf-command(config-manager)' -y && \
+    dnf --quiet config-manager --set-enabled -y crb && \
+    dnf --quiet install -y epel-release && \
+    dnf --quiet install -y epel-next-release && \
+    dnf --quiet install -y \
+                SDL2-devel \
+                alsa-lib-devel \
+                bash \
+                bc \
+                bindgen-cli \
+                bison \
+                brlapi-devel \
+                bzip2 \
+                bzip2-devel \
+                ca-certificates \
+                capstone-devel \
+                ccache \
+                clang \
+                compiler-rt \
+                coreutils-single \
+                ctags \
+                cyrus-sasl-devel \
+                daxctl-devel \
+                dbus-daemon \
+                device-mapper-multipath-devel \
+                diffutils \
+                findutils \
+                flex \
+                fuse3-devel \
+                gcc \
+                gettext \
+                git \
+                glib2-devel \
+                glib2-static \
+                glibc-langpack-en \
+                glibc-static \
+                gnutls-devel \
+                gtk3-devel \
+                hostname \
+                jemalloc-devel \
+                json-c-devel \
+                libaio-devel \
+                libasan \
+                libattr-devel \
+                libbpf-devel \
+                libcacard-devel \
+                libcap-ng-devel \
+                libcmocka-devel \
+                libcurl-devel \
+                libdrm-devel \
+                libepoxy-devel \
+                libfdt-devel \
+                libffi-devel \
+                libgcrypt-devel \
+                libiscsi-devel \
+                libjpeg-devel \
+                libnfs-devel \
+                libpmem-devel \
+                libpng-devel \
+                librbd-devel \
+                libseccomp-devel \
+                libselinux-devel \
+                libslirp-devel \
+                libssh-devel \
+                libtasn1-devel \
+                libubsan \
+                liburing-devel \
+                libusbx-devel \
+                libxdp-devel \
+                libzstd-devel \
+                llvm \
+                lttng-ust-devel \
+                lzo-devel \
+                make \
+                mesa-libgbm-devel \
+                meson \
+                mtools \
+                ncurses-devel \
+                nettle-devel \
+                ninja-build \
+                nmap-ncat \
+                numactl-devel \
+                openssh-clients \
+                pam-devel \
+                pcre-static \
+                pipewire-devel \
+                pixman-devel \
+                pkgconfig \
+                pulseaudio-libs-devel \
+                python3 \
+                python3-PyYAML \
+                python3-numpy \
+                python3-pillow \
+                python3-pip \
+                python3-sphinx \
+                python3-sphinx_rtd_theme \
+                python3-tomli \
+                rdma-core-devel \
+                rust \
+                rust-std-static \
+                sed \
+                snappy-devel \
+                socat \
+                spice-protocol \
+                swtpm \
+                systemd-devel \
+                systemtap-sdt-devel \
+                tar \
+                usbredir-devel \
+                util-linux \
+                vte291-devel \
+                vulkan-tools \
+                which \
+                xorriso \
+                zlib-devel \
+                zlib-static \
+                zstd && \
+    dnf --quiet autoremove -y && \
+    dnf --quiet clean all -y && \
     rm -f /usr/lib*/python3*/EXTERNALLY-MANAGED && \
     rpm -qa | sort > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
diff --git a/tests/docker/dockerfiles/fedora-rust-nightly.docker b/tests/docker/dockerfiles/fedora-rust-nightly.docker
index 8e3b3a9fd90..043b42a0a9b 100644
--- a/tests/docker/dockerfiles/fedora-rust-nightly.docker
+++ b/tests/docker/dockerfiles/fedora-rust-nightly.docker
@@ -1,12 +1,12 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all fedora-41 qemu
+#  $ lcitool dockerfile --layers all fedora-43 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.fedoraproject.org/fedora:41
+FROM registry.fedoraproject.org/fedora:43
 
-RUN dnf install -y nosync && \
+RUN dnf --quiet install -y nosync && \
     printf '#!/bin/sh\n\
 if test -d /usr/lib64\n\
 then\n\
@@ -16,134 +16,134 @@ else\n\
 fi\n\
 exec "$@"\n' > /usr/bin/nosync && \
     chmod +x /usr/bin/nosync && \
-    nosync dnf update -y && \
-    nosync dnf install -y \
-               SDL2-devel \
-               SDL2_image-devel \
-               alsa-lib-devel \
-               bash \
-               bc \
-               bindgen-cli \
-               bison \
-               brlapi-devel \
-               bzip2 \
-               bzip2-devel \
-               ca-certificates \
-               capstone-devel \
-               ccache \
-               clang \
-               compiler-rt \
-               coreutils \
-               ctags \
-               cyrus-sasl-devel \
-               daxctl-devel \
-               dbus-daemon \
-               device-mapper-multipath-devel \
-               diffutils \
-               findutils \
-               flex \
-               fuse3-devel \
-               gcc \
-               gcovr \
-               gettext \
-               git \
-               glib2-devel \
-               glib2-static \
-               glibc-langpack-en \
-               glibc-static \
-               glusterfs-api-devel \
-               gnutls-devel \
-               gtk-vnc2-devel \
-               gtk3-devel \
-               hostname \
-               jemalloc-devel \
-               json-c-devel \
-               libaio-devel \
-               libasan \
-               libattr-devel \
-               libbpf-devel \
-               libcacard-devel \
-               libcap-ng-devel \
-               libcbor-devel \
-               libcmocka-devel \
-               libcurl-devel \
-               libdrm-devel \
-               libepoxy-devel \
-               libfdt-devel \
-               libffi-devel \
-               libgcrypt-devel \
-               libiscsi-devel \
-               libjpeg-devel \
-               libnfs-devel \
-               libpmem-devel \
-               libpng-devel \
-               librbd-devel \
-               libseccomp-devel \
-               libselinux-devel \
-               libslirp-devel \
-               libssh-devel \
-               libtasn1-devel \
-               libubsan \
-               liburing-devel \
-               libusbx-devel \
-               libxdp-devel \
-               libzstd-devel \
-               llvm \
-               lttng-ust-devel \
-               lzo-devel \
-               make \
-               mesa-libgbm-devel \
-               mtools \
-               ncurses-devel \
-               nettle-devel \
-               ninja-build \
-               nmap-ncat \
-               numactl-devel \
-               openssh-clients \
-               pam-devel \
-               pcre2-static \
-               pipewire-devel \
-               pixman-devel \
-               pkgconfig \
-               pulseaudio-libs-devel \
-               python3 \
-               python3-PyYAML \
-               python3-numpy \
-               python3-opencv \
-               python3-pillow \
-               python3-pip \
-               python3-setuptools \
-               python3-sphinx \
-               python3-sphinx_rtd_theme \
-               python3-wheel \
-               rdma-core-devel \
-               rust \
-               rust-std-static \
-               sed \
-               snappy-devel \
-               socat \
-               sparse \
-               spice-protocol \
-               spice-server-devel \
-               swtpm \
-               systemd-devel \
-               systemtap-sdt-dtrace \
-               tar \
-               tesseract \
-               tesseract-langpack-eng \
-               usbredir-devel \
-               util-linux \
-               virglrenderer-devel \
-               vte291-devel \
-               vulkan-tools \
-               which \
-               xen-devel \
-               xorriso \
-               zlib-devel \
-               zlib-static \
-               zstd && \
-    nosync dnf autoremove -y && \
-    nosync dnf clean all -y && \
+    nosync dnf --quiet update -y && \
+    nosync dnf --quiet install -y \
+                       SDL2_image-devel \
+                       alsa-lib-devel \
+                       bash \
+                       bc \
+                       bindgen-cli \
+                       bison \
+                       brlapi-devel \
+                       bzip2 \
+                       bzip2-devel \
+                       ca-certificates \
+                       capstone-devel \
+                       ccache \
+                       clang \
+                       compiler-rt \
+                       coreutils \
+                       ctags \
+                       cyrus-sasl-devel \
+                       daxctl-devel \
+                       dbus-daemon \
+                       device-mapper-multipath-devel \
+                       diffutils \
+                       findutils \
+                       flex \
+                       fuse3-devel \
+                       gcc \
+                       gcovr \
+                       gettext \
+                       git \
+                       glib2-devel \
+                       glib2-static \
+                       glibc-langpack-en \
+                       glibc-static \
+                       glusterfs-api-devel \
+                       gnutls-devel \
+                       gtk-vnc2-devel \
+                       gtk3-devel \
+                       hostname \
+                       jemalloc-devel \
+                       json-c-devel \
+                       libaio-devel \
+                       libasan \
+                       libattr-devel \
+                       libbpf-devel \
+                       libcacard-devel \
+                       libcap-ng-devel \
+                       libcbor-devel \
+                       libcmocka-devel \
+                       libcurl-devel \
+                       libdrm-devel \
+                       libepoxy-devel \
+                       libfdt-devel \
+                       libffi-devel \
+                       libgcrypt-devel \
+                       libiscsi-devel \
+                       libjpeg-devel \
+                       libnfs-devel \
+                       libpmem-devel \
+                       libpng-devel \
+                       librbd-devel \
+                       libseccomp-devel \
+                       libselinux-devel \
+                       libslirp-devel \
+                       libssh-devel \
+                       libtasn1-devel \
+                       libubsan \
+                       liburing-devel \
+                       libusbx-devel \
+                       libxdp-devel \
+                       libzstd-devel \
+                       llvm \
+                       lttng-ust-devel \
+                       lzo-devel \
+                       make \
+                       mesa-libgbm-devel \
+                       mtools \
+                       ncurses-devel \
+                       nettle-devel \
+                       ninja-build \
+                       nmap-ncat \
+                       numactl-devel \
+                       openssh-clients \
+                       pam-devel \
+                       pcre2-static \
+                       pipewire-devel \
+                       pixman-devel \
+                       pkgconfig \
+                       pulseaudio-libs-devel \
+                       python3 \
+                       python3-PyYAML \
+                       python3-numpy \
+                       python3-opencv \
+                       python3-pillow \
+                       python3-pip \
+                       python3-setuptools \
+                       python3-sphinx \
+                       python3-sphinx_rtd_theme \
+                       python3-wheel \
+                       rdma-core-devel \
+                       rust \
+                       rust-std-static \
+                       sdl2-compat-devel \
+                       sed \
+                       snappy-devel \
+                       socat \
+                       sparse \
+                       spice-protocol \
+                       spice-server-devel \
+                       swtpm \
+                       systemd-devel \
+                       systemtap-sdt-dtrace \
+                       tar \
+                       tesseract \
+                       tesseract-langpack-eng \
+                       usbredir-devel \
+                       util-linux \
+                       virglrenderer-devel \
+                       vte291-devel \
+                       vulkan-tools \
+                       which \
+                       xen-devel \
+                       xorriso \
+                       zlib-devel \
+                       zlib-static \
+                       zstd && \
+    nosync dnf --quiet autoremove -y && \
+    nosync dnf --quiet clean all -y && \
     rm -f /usr/lib*/python3*/EXTERNALLY-MANAGED && \
     rpm -qa | sort > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index c5e1fcebf51..818485c4ba2 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -1,12 +1,12 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all --cross-arch mingw64 fedora-41 qemu,qemu-win-installer
+#  $ lcitool dockerfile --layers all --cross-arch mingw64 fedora-43 qemu,qemu-win-installer
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.fedoraproject.org/fedora:41
+FROM registry.fedoraproject.org/fedora:43
 
-RUN dnf install -y nosync && \
+RUN dnf --quiet install -y nosync && \
     printf '#!/bin/sh\n\
 if test -d /usr/lib64\n\
 then\n\
@@ -16,59 +16,59 @@ else\n\
 fi\n\
 exec "$@"\n' > /usr/bin/nosync && \
     chmod +x /usr/bin/nosync && \
-    nosync dnf update -y && \
-    nosync dnf install -y \
-               bash \
-               bc \
-               bindgen-cli \
-               bison \
-               bzip2 \
-               ca-certificates \
-               ccache \
-               compiler-rt \
-               coreutils \
-               ctags \
-               dbus-daemon \
-               diffutils \
-               findutils \
-               flex \
-               gcc \
-               gcovr \
-               git \
-               glib2-devel \
-               glibc-langpack-en \
-               hostname \
-               llvm \
-               make \
-               mtools \
-               ninja-build \
-               nmap-ncat \
-               openssh-clients \
-               python3 \
-               python3-PyYAML \
-               python3-numpy \
-               python3-opencv \
-               python3-pillow \
-               python3-pip \
-               python3-setuptools \
-               python3-sphinx \
-               python3-sphinx_rtd_theme \
-               python3-wheel \
-               rust \
-               sed \
-               socat \
-               sparse \
-               swtpm \
-               tar \
-               tesseract \
-               tesseract-langpack-eng \
-               util-linux \
-               vulkan-tools \
-               which \
-               xorriso \
-               zstd && \
-    nosync dnf autoremove -y && \
-    nosync dnf clean all -y && \
+    nosync dnf --quiet update -y && \
+    nosync dnf --quiet install -y \
+                       bash \
+                       bc \
+                       bindgen-cli \
+                       bison \
+                       bzip2 \
+                       ca-certificates \
+                       ccache \
+                       compiler-rt \
+                       coreutils \
+                       ctags \
+                       dbus-daemon \
+                       diffutils \
+                       findutils \
+                       flex \
+                       gcc \
+                       gcovr \
+                       git \
+                       glib2-devel \
+                       glibc-langpack-en \
+                       hostname \
+                       llvm \
+                       make \
+                       mtools \
+                       ninja-build \
+                       nmap-ncat \
+                       openssh-clients \
+                       python3 \
+                       python3-PyYAML \
+                       python3-numpy \
+                       python3-opencv \
+                       python3-pillow \
+                       python3-pip \
+                       python3-setuptools \
+                       python3-sphinx \
+                       python3-sphinx_rtd_theme \
+                       python3-wheel \
+                       rust \
+                       sed \
+                       socat \
+                       sparse \
+                       swtpm \
+                       tar \
+                       tesseract \
+                       tesseract-langpack-eng \
+                       util-linux \
+                       vulkan-tools \
+                       which \
+                       xorriso \
+                       zstd && \
+    nosync dnf --quiet autoremove -y && \
+    nosync dnf --quiet clean all -y && \
     rm -f /usr/lib*/python3*/EXTERNALLY-MANAGED
 
 RUN /usr/bin/pip3 install meson==1.8.1
@@ -79,31 +79,31 @@ ENV MAKE="/usr/bin/make"
 ENV NINJA="/usr/bin/ninja"
 ENV PYTHON="/usr/bin/python3"
 
-RUN nosync dnf install -y \
-               mingw-w64-tools \
-               mingw32-nsis \
-               mingw64-SDL2 \
-               mingw64-SDL2_image \
-               mingw64-bzip2 \
-               mingw64-curl \
-               mingw64-gcc \
-               mingw64-gcc-c++ \
-               mingw64-gettext \
-               mingw64-glib2 \
-               mingw64-gnutls \
-               mingw64-gtk-vnc2 \
-               mingw64-gtk3 \
-               mingw64-libepoxy \
-               mingw64-libfdt \
-               mingw64-libgcrypt \
-               mingw64-libjpeg-turbo \
-               mingw64-libpng \
-               mingw64-libtasn1 \
-               mingw64-nettle \
-               mingw64-pixman \
-               mingw64-pkg-config \
-               rust-std-static-x86_64-pc-windows-gnu && \
-    nosync dnf clean all -y && \
+RUN nosync dnf --quiet install -y \
+                       mingw-w64-tools \
+                       mingw32-nsis \
+                       mingw64-SDL2 \
+                       mingw64-SDL2_image \
+                       mingw64-bzip2 \
+                       mingw64-curl \
+                       mingw64-gcc \
+                       mingw64-gcc-c++ \
+                       mingw64-gettext \
+                       mingw64-glib2 \
+                       mingw64-gnutls \
+                       mingw64-gtk-vnc2 \
+                       mingw64-gtk3 \
+                       mingw64-libepoxy \
+                       mingw64-libfdt \
+                       mingw64-libgcrypt \
+                       mingw64-libjpeg-turbo \
+                       mingw64-libpng \
+                       mingw64-libtasn1 \
+                       mingw64-nettle \
+                       mingw64-pixman \
+                       mingw64-pkg-config \
+                       rust-std-static-x86_64-pc-windows-gnu && \
+    nosync dnf --quiet clean all -y && \
     rpm -qa | sort > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-w64-mingw32-c++ && \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 9278d797693..32aaf01aff4 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,12 +1,12 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all fedora-41 qemu
+#  $ lcitool dockerfile --layers all fedora-43 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.fedoraproject.org/fedora:41
+FROM registry.fedoraproject.org/fedora:43
 
-RUN dnf install -y nosync && \
+RUN dnf --quiet install -y nosync && \
     printf '#!/bin/sh\n\
 if test -d /usr/lib64\n\
 then\n\
@@ -16,134 +16,134 @@ else\n\
 fi\n\
 exec "$@"\n' > /usr/bin/nosync && \
     chmod +x /usr/bin/nosync && \
-    nosync dnf update -y && \
-    nosync dnf install -y \
-               SDL2-devel \
-               SDL2_image-devel \
-               alsa-lib-devel \
-               bash \
-               bc \
-               bindgen-cli \
-               bison \
-               brlapi-devel \
-               bzip2 \
-               bzip2-devel \
-               ca-certificates \
-               capstone-devel \
-               ccache \
-               clang \
-               compiler-rt \
-               coreutils \
-               ctags \
-               cyrus-sasl-devel \
-               daxctl-devel \
-               dbus-daemon \
-               device-mapper-multipath-devel \
-               diffutils \
-               findutils \
-               flex \
-               fuse3-devel \
-               gcc \
-               gcovr \
-               gettext \
-               git \
-               glib2-devel \
-               glib2-static \
-               glibc-langpack-en \
-               glibc-static \
-               glusterfs-api-devel \
-               gnutls-devel \
-               gtk-vnc2-devel \
-               gtk3-devel \
-               hostname \
-               jemalloc-devel \
-               json-c-devel \
-               libaio-devel \
-               libasan \
-               libattr-devel \
-               libbpf-devel \
-               libcacard-devel \
-               libcap-ng-devel \
-               libcbor-devel \
-               libcmocka-devel \
-               libcurl-devel \
-               libdrm-devel \
-               libepoxy-devel \
-               libfdt-devel \
-               libffi-devel \
-               libgcrypt-devel \
-               libiscsi-devel \
-               libjpeg-devel \
-               libnfs-devel \
-               libpmem-devel \
-               libpng-devel \
-               librbd-devel \
-               libseccomp-devel \
-               libselinux-devel \
-               libslirp-devel \
-               libssh-devel \
-               libtasn1-devel \
-               libubsan \
-               liburing-devel \
-               libusbx-devel \
-               libxdp-devel \
-               libzstd-devel \
-               llvm \
-               lttng-ust-devel \
-               lzo-devel \
-               make \
-               mesa-libgbm-devel \
-               mtools \
-               ncurses-devel \
-               nettle-devel \
-               ninja-build \
-               nmap-ncat \
-               numactl-devel \
-               openssh-clients \
-               pam-devel \
-               pcre2-static \
-               pipewire-devel \
-               pixman-devel \
-               pkgconfig \
-               pulseaudio-libs-devel \
-               python3 \
-               python3-PyYAML \
-               python3-numpy \
-               python3-opencv \
-               python3-pillow \
-               python3-pip \
-               python3-setuptools \
-               python3-sphinx \
-               python3-sphinx_rtd_theme \
-               python3-wheel \
-               rdma-core-devel \
-               rust \
-               rust-std-static \
-               sed \
-               snappy-devel \
-               socat \
-               sparse \
-               spice-protocol \
-               spice-server-devel \
-               swtpm \
-               systemd-devel \
-               systemtap-sdt-dtrace \
-               tar \
-               tesseract \
-               tesseract-langpack-eng \
-               usbredir-devel \
-               util-linux \
-               virglrenderer-devel \
-               vte291-devel \
-               vulkan-tools \
-               which \
-               xen-devel \
-               xorriso \
-               zlib-devel \
-               zlib-static \
-               zstd && \
-    nosync dnf autoremove -y && \
-    nosync dnf clean all -y && \
+    nosync dnf --quiet update -y && \
+    nosync dnf --quiet install -y \
+                       SDL2_image-devel \
+                       alsa-lib-devel \
+                       bash \
+                       bc \
+                       bindgen-cli \
+                       bison \
+                       brlapi-devel \
+                       bzip2 \
+                       bzip2-devel \
+                       ca-certificates \
+                       capstone-devel \
+                       ccache \
+                       clang \
+                       compiler-rt \
+                       coreutils \
+                       ctags \
+                       cyrus-sasl-devel \
+                       daxctl-devel \
+                       dbus-daemon \
+                       device-mapper-multipath-devel \
+                       diffutils \
+                       findutils \
+                       flex \
+                       fuse3-devel \
+                       gcc \
+                       gcovr \
+                       gettext \
+                       git \
+                       glib2-devel \
+                       glib2-static \
+                       glibc-langpack-en \
+                       glibc-static \
+                       glusterfs-api-devel \
+                       gnutls-devel \
+                       gtk-vnc2-devel \
+                       gtk3-devel \
+                       hostname \
+                       jemalloc-devel \
+                       json-c-devel \
+                       libaio-devel \
+                       libasan \
+                       libattr-devel \
+                       libbpf-devel \
+                       libcacard-devel \
+                       libcap-ng-devel \
+                       libcbor-devel \
+                       libcmocka-devel \
+                       libcurl-devel \
+                       libdrm-devel \
+                       libepoxy-devel \
+                       libfdt-devel \
+                       libffi-devel \
+                       libgcrypt-devel \
+                       libiscsi-devel \
+                       libjpeg-devel \
+                       libnfs-devel \
+                       libpmem-devel \
+                       libpng-devel \
+                       librbd-devel \
+                       libseccomp-devel \
+                       libselinux-devel \
+                       libslirp-devel \
+                       libssh-devel \
+                       libtasn1-devel \
+                       libubsan \
+                       liburing-devel \
+                       libusbx-devel \
+                       libxdp-devel \
+                       libzstd-devel \
+                       llvm \
+                       lttng-ust-devel \
+                       lzo-devel \
+                       make \
+                       mesa-libgbm-devel \
+                       mtools \
+                       ncurses-devel \
+                       nettle-devel \
+                       ninja-build \
+                       nmap-ncat \
+                       numactl-devel \
+                       openssh-clients \
+                       pam-devel \
+                       pcre2-static \
+                       pipewire-devel \
+                       pixman-devel \
+                       pkgconfig \
+                       pulseaudio-libs-devel \
+                       python3 \
+                       python3-PyYAML \
+                       python3-numpy \
+                       python3-opencv \
+                       python3-pillow \
+                       python3-pip \
+                       python3-setuptools \
+                       python3-sphinx \
+                       python3-sphinx_rtd_theme \
+                       python3-wheel \
+                       rdma-core-devel \
+                       rust \
+                       rust-std-static \
+                       sdl2-compat-devel \
+                       sed \
+                       snappy-devel \
+                       socat \
+                       sparse \
+                       spice-protocol \
+                       spice-server-devel \
+                       swtpm \
+                       systemd-devel \
+                       systemtap-sdt-dtrace \
+                       tar \
+                       tesseract \
+                       tesseract-langpack-eng \
+                       usbredir-devel \
+                       util-linux \
+                       virglrenderer-devel \
+                       vte291-devel \
+                       vulkan-tools \
+                       which \
+                       xen-devel \
+                       xorriso \
+                       zlib-devel \
+                       zlib-static \
+                       zstd && \
+    nosync dnf --quiet autoremove -y && \
+    nosync dnf --quiet clean all -y && \
     rm -f /usr/lib*/python3*/EXTERNALLY-MANAGED && \
     rpm -qa | sort > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index caed407a0f1..750455ce119 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit caed407a0f1dfe3a3293a41c378c382deefbac36
+Subproject commit 750455ce1199db7e304a6b4feae5f290283dd52a
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 01a71929542..8f0aa3fa343 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -215,12 +215,12 @@ try:
     #
     # Standard native builds
     #
-    generate_dockerfile("alpine", "alpine-321",
+    generate_dockerfile("alpine", "alpine-323",
                         trailer="".join(alpine_extras))
     generate_dockerfile("centos9", "centos-stream-9")
     generate_dockerfile("debian", "debian-13",
                         trailer="".join(debian13_extras))
-    generate_dockerfile("fedora", "fedora-41")
+    generate_dockerfile("fedora", "fedora-43")
     generate_dockerfile("opensuse-leap", "opensuse-leap-15")
     generate_dockerfile("ubuntu2204", "ubuntu-2204",
                         trailer="".join(ubuntu2204_rust_extras),
@@ -230,7 +230,7 @@ try:
     #
     # Non-fatal Rust-enabled build
     #
-    generate_dockerfile("fedora-rust-nightly", "fedora-41",
+    generate_dockerfile("fedora-rust-nightly", "fedora-43",
                         trailer="".join(fedora_rustup_nightly_extras))
 
     #
@@ -287,7 +287,7 @@ try:
                         trailer=cross_build("s390x-linux-gnu-",
                                             "s390x-softmmu,s390x-linux-user"))
 
-    generate_dockerfile("fedora-win64-cross", "fedora-41",
+    generate_dockerfile("fedora-win64-cross", "fedora-43",
                         project='qemu,qemu-win-installer',
                         cross="mingw64",
                         trailer=cross_build("x86_64-w64-mingw32-",
-- 
2.47.3


