Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2504541njb;
        Mon, 3 Mar 2025 01:58:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXImshoCbmog9rEpRjR4Z9umoZ1x/XVUTs4v/DrpLFgxQwJE8RIbyqt4eB6MSaS94CkO6y2tNxJx537Xg==@linaro.org
X-Google-Smtp-Source: AGHT+IHrR8XkMo4wITGy31PIy3u8tiWPOhxXUkgMhyOjNhk7mfJ5sbm4BKWLud0/2zu8DhLQfBFc
X-Received: by 2002:a05:622a:199f:b0:472:17e5:62ff with SMTP id d75a77b69052e-474bc09baa9mr203378991cf.27.1740995906383;
        Mon, 03 Mar 2025 01:58:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740995906; cv=none;
        d=google.com; s=arc-20240605;
        b=ZPEvsL0pE9hg1NO6e7KrPghWCZTA7ejzLxzxqKSph67e08UHy3FS7BTZ6hFQmDWOnJ
         1IxqwXnWTJu8XZhATw+q93fULtch0JRKfR6sy7XsvglQbFNJ2e4/xYJJueXpqUS1Vc++
         F6PbOF0StLCUWuSCZm9sOmyWBhGfOALFeTYBJ7YZLwDG1FiAnrVlQpFAsoUKuI6kVLu0
         01QQJSbXknmFzWkgS3DQfn1aovRUwijznRYocKk7I50SPNHKuWEEU3vKyDUx4QWmeIr5
         /f8rVw7TWe7e1cIHljyD5vpqui7kOwBF3QLJkb/C/uyyPr9bLe0IBklN/tWcZSN9bdjc
         JWMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=3QZIYxvxQBpac2Q4un/8Am+yWgVPjG8T6UeCNnvSKY0=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=bhSrjixs+I3CE6PKM/8tnPxqf9c+OTTWfZzPOJ3jc/6A/xtPRlh3w0ZU/+AfTGqSVK
         +PnLsnU0LXk75V2AbBy+WHg6cix95CDp2rsNHf7uKdEMHgHN4lmjDxkB39MuZvdsUAzC
         BbJwiKN4f1JB5I2SIiDBE60yDQqkDpf0Z0TuG5UKAPZ3CT0eG4QtId+iVRwtoEWACc6C
         LwCiTIAgoAJfrWAT4Z+Sc2/AJ2LWqthTq7vnTVKyKVCaqsKQfep97chQYIBUdQ7IgQgS
         SajPK3yIxOlXnGJ2d+kklYoBTdsCEcJHxdBuRtnPmNAnK2dpFF8krXTnwn3I04UKd6D/
         I9aA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474f2980e53si6455391cf.407.2025.03.03.01.58.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 01:58:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tp2XY-0001H1-Nq; Mon, 03 Mar 2025 04:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp2Wq-00084I-CE; Mon, 03 Mar 2025 04:56:04 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp2Wp-0001vN-1K; Mon, 03 Mar 2025 04:56:04 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 3 Mar
 2025 17:55:04 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 3 Mar 2025 17:55:04 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v4 16/23] hw/misc/aspeed_scu: Add Support for AST2700/AST2750
 A1 Silicon Revisions
Date: Mon, 3 Mar 2025 17:54:44 +0800
Message-ID: <20250303095457.2337631-17-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303095457.2337631-1-jamin_lin@aspeedtech.com>
References: <20250303095457.2337631-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: mnveeV9a2Lhr

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
2.34.1

