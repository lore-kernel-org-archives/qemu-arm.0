Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2147142lfm;
        Thu, 16 Jul 2020 23:08:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHDoF7X5TUfifyXuwEwqfiKWPSruNOz3IbeZEIJhVpEVIVlEqkxSAVN5QF0anAKSyE9Vic
X-Received: by 2002:a25:2557:: with SMTP id l84mr12082682ybl.404.1594966103237;
        Thu, 16 Jul 2020 23:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594966103; cv=none;
        d=google.com; s=arc-20160816;
        b=hmKPJHstybWLN+TnAXynBtxJPJj09KjedqcpOzyME3UJiEkeeY2GH2FikhukHUYIjz
         WDVVXZTVQLVXKugBubrzRFnXZoaqkLNTHybB4Sfj7krDQVVzxAsM66ketECY6B4AhkNA
         2o5dSGIiyuq7OPV/YkjGR5ZbmK657/lv3n5I9G3b3IRp6O9fegR4yhKuXsECOoy+6TOj
         BM7DeUOyUxyJlebuY5Gs8SfRm04JVTha4NgYD7ipq76Id6cOkfYdaugkhpVLFo1Pe/wb
         CJ99Q2fpOb9wqx3dTEJry/NUi7Sk3UB/2pkdeIGY6rjVOyXatXvp6tIbxIWShrb8DUl7
         irPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=WJHL2RP44qCbss7g+JVirS3Ai2qR2QDTEKM2FUYBsXc=;
        b=hqE+A3A75iy1LLF0Ebv/Cp+UmlUAhvadRiX0CwFTrfpneuvohmtJZiaJTo/9ffALLf
         /NTAtP1NPB2BLTss0DMtWbbImL0tjSboqoJCFRmExEiYsTOEKP0cDX2PdesMIHzps0wB
         uGPTIcmHLUa6jgKgFa83jUu9euBgvjCwSbdF092SZs7kVn7o0qWVBDIyGjPEtWeFq55V
         wxDO7dCxYNtfhBXAO3xRGimukIP4uUgbCYC3H7wLSCUiW/7JztQhwKm7iAwQPjpLV1Wt
         GkOdC5mqQzomuMeAI72+CDDvQVoWbmmCZ+NzzT9TEMlXBOirZ8guISwqYtrj5RsKAyzA
         29vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=rPSTAZEE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 144si7694122ybn.444.2020.07.16.23.08.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jul 2020 23:08:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=rPSTAZEE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:51604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jwJXi-0003c4-Iq
	for alex.bennee@linaro.org; Fri, 17 Jul 2020 02:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3OD8RXwsKCPkitljoofnpfohpphmf.dpnrfnv-bsnopohov.psh@flex--hskinnemoen.bounces.google.com>)
 id 1jwJTA-0003vy-BP
 for qemu-arm@nongnu.org; Fri, 17 Jul 2020 02:03:40 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:46924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3OD8RXwsKCPkitljoofnpfohpphmf.dpnrfnv-bsnopohov.psh@flex--hskinnemoen.bounces.google.com>)
 id 1jwJT8-0005Jw-4X
 for qemu-arm@nongnu.org; Fri, 17 Jul 2020 02:03:39 -0400
Received: by mail-pf1-x44a.google.com with SMTP id e80so6177420pfh.13
 for <qemu-arm@nongnu.org>; Thu, 16 Jul 2020 23:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=WJHL2RP44qCbss7g+JVirS3Ai2qR2QDTEKM2FUYBsXc=;
 b=rPSTAZEEnJFFlS9nxAmAJbo2rnYRy805xv0Vmxg0h56mLiD9Y2rSI/5T5NK0C3Tx/k
 F4bHAc3HzCrriaKBmsKkyyz2bTgDT2YUp8bZOlSqta2gMtpNaTRuqqm3V3MuNJ/+WzXL
 qNwW932hkJ/P57oLpwSyVdFcbwskJ+41JL2NCW+qMPv+2p+BfDztHzF/OeKYHk5bxt/o
 dEri+Uk3lxVd0bnTUaf3mdp20DgpKzg4TngTPTSYV4BdlxOdkbbeKvlTFiZhYCMvgpQN
 XXtuzdG+5K+Dm4qvE9eNlmkMJKT4swZ+/VTYYoYdXTI8g9yONg7xSv8y3IsNwSkyfFEz
 R7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=WJHL2RP44qCbss7g+JVirS3Ai2qR2QDTEKM2FUYBsXc=;
 b=aqm7JdnPhvvLoXOo0YhqTg88DVDxEIE24kxTjIEeMEalCzRYvYiHRc4iI24wzUFv2I
 3xhvcD8/cDrXE4ThZqpalyejqy7v+fZcFkPayIU1bQHSrygDQh4uxj3ow3S1lD+U1lQV
 SxB6fApyjxR7h67Ikrc+wVoKkMVBWpZ0J3ap5KHl4qb3d98I/syEyPsQzp1qZePXe7+h
 E58Nfh+28oTSSEF7kfcehr2BQ6AW+Wy+hwp/sAvVa2Sg03MVVyIJINRCQtoWOnfAT6dV
 b98Pe/NEuVfRfbjb3kl4OdBoi6TeWXzSetxpE2NEuafg6yJWQGvQgsEb26lQw9hg9aTY
 nwhw==
X-Gm-Message-State: AOAM5308aVtnEm/2t9K8nuuMBl07rwqMAmQRIcbE6zP+xmUVFCWQW3IU
 12C1Gg8hzsY2M7ku+z9rmxrLJaLmUaxdlbb9NA==
X-Received: by 2002:a63:135b:: with SMTP id 27mr7564767pgt.37.1594965816178;
 Thu, 16 Jul 2020 23:03:36 -0700 (PDT)
Date: Thu, 16 Jul 2020 23:02:57 -0700
In-Reply-To: <20200717060258.1602319-1-hskinnemoen@google.com>
Message-Id: <20200717060258.1602319-13-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200717060258.1602319-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH v6 12/13] docs/system: Add Nuvoton machine documentation
From: Havard Skinnemoen <hskinnemoen@google.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 Havard Skinnemoen <hskinnemoen@google.com>, 
 "=?UTF-8?q?C=C3=A9dric=20Le=20Goater?=" <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3OD8RXwsKCPkitljoofnpfohpphmf.dpnrfnv-bsnopohov.psh@flex--hskinnemoen.bounces.google.com;
 helo=mail-pf1-x44a.google.com
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
X-TUID: dIPEN/yp0+4b

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
2.28.0.rc0.105.gf9edc3c819-goog

