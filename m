Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56FFCCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 10:45:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8cWB-0005BE-Pw; Tue, 14 Oct 2025 06:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v8cVN-0004WE-JU
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 06:43:45 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v8cVC-0003Xs-I1
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 06:43:44 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46f53f88e0bso29012825e9.1
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 03:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760438609; x=1761043409; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KNf+WB9/HHEpVf98t3lNdtnVbvRPlPY/srMoe1KsGrk=;
 b=vYxkpwhyStJsgyTnCCsHwsc2q1jdP5zvS8Ji24tLgUXP29kiKZLuKdDqeuIc+m1JmU
 KpxKqId55SIr/FBmK2mkYwsqJB14BFD6iFNGMyS6lhJZBg1LZj6Wp6V8yaAFf310Yy9t
 0pXCy9/GRDGFDSbgG+XTn2oLKOiFTZahHDbNdxBjeYGsUd7MrrkoiM++B6m4PDNSkGJE
 lfnIs+frqaadaavhoL1Z7ZuUriCZuyGYWYzeqrAYxLVT+xiHD7nJBQo++iRiOflPX5ty
 uTSyiVVcYUG1ZYQ8pvdg4U6zkhLTB343+kdmjXZ1me3vQnnwhSnhsUcjSaaiYH3/uyq4
 saKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760438609; x=1761043409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KNf+WB9/HHEpVf98t3lNdtnVbvRPlPY/srMoe1KsGrk=;
 b=T7H1gYGppaViayOjUbus8geEGBhGxLBpSIl5MkAj9HtNVsSd3fo1A4uJIZwV2E18Vb
 TL7KBD2Qhoc0mae0GOhv3irh8G1Oux6BTUWqq3wvMhPjptn1jFCvVYy0ycUSNexlP7/J
 +WY9yTNMq72JjJ6oBAIJjItAtCn2uJJ5jQj/A1OQgb03X4NbspNBpKhLSKgvf+xq9LaU
 Llql2j61tfQmD2JDeJRk1hBacq1J3OWf5HO2aCPd+9i89ln0wYf1Ejhv3ae+xfcC1MHH
 X8Vj3ttmFSNzAT8o07JWH8gp0I7xptZK7FYMAzJ0k79oFyLsqBE7uaByYztldYb3Lr/U
 JykQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2w/Xvr+LH6Dp3eJGTLVwKgvkDUQkvnO10aAxO7hZ9IFi7pROmtJQCX+ZgF2vk8N+JosSa6RjJOg==@nongnu.org
X-Gm-Message-State: AOJu0YzkXpVHwB4N0Ym6Fug8ifmV1pvnUaY1lWljAtdk3x4drPp68a/D
 QR6/zRKJTwn07OMAPXuwUvoPECuPU8g9OirqdUKnK4jPzquu4lYozSfDuflt7MdkIPI=
X-Gm-Gg: ASbGncskIyBjCMY2oxjFGV27X/hMYyOV4O2/GA45ARZsvF44LlLoCLqIb7+65C1OgMO
 FkmKXY9sEOmNeZEpCW9F3sYwoV06TJEXLqRftZYdrXqP7ZHe6JQstMLbLk645kdSZxdsONTurFd
 2Mfz5Zr9fV9a8nnURCMenGgsC9qZJVY+goUucj5bPBlocrtHuWlPHUUSmIbhy4eoPCfDn0FJIAj
 CKCwtSLswaOZbDlGe12ARhhyYJw6f1i0cJQlfKDeBEYgg/BDfWkZ+zni2fd+kCfoqxIwTu/tig+
 8hgN/kypc4Ci7kz9dTKSpYApIzeoCkCBCm+0TtmbykzJolhOvH/e6jMipltYDWlnz9/74/lZQy1
 oBZaRaVHvKCxlNo3U8eyh11LuVZm72//9mCxz+g4KiF7Z1+iQbyamwgbU
X-Google-Smtp-Source: AGHT+IE5oziyVLzMIkHDhEJ8wnG4fD4sgI+5JeehZ5XWbQwN1z03PE5wfCSOix15Sslw5ge5i5kl4w==
X-Received: by 2002:a05:600c:8b54:b0:46f:d897:516f with SMTP id
 5b1f17b1804b1-46fd89758e7mr18901755e9.34.1760438608426; 
 Tue, 14 Oct 2025 03:43:28 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb497b8fcsm234993105e9.2.2025.10.14.03.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 03:43:25 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C97A45F871;
 Tue, 14 Oct 2025 11:43:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-s390x@nongnu.org
Subject: [PATCH 4/5] scripts/setup: update the armhf overlay
Date: Tue, 14 Oct 2025 11:43:21 +0100
Message-ID: <20251014104323.3023714-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251014104323.3023714-1-alex.bennee@linaro.org>
References: <20251014104323.3023714-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

We certainly didn't generate the armhf list via lcitool as it couldn't
deal with ubuntu or foreign layers. Now we can properly generate the
list.

Fixes: 1417704564a (tests/lcitool: generate package lists for ansible)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 ...armhf-cross.yml => ubuntu-2404-armhf.yaml} | 65 +++----------------
 tests/lcitool/refresh                         | 11 ++++
 2 files changed, 20 insertions(+), 56 deletions(-)
 rename scripts/ci/setup/ubuntu/{ubuntu-2204-armhf-cross.yml => ubuntu-2404-armhf.yaml} (65%)

diff --git a/scripts/ci/setup/ubuntu/ubuntu-2204-armhf-cross.yml b/scripts/ci/setup/ubuntu/ubuntu-2404-armhf.yaml
similarity index 65%
rename from scripts/ci/setup/ubuntu/ubuntu-2204-armhf-cross.yml
rename to scripts/ci/setup/ubuntu/ubuntu-2404-armhf.yaml
index 0cc34cd10b9..f06f95514bd 100644
--- a/scripts/ci/setup/ubuntu/ubuntu-2204-armhf-cross.yml
+++ b/scripts/ci/setup/ubuntu/ubuntu-2404-armhf.yaml
@@ -1,64 +1,13 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool variables --cross-arch armv7l ubuntu-2204 qemu
+#  $ lcitool variables --host-arch aarch64 --cross-arch armv7l ubuntu-2404 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
 packages:
-  - bash
-  - bc
-  - bison
-  - bsdextrautils
-  - bzip2
-  - ca-certificates
-  - ccache
-  - dbus
-  - debianutils
-  - diffutils
-  - exuberant-ctags
-  - findutils
-  - flex
-  - gcc
-  - gcovr
-  - gettext
-  - git
-  - hostname
-  - libglib2.0-dev
-  - libpcre2-dev
-  - libsndio-dev
-  - libspice-protocol-dev
-  - llvm
-  - locales
-  - make
-  - meson
-  - mtools
-  - ncat
-  - ninja-build
-  - openssh-client
-  - pkgconf
-  - python3
-  - python3-numpy
-  - python3-opencv
-  - python3-pillow
-  - python3-pip
-  - python3-sphinx
-  - python3-sphinx-rtd-theme
-  - python3-tomli
-  - python3-venv
-  - python3-yaml
-  - rpm2cpio
-  - sed
-  - socat
-  - sparse
-  - swtpm
-  - tar
-  - tesseract-ocr
-  - tesseract-ocr-eng
-  - xorriso
-  - zstd
   - gcc-arm-linux-gnueabihf
   - libaio-dev:armhf
-  - libasan6:armhf
+  - libasan8:armhf
   - libasound2-dev:armhf
   - libattr1-dev:armhf
   - libbpf-dev:armhf
@@ -68,6 +17,7 @@ packages:
   - libcacard-dev:armhf
   - libcap-ng-dev:armhf
   - libcapstone-dev:armhf
+  - libcbor-dev:armhf
   - libcmocka-dev:armhf
   - libcurl4-gnutls-dev:armhf
   - libdaxctl-dev:armhf
@@ -82,7 +32,7 @@ packages:
   - libglusterfs-dev:armhf
   - libgnutls28-dev:armhf
   - libgtk-3-dev:armhf
-  - libibumad-dev:armhf
+  - libgtk-vnc-2.0-dev:armhf
   - libibverbs-dev:armhf
   - libiscsi-dev:armhf
   - libjemalloc-dev:armhf
@@ -94,11 +44,11 @@ packages:
   - libnfs-dev:armhf
   - libnuma-dev:armhf
   - libpam0g-dev:armhf
+  - libpcre2-dev:armhf
   - libpipewire-0.3-dev:armhf
   - libpixman-1-dev:armhf
   - libpng-dev:armhf
   - libpulse-dev:armhf
-  - librbd-dev:armhf
   - librdmacm-dev:armhf
   - libsasl2-dev:armhf
   - libsdl2-dev:armhf
@@ -107,8 +57,11 @@ packages:
   - libselinux1-dev:armhf
   - libslirp-dev:armhf
   - libsnappy-dev:armhf
+  - libsndio-dev:armhf
+  - libspice-protocol-dev:armhf
   - libspice-server-dev:armhf
   - libssh-dev:armhf
+  - libstd-rust-dev:armhf
   - libsystemd-dev:armhf
   - libtasn1-6-dev:armhf
   - libubsan1:armhf
@@ -119,7 +72,7 @@ packages:
   - libvdeplug-dev:armhf
   - libvirglrenderer-dev:armhf
   - libvte-2.91-dev:armhf
-  - libxen-dev:armhf
+  - libxdp-dev:armhf
   - libzstd-dev:armhf
   - nettle-dev:armhf
   - systemtap-sdt-dev:armhf
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 056cfb6e9d7..8ad45da19c1 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -99,6 +99,16 @@ def generate_yaml(os, target, arch, trailer=None):
                          arch, target, "qemu"]
     generate(filename, cmd, trailer)
 
+# an overlay file only cares about the additional packages for cross
+# so we can skip all the host packages needed.
+def generate_cross_overlay_yaml(os, target, arch, name, cross, trailer=None):
+    filename = Path(src_dir, "scripts", "ci", "setup", os, f"{target}-{name}.yaml")
+    cmd = lcitool_cmd + ["variables", "--format", "yaml",
+                         "--layer", "foreign",
+                         "-a", arch, "--cross", cross,
+                         target, "qemu"]
+    generate(filename, cmd, trailer)
+
 
 alpine_extras = [
     "# https://gitlab.alpinelinux.org/alpine/aports/-/issues/17463\n",
@@ -271,6 +281,7 @@ try:
     # Ansible package lists
     #
     generate_yaml("ubuntu", "ubuntu-2404", "aarch64")
+    generate_cross_overlay_yaml("ubuntu", "ubuntu-2404", "aarch64", "armhf", cross="armv7l")
     generate_yaml("ubuntu", "ubuntu-2404", "s390x")
 
 
-- 
2.47.3


