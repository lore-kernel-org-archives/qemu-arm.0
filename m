Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2718361ejs;
        Mon, 3 Jun 2024 22:48:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVKwS17FrY1ERb7bEvmxN7GYa8euq0fD1Vwaoeleg8G2h1Bug5eDMB/XNRcUsl6T/7ftQM6bfDKDLI2ncqdn2NREscdd+Ez
X-Google-Smtp-Source: AGHT+IH/mmj3wO1fRPpsNKkmeEY0wnt/5G7RCP6qB7seEksUgYZD9NpzoDRPZPAsA9BmsOYugbHT
X-Received: by 2002:ac8:5781:0:b0:43e:3b8e:671f with SMTP id d75a77b69052e-43ff54f74a5mr122907391cf.47.1717480093922;
        Mon, 03 Jun 2024 22:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717480093; cv=none;
        d=google.com; s=arc-20160816;
        b=ZCVkVNYKznZ9ry13gnzRbU5qBGwNNJqwituoh2kvu6vgEvtrg/IHMwa4QjChBen+2k
         oGJxDhapdLqqP8qzaZvgJ3VoG9Y+ppz5u/3LaXJoWIdy6kzpbKe21/zJnEGTufhtL7JI
         DSRpLf/r716w3WF0oM+8IChSwCUKK1OtsMMTZ85i1N2hRTmxtLthHWHkA3nZTMQj2R32
         klwaP6Mz31AlxWMxcXDP0JzT7RqryNZ5mxOwT20QQdVkQnT0lKAxFkWxKieXrspJRBOy
         0CwJtDXX3FoZkQJofyiqc/gOajBWltJ3ng0bHgtxDXDBx2rmwNms4ak8TAjYiorrn73l
         uYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=bkPbZrWkfn1gLPyX+TFyjtkATCVhqBjw5ey+1ijIzsc=;
        fh=4qsXPuPQQYwauqV4GBfUuJ135n2gY4LbnQu8KHliids=;
        b=HoQdm4+G4+GwvDmohA4iZAnU/vF0SRiGrh7TN74tW/JojROCSX5sspa/c+Ys/zdtQl
         aJUxu8IOQtNGUYEh3uS6UOe0CH9WZOAC3KFg4h7HNKJ/lW5ibFsHLqu2A67f7lnCQmIe
         7jZyjzHExNgt0grsVGNwvGRSC2aKDZJnQ98hpHJqWTgq0ekGR070CAIkghJ9tlctfXCG
         vC9FXwUOXvsfnetSYXg7RVRcTz6XecoWRMBmw/ZlgmX7Dy03UbWFNVg73fp46jldIAXY
         4psWMjAIdyASEweZqxnL43PbhwdtHFsCiKlLyjXBrlBknOmPN2djGpCDw+l1wL/sSaf5
         bJQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43ff2468bb8si103971441cf.343.2024.06.03.22.48.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2024 22:48:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sEMye-0005YS-Jf; Tue, 04 Jun 2024 01:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sEMyc-0005Xt-H4; Tue, 04 Jun 2024 01:44:54 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sEMya-0008TH-K0; Tue, 04 Jun 2024 01:44:54 -0400
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 4 Jun
 2024 13:44:39 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 Jun
 2024 13:44:40 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 4 Jun 2024 13:44:39 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v5 01/17] aspeed/wdt: Add AST2700 support
Date: Tue, 4 Jun 2024 13:44:22 +0800
Message-ID: <20240604054438.3424349-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
References: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AWoxtn7B6MnY

AST2700 wdt controller is similiar to AST2600's wdt, but
the AST2700 has 8 watchdogs, and they each have 0x80 of registers.
Introduce ast2700 object class and increase the number of regs(offset) of
ast2700 model.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
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

