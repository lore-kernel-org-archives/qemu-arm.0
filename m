Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2167560ejb;
        Tue, 24 Oct 2023 09:25:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG012ZnGbOOx0Ah7iOj+oRoXd76mhU2ydYPjIdHlWNQHE3+ssreyAEBSjwdeVJPFtfCKolB
X-Received: by 2002:a0c:f446:0:b0:66d:1706:6f39 with SMTP id h6-20020a0cf446000000b0066d17066f39mr11759054qvm.34.1698164704609;
        Tue, 24 Oct 2023 09:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698164704; cv=none;
        d=google.com; s=arc-20160816;
        b=OFDbjF4XbDwdPbbQ1RoS1qg3myVBnZDhHDiNkCz+0jrmLD3Hi47mpgj2n3IPYUrTYI
         eh1x58efodxMzVadQP3Gftmk0iD22BwMzy52SkWjoe43LD9Jk4Z+dpq3W596hcqptLtu
         48Tg8greQarI3c/PuLqCPKleK0czgV445ZzB0xU/COnDddlrLkrrpaeZzQK/bti7WL/A
         7wBBFZkq6QFPE9yGPlwMJJk4nuuE+IH9i00PB8gGDyXjCxnChZ7v4Wcfj7Gpbv210jw4
         bzzDKN6zL1fmhm+DUU0EuQAlxoB2ZoYITim0vgY8nh5NWYhB7nZ6myy10CNmPcGp3mR+
         K3/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8mMwve7k/zHxbrLWqEeZdnxp8MMBcEIAPhWDeuAu34o=;
        fh=WVEKgOIyTrr8n58k2pegoTwEDRNm1XlZWphDTwgTwzs=;
        b=pNxzt8NplGKk0/oLOVJAmOuj7oNlH0xL0EDDPMrAhc8HtxdEX1jWDs7IjTd0UNCNRj
         MwUBTBTotCUnlkE6NXGtErqK+0VTOscIJGw0Nt7IwwbCLO04kWHXB7fI7vmL3gOTEgAb
         kiLIp12qRH9UJ8IkymRzXgkFW7o2ivgg2a6fsTu4l0rzLPaw7zEEdd1XqT6s9Th7tx+Y
         yFo6d1Xew2LLwq5giiClJyTdN/toDykFqwBgCPFlsvE8R0QWSfOxuBIsQv/HzZQpo1Lc
         XR6xvlVbjkQWJsj+NfjFiTuoJYMz31sM4O9T3RMRViZBT/YMst7ts9MwQqnxGIaVM/Bl
         11Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lPCWSbMo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9-20020a0cd6c9000000b006585a789586si7509423qvi.216.2023.10.24.09.25.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 09:25:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lPCWSbMo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvKCx-0000lO-U3; Tue, 24 Oct 2023 12:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvKCv-0000jv-7r
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 12:24:41 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvKCt-0000vk-Jp
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 12:24:40 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40806e40fccso34335625e9.2
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 09:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698164677; x=1698769477; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8mMwve7k/zHxbrLWqEeZdnxp8MMBcEIAPhWDeuAu34o=;
 b=lPCWSbMoRzVF0AgMyn9nVgf+WpMupv5G92CFPEiL7lbeiWcLM6Kn8R3bLR8jyQa9UR
 n3Sa/8WyivM//93KeSWgucTGtIdxfMKfEmepURSygGieTyx9l4BRSy+/hd7Ke7qYRQ2q
 F1XJiOA1D7ZqjGCZap1E2XocgAXhl3yHoDllqHioZrLl+VBV8Ntv0u5Ll6lf2sOIabZF
 qnt9jbPw8F8+dgoeamBsg3X9hdxsue4BkG30feP4sd/WJGxdf3MZsLaT17IyWdVTW257
 7Warhhl4gEUIUStmL+wgYRFdchiyo006C4iK3Hh9nAGVt8o/XzX3GfmVuNuDzMX/ufOM
 g2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698164677; x=1698769477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8mMwve7k/zHxbrLWqEeZdnxp8MMBcEIAPhWDeuAu34o=;
 b=Qwfx9/1Fn6KLmKK3Pua7YgaYq7WlYh0vR/rLpbQ694bMu4IVmeanl1PSLdiBqCWSTE
 5PR7Rl4QrIbmeHfiZNq2k9lgclkrLa6JLu5JVUIa129EH5S/ixg2jdcg/L9ezRPAMdnX
 bxB4O3zoOHRNfx0KaYAT79uLrQOTuoQfrefDTGhQvIKUq/94xk6vQzMfIOmywg26Ikmb
 PoA+7PZxWPMDMMvYp5Z9jGEnskoxeu1nkjY/NUBk195C02PDtOdBVAhO0RjAGHuS/FBu
 CMzwQNDz/WDBEaOjBNLFYaeOr8JSHNtCs9lp8Qr6zTRTc97nHgPZIV9mhwLzel9LC4N9
 Em2A==
X-Gm-Message-State: AOJu0YyANA3IW5WYqucRXhQaagihbybCo9gCd/RqMwu16nlzC0KvnLDI
 ZIuydgAx8eFzKfeXg4a1CyJlzg==
X-Received: by 2002:a05:600c:4ecc:b0:408:37d4:b5ba with SMTP id
 g12-20020a05600c4ecc00b0040837d4b5bamr11075260wmq.12.1698164677348; 
 Tue, 24 Oct 2023 09:24:37 -0700 (PDT)
Received: from m1x-phil.lan (sem44-h01-176-172-55-165.dsl.sta.abo.bbox.fr.
 [176.172.55.165]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05600c3b8d00b004053e9276easm17311182wms.32.2023.10.24.09.24.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Oct 2023 09:24:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/11] hw/arm/aspeed: Rename aspeed_soc_init() as AST2400/2500
 specific
Date: Tue, 24 Oct 2023 18:24:13 +0200
Message-ID: <20231024162423.40206-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231024162423.40206-1-philmd@linaro.org>
References: <20231024162423.40206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UTjfWix62ZYt

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed_soc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index f6c2ead4ac..bb377e9e6e 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -140,7 +140,7 @@ static qemu_irq aspeed_soc_ast2400_get_irq(AspeedSoCState *s, int dev)
     return qdev_get_gpio_in(DEVICE(&s->vic), sc->irqmap[dev]);
 }
 
-static void aspeed_soc_init(Object *obj)
+static void aspeed_ast2400_soc_init(Object *obj)
 {
     AspeedSoCState *s = ASPEED_SOC(obj);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
@@ -546,7 +546,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
 static const TypeInfo aspeed_soc_ast2400_type_info = {
     .name           = "ast2400-a1",
     .parent         = TYPE_ASPEED_SOC,
-    .instance_init  = aspeed_soc_init,
+    .instance_init  = aspeed_ast2400_soc_init,
     .instance_size  = sizeof(AspeedSoCState),
     .class_init     = aspeed_soc_ast2400_class_init,
 };
@@ -573,7 +573,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
 static const TypeInfo aspeed_soc_ast2500_type_info = {
     .name           = "ast2500-a1",
     .parent         = TYPE_ASPEED_SOC,
-    .instance_init  = aspeed_soc_init,
+    .instance_init  = aspeed_ast2400_soc_init,
     .instance_size  = sizeof(AspeedSoCState),
     .class_init     = aspeed_soc_ast2500_class_init,
 };
-- 
2.41.0

