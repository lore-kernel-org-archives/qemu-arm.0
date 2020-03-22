Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp683763lfi;
        Sun, 22 Mar 2020 14:22:29 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvEWnWGPD/5zhltHRC6V+wT72ewbJogF9HXqvKgX1HhaWLiKsROn759GfZLJDN5CeSvUrvU
X-Received: by 2002:aed:3ed0:: with SMTP id o16mr18382617qtf.3.1584912149419;
        Sun, 22 Mar 2020 14:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584912149; cv=none;
        d=google.com; s=arc-20160816;
        b=dTEPhos/l2Qt9Kz8bg5Nf9YjsCSME8zEYE0+aUo793pWGNEnG/ywWUtR0gZ9ezbqgj
         WQVc1PZ434MI8xXSrlwo7y4cWMIoaHOYEzN668pVwbxKoQYoSIj3XrsQ48UAW0/i/cy0
         Gap/BbtOTG6Yto9s9reWYs46eOOjo9jdk4fJZxHoo0rjzRaOdiv/DImT00EUd4x5v5aK
         Lo8IvOXI+udu3iyixm6l1Zi58ipbcR7wES52uBGlWLO+C9FcQMSLWJTscl+tm3eQyMrU
         JN37M6GEToZjRPQrRidKZB+8MjbT0sBsf+E1QczxfnBuMbDGTXixdTVWEOOe/Joie86S
         ru7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=8hrUyZuUOd4fuzydcZbAphAtvryaQ5y5r6qpUUi+dwg=;
        b=kY2nfvUiQwYl3NubiCykT5ujBI2fGYS12RScLbSHbCvWSF/REaiaIccDfVMjVaizro
         lmS9kSKRJZganj2LYLsenPdbzWa7sMMsmD+G5YwQXzNLfNtLX6fm2Wsf9x0crCaDR20Q
         4EFjOlAIJV45jv0SiB6zVO/Mf6sWAll3/1jMflvQtnNdrGjgiWpTgxVBP7lUr+XiFdck
         CSmexEpRg+K9Fk9bbkz6aG+dM3Ffyfau55BeSwmWEmvfFC0sReUUbYEeUJjjcArd3rKT
         xrXiVUEBxpDIv+TMLRvnkwUJFjMOYK1nZXL5mVavWXyzuaGWvMilrIecd+jaxsEQUx3h
         lRUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SrZilAhJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5si3546166qkm.237.2020.03.22.14.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Mar 2020 14:22:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SrZilAhJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jG83A-0006SR-RV
	for alex.bennee@linaro.org; Sun, 22 Mar 2020 17:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42967)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jG80a-0002xQ-Bv
 for qemu-arm@nongnu.org; Sun, 22 Mar 2020 17:19:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jG80Z-0002qG-0w
 for qemu-arm@nongnu.org; Sun, 22 Mar 2020 17:19:48 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:43855)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jG80Q-0002m2-63; Sun, 22 Mar 2020 17:19:38 -0400
Received: by mail-pg1-x543.google.com with SMTP id u12so6092618pgb.10;
 Sun, 22 Mar 2020 14:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8hrUyZuUOd4fuzydcZbAphAtvryaQ5y5r6qpUUi+dwg=;
 b=SrZilAhJXD8X7npbDGQ1EiuoT7zM7wT05/FhTM02+MwlmnnHhFlnk52IXR4DsjuaOC
 YG55A1HbUq6Z2eTXG0lFUWM+lxQnqwiui1DaIafQIPq6eIM9+06KtSgGVbA2r24GBGf2
 Y+8oRFeiaERtmxI4Ybomkct51hKg5jciV/JLx0jEwRJHkBep2OUxkAgdt8TdfJDGyCs1
 E41sn4FW63U94yKlUg8xeXW6vUxFbmkuPhwRhI8HAXdXOHZhP/u4AS22qPoLdQXvFXfB
 OirzIxcYA3u0VL3RGInxK+lK501+9VziODkZrCvx+udbSsYTaADCGNhf+u66yyUqQgrW
 3E4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=8hrUyZuUOd4fuzydcZbAphAtvryaQ5y5r6qpUUi+dwg=;
 b=Lb0mFP3KaZ5bHLhxG3l1PstAeN6vp1ZeFxBcH/I3ZPfTIjnKQSVaUes7Mbcpp9lPeE
 Kp2zBnNDFFClkJHP3PIpqVRg2h6Q2zqj0UGHU63DPt0v6JjIYM0Y4vtkq6L2ie7Tlqwl
 jqJYGBoAfgbxQlwAoQRU87Lo8MNqcBTbGAUBndv/e/c65TXyfEFs0UFNkf4FCyMVfVIi
 /tSM91b720Movohw1IKF1Kau8FvU33k5FZLhv+DuhTKTKMhGSXcn6Y3c+Swc8v+Gn9g+
 fytnX3cu2vedv4RwiSPf4hC5M6USFWY9MxPflZf6RNFqxeJB7tZhtY/FHYy+Ltp/mSJ8
 +ukg==
X-Gm-Message-State: ANhLgQ0eXDlZehTA1JSIRZ132kB7pXpY2FHvrooWCvp+VgsI9HIWSuUy
 LY9PMtHNSIms6nHdLeIev6o=
X-Received: by 2002:a62:7d11:: with SMTP id y17mr20723291pfc.127.1584911976552; 
 Sun, 22 Mar 2020 14:19:36 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 64sm11493454pfd.48.2020.03.22.14.19.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 22 Mar 2020 14:19:36 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 7/8] hw/arm/fsl-imx7: Instantiate various unimplemented
 devices
Date: Sun, 22 Mar 2020 14:19:18 -0700
Message-Id: <20200322211919.11335-8-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200322211919.11335-1-linux@roeck-us.net>
References: <20200322211919.11335-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6GzeC+sarxH+

Instantiating PWM, CAN, CAAM, and OCOTP devices is necessary to avoid
crashes when booting mainline Linux.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: "octop" -> "ocotp"

 hw/arm/fsl-imx7.c         | 24 ++++++++++++++++++++++++
 include/hw/arm/fsl-imx7.h | 16 ++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 119b281a50..d6cf7c48ce 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -459,6 +459,30 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
      */
     create_unimplemented_device("sdma", FSL_IMX7_SDMA_ADDR, FSL_IMX7_SDMA_SIZE);
 
+    /*
+     * CAAM
+     */
+    create_unimplemented_device("caam", FSL_IMX7_CAAM_ADDR, FSL_IMX7_CAAM_SIZE);
+
+    /*
+     * PWM
+     */
+    create_unimplemented_device("pwm1", FSL_IMX7_PWM1_ADDR, FSL_IMX7_PWMn_SIZE);
+    create_unimplemented_device("pwm2", FSL_IMX7_PWM2_ADDR, FSL_IMX7_PWMn_SIZE);
+    create_unimplemented_device("pwm3", FSL_IMX7_PWM3_ADDR, FSL_IMX7_PWMn_SIZE);
+    create_unimplemented_device("pwm4", FSL_IMX7_PWM4_ADDR, FSL_IMX7_PWMn_SIZE);
+
+    /*
+     * CAN
+     */
+    create_unimplemented_device("can1", FSL_IMX7_CAN1_ADDR, FSL_IMX7_CANn_SIZE);
+    create_unimplemented_device("can2", FSL_IMX7_CAN2_ADDR, FSL_IMX7_CANn_SIZE);
+
+    /*
+     * OCOTP
+     */
+    create_unimplemented_device("ocotp", FSL_IMX7_OCOTP_ADDR,
+                                FSL_IMX7_OCOTP_SIZE);
 
     object_property_set_bool(OBJECT(&s->gpr), true, "realized",
                              &error_abort);
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 3a0041c4c2..47826da2b7 100644
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
@@ -124,11 +127,24 @@ enum FslIMX7MemoryMap {
     FSL_IMX7_ADC2_ADDR            = 0x30620000,
     FSL_IMX7_ADCn_SIZE            = 0x1000,
 
+    FSL_IMX7_PWM1_ADDR            = 0x30660000,
+    FSL_IMX7_PWM2_ADDR            = 0x30670000,
+    FSL_IMX7_PWM3_ADDR            = 0x30680000,
+    FSL_IMX7_PWM4_ADDR            = 0x30690000,
+    FSL_IMX7_PWMn_SIZE            = 0x10000,
+
     FSL_IMX7_PCIE_PHY_ADDR        = 0x306D0000,
     FSL_IMX7_PCIE_PHY_SIZE        = 0x10000,
 
     FSL_IMX7_GPC_ADDR             = 0x303A0000,
 
+    FSL_IMX7_CAAM_ADDR            = 0x30900000,
+    FSL_IMX7_CAAM_SIZE            = 0x40000,
+
+    FSL_IMX7_CAN1_ADDR            = 0x30A00000,
+    FSL_IMX7_CAN2_ADDR            = 0x30A10000,
+    FSL_IMX7_CANn_SIZE            = 0x10000,
+
     FSL_IMX7_I2C1_ADDR            = 0x30A20000,
     FSL_IMX7_I2C2_ADDR            = 0x30A30000,
     FSL_IMX7_I2C3_ADDR            = 0x30A40000,
-- 
2.17.1

