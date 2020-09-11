Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1942080lfq;
        Thu, 10 Sep 2020 22:26:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxApiJQXuKsHTLS1LfCY1Nn8kvkrQf4KTntVjxLZk6+ackypv3Lbmu4y0drTOJnBRrXukV4
X-Received: by 2002:a25:32cb:: with SMTP id y194mr166153yby.464.1599801961359;
        Thu, 10 Sep 2020 22:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599801961; cv=none;
        d=google.com; s=arc-20160816;
        b=ggOEPDypGdhxDljKxpfHz5KUkmHoZVvbk23EuApsV6sbojPT+0nvE/Zhy5xb7xYbi0
         r0KdX0zmzYnGZ1IMIM146lxLIClDtVTckRg6gwEWp1mgE/XOi9DFwYPRT0ZV9bjDwX4H
         tuX6PeF9qTuwrx3Rmrwm+T8j32NN5uYjlf8MrTacmYHGZIJ6pMgQcp9Bl2e8Wpl23R0x
         ZN4hywA9Ndiff0X0pH93roT56ksyH7UFx6arVEQ5t6lTacgo8ZIzfx0uiYwPgMjCoxzV
         UfTcxFv1KvsXxaJzCwd3k/wh9CQ4P+AokN/AnE9VcBOzDTGZzwR1T6sADtZj6yaMTEqO
         H7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:subject:references:mime-version
         :message-id:in-reply-to:date:dkim-signature;
        bh=liTapuC83RP7pRfq/k3FrIdgT8TxzNl6M4ltibeisdU=;
        b=i1BwrdaoUwPGeNdftRmLE1yhX4CCHXFhp/T96PKTocgg3cW2StJa7XECUWVSsRbmAK
         ATAJBXkOQxecQC3LAkqEoI8Blvu3JUTzpf4N+RNKNXKpYVn2fXuniTa69E3V+JcSn8tQ
         qsjvA1wfa30dhW6zOVlzjvFsThotKGxgu2Dhm4AjpQ/7UpB2/jmrchFUfm71kyxTIBDR
         exdHGXKeqW0oBcCLIgxbvjcMHR1pUMyfP0n6nMs5/rjKxOepP6SCuh4P6bC+5Kq5JO5M
         Q8NJXtRyBgpsVMZdXW8qOn04+PgkuI2DNAba5gTAml8bLrZHO9IzAvdpFlwLDddSKuAn
         kX8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=bcJdW7xJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si1264845ybj.424.2020.09.10.22.26.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 22:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=bcJdW7xJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGbZQ-0006um-NH
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 01:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3XQlbXwsKCNwFQIGLLCKMCLEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--hskinnemoen.bounces.google.com>)
 id 1kGbVD-00070c-27
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 01:21:39 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:43630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3XQlbXwsKCNwFQIGLLCKMCLEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--hskinnemoen.bounces.google.com>)
 id 1kGbV9-0002Ps-4e
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 01:21:38 -0400
Received: by mail-pf1-x449.google.com with SMTP id c190so6159169pfa.10
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2020 22:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc:content-transfer-encoding;
 bh=liTapuC83RP7pRfq/k3FrIdgT8TxzNl6M4ltibeisdU=;
 b=bcJdW7xJUy+m3oSHF3SJ7VO5xMfA0Bny3++0b3F9WTANgE1n6sDrHEtTmSIzRqraNQ
 cpqm/lJO6s8aI0jCZVX/m4XzXOdM9gC66Y8/9D8ATt4p3AVC04NP21swjrvb+ugyxZf2
 hM/Amzp+c0UC+47y+imbD8DYdHkRKoBvG3OVo17ooBS2qgA4OHxNo5XJ1ONYublY45gI
 dsV4G0Z6T5e7wLA4Sp58eBjdTHKF93YuhftTx2cVdDGwLgJ8PBry6iIFaZPlIHzCgfM8
 NmoAIiLXMRtyxZHXog3oylOOaLzuUQEs+S35qRIjYtAlf0r154K14NQygrFjMFl9sH+q
 O4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=liTapuC83RP7pRfq/k3FrIdgT8TxzNl6M4ltibeisdU=;
 b=Aw79bkDR6wwK+D6n9C74wipDkw0gVzIo3v6UCvIoll5keBwC8BuYuqZ4FsMnTMLQW1
 VkapnJPg60PCrHHT1UkSupkm0zKSNYZyW+juZMPCLxzm2TvfJhJdhvJU+0WAS7+D8Jx3
 mrFspKy0gDiyL+Kq2VJ4tZ8BkIpGE4YBZPlRdfqIO41T77gjTPObjk30fpVl8xE4GWT0
 2nrobFD/mXwYkF/+I1jg6WMCiGjpRpp1cjk6Owd97q3auVWG3Rq2DCKOmTlypmxWZNPa
 KZbK04hKMCJEVCx9/aox4dWpgFOeoHPwcXhCvFimiMKDMKMfadCK3vYlyydympsO3sx1
 HdEA==
X-Gm-Message-State: AOAM532fJSJQL2/z+7j2tUA2zHwR5KQv+NSI4emMdqAjhRw6VsCk6LZy
 /cBEI9En3R5O3+aeZdgT2N71WPuZ0pwO5vIHMA==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by
 2002:a17:902:c3d2:b029:d1:9bc8:15f8 with
 SMTP id j18-20020a170902c3d2b02900d19bc815f8mr577506plj.29.1599801693439;
 Thu, 10 Sep 2020 22:21:33 -0700 (PDT)
Date: Thu, 10 Sep 2020 22:21:00 -0700
In-Reply-To: <20200911052101.2602693-1-hskinnemoen@google.com>
Message-Id: <20200911052101.2602693-14-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200911052101.2602693-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH v9 13/14] docs/system: Add Nuvoton machine documentation
To: peter.maydell@linaro.org, f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>, 
 "=?UTF-8?q?C=C3=A9dric=20Le=20Goater?=" <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3XQlbXwsKCNwFQIGLLCKMCLEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--hskinnemoen.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01,
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
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-arm@nongnu.org>
X-TUID: AAKdKxvpWmvN

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 docs/system/arm/nuvoton.rst | 92 +++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst  |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 docs/system/arm/nuvoton.rst

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
new file mode 100644
index 0000000000..e3e1a3a3a7
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
+The firmware image should be attached as an MTD drive. Example :
+
+.. code-block:: bash
+
+  $ qemu-system-arm -machine quanta-gsj -nographic \
+      -drive file=3Dimage-bmc,if=3Dmtd,bus=3D0,unit=3D0,format=3Draw
+
+The default root password for test images is usually ``0penBmc``.
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index afdb37e738..fdcf25c237 100644
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
2.28.0.526.ge36021eeef-goog

