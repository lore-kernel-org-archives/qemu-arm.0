Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp224589eja;
        Wed, 28 Feb 2024 23:43:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU/zg/Uv1IXbKk1H/txirM52DBAlRbxGFpqBmIAzmpEfiDt51Rg1klb0QmKUFb3wheXGYb5BjzZ89gssss3aanc3pVE+CKQ
X-Google-Smtp-Source: AGHT+IHmTLtzgG6Hxj4u2FF8C/PLID/rubog1Rgzh8spCBeWdHqotRt+sgDU87Kj6h069NC/uDK3
X-Received: by 2002:a25:6ad4:0:b0:dbf:ec4:311f with SMTP id f203-20020a256ad4000000b00dbf0ec4311fmr1310782ybc.58.1709192598481;
        Wed, 28 Feb 2024 23:43:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709192598; cv=none;
        d=google.com; s=arc-20160816;
        b=oh068m+MT01/iJhJbPKdR+nu962tCID1zaReoXCfsB7g4Thwg6pOvUC0OQbRy+50ae
         5m63j/gN5njwjSz4+SM239zl8HQZEx6BvcWhTnnGHnPFVQK6LqulLZi3Ib/CbHxnAKfL
         RraLnqsG0NSh5TDLA2Pqne7VdDxEQ9vcYOQsQQ//IyRTSMStJ7yt2NJqNUYaqmeTiFst
         VjCilC+za2WuQg48GPTv8Pcs/ynblwBWLX4Jphg3Sov/IQMisE6wwrSzgth4KoTyRpqN
         ZwQCKQTbwZf0llEuhdJcrOXpKpkF91nN4XQaergdeIjezXNe9t8pdrOc+o4kTP2WQr6B
         pB4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Pj7k0wYh3wHW05N9gW3iprZKmGP6mAJKnIPARGDKqKo=;
        fh=UiAnrWHdzYMNrM6szngjm+ppUEiT4HPvSYef1ABH2rc=;
        b=Nvp4YZflbLgsLWjSPick0En+5/EttfLAy95amOtG9ZpvCLwjnv59A2TdG9CIBQg/Cg
         1VFxbDBrwiopeuifTmYi703+wpbjxeeaOAAot82RhzJ6k+iIUKSx6y2p/ybkPEe3H/jA
         yCZ1dkxASMvESWRCUzrwFUtVCntN1StfVV1hRqQ5zQ32OQFWXWW7iyEnABfNHuboKAgv
         V45PqjEP44XFTgM/B645RleSAOjwuaz+7lNZmdwVrJ8MeKLKCfoGPQU0P6zWxBuwyxTx
         Dj4ePqEuKr5dT6TF60FqljEERdLkiO0Xi01/sQrdCCzcJdNYCln1FgiXmhZoaw6yYYhD
         AkRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6-20020a05622a038600b0042d24a32838si928150qtx.54.2024.02.28.23.43.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 23:43:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfb43-0001iV-Gw; Thu, 29 Feb 2024 02:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rfb40-0001hz-NX; Thu, 29 Feb 2024 02:42:44 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rfb3x-0005bF-3U; Thu, 29 Feb 2024 02:42:44 -0500
Received: from TWMBX02.aspeed.com (192.168.0.25) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 29 Feb
 2024 15:42:35 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Feb 2024 15:42:35 +0800
To: <clg@kaod.org>, <peter.maydell@linaro.org>, <andrew@codeconstruct.com.au>, 
 <joel@jms.id.au>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 1/8] aspeed/wdt: Add AST2700 support
Date: Thu, 29 Feb 2024 15:42:27 +0800
Message-ID: <20240229074234.976164-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229074234.976164-1-jamin_lin@aspeedtech.com>
References: <20240229074234.976164-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=twmbx02.aspeed.com;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX02.aspeed.com
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
X-TUID: zTfoXrQb7GYH

AST2700 wdt controller is similiar to AST2600's wdt, but
the AST2700 has 8 watchdogs, and they each have a 0x80 of registers.
Introduce ast2700 object class and increse the number of regs(offset) of
ast2700 model.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/watchdog/wdt_aspeed.c         | 24 ++++++++++++++++++++++++
 include/hw/watchdog/wdt_aspeed.h |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index d70b656f8e..75685c5647 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -422,12 +422,36 @@ static const TypeInfo aspeed_1030_wdt_info = {
     .class_init = aspeed_1030_wdt_class_init,
 };
 
+static void aspeed_2700_wdt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
+
+    dc->desc = "ASPEED 2700 Watchdog Controller";
+    awc->iosize = 0x80;
+    awc->ext_pulse_width_mask = 0xfffff; /* TODO */
+    awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
+    awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
+    awc->wdt_reload = aspeed_wdt_reload_1mhz;
+    awc->sanitize_ctrl = aspeed_2600_sanitize_ctrl;
+    awc->default_status = 0x014FB180;
+    awc->default_reload_value = 0x014FB180;
+}
+
+static const TypeInfo aspeed_2700_wdt_info = {
+    .name = TYPE_ASPEED_2700_WDT,
+    .parent = TYPE_ASPEED_WDT,
+    .instance_size = sizeof(AspeedWDTState),
+    .class_init = aspeed_2700_wdt_class_init,
+};
+
 static void wdt_aspeed_register_types(void)
 {
     type_register_static(&aspeed_wdt_info);
     type_register_static(&aspeed_2400_wdt_info);
     type_register_static(&aspeed_2500_wdt_info);
     type_register_static(&aspeed_2600_wdt_info);
+    type_register_static(&aspeed_2700_wdt_info);
     type_register_static(&aspeed_1030_wdt_info);
 }
 
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index e90ef86651..830b0a7936 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -19,9 +19,10 @@ OBJECT_DECLARE_TYPE(AspeedWDTState, AspeedWDTClass, ASPEED_WDT)
 #define TYPE_ASPEED_2400_WDT TYPE_ASPEED_WDT "-ast2400"
 #define TYPE_ASPEED_2500_WDT TYPE_ASPEED_WDT "-ast2500"
 #define TYPE_ASPEED_2600_WDT TYPE_ASPEED_WDT "-ast2600"
+#define TYPE_ASPEED_2700_WDT TYPE_ASPEED_WDT "-ast2700"
 #define TYPE_ASPEED_1030_WDT TYPE_ASPEED_WDT "-ast1030"
 
-#define ASPEED_WDT_REGS_MAX        (0x30 / 4)
+#define ASPEED_WDT_REGS_MAX        (0x80 / 4)
 
 struct AspeedWDTState {
     /*< private >*/
-- 
2.25.1

