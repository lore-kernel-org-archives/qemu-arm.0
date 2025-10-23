Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7922CCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 12:13:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBuAy-0001w5-Vz; Thu, 23 Oct 2025 08:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vBu8u-0008PS-0z
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:10:12 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vBu8p-0005GC-3Y
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:10:07 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so168715066b.3
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 05:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761221401; x=1761826201; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XeRSVxV/a/+cXLwVgc+XC0DpKFA3aVxT1tt4Uj60OQ8=;
 b=oaWqFXh0jjGzHNcBHkPn1ywvukD0bpOqedrtFqmWlEqCVM6MLr8oUP5/8c+INsiP+7
 BcuWJMXyvb5/JvSn6zPAQcK4rFWYk63ADwC5V/g3gNV3RXiMY1ehDRxJlNRg6FsGaIUZ
 y4u3GrGCMAC1zu6xtfK8cEtN5TkoA70ieQ3WVB7C+B3dqLzebIuNWCTL7s0Y9Qg1P9aS
 Mvzqg7fVOtW8tHfZswh3UUCgiErVZ7967iGJSnUPIZTJkUlgGEToPC0EOulP23YnxwX1
 ve1MgDGwKuUCVukvmwg7/GQhdUV1bejj3yMGAnfU/lxVYtQ+fREKStspz0ZlOlW6ldwv
 x1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221401; x=1761826201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XeRSVxV/a/+cXLwVgc+XC0DpKFA3aVxT1tt4Uj60OQ8=;
 b=kw1msg34I42XQ+2Ux7BclJDzInC0IrL3BJWsSZxMAqyfpZWjiAU5XOeftUe715Qz8u
 +2qbaS1xLq4YpgRjfpMRMWzyaM/+Mig4C3TiUqBNv5X1OHbo/GgdG0IoIY6sfkpEPNIW
 xp8SyYrLaWYW4cY4BuT/iIpz8Y30QtLO5CRien3N7cPmBwU/QMcW3w26I6qds/AdEO2G
 FdKr5PSsiKK5kfbG10xz0ZUF6Tx8MW40jvsPpMoSKqJ0pd+UVXmsyFxpBh0aHcEelA88
 vtySs+JoorgAXt+I8xKPxT5XIpMTaGnHtFn0QeCkhnUmoP6HGxNLLQeQ448Gm+ZO53eF
 J1KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrS1qZIs2oigwJCmnLKvUS0WsJFLA1/cvANBj4hKdhPwhKPXTn9wjiZQWOSJuWAEfHP8VDfxT7fw==@nongnu.org
X-Gm-Message-State: AOJu0Yys3MbszRmrFtACrme044uPCfqVucPgAT/Ao5KofRiNFEFvY3GI
 et51j5fq9izSAf7P1CG57P60odHwVKmPnYUOXL5ChwnP57QX2hb+/dF8vfUDfQBGaqERFuq4sOB
 XYyJtsTo=
X-Gm-Gg: ASbGnctwewXeECR6+neqNYAd1NnHTorwkaLPyL5sluF/w0YcsHhZbc/v2wfiDDf9alM
 OkLaSSlzSwzN4LCaaXzqHRzyBeQrHL8AT8r5ToW0a+WjDuGXGfg5DVRKSnm0/O+wTr6vHYM+J06
 iJPUyDsHH4+dYrO8IpwOylHyUePI3lDsI9+1FLtaY/gyk37TZ3nCsjfE5JlJcbECb15riR1AILp
 pquXPoaxsSQ+/dVIhdQuj87aXRV7MCypejRn2PVij0rk7Ib1lQ82qxkHDmUsnnC08kbC5qK/mLu
 bFb8Q/3RqMsqcVNUgJNLReucVSyXEHX6IG+U9faLQcdE+05i14u/FJNKpKP8sAo52ju1psHHa48
 5QN2RLb8QqfSRk2vhPdmh7YIjNhqkC5B2weQjn4qmO/rK3I4h8Nw7GJqg1X7FwK662gJfr0vQMt
 rw6QodEgjclcTepS2LDhAolw==
X-Google-Smtp-Source: AGHT+IHZCxVpJwlukkjSTh2uVYwdaaq1p1nhcqx4BFINy0OrXtF1xYM+TWFpm5jk3Fbzs+PSw14XIA==
X-Received: by 2002:a17:906:c107:b0:b3e:babd:f257 with SMTP id
 a640c23a62f3a-b647403a530mr2862452066b.10.1761221400615; 
 Thu, 23 Oct 2025 05:10:00 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d55beeda4sm151363366b.47.2025.10.23.05.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:09:58 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 43C5860F4A;
 Thu, 23 Oct 2025 13:09:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 5/7] tests/lcitool: generate a yaml file for the ppc64le runner
Date: Thu, 23 Oct 2025 13:09:51 +0100
Message-ID: <20251023120953.2905297-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251023120953.2905297-1-alex.bennee@linaro.org>
References: <20251023120953.2905297-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Unlike the Aarch64 runners this comes with pure Debian out of the box.
We need a minor tweak to build-environment to deal with the
differences in naming convention.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/setup/build-environment.yml        |  10 +-
 .../ci/setup/debian/debian-13-ppc64le.yaml    | 134 ++++++++++++++++++
 tests/lcitool/refresh                         |   1 +
 3 files changed, 143 insertions(+), 2 deletions(-)
 create mode 100644 scripts/ci/setup/debian/debian-13-ppc64le.yaml

diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 253d0b759bc..528150dce78 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -27,20 +27,26 @@
         - ansible_facts['distribution'] in ['Ubuntu', 'Debian']
 
     # the package lists are updated by "make lcitool-refresh"
-    - name: Define package list file path
+    - name: Define package list file path for Ubuntu
       set_fact:
         package_file: "ubuntu/ubuntu-2404-{{ ansible_facts['architecture'] }}.yaml"
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['distribution_version'] == '24.04'
 
+    - name: Define package list file path for Debian
+      set_fact:
+        package_file: "debian/debian-{{ ansible_facts['distribution_major_version'] }}-{{ ansible_facts['architecture'] }}.yaml"
+      when:
+        - ansible_facts['distribution'] == 'Debian'
+
     - name: Include package lists based on OS and architecture
       include_vars:
         file: "{{ package_file }}"
       when:
         - package_file is exists
 
-    - name: Install packages for QEMU on Ubuntu 24.04
+    - name: Install packages for QEMU on Ubuntu/Debian
       package:
         name: "{{ packages }}"
       when:
diff --git a/scripts/ci/setup/debian/debian-13-ppc64le.yaml b/scripts/ci/setup/debian/debian-13-ppc64le.yaml
new file mode 100644
index 00000000000..e29c9c18403
--- /dev/null
+++ b/scripts/ci/setup/debian/debian-13-ppc64le.yaml
@@ -0,0 +1,134 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool variables --host-arch ppc64le debian-13 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+packages:
+  - bash
+  - bc
+  - bindgen
+  - bison
+  - bsdextrautils
+  - bzip2
+  - ca-certificates
+  - ccache
+  - clang
+  - dbus
+  - debianutils
+  - diffutils
+  - exuberant-ctags
+  - findutils
+  - flex
+  - gcc
+  - gcovr
+  - gettext
+  - git
+  - hostname
+  - libaio-dev
+  - libasan8
+  - libasound2-dev
+  - libattr1-dev
+  - libbpf-dev
+  - libbrlapi-dev
+  - libbz2-dev
+  - libc6-dev
+  - libcacard-dev
+  - libcap-ng-dev
+  - libcapstone-dev
+  - libcbor-dev
+  - libclang-rt-dev
+  - libcmocka-dev
+  - libcurl4-gnutls-dev
+  - libdaxctl-dev
+  - libdrm-dev
+  - libepoxy-dev
+  - libfdt-dev
+  - libffi-dev
+  - libfuse3-dev
+  - libgbm-dev
+  - libgcrypt20-dev
+  - libglib2.0-dev
+  - libglusterfs-dev
+  - libgnutls28-dev
+  - libgtk-3-dev
+  - libgtk-vnc-2.0-dev
+  - libibverbs-dev
+  - libiscsi-dev
+  - libjemalloc-dev
+  - libjpeg62-turbo-dev
+  - libjson-c-dev
+  - liblttng-ust-dev
+  - liblzo2-dev
+  - libncursesw5-dev
+  - libnfs-dev
+  - libnuma-dev
+  - libpam0g-dev
+  - libpcre2-dev
+  - libpipewire-0.3-dev
+  - libpixman-1-dev
+  - libpng-dev
+  - libpulse-dev
+  - librbd-dev
+  - librdmacm-dev
+  - libsasl2-dev
+  - libsdl2-dev
+  - libsdl2-image-dev
+  - libseccomp-dev
+  - libselinux1-dev
+  - libslirp-dev
+  - libsnappy-dev
+  - libsndio-dev
+  - libspice-protocol-dev
+  - libspice-server-dev
+  - libssh-dev
+  - libstd-rust-dev
+  - libsystemd-dev
+  - libtasn1-6-dev
+  - libubsan1
+  - libudev-dev
+  - liburing-dev
+  - libusb-1.0-0-dev
+  - libusbredirhost-dev
+  - libvdeplug-dev
+  - libvirglrenderer-dev
+  - libvte-2.91-dev
+  - libxdp-dev
+  - libzstd-dev
+  - llvm
+  - locales
+  - make
+  - mtools
+  - multipath-tools
+  - ncat
+  - nettle-dev
+  - ninja-build
+  - openssh-client
+  - pkgconf
+  - python3
+  - python3-numpy
+  - python3-opencv
+  - python3-pillow
+  - python3-pip
+  - python3-setuptools
+  - python3-sphinx
+  - python3-sphinx-rtd-theme
+  - python3-tomli
+  - python3-venv
+  - python3-wheel
+  - python3-yaml
+  - rpm2cpio
+  - rustc
+  - sed
+  - socat
+  - sparse
+  - swtpm
+  - systemtap-sdt-dev
+  - tar
+  - tesseract-ocr
+  - tesseract-ocr-eng
+  - vulkan-tools
+  - xorriso
+  - zlib1g-dev
+  - zstd
+
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 056cfb6e9d7..7fbdf6f340b 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -272,6 +272,7 @@ try:
     #
     generate_yaml("ubuntu", "ubuntu-2404", "aarch64")
     generate_yaml("ubuntu", "ubuntu-2404", "s390x")
+    generate_yaml("debian", "debian-13", "ppc64le")
 
 
     sys.exit(0)
-- 
2.47.3


