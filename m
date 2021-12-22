Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp2541967lfb;
        Wed, 22 Dec 2021 02:25:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+1OoWRCGeqdfp2ptphcutXG5Cr9/JNDBqgUg7//SeP7fEO1pyrF8G+P8ycVUBjpoYRajQ
X-Received: by 2002:a25:b907:: with SMTP id x7mr3497427ybj.566.1640168759158;
        Wed, 22 Dec 2021 02:25:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640168759; cv=none;
        d=google.com; s=arc-20160816;
        b=DNz9gAlbaZHH5pPpcjLLPqhyzfK7SS6IpHj21tUPSo2Bzb2AVFbSmxv4Jetb8IR145
         m8+0q31azqSNeMC85qHTkmvi5+65Q/6i24A0rlWFcA7xrs+ljAjkm9f8Qfrxl/F0n+Oj
         1Lr9YVHD73CrBxUDdTsh/G1taHigwTLIJoete4p/XmsKLnCZCFYci1WCDK9fZrQ6NcRK
         4ZRrqTHn8OFYFQxBeSwh0PSdDwT6ONpIrFm+4HJWGRcv98t8qNHL+WyDEBzsTvyVFKIs
         BbpIpUkMC9ikV+d8EllyODfFC3JxwhwKoKTVF6T1m+CYVMeoDojwNLLaWT1C6R3JvAZk
         7/YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=WCgQM6bNl2blPaW2CtfXzM6eeLOJ3YgKEC8IZGEe8l0=;
        b=GGGJIajBKCnILHnMyvuvIcMwxqXnup6EnAdd7hGZtTwH45KqBszod9FewHqZhOmI74
         u51S8HrfDquMFrqouIyi2o2k8eoPAOtnaYA0y2SClVgNV8VASp9GVYeccT8n9eZJgL4G
         NRWoJ8C0cTX6+us2Iu7m3D1zZ3Vo6sTrMtm4yM19s3uliX4gThh4RlN4anr7WYAmvLK+
         W3Fr4nd8mJD0M7s5UJzFoCkLeF2Kg4DKJkCzLSXuJjm/Eh4InU7UmcoKCxo1DniqbrmX
         v/ilKIOA8cu0E2/DpaWqTynZkxqO5NHp7BpcdEa+knWf7jQFpT/GMays+M+py5aKw+HW
         uu1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13si1591707ybk.299.2021.12.22.02.25.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Dec 2021 02:25:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mzyoo-000519-JV
	for alex.bennee@linaro.org; Wed, 22 Dec 2021 05:25:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1mzyoO-0004zY-DB
 for qemu-arm@nongnu.org; Wed, 22 Dec 2021 05:25:32 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:51062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1mzyoA-0003VD-Hn
 for qemu-arm@nongnu.org; Wed, 22 Dec 2021 05:25:30 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1BMAJ0j4086708;
 Wed, 22 Dec 2021 18:19:00 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 22 Dec
 2021 18:24:26 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH qemu master] hw/misc/aspeed_pwm: fix typo
Date: Wed, 22 Dec 2021 18:24:23 +0800
Message-ID: <20211222102423.3121181-1-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BMAJ0j4086708
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=troy_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>, leetroy@gmail.com,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HWRYaSo2s7Tz

Typo found during developing.

Fixes: 70b3f1a34d3c ("hw/misc: Add basic Aspeed PWM model")
Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 hw/misc/aspeed_pwm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/aspeed_pwm.c b/hw/misc/aspeed_pwm.c
index 8ebab5dcef..dbf9634da3 100644
--- a/hw/misc/aspeed_pwm.c
+++ b/hw/misc/aspeed_pwm.c
@@ -96,7 +96,7 @@ static void aspeed_pwm_class_init(ObjectClass *klass, void *data)
 
     dc->realize = aspeed_pwm_realize;
     dc->reset = aspeed_pwm_reset;
-    dc->desc = "Aspeed PWM Controller",
+    dc->desc = "Aspeed PWM Controller";
     dc->vmsd = &vmstate_aspeed_pwm;
 }
 
-- 
2.25.1

