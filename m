Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp485436lfg;
        Thu, 19 Aug 2021 09:34:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvAO56Fs5qZ+h6NETK6+J2vWmduyC23zmkBizZmeMs+i4Adu3IiF8hwoDEOTHPYSTXUfXQ
X-Received: by 2002:a1c:27c2:: with SMTP id n185mr14199119wmn.20.1629390894787;
        Thu, 19 Aug 2021 09:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629390894; cv=none;
        d=google.com; s=arc-20160816;
        b=UGop6sBJ+rpaFskwxRM5WKpRmASA3TMY7sWZ4SHAy4VkrHtXUnQJFIoGMJnrX6dd6r
         d0V/tKKHzlJxJZcUGRpMg7cZrjdG7L8NM3ZDxIMKyEl657IQmuVX+qgBtqxEAPKUtQeM
         l3ZthErbCoVhrZassyk6xWVOSN2tN18ay7DTO9mv2ykYHOHI1d5qy6AuyUgl2jlMEAHT
         xMJRTtGQFCN2gjHaNbj1z/42olr6uhDParTmCNSGmeLg0pPNNrXBBv5J71cUb1/5tvH1
         y8zjXGzwgAeq1tHyCAET7XmCkaZl68wxAu8q7kO/gCZMGg4wPdwZDShAIM1g7DtQKZaW
         1DxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5KRt8FFWQDNryBvxaWuh5UmPga4sUXhUn48F2GiPqnI=;
        b=T36PvGAtMaSEoqQkitF42HytZd4GmNpyONarz+AnUjBpx1pY4YYHmMIksKo+oKutSw
         jllEIXFlrv8RHEVOR7jBMlKmoFLafXw50exaz6wQXVydFAIN8oMWVKfhEsTLxuFqGFsR
         Wdce534COlx3UyYZh6wYRcPhfNTqdjWuG9IKMtK5QRuS9HFhOu8LvWE2Gs43QLaOf13C
         8Xqs9vfvrfAX2iDf0SeX2LlVtIRsDZOUBuUf65USeDzcxxPNVJC65DenzfoQCFFW34KA
         JaGdCg2hcsNtYHd736kP+W8lg9/DGoGQ7CJhS9ylhhRfF3fQoMQVYd245yfLT1J90GZp
         T7sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SXVwcAbv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v25si3678309wrv.349.2021.08.19.09.34.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 09:34:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SXVwcAbv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGl0H-0002MU-Uq
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 12:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGkzz-0002HA-1t
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 12:34:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGkzx-0005tT-F5
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 12:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629390872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5KRt8FFWQDNryBvxaWuh5UmPga4sUXhUn48F2GiPqnI=;
 b=SXVwcAbvv3mTaiFWzjB9W4NG4xOQZqQyC14F63uPJ+74LSk+Y+QXD83RwCVncEswK02dzs
 GYVFFdzpwTfoEtSJpU2vlATPDtELY6YbunG902UOquebyE30bpnorKuj5bfQphtcPYlL7E
 JVDLIIDZUMinxv5bmfIaEGfolKAbMgk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-LEJP4V3EM7uM9ccDSQ725g-1; Thu, 19 Aug 2021 12:34:31 -0400
X-MC-Unique: LEJP4V3EM7uM9ccDSQ725g-1
Received: by mail-wm1-f70.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so1463637wmc.9
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 09:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5KRt8FFWQDNryBvxaWuh5UmPga4sUXhUn48F2GiPqnI=;
 b=t7UZ7PAtIQCLwc6OEqJXmnbgn0NHIYref6izehj2ht6fnm0fh5HqZ4l5br3eCyy72d
 9MFn1YTn0TW0Gso1ZYbQ1bPn+OznICz2ky/+YeZS1gEBINPpDeizeo7Q9fZ0N99ZU857
 z1xglNxXGwaQX86EHXPfZWOn4YbW1Ez7lvOOH49QWogmEjWiHxdqnayY/33BOygw6dB2
 304BE/C/VkJuqHRWnAjur7oePAHt+/SNVs673zqm3krBv8nJQaLaVG4WKmAmvSNCeaZO
 /vI0zqAiDbUNORQl1UA476zBHiU6nR4zccTwneiFFQ9PJZCat/q62+HsGAysZeC2qT2+
 ZR7Q==
X-Gm-Message-State: AOAM53107G2rmMlXE447bVHrqBWYsBiSO9pG1yWtwy79wX269n9XvIkq
 z6ZQCDJ0AwSpyRfQJik+v1pSYti8wSmzdYtX283qZrLtRVxQ1RK2zSqTCwnxLGu1kJt1YdAt7gk
 tutN0K2B8pCOB
X-Received: by 2002:a7b:c922:: with SMTP id h2mr14674987wml.186.1629390869403; 
 Thu, 19 Aug 2021 09:34:29 -0700 (PDT)
X-Received: by 2002:a7b:c922:: with SMTP id h2mr14674964wml.186.1629390869134; 
 Thu, 19 Aug 2021 09:34:29 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 g12sm3428397wru.85.2021.08.19.09.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:34:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] hw/arm/xlnx-zynqmp: Realize qspi controller *after*
 qspi_dma
Date: Thu, 19 Aug 2021 18:34:19 +0200
Message-Id: <20210819163422.2863447-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819163422.2863447-1-philmd@redhat.com>
References: <20210819163422.2863447-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ChV/W3hoKUpu

If we link QOM object (a) as a property of QOM object (b),
we must set the property *before* (b) is realized.

Move QSPI realization *after* QSPI DMA.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/xlnx-zynqmp.c | 42 ++++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 3597e8db4de..9724978761b 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -570,26 +570,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         g_free(bus_name);
     }
 
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->qspi), errp)) {
-        return;
-    }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 0, QSPI_ADDR);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 1, LQSPI_ADDR);
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi), 0, gic_spi[QSPI_IRQ]);
-
-    for (i = 0; i < XLNX_ZYNQMP_NUM_QSPI_BUS; i++) {
-        gchar *bus_name;
-        gchar *target_bus;
-
-        /* Alias controller SPI bus to the SoC itself */
-        bus_name = g_strdup_printf("qspi%d", i);
-        target_bus = g_strdup_printf("spi%d", i);
-        object_property_add_alias(OBJECT(s), bus_name,
-                                  OBJECT(&s->qspi), target_bus);
-        g_free(bus_name);
-        g_free(target_bus);
-    }
-
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->dp), errp)) {
         return;
     }
@@ -646,8 +626,26 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi_dma), 0, QSPI_DMA_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi_dma), 0, gic_spi[QSPI_IRQ]);
-    object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
-                             OBJECT(&s->qspi_dma), errp);
+
+    if (!object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
+                                  OBJECT(&s->qspi_dma), errp)) {
+         return;
+    }
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->qspi), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 0, QSPI_ADDR);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 1, LQSPI_ADDR);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi), 0, gic_spi[QSPI_IRQ]);
+
+    for (i = 0; i < XLNX_ZYNQMP_NUM_QSPI_BUS; i++) {
+        g_autofree gchar *bus_name = g_strdup_printf("qspi%d", i);
+        g_autofree gchar *target_bus = g_strdup_printf("spi%d", i);
+
+        /* Alias controller SPI bus to the SoC itself */
+        object_property_add_alias(OBJECT(s), bus_name,
+                                  OBJECT(&s->qspi), target_bus);
+    }
 }
 
 static Property xlnx_zynqmp_props[] = {
-- 
2.31.1

