Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1125681lfj;
        Mon, 2 May 2022 19:28:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYdJMvg5VwClkFV1Kp8DPuZna96bd/rWIxEFDiLTpPtip8zVgzHSLxMxSv2b7nZGnBX/SY
X-Received: by 2002:a05:6214:caf:b0:456:4027:90ee with SMTP id s15-20020a0562140caf00b00456402790eemr11798479qvs.35.1651544897331;
        Mon, 02 May 2022 19:28:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651544897; cv=none;
        d=google.com; s=arc-20160816;
        b=izrknZyD06KZrnANtSQfBjD2uiHR/43KYdohNntoN1NFRZxzq6nIJDwBQb8I08XDAW
         okEhkQimuQ04pn3LQN7mD+9LWjgGOeO/lQhz0cswYiR/LhUY82NcSHAE8dogpWFVJYQz
         lZ4i6cgpB6FueIJsli67uQzm4Yb82InVioqJbOUTrRjc6uGSu6DZVfCLkx7pXsUXrdLf
         vRvxm+S82Vz+HNFHMVax5bbBA1MJWnO6SKww1sBrNdTYTILn2gD0AX8socWCM2KGrbLE
         050YYBkP+ukSZLzLbDY4suJrFfjP8zTYXSS9ZPXtJincmiBR0LJ65zgKA8jkPq4ObCn0
         ncng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from;
        bh=/x9GwnwJhuUD9cZPtoVKOZlqE4ihNiNqMCB+V/d4meI=;
        b=lblntpvY5a3UdQOPpsXDI9VU+/od5R2Dw17ykWSMQc3nxGb9dEOrZrkzlVRs0DHgmK
         FeJjLyZE+mjV9r1+T54VwGPPzxLReO8OS7SZ0G6BFp3Xy4YNBpJ7NCfOUYwKpil8xEXU
         drBQGu5gBxTRPzG5eD/gFVMYp/yqbWSRI/PvhWE4jaZodtmO26ghTLARErBV0I+X/RAN
         3yv8dfD5+jE88tQOpcqOfRSCKevPnTHoLeCGaSL3fjker+BtOzDe0n3+WRYsi18kIqku
         8pyiaEW2ik3vnIGIqYMd8NyHV2Q5M5iF2TZfB9FE7vKjWYN3iGcLLcuInaiAeE5Kmqre
         uqVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8-20020ae9d608000000b0069fb1b32a76si5946246qkk.325.2022.05.02.19.28.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 May 2022 19:28:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nliGu-0005gb-QQ
	for alex.bennee@linaro.org; Mon, 02 May 2022 22:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nliGj-0005d7-N4; Mon, 02 May 2022 22:28:05 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:61336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nliGg-0007OF-PK; Mon, 02 May 2022 22:28:05 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2432ENt0014088;
 Tue, 3 May 2022 10:14:23 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 May
 2022 10:27:13 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
CC: <steven_lee@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <jamin_lin@aspeedtech.com>
Subject: [PATCH v1 1/1] aspeed/hace: Support AST1030 HACE
Date: Tue, 3 May 2022 10:27:10 +0800
Message-ID: <20220503022710.4119-2-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220503022710.4119-1-steven_lee@aspeedtech.com>
References: <20220503022710.4119-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2432ENt0014088
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=steven_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WIvz0rXIg+PH

Per ast1030_v7.pdf, AST1030 HACE engine is identical to AST2600's HACE
engine.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/misc/aspeed_hace.c         | 20 ++++++++++++++++++++
 include/hw/misc/aspeed_hace.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 10f00e65f4..91f3c0b208 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -378,11 +378,31 @@ static const TypeInfo aspeed_ast2600_hace_info = {
     .class_init = aspeed_ast2600_hace_class_init,
 };
 
+static void aspeed_ast1030_hace_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedHACEClass *ahc = ASPEED_HACE_CLASS(klass);
+
+    dc->desc = "AST1030 Hash and Crypto Engine";
+
+    ahc->src_mask = 0x7FFFFFFF;
+    ahc->dest_mask = 0x7FFFFFF8;
+    ahc->key_mask = 0x7FFFFFF8;
+    ahc->hash_mask = 0x00147FFF;
+}
+
+static const TypeInfo aspeed_ast1030_hace_info = {
+    .name = TYPE_ASPEED_AST1030_HACE,
+    .parent = TYPE_ASPEED_HACE,
+    .class_init = aspeed_ast1030_hace_class_init,
+};
+
 static void aspeed_hace_register_types(void)
 {
     type_register_static(&aspeed_ast2400_hace_info);
     type_register_static(&aspeed_ast2500_hace_info);
     type_register_static(&aspeed_ast2600_hace_info);
+    type_register_static(&aspeed_ast1030_hace_info);
     type_register_static(&aspeed_hace_info);
 }
 
diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
index 94d5ada95f..e9d3563a05 100644
--- a/include/hw/misc/aspeed_hace.h
+++ b/include/hw/misc/aspeed_hace.h
@@ -15,6 +15,8 @@
 #define TYPE_ASPEED_AST2400_HACE TYPE_ASPEED_HACE "-ast2400"
 #define TYPE_ASPEED_AST2500_HACE TYPE_ASPEED_HACE "-ast2500"
 #define TYPE_ASPEED_AST2600_HACE TYPE_ASPEED_HACE "-ast2600"
+#define TYPE_ASPEED_AST1030_HACE TYPE_ASPEED_HACE "-ast1030"
+
 OBJECT_DECLARE_TYPE(AspeedHACEState, AspeedHACEClass, ASPEED_HACE)
 
 #define ASPEED_HACE_NR_REGS (0x64 >> 2)
-- 
2.17.1

