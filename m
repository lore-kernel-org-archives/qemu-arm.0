Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp3021101njc;
        Wed, 18 Jun 2025 01:01:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVsv5TKOpOVUwwkKoh+k/MrIZhhzaUPqCUJfNkNvPqvlyUzCLmHIYEaSLj068TIYVXIkJUgEEyyxe/qcA==@linaro.org
X-Google-Smtp-Source: AGHT+IHbB6z1+M+GUsg6PQ8PXJcgQ5rLN7+fJ0VI4De90CgqnEZYw5qmXAdY8WGvRRUbF+KvKf0L
X-Received: by 2002:a05:622a:1210:b0:4a2:719b:1238 with SMTP id d75a77b69052e-4a73c59156dmr239288761cf.12.1750233689276;
        Wed, 18 Jun 2025 01:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750233689; cv=none;
        d=google.com; s=arc-20240605;
        b=g88puWz0SzBF6yKt61HpHjWcC2mfy+hYqI8MAGUMrVtKYWzLRf1f/es4aZmYYeBNEZ
         sZUyzsJ5O2NHwwCKmpe32i42A5GFtRsknkPsY4Epy4fHrOYj0NRYHttwXHvRvuv/nv68
         TjKbwlbKIxSercBnYH9XJOeDSOP5eHCl/5Z+EqU/Ju0fWWCz4LTMWhxOnO905hLoMnAE
         WomaKEbGlT4zQncqTUaTvAh3v1l8DHnKz3tsPQ2vOXA5gqM9eBOuYZMHSSg4msW4nf0Z
         BfCplsiBMa2pzrIKVCFsrbKpg9WNsL+Ck6pop5lP/tBmR7VH7grPHCMj3rGdJUsRqKFm
         aQmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=A8sJ62I+oo1JGjOX95lVHECSvJK1bF0gMWuHW9wdmLY=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=AX0Q+eOqgmlmqyUlsGTjjyCcsmK9BvYVZOwHlFKA2TB2Iua0tjhj+vTj+0Oee5/66q
         FvZ0seLrm/1LiOJKaZckWFWswJu5VgJSQGiENE1c77JnBBMrhKJWFTusbm2xpA/MlBPX
         7jfT60E1Sz/pcpmFmy0gfuFqP9cg41h4mb+QtLkmoSmqJzCiRHCVxJ+9D1/zvhyy6XCY
         rFXqruVpnXmCh5urEGiRrccmR1dmcGxzSoVv4t1pVdjNCLU1DsDvBIviVcuX5gUVtDso
         xhW7z8BbXRyPZ3qZf5vKkHrnb22J8/R6m//Um+wfXlzN9CEZYerdDPHveLGFOuJ12Rtp
         HrFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a4f798fsi154222191cf.471.2025.06.18.01.01.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jun 2025 01:01:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uRnin-0001LJ-TJ; Wed, 18 Jun 2025 04:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uRnig-0001J2-3n; Wed, 18 Jun 2025 04:00:31 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uRnid-0006A3-5Q; Wed, 18 Jun 2025 04:00:29 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 18 Jun
 2025 16:00:06 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 18 Jun 2025 16:00:06 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 1/2] hw/misc/aspeed_sdmc: Skipping dram_init in u-boot for
 AST2700
Date: Wed, 18 Jun 2025 16:00:04 +0800
Message-ID: <20250618080006.846355-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618080006.846355-1-jamin_lin@aspeedtech.com>
References: <20250618080006.846355-1-jamin_lin@aspeedtech.com>
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
X-TUID: wKOdmZgN/JJj

On AST2700 SoC, QEMU now sets BIT6 in VGA0 SCRATCH register to indicate
that DDR training has completed, thus skipping the dram_init().

To align with the recent U-Boot changes, where the Main Control Register's
BIT16 is checked to skip the dram_init() process, this patch sets BIT16 in
the SDMC Main Control Register at reset time.

This allows both the main U-Boot stage to correctly detect and bypass DRAM
initialization when running under QEMU.

Reference:
- QEMU: https://github.com/qemu/qemu/commit/2d082fea485ee455a70ed3e963cdf9a70f34858a
- U-Boot: https://github.com/AspeedTech-BMC/u-boot/commit/94e5435504fb0d8888f5c1bfd3fa284cdd6aaf9b

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_sdmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index f04d9930dd..dff7cc362d 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -570,6 +570,9 @@ static void aspeed_2700_sdmc_reset(DeviceState *dev)
     /* Set ram size bit and defaults values */
     s->regs[R_MAIN_CONF] = asc->compute_conf(s, 0);
 
+    /* Skipping dram init */
+    s->regs[R_MAIN_CONTROL] = BIT(16);
+
     if (s->unlocked) {
         s->regs[R_2700_PROT] = PROT_UNLOCKED;
     }
-- 
2.43.0

