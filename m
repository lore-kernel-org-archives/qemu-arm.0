Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp344557njc;
        Wed, 12 Feb 2025 19:37:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCURDdpqSIMG/Wi28cDSVK7Enj/wcnncr/WPMAquW6ZVP16xZTPvkaz0uCB3GAgbFlCHC/DnspbUBCB19w==@linaro.org
X-Google-Smtp-Source: AGHT+IFUQuS++ouiBOwgmqVfkRbZ+TF5/cQheypVKcefdl6I058hveKcBGz+m8Jg1oOAmJvUR2n3
X-Received: by 2002:a05:622a:1214:b0:471:b4b9:e6fc with SMTP id d75a77b69052e-471beda6de9mr34555901cf.40.1739417863094;
        Wed, 12 Feb 2025 19:37:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739417863; cv=none;
        d=google.com; s=arc-20240605;
        b=HsZ1ovWuHrH7G9uZtT2HVpRgQtwyCiMxH4PyiIpOY5pMGx5MbxcIPM/iencj8cgHCE
         8qkhCKyAhIm7at0YGyJ5dSFIqt5mDxcd/p9+OTqoFM2n/Lrt9E0fOuCk4lBwTGz4+NY0
         veHTXIVgM3m3UPHErSkr+2jh9hWSV17YDqctC/G8tMJrHEjms0FlPbm3SnUSRZIBm2e9
         ZPZ+ETP0WtdN/R4yk8HL4e5AYpBF6mKBD/+kjrMvL1yY2TNBiKacGYo7Xr9T21H9xzfa
         x3G8khaYqz/4E2R9Nw6+Rh5QIarsDgodTLbDxSuejjiVGQtemG8Ahr7Y0rDzcvBZaHzt
         yf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=ohn9vgcfrrTVI/NiDGgEE63MFV7ebzQqjVJI3tUNm1Y=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=gWj7NNr2ORMsz7UgueHRbWkKedjuse2Q0EbKWO+6aPpLkmus5qye28SUJJt328WVsy
         Rgu2oH7qD8l+uXJr7EiJi1d8vCNfq6vc9m3RMSV8vSCSjaBe91RT5sDO9HOTOISCtZ4L
         ZsesRtW8lsXz+NQPKwD68AbvD4ZqBbvYByig6H0Nv94vZA6Ns0SsB+X//I4taHL+6HST
         Dfs21EUpXyI2CvkprnCLRIUN0VcyGeSylG9dpwJvnUMChhcZALp6CnjQBFP0Yf2U+nZ1
         JLhZ/n36bxosrvIrcyfOTh+vIxwScObWKsQIVYAjbb4RjUFvoPvAAz6shvTdHsupnrM2
         Hobg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471c2b600c2si5528321cf.535.2025.02.12.19.37.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 19:37:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tiQ1k-0007ZR-Ij; Wed, 12 Feb 2025 22:36:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ1h-0007SI-UK; Wed, 12 Feb 2025 22:36:34 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ1g-0000l1-Ic; Wed, 12 Feb 2025 22:36:33 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Feb
 2025 11:35:37 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 13 Feb 2025 11:35:37 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 14/28] hw/misc/aspeed_scu: Add Support for AST2700/AST2750
 A1 Silicon Revisions
Date: Thu, 13 Feb 2025 11:35:17 +0800
Message-ID: <20250213033531.3367697-15-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
References: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
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
X-TUID: 5b8rFqmH/MPP

Added new definitions for AST2700_A1_SILICON_REV and AST2750_A1_SILICON_REV to
identify the A1 silicon revisions.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_scu.c         | 2 ++
 include/hw/misc/aspeed_scu.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index bac1441b06..2d9fe78926 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -559,6 +559,8 @@ static uint32_t aspeed_silicon_revs[] = {
     AST2700_A0_SILICON_REV,
     AST2720_A0_SILICON_REV,
     AST2750_A0_SILICON_REV,
+    AST2700_A1_SILICON_REV,
+    AST2750_A1_SILICON_REV,
 };
 
 bool is_supported_silicon_rev(uint32_t silicon_rev)
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index 356be95e45..684b48b722 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -54,6 +54,8 @@ struct AspeedSCUState {
 #define AST2700_A0_SILICON_REV   0x06000103U
 #define AST2720_A0_SILICON_REV   0x06000203U
 #define AST2750_A0_SILICON_REV   0x06000003U
+#define AST2700_A1_SILICON_REV   0x06010103U
+#define AST2750_A1_SILICON_REV   0x06010003U
 
 #define ASPEED_IS_AST2500(si_rev)     ((((si_rev) >> 24) & 0xff) == 0x04)
 
-- 
2.34.1

