Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp33052njb;
        Wed, 4 Dec 2024 00:05:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX6c7DkMJKbtX3jxLSMLf3VyaJKIuOpOAIC8yjs4MvcHMY0J3/9RntABXL0zGm1JsoZCiAY/UQYMeOZVA==@linaro.org
X-Google-Smtp-Source: AGHT+IGWfr0A0n8zOON0RPBlXtkC104rki5gqKD9VfzJfK8At/c0s0xocEBqOWbB4lw+Ci8fOjRA
X-Received: by 2002:a05:690c:23c5:b0:6ef:799c:955b with SMTP id 00721157ae682-6efad2fcd45mr75918737b3.41.1733299553685;
        Wed, 04 Dec 2024 00:05:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733299553; cv=none;
        d=google.com; s=arc-20240605;
        b=EljeOPd2BaprhAaVL0Sd7DZ/B/iNUbDh10c42n6nhUz81JftqMAEWRvce/tkGZtWb2
         0MiRLoAE4jZAJpgj+f4qIJ0VmroLmRgNyaDvq+lJ0flmOrbUlSJTyBh+Ci0QfDeFV7k2
         eglTDGWMJZyUTaQvMQlKPqPkzXtIXxIBD2+dKPCdphB75JsWsodKlxqImsDaBzq9IV9P
         fH4X+qXwJv53gPUeMcFgp//kkLkOu9R1Mjo1Ts68ZtvGnNupSxWweHEnD+UFDOdOqEHX
         BwQ5NMng9BAmoDPbTiRIxzWQwGak6rpsuyql3+T72pKQWSwvHfDjegQZGkYghDIaRD6s
         VLtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=QnOfiYcxr/ng+m/lsz8BuOsVaBuvGzvdBQ0LShoZxpA=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=Zm/9421lkWLd1XmgGhJX8jJni4jRPdK0mapL1KdWOXw2xZL6BgYd3QjDTZULbbVb9i
         PEKYroe42QhWeckqLg9Uvc+E9usLPEzZFEXAvNfacfMWmySF3IOTJ/7bDUMLSZQtvH85
         NX5cWzNFn831rzCDe6imqjbn9BcT0quhaYFHzrNSkmooKO0QgJtuEDo25Nh6XfJtZT0r
         itYa4beluQDi5v2Y4SKH2epR1CCzEIOTswR/sdBvKoM3caly5h7f4nN8+jSwHnCa/B/W
         8hytsyTw7F24CeJJrSKXiYoYb3UPhe+ThZcfzUAGiIM1HYlm1AErRtK2igq38JMjxtPT
         8+mA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4109d1dsi165769871cf.268.2024.12.04.00.05.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 00:05:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIkO7-0004BG-TY; Wed, 04 Dec 2024 03:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIkO6-0004Aw-0U; Wed, 04 Dec 2024 03:05:34 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIkO3-00082v-Md; Wed, 04 Dec 2024 03:05:33 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 4 Dec
 2024 16:05:24 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 4 Dec 2024 16:05:24 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 0/7] Support SDHCI and eMMC for ast2700
Date: Wed, 4 Dec 2024 16:05:16 +0800
Message-ID: <20241204080523.4025780-1-jamin_lin@aspeedtech.com>
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
X-TUID: 1xNA4/OVCir1

change from v1:
This patch series do not support boot from an eMMC.
Only support eMMC and SD Slot 0 as storages.

change from v2:
- Add hw/sd/aspeed_sdhci: Fix coding style patch

change from v3:
- Directly set capareg and sd_spec_version instead of property
- Keep DEFINE_TYPES

Jamin Lin (7):
  hw/sd/aspeed_sdhci: Fix coding style
  hw/arm/aspeed: Fix coding style
  hw:sdhci: Introduce a new "capareg" class member to set the different
    Capability Registers
  hw:sdhci: Directly set sd_spec_version instead of property
  hw/sd/aspeed_sdhci: Add AST2700 Support
  aspeed/soc: Support SDHCI for AST2700
  aspeed/soc: Support eMMC for AST2700

 hw/arm/aspeed_ast2400.c      |  3 +-
 hw/arm/aspeed_ast2600.c      | 10 ++---
 hw/arm/aspeed_ast27x0.c      | 35 +++++++++++++++++
 hw/sd/aspeed_sdhci.c         | 76 ++++++++++++++++++++++++++++++------
 include/hw/sd/aspeed_sdhci.h | 13 +++++-
 5 files changed, 118 insertions(+), 19 deletions(-)

-- 
2.34.1

