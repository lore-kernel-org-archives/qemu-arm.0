Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1226163lfj;
        Tue, 3 May 2022 00:04:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJUZXB6PMIjlH9BCZx1sV363tZjwLP4CycYl66fqe+rpIYQXbPuOhJqsSxqbe5g0pHEoYa
X-Received: by 2002:ad4:5a03:0:b0:456:5533:4ab1 with SMTP id ei3-20020ad45a03000000b0045655334ab1mr12470937qvb.24.1651561451674;
        Tue, 03 May 2022 00:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651561451; cv=none;
        d=google.com; s=arc-20160816;
        b=rkMekPyaRQuImK95nkYlpH6ufKcQ+Ed5Sqw/rmr2wO/0P6nbnwQxNaHDaOV9BQhs0V
         XRnkNJxlehfJOgVAfD/W/ZqLiR68AWiK/ZydkkRSzJaXtjVuCJ/cQ8fLohMvD2RoRiXc
         apvg2xdrHJ5fkNAZlZV6QAvsuPHu43NjLDdpo4NtCEiqeOTCUjzLNGD2bfuk61Y/2MVu
         yxFKulKKZRLS9oAcwZFTzLPPylRNhYGCJ7PuEboScy2o2gUPQuTeGC8GpAYqlCpwq/R1
         6MJDKwQlsjRwze5Sqep4VJjEolbeeALHh57+dUwpBH+D1gp7ELy/T4zlRcxLkkMuJVQm
         fs8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=we4WnEWgOk0PLnZZGOqHVPmWQa+8e2Rs68Eq7/YNKko=;
        b=wqq0CzHRRV0hJrxD34GnbmcejzFlwW5TIUdyu1jm63/2fyNgISX+KA2OV+0D8SsIvm
         ue/Ei81GZfj9+Gc1JXwzJ29dClURNtbG1tw2nVJM+50xwTgahWjpu8mHmhbfkdc5pRfp
         lV+oWFZuaM7n+34xv8qkpyAhbtWVaOplZcSqe9rGVlWONKK+kLyRPUcYK75WR2+aJbWt
         dbq2A6zwXwXWR3CVO7bzoIQ7Ym4xhI9lr2FWPdQVU8Rt0hFzVSQAVies2IyZ5IHDTg2J
         lUzDrbOMIydErp9Jm5+XiwTeZYy/r/7m5JfwArrkqjCxn8qzrXlUAk9USJdi0MSxuVHd
         ApTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7-20020a05622a120700b002ee719a40easi6943941qtx.759.2022.05.03.00.04.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 00:04:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlmZv-0005FQ-0p
	for alex.bennee@linaro.org; Tue, 03 May 2022 03:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmVF-0003ME-Aj; Tue, 03 May 2022 02:59:25 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:56199
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmVD-0007Uq-3E; Tue, 03 May 2022 02:59:20 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsrRS5Hmgz4xXh;
 Tue,  3 May 2022 16:59:16 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsrRQ3Bz1z4yST;
 Tue,  3 May 2022 16:59:14 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 09/19] aspeed/timer: Add AST1030 support
Date: Tue,  3 May 2022 08:58:38 +0200
Message-Id: <20220503065848.125215-10-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503065848.125215-1-clg@kaod.org>
References: <20220503065848.125215-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=XF6a=VL=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T+1iIn754ba+

From: Steven Lee <steven_lee@aspeedtech.com>

ast1030 tmc(timer controller) is identical to ast2600 tmc.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220401083850.15266-6-jamin_lin@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/timer/aspeed_timer.h |  1 +
 hw/timer/aspeed_timer.c         | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
index d36034a10c20..07dc6b6f2cbd 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -31,6 +31,7 @@ OBJECT_DECLARE_TYPE(AspeedTimerCtrlState, AspeedTimerClass, ASPEED_TIMER)
 #define TYPE_ASPEED_2400_TIMER TYPE_ASPEED_TIMER "-ast2400"
 #define TYPE_ASPEED_2500_TIMER TYPE_ASPEED_TIMER "-ast2500"
 #define TYPE_ASPEED_2600_TIMER TYPE_ASPEED_TIMER "-ast2600"
+#define TYPE_ASPEED_1030_TIMER TYPE_ASPEED_TIMER "-ast1030"
 
 #define ASPEED_TIMER_NR_TIMERS 8
 
diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 42c47d2ce64a..9c20b3d6ad8a 100644
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
-- 
2.35.1

