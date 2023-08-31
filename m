Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5059879ejc;
        Thu, 31 Aug 2023 05:41:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCzdBAz2YySYtNwUcmBGux0WMPK+YEYf3Jx+kLP6EH+guRYNDbkC+/FtR9avVZaXzMN4CF
X-Received: by 2002:a05:6358:3989:b0:134:e41a:9227 with SMTP id b9-20020a056358398900b00134e41a9227mr5232308rwe.5.1693485662885;
        Thu, 31 Aug 2023 05:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693485662; cv=none;
        d=google.com; s=arc-20160816;
        b=c2qOypSRz3WRP14z3KEdgSBOVmrpGLYdvVHyOmYYAKk6PjqWYMEZYx7gzctR8IFPlb
         pLW+wnszAs/4pQ108YreKgDVmUIRn0fP3Hd8GMHY/A40um0r0IUCw/gnJTUA23KahlNO
         cfDYedMDFHsAnAUijpgLjqwE4G9Qt1ZBmghrPZgW3lwNq3PHC/MZf0z/GEQEK0qlH0A+
         OG+V7zP4iFDHK5Y18tBUVZT9E5w5aFv/pBMtxiD/sxPzg32Ht/oG2+OVud0pMkRYcZSg
         UVlYSX0yZBB02SoHR0LKiUH2ecovNgm5bPAH2UZPhEmZGx7t2Biek6hBwu/jDtVx5WvY
         bH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=VomUVCZj7MnQUfbzxWJ2wH+ChBgGVKx6Y1oDXYN9dgc=;
        fh=tFVUO55lSns9GhhnCQOHLDWxRjUsUCf2I+VgIYDA7Qc=;
        b=FV4yPJ2HOZgXCKRJFVeDpwrm8pXeWp2zUVtaq5GL3S+1y2ZdwnMXBREqWgMDr8qpl5
         VwPfzZcgqCCI2xBDxfmDEe9OEiDlgCgcAtWKLVBU7t1oINtzNBVKuMJ9F20BM+cXiAXv
         uYkkXQpKf0JvFwC4WbojLzDD9wya1XamWcCIpWQqLNE65J4vY6pr4/OPchBQVZwc+q+g
         4MUik8ETGp7rcykZswfaDPzCaZDaPcaBV8TFUOsZdzTaitBbe90o8K/9YcFHbUC7h1d2
         xH4Yo3CZ4Z6lUll+7ko6GITlsvhr5qMuY0zwL/B6W/oQSRfM0g9mh18hyHB4cLb+DNJb
         sy3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16-20020a05620a449000b0076db4750817si910065qkp.671.2023.08.31.05.41.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 05:41:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbgxi-0007uL-1L; Thu, 31 Aug 2023 08:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org>)
 id 1qbgxb-0007qH-H9; Thu, 31 Aug 2023 08:39:45 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org>)
 id 1qbgxY-0008CK-Tr; Thu, 31 Aug 2023 08:39:43 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Rc12H5lhZz4x2Y;
 Thu, 31 Aug 2023 22:39:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rc12F22Kyz4wZJ;
 Thu, 31 Aug 2023 22:39:33 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v3 2/7] hw/ssi: Introduce a ssi_get_cs() helper
Date: Thu, 31 Aug 2023 14:39:17 +0200
Message-ID: <20230831123922.105200-3-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831123922.105200-1-clg@kaod.org>
References: <20230831123922.105200-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: rDR9wjKz0kfx

Simple routine to retrieve a DeviceState object on a SPI bus using its
CS index. It will be useful for the board to wire the CS lines.

Cc: Alistair Francis <alistair@alistair23.me>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/ssi.h |  2 ++
 hw/ssi/ssi.c         | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index c5bdf1f2165f..3cdcbd539042 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -112,4 +112,6 @@ SSIBus *ssi_create_bus(DeviceState *parent, const char *name);
 
 uint32_t ssi_transfer(SSIBus *bus, uint32_t val);
 
+DeviceState *ssi_get_cs(SSIBus *bus, uint8_t cs_index);
+
 #endif
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index 4e33e0ea5bc2..54ca3c34e9d0 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -27,6 +27,21 @@ struct SSIBus {
 #define TYPE_SSI_BUS "SSI"
 OBJECT_DECLARE_SIMPLE_TYPE(SSIBus, SSI_BUS)
 
+DeviceState *ssi_get_cs(SSIBus *bus, uint8_t cs_index)
+{
+    BusState *b = BUS(bus);
+    BusChild *kid;
+
+    QTAILQ_FOREACH(kid, &b->children, sibling) {
+        SSIPeripheral *kid_ssi = SSI_PERIPHERAL(kid->child);
+        if (kid_ssi->cs_index == cs_index) {
+            return kid->child;
+        }
+    }
+
+    return NULL;
+}
+
 static const TypeInfo ssi_bus_info = {
     .name = TYPE_SSI_BUS,
     .parent = TYPE_BUS,
-- 
2.41.0

