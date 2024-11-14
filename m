Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp205470njc;
        Thu, 14 Nov 2024 01:49:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXDkxYQQXsUQ5cjYBa0gRI6asiqAutlaahTUUYuCSkcj1NSrzJ9+cz6cLcQOrbcWJ23IbNCct4wkpELPA==@linaro.org
X-Google-Smtp-Source: AGHT+IF15Y1IBn5IK6ciMmYzl3OPerOJ3PpdogfPcsAYoxchmkwNW4LFh6Ra0ekBdKUGa2AIaKoE
X-Received: by 2002:a0c:d850:0:b0:6d3:ec06:5b17 with SMTP id 6a1803df08f44-6d3ec065beemr12373716d6.34.1731577752293;
        Thu, 14 Nov 2024 01:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731577752; cv=none;
        d=google.com; s=arc-20240605;
        b=SCTFwqvHZ6BrMKD+dCbe2PTKulX/O2dDIwyL3t3Tv53hz14PMXKQt7F/s1QIT9LcBy
         oCjKyiRDSKvClLoqcfG6SvijlCovY3Vs7gbn1bBa7aPmnJwaqjnaFH6bdEw2QahkQJlD
         QVOhAwCtp1A6xadwWCSVPz9bb65J/hZ6Y/55IFE7ksaIm08k+UtkqWA1Wj2ePo0Cn4ZS
         4KUUJ3qGGPRVgRIa392cAv3CLMwn1w05tFi+zXlmrl77eC87gEjWKOF4kgMolJV6sB84
         /iGea4h9nt9EFIlhA2r8h27jZ7yEpVhxe7LxK4OE1SxMT9HA8xghbH3OoWz3Sz1Ufum2
         EcGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=qXVVJFVlksQMaHHqVhdI4VyVtbZtsFFfMj5MNhJZqNU=;
        fh=4rHsaFhVkVMXk5u1IVZO4usPBujjRbqK1KMv0eZ+6CI=;
        b=VyrnNAL6kCFqd44eFxbj4ZFN3ZOL2gAbeX8jUWS/5O2YLNh6e9njQmynb4Y/bwN9Kt
         tYziTid5yekUGTY3yW4vpCtGAs3fw8JOOtElvI20qMpTl73JibBYtx6LeITL5pl/Fr8F
         Ih1+TpFKCAJ8lhWM7x+2vCL4C1BBo+tjpli/2y23alfEBuUaqJ2nmO9A1iSh2t6sScN4
         K16pFHE+ZNbttCY2NGZxrXfbHWYVXF/0SRl/WubFF8ymNaXOZ51oJlcqDL1H/AtGmAq5
         ZdETc/IpZoYJKuSr5SQd9/MbyQkeiW4n0uYsJCMXeniaFP6lwopES4SqFxtdZeoTnw58
         y5Bw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3ee9bd9basi8362396d6.467.2024.11.14.01.49.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 01:49:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBWTA-0002OM-Tk; Thu, 14 Nov 2024 04:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tBWT5-0002Nq-7b; Thu, 14 Nov 2024 04:48:51 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tBWT3-0000F8-50; Thu, 14 Nov 2024 04:48:50 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 14 Nov
 2024 17:48:39 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 14 Nov 2024 17:48:39 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 0/3] Introduce a new Write Protected pin inverted property
Date: Thu, 14 Nov 2024 17:48:36 +0800
Message-ID: <20241114094839.4128404-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
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
X-TUID: 2S2rWygVFXYX

change from v1:
1. Support RTC for AST2700.
2. Support SDHCI write protected pin inverted for AST2500 and AST2600.
3. Introduce Capabilities Register 2 for SD slot 0 and 1.
4. Support create flash devices via command line for AST1030.

change from v2:
replace wp-invert with wp-inverted and fix review issues.

change from v3:
1. add reviewer suggestion about wp_inverted comment
2. AST2500 EVB does not need to set wp-inverted property of sdhci model 
   https://github.com/AspeedTech-BMC/linux/blob/aspeed-master-v6.6/arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dts#L110

Jamin Lin (3):
  hw/sd/sdhci: Fix coding style
  hw/sd/sdhci: Introduce a new Write Protected pin inverted property
  hw/arm/aspeed: Invert sdhci write protected pin for AST2600 EVB

 hw/arm/aspeed.c         |  7 +++++
 hw/sd/sdhci.c           | 70 ++++++++++++++++++++++++++++-------------
 include/hw/arm/aspeed.h |  1 +
 include/hw/sd/sdhci.h   |  5 +++
 4 files changed, 61 insertions(+), 22 deletions(-)

-- 
2.34.1

