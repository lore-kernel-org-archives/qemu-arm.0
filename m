Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1833167lfc;
        Thu, 11 Jun 2020 15:36:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2IZPT0J0ozxDNVU+TYYnzBGkCOhVrqN6KujLyuiR+fovvARfzKo6wMLZ9eS9jG8YprWW0
X-Received: by 2002:a25:2d57:: with SMTP id s23mr19011969ybe.11.1591914971802;
        Thu, 11 Jun 2020 15:36:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591914971; cv=none;
        d=google.com; s=arc-20160816;
        b=C+ou6tA3vtJxweW0IvQudSNaZZAbofXO5urcsnJAXaCjVCeAo5tisT1FLA9m/NFL9p
         p8IpU7/Wpi1+DeaYTyaeZzu3KMisfFTWv/xRLxdIfc64xe7sf9WgtQQZiw19ZQXIx0iP
         2Xy8Eqj4H/pj+epf8NdFqg0mzcB2QLwsZoQy2J/xrt9/nC96TI3UV4k+cb6HR9rO7b1w
         3SMPqaNYf//Hfvyr9utCVJ6+uP/Q7ivY6WuY5DsbjwGm3SG8irgqtz7OS8bW/nS9rLC/
         O0dhSmjuseJ/fxBDD3Sofr2/3MJfINrI3C/etX0b1MESuSzW9Fjg7JVEijRfWtITiuU0
         aTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=8qcB9xOvPcuAny70mDIQDKyEJFo9RDirgwMbJw47Z1w=;
        b=A8VHok7Md4etAUktwuapgDxhw73U5FyJ9kliJhGYJwItoft0HLVijEXhkF8MWlJfdt
         tFwZ22+Go0b+ZhqkHcwiNK99vkiH2zplLDiKTWIC8eODEqfdfQqHfy407M0EFcHHvksn
         yrTKvO/OQ9HO/FSL/i/eL6hmk0Qq77hjKIhjp0Vyx2O/n6N2BiBD8CzPXO4tyG4yxbkf
         dkAh2GFAntpJ2AA+a3nkoV0w+mxuHK0TPPK5OZ8t6sxqttnh59bUmwmwHph/Ml4tl5aD
         NAHNsY6LfkCkmo51Gc3WtNCb/KK7XIK0OPZMqMtS2Z7I6ZnFPZMRghDsGhIr27AcbaPJ
         WBJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=sUNrgMkh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6si3494931ybc.212.2020.06.11.15.36.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 15:36:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=sUNrgMkh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:44610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjVnv-0003rW-3o
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 18:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3mbDiXgsKCIInyqottksuktmuumrk.iuswks0-gxstutmt0.uxm@flex--hskinnemoen.bounces.google.com>)
 id 1jjVit-0004MS-Pg
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 18:31:01 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:50996)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3mbDiXgsKCIInyqottksuktmuumrk.iuswks0-gxstutmt0.uxm@flex--hskinnemoen.bounces.google.com>)
 id 1jjViq-0004JJ-SJ
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 18:30:59 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id e192so8198152ybf.17
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 15:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=8qcB9xOvPcuAny70mDIQDKyEJFo9RDirgwMbJw47Z1w=;
 b=sUNrgMkhiG9FAN623jrZZ9uR2oB6sFHVVjYWWryhaD7DvcmEAlaNJOrPPNo+zjU387
 Dro4s78fwK+O2Ml5jwNdC+JjlbhTMc2zbHNVzHtT8Hc/kEixlSmaLPx6LdQzY46abw/o
 I0Ew6erkb6jd3PJJXcv6pAuawUgyaDeNHton/aFmsDKObvAUVXnckAKTcnw67WPr5PpM
 PXrPsQazbuI2uwh13OAhY/peohbAXMtSywE5V0IiBo13kzXvU6WfnaixrjXb5ESkylsU
 mjNNgkQGmcc16INa8hMO5ETIr6id8HwppCXKmpVIun/0hEP8sjJsonznGN+UkLqXuIhO
 NqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=8qcB9xOvPcuAny70mDIQDKyEJFo9RDirgwMbJw47Z1w=;
 b=bp0BYpspU39CFl4/GRJwNoeVlubM4FvpSb4u2+x/yXk8FgjeARYQRtQBY1S537lS+2
 QCuXahqmBMB5nJH7UOOnF+s25NUyubO0152eQWb5j0dUxUkUrcSiN05KI9wYuJ064l+v
 p5AHKT+gItb5wKSjy28rbGwBlO+mgP9gaWWuP4WkIoMwNxKTQyKMhc1zIKZ+ABQCZFQv
 Elp3vz64ZTthCIPwh5Z6ew0Nw1tP3TlfpugG6mSXMjY1e0QScRIm+i1MCF2OFsKTDq+l
 JAbxHf8gksk1EM/xDE1sGma5bM0uzpLzbpAnQOSoPb6VfkNRdSjJEWJRMsgpvR3awYVr
 KnEQ==
X-Gm-Message-State: AOAM533nlJIkkEm2gVF5IlwUCqtZJ4Hw94dAYNAs6vrVpr7MbwY18WaM
 /FM70wtDCYNJQLp/7vxQfDAYISTVVSSuYpvpeQ==
X-Received: by 2002:a25:ba4f:: with SMTP id z15mr17548372ybj.113.1591914649739; 
 Thu, 11 Jun 2020 15:30:49 -0700 (PDT)
Date: Thu, 11 Jun 2020 15:30:16 -0700
In-Reply-To: <20200611223016.259837-1-hskinnemoen@google.com>
Message-Id: <20200611223016.259837-13-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200611223016.259837-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
Subject: [PATCH v2 12/12] docs/system: Add Nuvoton machine documentation
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3mbDiXgsKCIInyqottksuktmuumrk.iuswks0-gxstutmt0.uxm@flex--hskinnemoen.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fzfNWPeyGTyt

Change-Id: I88e437cb22a8441e0c0e672dfb57568ac81172d8
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 docs/system/arm/nuvoton.rst | 89 +++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst  |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 docs/system/arm/nuvoton.rst

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
new file mode 100644
index 0000000000..1ca34c0051
--- /dev/null
+++ b/docs/system/arm/nuvoton.rst
@@ -0,0 +1,89 @@
+Nuvoton iBMC boards (``npcm750-evb``, ``quanta-gsj``)
+=====================================================
+
+The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
+designed to be used as Baseboard Management Controllers (BMCs) in various
+servers. They all feature one or two ARM Cortex A9 CPU cores, as well as an
+assortment of peripherals targeted for either Enterprise or Data Center /
+Hyperscale applications. The former is a superset of the latter, so NPCM750 has
+all the peripherals of NPCM730 and more.
+
+.. _Nuvoton iBMC: https://www.nuvoton.com/products/cloud-computing/ibmc/
+
+The NPCM750 SoC has two Cortex A9 cores and is targeted for the Enterprise
+segment. The following machines are based on this chip :
+
+- ``npcm750-evb``       Nuvoton NPCM750 Evaluation board
+
+The NPCM730 SoC has two Cortex A9 cores and is targeted for Data Center and
+Hyperscale applications. The following machines are based on this chip :
+
+- ``quanta-gsj``        Quanta GSJ server BMC
+
+There are also two more SoCs, NPCM710 and NPCM705, which are single-core
+variants of NPCM750 and NPCM730, respectively. These are currently not
+supported by QEMU.
+
+Supported devices
+-----------------
+
+ * SMP (Dual Core Cortex-A9)
+ * Cortex-A9MPCore built-in peripherals: SCU, GIC, Global Timer, Private Timer
+   and Watchdog.
+ * SRAM, ROM and DRAM mappings
+ * System Global Control Registers (GCR)
+ * Clock and reset controller (CLK)
+ * Timer controller (TIM)
+ * Serial ports (16550-based)
+ * DDR4 memory controller (dummy interface indicating memory training is done)
+ * OTP controllers (no protection features)
+ * Flash Interface Unit (FIU; no protection features)
+
+Missing devices
+---------------
+
+ * GPIO controller
+ * LPC/eSPI host-to-BMC interface, including
+
+   * Keyboard and mouse controller interface (KBCI)
+   * Keyboard Controller Style (KCS) channels
+   * BIOS POST code FIFO
+   * System Wake-up Control (SWC)
+   * Shared memory (SHM)
+   * eSPI slave interface
+
+ * Ethernet controllers (GMAC and EMC)
+ * USB host (USBH)
+ * USB device (USBD)
+ * SMBus controller (SMBF)
+ * Peripheral SPI controller (PSPI)
+ * Analog to Digital Converter (ADC)
+ * SD/MMC host
+ * Random Number Generator (RNG)
+ * PECI interface
+ * Pulse Width Modulation (PWM)
+ * Tachometer
+ * PCI and PCIe root complex and bridges
+ * VDM and MCTP support
+ * Serial I/O expansion
+ * LPC/eSPI host
+ * Coprocessor
+ * Graphics
+ * Video capture
+ * Encoding compression engine
+ * Security features
+
+Boot options
+------------
+
+The Nuvoton machines can boot from an OpenBMC firmware image, or directly into
+a kernel using the ``-kernel`` option.
+
+Booting a full firmware image requires a Boot ROM specified via the ``-bios``
+option to QEMU. The firmware image should be attached as an MTD drive. Example :
+
+.. code-block:: bash
+
+  $ qemu-system-arm -machine quanta-gsj -nographic \
+      -bios npcm7xx_bootrom.bin \
+      -drive file=image-bmc,if=mtd,bus=0,unit=0,format=raw
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 1bd477a293..38a9daa9b9 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -84,6 +84,7 @@ undocumented; you can get a complete list by running
    arm/aspeed
    arm/musicpal
    arm/nseries
+   arm/nuvoton
    arm/orangepi
    arm/palm
    arm/xscale
-- 
2.27.0.290.gba653c62da-goog

