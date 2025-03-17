Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2054131njb;
        Mon, 17 Mar 2025 00:05:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcbFOoyGFfd4y+Wdc8xPqgu7ZZK2xaqkwy39+kHA+bpx0N93yeBWHsHnO+GOKcN7tDnpcAAbHMZFrbcA==@linaro.org
X-Google-Smtp-Source: AGHT+IF/AUXrPlcmC1G8/Sht1mHaLYHXNMxwCLqJuGGEj0ZM6e4xrv6q8dY1DT98S2vK48nx2Koj
X-Received: by 2002:a05:622a:11d4:b0:476:b956:c5b9 with SMTP id d75a77b69052e-476c8152ccemr172748641cf.27.1742195148802;
        Mon, 17 Mar 2025 00:05:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742195148; cv=none;
        d=google.com; s=arc-20240605;
        b=DYObEk+CPERMfpk33CDwDuKYzURsXk1FRzJzjDD4Iv6xa1Olg5klc7Edvn4smx0Nn8
         f3NwHFsyUhAReyfBcPJ2PNO7Rvu1rC5BDQ88ege5V/HEAxYrV1pQzbWbXL45jB+eFj44
         WsstdR/eGU/JWRmPi1b1azjSO2pZYedKW+yVg+ajJbkULztEu7u5jHswBZNggmRvVJyO
         GmUXvbk9eJbY9A1XkUUcclM3ln9XqObK1j2HLeR+bECmrDyt8ovW49xVZT3ug4X2eSfF
         JPZ9Qwml8RqKsKvrDRLwn3M0peeA0okOG39vTBv262TkjsejpIcSzwNb99jaGdwlqvhZ
         HVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=yIFfyqd/DfkkXMbKl0xXDO3u0HcFv9JUv2hTmiTo2do=;
        fh=3pwoN2jATzlbrF1hdgMWpXpxIEomk4/s3GQqt40kaGI=;
        b=BhchSRHx9vleUIVyXwBWmLkb2t1y7qUupHIvDmg5hMkJ/OaluOWXzCdVCgiJrAU9l4
         GBnCKBfFbw6Wq8oWJFZyMqTDFbGcGdRXM60Ny8Kb2N7IG9acx3HK9HTzjHpiwwLeqXHP
         FMkjLtauTAubf3x1ZUb6VvqC0u0LyQUrH55D1ko3sDbCEFgzTy2QYDhhQiexvusX+itR
         9R92qhvhrqfaJQsdPj8W9BVPyXLOz9Us63637miDR8K0didgQczApcklt28kw/F1lzhe
         W0ge5r4zEfldBhmCv8k6BAXz0Es8DnsTD74rPbSlGR7BRRdJHTY56fuue05cZUx/9e2+
         ogKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb8589easi92440811cf.551.2025.03.17.00.05.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 00:05:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tu4XM-0002CQ-FW; Mon, 17 Mar 2025 03:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1tu4X0-00024z-GB; Mon, 17 Mar 2025 03:05:02 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1tu4Wy-00027F-2m; Mon, 17 Mar 2025 03:05:02 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 17 Mar
 2025 14:59:38 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 17 Mar 2025 14:59:38 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <yunlin.tang@aspeedtech.com>
Subject: [PATCH 1/2] aspeed: Fix maximum number of spi controller
Date: Mon, 17 Mar 2025 14:59:37 +0800
Message-ID: <20250317065938.1902272-1-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=troy_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Troy Lee <troy_lee@aspeedtech.com>
From:  Troy Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KHLW3tZX6Bwn

Commit 6de4aa8dc544 ("hw/arm/aspeed_ast27x0: Add SoC Support for AST2700
A1") extends ast2700a1 spis_num to 3, but ASPEED_SPIS_NUM defines the
maximum number of spi controller to 2, result in ehci[0] is being
overwritten in runtime.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 include/hw/arm/aspeed_soc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index f899356ed9..f069d17d16 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -42,7 +42,7 @@
 #include "hw/char/serial-mm.h"
 #include "hw/intc/arm_gicv3.h"
 
-#define ASPEED_SPIS_NUM  2
+#define ASPEED_SPIS_NUM  3
 #define ASPEED_EHCIS_NUM 2
 #define ASPEED_WDTS_NUM  8
 #define ASPEED_CPUS_NUM  4
-- 
2.43.0

