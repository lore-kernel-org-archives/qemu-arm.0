Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1217613lfb;
        Mon, 21 Mar 2022 19:53:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3piUfWyJwL1xRcWm79yDcrieJ4IJbDE2wlY+BV388hRwvmW17KooBa9NorP+KPEFd2bft
X-Received: by 2002:a05:6214:2307:b0:432:e753:e0c4 with SMTP id gc7-20020a056214230700b00432e753e0c4mr17987021qvb.55.1647917612687;
        Mon, 21 Mar 2022 19:53:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647917612; cv=none;
        d=google.com; s=arc-20160816;
        b=eDtco+M5wyfBEvAy2qduJvv52V8GqwMUmLStEGaKjJFtqOg0GrC2ea0GNkGf3h9Rd4
         hqPuzRL9Uztgh+H1KvTF9tcLq4tbECbV67Q9kcZUgh0l7sK9C1aDrbbNZPnp0IZtu0Kw
         3P9o10VdoGdSlSMxApI9e6Y8saUTFZ/LQYerUfmPtIkJ+N+aPnjcfpbJpeqVLbWLynrx
         ZK9YSG3O1XGRIPsFj7BtTOAGG9HR7qvkFADzR3ZFLzF/01kJRR6zIhUwlb+zNnMKUvFF
         kAsCHMTGbc6yui2ck2Cq8q+AYHtY7zPnMKceg7WuuRHxoC3pIqVfsRoJDQdSmWGCG8Zl
         PtVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=S61xFL0gFVsn0iSK4mLONDkXCtgeKgTA8q8NA9n8PrI=;
        b=TNAzC4eKLz76MmzNqTc9gbJ/Xg7B+o2bGcFCYlde+OLOYDNnwXcxfdVfwCG+W8AH0i
         6kGA2n5bB5oEFI9cMIZFbJJX1KbqTP3ssRA4glTqtT03LF47GhxBn8dtU6+15tROVL+R
         uVO5SilkuNyAxV6ImlbLRb99FF8FNlnMqC71wGk+46bOvYBJzfLFsxfiJC9UMQAkdy1K
         aQZ9I5svEQXjt2ra+ssR4ZZmqAN9z508Xw8rCKwWibUg+7SpV9LiY1Whjqp2LnO00S2U
         oeBM4qZOHaItA+3jivn+WzSEN5JdzAYMP5w+pKGa2qZYI2VS3JMVF7G85Vup5uMIa6vS
         NxtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp11-20020a05622a1b8b00b002e21e80e9a5si670095qtb.241.2022.03.21.19.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Mar 2022 19:53:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWUeK-0003X6-87
	for alex.bennee@linaro.org; Mon, 21 Mar 2022 22:53:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUe2-0003RK-Vi; Mon, 21 Mar 2022 22:53:14 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:27197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUe0-0001x9-U4; Mon, 21 Mar 2022 22:53:14 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22M2fVHX078441;
 Tue, 22 Mar 2022 10:41:31 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 22 Mar
 2022 10:51:59 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Beraldo Leal" <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH v1 5/9] aspeed/timer: Add AST1030 support.
Date: Tue, 22 Mar 2022 10:51:50 +0800
Message-ID: <20220322025154.3989-6-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
References: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22M2fVHX078441
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
X-TUID: XnJFwx01fxNe

From: Steven Lee <steven_lee@aspeedtech.com>

ast1030 tmc(timer controller) is identical to ast2600 tmc.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
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

