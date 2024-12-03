Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3372951njk;
        Mon, 2 Dec 2024 17:53:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUg3i+js/tiLdBgAUsYHU3OndcKJSpuXj71OohNG+5z0JB1jjNEuB9U4JjkAg6X4nNerkUm2FemeV6x7A==@linaro.org
X-Google-Smtp-Source: AGHT+IHSCjY9Lxfgi1MfH8V5hc/8pizvINrg3H4s/QT0B37MtJ+OVjaEFKR71d3SK0V8bhlyhcZN
X-Received: by 2002:a05:6214:301a:b0:6d8:ad28:adbf with SMTP id 6a1803df08f44-6d8b737f9fcmr14155246d6.20.1733190823089;
        Mon, 02 Dec 2024 17:53:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733190823; cv=none;
        d=google.com; s=arc-20240605;
        b=G1Tkx0BiyQc0LvsUFwpsPzibysovSzHt6yJ+ZOTeDqliVuIIq3ogQNWk7B14qAMFmj
         UJNVoroOJeH1Vgjfi16lJH/zwv3N5s32jJZchhKkmWVzxnbxpc2uxaYXeVzj6wobhlR0
         kNjZ27I7+nYPoTgvddzH+HaoXgEHCwsOatbAL2cUt5tYjnI/KvE19VJJbIva1PXBuBfh
         HB3d5FmcrIKcMqQQl0IxJQooMX7nQhfiIlbWoT5D4zzpSES9KoUO0EfFEi6UGXEyhwNw
         tMGktoBEe3VvlOQeBKUUkbJUV9ge3exdW3LMUSYr3OLSA0sbgmUObGYImBVkx/x98K37
         jKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=8YV6L/+B+c2v1b5HKnEWFD9HqUTIMQJ8LW9azQ2yRS0=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=OQzqn68zQfJF75wTfV7RIX5TUvktGlHa8Mm2Iujr8Cs7ClSylxGGmdppMsaT6n1P+h
         AQV+twxE92ip1PDv7iCh9WxOf097uekB973Y1XzmZQ12bKOQwiERdkEcYhPVjf2bBrkY
         ++GDuqWocEr83yzvNrEBDzqGOQQQSz08pcvxNExwkx1lY0koQbJUJOFDUdQcclqBxB+l
         eZzjX0rH2kgvHuQhAdYplyxlkBhGtQTCC85aMc7FT0PJ1XNmty/4bhtbI1400T9M22eX
         9UOT2YFXV2FQvl364gA8bLcI5pjbkALjo5V5rte43DG4L/iLXp82qUeqQRNubhvAIsfv
         cH+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d88788c277si100586256d6.283.2024.12.02.17.53.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 17:53:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tII5h-0007Kv-Iz; Mon, 02 Dec 2024 20:52:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tII5f-0007Kj-76; Mon, 02 Dec 2024 20:52:39 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tII5a-0006Sd-On; Mon, 02 Dec 2024 20:52:38 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 3 Dec
 2024 09:52:24 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 3 Dec 2024 09:52:24 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 0/5] Support SDHCI and eMMC for ast2700
Date: Tue, 3 Dec 2024 09:52:19 +0800
Message-ID: <20241203015224.3985820-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
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
X-TUID: LAKiPshwVLIe

change from v1:
This patch series do not support boot from an eMMC.
Only support eMMC and SD Slot 0 as storages.

Jamin Lin (5):
  hw/arm/aspeed: Fix coding style
  hw:sdhci: Introduce a new "capareg" class member to set the different
    Capability Registers.
  hw/sd/aspeed_sdhci: Add AST2700 Support
  aspeed/soc: Support SDHCI for AST2700
  aspeed/soc: Support eMMC for AST2700

 hw/arm/aspeed_ast2400.c      |  3 +-
 hw/arm/aspeed_ast2600.c      | 10 ++--
 hw/arm/aspeed_ast27x0.c      | 35 ++++++++++++++
 hw/sd/aspeed_sdhci.c         | 88 ++++++++++++++++++++++++++++++++----
 include/hw/sd/aspeed_sdhci.h | 13 +++++-
 5 files changed, 132 insertions(+), 17 deletions(-)

-- 
2.34.1

