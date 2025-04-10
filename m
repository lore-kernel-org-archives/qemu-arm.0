Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8124989njd;
        Wed, 9 Apr 2025 19:39:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVo0okIwpaC4XXLasreZhvWbAWI25J67sYWih1wEny148SGMAiK394kGVWDX58hh7BvCxgJkku2c6M6Yw==@linaro.org
X-Google-Smtp-Source: AGHT+IGs4zUf7IzRa8F2o9ScxCtI5pY/BFCKCLZMD2gSc15VJYJfLsZR7yyWUyHmuvSJegZ5j1LQ
X-Received: by 2002:a05:600c:13d6:b0:43b:c305:3954 with SMTP id 5b1f17b1804b1-43f2ea651a4mr5444425e9.8.1744252768879;
        Wed, 09 Apr 2025 19:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744252768; cv=none;
        d=google.com; s=arc-20240605;
        b=VWaiT0Wduz85JuY2Us8WRXf7h6SWE81X7FLwToYhXRQvRMFhZl7zuJwaStEEj5aqqd
         ww0ElzKNSJ2o/jbAb4xPl/mSlcriuWKAUuPhbgaJpuXAW+K8VAmg6+iK1m2HOeqKlgOP
         pxYnmHBURJnt2VlQFBmSjeJODaxluttHAVohtfWib2TaFdjpN/c0saeX3DSwxrwcshRJ
         Oy1k2JkG5/Kv41rmA+Ppv/ARZk8aytXx7MoeqPslX8Jr8+aitQm3bBJw7TBriwiuekae
         mNOOPCcJYQa953w0Z//8to4QEOiVXqBrmfF3ZziMz3rYm4gQXPKXxaApeAp3Gp67CN6j
         +WcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=DeU5IajzPOwR0vaMMjl3nTCpm93r6jegus1pe/jx2Vc=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=PVvJult+kl4krwiT7TbSls15uoQ3TslO1vGRcORHrZpa6gTcPj9oyys8UfuzBWR1uJ
         VeYoPbT1c1w6yVcEWnfK4OzVwjV1T5p+vHoiJoPVhMvF/wwvLmshHtMdgcQrsiUDRC1k
         Fulo9c1iKfUkNBXeWaajaA0+zNMY6ouMvU6c+iyx+uMkf5wXvJaI/SHdS78qfwhb0Lek
         bskzk9yHKlQ3y3VODc+a61CtSmFfkNuEeBRR6+HcWFhYcvcPiiuFx5teViTnhpWzpw71
         lsbRMcyJqSftz8XluC6WRx6dsEfdO5Iv5dpoTcrl0Bx8TjWIc5gQkgUnNkTbxqRYiRGT
         Q1kw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-43f233af499si17993515e9.80.2025.04.09.19.39.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Apr 2025 19:39:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u2hoy-0001ZW-AN; Wed, 09 Apr 2025 22:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2hov-0001Ym-P6; Wed, 09 Apr 2025 22:39:14 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2hou-00033O-AW; Wed, 09 Apr 2025 22:39:13 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 10 Apr
 2025 10:38:57 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 10 Apr 2025 10:38:57 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v2 02/10] hw/arm/aspeed_ast27x0: Add "vbootrom_size" field to
 AspeedSoCClass
Date: Thu, 10 Apr 2025 10:38:46 +0800
Message-ID: <20250410023856.500258-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410023856.500258-1-jamin_lin@aspeedtech.com>
References: <20250410023856.500258-1-jamin_lin@aspeedtech.com>
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
X-TUID: 4V/ZEMGfO1NK

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

