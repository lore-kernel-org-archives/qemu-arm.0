Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp900412lfc;
        Sat, 14 Mar 2020 10:31:43 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuDwaq8lWqMxAqRvKb6tmFpfLj5eo9iIPQAlE9fwdKwQkKDCtmNSq66IoIPHR8+gNghh2UR
X-Received: by 2002:ae9:ed4a:: with SMTP id c71mr18036136qkg.418.1584207103240;
        Sat, 14 Mar 2020 10:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584207103; cv=none;
        d=google.com; s=arc-20160816;
        b=imI5e/aHbS52hrKui/dTp4smeio12/b9Xy72kH6aFPNfhD1gv7INE0rm1WFiRqUFyw
         aAX2ztlKkRHpHWTx9zTHo8rqpM16Sh7Z+ZWo0KQDbAWh7ikg+aDzbZfpH1dAf8DGbMJR
         wnq0Oi4tZTd3crK8Zy9qU/hUJ3XIpZSvJvqF+kquGoGz1lexMoQ+wzip5yTc2JSqkqMq
         2BGU7hRRURcz11DSo60puVy987cyeZGJBeQjs8op0s7UjrgNYHu16t5y57KSLixIf6ij
         YP7kbqRtdHaRJCo4tmWrxQPIXRsbEIS9GIenlqZKNpsxFww8Bzt3J0SKRda8zWqvBLgf
         xMeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=2n/COS3qYgLsHbDGJU6WOfdiW+A/GtOTi3uv6vUIC3g=;
        b=XjWlbd9PJGHr5fvduKm8Hao0fAFhZ4URa+fB7CmcozwkjlGbomKiX8a8sD6rx7N6Wf
         c9GmGYh67zUaOO4iTNJN6aAD315Ne4cPaqayyJmhIwT9dfN5EYC3X1r9va7RJ7neeGTe
         qocYSoTRCTLIHl8u0g59GxU2b0wxB59Vde/PeNE/h3oqg0xsk+N4Yj/jv5Ig7Y5PlCB6
         qo3mkOvsnWHmQnJPcrVg5ufbLC9BtkT0RQ11qIO6LVAqH37unsEste3otpI4IkpV8sp1
         BkykyxvTtWOkido7n+Fkv42xKF68DQbMA+evSGO9HPVEilv5WDugRUSAZG+hPpEviDYE
         cDQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AoySPURP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk17si6864075qvb.219.2020.03.14.10.31.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Mar 2020 10:31:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AoySPURP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jDAdS-0006PY-KX
	for alex.bennee@linaro.org; Sat, 14 Mar 2020 13:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43142)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jDAZl-00089E-GI
 for qemu-arm@nongnu.org; Sat, 14 Mar 2020 13:27:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jDAZk-0006Fh-Cq
 for qemu-arm@nongnu.org; Sat, 14 Mar 2020 13:27:53 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:46700)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jDAZh-00061R-VS; Sat, 14 Mar 2020 13:27:50 -0400
Received: by mail-pf1-x444.google.com with SMTP id c19so7217362pfo.13;
 Sat, 14 Mar 2020 10:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2n/COS3qYgLsHbDGJU6WOfdiW+A/GtOTi3uv6vUIC3g=;
 b=AoySPURPuyVp2LwWXvkOn2cxOBeeTh6zfa6lXZOsVNCagJDUg7XRbSGlxYfPNr28Fj
 edKcVq40zFd1SRhRy5J5/X67SEPROC9LWyPKmQd5a352cILk31JgAyTOwKZzPIic9/WA
 v3GB+ScypneSOBGBdwI0ZxarqsjOZoIu4AMc0fT3JGV0KYkcdjbtMh4TrzAjzIAqCTsp
 GMtgZ6WoELZap5xp/saBu89aA0PfMkL5EhkZ9wWgtztiVWEu1+MoZgfka/ATHQDUlQ8y
 XJcN9Pk/ICFwnwSvk4/FTsRzHac+eKVeXMK49fma7viqguBORKjJrorfu+5dHc0WKdZ2
 0e1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=2n/COS3qYgLsHbDGJU6WOfdiW+A/GtOTi3uv6vUIC3g=;
 b=U48AjTZSCRvuYAUeG861bbeb6UTuyVBcOe7mtd2GloZd5gD7NdWQZ4MAPEzbE0QTry
 vm3+MbEa01qLIBIzsXhFqiDn6jXLhspcn1ChQzMIhM02BUyJwR2vYCwHXGHc42qER++r
 Rdf8hF7sa2XhZu5yrARsjPH/U1CQERqKLi/xFh0l3/F6SFZ0Ux8lUnFRrqV4+BMl0GxJ
 hORnP3+U40mjPzwRue56pCNPjpsTEqEGcLpzq2Nva3SA/FtcN2O/WQ1Ozgxxbv/Qdson
 d2ic1g18UQzx6R+EOCtXLSPvfnti4612UdXHl/VJqgqMoXKb9Bk8b13uYAC0iyx/b3Kx
 cw6Q==
X-Gm-Message-State: ANhLgQ09MYwUjeMtpnERlgQ/BoWw69MbeTyuEd4agXIuqkCCkDYNCDSf
 BBnHS1fd7GEOu7/rmzmiidI=
X-Received: by 2002:a62:447:: with SMTP id 68mr19788701pfe.174.1584206869187; 
 Sat, 14 Mar 2020 10:27:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id k8sm25559727pfk.1.2020.03.14.10.27.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Mar 2020 10:27:48 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 7/8] hw/arm/fsl-imx7: Instantiate various unimplemented devices
Date: Sat, 14 Mar 2020 10:27:35 -0700
Message-Id: <20200314172736.24528-8-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200314172736.24528-1-linux@roeck-us.net>
References: <20200314172736.24528-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
X-TUID: DWUPkAHl4/8C

Instantiating PWM, CAN, CAAM, and OCOTP devices is necessary to avoid
crashes when booting mainline Linux.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/fsl-imx7.c         | 24 ++++++++++++++++++++++++
 include/hw/arm/fsl-imx7.h | 16 ++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 119b281a50..29382776b2 100644
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
+    create_unimplemented_device("octop", FSL_IMX7_OCOTP_ADDR,
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

