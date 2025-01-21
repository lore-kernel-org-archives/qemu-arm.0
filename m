Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6494759njn;
        Mon, 20 Jan 2025 23:06:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWaAG2v6TqDfuDULDwK+Y6sqkm5I7mgGQ3607HDDaCbhBP5Tc5/cA1705n6aKmPYs8qW0Z7y0/63ThHSw==@linaro.org
X-Google-Smtp-Source: AGHT+IGJnn+BB+dQ8ORG0kkVEcUYNhQHybI4WmHS8p7vKbMB6HpNPwHXqx8Yl82HMmD23+kaMN1g
X-Received: by 2002:a05:620a:2888:b0:7b6:c695:fb7c with SMTP id af79cd13be357-7be6320c398mr2431441385a.33.1737443192622;
        Mon, 20 Jan 2025 23:06:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737443192; cv=none;
        d=google.com; s=arc-20240605;
        b=Z2MjkGdjyw+fqTraiK1AmtMygu1bvAYAbnPcZVoTaFzgQzj6ZIxN99P2TuUm62gJ8I
         +f9CUTXdZrzLpboG1JNzBp0+y3tIFN1m0DG8Bi0QZaYcQCfTgVaVyHC4GyY0lXoyZhKI
         4jhQYPnGlNaGvf8fzdknEg2jkIxO7tNHaqPUsiZDj95mOifpZJGKwI4WaKWowswPG5/s
         ZYPZYqEm0z9nynhWperWWoy7SyYMLo0H2IkWu6ZbhigBmB00yI9PCl6E6TpIO+L4/BCq
         s2DEiSrWNZN14+3925VcrCp6f89bG3CvjDV1LxnEUnUq1yVUb4/o1VWO1q1shXHbNniZ
         EAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=nidRBpSmIPuIFeFH4qEg5W4YrVNS9vcu0yaC2DEMTFI=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=gSMsJqjjuVWp5udipA2Xkrf4dFB23/uDSgC6iNvtoeIMnb042O6y6BJVUeK1EQ8ZcY
         KE3B9ZGcJ/a+0Q4d60+XTwMb0RziTSQZMVm6O7EFF2WtVYvPWmAychi0mQXow+i6SWOh
         UrGDf3LBZipRWjllbJ/9ElftWEXX8VkK6YEsch7xrMGehhjVlfTTUcIIZ18LPHS3Iony
         HW0hotVx2KN+j9wPSEAzdtJOPx3xmidq9Qab2ZRxc+vtc/Q+HM29e+SAH4cJllEfcsaY
         ApXZZ5CYRGfScXBNfhmDGB2S5tjRP4hXNBttOlJDxcJxpyDNf0hpC/AzI0BCEdPw/BA6
         VKmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e1048a499si107282301cf.495.2025.01.20.23.06.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2025 23:06:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ta8Ji-0006g1-Mm; Tue, 21 Jan 2025 02:04:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8Jd-0006fc-Cg; Tue, 21 Jan 2025 02:04:50 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8JX-0001Q8-8t; Tue, 21 Jan 2025 02:04:48 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 21 Jan
 2025 15:04:25 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 21 Jan 2025 15:04:25 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 02/18] hw/intc/aspeed: Support different memory region ops
Date: Tue, 21 Jan 2025 15:04:08 +0800
Message-ID: <20250121070424.2465942-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
References: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Sd7q9Utvz0jx

The previous implementation set the "aspeed_intc_ops" struct, containing read
and write callbacks, to be used when I/O is performed on the INTC region.
Both "aspeed_intc_read" and "aspeed_intc_write" callback functions were used
for INTC0 (CPU DIE).

To support the INTC1 (I/O DIE) model, introduces a new "reg_ops" class
attribute. This allows setting different memory region operations to support
different INTC models.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/intc/aspeed_intc.c         | 5 ++++-
 include/hw/intc/aspeed_intc.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index df4da759e1..628f69ea88 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -302,7 +302,7 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
     int i;
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_intc_ops, s,
+    memory_region_init_io(&s->iomem, OBJECT(s), aic->reg_ops, s,
                           TYPE_ASPEED_INTC ".regs", ASPEED_INTC_NR_REGS << 2);
 
     sysbus_init_mmio(sbd, &s->iomem);
@@ -319,11 +319,14 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
 static void aspeed_intc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedINTCClass *aic = ASPEED_INTC_CLASS(klass);
 
     dc->desc = "ASPEED INTC Controller";
     dc->realize = aspeed_intc_realize;
     device_class_set_legacy_reset(dc, aspeed_intc_reset);
     dc->vmsd = NULL;
+
+    aic->reg_ops = &aspeed_intc_ops;
 }
 
 static const TypeInfo aspeed_intc_info = {
diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
index 10718ed4a1..9a73661403 100644
--- a/include/hw/intc/aspeed_intc.h
+++ b/include/hw/intc/aspeed_intc.h
@@ -39,6 +39,7 @@ struct AspeedINTCClass {
 
     uint32_t num_lines;
     uint32_t num_ints;
+    const MemoryRegionOps *reg_ops;
 };
 
 #endif /* ASPEED_INTC_H */
-- 
2.34.1

