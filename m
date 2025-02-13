Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp344819njc;
        Wed, 12 Feb 2025 19:38:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUyvMZzxXhBjsXaAj7PjrD3ImP1zH4XmgEi75/gzWlZpTaUhzj5whxcBFKuJEe3ykP0xRiCC7kUPJVqyw==@linaro.org
X-Google-Smtp-Source: AGHT+IGznhZqmnpuCZmX2m1cK7pRXzT7aCqXGZi7XDumvZzCV73LGFDr3+yj3065QuEPDhr7hIic
X-Received: by 2002:a05:622a:98c:b0:471:79c8:2432 with SMTP id d75a77b69052e-471bee132d0mr28227371cf.42.1739417913676;
        Wed, 12 Feb 2025 19:38:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739417913; cv=none;
        d=google.com; s=arc-20240605;
        b=AffLEiFdROHof0yjYyOb0j4Xae++hpvmeXaa6i5mZFSBVvC2Psl8QLd8kmqXya2xUh
         5EMM+fm7Tz6aMTPXRboLp6osPDLM7tCLIPlH17Famwzng0/4LlhY0O1J7I+hSn1785vH
         XGnY3kKjIgdrc5L1Kfe3ZsB53/XK9oUGILXXRa1vnuFHnNfTRhtRjBJwiniim8s6EimU
         Ys5eGS4N17M5xJnSoSU6b+M8tf1Q1ppg4WL5/PiH7U0tEnpmTfxoEgK7NBHVjrClaZjc
         0PO1sxy6DJSI/QxBfWb62HJQDhVdg8/vrcwHD/FCtstStycDZVUpc3dj7UkiEXs7S9Vz
         RBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=LzbC0RvGVbQy5+bFiVd5/jaLZ2NuQYmm7DfEPauxQaY=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=iyDLCoq6dMV+Giz0uQY2ySvpdwa/q33EgbBOXWuuwVpmgtPbkPhpsL3zMvC4YDtzCC
         8PiKnyMv/klUgJ53TdvDZvqSG5WVTatCiQAHS3jE6VlPFIiLTP2070Y+rhx5EQn7StI1
         zt/Lol+EJUo1/D4gWoj/bptXyIXBRtRRxToi5ZmHGGldBAJeShOP79fs0mfrdbHeq258
         XP6cFNSKXkJJl1dyQt0rnI52dv7YNa/q9dwan+Mywxd/hj5xxJD1mRpftjXWhd79//d6
         0LJB+VwRhKeZQXV2EBAXCSCLQ1qdi71fM1U5738KwNuir6dsaBUiYT9pu1BvJf1lkRvQ
         JmKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471c2b2c030si5661911cf.258.2025.02.12.19.38.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 19:38:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tiQ2S-0000Ni-4B; Wed, 12 Feb 2025 22:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ2J-0008N2-Hk; Wed, 12 Feb 2025 22:37:12 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ2I-0000nL-8j; Wed, 12 Feb 2025 22:37:11 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Feb
 2025 11:35:39 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 13 Feb 2025 11:35:39 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 20/28] hw/misc/aspeed_hace: Add AST2700 support
Date: Thu, 13 Feb 2025 11:35:23 +0800
Message-ID: <20250213033531.3367697-21-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
References: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
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
X-TUID: KHDAyoN+j3L4

Introduce a new ast2700 class to support AST2700.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 hw/misc/aspeed_hace.c         | 20 ++++++++++++++++++++
 include/hw/misc/aspeed_hace.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 18b85081c7..86422cb3be 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -552,12 +552,32 @@ static const TypeInfo aspeed_ast1030_hace_info = {
     .class_init = aspeed_ast1030_hace_class_init,
 };
 
+static void aspeed_ast2700_hace_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedHACEClass *ahc = ASPEED_HACE_CLASS(klass);
+
+    dc->desc = "AST2700 Hash and Crypto Engine";
+
+    ahc->src_mask = 0x7FFFFFFF;
+    ahc->dest_mask = 0x7FFFFFF8;
+    ahc->key_mask = 0x7FFFFFF8;
+    ahc->hash_mask = 0x00147FFF;
+}
+
+static const TypeInfo aspeed_ast2700_hace_info = {
+    .name = TYPE_ASPEED_AST2700_HACE,
+    .parent = TYPE_ASPEED_HACE,
+    .class_init = aspeed_ast2700_hace_class_init,
+};
+
 static void aspeed_hace_register_types(void)
 {
     type_register_static(&aspeed_ast2400_hace_info);
     type_register_static(&aspeed_ast2500_hace_info);
     type_register_static(&aspeed_ast2600_hace_info);
     type_register_static(&aspeed_ast1030_hace_info);
+    type_register_static(&aspeed_ast2700_hace_info);
     type_register_static(&aspeed_hace_info);
 }
 
diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
index 4af9919195..d13fd3da07 100644
--- a/include/hw/misc/aspeed_hace.h
+++ b/include/hw/misc/aspeed_hace.h
@@ -18,6 +18,7 @@
 #define TYPE_ASPEED_AST2500_HACE TYPE_ASPEED_HACE "-ast2500"
 #define TYPE_ASPEED_AST2600_HACE TYPE_ASPEED_HACE "-ast2600"
 #define TYPE_ASPEED_AST1030_HACE TYPE_ASPEED_HACE "-ast1030"
+#define TYPE_ASPEED_AST2700_HACE TYPE_ASPEED_HACE "-ast2700"
 
 OBJECT_DECLARE_TYPE(AspeedHACEState, AspeedHACEClass, ASPEED_HACE)
 
-- 
2.34.1

