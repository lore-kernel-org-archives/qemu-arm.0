Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57861FD8FF4
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 18:53:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvgU2-0008Bi-FB; Thu, 26 Feb 2026 13:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vvgU1-0008BN-IA
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 13:53:09 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vvgTz-0003WQ-Dr
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 13:53:09 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b8fb3c4bbc4so168866266b.2
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 10:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772131985; x=1772736785; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QkFfoTUTnHUyPobpDVFMIZRdkqj9H3jZxM/MRJrFhww=;
 b=GIm49HwOXve7E6ifuHuQyJDLGabkS4Avh/GTBf35SXwcbaHVXHE/8/fWSteBSbeYRF
 XtNY+I8Li2GV5tLt9tuzH0K7l4KFRhUmsOz1/TDTJyL8V+70UnneOulrFMs9mc55V7Tj
 BMhRXF4hSpVzOurjHdpdu5Ht1OmHDJwW7LLIMjPbJuSuZ8OBn9zGg5DphWCAB+gzzJD6
 BTLXd0BUPIn2g8LNQAxFw8n8ZYaUjVM/I5tZ77JJnui0czNF0zyNDz0HcAr0FPJY4pZt
 pLIROl7Qp51id00kK9Y6kPwOV+hwE2VkmW2imQ8kNDQh9TeSwj6zfmhUUfZMFhJXhBA+
 Lm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772131985; x=1772736785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QkFfoTUTnHUyPobpDVFMIZRdkqj9H3jZxM/MRJrFhww=;
 b=aaVxV5S1dPOZP+QKLqxEDz9rQFCEd/JjPYIVezdq6qto9uILDafFVNNN4+aGX6esta
 DywS1PZVnTTs/jTbJa1Gic34Y5/MImOgMwEprKCKNw9+kwOf+oK9MZSNGzBTumBv8oy3
 TQ1ZdbFnWOrt7AQMM6+e3SpnbZmCKnd90L5yyucqKZSB+9emwu27netL0CYEzhfIwGef
 pF7e+8B4hkPhjJPl3lH5/pEBB1HBcs2rY3+Ov2k0LVqIviqr66HjASQqOoXWgS1WXWhc
 rMSiuLpNEJirwAlGVjFGPz2k0+9dlXB3ZSh9ACoTb23Jc+83THkBiHm8ktLLA9vNvBO/
 WkWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZohBiQ/+PfxF8zsF9QPSLewhVTZ04kUgDnFUhoy5tZ0LJwf3+/V/hnfioIDCH9DtHwx/Yz8VSkg==@nongnu.org
X-Gm-Message-State: AOJu0YxtYtR/llYgL7uUNcUna9bx0cdHYBxUWxZY5tSI3oz4fUNLG5kb
 sNklFUHd80hIGZmImx8a5BVrgyBsPTLONZbk8SbRPaGq4aXfE57zAAodZrc+hMX7c6U=
X-Gm-Gg: ATEYQzwJpUbl4jOb82Dob2kpDCKNGYVjesLo//f034yaxrMO4DpOFUD0PuJlQ2zicN5
 U1g09F8Q8eYetJWuWvBIBP17Tw/zjtxgr+s+ZS8NCbCjwcbn8S1IJNl9gFfrYifV4Hqz2jLqv1o
 kWV2Ugfk5eaonfiDmUG5NgN73lU2MKERF0KvJoHBpUwWfNidDlP0AT/NKtgbWsEZzRJPlhPooyy
 gN1eKti++zqh7Rs9Lht7637NgA1a2E7o8R0P0amqeWBKl66yJ7JEqRTwwJUnx6AvmFhHvM9MNXB
 1MWjT0mkhM3vHMYcbGgJ/4/BzR+OwkY06issO2pGRmtJm2LIV0FEC+HVXGCpR6K5nwNERcSHCpX
 m6XQBmfhoLUCjbP9MJ7z7N8KGgYIaKxLhNCZRP2P6rap+C9TC/1Rlu/NEbLrHVtbgnByqjGn8Qa
 MJmag+hMGRwsBDJEJ1t6v4PEg=
X-Received: by 2002:a17:907:84b:b0:b88:6542:86a0 with SMTP id
 a640c23a62f3a-b93517e2cb1mr324107566b.54.1772131985363; 
 Thu, 26 Feb 2026 10:53:05 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ae60bf5sm86835266b.42.2026.02.26.10.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 10:53:04 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7CE045F8BA;
 Thu, 26 Feb 2026 18:53:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 1/7] tests/docker: upgrade most non-lcitool debian tests to
 debian 13
Date: Thu, 26 Feb 2026 18:52:56 +0000
Message-ID: <20260226185303.1920021-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226185303.1920021-1-alex.bennee@linaro.org>
References: <20260226185303.1920021-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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

From: John Snow <jsnow@redhat.com>

Debian 11 was EOL in 2024, and Debian 12 will be EOL this June. This
patch moves all but one of our tests, debian-legacy-test-cross, onto
Debian 13.

This patch does the bare minimum to upgrade these tests and doesn't make
any attempt at optimization or cleanup that may or may not be possible
with this upgrade.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
[AJB: tweak summary line]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/debian-hexagon-cross.docker  | 11 ++++++-----
 .../docker/dockerfiles/debian-loongarch-cross.docker  | 10 +++++-----
 tests/docker/dockerfiles/debian-toolchain.docker      |  8 +++++---
 tests/docker/dockerfiles/debian-tricore-cross.docker  |  5 ++---
 tests/docker/dockerfiles/debian-xtensa-cross.docker   |  2 +-
 5 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
index 23152b4918b..91d4b71ac95 100644
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -5,10 +5,12 @@
 # needs to be able to build QEMU itself in CI we include its
 # build-deps.
 #
-FROM docker.io/library/debian:11-slim
+FROM docker.io/library/debian:13-slim
+
+# Add deb-src repository sources
+RUN sed -i "s/^Types: deb$/Types: deb deb-src/" \
+    /etc/apt/sources.list.d/debian.sources
 
-# Duplicate deb line as deb-src
-RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
@@ -24,6 +26,7 @@ RUN apt-get update && \
         ninja-build \
         python3-pip \
         python3-setuptools \
+        python3-tomli \
         python3-venv \
         python3-wheel && \
 # Install QEMU build deps for use in CI
@@ -36,8 +39,6 @@ RUN apt-get update && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt
 
-RUN /usr/bin/pip3 install tomli
-
 ENV TOOLCHAIN_INSTALL /opt
 ENV TOOLCHAIN_RELEASE 12.Dec.2023
 ENV TOOLCHAIN_BASENAME "clang+llvm-${TOOLCHAIN_RELEASE}-cross-hexagon-unknown-linux-musl"
diff --git a/tests/docker/dockerfiles/debian-loongarch-cross.docker b/tests/docker/dockerfiles/debian-loongarch-cross.docker
index 538ab534902..55b3dbe4510 100644
--- a/tests/docker/dockerfiles/debian-loongarch-cross.docker
+++ b/tests/docker/dockerfiles/debian-loongarch-cross.docker
@@ -4,10 +4,11 @@
 # This docker target uses prebuilt toolchains for LoongArch64 from:
 # https://github.com/loongson/build-tools/releases
 #
-FROM docker.io/library/debian:11-slim
+FROM docker.io/library/debian:13-slim
 
-# Duplicate deb line as deb-src
-RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
+# Add deb-src repository sources
+RUN sed -i "s/^Types: deb$/Types: deb deb-src/" \
+    /etc/apt/sources.list.d/debian.sources
 
 RUN export DEBIAN_FRONTEND=noninteractive && \
     apt-get update && \
@@ -31,12 +32,11 @@ RUN apt-get update && \
         ninja-build \
         python3-pip \
         python3-setuptools \
+        python3-tomli \
         python3-venv \
         python3-wheel && \
         dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt
 
-RUN /usr/bin/pip3 install tomli
-
 RUN curl -#SL https://github.com/loongson/build-tools/releases/download/2023.08.08/CLFS-loongarch64-8.1-x86_64-cross-tools-gcc-glibc.tar.xz \
     | tar -xJC /opt
 
diff --git a/tests/docker/dockerfiles/debian-toolchain.docker b/tests/docker/dockerfiles/debian-toolchain.docker
index ab4ce29533d..9a256209a78 100644
--- a/tests/docker/dockerfiles/debian-toolchain.docker
+++ b/tests/docker/dockerfiles/debian-toolchain.docker
@@ -4,13 +4,15 @@
 # This dockerfile is used for building a cross-compiler toolchain.
 # The script for building the toolchain is supplied via extra-files.
 #
-FROM docker.io/library/debian:11-slim
+FROM docker.io/library/debian:13-slim
 
 # Install build utilities for building gcc and glibc.
 # ??? The build-dep isn't working, missing a number of
 # minimal build dependiencies, e.g. libmpc.
 
-RUN sed 's/^deb /deb-src /' </etc/apt/sources.list >/etc/apt/sources.list.d/deb-src.list
+# Add deb-src repository sources
+RUN sed -i "s/^Types: deb$/Types: deb deb-src/" \
+    /etc/apt/sources.list.d/debian.sources
 
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
@@ -34,7 +36,7 @@ RUN cd /root && ./build-toolchain.sh
 # Throw away the extra toolchain build deps, the downloaded source,
 # and the build trees by restoring the original image,
 # then copying the built toolchain from stage 0.
-FROM docker.io/library/debian:11-slim
+FROM docker.io/library/debian:13-slim
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index 7e00e870ceb..fd797dc7ee4 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -9,7 +9,7 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 #
-FROM docker.io/library/debian:11-slim
+FROM docker.io/library/debian:13-slim
 
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
@@ -31,12 +31,11 @@ RUN apt update && \
        pkgconf \
        python3-pip \
        python3-setuptools \
+       python3-tomli \
        python3-wheel \
        python3-venv && \
        dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt
 
-RUN /usr/bin/pip3 install tomli
-
 RUN curl -#SL https://github.com/bkoppelmann/package_940/releases/download/tricore-toolchain-9.40/tricore-toolchain-9.4.0.tar.gz \
     | tar -xzC /usr/local/
 
diff --git a/tests/docker/dockerfiles/debian-xtensa-cross.docker b/tests/docker/dockerfiles/debian-xtensa-cross.docker
index d011eee2ad3..ef63e44e2ef 100644
--- a/tests/docker/dockerfiles/debian-xtensa-cross.docker
+++ b/tests/docker/dockerfiles/debian-xtensa-cross.docker
@@ -5,7 +5,7 @@
 # using a prebuilt toolchains for Xtensa cores from:
 # https://github.com/foss-xtensa/toolchain/releases
 #
-FROM docker.io/library/debian:11-slim
+FROM docker.io/library/debian:13-slim
 
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
-- 
2.47.3


