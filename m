Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp639411dye;
        Thu, 26 Jun 2025 19:57:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjVYL+sY7ALkTa+oG5e/t8eVqam+yvHIPYIjzQEubdWl06VF3b8Qm89Ya21mZDI+E6VwAxPgcQodVKTg==@linaro.org
X-Google-Smtp-Source: AGHT+IGuO/WcpDlPLsmOg8VruJQGWjE7jrQYFTFKv+ylIe40xQhs0zPMYBfPQ5mYOQxodi+++4I2
X-Received: by 2002:ac8:7c4c:0:b0:4a4:31c5:fc8a with SMTP id d75a77b69052e-4a7fcb0588fmr33069101cf.47.1750993047680;
        Thu, 26 Jun 2025 19:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750993047; cv=none;
        d=google.com; s=arc-20240605;
        b=jEEcwEwqvl9EtozKkd24UmcQid6lQJ8Si0/snsPVnQ+USR9kFzvEPBqBoYEkOWOO71
         tlHrzHTxeRafstpNZmf+gaSBbGKZliclIhvgvMAQwf6pFICOiVeTOCkN3x6QRPuhP623
         DZRjSkId6KpnSO6HbOBLJVwHg4AkEkWodrnsjwSz3YIIt2I37LAdXhZhlQcaekNocD5b
         xoRWHWtPMSg60hbZjCsoK9XadpPPgpCykMnuQtXb0bRgednsxipAM+AijJC3BvhRKE2g
         A7Jly6nnC5Srqss0Qm3dNrU5vmVpQrjRFCr7IXk7Jf2ybyYRjCat5igl9BcdepZqHHhN
         8i3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=ERmsWhsz26GgeSpOUf8OIS1mlMOxQuts3m7VF2eAB+4=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=Uh5EZHtw8nbi/cyNPQ7RJdrZGyH7HokwKeXXKXnA9qM8+EqPiWPjxm2On8KunlcMLr
         cZMrlK5x5j2eceh7ampmiM1w3lAe7GMrsMVDZ+RofPve9Hsoa/H105SAIhsHJGuXipSV
         R8AGeQgcXLHDxaM2h9WzxZ2eNmbhQVE3raHK2jv9mzuWQ0Yz5HT1RvzJggxSoRIKlzQ4
         7K08WduHJ+4fW+qTa+RVbvAKxKAGIKdYrOBJr2rY3gk8OxwJVPfQBeV92eZAOth/V4uT
         ELatxZ6n+vi5kuZQARATCfALdl0+GSNZa8lRr+BTQrvjkRIkYclX7YRbM39xWJ01g4nj
         6U8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc0ff947si14308291cf.55.2025.06.26.19.57.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Jun 2025 19:57:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uUzGL-0007gX-Jg; Thu, 26 Jun 2025 22:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uUzGK-0007gK-Na; Thu, 26 Jun 2025 22:56:24 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uUzGJ-0006B6-5z; Thu, 26 Jun 2025 22:56:24 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 27 Jun
 2025 10:56:07 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 27 Jun 2025 10:56:07 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [PATCH v2 3/3] hw/arm: Integrate ASPEED OTP memory support into
 AST2600 SoCs
Date: Fri, 27 Jun 2025 10:56:05 +0800
Message-ID: <20250627025606.631167-4-kane_chen@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250627025606.631167-1-kane_chen@aspeedtech.com>
References: <20250627025606.631167-1-kane_chen@aspeedtech.com>
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
Reply-to:  Kane Chen <kane_chen@aspeedtech.com>
From:  Kane Chen via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XzCkiMJtZogY

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
index 2f5b83a3f2..f2ceec9ab5 100644
--- a/hw/misc/aspeed_sbc.c
+++ b/hw/misc/aspeed_sbc.c
@@ -279,8 +279,10 @@ static const TypeInfo aspeed_sbc_info = {
 static void aspeed_ast2600_sbc_class_init(ObjectClass *klass, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSBCClass *sc = ASPEED_SBC_CLASS(klass);
 
     dc->desc = "AST2600 Secure Boot Controller";
+    sc->has_otp = true;
 }
 
 static const TypeInfo aspeed_ast2600_sbc_info = {
-- 
2.43.0

