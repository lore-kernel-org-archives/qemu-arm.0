Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2475977lft;
        Mon, 27 Jun 2022 08:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v/oBRldWPyea7IrUJcpQOSm1jYjcSUiAyFtDaW6/mW5jfKJrD0+uDD3mAADdALygmmXp0p
X-Received: by 2002:a05:6214:e47:b0:470:4894:730b with SMTP id o7-20020a0562140e4700b004704894730bmr9484044qvc.69.1656344938573;
        Mon, 27 Jun 2022 08:48:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656344938; cv=none;
        d=google.com; s=arc-20160816;
        b=N2X770bq7U6OIrKmMzvLUMWnjeelZu+h1X3ASHTfWBTVKCqQJ/D6xBN5adfOl7S14y
         4so5S9VD1cTgnkNYD6ieJuYyD24RiW2p/PBkjFqSkaoqXwyqDBAZzL1vGkkK9ytdrtfc
         eCMxRDauh3qhOjVwUGY0e3gzLstCBA99VO+uQ1Ps4GdHl01Tp6hjF0HeDiZyPFk3PVBP
         DB7XgKEvzuLYsxQiacOf5tS4sxuvLQD1JVbgU/8I4DfFWv0PZblrmPYZ0DFnO7NxAs6a
         Sd4Vow7t0mc1xnbpoSlp0bQQgDiJ6S+I1y/9Wf8Vhod774QIEopi7cv1am9yOBKzrZoG
         ZJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vdIIQ9ElArb+NfOpDKz5lfW+JLjfm9DYtGhd+ys4DbQ=;
        b=tZQMncz5hb/q6x1jeVj3bKZvXNh8FpNw7n1hPmA1ZuZq7mMH3yW5vUDhL+wzb+R6Q4
         wFuILXqPdH+2pL/IgFWLEppS2zMeNYWlQtxmY3K0qymxeXHwfXObXif2oiD3A4xsqStR
         MyShy2z7FY8s++67wlivlnqaRoqOZmnavhkXOfJGrODLa7NWPrVE31EHdZRoqB13qBw3
         rMNhTKltDzxQ+L4qStya8sJXJ5YoSm6i5pxvZ+oq6TlDo8pmX57ScXU8bGPQGzV7od7r
         lsxq8QrO2JuYIWy+7QDOrITHTt1x/NzWMI5iBHh2adcK3aXzKe4VtcGiJlqJw0skTm6C
         7Axg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b="AjrV/MgF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020a0562140dcd00b0045a87e02026si5833372qvt.364.2022.06.27.08.48.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 08:48:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b="AjrV/MgF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:54178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5qyw-0002DH-1r
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 11:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o5qxn-0001RR-Od; Mon, 27 Jun 2022 11:47:47 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:52583)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o5qxl-0005ej-2y; Mon, 27 Jun 2022 11:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656344865; x=1687880865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vdIIQ9ElArb+NfOpDKz5lfW+JLjfm9DYtGhd+ys4DbQ=;
 b=AjrV/MgFRq+vWhopOxESIUZgkSbN9FxiDc989s2u4v+8FdDIFz1wmaLd
 zm7rp2GXplHC+I6T163KaR8XFVg1A/8Xn4xiKXDYS+qrEGJAOgl11K6Ue
 1/0oyphUmi0ghhRIv9ME4QkT0fj0/KrWatmmPCFBVAAZtrhCVoFpO1vrs 4=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Jun 2022 08:47:41 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 08:47:40 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 08:47:40 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 27 Jun
 2022 08:47:38 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Patrick Venture <venture@google.com>, Hao Wu
 <wuhaotsh@google.com>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 5/7] hw/arm/aspeed: Add MAX31785 Fan controllers
Date: Mon, 27 Jun 2022 08:47:01 -0700
Message-ID: <20220627154703.148943-6-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
References: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: z49LrNmUJg3y

From: Maheswara Kurapati <quic_mkurapat@quicinc.com>

Add MAX31785 fan controllers in machines so that the Linux driver
populates the sysfs interface.

Firework has two MAX31785 Fan controllers at 0x52, and 0x54 on bus 9.
Witherspoon has one at 0x52 on bus 3.
Rainier has one at 0x52 on bus 7.

Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
Changes in v2:
* Added PMBUS and MAX31785 config selection under ASPEED_SOC. (Titus)
* Moved machine updating part from the previous patch. (Cedric)

 hw/arm/Kconfig  | 2 ++
 hw/arm/aspeed.c | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 219262a8da36..15fa79afd33a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -455,6 +455,8 @@ config ASPEED_SOC
     select EMC141X
     select UNIMP
     select LED
+    select PMBUS
+    select MAX31785
 
 config MPS2
     bool
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 342cf39c9747..9c07db70f2fc 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -619,7 +619,6 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
     LEDState *led;
 
     /* Bus 3: TODO bmp280@77 */
-    /* Bus 3: TODO max31785@52 */
     dev = DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
     qdev_prop_set_string(dev, "description", "pca1");
     i2c_slave_realize_and_unref(I2C_SLAVE(dev),
@@ -635,6 +634,7 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
                               qdev_get_gpio_in(DEVICE(led), 0));
     }
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "dps310", 0x76);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "max31785", 0x52);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "tmp423", 0x4c);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), "tmp423", 0x4c);
 
@@ -779,13 +779,13 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
     create_pca9552(soc, 7, 0x31);
     create_pca9552(soc, 7, 0x32);
     create_pca9552(soc, 7, 0x33);
-    /* Bus 7: TODO max31785@52 */
     create_pca9552(soc, 7, 0x60);
     create_pca9552(soc, 7, 0x61);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "dps310", 0x76);
     /* Bus 7: TODO si7021-a20@20 */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP105,
                      0x48);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "max31785", 0x52);
     aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50, 64 * KiB);
     aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x51, 64 * KiB);
 
@@ -1007,6 +1007,10 @@ static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
     qcom_dc_scm_bmc_i2c_init(bmc);
 
     /* Now create the Firework specific hardware */
+
+    /* I2C9 Fan Controller (MAX31785) */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x52);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x54);
 }
 
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
-- 
2.25.1

