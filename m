Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp3771646lfb;
        Thu, 24 Mar 2022 20:59:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmIPIAtkGV2nC5z2IvSPe76Gc1sNxqt/LsaGg7RY3tEf4HLjtTALrE8gj1sLkBH4RBtz7U
X-Received: by 2002:a05:6214:2a4f:b0:440:eb44:fef5 with SMTP id jf15-20020a0562142a4f00b00440eb44fef5mr7236629qvb.81.1648180794017;
        Thu, 24 Mar 2022 20:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648180794; cv=none;
        d=google.com; s=arc-20160816;
        b=OjfUa7QeLcDsg4GTVCauFAbaDfhMAKc3rA4HEDXfDCa+ts7quYC7sxTfohYauWExaq
         E+0fjTeeIXw5ypau/XR32zgWWQ4zjdZOblC9dN7DZwlcKmpFHSK/yR+5vtM5Xcg221k1
         iNWySgoKtD6wfYr6ZZsAo3ilITi4cWdLlaGb9/ku2Ug5rpQfSzvmLXYt/El/RfyuhtjN
         6YH4aL+4lNKbchsY2/j8a5vk1PO6BMQwSXkgn1UUr2f0VjLnN+nxsWOF8jyKPukGa1GM
         muFEdEtoOkZmIsNBhce1NQspLqWdOWideVAaN3AAkTF0GI5J42/J/SdLeUOGc+Qt+88M
         dTuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=bR7X7fF0LiFyxX1/rHuaOGfc7p+BhgUDVxVAHNZGPu4=;
        b=oRucGiV+l++DRZPftRSYWQlu6RQeMLRZ+SiUnOlrlWWS2inoEKKY7OZv2U9viKLsY7
         WrFwRp32UsHzI78YgejmAdU5KLO7dX5QdjGr2Z9iqUVOJ3adhc8AnmctA3GnvYF6wrlP
         8XAmuA1xAsiMV/Wb/5yEL2qiIWkjyXPReMWa+nEiubgGDPMEvG9iKjUT+IvtR71yw9kY
         GXX5Bcs5xueupZygZNouzfMd8FtcRoNA1Boh9mzU2Jy8Rd9v8ZNuoeMQOoVp/s8btXFY
         6fiqCJJ7qyDHNj8zWnx4lLIqpzSBot07Mwk2mAgXIHPGU9631uQlLQXoAhDD/JH8jNJf
         5H/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020a05620a408b00b0067e4be23a72si887679qko.695.2022.03.24.20.59.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Mar 2022 20:59:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nXb7B-00022B-GD
	for alex.bennee@linaro.org; Thu, 24 Mar 2022 23:59:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nXb6S-00021s-3p; Thu, 24 Mar 2022 23:59:08 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:41250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nXb6O-0007lH-QG; Thu, 24 Mar 2022 23:59:07 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22P3lYdZ033701;
 Fri, 25 Mar 2022 11:47:34 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 25 Mar
 2022 11:58:11 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v3 0/2] Supporting AST2600 HACE engine accumulative mode
Date: Fri, 25 Mar 2022 11:58:08 +0800
Message-ID: <20220325035810.21420-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22P3lYdZ033701
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=steven_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lqqnrfuB2N/5

This patch series implements ast2600 hace engine with accumulative mode
and unit test against to it.

Verified with following models
- AST2600 with OpenBmc VERSION_ID=2.12.0-dev-660-g4c7b3e692-dirty
  - check hash verification in uboot and check whether qemu crashed
    during openbmc web gui login.
- AST1030 with ASPEED zephyr SDK v1.04
  - run `hash sha256` command in zephyr shell to verify aspeed hace.

Please help to review
Thanks,
Steven

Changes in v3:
- Refactor acc_mode message handling flow.

Steven Lee (2):
  aspeed/hace: Support AST2600 HACE
  tests/qtest: Add test for Aspeed HACE accumulative mode

 hw/misc/aspeed_hace.c          | 113 +++++++++++++++++++++++--
 include/hw/misc/aspeed_hace.h  |   1 +
 tests/qtest/aspeed_hace-test.c | 145 +++++++++++++++++++++++++++++++++
 3 files changed, 250 insertions(+), 9 deletions(-)

-- 
2.17.1

