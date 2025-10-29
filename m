Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E21BCCF9F3
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 08:18:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vE1NI-0002Rd-D2; Wed, 29 Oct 2025 04:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vE1Ml-0002Nm-Pn
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 04:17:15 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vE1Mb-0005T9-3z
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 04:17:10 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-475dd559a83so24494695e9.1
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 01:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761725816; x=1762330616; darn=nongnu.org;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YxQRC4UrmMOgqQYvgIteCmpj9E+7gKkG8cgAX3dkD+8=;
 b=MSjzrdEgeqqG0pxHTpc1tUlulCC0L+ngNl9L4B6N1Onxur0byL1pOlbV6zhlf2x1DS
 LdhVkkrp4AQmOQM1cHaukZ3dHl1O/SmLVla2GNQBjf48pkFWb499Pg0CTP2+9fQ14nu5
 ox7qsLyriBbuAlqnKfgaEUePMSYF0xPwIpXWe5/9ckSAAzYT/Sl8QBx5v03kS8UHPQzM
 D3b9SgMCiwVOp8fRTa4SCHjQs0auip/xtrsGdQqJJGhqFchgU+R0OZ7PNrqRhLbwbLP7
 nm9yISjd+bkOCTBPQzc/3rKi7u4pMm6HGRjd3MTYAyfkckXW/zavb6KWRo+7E8j5R1td
 7BOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761725816; x=1762330616;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YxQRC4UrmMOgqQYvgIteCmpj9E+7gKkG8cgAX3dkD+8=;
 b=wsgLye+0yR1GMMCYBwoeuTYZsZbLCUP1h9rD7ccHHfHVJOBi5oSmsVJAiP/g08C7jJ
 gyLzbtg5WGDLV7fAhhrCUtWzjAg+Hm+oU4mdpeAilh1uq6kuPPjAUa5Fcl4pysFkdooq
 bQlOx9BhpeGGB3ceJghN3SSwRSDyEzmvcqaF+GaKTmYoMzX8s8rxYEri2Q3Iktc8aggs
 PvgxcIzkhKZ1ZO9iwtCRofP9M4fiEaFy1Uez8irdGV6pf6Xi5G4GYz4ub9SJrsfQt2Ou
 uqv15P1jnpbAJMjT9c6B4kCQlc3uqF5OHysBagMUGUAWDFBdnOin9kGznmu5rq+CiFVn
 sBZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEyfQArQfzQ0Se7FyBPM9gpAmpO2M+WMGnVZReJpvaGS6SXTLpkF05BSLyjOXyxoS9xrsM3nfxiA==@nongnu.org
X-Gm-Message-State: AOJu0YxEce0rKBCXUW+yaLkrj66rrROI8bfWPcyU37CmQdSOdIbV3fnt
 SiFfexZzhZ9TeCNGix9T5Beha2VctjaUkG3AKwb6K5lGkp77RpLHXe9iu43rgu957Po=
X-Gm-Gg: ASbGncs1W8ZUt6zSiMAje/WHIeeHdxQhyXIeIdZMJWHyR2WruVP38poRcpOVMRaLkWS
 wTKAOkzOxjLKsM7nMpX4r4wnqYA99WaehAzHw2mKc3T8nIkbIDfZd17PMgdB1MKyCXdF+3IHGqb
 lWYPMGd3/pmw0YKGIXIcjKSCpkKHwHN1V/tMpACyzpJF9+DSQzZCwKjAHpJamUXVdZciwtu9URC
 lSeGuO5viDl4cD0R395MVc7ujU1Cdl9ypBir0pwjjKUti8nj1wMUEFA/R1MQI+gv80lrJyRYp8A
 NDrJ+n7qFfwchHsUcaBOSndkMPqKNRBPGbpURA3sAz/ew+OAfOZX6HrDS4SX/mi/JJxxzlXbOg4
 TOBdsWrme1TF+MoBecinRG8NtftvTVgboewgnzQcMPK1U6ckaI2pYRrHl8jSdIyzdh8hR014EZY
 lPlNg3FKOM+t3MsybZyH+peecyp9Eut/98Tv6nbceYavjX1LWa
X-Google-Smtp-Source: AGHT+IFlDrSi4rn7Ftsb0G+wmoOP6fTxQAO0wwjl+SzJSDE8rDAL45qear5Vd+eD5ECiZ8NDtmiSiw==
X-Received: by 2002:a05:600c:608b:b0:475:de12:d3b2 with SMTP id
 5b1f17b1804b1-4771e1f1dc2mr19314655e9.36.1761725815406; 
 Wed, 29 Oct 2025 01:16:55 -0700 (PDT)
Received: from meli-email.org (athedsl-4440624.home.otenet.gr. [79.129.178.32])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e202182sm40171705e9.10.2025.10.29.01.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 01:16:55 -0700 (PDT)
Date: Wed, 29 Oct 2025 10:14:37 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Alex Benn=?UTF-8?B?w6k=?=e <alex.bennee@linaro.org>
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 qemu-ppc@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9_?= <philmd@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org, 
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: Re: [PATCH 05/35] tests/lcitool: generate a yaml file for the ppc64le
 runner
User-Agent: meli/0.8.12
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
 <20251027110344.2289945-6-alex.bennee@linaro.org>
In-Reply-To: <20251027110344.2289945-6-alex.bennee@linaro.org>
Message-ID: <t4vwc6.2u78l7gx232vv@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.737,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, 27 Oct 2025 13:03, Alex Bennée <alex.bennee@linaro.org> wrote:
>Unlike the Aarch64 runners this comes with pure Debian out of the box.
>We need a minor tweak to build-environment to deal with the
>differences in naming convention.
>
>Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

> scripts/ci/setup/build-environment.yml        |  10 +-
> .../ci/setup/debian/debian-13-ppc64le.yaml    | 134 ++++++++++++++++++
> tests/lcitool/refresh                         |   1 +
> 3 files changed, 143 insertions(+), 2 deletions(-)
> create mode 100644 scripts/ci/setup/debian/debian-13-ppc64le.yaml
>
>diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
>index 253d0b759bc..528150dce78 100644
>--- a/scripts/ci/setup/build-environment.yml
>+++ b/scripts/ci/setup/build-environment.yml
>@@ -27,20 +27,26 @@
>         - ansible_facts['distribution'] in ['Ubuntu', 'Debian']
> 
>     # the package lists are updated by "make lcitool-refresh"
>-    - name: Define package list file path
>+    - name: Define package list file path for Ubuntu
>       set_fact:
>         package_file: "ubuntu/ubuntu-2404-{{ ansible_facts['architecture'] }}.yaml"
>       when:
>         - ansible_facts['distribution'] == 'Ubuntu'
>         - ansible_facts['distribution_version'] == '24.04'
> 
>+    - name: Define package list file path for Debian
>+      set_fact:
>+        package_file: "debian/debian-{{ ansible_facts['distribution_major_version'] }}-{{ ansible_facts['architecture'] }}.yaml"
>+      when:
>+        - ansible_facts['distribution'] == 'Debian'
>+
>     - name: Include package lists based on OS and architecture
>       include_vars:
>         file: "{{ package_file }}"
>       when:
>         - package_file is exists
> 
>-    - name: Install packages for QEMU on Ubuntu 24.04
>+    - name: Install packages for QEMU on Ubuntu/Debian
>       package:
>         name: "{{ packages }}"
>       when:
>diff --git a/scripts/ci/setup/debian/debian-13-ppc64le.yaml b/scripts/ci/setup/debian/debian-13-ppc64le.yaml
>new file mode 100644
>index 00000000000..e29c9c18403
>--- /dev/null
>+++ b/scripts/ci/setup/debian/debian-13-ppc64le.yaml
>@@ -0,0 +1,134 @@
>+# THIS FILE WAS AUTO-GENERATED
>+#
>+#  $ lcitool variables --host-arch ppc64le debian-13 qemu
>+#
>+# https://gitlab.com/libvirt/libvirt-ci
>+
>+packages:
>+  - bash
>+  - bc
>+  - bindgen
>+  - bison
>+  - bsdextrautils
>+  - bzip2
>+  - ca-certificates
>+  - ccache
>+  - clang
>+  - dbus
>+  - debianutils
>+  - diffutils
>+  - exuberant-ctags
>+  - findutils
>+  - flex
>+  - gcc
>+  - gcovr
>+  - gettext
>+  - git
>+  - hostname
>+  - libaio-dev
>+  - libasan8
>+  - libasound2-dev
>+  - libattr1-dev
>+  - libbpf-dev
>+  - libbrlapi-dev
>+  - libbz2-dev
>+  - libc6-dev
>+  - libcacard-dev
>+  - libcap-ng-dev
>+  - libcapstone-dev
>+  - libcbor-dev
>+  - libclang-rt-dev
>+  - libcmocka-dev
>+  - libcurl4-gnutls-dev
>+  - libdaxctl-dev
>+  - libdrm-dev
>+  - libepoxy-dev
>+  - libfdt-dev
>+  - libffi-dev
>+  - libfuse3-dev
>+  - libgbm-dev
>+  - libgcrypt20-dev
>+  - libglib2.0-dev
>+  - libglusterfs-dev
>+  - libgnutls28-dev
>+  - libgtk-3-dev
>+  - libgtk-vnc-2.0-dev
>+  - libibverbs-dev
>+  - libiscsi-dev
>+  - libjemalloc-dev
>+  - libjpeg62-turbo-dev
>+  - libjson-c-dev
>+  - liblttng-ust-dev
>+  - liblzo2-dev
>+  - libncursesw5-dev
>+  - libnfs-dev
>+  - libnuma-dev
>+  - libpam0g-dev
>+  - libpcre2-dev
>+  - libpipewire-0.3-dev
>+  - libpixman-1-dev
>+  - libpng-dev
>+  - libpulse-dev
>+  - librbd-dev
>+  - librdmacm-dev
>+  - libsasl2-dev
>+  - libsdl2-dev
>+  - libsdl2-image-dev
>+  - libseccomp-dev
>+  - libselinux1-dev
>+  - libslirp-dev
>+  - libsnappy-dev
>+  - libsndio-dev
>+  - libspice-protocol-dev
>+  - libspice-server-dev
>+  - libssh-dev
>+  - libstd-rust-dev
>+  - libsystemd-dev
>+  - libtasn1-6-dev
>+  - libubsan1
>+  - libudev-dev
>+  - liburing-dev
>+  - libusb-1.0-0-dev
>+  - libusbredirhost-dev
>+  - libvdeplug-dev
>+  - libvirglrenderer-dev
>+  - libvte-2.91-dev
>+  - libxdp-dev
>+  - libzstd-dev
>+  - llvm
>+  - locales
>+  - make
>+  - mtools
>+  - multipath-tools
>+  - ncat
>+  - nettle-dev
>+  - ninja-build
>+  - openssh-client
>+  - pkgconf
>+  - python3
>+  - python3-numpy
>+  - python3-opencv
>+  - python3-pillow
>+  - python3-pip
>+  - python3-setuptools
>+  - python3-sphinx
>+  - python3-sphinx-rtd-theme
>+  - python3-tomli
>+  - python3-venv
>+  - python3-wheel
>+  - python3-yaml
>+  - rpm2cpio
>+  - rustc
>+  - sed
>+  - socat
>+  - sparse
>+  - swtpm
>+  - systemtap-sdt-dev
>+  - tar
>+  - tesseract-ocr
>+  - tesseract-ocr-eng
>+  - vulkan-tools
>+  - xorriso
>+  - zlib1g-dev
>+  - zstd
>+
>diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
>index 056cfb6e9d7..7fbdf6f340b 100755
>--- a/tests/lcitool/refresh
>+++ b/tests/lcitool/refresh
>@@ -272,6 +272,7 @@ try:
>     #
>     generate_yaml("ubuntu", "ubuntu-2404", "aarch64")
>     generate_yaml("ubuntu", "ubuntu-2404", "s390x")
>+    generate_yaml("debian", "debian-13", "ppc64le")
> 
> 
>     sys.exit(0)
>-- 
>2.47.3
>
>

