Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2316207lft;
        Wed, 22 Jun 2022 10:41:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uJR9vdodSlBifcGFoMvEarTmTXYPaQb3rCLuiiUZgQ9f4z/YavKWpX80HLj407kP/YdNWR
X-Received: by 2002:a05:620a:125c:b0:6a6:b264:e76a with SMTP id a28-20020a05620a125c00b006a6b264e76amr3282616qkl.188.1655919661992;
        Wed, 22 Jun 2022 10:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655919661; cv=none;
        d=google.com; s=arc-20160816;
        b=DgA7C/iH5GiiDQI6c96wo8MbQugIELC2xMzyZ9MIIbhkK8MUqgZYSWYK/QH3EW+LsR
         hvGkOvuULS1M7sxh4humEWSrmZ/gmkLzdpS11XZCofdmrKajIxdCxS+nMRkfCzSWAPJS
         7rlEObFRQU+sP+s7bs8BYfAzGz/9LwCm5Fw4ohQHO4A3EEV9G4ApPCddtFM8x6ypG5KC
         I3A6ZEfgl28u5b3sg86WZkhXbK1zCgODwZkQHrWp4ugmpnXpSiQMs0sHZS+SGSQwsQ/o
         wQj8kBid6EQZw95+6nh6V6eKnqrPRsM0ViaCuoELyyvUb+s3DNQbAIW5fKAN8YQOLXug
         m8tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NwnfozSIGKJtE3BQEFJgDW9ymGBUWA5fZfbACDdbJPU=;
        b=RUpN7lcGoZGTFb4aynpnRF5JnQwRyJRyMlQpi5cNdhRXs2pWnRp7pF8RVqx9MgzEPp
         i4eXITvfSSLC2WUesZdeJwfGkV65NighFpMXLt6gu99dapXF8eRhXMuTjcwsz9gkWPDC
         w7S54tEYX3tOSSvNQYN+coz26gDc9mLK+9gr3ghW4w4WTNtPFDoQKXlz1wKrUiNQ3Rro
         hEdowYrMVeM5AUXeU5rorCWw0gG29EmvElINEp6t6jOr4wB/WA6evb1p7c9dRA19QQol
         8475P4+QpL6qQvrOw2b6Ugk+Ze3TlQoxy/X5NJU6eniKMrz1okC8gLBPAHRTpxWoiahg
         T35A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=OsNUJP7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8-20020a0562140ac800b0047069af9966si1590739qvi.126.2022.06.22.10.41.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 10:41:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=OsNUJP7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:57356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o44Ld-0005AN-G8
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 13:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o44Gp-0007ng-59; Wed, 22 Jun 2022 13:36:03 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:51970)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o44Gm-0001hO-Ny; Wed, 22 Jun 2022 13:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655919360; x=1687455360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NwnfozSIGKJtE3BQEFJgDW9ymGBUWA5fZfbACDdbJPU=;
 b=OsNUJP7ylOiinGdvqn3iaghfJgzzkz9PTd9lFbykOkwPV3qiauRPOH5p
 dpqJOstodv3rZpf13r/sCiRcnCds51E2vNr1dthGGHkutr7fCQONt87oN
 8hMBrm89vKnLEQm6+//xP7tvznJ2MpL7tF4xDD3HDYbQ0FM2t3aIWWc03 o=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 22 Jun 2022 10:29:50 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 10:29:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 10:29:22 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 22 Jun
 2022 10:29:21 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 3/9] hw/arm/aspeed: qcom-dc-scm-v1: add block backed FRU device
Date: Wed, 22 Jun 2022 10:28:24 -0700
Message-ID: <20220622172830.101210-4-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=129.46.98.28;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out.qualcomm.com
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
X-TUID: y8jxIDqcEOFn

From: Graeme Gregory <quic_ggregory@quicinc.com>

The FRU device uses the index 0 device on bus IF_NONE.

-drive file=$FRU,format=raw,if=none

file must match FRU size of 128k

Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
---
 hw/arm/aspeed.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 785cc543d046..36d6b2c33e48 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -992,17 +992,29 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
      */
 }
 
+static void qcom_dc_scm_fru_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
+{
+    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
+    DeviceState *dev = DEVICE(i2c_dev);
+    /* Use First Index for DC-SCM FRU */
+    DriveInfo *dinfo = drive_get(IF_NONE, 0, 0);
+
+    qdev_prop_set_uint32(dev, "rom-size", rsize);
+
+    if (dinfo) {
+        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
+    }
+
+    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
+}
+
 static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 15), "tmp105", 0x4d);
 
-    uint8_t *eeprom_buf = g_malloc0(128 * 1024);
-    if (eeprom_buf) {
-        smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53,
-                              eeprom_buf);
-    }
+    qcom_dc_scm_fru_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53, 128 * 1024);
 }
 
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
-- 
2.25.1

