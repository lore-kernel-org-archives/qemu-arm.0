Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp846544dlb;
        Wed, 19 Jun 2024 02:36:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMLCbTFTGezwYxDKgYJwJUhzN0KXSaeA6luSzrzwZJhdRztorHrWq3/0+7amE7n95uXVOXcAZVbcYaMvVNZj1srbXrgtF1
X-Google-Smtp-Source: AGHT+IEEtBlJ3HdqJz2qTdj9zbVGOSRQd/OrPnKP6XajNmhbKkIWZOA0EESB4WJ/FLqnFVat3ijq
X-Received: by 2002:a05:620a:45a0:b0:796:5bdf:3f51 with SMTP id af79cd13be357-79bb3e2dbdemr214598285a.20.1718789765081;
        Wed, 19 Jun 2024 02:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718789765; cv=none;
        d=google.com; s=arc-20160816;
        b=b3lzbQUyMhF8lF/ScikvyuJqMKPa8UnbLHatT9HqqzTWHy8oNia22ukb7dBiMqH8NU
         /qHwlTAdxCivknO4R1wMT7iSCEzBOfEaY3GB8jd1dnZOzWt6OpsFE5zRHKT0FWtYJZBA
         CW8giUyMxI0jBmRala51d4DDw7oQp6CxzYptTaDdsUSSawEZ9ACtR2nHiNxuYlxEklNm
         aK2ChfM0MMu6NP+Au5zAWLb9lO9D8kfhNprTcYTD67sZu092QqGko466UfQF70fODTDG
         v5inHtUBvkDq/zZzgymMeSOzxrETfxI0m/HCljCHD2k+zt1nzIGBDgxYg21C+RHemG6Y
         qo7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=k+OgVFD74iP8u8IvXujxrobtT+cvoAgVHkYsA9hwyXg=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=NQZrRIhUJEruxbihkBovXqZB5vgZwSVqkZAUu3CLgKGwAW4yhpSXEarM3ilI79eXAx
         0JqgwDOqJe0XsF3XB0sbIWUCvKs0s1l2J6eTgRC/9pSVElVbUJDCm1y5RhOboNtKB2n3
         F3ZgPaDpi4VAhxRFRF8VWVCsChXCvtBNAdf/5wuIqpsX6WBYxa8JiUALAtPz7LjrHjJv
         NLYdm/+wGKXhY++K30JpkVcWYWEHabuoZ3UGT+EFz4+9GX3qmbjl9rwRdZyVMFyTendx
         WCxweoeSxx7+RMFd3USY6gKaIMKGlh1kUVIlW/xD4856RH+mRODU5bCXBMUPfNBIB3Nf
         Q+uA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798aac9db02si1421738585a.79.2024.06.19.02.36.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 02:36:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJrix-0000dS-CN; Wed, 19 Jun 2024 05:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sJriv-0000cL-3R; Wed, 19 Jun 2024 05:35:25 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sJrit-0006py-Mp; Wed, 19 Jun 2024 05:35:24 -0400
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 19 Jun
 2024 17:35:09 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 Jun
 2024 17:35:09 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 19 Jun 2024 17:35:09 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 1/2] aspeed/soc: fix coverity issue
Date: Wed, 19 Jun 2024 17:35:07 +0800
Message-ID: <20240619093508.2528537-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240619093508.2528537-1-jamin_lin@aspeedtech.com>
References: <20240619093508.2528537-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 19SpCne9B03I

Fix coverity defect: DIVIDE_BY_ZERO.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index b6876b4862..d14a46df6f 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -211,6 +211,12 @@ static void aspeed_ram_capacity_write(void *opaque, hwaddr addr, uint64_t data,
     ram_size = object_property_get_uint(OBJECT(&s->sdmc), "ram-size",
                                         &error_abort);
 
+    if (!ram_size) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: ram_size is zero",  __func__);
+        return;
+    }
+
     /*
      * Emulate ddr capacity hardware behavior.
      * If writes the data to the address which is beyond the ram size,
-- 
2.34.1

