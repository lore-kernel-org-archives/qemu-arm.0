Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2257559dye;
        Sun, 29 Jun 2025 22:19:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGrwuukZyFE8WR8I63YEUIgBL8I8f7gQhpXV9IDtIiGKBjmvtSEBI6K7qdQXZwK4kjiwFwdanoQerSwg==@linaro.org
X-Google-Smtp-Source: AGHT+IGzXvFVFAfPvk2FHx0bU6fBGwXbQIAoUcoArJr05YfchYN6uS7r4Fwt7i9/zmLq/YNCvniH
X-Received: by 2002:a05:622a:8317:b0:4a8:a77:d2e2 with SMTP id d75a77b69052e-4a80a77d4f5mr102436501cf.13.1751260742265;
        Sun, 29 Jun 2025 22:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751260742; cv=none;
        d=google.com; s=arc-20240605;
        b=kHQbfJOZggnEbpy4LqqhT9Z5YiG94vcpes61Dwjk84n19Az8bsysRSnFsl8cvvD7VA
         le+pmYT/RInRZ5N+Cj8rUaKv0cPgtUWFW9VVskzymQxSUiQZnM0aAZyl4k1+/Nc94pQx
         WlOoEw3luRk8AjWkLvu0ewtHYCnh5b+wYmVwbmje69bdFhLUdWytlnMzouSz43VgR1Ht
         dSgQPWNcoYriocT0wEzPPHmbgQo6at6nnMnRgObjP57IJepHGZkQ/9JRVeyajVlIs0ti
         j8FVHQPzgFGF35JdNt3EOZt2CAXbU4cqBm72IV+ZVgPgSa4NDPjYBRBnUF2eOxe9JANx
         ec4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Q4vkntF3MLk4JZjrCQKqv2FXBE/M+2b+rWE8hFpbrnw=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=lJNwZ6u4zMAn+I4pOUoQBfhUPmbDG816hZUA2Z1t0SXdm7vDBqiBbCffOQ6OI/agbB
         vOaK1yFzoWe7gQ1srpYgIpXoVzy9YKb4I+UVqG8bVdhkHQkQ7ZZLscgYM8XW501UO/RC
         oCtWSY9ZaMNcIaFmdqsv1jxeWxgChiU4QVUlnbv5G/cDKEU/jjvF+Wy2mJcjtdXLoEzz
         uFgcNTxUXbEllraF2Cysd3cs/g0d/ZRozDkOoCylVBw2cE+ebwcVxI0h0Npdd5uupTuS
         V37mPVEtm66vn3frsFJYixyTy9nTBAs9JJia/Ievm5oC6m6My0uAxcjDsV3cdlFPEFTm
         79oQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a80f228a9fsi36419911cf.366.2025.06.29.22.19.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Jun 2025 22:19:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uW6tl-0005Yh-HC; Mon, 30 Jun 2025 01:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uW6tk-0005Y7-3y; Mon, 30 Jun 2025 01:17:44 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uW6ti-0003fn-N3; Mon, 30 Jun 2025 01:17:43 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 30 Jun
 2025 13:17:22 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 30 Jun 2025 13:17:22 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [PATCH v3 3/3] hw/arm: Integrate ASPEED OTP memory support into
 AST2600 SoCs
Date: Mon, 30 Jun 2025 13:17:20 +0800
Message-ID: <20250630051721.254207-4-kane_chen@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630051721.254207-1-kane_chen@aspeedtech.com>
References: <20250630051721.254207-1-kane_chen@aspeedtech.com>
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
X-TUID: ouh4N7kPtU8i

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
index 46a038337c..b56a8b7678 100644
--- a/hw/misc/aspeed_sbc.c
+++ b/hw/misc/aspeed_sbc.c
@@ -273,8 +273,10 @@ static const TypeInfo aspeed_sbc_info = {
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

