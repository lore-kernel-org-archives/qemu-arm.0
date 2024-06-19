Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp846807dlb;
        Wed, 19 Jun 2024 02:36:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXL4btzxR1mGHeEtT6527OvPcttDRXZDzrT0oP4GrDHs2dKV7GkkAqvR2IBy3NL551Qvh6YyDi9EJZi5TUDLCMvP+0s/cay
X-Google-Smtp-Source: AGHT+IFS5iZCBq3aERWaUrtej+yEYEsXK2ypY+R3FSkwv6KnCYojfi3o57zf853xTWB8xiCSGIw9
X-Received: by 2002:a05:620a:4614:b0:795:220e:fcd8 with SMTP id af79cd13be357-79bb3ecb23bmr230362585a.49.1718789799648;
        Wed, 19 Jun 2024 02:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718789799; cv=none;
        d=google.com; s=arc-20160816;
        b=aG0f90fRDrzXigx3FTfpfJghftR3GAD6IoKDPLFATUq+80RBOOjRWEulPI3Gwi9Jbo
         AHOzoXkFp5aLtQyzKWInwOpbvEz+m0ilKR7it1O/GOfLyDmXy728PkASzZp+ayP2akrc
         gk3flU6vrHFQ/1qC5WtVPYoovD6iA64sqKtip28K2Jo7i7tSlOPJw9OPuGBP4QdX0wjA
         Ki0dz52aoH4YyzHhpLa8u1t6r/T8h0sf/728/dTIY2XN9vxTbPMFNwekj8bjv8akDPq/
         VXiBZkpgh2jHrGSjeWzlHD+gonwEBQBjVCBn3mJmuLVhWXtPKuljRkmW42CdnthaVsc9
         U2Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=bRg++dw7sLyadBqeCugReVjRZDSQ6mOgdXR5cWXQStQ=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=y2+K0r9P9zQji1REF4LrNcMhzhk9ceeU5naKKDq3b3eu3lhFwgmaPNtivw+uGWe+Lh
         SDFOljbnWWBjMl58ktJy3iUFxDo5U0/I6tEo4+jjsAqBe+nYJ5z5fhYfpunQpqJlwq6I
         8ca2yVkyiRGJXsr918nR88BoadTBdF0NO8CeEj8jwOBF/ME+EmMd7BisaYpRaL+aX6cW
         1yu8OHRYBVSQonjYN/uH/BZIyIVli4e0jq35qDkT9yWFFqP9p/6NWjkrn9WMkkawVfPy
         CEqt084ZXKAKFDaWGo6yZYO14DaLGhKS6pLi+WYbsJKrCf6jGRzSnORmxjZR0F97MsEq
         B8Dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798e10dc977si1227383185a.191.2024.06.19.02.36.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 02:36:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJrir-0000bZ-MQ; Wed, 19 Jun 2024 05:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sJriq-0000au-HD; Wed, 19 Jun 2024 05:35:20 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sJrio-0006py-DE; Wed, 19 Jun 2024 05:35:20 -0400
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 19 Jun
 2024 17:35:09 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 Jun
 2024 17:35:09 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 19 Jun 2024 17:35:08 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 0/2] Fix coverity issues for AST2700
Date: Wed, 19 Jun 2024 17:35:06 +0800
Message-ID: <20240619093508.2528537-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: MWqShHHtnMxv

change from v1:
aspeed/soc: coverity defect: DIVIDE_BY_ZERO
aspeed/sdmc: coverity defect: Control flow issues (DEADCODE)

Jamin Lin (2):
  aspeed/soc: fix coverity issue
  aspeed/sdmc: fix coverity issue

 hw/arm/aspeed_ast27x0.c | 6 ++++++
 hw/misc/aspeed_sdmc.c   | 1 -
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.34.1

