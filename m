Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1939910njm;
        Thu, 6 Mar 2025 20:06:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWS9Ap+Cs4O122qA/iPKpIXCN+eQxBvr/D/ZotCy7+IUl7fMtfVvoCPKVqaUGwI2T05KWHyapHzeKnuAg==@linaro.org
X-Google-Smtp-Source: AGHT+IGTkUXUJWyTKippjADUGqOZk/w6ckyns6vYWq5UyqSyY89lDQIRFrV32+ZBlPy6vsN7Bz14
X-Received: by 2002:a05:6214:21cb:b0:6e8:9fcb:5f7d with SMTP id 6a1803df08f44-6e9006913cdmr27865406d6.36.1741320371315;
        Thu, 06 Mar 2025 20:06:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741320371; cv=none;
        d=google.com; s=arc-20240605;
        b=ac7eCY7Obb1YLCS6Sie1x47rZ6/wBoYY9030l9ptnI4clky4vO9FoTImz/grbFOUan
         5Y3tpM7Wq8Fxpp7P9W4LurJoNaTdkA/C30mkb7vHeGph2DjPAGje5CABUh5J60awoiYy
         xERzuqlNiJ7ijvrqwRVtwiXeEnVBta6FLNpCEn5iTUIjpRPoFHP4HMAlbWw6PyX3J9ok
         Dgx+sMtTc7dUL0kBYTziBCJm8i93PXGGDRhnEXBX7AgLn4ZTi56QrTRVxmhDI+Us7W/0
         jCWXJPw+G5kD5AV2hriikJ+01x9hYtzv3oewf9HhwGMheF28jbV+IzwWiZihXMdk6g0y
         nHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=ywQu6K2OmBEOp/4ryDG/LqAqBrINNAftZZkrAvB5t5I=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=fjj62BP+7BrlgO+itFRANTV4NVsq8cimSzwZmVdNnDwd7X+kzdSdiDqtj+pOEe3yMN
         BXdRjqqWefcHhDGTal7hvFk55qNFe+YuH4vYj1mJvQJsUjQMV7GP4hVJXas7wXR5l2Xd
         jTcoAP+QVY8PSFbSHSQBxttYDcpUFfHQYoPmBZ29JEY5kAKrbY9ObFBL4qI3hgzvlKdf
         R8kpgOLgL2O3NCCdraYT9iM5sjd5f4IvCdaCNEI+tIv0exxxGbPWbBiEry3URurILcB5
         nrs7d32zHhuf473XFXU1wvUqCjwa2yxq9n/4kbYKzkxSquiw74ZhzylCKECjs51obFM6
         pcZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f7175fccsi26110146d6.343.2025.03.06.20.06.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 20:06:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqOtl-0001HR-1s; Thu, 06 Mar 2025 23:01:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOtg-0000yK-PE; Thu, 06 Mar 2025 23:01:16 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOtf-00053C-54; Thu, 06 Mar 2025 23:01:16 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 7 Mar
 2025 11:59:52 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 7 Mar 2025 11:59:52 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v6 18/29] hw/misc/aspeed_scu: Add Support for AST2700/AST2750
 A1 Silicon Revisions
Date: Fri, 7 Mar 2025 11:59:27 +0800
Message-ID: <20250307035945.3698802-19-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
References: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IREWESsUVmaj

Added new definitions for AST2700_A1_SILICON_REV and AST2750_A1_SILICON_REV to
identify the A1 silicon revisions.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/misc/aspeed_scu.h | 2 ++
 hw/misc/aspeed_scu.c         | 2 ++
 2 files changed, 4 insertions(+)

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
 
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 0581c744f1..76cfd91671 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -560,6 +560,8 @@ static uint32_t aspeed_silicon_revs[] = {
     AST2700_A0_SILICON_REV,
     AST2720_A0_SILICON_REV,
     AST2750_A0_SILICON_REV,
+    AST2700_A1_SILICON_REV,
+    AST2750_A1_SILICON_REV,
 };
 
 bool is_supported_silicon_rev(uint32_t silicon_rev)
-- 
2.43.0

