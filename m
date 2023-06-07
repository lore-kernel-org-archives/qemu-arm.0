Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3981ejb;
        Tue, 6 Jun 2023 21:41:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ51DzBSHXpOmODX2FJ7B2spC4QRBd0M/NHeBZ9chd4JIWHME5f/vY6eOsv82d/tUFgVN3M4
X-Received: by 2002:a05:622a:451:b0:3f8:6633:5266 with SMTP id o17-20020a05622a045100b003f866335266mr2651079qtx.0.1686112869911;
        Tue, 06 Jun 2023 21:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686112869; cv=none;
        d=google.com; s=arc-20160816;
        b=vnjZ9tCIGlxd4jfiBVCmTQFk20MdEdkfLUTDVwT/D+UDtQJZ6furkrwIV/Z/3Bva2Q
         Ff3laf8gV2Fvg6noJHeo7aPFpzRFA+AHDNYcwEwlLmU+GAEQEaJ729Kjn0Lu8FuaTPay
         z31fRzipb48oM+BWt7oNVf4t0bfO/uP25EFtXaZlxigQKYESofS/PT11dxscBY+EII00
         p00TQDS61yIux9UyK1DhwjV61ZtqXrXEQSzzCeMv6Gt9CwoA19lBeuZuBwXJNh1rDCcF
         GuRauRX4eR+NUQdD5d7VwL6J7yRhjaXVKEk4HJ2EOi3x4J/fMkRN4yHZBLYXgBJDTXGd
         kUTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=2yMJQ1g74AwcF5ZamMaUlCXVQNArVOuiOaZ8uZMbwgs=;
        b=gmlMEPXHTcvE+kwEWzNkMarFRHfeQXGbvjSDRh0dPBQyEvFJc1WoMTYeOQiQ2MN8CE
         epHaPVE2FgWBicMEUeBbdHGSzA5wMJnBK3R1Vr32IcQdu3k/jq6q0SdqaOdwSe++LsGT
         nAGSBULBb04KIqEzVr7m60FEd9+Bff95SQcvYmvKA0scqR6PXXZPAl1g9ypaFOrMAO7A
         vXGMOwcH8QmngxN2bYS3KoIfD1ltj5a0faZHYcrZ8IimVnboWEPqIaKvwqlHrnl44JUE
         Zy/BnKBT+ZMsS2cfdFwQXLKi7EhvJfEZFn0KmjRfW2skGm89gCOGFm941F0Bo+JoDqvL
         dCyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n11-20020a05622a11cb00b003f6b0eedcf9si7190312qtk.595.2023.06.06.21.41.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 21:41:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6ky3-0001nS-4b; Wed, 07 Jun 2023 00:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6ky0-0001mw-UQ; Wed, 07 Jun 2023 00:40:16 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6kxy-0003Yv-AX; Wed, 07 Jun 2023 00:40:15 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QbZQM74tdz4x4K;
 Wed,  7 Jun 2023 14:40:11 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QbZQK1869z4x42;
 Wed,  7 Jun 2023 14:40:08 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v2 04/12] hw/ssi: Add an "addr" property to SSIPeripheral
Date: Wed,  7 Jun 2023 06:39:35 +0200
Message-Id: <20230607043943.1837186-5-clg@kaod.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607043943.1837186-1-clg@kaod.org>
References: <20230607043943.1837186-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=5JAy=B3=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: TEivtWMZAyTT

Boards will use this new property to identify the device CS line and
wire the SPI controllers accordingly.

Cc: Alistair Francis <alistair@alistair23.me>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/ssi.h | 3 +++
 hw/ssi/ssi.c         | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index 6950f86810d3..9e0706a5248c 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -64,6 +64,9 @@ struct SSIPeripheral {
 
     /* Chip select state */
     bool cs;
+
+    /* Chip select address/index */
+    uint8_t addr;
 };
 
 extern const VMStateDescription vmstate_ssi_peripheral;
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index d54a109beeb5..d4409535429c 100644
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
+    DEFINE_PROP_UINT8("addr", SSIPeripheral, addr, 0),
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
2.40.1

