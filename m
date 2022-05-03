Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1225005lfj;
        Tue, 3 May 2022 00:02:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn//Mzjmfr5w3jTkPcXCja/xU7y9qSUhui35O1pvtpxsCB1xh5xP3UgbxNI9HYu52DfhP/
X-Received: by 2002:a05:622a:4f:b0:2f3:85c1:6d0d with SMTP id y15-20020a05622a004f00b002f385c16d0dmr13512451qtw.398.1651561337531;
        Tue, 03 May 2022 00:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651561337; cv=none;
        d=google.com; s=arc-20160816;
        b=W1mESBZD2cEbGp3WkYXFV12GKoKhTTd7uMbHy1QIWc9lAqqG2s9OaNw262ISDnxkzS
         XugV9z5VW/SrtZDmp0rDuBmVJ4XJ3WZ1Er0hT7LLrc+63ft6gkMiQYTWzL7JsvQZ88Uk
         PktT/AwHzZrhZoSvazh1xdwFNqe72vjUwsOVM092rcJAcPEYiLCJ7cbhukRbVl3TxSRN
         Qs4ezPwaeYrxawRbfCi9YNW4fjtvNawEbb5nT/pivXLQr+HnfYdWqR4AwiLpkU+3KdwK
         fqTjSlsGhPqeEI1BC502FbQj+snZlURjTdN+7HXh7UKl6fUAgV7n1fHtNSFeBe+RqTro
         kxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=BtDXp6tO+otHlQUUdLpGjPGvdTLwZAihe2b5tnMmX7Q=;
        b=BCjWMgWRSZ6vKnf+65+lYAQyvlHLk710Y6Q4r34PWIX7byHN1zzO/9ViwOm8608xL7
         /ktmRtem4MGkQPtrU/ySa1BDw/sGtBX1uvob28tAnAPo+yGtXqp3uPXlABoxYuPSXnFm
         KbWnwB6jD1CdPVWcT5gmjQ/wHREbLXH323eqmHSA1xB5PchbeUOjsuHf1PYLkthvQcC9
         ND+6aUkVwfmvliDOYJoO3J3TUWb0xJD353pjgtiFINIlEm8rABC6Yayt2z8U9/Nhwjpz
         yUrK4t3wL4g2uz8S611OPMiIr1pWzQmW2UK1Is/tKv7pPJJiOJN+odLURMU3V0OBi7bf
         i82Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3-20020a0cdf03000000b004467be745dcsi7882076qvl.449.2022.05.03.00.02.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 00:02:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlmY4-0004KB-TX
	for alex.bennee@linaro.org; Tue, 03 May 2022 03:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmVC-0003K5-3d; Tue, 03 May 2022 02:59:18 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:58623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmVA-0007UH-CG; Tue, 03 May 2022 02:59:17 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsrRP6kCjz4ySc;
 Tue,  3 May 2022 16:59:13 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsrRM4gL0z4yST;
 Tue,  3 May 2022 16:59:11 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 08/19] aspeed/wdt: Add AST1030 support
Date: Tue,  3 May 2022 08:58:37 +0200
Message-Id: <20220503065848.125215-9-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503065848.125215-1-clg@kaod.org>
References: <20220503065848.125215-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
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
X-TUID: 8OD2nfu91+LY

From: Steven Lee <steven_lee@aspeedtech.com>

AST1030 wdt controller is similiar to AST2600's wdt, but it has extra
registers.
Introduce ast1030 object class and increse the number of regs(offset) of
ast1030 model.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220401083850.15266-5-jamin_lin@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/watchdog/wdt_aspeed.h |  1 +
 hw/watchdog/wdt_aspeed.c         | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index 0e37f39f384c..dfa5dfa424a3 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -19,6 +19,7 @@ OBJECT_DECLARE_TYPE(AspeedWDTState, AspeedWDTClass, ASPEED_WDT)
 #define TYPE_ASPEED_2400_WDT TYPE_ASPEED_WDT "-ast2400"
 #define TYPE_ASPEED_2500_WDT TYPE_ASPEED_WDT "-ast2500"
 #define TYPE_ASPEED_2600_WDT TYPE_ASPEED_WDT "-ast2600"
+#define TYPE_ASPEED_1030_WDT TYPE_ASPEED_WDT "-ast1030"
 
 #define ASPEED_WDT_REGS_MAX        (0x20 / 4)
 
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 386928e9c0fc..31855afdf4c8 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -391,6 +391,29 @@ static const TypeInfo aspeed_2600_wdt_info = {
     .class_init = aspeed_2600_wdt_class_init,
 };
 
+static void aspeed_1030_wdt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
+
+    dc->desc = "ASPEED 1030 Watchdog Controller";
+    awc->offset = 0x80;
+    awc->ext_pulse_width_mask = 0xfffff; /* TODO */
+    awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
+    awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
+    awc->wdt_reload = aspeed_wdt_reload_1mhz;
+    awc->sanitize_ctrl = aspeed_2600_sanitize_ctrl;
+    awc->default_status = 0x014FB180;
+    awc->default_reload_value = 0x014FB180;
+}
+
+static const TypeInfo aspeed_1030_wdt_info = {
+    .name = TYPE_ASPEED_1030_WDT,
+    .parent = TYPE_ASPEED_WDT,
+    .instance_size = sizeof(AspeedWDTState),
+    .class_init = aspeed_1030_wdt_class_init,
+};
+
 static void wdt_aspeed_register_types(void)
 {
     watchdog_add_model(&model);
@@ -398,6 +421,7 @@ static void wdt_aspeed_register_types(void)
     type_register_static(&aspeed_2400_wdt_info);
     type_register_static(&aspeed_2500_wdt_info);
     type_register_static(&aspeed_2600_wdt_info);
+    type_register_static(&aspeed_1030_wdt_info);
 }
 
 type_init(wdt_aspeed_register_types)
-- 
2.35.1

