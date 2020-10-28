Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp770731lfa;
        Wed, 28 Oct 2020 11:57:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLArhscStKD4uUa3GJTltzQAvfyKT1I4S2k43rX4cqm/RuMd3NH+mizktOLYX9BhxjZoBJ
X-Received: by 2002:a17:90a:6984:: with SMTP id s4mr354740pjj.206.1603911458009;
        Wed, 28 Oct 2020 11:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603911458; cv=none;
        d=google.com; s=arc-20160816;
        b=B+xnGtqmYj+2sTcYOsv1hdkHOcEbC3PmlKztP1n3YPipepimcl9l213TtYSKzn0pBn
         bE8k+WR28gktBNR1tnQdqrKWg+qwpp0pEOYg3du9SGKjPznMMu6NAC172Npta579CkcO
         upkGFDj7v8Q40Ylqd7cROiG70JDDy5BSNXX0Z/3lrytHWEXNRdE2zliUOzMJpdRkz8Uc
         paP9hbkUCs4W5fr6IgtFSD9G89lgaMnIMBxbppxyZmOQPOi/lgkXdtzqSjC3f30f0C3M
         PxTtGy8KDpSpq1TP3DmkoI4E7qt7oaNfJ8hXAzwEN93wYhOisGpZ2t8TNPJC1TJhxPbM
         lqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=IJrXixMVN3+rZ9q8XF/Xi6rfl9c+p0uQotcVa1RwKR8=;
        b=zo2S+xkNEF2aTyne1SZ47uXXni7Gp/+zRx6fzK+anc5wyRqJymISPMAJOkGUXjg6LP
         KkLK91AMYD+Wy10kRKwzyeEvQ4+5S4gX5ctaZLhVaFLKrbifyXfOQvyFZ//yZw0mt0Gd
         A8AUfbHT9F9pYMpd4SflYRIS96I5G551+in5s0BpJNqd0zX7b+su8/HtpWrUUM3ztxwy
         95KkwHOiJyu6KnNCZJBymCxUl+5lii+h9BT1xxRzjHVCG3voybK4GC7ZBxiUKcDEwrjh
         DLZ+HVF69TWHPdnQXOyAJCRWU02CPa0PZUOCJC4JDBn39dp/VsMltw8Wbz9q4orknFx6
         M5KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=DHR8SsI+;
       dkim=pass header.i=@keithp.com header.s=mail header.b=Gt3W7g9V;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id g6si218302pgm.251.2020.10.28.11.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 11:57:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=DHR8SsI+;
       dkim=pass header.i=@keithp.com header.s=mail header.b=Gt3W7g9V;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id C2B533F2DDAA;
	Wed, 28 Oct 2020 11:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1603911456; bh=1uixw7i+7CXy1hvSM8zGfykkQvgeOdiPcWVeaxl+0Hs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DHR8SsI+VPlJbAcJiGSuVmTIIMQl/AWOvpNDG0uASYHsxTVk7zGA1xDBOAZ8KeBCS
	 KUsvp8o4t9FQRxHk6vMKUEiOT6Xt0n/gRR8xv/LYRTnRe2FRc3Wf/G3F5sltX5bJ4+
	 8qa4CtoESxuR1moYG2gyKVmFbgvI1zxRJhl51rykEEXzloqCzk1318YudP0b/rhWvr
	 xtO0XaXd1srL5oXKg5/g1tLKd1H3v5eWI/7ADtVQjZ6QdAxzAB12RrXP9+FAKcBilO
	 BPhx4Dqzluzp9W+bdaqBzR1+pm6L3QA0Kc+BMIm55s7J7fAsGxYPJWX8Mxfd8+vmRH
	 TYgJPSiEnOK/A==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RbsUgclB5IFN; Wed, 28 Oct 2020 11:57:36 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 6B2B43F2DDAE;
	Wed, 28 Oct 2020 11:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1603911453; bh=1uixw7i+7CXy1hvSM8zGfykkQvgeOdiPcWVeaxl+0Hs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gt3W7g9Vhg7RK6tpKUbl/9mll/GCUpjxw8y+ia7fYQlqu0P11kFPScfzFSSAUmth4
	 Hmx8j8UBOFhXs+xf0mcN7sqY8dBUyiW3JZ7s9D+TEiNUb2cgNsZn03mBrDUhTS7vwT
	 sFbr8AJ3cMWegtStWnFNvJM/ZQCC/+wbOHYHuvzr78jEfbeECO14M+t2wi6CqGDSnF
	 fZj8es3samnLi35ah6cOyRQ2eJtQk5TbWdRXdgIprZ9RajQwyZdv4rB+PAMyDBeOjL
	 TekRuIHQsZQ6uZvexgKGvgpkxk5W0BTEq3Y0u5VqxY+UZtvOgIlwzHiu9twqJEZrau
	 OZcxbBZvV620A==
Received: by keithp.com (Postfix, from userid 1000)
	id 3248D1582211; Wed, 28 Oct 2020 11:57:33 -0700 (PDT)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-riscv@nongnu.org,
	Keith Packard <keithp@keithp.com>
Subject: [PATCH 1/4] semihosting: Move ARM semihosting code to shared directories [v3]
Date: Wed, 28 Oct 2020 11:57:19 -0700
Message-Id: <20201028185722.2783532-2-keithp@keithp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028185722.2783532-1-keithp@keithp.com>
References: <20201028185722.2783532-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: e+nt/V64p/oE

This commit renames two files which provide ARM semihosting support so
that they can be shared by other architectures:

 1. target/arm/arm-semi.c     -> hw/semihosting/common-semi.c
 2. linux-user/arm/semihost.c -> linux-user/semihost.c

The build system was modified use a new config variable,
CONFIG_ARM_COMPATIBLE_SEMIHOSTING, which has been added to the ARM
softmmu and linux-user default configs. The contents of the source
files has not been changed in this patch.

Signed-off-by: Keith Packard <keithp@keithp.com>

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
2.28.0
