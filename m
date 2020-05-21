Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1888411lfb;
        Thu, 21 May 2020 13:00:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHRdSGpx0oWSQ7gMZrCfNOYj7lKbyb40XRB5RKyUMbooL/FHaFrN+iQ27gsYA0YvvGRyT5
X-Received: by 2002:a25:7607:: with SMTP id r7mr18052504ybc.493.1590091218701;
        Thu, 21 May 2020 13:00:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590091218; cv=none;
        d=google.com; s=arc-20160816;
        b=Rzu2DXVnAFFcNc/KKDb8OYsdIULiXuYNr4onuXioWRv8mPvI65VHijz9vt0BH1lNWO
         wtVJuF65airKEnCpcyRgHTR6XIF1DWt8WNdctKkLlTSamOsqmtfKOGSSgNLXnzNnJK21
         3tkNrx5Yng8ecs9bzo2vNiclYzNW4XuxqLyItTebABCBMKCdU3tjDiF4OY7LKXfD5obw
         eAFGqd0bzH1+vRb6ubTfFdovXTcO3Ukm2lvtZENYAHDLaDXDjikFxtF/w9aAARTnQ0tP
         uiBeGtqs4AIB3Q84HesHWIdrxj9rBp1VugP/IqvKC3la4QtCc8gPmDV7eXNGBn5a2o7Y
         fS7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Xv/yKL+Oc3sX8ayRlKIFZqZe7hdBRCnUDPQNbKc1oUo=;
        b=pEQUA3OmaAJEM5OuwTZCJ84aiAJ87xmR1Q0IFvvsWjACecftDTSmUy5UowsPhH44+p
         r6Wpm986hOQN5aoPYSrASmpup0GvVF3tj01I5OeWsL+UcovVAja16um2sMs9gaXOhgjV
         Gwa+xRCGdJ7wzGAX1wVXsVZPHc/DEnVfVElhA1ZhqbCF0ofRp8OoaL0TKKyRFsQGkXt+
         PLPvtyg553y9+PqUaV7HFGS1qm4oY7Pm+vEqhhy1o2iakcoryYXglhFDTYBwH89qCjhL
         54XvRDHvTfNt6f5VtB1ujEsIdCjRuOG9H0a92RgSNNcnRvPVxEOhJJvsJURjyVMgBKk8
         64Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YSpZODm2;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id u15si5848928ybj.476.2020.05.21.13.00.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2020 13:00:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YSpZODm2;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590091218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xv/yKL+Oc3sX8ayRlKIFZqZe7hdBRCnUDPQNbKc1oUo=;
	b=YSpZODm29MvwrCq2dc3RA/uyhpW6amZRsZIIFZgSFveEbTYdICM+AYgwX3isyQDM6gEZ0K
	6vqUcap7jgXl4gktJL9vsmvH+2n0ZXhX+rAxNFuMg7l5O+YuuSZXze/WINxPm3to9UjQnf
	dkTv2zm/cb61IZa/P3pCa1nNDETDPhI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-HGbx7K35NSa79Q1gy78_Og-1; Thu, 21 May 2020 16:00:15 -0400
X-MC-Unique: HGbx7K35NSa79Q1gy78_Og-1
Received: by mail-wm1-f69.google.com with SMTP id z5so87984wml.6
        for <alex.bennee@linaro.org>; Thu, 21 May 2020 13:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xv/yKL+Oc3sX8ayRlKIFZqZe7hdBRCnUDPQNbKc1oUo=;
        b=JuZHumCHpKHHqgYHyhg4AQsBRk+j/LOH/nPcIe+agdYbbYJ4aXx5+5BT6psJ6+eN0C
         vUU9U+Z4PCfC0OCliDuMW7NHLsj6viora8u3zDoprvV3T/N+A1lz4mleOnBP+Go/3mOr
         RF1P7Q3bJyJE0huId6J879p79xgjXF1/ZiTtRWsCFjb3He/lr18mMIZE9x2HkQFqmqM6
         t+IkNNBE6E1uUgdeIeNA1EV+apaZqR6viX9/BUP+hoyHwVWlyTHXYtBN3hsm9tbKl5jg
         axDxazjbeTp9hCEeF4OiG5dovIofL1N6EDaNQrCVF1Kz2YIOiObKpQjDd9MCFlmnB1NR
         656g==
X-Gm-Message-State: AOAM531R0HDn5Gt7sIzwR3dTyYxXGhTpwMCcrr3A7D3iX71h/vE6eGRP
	ghuRaC4tp8clFhPYpb0wlvViqR9EcBc8NzIWCL4MxkmWlBprus+egwse3wDGlVS8ZOsdY/tapy1
	qTu6Y44hbZGMOvQkw
X-Received: by 2002:adf:e4cf:: with SMTP id v15mr211412wrm.43.1590091213850;
        Thu, 21 May 2020 13:00:13 -0700 (PDT)
X-Received: by 2002:adf:e4cf:: with SMTP id v15mr211378wrm.43.1590091213621;
        Thu, 21 May 2020 13:00:13 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id z7sm7419304wrl.88.2020.05.21.13.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 13:00:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>,
	Marek Vasut <marex@denx.de>,
	qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Richard Henderson <rth@twiddle.net>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 11/11] hw/semihosting: Make the feature depend of TCG, and allow to disable it
Date: Thu, 21 May 2020 21:59:11 +0200
Message-Id: <20200521195911.19685-12-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
References: <20200521195911.19685-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 9wqxk6XkY7lC

The semihosting feature is only meaningful when using TCG.

Do not enable it by default, and let the few targets requiring
it to manually select it.
The targets restricted to TCG that previously selected it
(see commit 16932bb761e52c2 'introduce CONFIG_SEMIHOSTING')
are left unmodified; however the selection is moved to the
target Kconfig.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: Fixed odd hidden \xC2 UTF-8 chars:

Traceback (most recent call last):
  File "qemu/scripts/minikconf.py", line 355, in parse_file
    self.src = fp.read()
UnicodeDecodeError: 'ascii' codec can't decode byte 0xc2 in position 21: ordinal not in range(128)
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
index 0000000000..035592dd86
--- /dev/null
+++ b/target/arm/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y if TCG
diff --git a/target/lm32/Kconfig b/target/lm32/Kconfig
new file mode 100644
index 0000000000..68b946e79b
--- /dev/null
+++ b/target/lm32/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y
diff --git a/target/m68k/Kconfig b/target/m68k/Kconfig
new file mode 100644
index 0000000000..68b946e79b
--- /dev/null
+++ b/target/m68k/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y
diff --git a/target/mips/Kconfig b/target/mips/Kconfig
new file mode 100644
index 0000000000..035592dd86
--- /dev/null
+++ b/target/mips/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y if TCG
diff --git a/target/nios2/Kconfig b/target/nios2/Kconfig
new file mode 100644
index 0000000000..68b946e79b
--- /dev/null
+++ b/target/nios2/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y
diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
new file mode 100644
index 0000000000..035592dd86
--- /dev/null
+++ b/target/riscv/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y if TCG
diff --git a/target/xtensa/Kconfig b/target/xtensa/Kconfig
new file mode 100644
index 0000000000..68b946e79b
--- /dev/null
+++ b/target/xtensa/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y
-- 
2.21.3
