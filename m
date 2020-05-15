Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp679594lfb;
        Fri, 15 May 2020 10:09:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyisfbpCWI0IB5ie47h5cmLFVMytSfpmd+nNZWaWQL3QAPLNGIryLEjdE2CU9jhQTs0n2da
X-Received: by 2002:a25:bb8e:: with SMTP id y14mr6990338ybg.342.1589562547259;
        Fri, 15 May 2020 10:09:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589562547; cv=none;
        d=google.com; s=arc-20160816;
        b=CxYVldr9uHmXWsE71GAZL8QNASHbvVBFzf4ZcCKI1PwC3Xb5KZvHhcNoRHBXe3fPOv
         VPfQ8V8qQmum12zyYVxkW76YfxYBBMhokw7VlTzbO+LtwxrX05dgi1KoE4A4j9pqwZWB
         qglKO38HwNirG41i8zqBv3WO/8dS6XtY75g1Ye/3oFqURd/udwbKSRL7q/2Fpns9URW6
         hL0abTPhQIcqG3awXt7VYGKmF4XZQChRGAbaFmN/HRMAx/s7zk2jTVbl3KOo+925Ls/F
         xtdtvNuW8bVVsCVaadONl0TuVs3sFvkiVNVKsB+L9nqMSaJ7VO78NtQLLz2vbKBo2ueY
         ecnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1ZX0QW9DXonbuBshkLSkBrNCbZ8d0l65fGU32CLsfp4=;
        b=Yl7EovEpxtnk3h8tuVNqFhYXr6/Mo5KMFbvswUf4ZjKsyd8cwkH6lAeiTj0enpC0bL
         TljwvVA6u7onMzsIWW8Bntn1LyjP+O1WCx7MbmDrVTXF9l40kw+vTcl/vbU8u1MdAxKd
         1N6enrI2e15R5knghWYr643WQEXa/0jy2qw6dHpo0j8GcsXojmm57R0eePRBl96OIlvl
         w1kpcCAwB5D+/cOwq9iiMk/hLuS7tR8bw4MXoced4Iz/KVR/FMOMlNbsE+He3ayKMGj/
         W5zpJXpULbeozPYXfGZPkOroumVYcSLFt1qG2CtauB/qZ00E7Z75LwbgbMmeiXfXmsO0
         R4oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c6MQ2fvi;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id s10si2375477ybk.313.2020.05.15.10.09.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 May 2020 10:09:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c6MQ2fvi;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589562546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ZX0QW9DXonbuBshkLSkBrNCbZ8d0l65fGU32CLsfp4=;
	b=c6MQ2fviuAenTVXMnkgD5pmEk+tp2W49Xz4hh+CW4ygB57rgg+DOMTVdRVCXA9i/ykK5vG
	upj06bwukL2OZM+JnoL7sftEIQ+TCx7YofLhNkhTgKSVt0uA4mDzHfWRTFMlbbVjkgCrin
	ReMn+scaY2X4nvlP0K12sTlX+8iSD5w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-Ri93pGu_NM282FYpK-goeA-1; Fri, 15 May 2020 13:09:05 -0400
X-MC-Unique: Ri93pGu_NM282FYpK-goeA-1
Received: by mail-wr1-f69.google.com with SMTP id 37so1489051wrc.4
        for <alex.bennee@linaro.org>; Fri, 15 May 2020 10:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1ZX0QW9DXonbuBshkLSkBrNCbZ8d0l65fGU32CLsfp4=;
        b=N43ObRoLvQcHuyMj6pOUVzvqhuPSO+KJ9M4JhN2P+Q4WZNDGHFkSg0umyTGKNO1nWO
         wQudbOYoxhcH+kT2xWqud3E0uACRZu6uzlNotFkM/IzwtodtzWkrm1UgyH3Hgqsowf0L
         WbtpcGLrJqw9b/7T2gKuu2Lu2ND7hTPCt3of2E4ilfvQQu4CXxDIKcQb/0WIIzeckJUr
         UYPiBKS2yioATMNegoJlNn+nFgiSnsE8apb/xOocNWtiWvwKv5/kqJhIkj2R4tbRrvOr
         +b1UBXJzRaYkwoKVXih7V8gR6oiMFz0CAfWzNuqQ9SV/iDxmCDX9wo0JO0tvdVRf4+0d
         /qbg==
X-Gm-Message-State: AOAM5317RExRIFgkiMEwxifyXEZ0O2pD1lJbd7TJm4VCDBXbQmvxRb4T
	g/ocQECyiP/dLm9qQdj8S4RqqSkb+UrvE+6hX36oGJo5OOOzdEqwp04oQDApm79BKZ74/iBifK4
	R8MDG3iPHtyEqqLCH
X-Received: by 2002:a1c:2502:: with SMTP id l2mr3758348wml.111.1589562544153;
        Fri, 15 May 2020 10:09:04 -0700 (PDT)
X-Received: by 2002:a1c:2502:: with SMTP id l2mr3758311wml.111.1589562543904;
        Fri, 15 May 2020 10:09:03 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id 5sm4556980wmd.19.2020.05.15.10.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 10:09:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-riscv@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Marek Vasut <marex@denx.de>,
	Michael Walle <michael@walle.cc>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 10/10] hw/semihosting: Make the feature depend of TCG, and allow to disable it
Date: Fri, 15 May 2020 19:08:04 +0200
Message-Id: <20200515170804.5707-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515170804.5707-1-philmd@redhat.com>
References: <20200515170804.5707-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 4FGHRy08+DaB

The semihosting feature is only meaningful when using TCG.

Do not enable it by default, and let the few targets requiring
it to manually select it.
The targets restricted to TCG that previously selected it
(see commit 16932bb761e52c2 'introduce CONFIG_SEMIHOSTING')
are left unmodified; however the selection is moved to the
target Kconfig.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 default-configs/arm-softmmu.mak         | 1 -
 default-configs/lm32-softmmu.mak        | 2 --
 default-configs/m68k-softmmu.mak        | 2 --
 default-configs/mips-softmmu-common.mak | 3 ---
 default-configs/nios2-softmmu.mak       | 2 --
 default-configs/xtensa-softmmu.mak      | 2 --
 hw/semihosting/Kconfig                  | 4 +++-
 target/arm/Kconfig                      | 2 ++
 target/lm32/Kconfig                     | 2 ++
 target/m68k/Kconfig                     | 2 ++
 target/mips/Kconfig                     | 2 ++
 target/nios2/Kconfig                    | 2 ++
 target/riscv/Kconfig                    | 2 ++
 target/xtensa/Kconfig                   | 2 ++
 14 files changed, 17 insertions(+), 13 deletions(-)
 create mode 100644 target/arm/Kconfig
 create mode 100644 target/lm32/Kconfig
 create mode 100644 target/m68k/Kconfig
 create mode 100644 target/mips/Kconfig
 create mode 100644 target/nios2/Kconfig
 create mode 100644 target/riscv/Kconfig
 create mode 100644 target/xtensa/Kconfig

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 8fc09a4a51..f6044f1121 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -40,6 +40,5 @@ CONFIG_MICROBIT=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
-CONFIG_SEMIHOSTING=y
 CONFIG_ALLWINNER_H3=y
 CONFIG_ACPI_APEI=y
diff --git a/default-configs/lm32-softmmu.mak b/default-configs/lm32-softmmu.mak
index 115b3e34c9..6d259665d6 100644
--- a/default-configs/lm32-softmmu.mak
+++ b/default-configs/lm32-softmmu.mak
@@ -4,8 +4,6 @@
 #
 #CONFIG_MILKYMIST_TMU2=n        # disabling it actually causes compile-time failures
 
-CONFIG_SEMIHOSTING=y
-
 # Boards:
 #
 CONFIG_LM32=y
diff --git a/default-configs/m68k-softmmu.mak b/default-configs/m68k-softmmu.mak
index 6629fd2aa3..4fef4bd731 100644
--- a/default-configs/m68k-softmmu.mak
+++ b/default-configs/m68k-softmmu.mak
@@ -1,7 +1,5 @@
 # Default configuration for m68k-softmmu
 
-CONFIG_SEMIHOSTING=y
-
 # Boards:
 #
 CONFIG_AN5206=y
diff --git a/default-configs/mips-softmmu-common.mak b/default-configs/mips-softmmu-common.mak
index da29c6c0b2..6c0904b200 100644
--- a/default-configs/mips-softmmu-common.mak
+++ b/default-configs/mips-softmmu-common.mak
@@ -1,8 +1,5 @@
 # Common mips*-softmmu CONFIG defines
 
-# CONFIG_SEMIHOSTING is always required on this architecture
-CONFIG_SEMIHOSTING=y
-
 CONFIG_ISA_BUS=y
 CONFIG_PCI=y
 CONFIG_PCI_DEVICES=y
diff --git a/default-configs/nios2-softmmu.mak b/default-configs/nios2-softmmu.mak
index 1bc4082ea9..e130d024e6 100644
--- a/default-configs/nios2-softmmu.mak
+++ b/default-configs/nios2-softmmu.mak
@@ -1,7 +1,5 @@
 # Default configuration for nios2-softmmu
 
-CONFIG_SEMIHOSTING=y
-
 # Boards:
 #
 CONFIG_NIOS2_10M50=y
diff --git a/default-configs/xtensa-softmmu.mak b/default-configs/xtensa-softmmu.mak
index 4fe1bf00c9..49e4c9da88 100644
--- a/default-configs/xtensa-softmmu.mak
+++ b/default-configs/xtensa-softmmu.mak
@@ -1,7 +1,5 @@
 # Default configuration for Xtensa
 
-CONFIG_SEMIHOSTING=y
-
 # Boards:
 #
 CONFIG_XTENSA_SIM=y
diff --git a/hw/semihosting/Kconfig b/hw/semihosting/Kconfig
index efe0a30734..30befcdd21 100644
--- a/hw/semihosting/Kconfig
+++ b/hw/semihosting/Kconfig
@@ -1,3 +1,5 @@
 
+# default is 'n'
 config SEMIHOSTING
-       bool
+    bool
+    depends on TCG
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
new file mode 100644
index 0000000000..3224cac4ad
--- /dev/null
+++ b/target/arm/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y if TCG
diff --git a/target/lm32/Kconfig b/target/lm32/Kconfig
new file mode 100644
index 0000000000..c0a9a9e799
--- /dev/null
+++ b/target/lm32/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y
diff --git a/target/m68k/Kconfig b/target/m68k/Kconfig
new file mode 100644
index 0000000000..c0a9a9e799
--- /dev/null
+++ b/target/m68k/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y
diff --git a/target/mips/Kconfig b/target/mips/Kconfig
new file mode 100644
index 0000000000..3224cac4ad
--- /dev/null
+++ b/target/mips/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y if TCG
diff --git a/target/nios2/Kconfig b/target/nios2/Kconfig
new file mode 100644
index 0000000000..c0a9a9e799
--- /dev/null
+++ b/target/nios2/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y
diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
new file mode 100644
index 0000000000..3224cac4ad
--- /dev/null
+++ b/target/riscv/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y if TCG
diff --git a/target/xtensa/Kconfig b/target/xtensa/Kconfig
new file mode 100644
index 0000000000..c0a9a9e799
--- /dev/null
+++ b/target/xtensa/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y
-- 
2.21.3
