Received: by 2002:a0c:f8c8:0:0:0:0:0 with SMTP id h8csp1056889qvo;
        Fri, 13 Mar 2020 09:15:29 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vum21TLxYJ6Ti8JmsG1h9wHsPeDveeHb6UEuXkU85N/dKeRTjmnyoGEF1QjbtovIPdgkkjQ
X-Received: by 2002:ac8:3003:: with SMTP id f3mr13141400qte.293.1584116129269;
        Fri, 13 Mar 2020 09:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584116129; cv=none;
        d=google.com; s=arc-20160816;
        b=Sv5YsiUvdCwpt6sdsHOaV8nCN6i7x+t00PjtbR1Ry+kREJliAZ5SXtFSqCdVKQoNqa
         uq5IsyPpd8eKlCa3TO5Ita2XAibKqkAHVoZhkimMamQQ+HLoFH26MJ5FzEv4JMK1MLdr
         6/WzBmtPP2OQnccME/G1i0XHVGWmPCuVGfrCEbfQv16ElQ4NpCGovew46b44IpmFPbJk
         +agM1eniIH7DAcQlhNgSm6fsXjMzFDht8ZN4047H9n91SIbJWZT+IOxtkcroRuFJUnWe
         bKybP34rGifmR0bkc2zpPw7SxVWNaze4UXYrlAsc+WzEnRvvf6Xvr9pNZzaWQYwleeXd
         qwJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=4/hgLoMnGBTI0E1XawADOqDcEXVKIJ4SAjx5/BtrQ2I=;
        b=xXmARWNXRibi3vSkyTowMScbdXUhs/YrAZk6QH7ooDlMYxqgGUnmuv95OLg0BmBCyv
         Ht0ZDvxXfR78BipxXtNVK7lJk1gkVJVUaFsB7lQ3sebhbaYk4ei7XvsvsGXXn0wyUfW3
         nGmpfQ1ikJTWQnEfJDXuk4f9upw2aNM3vApD5LKhUtIHReV4u9fW3EFP7KD3GBTpRNI1
         VElpwoPA9FmPxMD2NVyryFMDCcT+WOQohxAakVTiwrXFIcy21migb7Etcek25qFMG1El
         Xb5bvxDFXiSiVmAP2cjePw9eMSWZprMebO1TCYzMgGMCh0VjqaFO0yXGyKujE6PHDDRa
         VQyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ke7UsC3p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11si1106301qvz.56.2020.03.13.09.15.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 09:15:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ke7UsC3p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCmy8-0005Tz-OS
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 12:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39329)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jCmxw-0005KX-Tg
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 12:15:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jCmxs-0000v5-8g
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 12:15:13 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:41875)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jCmxr-0000lR-BO; Fri, 13 Mar 2020 12:15:12 -0400
Received: by mail-pl1-x643.google.com with SMTP id t14so4469595plr.8;
 Fri, 13 Mar 2020 09:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=4/hgLoMnGBTI0E1XawADOqDcEXVKIJ4SAjx5/BtrQ2I=;
 b=ke7UsC3psEnWX03NTr0pb6sJNdl3iIAxgzwKWrT2W8TjtXXGjYG/RbTYRy2Xa0+666
 sABQtF3d1Ze1ojXn7eUlBHpGJCxOfbIUu15EFm+GunAWhBo1v3ZzTK34tsrlLcWFbySx
 UxGpEB5Vp13kAifKeVVk6HRLS1Jv9kXDYCPE5BOiTut9u6Qxubb7mFP/nuFRpTv6l29f
 lMgwMR6Wkqi6osaCLYK3eMiPpTd3ZZq/qqoVOiG1v5nJE6N1LOrpgxLPkdwX7UuQCkfo
 3YjiHiDQZJTA8JhLpERYGkAAGL48n+0RurqqDYI7QIxGlPVpq8YUj7BTGIZezT80LE/2
 rpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=4/hgLoMnGBTI0E1XawADOqDcEXVKIJ4SAjx5/BtrQ2I=;
 b=ggfwdaGJAZnX1PGs68OdczoItS/XzxFFnQfTCVC3EPWb3+C/vhVAjgK06FpyNa8JiD
 vZWVe+vYMn/6Rz4K8n08VKGwGD/TSRPsLUuzi4LqOvd7GGxLC6Kb2y/R5H8m4Xn6WpKS
 FElxHY5Y0ttwjkYrzMIQ0pjVrRJS+/3EhqFUVb9zXUp8+EB6AC8H2JCG4Swvr0G6A1fR
 CzqQQhLN1CbhakZdndamEMa9vBmATBlMYVKjfQMNU7jonSFyFHDfOUyyK82yOMmilTGK
 MlVSHMZBVIeVwNWMEqgKuneWWkkxFMs92jzb4TANYGmu88FpKZptWehxBNLxaNZtijkD
 K4hg==
X-Gm-Message-State: ANhLgQ3wuGe9XIkVgwTz/sLrF8fUkWUHhJEH6H+t3tVIkCjEfgU8Wnis
 8okl9rujKm6Zc4UFEDR2WSs=
X-Received: by 2002:a17:902:b183:: with SMTP id
 s3mr13928836plr.33.1584116109502; 
 Fri, 13 Mar 2020 09:15:09 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id v12sm3302376pgs.0.2020.03.13.09.15.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 13 Mar 2020 09:15:08 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] hw/arm/fsl-imx7: Instantiate apbh_dma and ocotp as
 unimplemented devices
Date: Fri, 13 Mar 2020 09:15:06 -0700
Message-Id: <20200313161506.8834-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PatxDAsxC6qN

Instantiating apbh_dma and ocotp as unimplemented devices prevents crashes
when booting Linux.

apbh_dma:

[   14.046518] Unhandled fault: external abort on non-linefetch (0x808) at 0xd0852008
[   14.047287] pgd = (ptrval)
[   14.047607] [d0852008] *pgd=8b028811, *pte=33000653, *ppte=33000453
[   14.050074] Internal error: : 808 [#1] SMP ARM
...
[   14.077029] [<c0856530>] (stmp_clear_poll_bit) from [<c0856580>] (stmp_reset_block+0x10/0xb8)
[   14.077642] [<c0856580>] (stmp_reset_block) from [<c1a9655c>] (mxs_dma_probe+0x1f4/0x370)
[   14.078158] [<c1a9655c>] (mxs_dma_probe) from [<c0b6a7e8>] (platform_drv_probe+0x48/0x98)
[   14.078641] [<c0b6a7e8>] (platform_drv_probe) from [<c0b685c4>] (really_probe+0x228/0x2d0)

ocotp:

[   71.286109] Unhandled fault: external abort on non-linefetch (0x008) at 0xd0ff0000
[   71.287891] pgd = (ptrval)
[   71.288449] [d0ff0000] *pgd=8b497811, *pte=30350653, *ppte=30350453
[   71.291389] Internal error: : 8 [#1] SMP ARM
[   71.292302] Modules linked in:
[   71.293583] CPU: 0 PID: 112 Comm: kworker/0:3 Not tainted 5.0.0-10153-g065b6c4c913d-dirty #2
[   71.294148] Hardware name: Freescale i.MX7 Dual (Device Tree)
[   71.296728] Workqueue: events deferred_probe_work_func
[   71.297740] PC is at imx_ocotp_read+0x68/0x180
[   71.298154] LR is at mark_held_locks+0x48/0x74

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/fsl-imx7.c         | 11 +++++++++++
 include/hw/arm/fsl-imx7.h |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 119b281a50..a17136f83c 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -459,6 +459,17 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
      */
     create_unimplemented_device("sdma", FSL_IMX7_SDMA_ADDR, FSL_IMX7_SDMA_SIZE);
 
+    /*
+     * OCOTP
+     */
+    create_unimplemented_device("octop", FSL_IMX7_OCOTP_ADDR,
+                                FSL_IMX7_OCOTP_SIZE);
+
+    /*
+     * APBH_DMA
+     */
+    create_unimplemented_device("apbh_dma", FSL_IMX7_APBH_DMA_ADDR,
+                                FSL_IMX7_APBH_DMA_SIZE);
 
     object_property_set_bool(OBJECT(&s->gpr), true, "realized",
                              &error_abort);
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 706aef2e7e..f9faa16515 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -113,6 +113,9 @@ enum FslIMX7MemoryMap {
     FSL_IMX7_IOMUXC_GPR_ADDR      = 0x30340000,
     FSL_IMX7_IOMUXCn_SIZE         = 0x1000,
 
+    FSL_IMX7_OCOTP_ADDR           = 0x30350000,
+    FSL_IMX7_OCOTP_SIZE           = 0x10000,
+
     FSL_IMX7_ANALOG_ADDR          = 0x30360000,
     FSL_IMX7_SNVS_ADDR            = 0x30370000,
     FSL_IMX7_CCM_ADDR             = 0x30380000,
@@ -177,6 +180,9 @@ enum FslIMX7MemoryMap {
     FSL_IMX7_A7MPCORE_ADDR        = 0x31000000,
     FSL_IMX7_A7MPCORE_DAP_ADDR    = 0x30000000,
 
+    FSL_IMX7_APBH_DMA_ADDR        = 0x33000000,
+    FSL_IMX7_APBH_DMA_SIZE        = 0x2000,
+
     FSL_IMX7_PCIE_REG_ADDR        = 0x33800000,
     FSL_IMX7_PCIE_REG_SIZE        = 16 * 1024,
 
-- 
2.17.1

