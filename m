Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp1885664ejq;
        Mon, 8 May 2023 01:02:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5SA37hMf2vTeUqxLWah32ULN4tOwbnwPt7dBzNMOrL3InYEd83JOp3lu8h0ipoNO6iFO/4
X-Received: by 2002:a05:622a:1a8b:b0:3ef:37e3:cc64 with SMTP id s11-20020a05622a1a8b00b003ef37e3cc64mr13537936qtc.3.1683532945886;
        Mon, 08 May 2023 01:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683532945; cv=none;
        d=google.com; s=arc-20160816;
        b=lAgvstt70EGS8daYrLPg1lCgFyAR4kYrMpeRPlVPpH6QGdxN7CBOXcauB/JQFG/Df7
         RhN/CgDhelc0H85e91Z6t/mn4rPKDaTbNzizlYJkcfkmnRGBm/9xlOBHa8UEszwiLPc+
         41jZCv7+BERqVDUX95qGSaZYYVzm4CLIzSH8bJ0i6z7JNwa10DlcJvCXhxwy8NUDbkTj
         5IR2mqunqc1hwi5DOIL5db7dnWq31pFLhXqGF79t2Xdu3FMQR4BPhMAv7zIuWxG7Ogg2
         whQCAJ593n/3NpGj/eKV+Q9x3ZegngUqLwS9UhsiMoQ6hY3HuEq3lbbcUvD81nkRfxTl
         JWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=RTTKe7l1t2dCL7SnPEVFFXUXjHOh4RkOYY3+ZlG+O8M=;
        b=THIK5YRItGahfwFxCQnotDX0r4pAifI6QFRhqEFml/SUiZW+p+FeSxlpwLzgHbhKYT
         yNjbX594dCB1nLf3yf63FH+/POkGtEq4tk37ER/Vd+mC0Loqx/9tANdWaZIzH2zVu+S9
         6orD/GwO8ArwM/JPJrleAswEN6+wMpr2EK+jwVzYto/ES3FueB7KO7Td+lypnMUMO8RS
         tdsS0lMiwEccDC00B23vE/JLfc/4KV+uSPcQoLw0YCBlIZG0BtCf5spu3Yv4DIsLQit+
         XjNYFkw+B6yWY81sqj+cWdt/m2U0ncDZzPKjqSampCIFq40SK4m1I+dHuIy9xxkzh14p
         4qmw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n15-20020a05622a11cf00b003f3902c837dsi454275qtk.353.2023.05.08.01.02.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 01:02:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvvmK-00080O-Ji; Mon, 08 May 2023 03:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmI-0007yd-Im; Mon, 08 May 2023 03:59:26 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmG-00017q-TU; Mon, 08 May 2023 03:59:26 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QFDG14gsKz4x4G;
 Mon,  8 May 2023 17:59:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QFDFz1VY5z4x4F;
 Mon,  8 May 2023 17:59:18 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 04/12] hw/ssi: Add an "addr" property to SSIPeripheral
Date: Mon,  8 May 2023 09:58:51 +0200
Message-Id: <20230508075859.3326566-5-clg@kaod.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230508075859.3326566-1-clg@kaod.org>
References: <20230508075859.3326566-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=5sq4=A5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5nWkoO/znZWZ

Boards will use this new property to identify the device CS line and
wire the SPI controllers accordingly.

Cc: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/ssi.h | 3 +++
 hw/ssi/ssi.c         | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index 6950f86810..ffd3a34ba4 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -64,6 +64,9 @@ struct SSIPeripheral {
 
     /* Chip select state */
     bool cs;
+
+    /* Chip select address/index */
+    uint32_t addr;
 };
 
 extern const VMStateDescription vmstate_ssi_peripheral;
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index d54a109bee..9fffe4f27a 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -13,6 +13,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
 #include "hw/ssi/ssi.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
@@ -71,6 +72,11 @@ static void ssi_peripheral_realize(DeviceState *dev, Error **errp)
     ssc->realize(s, errp);
 }
 
+static Property ssi_peripheral_properties[] = {
+    DEFINE_PROP_UINT32("addr", SSIPeripheral, addr, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void ssi_peripheral_class_init(ObjectClass *klass, void *data)
 {
     SSIPeripheralClass *ssc = SSI_PERIPHERAL_CLASS(klass);
@@ -81,6 +87,7 @@ static void ssi_peripheral_class_init(ObjectClass *klass, void *data)
     if (!ssc->transfer_raw) {
         ssc->transfer_raw = ssi_transfer_raw_default;
     }
+    device_class_set_props(dc, ssi_peripheral_properties);
 }
 
 static const TypeInfo ssi_peripheral_info = {
-- 
2.40.0

