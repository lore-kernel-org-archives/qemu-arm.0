Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp555971lfb;
        Thu, 31 Mar 2022 20:08:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypULoxzeUJmnvkoEmQGSJxo3Rg1DUNMJ8mpBprUmvXyJTC3OXvWFtNAo7Urihnf+4sYDwK
X-Received: by 2002:ac8:7d88:0:b0:2e1:cd8d:3dda with SMTP id c8-20020ac87d88000000b002e1cd8d3ddamr7110523qtd.351.1648782483914;
        Thu, 31 Mar 2022 20:08:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648782483; cv=none;
        d=google.com; s=arc-20160816;
        b=KnYyIQHDscqTmma5lkFB4RKSePZtvqw0upBTsmGeWSCVbyiHqs/q4JzAJc3thkylgk
         B4m3mocpxcsIP/e2O/McrqCrilKe+jTabs1adjNbBi+O1oWTjMxu9p3sknbt4TU3mXbm
         tnPvfd6/E2hitmbFzmvbAXOUSGkuJZr7D77XeA32BS9IQzDlJlfLDSUKdpA7w1lvyCHr
         ceOAVOPTM7YDw/f3YV0aBXkq60C79GQGq1h++N45NINClEKHalF/3kx5EjxqyX2Y6ZHu
         Lw0wp/MnOh310y6sJQ6tLEAnoj/3sKTOdT7G6Xwdw5JCmldOy4AeN6/KmuZ6w32bEv7L
         iYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=geJ6+MiGk2seSOaWkizxcB7XGiFfdo5/KnSPAk/1ZtA=;
        b=Xz2uROaUYUxyzcxAP0K9bUBRSQE1V4HWmnPHCEzt/P4veEJUZiRs3vQ5p7TwsCdsfE
         0My21igEuTMokWwGGj1lQXYVadXVbTHr3EAzi5VnVVAPiXNwWp4AA6K/6xHnwh/Kr+9B
         mGq4dMlSrXPnDwjIDJNlZWBdsuRbial2IRhQ/dd42pl1Kd4IjvmEtI5KDv4bJnrsMOEt
         OPvvDtb+LdE3S8t2aU6ddpLRIkzjFiQ9iKcOFXwY+AnFc96XMVpcI0lMHJg9lGeXnBQl
         hxm1ERxfM0gAKWJQ+NgOBICZIgLBJU6mRAPRWaw3HNTgNUPOCjSroD/olPGiIXuDV7dr
         6mOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13-20020ac867cd000000b002e1fbf3c0fbsi593355qtp.748.2022.03.31.20.08.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 20:08:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1na7dr-0006ue-C5
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 23:08:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1na7cQ-0004cb-15; Thu, 31 Mar 2022 23:06:34 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:54044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1na7cN-0002me-NY; Thu, 31 Mar 2022 23:06:33 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2312sBWI090582;
 Fri, 1 Apr 2022 10:54:11 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 1 Apr
 2022 11:05:12 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Beraldo Leal" <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH v3 5/9] aspeed/timer: Add AST1030 support
Date: Fri, 1 Apr 2022 11:05:04 +0800
Message-ID: <20220401030508.28133-6-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220401030508.28133-1-jamin_lin@aspeedtech.com>
References: <20220401030508.28133-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2312sBWI090582
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
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
X-TUID: JzHz3A6e8Z5q

From: Steven Lee <steven_lee@aspeedtech.com>

ast1030 tmc(timer controller) is identical to ast2600 tmc.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/timer/aspeed_timer.c         | 17 +++++++++++++++++
 include/hw/timer/aspeed_timer.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 42c47d2ce6..9c20b3d6ad 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -745,12 +745,29 @@ static const TypeInfo aspeed_2600_timer_info = {
     .class_init = aspeed_2600_timer_class_init,
 };
 
+static void aspeed_1030_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedTimerClass *awc = ASPEED_TIMER_CLASS(klass);
+
+    dc->desc = "ASPEED 1030 Timer";
+    awc->read = aspeed_2600_timer_read;
+    awc->write = aspeed_2600_timer_write;
+}
+
+static const TypeInfo aspeed_1030_timer_info = {
+    .name = TYPE_ASPEED_1030_TIMER,
+    .parent = TYPE_ASPEED_TIMER,
+    .class_init = aspeed_1030_timer_class_init,
+};
+
 static void aspeed_timer_register_types(void)
 {
     type_register_static(&aspeed_timer_info);
     type_register_static(&aspeed_2400_timer_info);
     type_register_static(&aspeed_2500_timer_info);
     type_register_static(&aspeed_2600_timer_info);
+    type_register_static(&aspeed_1030_timer_info);
 }
 
 type_init(aspeed_timer_register_types)
diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
index d36034a10c..07dc6b6f2c 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -31,6 +31,7 @@ OBJECT_DECLARE_TYPE(AspeedTimerCtrlState, AspeedTimerClass, ASPEED_TIMER)
 #define TYPE_ASPEED_2400_TIMER TYPE_ASPEED_TIMER "-ast2400"
 #define TYPE_ASPEED_2500_TIMER TYPE_ASPEED_TIMER "-ast2500"
 #define TYPE_ASPEED_2600_TIMER TYPE_ASPEED_TIMER "-ast2600"
+#define TYPE_ASPEED_1030_TIMER TYPE_ASPEED_TIMER "-ast1030"
 
 #define ASPEED_TIMER_NR_TIMERS 8
 
-- 
2.17.1

