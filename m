Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5758015lfy;
        Mon, 10 Aug 2020 17:53:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy6Qwih0YWR9RLBGTdo83irKhYJvNUwEfec+NDFG8aW3Lj+rML1mHUSWoWpXoidBFIhatU
X-Received: by 2002:a25:3855:: with SMTP id f82mr44177168yba.301.1597107203415;
        Mon, 10 Aug 2020 17:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597107203; cv=none;
        d=google.com; s=arc-20160816;
        b=IA2Ogzl4+B0qfeSPODE0R4Y+OYa2Jgs9Ma5VLOhdafQpPgzY/J4AAw311gSRp8Brak
         mLt3Iainaqm+gwBisHqsfg2yf/TkUL4n8xqgI6PosorDTEMsvvT/8tbJOtoYHiPw2fk+
         /Bl7aEX63qkL/Cx2CvGB0P4mAYiTUBwiur7OUJb6GIA2VX3veyUGkoNDw+VTbD9X4uZr
         EZ13JhhF4xeSSEc859AcOB8uoRpG96LbZVQbfoIHJA64SYou34DPwAtwrBCWnLqtbD7y
         elP69VIBOrgeGGYi/Y1PjllusF0vp8yz+6qI+R6hrTAYWKXx5cQhjEn7usYD2dxvmnY0
         KqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=77MzROSny901jeDfoK8saH4ylZZBqxvesEflSfZJQLU=;
        b=AtN8VqX/3aKqMAH10X1Om6XnETJzAdwMmPrjvNw5AuJrFmxgaHi0wFgrROEQthT0mu
         FJHs6Hc6Edm3rBDUaDtYusfjFTPk46Gxj42nF5zv4RE4BkKxE7n+RgJ10PjNmsXXsMku
         w4U+bHFm16h18zrPQy1kNLfYbSkzYCXP+jKbwVSAdPI62KS9FMo2PmW7NBPnp/DofspN
         1FBOn++01M9mevZytO3d4VW6tWeBBVscJnCLqljgk/rNy/kC+oPfs4JzmZWMpFeehAVj
         s+vcJz47sag2wxYCShrle37wyQ8rMlN2LBPT4J6Rnub9KZm/MfuMrAI9tHrJUWQKN2ai
         gMwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=D1bVMwh5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p141si17942169ybc.185.2020.08.10.17.53.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 17:53:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=D1bVMwh5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:38178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5IXa-0002Hz-QA
	for alex.bennee@linaro.org; Mon, 10 Aug 2020 20:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3aeoxXwsKCAYnyqottksuktmuumrk.iuswks0-gxstutmt0.uxm@flex--hskinnemoen.bounces.google.com>)
 id 1k5IR3-0007UG-UB
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 20:46:37 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:60367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3aeoxXwsKCAYnyqottksuktmuumrk.iuswks0-gxstutmt0.uxm@flex--hskinnemoen.bounces.google.com>)
 id 1k5IR1-0004kn-JF
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 20:46:37 -0400
Received: by mail-pj1-x1049.google.com with SMTP id lx6so1009683pjb.9
 for <qemu-arm@nongnu.org>; Mon, 10 Aug 2020 17:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=77MzROSny901jeDfoK8saH4ylZZBqxvesEflSfZJQLU=;
 b=D1bVMwh5IiM4bKD+2aKArKX03ILS+T/P5j/w8GQ58TslXC09EvD5ZqftPpvus1PKYs
 Zl39mqT4yrMkZZ9qfuxVdzH5Wg0CixHWbU5V/DHURSx8r9XOmYtVHFLsI62WrlO9F6dl
 RYTpbTuf5p4w9ae6YMHIxd8GN2ezGKq8Fzm1xktm32zZzmXWMpivK3nLAnX2TgjMPzg2
 DNA0+UkUQabY4QbBX1e+ktGp0j+eOiDIcf+xKX5vP7VRGwldwxn2+vNCzon4U/G4PikO
 2LWM2n0/en/BS4ZA6tuJf+bgLEfoV5JOWw8fiLAKkG4HAb0WyOAJc8QZHacXvyQImOk+
 PXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=77MzROSny901jeDfoK8saH4ylZZBqxvesEflSfZJQLU=;
 b=RaiXVotRxMqW2DptX/6cdnp1TARdeN78IV4puwB4KvhO6Wv5cBiE9G/Fml9aGrQ63s
 1GVvKmbI4XvkRcCKUDuNcaevlCetH04iZgbooFnO098psKAIPWTQR4H0/anblYyKjq3n
 n3bAp5kjdw234a34vfUiCSeixCioFs1RumABU4Tll26VJ6d/IJFe9WDklY6zpMP/eLn5
 dTFuuNri9BvuSDVEgwQj7StBnHEpRR0BOGEQjDvokrS6MU5dZBVAQ1XYInK8Ezi9J6sy
 hvBpIlhJ/cdSrZww/tFSTQTo0CEj97cOdKZyPAYGkHJEbVCKsX3FVY8n4wY1UAMn3YGt
 nUnQ==
X-Gm-Message-State: AOAM533WRNFvcEZ1sIbhH1H3IlPsMAzQuIUAzzG5coHNa9VswlEwlJnG
 wWLV2pyiCKxF5HgxwGVkBUVGyy+rB76QSi60yw==
X-Received: by 2002:a17:90a:f014:: with SMTP id
 bt20mr284137pjb.0.1597106793494; 
 Mon, 10 Aug 2020 17:46:33 -0700 (PDT)
Date: Tue, 11 Aug 2020 00:46:06 +0000
In-Reply-To: <20200811004607.2133149-1-hskinnemoen@google.com>
Message-Id: <20200811004607.2133149-13-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200811004607.2133149-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
Subject: [PATCH v7 12/13] docs/system: Add Nuvoton machine documentation
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, f4bug@amsat.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3aeoxXwsKCAYnyqottksuktmuumrk.iuswks0-gxstutmt0.uxm@flex--hskinnemoen.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_OTHER_BAD_TLD=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: YUXH0LvdQFbd

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 docs/system/arm/nuvoton.rst | 90 +++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst  |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 docs/system/arm/nuvoton.rst

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
new file mode 100644
index 0000000000..36bf901122
--- /dev/null
+++ b/docs/system/arm/nuvoton.rst
@@ -0,0 +1,90 @@
+Nuvoton iBMC boards (``npcm750-evb``, ``quanta-gsj``)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+
+The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that ar=
e
+designed to be used as Baseboard Management Controllers (BMCs) in various
+servers. They all feature one or two ARM Cortex A9 CPU cores, as well as a=
n
+assortment of peripherals targeted for either Enterprise or Data Center /
+Hyperscale applications. The former is a superset of the latter, so NPCM75=
0 has
+all the peripherals of NPCM730 and more.
+
+.. _Nuvoton iBMC: https://www.nuvoton.com/products/cloud-computing/ibmc/
+
+The NPCM750 SoC has two Cortex A9 cores and is targeted for the Enterprise
+segment. The following machines are based on this chip :
+
+- ``npcm750-evb``       Nuvoton NPCM750 Evaluation board
+
+The NPCM730 SoC has two Cortex A9 cores and is targeted for Data Center an=
d
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
+ * Cortex-A9MPCore built-in peripherals: SCU, GIC, Global Timer, Private T=
imer
+   and Watchdog.
+ * SRAM, ROM and DRAM mappings
+ * System Global Control Registers (GCR)
+ * Clock and reset controller (CLK)
+ * Timer controller (TIM)
+ * Serial ports (16550-based)
+ * DDR4 memory controller (dummy interface indicating memory training is d=
one)
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
+The Nuvoton machines can boot from an OpenBMC firmware image, or directly =
into
+a kernel using the ``-kernel`` option. OpenBMC images for `quanta-gsj` and
+possibly others can be downloaded from the OpenPOWER jenkins :
+
+   https://openpower.xyz/
+
+The firmware image should be attached as an MTD drive. Example :
+
+.. code-block:: bash
+
+  $ qemu-system-arm -machine quanta-gsj -nographic \
+      -drive file=3Dimage-bmc,if=3Dmtd,bus=3D0,unit=3D0,format=3Draw
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 4c5b0e4aab..4c0da725ee 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -86,6 +86,7 @@ undocumented; you can get a complete list by running
    arm/musicpal
    arm/gumstix
    arm/nseries
+   arm/nuvoton
    arm/orangepi
    arm/palm
    arm/xscale
--=20
2.28.0.236.gb10cc79966-goog

