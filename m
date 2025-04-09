Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7601143njd;
        Wed, 9 Apr 2025 03:01:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOrudSqusEMUcTSDIbBzw/OHcL6cdicL2SLYVQa8emSDGjpumDKGf7JbNHKDatlvUNGez4Td4juf+GlQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHIEOE3wze1kDm8NS0f2GXAxT0kMZ2v6/0OOq6jq83dPMxBsGK2oddycZJL9eF+cCTguAJt
X-Received: by 2002:a05:6214:c6b:b0:6e8:9d00:3d71 with SMTP id 6a1803df08f44-6f0dbbbc32amr29584866d6.21.1744192874948;
        Wed, 09 Apr 2025 03:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744192874; cv=none;
        d=google.com; s=arc-20240605;
        b=Xh8Ore6LJSShuOd+x5rRlxY72WL/P/XfiKhDz6bEOSmSaeGXxqhR2CzM5fvQJoBzl7
         VmkJ43SEW6aAJan91KRkYa21ypzIAZAmKhBxiKyVfntz4fzWeEfLLWd47K0b7eMaanXM
         oT5TcRjjIWtpaTHvFuLodPxHkbuPajzL2FBv90FE8jZFgLJYaB/bXe2JmmkWBRnsAtoP
         IMWFoapsSdoAxOOiWRzpEEU/QyIdIMn0BJR5FmWEfwIRUJGZrvHFXKR7DBL+JFrHTD5p
         CvccGihIZl26WxXrs5JMdzlgdEiGNJRSCUScjfaV5yQGS9sw4oNj6pCP11UuLvH4qSGI
         JYLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=DeU5IajzPOwR0vaMMjl3nTCpm93r6jegus1pe/jx2Vc=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=Nr6YjdC7o6yjaZOvAN9UJSr7vLEe4k/XGpOKyl5ot/Pfjp94CQDjJ6uodCnL4vincw
         aQMTkNAvQkNaEdQftqOJbSdp2FOBGGWseBLCN4V62raLxS87PX9e4yvZ455HkWMP8ZME
         jWp1Yms8FybG0kiC7nN9KvU6XS97uSki+UmWTvEQXAR8rWFmgyWeXVK/o3h3SGlJzT3s
         fi9Pzfr+efSCa2iSj1oukIr78uXgxnU7ReOtPiZfPjEPyGyeIyiI2DDBYjUFD4s36uOJ
         UoWfhzyL4+cT0swj2xz+W92Qvwhw+ttHBV1CQtWAKBixKPZPCPX56qezcxzkbi/cNQul
         g6mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0de9ec60dsi7251036d6.309.2025.04.09.03.01.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Apr 2025 03:01:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u2SEu-0006Sj-CL; Wed, 09 Apr 2025 06:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2SEo-0006NL-8F; Wed, 09 Apr 2025 06:00:55 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2SEl-0006jO-Bw; Wed, 09 Apr 2025 06:00:53 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 9 Apr
 2025 18:00:39 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 9 Apr 2025 18:00:39 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v1 1/9] hw/arm/aspeed_ast27x0: Add "vbootrom_size" field to
 AspeedSoCClass
Date: Wed, 9 Apr 2025 18:00:29 +0800
Message-ID: <20250409100039.2391847-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409100039.2391847-1-jamin_lin@aspeedtech.com>
References: <20250409100039.2391847-1-jamin_lin@aspeedtech.com>
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: y48tiTT70rPd

Introduced a "vbootrom_size" attribute in "AspeedSoCClass" to define virtual
boot ROM size.
Initialized "vbootrom_size" to "0x20000" for both AST2700 A0 and A1 variants.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 include/hw/arm/aspeed_soc.h | 1 +
 hw/arm/aspeed_ast27x0.c     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 37cd7cd793..432f6178ac 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -152,6 +152,7 @@ struct AspeedSoCClass {
     const char * const *valid_cpu_types;
     uint32_t silicon_rev;
     uint64_t sram_size;
+    uint64_t vbootrom_size;
     uint64_t secsram_size;
     int spis_num;
     int ehcis_num;
diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index dce7255a2c..81dd90ffdd 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -898,6 +898,7 @@ static void aspeed_soc_ast2700a0_class_init(ObjectClass *oc, void *data)
 
     sc->valid_cpu_types = valid_cpu_types;
     sc->silicon_rev  = AST2700_A0_SILICON_REV;
+    sc->vbootrom_size = 0x20000;
     sc->sram_size    = 0x20000;
     sc->spis_num     = 3;
     sc->wdts_num     = 8;
@@ -925,6 +926,7 @@ static void aspeed_soc_ast2700a1_class_init(ObjectClass *oc, void *data)
 
     sc->valid_cpu_types = valid_cpu_types;
     sc->silicon_rev  = AST2700_A1_SILICON_REV;
+    sc->vbootrom_size = 0x20000;
     sc->sram_size    = 0x20000;
     sc->spis_num     = 3;
     sc->wdts_num     = 8;
-- 
2.43.0

