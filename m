Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp58553njg;
        Mon, 24 Feb 2025 23:57:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV7wlt7+8+q1oMbr2KaGFyOJCAmQM6zHTcjK2inmS2rEyVVmbc6GyI5PHO5rNsHTykfh1HSAg7agRWVJA==@linaro.org
X-Google-Smtp-Source: AGHT+IFb6h07XwE+mGc2+20m8Y7WVAA4GX3yiD4UdXb4KcA7Udyd8neWQP6zEJTU8YSwnqPrFrZJ
X-Received: by 2002:ac8:5f87:0:b0:472:f4c:e880 with SMTP id d75a77b69052e-472249203camr230999531cf.49.1740470253446;
        Mon, 24 Feb 2025 23:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740470253; cv=none;
        d=google.com; s=arc-20240605;
        b=MprD2dX8WNEghfvrbjYySC63MPk6TVCSu7n9E8YjN6Aq6ceYyXMz6dsBTRuTtnXI8S
         /n5RemOTBNQWJI4smafDhFpYc5g10hGzQ5E31DSFIWihmjom427tNjZC33p9hxO+Zmj9
         COnoQKyhhuBOge8MlyG1INTJuaRHMNfy95YcX8AymLVur1J+Nfu1eAHv+OpiKiZuZRyr
         NpDQ3kkh0DL7ln4Z1rVNO7+8hMHtM7FQgUcIdwFVhVumUmmrIIvtkcH9lTWngfEFgs6w
         z7R21FvtAQXiMy/I68FpksNU+ATkZ+6yP5IpCiIhYnHKN90nb9gUv/7kFADuX3fcrVnk
         jzLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=WpMENSystZbEVUX7tgUMt9QUdAv8f53IsTRwoXWLyVU=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=AX6jqoHQFfIjHJqilW0aQYxxn/1x3YBCWo1u2uT/ytr5+7NnEsXh5xss52yL3x8NfU
         XjlYgM2CFhJNEzLLTXr+ELvNbLXhFwX06tmx10mxUsoULzmO30RyQFVV81WKSJSxZ9XH
         X+mpnIf3jwi/wkqo5HwW5EaA3EMPjew4ExRA4vAOVtmbllbifqPIeLXlfFiVM2EzegiE
         LhuzUOmSWFkRv3NHZ8sDsv3CHMPuldnOcENZWm+nwpHUJBKelNFhGSvBD5om8T6pc3gW
         wk7Eeb4rw5Hu9bYuJPIqmKCFi59gb3JV8NtmeWE9mcI2kpVbxSj5h/iYCk4+VbErc3MH
         z8xA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-473780a7ae6si9574741cf.528.2025.02.24.23.57.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2025 23:57:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tmpoG-000144-7D; Tue, 25 Feb 2025 02:56:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tmpo6-00012I-Gj; Tue, 25 Feb 2025 02:56:48 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tmpo4-0001io-T9; Tue, 25 Feb 2025 02:56:46 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 25 Feb
 2025 15:56:22 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 25 Feb 2025 15:56:22 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v4 2/4] hw/misc/aspeed_hace: Add AST2700 support
Date: Tue, 25 Feb 2025 15:56:19 +0800
Message-ID: <20250225075622.305515-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225075622.305515-1-jamin_lin@aspeedtech.com>
References: <20250225075622.305515-1-jamin_lin@aspeedtech.com>
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
X-TUID: NQnOv8Ei6ig/

Introduce a new ast2700 class to support AST2700.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 include/hw/misc/aspeed_hace.h |  1 +
 hw/misc/aspeed_hace.c         | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

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
 
-- 
2.34.1

