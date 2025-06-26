Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp83470dye;
        Thu, 26 Jun 2025 00:58:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwqkx1tcE45MKgGZZg1XfgLV1+OTU5gAMKesRj3J78zKxadYH4vYdWacQ5TZqlZjnUdqrdM1EV7Y4wUw==@linaro.org
X-Google-Smtp-Source: AGHT+IGXkDrJJBFoa4XfetnKXJiKHkQqUxsLX3Aca+TkLsHoJ6LNa8pCjFxPSidsSgL0bF8sVtOA
X-Received: by 2002:a05:600c:34c5:b0:453:6183:c443 with SMTP id 5b1f17b1804b1-45381ae7a71mr59246605e9.5.1750924705916;
        Thu, 26 Jun 2025 00:58:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750924705; cv=none;
        d=google.com; s=arc-20240605;
        b=UCZQmbX51iv0VYMK033ydRZZAQ5BdZ2Nav/TzXXg91/AaqaTFWKXJyaOMa6jwpaNGL
         VQeIG7IrZLavc1BWILt33wKhf5HI9GYiynRrVfrYUNk22Rdo7rbv0am80rY2rYejOh52
         wzeAa/ChY+uQDMpa7DxNJFyCXgKImttWx3oSiVhHjjiNGKu+LCYx3ZYsTiGmuv2FI9Ar
         U3zmlGPsxh9SpH7R/W/9YQby6t7nBpiVQ1/Af3vX/Dag58MaV18KDKf6+yahLgEdZhaE
         nWT72yaKDAAx9xJx32cb96dWOxooxtSdSdym5nWmVLpekgDmKYy+u6GoMhkxz5+loVtG
         5ntg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=5/XHdw/W4EzCPyQNyWAo5C8ROjcpy4lRhVxi8BjZ6Hk=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=SzlF/Dxz8Hi5Bsiy+KIzW2HdgUJYVCYf9STm7d7vqm1oaAVPCrFfxiJGS3+eizGwHg
         SFl0LWYxBJncTy2apwQL22YpcMHyk3VBSAT4B7zH4bGmfVI7RcJf35clTR/I0hGjI6iJ
         PZcr8cNmsP+PkKgzSWArDtE9GJtAj/KCaBwm5c10ummc0fFzipZWLutrBTjvxy5omSY4
         NW7ZGczZAMIB4BhKz+D6nmQViPjHQg5lbUduQ+nVcuwqSTCKnyq1Jgbl2O1woXrlm2jp
         n167y063qU61Cejzg0/oUVsbVi6tUVzZdAwgNlZiKT2VXgM9vpYb9M7dTq5Hof6ows5X
         41qA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-453823d118esi27983545e9.83.2025.06.26.00.58.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Jun 2025 00:58:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uUhUK-00048p-Cc; Thu, 26 Jun 2025 03:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uUhUJ-000470-3L; Thu, 26 Jun 2025 03:57:39 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uUhUH-0003xl-As; Thu, 26 Jun 2025 03:57:38 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 26 Jun
 2025 15:57:12 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 26 Jun 2025 15:57:12 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [PATCH v1 3/3] hw/arm: Integrate ASPEED OTP memory support into
 AST2600 SoCs
Date: Thu, 26 Jun 2025 15:57:10 +0800
Message-ID: <20250626075711.1589039-4-kane_chen@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626075711.1589039-1-kane_chen@aspeedtech.com>
References: <20250626075711.1589039-1-kane_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=kane_chen@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Kane Chen <kane_chen@aspeedtech.com>
From:  Kane Chen via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8Xsu4PT9pesW

From: Kane-Chen-AS <kane_chen@aspeedtech.com>

The has_otpmem attribute is enabled in the SBC subclasses for AST2600
to control the presence of OTP support per SoC type.

Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
---
 hw/arm/aspeed_ast2600.c | 2 +-
 hw/misc/aspeed_sbc.c    | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index d12707f0ab..59ffd41a4a 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -261,7 +261,7 @@ static void aspeed_soc_ast2600_init(Object *obj)
 
     object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
 
-    object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_SBC);
+    object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_AST2600_SBC);
 
     object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
     object_initialize_child(obj, "video", &s->video, TYPE_UNIMPLEMENTED_DEVICE);
diff --git a/hw/misc/aspeed_sbc.c b/hw/misc/aspeed_sbc.c
index 5cbf55c216..717cad92dc 100644
--- a/hw/misc/aspeed_sbc.c
+++ b/hw/misc/aspeed_sbc.c
@@ -275,8 +275,10 @@ static const TypeInfo aspeed_sbc_info = {
 static void aspeed_ast2600_sbc_class_init(ObjectClass *klass, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSBCClass *sc = ASPEED_SBC_CLASS(klass);
 
     dc->desc = "AST2600 Secure Boot Controller";
+    sc->has_otpmem = true;
 }
 
 static const TypeInfo aspeed_ast2600_sbc_info = {
-- 
2.43.0

