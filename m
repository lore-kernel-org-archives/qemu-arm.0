Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp2414323njc;
        Fri, 23 May 2025 02:33:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXzYd4KlHdVFn8oqyyqiLnTK2wAA90bRYfxLKb8pxlSC627gIIEVHWhugNVDKhAXrDvnbRGrNAg+kSG4A==@linaro.org
X-Google-Smtp-Source: AGHT+IG88k7wO7PlHSt0WrUQn7RqgSQRIovePXJ45XzVRmnRWV9JpVKdtaZ2X2CRIdD11TxwLp9y
X-Received: by 2002:a05:6e02:2164:b0:3db:6fb2:4b95 with SMTP id e9e14a558f8ab-3db857a6f7fmr334017835ab.18.1747992821268;
        Fri, 23 May 2025 02:33:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747992821; cv=none;
        d=google.com; s=arc-20240605;
        b=hQ2kUgp64VEY6S8oOwFQXSbbCh8czJQ5PpsLSYUmla0oSumTxRm5JfMQTtLBg2JA3A
         Zt+2Fx8D6Fms60DLvKpUT5rEq07f0RmEOFPlAZ2Os0Z4Ynvp3z7a3Z+0qUX0Y7HWRdAU
         QA2EuE84vlyGkiGr09v7rkQcqGjIcaJmhrUD/Ri9aNPSxolHD0GcTAjks0J7f1xUbHIM
         8CQ7WbdKE79ZlV7f3W3kptCceIKskgaxvqTqYNAOCoAp7+RSCo/+vVH1bOo84Rwe6mMj
         QX0BXAaPlqcbQn7SMOUHHORA8vpgtM9lxvWOxj8joOCbgfCIUNP7eYq+WZwJFx9BP9+0
         1lkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=4XNoRv0mGHTx6B3kCDytahVfQv0nE/cHz8i18SRhf6E=;
        fh=vQPqsNMqoAlDx9Lray1TJhxW/ME1Lx6izgi/4Tj22z8=;
        b=V2vCMtAsnT21pNodQx9DhPfD9XWfg75B7+Sfgsn4QnPSmwOecgsI5qXVsOqQqUQ8jn
         aZdsv2DDEGW+91hX4ZaN+be5LUxP1d7MOkPtjkKBsOqBFhB27x1l0TubZ6+KpMuC8ItR
         dTh8DQB2bnFqoe5W0R+spKMzJ+vF3lyoG86yLy3hQ3K+JHsXw3JX3w3NCU7gAlnhtmWs
         ltqks/a8QAppzYFVKBYVjRW0ACgfukJQNY0JWREeg/UsPyRE3p1Xadz0XJ0Ft0bgy1sr
         1UvUdWLnd7mSiWIGr2TQi4ZWc7fY/qvH7h12HGpoGd3b+Rn/AI8Doql/8xX869Ovtbkd
         Ukdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8926c6da1cb9f-4fbcc4bf24dsi17352893173.147.2025.05.23.02.33.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 May 2025 02:33:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uIOlD-0005JH-MQ; Fri, 23 May 2025 05:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uIOl8-0005HJ-2J; Fri, 23 May 2025 05:32:10 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uIOl6-0005Md-Cz; Fri, 23 May 2025 05:32:09 -0400
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
Subject: [PATCH v5 6/6] docs: Remove ast2700fc from Aspeed family boards
Date: Fri, 23 May 2025 17:31:43 +0800
Message-ID: <20250523093144.991408-7-steven_lee@aspeedtech.com>
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Z/Fb8Kd8nQqa

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

