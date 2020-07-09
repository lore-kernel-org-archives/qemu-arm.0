Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp907033lfm;
        Wed, 8 Jul 2020 17:38:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoqRE5X5YoDGDUlVCGUjJASuXC9T/U/RGCXtGBRgEUOZstZ/xvrgyfoJXna2/5srUvUdIl
X-Received: by 2002:a25:2041:: with SMTP id g62mr99624711ybg.429.1594255127862;
        Wed, 08 Jul 2020 17:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594255127; cv=none;
        d=google.com; s=arc-20160816;
        b=sSYQv1fVQGML1kHjhhv99PfiEQVxuiTkvPef0r2QoRCzti0g70m3dfI5x+3zGoCf+W
         /Nw0tAYfcvw8M9u8I6UoglteuOTuf+ksfdYfLAwnbxQT50fE6PZKc2p7+odFqjfaxWGK
         YaRjV0vASYbW4wUfHse0Vz6gzBJTsMd3KqbMa9fsGfvEigrxF03q1l2myv0ug362CaTp
         5q5I4jx46p4cudhpHrOn1zTTHOYCzvKtflzAmzwVNG6EasRdqhr9wirxLOB3RP8uhUBQ
         gq78A3kH3piAskVevEBVUA2pngjYdM0s3zG98qmvYoa2iRa3SgOKn8yp5TS0BtbFGaG7
         ohQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=4kEgWgHbRpLkO6qJk1qfJXYTlwg9/1nOLKkMOgmQiJc=;
        b=STbxo1UamUTaMQZzaM3AI3JpAz7/ldwbBPGMlYJUDWOZ9dF7u5CY3wqiJHgS2XtG6L
         HPjXev+VmRe4aZjeKvxSnFpPHEL16v5O3+hNAOWNkkWp5R3Ia4e9S8e5sYc4QPVG300A
         GEpS/cSR6/LN35sDAUfaJ0DHexvW2XasBwyzhwL/+a/DPdV7MpSwo4AFLB/0QD7S3wh8
         GlDfso+nkb51QsbmPD0LJ/yk3WIESrqoa7Q8F0Pg6F4+H+GktCloSwWnerRPs4SdEnKX
         0fX4wqS9qFRmXLp5Ww2+jf9VoJRHmlohRyjrgaqtooDQkUm9Ac0vGAxU6JV9f6Y45lyZ
         +h9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=VtxO58gz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 124si1097947ybo.51.2020.07.08.17.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 17:38:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=VtxO58gz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:57862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtKaM-0001ve-JZ
	for alex.bennee@linaro.org; Wed, 08 Jul 2020 20:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3nmYGXwsKCIMozrpuultvlunvvnsl.jvtxlt1-hytuvunu1.vyn@flex--hskinnemoen.bounces.google.com>)
 id 1jtKYW-0006xO-0t
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 20:36:52 -0400
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:44959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3nmYGXwsKCIMozrpuultvlunvvnsl.jvtxlt1-hytuvunu1.vyn@flex--hskinnemoen.bounces.google.com>)
 id 1jtKYS-000140-Sb
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 20:36:51 -0400
Received: by mail-qk1-x74a.google.com with SMTP id 13so517336qks.11
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2020 17:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=4kEgWgHbRpLkO6qJk1qfJXYTlwg9/1nOLKkMOgmQiJc=;
 b=VtxO58gz8PNHQHMZwb1mlisFTYXbvxgG1/iBXGRGmMc0Qtkm2hvC540WlnPYgUjNOY
 VsNgPcL3q7kzfNxP6CAh9VaGaCRmzEoWje+7YJidBUB0jzd9WJ+fogrgz5JisB9zV8ME
 LNSrDLa1Kv270EkDU8tZTqzQjR81d65aHcIcmpzVSwuPUDuK1E7yN27Iy9clnswCWX8K
 ZoAtQzxLCSLZkxyiAfRqcHsyIT3rJR21fPg6W7Hwd7nHaNmgo0OoKhnrs23qMDB7Flee
 zEQWPBxlqWpXnVvtOoEUvULxWdPSVjQebqgCZWmHj8trp8938ROpYHkoN6jt/Y26GmH2
 hGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=4kEgWgHbRpLkO6qJk1qfJXYTlwg9/1nOLKkMOgmQiJc=;
 b=aa6kh3+iDPrKwvtRQcwiIennCsYelViRpFaD+1Ia9cMzXLKcb3qzELCjMlG6RIBz8K
 m2F1URs4+IX4QwhqLsWIKVjWxElWRx2kVx7tdq5OH/b76+fosm2B0smooS3/s8jG2fC/
 3ZA44DnHu5DR9kyzfNAKzc7Y0p9KACUvMWoKG8M1d+wgl73rA0xzETty+nWNZCLNVb8a
 DSSOlUlCwLgnxJx/+cCd6IdIQ0kaQa7CfDQvfKdSaujVGpkmOqy6BlsHzpXiwVDmESSN
 CbRXx4fKlRpwKSOCTBumiFKznvxZBzxBVts+kFZQaCN+Rzjf45h8k22o98zNdPMDQasI
 5yDQ==
X-Gm-Message-State: AOAM530xJiDDi0Ckn7hPR4UU5Vsowd/6zcLKbyhyDGpEOeWxXMc4+VVK
 KP+VjxLWqBeR6jmaYTttoH2XlTFZbuHeI2wsWA==
X-Received: by 2002:a0c:800e:: with SMTP id 14mr49947224qva.92.1594255006971; 
 Wed, 08 Jul 2020 17:36:46 -0700 (PDT)
Date: Wed,  8 Jul 2020 17:36:08 -0700
In-Reply-To: <20200709003608.3834629-1-hskinnemoen@google.com>
Message-Id: <20200709003608.3834629-12-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200709003608.3834629-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH v5 11/11] docs/system: Add Nuvoton machine documentation
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>, 
 "=?UTF-8?q?C=C3=A9dric=20Le=20Goater?=" <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=3nmYGXwsKCIMozrpuultvlunvvnsl.jvtxlt1-hytuvunu1.vyn@flex--hskinnemoen.bounces.google.com;
 helo=mail-qk1-x74a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_OTHER_BAD_TLD=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: GlRyYQcsXa6T

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 docs/system/arm/nuvoton.rst | 92 +++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst  |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 docs/system/arm/nuvoton.rst

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
new file mode 100644
index 0000000000..7384662d58
--- /dev/null
+++ b/docs/system/arm/nuvoton.rst
@@ -0,0 +1,92 @@
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
+Booting a full firmware image requires a Boot ROM specified via the ``-bio=
s``
+option to QEMU. The firmware image should be attached as an MTD drive. Exa=
mple :
+
+.. code-block:: bash
+
+  $ qemu-system-arm -machine quanta-gsj -nographic \
+      -bios npcm7xx_bootrom.bin \
+      -drive file=3Dimage-bmc,if=3Dmtd,bus=3D0,unit=3D0,format=3Draw
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
--=20
2.27.0.383.g050319c2ae-goog

