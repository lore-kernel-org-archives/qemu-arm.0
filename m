Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2308884lft;
        Wed, 22 Jun 2022 10:33:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1unlB9onf+3Em7kxNfxmBwH2JFfNLAjHALkwvKMGlME0+YzZ6J9yn6+ngg6KenCx/ATgWSZ
X-Received: by 2002:a05:620a:4015:b0:6a7:8025:832f with SMTP id h21-20020a05620a401500b006a78025832fmr3388159qko.140.1655919232876;
        Wed, 22 Jun 2022 10:33:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655919232; cv=none;
        d=google.com; s=arc-20160816;
        b=KlL6ED05fZzzL8mUfQXwJe2hHr0tKV59f9Chm9i9lujcn8VFoA4fCRZDAlAZ/L8O0u
         OZcnIUzzi4RWVcB7lwnR4sgFja1UFAaefzFBTGZlmE+H4usavCnTCzotb/qnIZsSbW1h
         VtxWrPIaHo3ugoozq4YDghIFnc3O27/SK5iSmLSTI9BvYv+faZnLCvpdT4oVv7nmEBUE
         e2pNOyGOM+cyCYq79VKsx9fB5BVfMr35AbS/5R5ZN5UAUAvbWnRodkq5rLeQqtVfK3+k
         Huwli9EIOTGdtzIOdez7jOV3QCr/X3M3EdCF/DEi0kQd8GduZTQzJKf4mIzUqFkVC65p
         K/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=d3soCrva7MA0DDNwGl/WtO+LigrAryj4T4UIwJP9RDQ=;
        b=HkIOSBnEQmXq3tC/9SitEoYjbQa0ggJMZUoN2QU2C1+gQn8OOU8j5cCR4VAgJCGmhx
         h94s9altnxWWnB6RiAwzz6iG7Za5symIC7LHd6RGtc5d/Vn6Bq8TjFZtPRg2OuL0sX61
         zJRcSrnrGF14eObsk0Ib3puAUw3jNi1oExmWjE8vEeHjhAkBsa9TyOfB2Vgs3cB/8Nf0
         Z5KIiCPXGL/nLMev+Wk7VvmrpNgSy/yReegSiuv0K1oqSVx626a/+fEpClgko5QMj4Yo
         u5hLl/z8q+N53trUtGxhx6ApLjuSubzICir4p3p1m5Qb27ZQ7gxZxpgyK377JykGrglL
         phuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=ki7zGZm0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18-20020a05620a281200b006a69b8ab477si14556732qkp.455.2022.06.22.10.33.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 10:33:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=ki7zGZm0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:45024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o44Ei-0004gH-Bv
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 13:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o44AZ-0007Hg-Bc; Wed, 22 Jun 2022 13:29:35 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:23698)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o44AS-0000an-6R; Wed, 22 Jun 2022 13:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655918968; x=1687454968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d3soCrva7MA0DDNwGl/WtO+LigrAryj4T4UIwJP9RDQ=;
 b=ki7zGZm026gE1qy2hOHBVgksi+ks6cE3p17MGkdxoJpgi0HFB03pfeIN
 Lh3iJpZlbmsHTh6HdhrOnjIktarbd9ygtqG2RGCT1CG/QA0qCPaPx0yW7
 UBZhfjXN8vtqOjFZUCrayiJHEZS3p3KgYsR/oC3YVsbQmY6joMBQ5q/wP A=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Jun 2022 10:29:26 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 10:29:26 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 10:29:25 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 22 Jun
 2022 10:29:24 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 7/9] hw/arm/aspeed: firework: Add MAX31785 Fan controllers
Date: Wed, 22 Jun 2022 10:28:28 -0700
Message-ID: <20220622172830.101210-8-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
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
X-TUID: 5o+A4KlT/awM

From: Maheswara Kurapati <quic_mkurapat@quicinc.com>

Firework has two MAX31785 Fan controllers at 0x52, and 0x54. Include them
in the model so that the Linux driver populates the sysfs interface.

Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
---
 hw/arm/aspeed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 85630b497793..08e5fc178a94 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1046,6 +1046,10 @@ static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
 
     /* I2C4 */
     qcom_firework_fru_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x50, 128 * 1024);
+
+    /* I2C-9 Fan Controller (MAX31785) */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x52);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x54);
 }
 
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
-- 
2.25.1

