Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2168229ejb;
        Tue, 24 Oct 2023 09:26:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG6Zs5JSkBke2Il9PAhk3WMIBW+zlF7ouXCwhYck6ylRkccZgvi5wfkj566eppqrj5cV9Z
X-Received: by 2002:a05:620a:1aaa:b0:773:fd71:6e7c with SMTP id bl42-20020a05620a1aaa00b00773fd716e7cmr14281581qkb.59.1698164770588;
        Tue, 24 Oct 2023 09:26:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698164770; cv=none;
        d=google.com; s=arc-20160816;
        b=KX8tv0KvWyJMInY1cCZ/fI+6ndDTPzujACWRtnV8FjSEWyrMu0suA67Sg4wL/yNK0h
         ZGry50fG9PQ0tL5r3+CINh4yju6tQ9JcnwC70kr3uGsgo+nG9kuf/coSg2tSfZFt05Kf
         IiOr4SEZWRAdlgnsiJEnSaENsTaA+wKbpEldKi7doydbK1Xna3gwOfI1K+eujtTTGG1R
         E+4hfgfMLxCjTCSu6z2eKdtCb+j18eueUK+lqMlxmmp8InSQbVbn0xPP5uiO74w5Bd1n
         /x8haQZxlZ1aL/01Oru3gUcbsqVZ5Ux2qNho63zP9VgbSSdQYmvY3fvR/H42WeWX1cUd
         PORA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xkEV+IyfDvCnmDFdMkKu1PQgF2STgTXQmjG0ZR7mnhw=;
        fh=WVEKgOIyTrr8n58k2pegoTwEDRNm1XlZWphDTwgTwzs=;
        b=E4QcXJtN4G1zw8qw1i/NQafOopUf24OAsGa7r04jY6qTbZv5yRAiK7NQIiXmuOohpC
         hlbAk0zvCDeIvISMgaE/iXydZXr62IsHphCIDP9qdFPP4W5ld28c9bnIBWFY6SVrNYKc
         /9uGgL916Q0aeodAbp+fFpqBQ1TU/bDqPy5qD7OoYCUd5Z4c6PgfCuV4JLpfElym1SvD
         aoPn35nFqeWwwX2Xo3YvT8jrN9mODyYvCO3vzIemaKFbw6Ni8qEiqI7xZrNJLvqCZWNc
         JcMgxWuTvY5ONDIKozfFv39HrVMNO8v3CJu7KWenEyqqY1R0E3PHNevAWcvzmBVNW1i1
         EHfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QQcKG4f8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8-20020a05620a28c800b00773db595cccsi6231972qkp.672.2023.10.24.09.26.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 09:26:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QQcKG4f8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvKDM-0001IE-Oy; Tue, 24 Oct 2023 12:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvKDJ-0001AS-F3
 for qemu-devel@nongnu.org; Tue, 24 Oct 2023 12:25:05 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvKDH-00010h-NX
 for qemu-devel@nongnu.org; Tue, 24 Oct 2023 12:25:05 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40790b0a224so36812665e9.0
 for <qemu-devel@nongnu.org>; Tue, 24 Oct 2023 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698164701; x=1698769501; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkEV+IyfDvCnmDFdMkKu1PQgF2STgTXQmjG0ZR7mnhw=;
 b=QQcKG4f8twIdpWL11KreVBG9RqaGezBIMFvKVa6wDMJUVq1UbdRbqDWFeHZBQe+E6i
 oDsmanSItJhwrbLpImQhKAGOT161yWjUZkFrGaChw7FrfFJd1Q/HIXUKQvQgEuxmXTOY
 BSOKTN2eJCrK6HLrahBYIkrofuNvEuqbVmSf12jPn6XYitbL5avTnLi3U7FGE+VSQnWx
 3Ft9WklLAiGUvYIHQYzeNTVYVUUky7EQWUxkSAhVIJh/cg+SziKBugVEC8I+WapDsPT9
 NlxbtH4wSr9RlJgUaFunRIXQ62n024ruaA4kVtPT2Yur+RFCk71rYG+Pui4cvlfSRJRh
 i+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698164701; x=1698769501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xkEV+IyfDvCnmDFdMkKu1PQgF2STgTXQmjG0ZR7mnhw=;
 b=Cy+eO33KBOtRQN3MH5hkW7GO3elkvYM2owkPBpa0Gry8L7jzVVPNiih4cQma8Mbvpb
 kaamwXlkcftwv3uP1LijGI0PJE7ZSB+yi8wuRd/erl20HOO0IGpH/5CNlZXVQUihpx//
 uqpovlR5R23JJw7VCrSq8rDSfTHdbQaF+kbYI0MbfT5i9ZKmtQ3XWTvEP/mk/RsqMxQK
 EBdFI4+h/hnoHpV/TdATq4QV+3Cu/2A4duPT3xz33CVbNFuyHp9RxOmX1z6WxYB4CfmZ
 q8dV3PRcHDQKhRkij/hcw1nhheoKYi7awqaAiCDyoVehF5ulYvrcH2SiqLKMHUfjCGxN
 oGxw==
X-Gm-Message-State: AOJu0Yw8H9t+MPEB733jZ8LZp5/8p0oyQ1X1sUpzBpmnyvT4IHAah6u3
 wzRHq+ekb9/uxeXzvVwi7GzAl4nus+gXSFfQZO4=
X-Received: by 2002:a05:600c:3b90:b0:408:37aa:4766 with SMTP id
 n16-20020a05600c3b9000b0040837aa4766mr9639614wms.5.1698164701071; 
 Tue, 24 Oct 2023 09:25:01 -0700 (PDT)
Received: from m1x-phil.lan (sem44-h01-176-172-55-165.dsl.sta.abo.bbox.fr.
 [176.172.55.165]) by smtp.gmail.com with ESMTPSA id
 b24-20020a05600c06d800b004064e3b94afsm17039497wmn.4.2023.10.24.09.24.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Oct 2023 09:25:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/11] hw/arm/aspeed: Introduce TYPE_ASPEED2600_SOC
Date: Tue, 24 Oct 2023 18:24:17 +0200
Message-ID: <20231024162423.40206-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231024162423.40206-1-philmd@linaro.org>
References: <20231024162423.40206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C+ScidM+lVW6

TYPE_ASPEED2600_SOC inherits from TYPE_ASPEED_SOC.
In few commits we'll add more fields, but to keep
review process simple, don't add any yet.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/aspeed_soc.h |  7 +++++++
 hw/arm/aspeed_ast2600.c     | 26 +++++++++++++-------------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index dcb43a4ecd..103b1598f6 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -101,6 +101,13 @@ struct AspeedSoCState {
 #define TYPE_ASPEED_SOC "aspeed-soc"
 OBJECT_DECLARE_TYPE(AspeedSoCState, AspeedSoCClass, ASPEED_SOC)
 
+struct Aspeed2600SoCState {
+    AspeedSoCState parent;
+};
+
+#define TYPE_ASPEED2600_SOC "aspeed2600-soc"
+OBJECT_DECLARE_SIMPLE_TYPE(Aspeed2600SoCState, ASPEED2600_SOC)
+
 struct Aspeed10x0SoCState {
     AspeedSoCState parent;
 };
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index e122e1c32d..1ee460e56c 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -646,18 +646,18 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
     sc->get_irq      = aspeed_soc_ast2600_get_irq;
 }
 
-static const TypeInfo aspeed_soc_ast2600_type_info = {
-    .name           = "ast2600-a3",
-    .parent         = TYPE_ASPEED_SOC,
-    .instance_size  = sizeof(AspeedSoCState),
-    .instance_init  = aspeed_soc_ast2600_init,
-    .class_init     = aspeed_soc_ast2600_class_init,
-    .class_size     = sizeof(AspeedSoCClass),
+static const TypeInfo aspeed_soc_ast2600_types[] = {
+    {
+        .name           = TYPE_ASPEED2600_SOC,
+        .parent         = TYPE_ASPEED_SOC,
+        .instance_size  = sizeof(Aspeed2600SoCState),
+        .abstract       = true,
+    }, {
+        .name           = "ast2600-a3",
+        .parent         = TYPE_ASPEED2600_SOC,
+        .instance_init  = aspeed_soc_ast2600_init,
+        .class_init     = aspeed_soc_ast2600_class_init,
+    },
 };
 
-static void aspeed_soc_register_types(void)
-{
-    type_register_static(&aspeed_soc_ast2600_type_info);
-};
-
-type_init(aspeed_soc_register_types)
+DEFINE_TYPES(aspeed_soc_ast2600_types)
-- 
2.41.0

