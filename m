Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp324826njc;
        Tue, 20 May 2025 00:36:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXS4CAjHOR319GJmHxJenfXv4V0UU6OWpjEnHxZyUcu9U1txso2lbMtekeLZoNkmdOYZmb/FBq8nHLJhg==@linaro.org
X-Google-Smtp-Source: AGHT+IGUatwhPDxlOf62i4nY+p+M+tMAsiFDnDeY8Gw27aHJA3mAbY8sBjke24afn5m99M49pJ/Q
X-Received: by 2002:a05:6214:2341:b0:6f5:3f55:343c with SMTP id 6a1803df08f44-6f8b0902b73mr291916226d6.32.1747726603392;
        Tue, 20 May 2025 00:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747726603; cv=none;
        d=google.com; s=arc-20240605;
        b=ePivkr7nQpHMNZEfeCDFh1Iti32fnV2AFZWyUBRs2yHlX50fTrr8H4Y6ulUSfN12Zf
         6cCuKIX1Rd1sv/OyYuPFBxnQTFIMQf2d9Ld+rt8sbnrXBuvttDOVrB8M5VQ5PuVkMPKo
         jVEAHtv/2YZavDKufVeRPAkdOLlBUV6TO1JLPOA2y2DO9DNyJE7H7XjlaplyYj+kQuuK
         v7dEK4pUjGYhfq1EQZ17rZ+wCu+XK4CtWGk3BFrRyQKHkroyfJl02xEia8Kc5XLiTeVG
         JT4nbvROdabvO+xN95++VtkcZO57gHzzqWCdrzESTAuErKdLYI/iFNLR1//TTZ22ahVV
         kEIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=myxfeLNDaV2gklqOwwlsWew052lzb9e+Xa3vDobXLUE=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=FTo6L7eLdjCleqfS28f4913sITzbGOnuxsH9PFx98EpHUvCaK+fUq0CFnWXzZ/dhC3
         1clraGkpe9yRfjFkVDKAw/s1+nEsxjipkMzEEUmEFRh+kklZNV1b8xr4PjKfeqyYf9DU
         L2JISAO9lu59d8adgLmoRSGdJegBVgDS6wRQO1WqRv4bzZCMi8fvCikPbjoUK34yETv6
         F9mfzAEdBOkFx9hcSrOiMiYoklALC2k4QCDS95QQZehVbwgwgQSlz6uvDiW+sSx0p8au
         ZsC3OsvoyqTerEtO2OvbfMIAd//MrHWPdoG5jvHCPJgGyaNEwDhmuEFKA4e/TzM+Aqua
         qFfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8b09b8444si102304286d6.348.2025.05.20.00.36.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 May 2025 00:36:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uHHWA-0002cH-J5; Tue, 20 May 2025 03:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uHHVw-0002H9-QI; Tue, 20 May 2025 03:35:56 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uHHVu-0003tR-HF; Tue, 20 May 2025 03:35:52 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 May
 2025 15:35:40 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 May 2025 15:35:40 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 0/3] Fix RAM size detection failure on BE hosts
Date: Tue, 20 May 2025 15:35:36 +0800
Message-ID: <20250520073540.2014240-1-jamin_lin@aspeedtech.com>
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
X-TUID: lH1flG2rxj7V

v1:
 1. Fix RAM size detection failure on BE hosts
 2. INTC: Set impl.min_access_size to 4
          Fix coding style

Jamin Lin (3):
  hw/intc/aspeed: Set impl.min_access_size to 4
  hw/intc/aspeed Fix coding style
  hw/arm/aspeed_ast27x0: Fix RAM size detection failure on BE hosts

 hw/arm/aspeed_ast27x0.c | 21 ++++++++++++++++-----
 hw/intc/aspeed_intc.c   | 12 ++++++++++--
 2 files changed, 26 insertions(+), 7 deletions(-)

-- 
2.43.0

