Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1722158njc;
        Thu, 22 May 2025 02:18:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMO5oLsHNYDjkKnO1IQHRRLSoYp4Hg4JRfDydef8ffiPznbsHUFhknp1Ha8RvK3o5ZlkBPM2BnbrHtHA==@linaro.org
X-Google-Smtp-Source: AGHT+IFi03Q6FtzeAl1IKfsEdwxE+qk750y1ltNkybqjYroG3Yzb05d8UwXoGZ/e0KoA6kNQfz+o
X-Received: by 2002:ad4:4ee2:0:b0:6f5:106a:271e with SMTP id 6a1803df08f44-6f8b08edabcmr418722326d6.38.1747905490788;
        Thu, 22 May 2025 02:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747905490; cv=none;
        d=google.com; s=arc-20240605;
        b=TRL4Z4414k1ITQBkBlyl++mxQ2ETkx/AecM6gPAXN+Tsugz4iw7kDnG7va0uS954n2
         hCySUEdSxDdLR6GOyB1SnK1Xg+Qeb5h3WdilxmtJkqdmcnDHUhPDVafWbSzKujnXA/5L
         W38b47SSch2D/8+scecAtbQzIbZBE7h2FmnFbKqEoLP8GuAoQsazvJIEny/xS67OxkxU
         PY97StIxpR9gnfi5rpo/lIU7vN3WSofxKKugq2CfLGEJt3PhWaLx5bm5sHV5EBPfeJMo
         R219FHLWba+5B7fToswFJ9JTx3G2is+C0N3EjnQeFMEj1NjPSJxzB1M82R5qMnetawwe
         KlwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=4XNoRv0mGHTx6B3kCDytahVfQv0nE/cHz8i18SRhf6E=;
        fh=vQPqsNMqoAlDx9Lray1TJhxW/ME1Lx6izgi/4Tj22z8=;
        b=fOweZg0QysH19YBLDjsoGP0sBLoUjbgRi2XKjNCTHQyxHklpMO6uYlUMgczzbIYng6
         7jRIiPqAU+4B/OQx3B/AmKlgx3xUR377DxreOoe0Yzv4ZVBEMSs3M7TmsObYc0QEh0rq
         U1sIir+gabaL9SxscsiqLO1GADxnmpxgd0b3bzSwWbDVFRr855rMa0iUHFupwgtw0vzV
         h02RVoiXX1Lyf9sZiIEg4ZEWV5AQAEdALEb9uc/7W0U0XIjbvir/yZkwxCpYssr4o02Z
         VRqXRigTrUCghdm+LN9CT14wwyh8WbUgS3weNk6sQ2q/Hcpv8dtf6EynAhBbhBb8L4TO
         psTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8b09c30basi154465026d6.405.2025.05.22.02.18.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 May 2025 02:18:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uI23N-0006ea-Uh; Thu, 22 May 2025 05:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uI23L-0006dF-BX; Thu, 22 May 2025 05:17:27 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uI23J-0003Jw-OK; Thu, 22 May 2025 05:17:26 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 22 May
 2025 17:17:03 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 22 May 2025 17:17:03 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v4 6/6] docs: Remove ast2700fc from Aspeed family boards
Date: Thu, 22 May 2025 17:17:00 +0800
Message-ID: <20250522091701.354185-7-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522091701.354185-1-steven_lee@aspeedtech.com>
References: <20250522091701.354185-1-steven_lee@aspeedtech.com>
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
X-TUID: NCH3wPAlzl+U

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

