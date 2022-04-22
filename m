Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp194409lfk;
        Thu, 21 Apr 2022 22:24:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhcgPi8ReMwnSUWwD6HKEoa/r28Up+VW+hf4K81uyBpfmPudXLMQaxFLJ78iLyYTPQS3Y1
X-Received: by 2002:a05:620a:2410:b0:69f:73d:6e2e with SMTP id d16-20020a05620a241000b0069f073d6e2emr1688279qkn.228.1650605073037;
        Thu, 21 Apr 2022 22:24:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650605073; cv=none;
        d=google.com; s=arc-20160816;
        b=FtXikWBjGpcj6XgEFknuh45VuyVKLzpypwmDEvnnbeVTlLQV6p6xBZxbluvgJkn14X
         4i+DwIE/jeQMNCWGKWw/9hxNsCFSkKS1z17Sd5wKibB8b2DmyMIIWXXFT4N8FDcEcGQX
         x931/FrVKYUQlgw3ENdDgymr8ffE1Ah0/Zah8/jPJtcdGp3eJubEFvNYmV7E0W3Mgwic
         BckXR6ffEwZbfULhTkQtToBXFNfovauh4efV2iDFSKbyn1ZZNjPEHrV0H3bRs7kD15Ga
         jmvp2QnBrb7CBDn/dih0tIv4Bz51Yuqlp/e4SmXN94in6zIa/5wQohgHLx42jUEBHdak
         RQ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=fcFgVdYr9FIsxsYuctMz8i/OKIewpSZvEruVfxl3FAM=;
        b=F4+xe2aUg5+tw6ooSJS+TBzL1UGkyjknGrUSGbU/rQQEKLRA13zQPgrU5VQpGXb7PZ
         1kF7E7s/zw5bcgBgNRkbeN2C/jTHg7XcsfMHmQRS7QIjGE9SkIKPkQ+di3UKGm5mSz9v
         mgNUcNJOfcbJkJyIjtznwjzVCIz5v/0eN+RV695KHLTZh2lB+WApYpyPRhl5slfbyZNN
         MUPQdQWkl3iJHoAJo8o6Bbjxj+M+hSmONsi7NWSVxESf8lo24pGYV6PGQLBEvPCo0pC4
         Juj42Li/UoS/uI2oefreiv0w2uwffZVU6myW5JHaw3ZgauaiZDoqdgQWxknHtHsdpBz/
         w8Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020ac85907000000b002f20573a146si1923123qty.689.2022.04.21.22.24.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 22:24:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhlmS-0008IJ-IR
	for alex.bennee@linaro.org; Fri, 22 Apr 2022 01:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nhli9-0002L9-S9; Fri, 22 Apr 2022 01:20:05 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:39732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nhli7-0002ai-PG; Fri, 22 Apr 2022 01:20:05 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 23M56xe0058496;
 Fri, 22 Apr 2022 13:06:59 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 22 Apr
 2022 13:19:10 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v5 1/3] aspeed/hace: Support HMAC Key Buffer register.
Date: Fri, 22 Apr 2022 13:19:07 +0800
Message-ID: <20220422051909.27540-2-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220422051909.27540-1-steven_lee@aspeedtech.com>
References: <20220422051909.27540-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 23M56xe0058496
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=steven_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Me0lUoYvU6bq

Support HACE28: Hash HMAC Key Buffer Base Address Register.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_hace.c         | 7 +++++++
 include/hw/misc/aspeed_hace.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 10f00e65f4..59fe5bfca2 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -27,6 +27,7 @@
 
 #define R_HASH_SRC      (0x20 / 4)
 #define R_HASH_DEST     (0x24 / 4)
+#define R_HASH_KEY_BUFF (0x28 / 4)
 #define R_HASH_SRC_LEN  (0x2c / 4)
 
 #define R_HASH_CMD      (0x30 / 4)
@@ -210,6 +211,9 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
     case R_HASH_DEST:
         data &= ahc->dest_mask;
         break;
+    case R_HASH_KEY_BUFF:
+        data &= ahc->key_mask;
+        break;
     case R_HASH_SRC_LEN:
         data &= 0x0FFFFFFF;
         break;
@@ -333,6 +337,7 @@ static void aspeed_ast2400_hace_class_init(ObjectClass *klass, void *data)
 
     ahc->src_mask = 0x0FFFFFFF;
     ahc->dest_mask = 0x0FFFFFF8;
+    ahc->key_mask = 0x0FFFFFC0;
     ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
 }
 
@@ -351,6 +356,7 @@ static void aspeed_ast2500_hace_class_init(ObjectClass *klass, void *data)
 
     ahc->src_mask = 0x3fffffff;
     ahc->dest_mask = 0x3ffffff8;
+    ahc->key_mask = 0x3FFFFFC0;
     ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
 }
 
@@ -369,6 +375,7 @@ static void aspeed_ast2600_hace_class_init(ObjectClass *klass, void *data)
 
     ahc->src_mask = 0x7FFFFFFF;
     ahc->dest_mask = 0x7FFFFFF8;
+    ahc->key_mask = 0x7FFFFFF8;
     ahc->hash_mask = 0x00147FFF;
 }
 
diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
index 94d5ada95f..2242945eb4 100644
--- a/include/hw/misc/aspeed_hace.h
+++ b/include/hw/misc/aspeed_hace.h
@@ -37,6 +37,7 @@ struct AspeedHACEClass {
 
     uint32_t src_mask;
     uint32_t dest_mask;
+    uint32_t key_mask;
     uint32_t hash_mask;
 };
 
-- 
2.17.1

