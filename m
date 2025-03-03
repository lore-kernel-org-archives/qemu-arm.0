Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2451306njb;
        Sun, 2 Mar 2025 23:36:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXH+xXWnFyXzkjeApK6XTpDhhRj5wVApiUlI204ZgXLEqtmj4MdU0Cumyypt4b0/7aeAa1gj4S/nYC3Ig==@linaro.org
X-Google-Smtp-Source: AGHT+IHJt+rVZBpvCPPmZcd0B/EC46G1JbTgRvOJQfVhWg+sn27lPT7ex7L3rRsG4Fvx/MAR1/+0
X-Received: by 2002:a05:6214:248f:b0:6d1:7433:3670 with SMTP id 6a1803df08f44-6e8a0c80216mr178906436d6.4.1740987386514;
        Sun, 02 Mar 2025 23:36:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740987386; cv=none;
        d=google.com; s=arc-20240605;
        b=lFaEkrw6cR11Wa8I0a0D58+a/JVIfkaG39HLAWUPpM86a1+COoL2P3ks+D/HRdNcgI
         ptwoar/v+NVzd6YtHjoLMBsibKpXxZrdhgPU4rS3iom4WgNZPH18lVFbTE43upGl0Pai
         ZHVbbH1nEdlgBF60Ikbxo1hrISE3NyIghxM5ZeAMP8PoKJpdoRiFO2bZkHaczvH1aXjs
         n2Wg1C3lS3M8109dNzDwEHWUGH035oTq5BMzuCPz+Ycfsk581HrMmWkacdGqcrleHP7k
         JFgwMgKuddnvdcFLHiOhJgedLCzM7B1Q96VXGiA6hACdTRADied3KqCgRhUqpmJ9Fclu
         eurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=KCefA2iPLREDhGMHEj2BXFl5dssGs4UyeRkLYfiNZMU=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=e7KrsWuM80HuNRUWYe/HD84MgOdi3oOyl9O10I8hG3LIDn+UC9LiV56n/yK/eGcvlU
         6cugqji0pMtv1peKFpVocE+ZXEh5sM4ipQ13LvXpDcw4Vz1YFPUINOvuUpXl5ystJXNk
         mABA7xIiNk7Pk4xcouz3Y2uECPiNnXyAObeau7GVw+aXaj0F/eWKmNoICASN9NY/Rs3c
         6Oa/z1d2g6LZjh3NvIxGVnPHXuRy3ygcY7fXkTuUgYYjwRC0y3Ak4naX8ZNUzg1c8Ovo
         6vm2hWFNT1As4VI5JsDOQdipDq9RwVkE/2xsnODSrtS0pe6PM/nvqGpujPuKm2EVdc15
         /m5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8975e790csi80911036d6.39.2025.03.02.23.36.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Mar 2025 23:36:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp0LH-0000lI-PE; Mon, 03 Mar 2025 02:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp0LG-0000ky-4s; Mon, 03 Mar 2025 02:35:58 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp0LD-0001xL-P9; Mon, 03 Mar 2025 02:35:57 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 3 Mar
 2025 15:35:47 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 3 Mar 2025 15:35:47 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v4 0/6] Fix hw-strap for AST2700
Date: Mon, 3 Mar 2025 15:35:40 +0800
Message-ID: <20250303073547.1145080-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
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
X-TUID: Ns32YmuOzThB

v1: This patch series is from https://patchwork.kernel.org/project/qemu-devel/cover/20250213033531.3367697-1-jamin_lin@aspeedtech.com/.
   To expedite the review process, I have separated the SCU fix patches
   
a. Fix the hw-strap and revision ID for SCU and SCUIO
b. ix boot issue for AST2700

Jamin Lin (6):
  hw/misc/aspeed_scu: Skipping dram_init in u-boot
  hw/misc/aspeed_scu: Fix the revision ID cannot be set in the SOC layer
    for AST2700
  hw/arm/aspeed Update HW Strap Default Values for AST2700
  hw/misc/aspeed_scu: Fix the hw-strap1 cannot be set in the SOC layer
    for AST2700
  hw/arm/aspeed_ast27x0.c Separate HW Strap Registers for SCU and SCUIO
  hw/arm/aspeed_ast27x0.c Fix boot issue for AST2700

 hw/arm/aspeed.c         |  6 ++++--
 hw/arm/aspeed_ast27x0.c | 13 ++++++++++---
 hw/misc/aspeed_scu.c    |  8 ++++----
 3 files changed, 18 insertions(+), 9 deletions(-)

-- 
2.34.1

