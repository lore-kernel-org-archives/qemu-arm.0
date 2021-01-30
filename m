Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1618953lfo;
        Fri, 29 Jan 2021 17:53:06 -0800 (PST)
X-Received: by 2002:a1c:e407:: with SMTP id b7mr6085931wmh.46.1611971586751;
        Fri, 29 Jan 2021 17:53:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611971586; cv=none;
        d=google.com; s=arc-20160816;
        b=BixJ/E97/T1LnJYL0pNc3b6u0Lah5twuG7ptBjYE+JXxV+lb5aU7ZqYAvalqoDdIOE
         h9RDn8MXsTIsU6AgwMxkTH+y8V1UMt4nMbl9OEnYGuWgrDK1c9S1e6Lymknt3cFvkZZn
         DxxOZ/ElzjAVxwdcb5vt1hgKgwf889Pf0ecAC7EDw/m4IH0Hm29IGvImjh0W3YQurGyf
         W7z39Xu0yHuuDeQLr8v+kiC06o5gZD6TGH8PqWrpLCIe9sc3+LZjY4BypYOr64/5Wru9
         4ogLgwSlBQzI4qwUhr+oC8+1eHl4LOSh0h0rxIs6Pg2TcCRMa3iodX11pIH+1pHdw2Cl
         +3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=pL3VFUfes4LLPpgaJDy8jU3gYau+sjFrKic4/sFvnNY=;
        b=ixtSWVWk8hB7arqYCSo4huDTKgEUOkPnJ9hIn3aMEQPbVhfyqsjs/Ypz/TFtPWs1zX
         D+q3Janp+vNc2mV3cEzilxatM/NjMbJZcKjwDdmvylDjzIGtLd1vCh8sTtKEK4G5SfrQ
         4Idl++4tSRjTcjsQiuYrKs5ojUhM7s6zyqZ0mrvLQ/hkMNtEfaeN3VLrOQassj7/rbE/
         UhZUk5RS7NJsEKVf7+KlbwAyGNZbaMPF/ZVFVxuZ76/BC+PQ0GabKkPkXzaUvEZ5ZpbZ
         N4A3mTF5Qu9nRFVf0zs6fPLp71u0BJCvp3vGpvRXRcDjU3Y0AM0KBp64DrBrv/tMcksj
         SUew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="QlPx5vk/";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j14sor6008021wrx.54.2021.01.29.17.53.06
        (Google Transport Security);
        Fri, 29 Jan 2021 17:53:06 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="QlPx5vk/";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pL3VFUfes4LLPpgaJDy8jU3gYau+sjFrKic4/sFvnNY=;
        b=QlPx5vk/bo8ydtxxW9jNTxI4BE08Ejo8IlC/WMnhi4Wbme1fYmhJgyU1Upki/92NmF
         WC2DbHcdeOoGbbqkX3uzvTl8MPRzbcKjiR9DkW3t+gelrCpi6lbR+YljJPOX4B/pNnJR
         jLROfdsvWr2JLoQ3ukaZTPfmPpHIQ2tX5RT3QafM9bvIGcGYCZ4JbSGyIOolFM9zj2wp
         8Lk2wKKiOifSwg1YsFs8CXFAh+ZPmwh7tkYJaYlPsNhSagHtmcD7TetDYtI5mpUQKEuJ
         UxtEsewFWr9ZiT2uXhIw/Szt607GBXaZ6aLcK0stqf2PdjzbROXSDKfZ0OHCM4ASM64Z
         ZiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=pL3VFUfes4LLPpgaJDy8jU3gYau+sjFrKic4/sFvnNY=;
        b=eC/U5te6taTOBDdRdzAPikBKPQUvjNIj7Okynl+6lZ4uOyWEndcwKLWRAVTWe9jpk3
         BdFHNfOf5dFCprOpLtp/Qs+l82brJSE3r3huyTXuKb/k6/4UHtlyMdf4JwWNSB+vItcV
         1J1KaoQLXpXNJwD0felWIfAQ5n16VKfzPzN9AWxxteIH74KH5Yj9FVAAiZTXWMWI5vbe
         3Vf7114YTVAjmn8YFNpe3M0COBIVs1/WiB5OjGbSZ7oSxvN/uI82rEYTSE3NW3n++Wi3
         0NOTUH2ExMbiVFnAWA6Q5V1ZrQiwkutG6Mbr3B+hb80mt+/u3KV/+mDdlJsQj6j9njkY
         3l0g==
X-Gm-Message-State: AOAM533/5X1pJx6e3gUGQsjY4sDGSn0e6wY2HjJDKm+QlxLKXJ42JAQ6
	/ybjis4YN5p/AWX1KVP3pt0=
X-Google-Smtp-Source: ABdhPJwbM5w0TDBpvxYm44nUc4AYAH45EnulcrjfYKeG5PWB96HJ5mDacgEs5qWvrmDx0pRxmhlO2w==
X-Received: by 2002:adf:a31d:: with SMTP id c29mr7307582wrb.306.1611971586564;
        Fri, 29 Jan 2021 17:53:06 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net. [83.57.169.13])
        by smtp.gmail.com with ESMTPSA id f13sm8277528wmf.1.2021.01.29.17.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 17:53:05 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 07/11] target/arm: Restrict ARMv7 M-profile cpus to TCG accel
Date: Sat, 30 Jan 2021 02:52:23 +0100
Message-Id: <20210130015227.4071332-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bAbSb6VAP4XJ

A KVM-only build won't be able to run M-profile cpus.

Only enable the following ARMv7 M-Profile CPUs when TCG is available:

  - Cortex-M0
  - Cortex-M3
  - Cortex-M4
  - Cortex-M33

The following machines are no more built when TCG is disabled:

  - emcraft-sf2          SmartFusion2 SOM kit from Emcraft (M2S010)
  - highbank             Calxeda Highbank (ECX-1000)
  - lm3s6965evb          Stellaris LM3S6965EVB
  - lm3s811evb           Stellaris LM3S811EVB
  - midway               Calxeda Midway (ECX-2000)
  - mps2-an385           ARM MPS2 with AN385 FPGA image for Cortex-M3
  - mps2-an386           ARM MPS2 with AN386 FPGA image for Cortex-M4
  - mps2-an500           ARM MPS2 with AN500 FPGA image for Cortex-M7
  - mps2-an505           ARM MPS2 with AN505 FPGA image for Cortex-M33
  - mps2-an511           ARM MPS2 with AN511 DesignStart FPGA image for Cortex-M3
  - mps2-an521           ARM MPS2 with AN521 FPGA image for dual Cortex-M33
  - musca-a              ARM Musca-A board (dual Cortex-M33)
  - musca-b1             ARM Musca-B1 board (dual Cortex-M33)
  - netduino2            Netduino 2 Machine
  - netduinoplus2        Netduino Plus 2 Machine

We don't need to enforce CONFIG_ARM_V7M in default-configs anymore.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/arm-softmmu.mak | 11 -----------
 hw/arm/Kconfig                          | 17 +++++++++++++----
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index ee80bf15150..b72926b8fce 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -1,28 +1,17 @@
 # Default configuration for arm-softmmu
 
-# TODO: ARM_V7M is currently always required - make this more flexible!
-CONFIG_ARM_V7M=y
-
 # CONFIG_PCI_DEVICES=n
 # CONFIG_TEST_DEVICES=n
 
 CONFIG_ARM_VIRT=y
 CONFIG_CUBIEBOARD=y
 CONFIG_EXYNOS4=y
-CONFIG_HIGHBANK=y
-CONFIG_MUSCA=y
-CONFIG_STELLARIS=y
 CONFIG_REALVIEW=y
 CONFIG_VEXPRESS=y
 CONFIG_ZYNQ=y
 CONFIG_NPCM7XX=y
-CONFIG_NETDUINO2=y
-CONFIG_NETDUINOPLUS2=y
-CONFIG_MPS2=y
 CONFIG_RASPI=y
 CONFIG_SABRELITE=y
-CONFIG_EMCRAFT_SF2=y
-CONFIG_MICROBIT=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 320428bf97e..f56c05c00a8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -16,6 +16,12 @@ config ARM_V7R
     depends on TCG
     select ARM_COMPATIBLE_SEMIHOSTING
 
+config ARM_V7M
+    bool
+    depends on TCG
+    select ARM_COMPATIBLE_SEMIHOSTING
+    select PTIMER
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -78,6 +84,7 @@ config EXYNOS4
 
 config HIGHBANK
     bool
+    default y if TCG
     select A9MPCORE
     select A15MPCORE
     select AHCI
@@ -113,6 +120,7 @@ config MAINSTONE
 
 config MUSCA
     bool
+    default y if TCG
     select ARMSSE
     select PL011
     select PL031
@@ -133,10 +141,12 @@ config MUSICPAL
 
 config NETDUINO2
     bool
+    default y if TCG
     select STM32F205_SOC
 
 config NETDUINOPLUS2
     bool
+    default y if TCG
     select STM32F405_SOC
 
 config NSERIES
@@ -258,6 +268,7 @@ config SABRELITE
 
 config STELLARIS
     bool
+    default y if TCG
     select ARM_V7M
     select CMSDK_APB_WATCHDOG
     select I2C
@@ -331,10 +342,6 @@ config ZYNQ
     select XILINX_SPIPS
     select ZYNQ_DEVCFG
 
-config ARM_V7M
-    bool
-    select PTIMER
-
 config ALLWINNER_A10
     bool
     select AHCI
@@ -463,6 +470,7 @@ config ASPEED_SOC
 
 config MPS2
     bool
+    default y if TCG
     select ARMSSE
     select LAN9118
     select MPS2_FPGAIO
@@ -516,6 +524,7 @@ config NRF51_SOC
 
 config EMCRAFT_SF2
     bool
+    default y if TCG
     select MSF2
     select SSI_M25P80
 
-- 
2.26.2
