Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp864807lfb;
        Wed, 25 Nov 2020 13:36:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnYdCiq9EmWOMF9ANMwmUR/uNFJezhGuWVicDfO5FVuTq0z7xxTukVe4sukSPk8Hn1fOeE
X-Received: by 2002:a17:90b:8c:: with SMTP id bb12mr6136291pjb.133.1606340194164;
        Wed, 25 Nov 2020 13:36:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606340194; cv=none;
        d=google.com; s=arc-20160816;
        b=AK7YrgL8oYZ8hFjiBHx8lyQWezMiR0uWlsfd3zLt5oTAPqNBsFbBgsPfTZZJwp3Hp7
         1UMvbVye9e75NdQyVjj0M5oLI3rdacVD+3Ds7klqkvskUk88F1g+pVvu/3LZotO4bkP4
         QE5M9DCC+MVzFOULs0LLYSQL299TlWt20Hhv2pcDTEiVKpFvMuaLzl/hcEFMG5MT4lUK
         d+p59lzRSr3PjbKV8ij3N+XJBrSg/LxSvt4hXzwFng0SGPhe81jWPF6oaZN3Pa07ERLd
         tstDoFjumcE6R+ub0KYNpITPc3NpFrWrPKihw48y0DCPwhpNliZjTTV4Ia6d9kPa2WiG
         XtrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=7taXbx/UyHGrzPRMAEPOWyi8xiRwRkp7ynKNAjnaM4A=;
        b=Syvs+5ZWaod6ngYy71acclXXpCAxBCwE9SF/ExQQk1dJYWI2oup7aMMXbHrKuah4Ss
         4EWV2lRK4i+ow4ctzFOAmCtnm+NxDY/Hqcc88REaqhkEH+ZveNdgrPQYznm0PB3AWCHF
         ClHqKz3qC0S7xoEXUW9WjtNh1/IxWHwlibsNmx3+PA8Bdtp28cG6QqmyQ/gmmdFCtTkP
         hxHVH3EMEKBoDnFnkVzQMkRNIHHq7ZAyqo4dTT2ScZNWzXknEXB2TvJyC1xQEBxYZDk6
         RA7WhKLQRR9slCZmWlEAmML8VN4djl1Wi0o+2Z2S1C11T598ra4Gaa45Xl8Yx0SERW3E
         IC9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=ltRYGmdQ;
       dkim=pass header.i=@keithp.com header.s=mail header.b=Y9kBG99n;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id o198si3387735pfd.122.2020.11.25.13.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 13:36:34 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=ltRYGmdQ;
       dkim=pass header.i=@keithp.com header.s=mail header.b=Y9kBG99n;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 238413F2E28A;
	Wed, 25 Nov 2020 13:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1606340193; bh=DRJ6/DHicq2mSvhQCrjSykm8dwPaSFkW7Nr657PAZLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ltRYGmdQMPo0ekJr9k9RKUdwE4pwasHuOvPS9Mnn28p0aMe+1Wkop5sJ7UzZq2sU0
	 6m9FTSYfqI6tpJKnhylr0/4KNcwYsDBi2qVQ0a7agoHnsdfvdhkzIhpyn+3CIb5+V+
	 /BilTgxQQf/fuAf9FVzSIdIlTm1bqLknpzhSjwdkWCUkH+3hMvZTOCZZ/sU9lbVona
	 l0wkKq1/LUVo8DOvTcgFDlAr4NPSo8RbmXC+9GdRUJkoT0L027sa32XdCh2FhlTwO3
	 wqnkU9yoeJR5MywK0jz1Y3RffW7QIP4AinjOowqjaqOcIEb+lZ6SbFo3HSeXF1kJIk
	 RfrNwCpXkQg2Q==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MjbXJGeWx0Cg; Wed, 25 Nov 2020 13:36:32 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 9C2873F2E287;
	Wed, 25 Nov 2020 13:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1606340191; bh=DRJ6/DHicq2mSvhQCrjSykm8dwPaSFkW7Nr657PAZLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y9kBG99nG6Rbnwzm8WG13EVYOhkZdQJPQazbHLV3vw+d4KZUPz+XBIp21dA4RAGoX
	 gIILxSocTLZv+rvpMzmWEAL+uZvEVcFoInevg7gw4zkuSGVt3s0nhC8qkc90qIzO+m
	 Vlku7qN16pqXwCItbQT2JWJi0VyldYrzN7N1giC/Ru2qzMhktRsB5l0CQQ03yQojmR
	 2D0XXqsnaYCiOdGuglsC6tC8T14PW/fuf62bmP8CbnuPioPQ+SF/QOlF0bL79Ou1rs
	 0xX1llKukjq6KcRLVdy9TehJnLBbv2NEhAQ9AOYPBR6D9zHZIFnOjCrR34iOkQPdI/
	 T46+7oN3wSeQA==
Received: by keithp.com (Postfix, from userid 1000)
	id 8C00E15821B9; Wed, 25 Nov 2020 13:36:31 -0800 (PST)
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
Subject: [PATCH 1/8] semihosting: Move ARM semihosting code to shared directories [v3]
Date: Wed, 25 Nov 2020 13:36:10 -0800
Message-Id: <20201125213617.2496935-2-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125213617.2496935-1-keithp@keithp.com>
References: <20201125213617.2496935-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: XuRhuCZ9sb0H

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
---
 default-configs/devices/arm-softmmu.mak               | 1 +
 default-configs/targets/aarch64-linux-user.mak        | 1 +
 default-configs/targets/arm-linux-user.mak            | 1 +
 hw/semihosting/Kconfig                                | 3 +++
 target/arm/arm-semi.c => hw/semihosting/common-semi.c | 0
 hw/semihosting/meson.build                            | 3 +++
 linux-user/arm/meson.build                            | 3 ---
 linux-user/meson.build                                | 1 +
 linux-user/{arm => }/semihost.c                       | 0
 target/arm/meson.build                                | 2 --
 10 files changed, 10 insertions(+), 5 deletions(-)
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
diff --git a/default-configs/targets/arm-linux-user.mak b/default-configs/targets/arm-linux-user.mak
index c7cd872e86..e741ffd4d3 100644
--- a/default-configs/targets/arm-linux-user.mak
+++ b/default-configs/targets/arm-linux-user.mak
@@ -3,3 +3,4 @@ TARGET_SYSTBL_ABI=common,oabi
 TARGET_SYSTBL=syscall.tbl
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
