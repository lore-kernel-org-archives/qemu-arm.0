Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp2413771njc;
        Fri, 23 May 2025 02:32:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXiyCoFt/nt14Jeuj3DdAIIOQL2ET1a2yTr8TyAz1BVBVm7Nsmhn7G9pOZi2BQOOVaf+WkDMjN6hRu+mg==@linaro.org
X-Google-Smtp-Source: AGHT+IGVyRHaqxE8/FgI/GXSrNwa2/dlVB91razP9enctYjV0/JZU7f4zIuiNyi/l9EdBPR4ImmL
X-Received: by 2002:a05:6e02:1547:b0:3dc:90fc:282d with SMTP id e9e14a558f8ab-3dc90fc28dfmr40874655ab.16.1747992743672;
        Fri, 23 May 2025 02:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747992743; cv=none;
        d=google.com; s=arc-20240605;
        b=QPk562UsGvs26fazOJcUeN/goqSCoHA7DUTLL4JwXGoGhrpwS7aPGnf64dqcpa5Kjr
         Rb9n6wgALqkZsCVAKlKQcuMKSUrcqXdUUq7XqR5Qhlj01uYr4jVyRcc9ACy4TCZt98dH
         VArDtu60xFusuZHCl0CHrBk2RUKBinNC6brIWRxGfgSCRL8rEGEiVPyXc8TvnHlwF/1g
         EuaTcox1tD9susvFvHDy5z0uAIK35One7EdsRg76QLhuosLXceZDpOvb4L3xkefwKg2z
         hpIzv3o+gWleXu39ikIkP0Ay7Zt+RgS+qh9dqdmUyaU9M/Ksy49CVwlU8HGpCiInHbou
         +YyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=yqZQkF7fyoCyixWqJvPrcSXLF7zDV6t9Bf+U6Pb/AUQ=;
        fh=vQPqsNMqoAlDx9Lray1TJhxW/ME1Lx6izgi/4Tj22z8=;
        b=I6WspkWWQa6LYuxtR2yH4+tda5KwBdZh2s5mZ6L3b7l55AoqTymTRS//ouxEV1xIbD
         Y+HE8MxZp3DQZ4gTiQxwlHCQsmSt+wMKw9xxOCnlg/zWH+GzQBGfMOZhbjX9NsCUQX9n
         R7WkjUA49FOReSaIApB6Kyoqs5CN0PpdY8pBS84XOwsSuOvodUCfD3N8LTUdlWisWTzX
         Pa8n1XU2sq2+tN9w9qpTum11NikwIQhmVmAK/bINn2B6yHVqH5ZpjzNS1jxwFl/Amvex
         GcgRdHMo8mepCgTUGpGundGwl0ZvU5R/8FHyRT0n5C7x3ojyaqXpAT3XiMTOGdoDAOY1
         Y+wg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9e14a558f8ab-3dc82e59eb7si62449815ab.10.2025.05.23.02.32.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 May 2025 02:32:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uIOl9-0005HK-5M; Fri, 23 May 2025 05:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uIOl5-0005Go-Ib; Fri, 23 May 2025 05:32:07 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uIOl4-0005Md-5u; Fri, 23 May 2025 05:32:07 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 23 May
 2025 17:31:46 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 23 May 2025 17:31:46 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v5 5/6] hw/arm/fby35: Map BMC memory into system memory
Date: Fri, 23 May 2025 17:31:42 +0800
Message-ID: <20250523093144.991408-6-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523093144.991408-1-steven_lee@aspeedtech.com>
References: <20250523093144.991408-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J5G04RPXQQZl

Add the BMC memory region as a subregion of system_memory so that
modules relying on system memory can operate correctly.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/fby35.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index e123fa69e1..c14fc2efe9 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -77,6 +77,7 @@ static void fby35_bmc_init(Fby35State *s)
 
     memory_region_init(&s->bmc_memory, OBJECT(&s->bmc), "bmc-memory",
                        UINT64_MAX);
+    memory_region_add_subregion(get_system_memory(), 0, &s->bmc_memory);
     memory_region_init_ram(&s->bmc_dram, OBJECT(&s->bmc), "bmc-dram",
                            FBY35_BMC_RAM_SIZE, &error_abort);
 
-- 
2.43.0

