Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp324695njc;
        Tue, 20 May 2025 00:36:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcMEKczDKEthky3HtN61UAaJi7CEilsp4BJmY2UWNhI5G4K9tyWm7f7tHipm1mNWJz5k8sw34pJSfnVQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFHKTHDhu9mNqbuOucmjnD+nOYph1RVOY86UC6Juo/+cNqGLCBUqgTT2BJ+lI0v8bMiLHi+
X-Received: by 2002:a05:620a:370a:b0:7c5:5e5b:2fdb with SMTP id af79cd13be357-7cd4677d69cmr2633167185a.41.1747726576388;
        Tue, 20 May 2025 00:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747726576; cv=none;
        d=google.com; s=arc-20240605;
        b=DwwxO015EbQx4NDS8X2kTbMAmqOJTfPaC9nY5AyN7mAiTVhoiclcbGvwcU2WXXgIiQ
         i06zfaGRmfDrT8laroWmFQTjzRFoipHFKcgYANhLauDfW0wPo09eDrG8/1xggwk+onpi
         wulEvp0xomFTfifuDTbBMAKodzwNhwqJtPJvz1XRGxySQKJ1jwxV8EMk8VsmcxqUwZbr
         zK3cihE0CJi+d71G6K3J31PFu1Ujj48NwOOCkN4RPo2v3URBVw+fGml38JfI1+pXwh14
         Je47+9zUKFYivsLZVwvu0GSpccEvpssp8dOKgmlQz/xOqi9wnamgEuaJwbgg6JI8KvGc
         w/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=2xvAIXGiVWwYzAk3ZvmY8TKxBVdJAIOg4HYindNbFd4=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=G6pkxaJB/d5wfaYajVyrJXyd9tEIZZq9KBAkVXjHVzcJtlvXxRzMRz/WR3g6wlC6Rt
         1mF7uS+3/saFaHfyNP5FvTkcscsetkgV5yED9QhhsUxwGysBA84LhXvVcbqAPwOBZq0t
         8nS71zMpyse6WdddjRaBJpYvw/9YuqLC6twaXeRJk+VsCvZWHKwQ5cAxBbMYyRdW1aJx
         w8M9i8Rnan+6EPZpq13EkjNeWVFb0XTwl43JLqovi5vh7BKlRQnU8O8WcTKNi1nJXAr/
         bCPZsGGDpitEClCQvK/F8fQqhI5ISkI07FKJjdrZJk4DaK4jm6oqBHTxIWcHMP2abj7H
         AJXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd468ada93si575360885a.339.2025.05.20.00.36.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 May 2025 00:36:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uHHWC-0002g3-08; Tue, 20 May 2025 03:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uHHW3-0002NU-U7; Tue, 20 May 2025 03:36:01 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uHHW2-0003tR-4q; Tue, 20 May 2025 03:35:59 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 May
 2025 15:35:40 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 May 2025 15:35:40 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 2/3] hw/intc/aspeed Fix coding style
Date: Tue, 20 May 2025 15:35:38 +0800
Message-ID: <20250520073540.2014240-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520073540.2014240-1-jamin_lin@aspeedtech.com>
References: <20250520073540.2014240-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 28p46yAA0WrE

Fix coding style issues from checkpatch.pl.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/intc/aspeed_intc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 19f88853d8..5cd786dee6 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -1001,7 +1001,8 @@ static AspeedINTCIRQ aspeed_2700ssp_intcio_irqs[ASPEED_INTC_MAX_INPINS] = {
     {5, 5, 1, R_SSPINT165_EN, R_SSPINT165_STATUS},
 };
 
-static void aspeed_2700ssp_intcio_class_init(ObjectClass *klass, const void *data)
+static void aspeed_2700ssp_intcio_class_init(ObjectClass *klass,
+                                             const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     AspeedINTCClass *aic = ASPEED_INTC_CLASS(klass);
@@ -1069,7 +1070,8 @@ static AspeedINTCIRQ aspeed_2700tsp_intcio_irqs[ASPEED_INTC_MAX_INPINS] = {
     {5, 5, 1, R_TSPINT165_EN, R_TSPINT165_STATUS},
 };
 
-static void aspeed_2700tsp_intcio_class_init(ObjectClass *klass, const void *data)
+static void aspeed_2700tsp_intcio_class_init(ObjectClass *klass,
+                                             const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     AspeedINTCClass *aic = ASPEED_INTC_CLASS(klass);
-- 
2.43.0

