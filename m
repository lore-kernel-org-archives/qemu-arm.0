Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp458754lfq;
        Thu, 7 Jan 2021 09:07:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGfEdCmrAEcPJrIKUHu3YAOi1Ie6cKnIejEqTYwNrySpU1C5gFLYjRIFWw2IK1wtw9YDSm
X-Received: by 2002:a65:6659:: with SMTP id z25mr2784893pgv.427.1610039247410;
        Thu, 07 Jan 2021 09:07:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610039247; cv=none;
        d=google.com; s=arc-20160816;
        b=gS9Ws0xXFGeA0Vqa66+YP6TnI/ZIEmRRgrqqoa19tSVo4lD631eQ/jmj49F93caGkD
         SZsJN2unTe0vRDfSq33Fz6/bgOx7iBiTm0xvq13zLRDFEqNFVKjnfjvpSOVeW9c26IRq
         Rppc6bsjt5Mla6DnvAaFaLoCmMIpBBijMmInPLOyh8dccJbloTmlg9kk6wWNcIYYNHya
         aVyqJe/1r5aMDDYYbBiWqWxedotC0jMBsXuqXqsD3duf6BoubPEukSHG5u3JCM0/W0Hf
         7+0jdgikJTsmzNVFEYpwpGjI46lQGP8jmpJDswCYrVKk8WJnqeJHLHYJEafxJ+/hFJIz
         hA3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=398l0x21T+PtqYtoxm70wTw/e5KoUOApOdRwwRfgpCI=;
        b=TAVflFleESp9oKhD1/NZ6Wrnbr8aR6lvOLMt2JTyeQWvDzRsEpkZNh6mzdIMsSESz/
         TzxNsd6PBU0AM1cADw+mBBg0PUWPT3aD1tAzmLBu+C2aVi+CGj068qCOmhM5j+bsAz/L
         j9rJ405ockkowifkbgA2Xs/56k52EHreW3yYBfupMSDVkEQEwncH3OqA6c7FDLYXCI7c
         Gqw2cQIRBd/ouYdglp4wzoQDNajckq1RPwCTiV+8L5/Mcsob99riHzfFe8CC24cVbXLa
         ntBdn01BZJSDpM2vGQ1qJw9c/9bDRlFiK9uO37C3fMn9RSBNwuRs8fUtHuZeqxmYn1NN
         t/Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=KyOwmarE;
       spf=pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@vr.keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@vr.keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id c11si6458772pgj.320.2021.01.07.09.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 09:07:27 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=KyOwmarE;
       spf=pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@vr.keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id CD0D83F2E3BD;
	Thu,  7 Jan 2021 09:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1610039245; bh=YnhUQZaG9di3JTUB6ONQsQkxSeXtwlkHPePjWsx+onM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KyOwmarEUyaMuxwJVRUOqjGHC5o0n42ZE6ZQk7wgZv5VnR2uf0zkDsgRnyaHxMfXH
	 G1LqhuQ9MiOEDN/di17YKrXphm7EhSH/ihkQdSUEw1DBYT7FGUPvE2zhjvZoZx9Gze
	 QNhVhJKaAsTwAjRx8jzNp/pyi6RRGUadfd7ZfDOgy/IuznQBX39c5vuF0ocE2AcOqJ
	 ThnwTBlzVXkdURZ/xxUpDHeG7uRXVQ4jkgsHeUp9nQfDN5JIIFdHJIMtZHlbERk411
	 UJqwEtBjG2PFJSe4I57e0AeAkwitDgMnq5SgocuHzDQECdN/ZkmYRooXo531V1XkTC
	 2k3LFfx1QGP+g==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VcT8lqcTjnrJ; Thu,  7 Jan 2021 09:07:24 -0800 (PST)
Received: from vr.keithp.com (vr.keithp.com [10.0.0.39])
	by elaine.keithp.com (Postfix) with ESMTP id E0E2D3F2E315;
	Thu,  7 Jan 2021 09:07:23 -0800 (PST)
Received: by vr.keithp.com (Postfix, from userid 1000)
	id 8C44F742C69; Thu,  7 Jan 2021 09:07:23 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Keith Packard <keithp@keithp.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 1/9] semihosting: Move ARM semihosting code to shared directories
Date: Thu,  7 Jan 2021 09:07:09 -0800
Message-Id: <20210107170717.2098982-2-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107170717.2098982-1-keithp@keithp.com>
References: <20210107170717.2098982-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: R1NxlQ50/OZG

This commit renames two files which provide ARM semihosting support so
that they can be shared by other architectures:

 1. target/arm/arm-semi.c     -> hw/semihosting/common-semi.c
 2. linux-user/arm/semihost.c -> linux-user/semihost.c

The build system was modified use a new config variable,
CONFIG_ARM_COMPATIBLE_SEMIHOSTING, which has been added to the ARM
softmmu and linux-user default configs. The contents of the source
files has not been changed in this patch.

Signed-off-by: Keith Packard <keithp@keithp.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

----

v2
	Place common-semi.c name in arm_ss, just as arm-semi.c was

v3
	Create CONFIG_ARM_COMPATIBLE_SEMIHOSTING and assign in
	arm config files

v4
	Also update aarch64_be default config

v5
	Also update armeb default config
---
 default-configs/devices/arm-softmmu.mak               | 1 +
 default-configs/targets/aarch64-linux-user.mak        | 1 +
 default-configs/targets/aarch64_be-linux-user.mak     | 1 +
 default-configs/targets/arm-linux-user.mak            | 1 +
 default-configs/targets/armeb-linux-user.mak          | 1 +
 hw/semihosting/Kconfig                                | 3 +++
 target/arm/arm-semi.c => hw/semihosting/common-semi.c | 0
 hw/semihosting/meson.build                            | 3 +++
 linux-user/arm/meson.build                            | 3 ---
 linux-user/meson.build                                | 1 +
 linux-user/{arm => }/semihost.c                       | 0
 target/arm/meson.build                                | 2 --
 12 files changed, 12 insertions(+), 5 deletions(-)
 rename target/arm/arm-semi.c => hw/semihosting/common-semi.c (100%)
 rename linux-user/{arm => }/semihost.c (100%)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 08a32123b4..0500156a0c 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -42,4 +42,5 @@ CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
 CONFIG_SEMIHOSTING=y
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 CONFIG_ALLWINNER_H3=y
diff --git a/default-configs/targets/aarch64-linux-user.mak b/default-configs/targets/aarch64-linux-user.mak
index 163c9209f4..4713253709 100644
--- a/default-configs/targets/aarch64-linux-user.mak
+++ b/default-configs/targets/aarch64-linux-user.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=aarch64
 TARGET_BASE_ARCH=arm
 TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
 TARGET_HAS_BFLT=y
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/default-configs/targets/aarch64_be-linux-user.mak b/default-configs/targets/aarch64_be-linux-user.mak
index 4c953cf8c5..fae831558d 100644
--- a/default-configs/targets/aarch64_be-linux-user.mak
+++ b/default-configs/targets/aarch64_be-linux-user.mak
@@ -3,3 +3,4 @@ TARGET_BASE_ARCH=arm
 TARGET_WORDS_BIGENDIAN=y
 TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
 TARGET_HAS_BFLT=y
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/default-configs/targets/arm-linux-user.mak b/default-configs/targets/arm-linux-user.mak
index c7cd872e86..e741ffd4d3 100644
--- a/default-configs/targets/arm-linux-user.mak
+++ b/default-configs/targets/arm-linux-user.mak
@@ -3,3 +3,4 @@ TARGET_SYSTBL_ABI=common,oabi
 TARGET_SYSTBL=syscall.tbl
 TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
 TARGET_HAS_BFLT=y
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/default-configs/targets/armeb-linux-user.mak b/default-configs/targets/armeb-linux-user.mak
index 79bf10e99b..255e44e8b0 100644
--- a/default-configs/targets/armeb-linux-user.mak
+++ b/default-configs/targets/armeb-linux-user.mak
@@ -4,3 +4,4 @@ TARGET_SYSTBL=syscall.tbl
 TARGET_WORDS_BIGENDIAN=y
 TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
 TARGET_HAS_BFLT=y
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/hw/semihosting/Kconfig b/hw/semihosting/Kconfig
index efe0a30734..4c30dc6b16 100644
--- a/hw/semihosting/Kconfig
+++ b/hw/semihosting/Kconfig
@@ -1,3 +1,6 @@
 
 config SEMIHOSTING
        bool
+
+config ARM_COMPATIBLE_SEMIHOSTING
+       bool
diff --git a/target/arm/arm-semi.c b/hw/semihosting/common-semi.c
similarity index 100%
rename from target/arm/arm-semi.c
rename to hw/semihosting/common-semi.c
diff --git a/hw/semihosting/meson.build b/hw/semihosting/meson.build
index f40ac574c4..5b4a170270 100644
--- a/hw/semihosting/meson.build
+++ b/hw/semihosting/meson.build
@@ -2,3 +2,6 @@ specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
   'config.c',
   'console.c',
 ))
+
+specific_ss.add(when: ['CONFIG_ARM_COMPATIBLE_SEMIHOSTING'],
+		if_true: files('common-semi.c'))
diff --git a/linux-user/arm/meson.build b/linux-user/arm/meson.build
index 432984b58e..5a93c925cf 100644
--- a/linux-user/arm/meson.build
+++ b/linux-user/arm/meson.build
@@ -1,6 +1,3 @@
-linux_user_ss.add(when: 'TARGET_AARCH64', if_true: files('semihost.c'))
-linux_user_ss.add(when: 'TARGET_ARM', if_true: files('semihost.c'))
-
 subdir('nwfpe')
 
 syscall_nr_generators += {
diff --git a/linux-user/meson.build b/linux-user/meson.build
index 2b94e4ba24..7fe28d659e 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -16,6 +16,7 @@ linux_user_ss.add(rt)
 
 linux_user_ss.add(when: 'TARGET_HAS_BFLT', if_true: files('flatload.c'))
 linux_user_ss.add(when: 'TARGET_I386', if_true: files('vm86.c'))
+linux_user_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING', if_true: files('semihost.c'))
 
 
 syscall_nr_generators = {}
diff --git a/linux-user/arm/semihost.c b/linux-user/semihost.c
similarity index 100%
rename from linux-user/arm/semihost.c
rename to linux-user/semihost.c
diff --git a/target/arm/meson.build b/target/arm/meson.build
index f5de2a77b8..15b936c101 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -32,8 +32,6 @@ arm_ss.add(files(
 ))
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_TCG', if_true: files('arm-semi.c'))
-
 arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
-- 
2.29.2
