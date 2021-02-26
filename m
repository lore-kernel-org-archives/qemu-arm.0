Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1018494lfg;
        Thu, 25 Feb 2021 22:58:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGdTBhNz0f7GbnqlA3LsrfRohT/HJKNver+AQmjEPM4F5ljxY9K9D0uq3pgIpUyxkJfeJy
X-Received: by 2002:a5d:9386:: with SMTP id c6mr650169iol.203.1614322725883;
        Thu, 25 Feb 2021 22:58:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614322725; cv=none;
        d=google.com; s=arc-20160816;
        b=QO/2oSS0RZ5NQfn1FZBIhc1Qz2Bpf7UgigbAoZW30QVCBcW7gSCDcP3ueliWg2t/VA
         2gcZzRjf3OmsqCJAr5tU34Dwz/p9K7TfnVMG2zpZMUJy+fCFNa1fxkH0iKTfaunRXDoE
         u5Hr1t2ZLyn5cLGOqQdTaXrw8JlP9vMR8xOVJjwJdkYr6/PiuO5s8dJHEdYasoq5/sb8
         bC2bwyZyqH8M65rXnuMDZY8Z8/wJUssPNG/FEecOMc7jaGAtxr5vRT09RhXWfNmYm8VZ
         bSHFoD8GdIHNCEk8h2TNEDiZt2Bd13bph148dtVlTC2kKN689dumdUXILH5/7kpalL+D
         qZqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature:dkim-signature;
        bh=s/Zs3H8nldIySrORoqBVGAgKfQMLJ9+BZWTfSlhljkQ=;
        b=nuJSX08m+PYQQB9x/7BaiwC3bPIIGf4ymBssDdnpNK6l1oKQCf8vfoX+ZsZV6VRhOz
         Vsf5dagH4blzJVZbLbJzBRGfzWGR8h2MdH8g419SiOFl3+V5/Chtp8hKu41vtOLMoWlD
         7yak0EpHVQKYr/Glwu2aywJYASIFg6flXg3Wop90dHM6u/eBdE76SNMhGmWdhGZ1Eg7w
         xm3q/VHLYnAbJf2zzg6m1MqCBAAVb7NVBMPtNXedAuKpeATyRXZ1fxG9aJ56oDYOaJYn
         bOmBA+zMWBPdtV4Q0/OeEuzB5yb2G9ECFqsCeImc2NKBTVusctWQ+lvqq5D2asUM1BMe
         Zx6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=FhrPZ10u;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=YpbHwAJI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10si7169936ior.84.2021.02.25.22.58.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 22:58:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=FhrPZ10u;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=YpbHwAJI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFX5J-0004iN-5A
	for alex.bennee@linaro.org; Fri, 26 Feb 2021 01:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lFX4u-0004MJ-DY; Fri, 26 Feb 2021 01:58:20 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lFX4s-0007cp-Rt; Fri, 26 Feb 2021 01:58:20 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 324095C010A;
 Fri, 26 Feb 2021 01:58:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 26 Feb 2021 01:58:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=s/Zs3H8nldIyS
 rORoqBVGAgKfQMLJ9+BZWTfSlhljkQ=; b=FhrPZ10uuP+nm5/Z1e9NkmmiebobJ
 YsNm1gTUG1EzvaWJn3YVqDuD3czwwcoO+m/7tW4rZuKeuq0vVlYtKMGXoitIfoeu
 aTdtF7sJ4+Jdd3ZaienpGd8e/zT0W8yas2/U95HAT63HCwiUBXMWXbc7GfExO0/d
 BJ709rNi1m7c36grOWMGe/kfsFd1GFdX6itpkLHWcE8pUgQClu1hxuV1dGyXLxT1
 2AU0zpILfr84QTT7eBYbjk1KhFnY1VC8QUEUoEKTdVz+HVQEFbmzF14YPaVSv0kh
 nlgBRuo2luAqlXkUQr9vN2hJYzuepahYqaw1DGtLYfMCIsLOXH9tCqb9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=s/Zs3H8nldIySrORoqBVGAgKfQMLJ9+BZWTfSlhljkQ=; b=YpbHwAJI
 nIoRLXK6HUphd0zH3f4C1pDPS8LzZeFXoPDzsAhCbco75FUOyrao3RkFAgLAOBRS
 7BZMafDUYFjtq6AzumaRxfFdIKGrK3K5LDKWmOrzxER1pUxg7B78cAIV5vr/fnyu
 PWxeCWQM3dC33JTieFPhWMR/XPRItZEpVpzix2Nq9VAd8NYKMtmmnzurX37E6zq7
 8gIOsmLWrbMuCO582T14C51ppg/FUE6KlzHMLB03paXKvAtOHL/DmHwl27zE1MiU
 it7WRBLyWIdxsUsKyVNAf+er7EI8YUYcy9Y6CoBqq3Bu6i8YIYwMBo2FW89ujQ8v
 9Da9VWk/e9jP9w==
X-ME-Sender: <xms:CZw4YAkKk7tEPzkEdyNihUI4v4YG7tSjb5wwsMRE1Y5xXj3yhlWIdw>
 <xme:CZw4YP134U5ggJSELSkHbNRuXJUj03xfH5sXs2Hkg_vhY4ohxasm2Cd9ZdEBvrNzu
 nAMdLm8WP07wUiP-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrledtgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddrledurdefjeenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghu
X-ME-Proxy: <xmx:CZw4YOq8aSImASWe_sjReWbChYYJef-BHXnBdxfH0qPiwy9RKHO-Rw>
 <xmx:CZw4YMkXW_-F6-OADJr8tfhxCNdIlZ8T-E0QVI-BZ0Z-2UEK5cUN5g>
 <xmx:CZw4YO16twj4IGJhxR25ZcAKtndsIq67txUowvu5_n0xXpc5pIF-WQ>
 <xmx:CZw4YBS47dobbcZyPs0qmnNh-Y9B1WqqphowWp5XRZ_GPjJz4hqp-Q>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7C90C240054;
 Fri, 26 Feb 2021 01:58:13 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH 1/4] arm: ast2600: Force a multiple of 32 of IRQs for the GIC
Date: Fri, 26 Feb 2021 17:27:55 +1030
Message-Id: <20210226065758.547824-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210226065758.547824-1-andrew@aj.id.au>
References: <20210226065758.547824-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=andrew@aj.id.au;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com, minyard@acm.org,
 qemu-devel@nongnu.org, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rlqi+WAyYRXF

This appears to be a requirement of the GIC model. The AST2600 allocates
197 GIC IRQs, which we will adjust shortly.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed_ast2600.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bf31ca351feb..bc0eeb058b24 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -65,7 +65,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
 
 #define ASPEED_A7MPCORE_ADDR 0x40460000
 
-#define ASPEED_SOC_AST2600_MAX_IRQ 128
+#define AST2600_MAX_IRQ 128
 
 /* Shared Peripheral Interrupt values below are offset by -32 from datasheet */
 static const int aspeed_soc_ast2600_irqmap[] = {
@@ -267,7 +267,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     object_property_set_int(OBJECT(&s->a7mpcore), "num-cpu", sc->num_cpus,
                             &error_abort);
     object_property_set_int(OBJECT(&s->a7mpcore), "num-irq",
-                            ASPEED_SOC_AST2600_MAX_IRQ + GIC_INTERNAL,
+                            ROUND_UP(AST2600_MAX_IRQ + GIC_INTERNAL, 32),
                             &error_abort);
 
     sysbus_realize(SYS_BUS_DEVICE(&s->a7mpcore), &error_abort);
-- 
2.27.0

