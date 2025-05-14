Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1044345njb;
        Wed, 14 May 2025 02:04:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4R6tHUGOQ1gA1ogU2eyZBB56JklQ6CEh0WzVY74eNze0SDHSDv0g7jMv05yVay1WZ1fhlr1dLIutymA==@linaro.org
X-Google-Smtp-Source: AGHT+IG+xKf5tuBuOQ1j51oomMav2HvJCJiBIN+G2YX5Bi9ZTze+v5CA5pJkyyg25TQ9bvWQ/2W3
X-Received: by 2002:a05:622a:4d89:b0:476:9180:6c27 with SMTP id d75a77b69052e-49495c8d009mr44426931cf.13.1747213495660;
        Wed, 14 May 2025 02:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747213495; cv=none;
        d=google.com; s=arc-20240605;
        b=NRjNL2tFmEC9s5nOVJxQo7QbBzMcOfkHq7HXx2gL6Ee+OpH4/CIyb34s3zn5RgPSzv
         OTBedMCRRNaqfT00+l+3NySvPOZRm5tps8PcfUXq7gpl08zZbwwNwPrYcD85ZZOgrIxC
         G8E+pnDfWK8uCiJ0GHZNZWmQb9TJtwQYl0vmm4ydaPPGETaGJWkcZ5PK5p4kCX5FTSKQ
         pWbrpJK1pLqk7t4/gINTIM+eas1XvdTlQZClFH5IBaPEr0KI4cl4cig1vZVsvkn5Wtlq
         6J6lcZ3TgKT19ojQ21lVbG2yNBov4RH4XurTsFAVLZD8sHMeAVC6Mscyg/Zp4x6INqNZ
         PV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=4XNoRv0mGHTx6B3kCDytahVfQv0nE/cHz8i18SRhf6E=;
        fh=vQPqsNMqoAlDx9Lray1TJhxW/ME1Lx6izgi/4Tj22z8=;
        b=loRYr3U0gttinCD8DdJL5s9Peh1WHrcst/LJKYhMmN3jg7uAILyMnULb449MONFfoa
         K7vm8umy6Ber0/O2x94Si4It3mE9RcwIVUfwSH1aoL5xSa+MRG/MsktnMj9CCxxIbzM9
         Oe6bMO4Q1V4lTEQmDOKIBZs5knjQfv86Hjq5tS6Ya0w6UW9GDeIxwpDGEOdP42JUp14f
         fzHoiAcvelstCdplA0TyuyseFTcuaBM/cnCbjiP7Jfhc4pn0q24k4D2mKHFcQBnN0CvS
         aONO3ZRW+fH9PKMM7UPU/DQiFArK0VHpNJmNjE6b1mB8yDNeBd2N4HBgdLWzvb44YzUg
         qdBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494525b2bbcsi129162321cf.637.2025.05.14.02.04.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 02:04:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uF82I-0006js-H8; Wed, 14 May 2025 05:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uF82G-0006iv-Qq; Wed, 14 May 2025 05:04:20 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uF82E-0002Ei-EX; Wed, 14 May 2025 05:04:20 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 14 May
 2025 17:03:55 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 14 May 2025 17:03:55 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v2 5/5] docs: Remove ast2700fc from Aspeed family boards
Date: Wed, 14 May 2025 17:03:53 +0800
Message-ID: <20250514090354.1461717-6-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514090354.1461717-1-steven_lee@aspeedtech.com>
References: <20250514090354.1461717-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CeHr0Q2LHMd6

The ast2700fc machine is now covered in the dedicated ast2700-evb
section. Listing it in the general Aspeed board family list is
redundant.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 docs/system/arm/aspeed.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 58a8020eec..43d27d83cb 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -1,4 +1,4 @@
-Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``ast2700fc``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
+Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
 =================================================================================================================================================================================================================================================================================================================================================================================================================================
 
 The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
-- 
2.43.0

