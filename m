Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp962981lfk;
        Wed, 17 Nov 2021 08:35:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlAAPCtrZGVR2+kRllTzXRWBB261SDrC/Vki8T7NO2DkoDu3o5jskwF+vyCvhkHj4KBkzv
X-Received: by 2002:ab0:4324:: with SMTP id k33mr25527857uak.43.1637166905716;
        Wed, 17 Nov 2021 08:35:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637166905; cv=none;
        d=google.com; s=arc-20160816;
        b=Vn9FKzTdJLNb5bkOV/oHXQQZorkn16xIj3vVWeoYN0eeJeGwFfA1f5/dZj2rvnofv3
         HaTLDAMkZsRA4OcXajLLN1LpKl5l/FuV2HdmLNNOyGSzd7ieG9q7+w+CUKz2QZKOtxcK
         BiHoYqlJN/uA/s6AbD6w91s9rZ4UAXQOqHqxftQulIa85OdwAdSUhZleCSk5sBie0DJd
         qTdAUs5jSYFZ2Mn819ETfseYw2AxRUbbe/qO78nA1ugeOYrMZEUh8CJnxxRUoofw5A/n
         t5GhYvmuQPxqMYyhGEyPzvwjvmCKumGRex4ztwhsU5GfM6O93XC2B4CSHbLnyaDj3O0y
         XtPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qy/be1AOUE7Ms2lbtbLyXpcwHOrPuiAjrY96KknfdPQ=;
        b=ckXgGPOFoz8sqmsnBIxUP4Z75rzAGvHaTSGy7yZBNA3WmdmiiuTecMa1fo0TBNGv7q
         hK8RDl8n+6v++YK2E8IvUaaoC7ba1ielwtqGLgi1boubEmSAchwXKyo4ah/i7ZkTG1a5
         aJlfxTHWVcNrbO3GYDxwOEyuP7eIVJs6MQD5Xq7QHEYKFigt462zYfVlS8XyNIQocT15
         cfGtpGDHDByN46y5MKC333E2Ou0qSHSw69uk22dR4f4YZZEXngmD8//Ln5tPRJU64RKX
         MC1F8+0XIVB7qWjg1FbJtv5dJH/kWDUdRKEa+Cv+LFaeghhKs0PAQbxBRupbCl7hVbCL
         RmTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZVrbT53+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10si426807uak.56.2021.11.17.08.35.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Nov 2021 08:35:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZVrbT53+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnNtp-0003QW-21
	for alex.bennee@linaro.org; Wed, 17 Nov 2021 11:35:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNtF-0003OY-Nv
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 11:34:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNt9-00089I-SY
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 11:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637166863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qy/be1AOUE7Ms2lbtbLyXpcwHOrPuiAjrY96KknfdPQ=;
 b=ZVrbT53+hXtSKsM2oiR3BkBfrYEiDSK+RQmPpMnFdVSV7Jl5WHVnK0Q7gEu8XDf/NNc5y/
 bMFJPSDBWuqn8WPcfnCEVMSqS8ZV9388uGzTkENs4UV/D2SkPDE5MW8pU1T1idIahtuhQf
 g+CPgGgqDC9bIL0rm6B/MVJmqMftsKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-gwWkTUUUPMSA-jwxnir80Q-1; Wed, 17 Nov 2021 11:34:20 -0500
X-MC-Unique: gwWkTUUUPMSA-jwxnir80Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B584A8799EB;
 Wed, 17 Nov 2021 16:34:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 828945C1BB;
 Wed, 17 Nov 2021 16:34:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9A8F91132996; Wed, 17 Nov 2021 17:34:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/13] hw/arm/xilinx_zynq: Replace drive_get_next() by
 drive_get()
Date: Wed, 17 Nov 2021 17:34:07 +0100
Message-Id: <20211117163409.3587705-12-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-1-armbru@redhat.com>
References: <20211117163409.3587705-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IE65PHIuc79/

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

Machine "xlnx-zcu102" connects backends with drive_get_next() in two
counting loops, one of them in a helper function.  Change it to use
drive_get() directly.  This makes the unit numbers explicit in the
code.

Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/xilinx_zynq.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 69c333e91b..50e7268396 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -125,9 +125,10 @@ static void gem_init(NICInfo *nd, uint32_t base, qemu_irq irq)
     sysbus_connect_irq(s, 0, irq);
 }
 
-static inline void zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
-                                         bool is_qspi)
+static inline int zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
+                                        bool is_qspi, int unit0)
 {
+    int unit = unit0;
     DeviceState *dev;
     SysBusDevice *busdev;
     SSIBus *spi;
@@ -156,7 +157,7 @@ static inline void zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
         spi = (SSIBus *)qdev_get_child_bus(dev, bus_name);
 
         for (j = 0; j < num_ss; ++j) {
-            DriveInfo *dinfo = drive_get_next(IF_MTD);
+            DriveInfo *dinfo = drive_get(IF_MTD, 0, unit++);
             flash_dev = qdev_new("n25q128");
             if (dinfo) {
                 qdev_prop_set_drive_err(flash_dev, "drive",
@@ -170,6 +171,7 @@ static inline void zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
         }
     }
 
+    return unit;
 }
 
 static void zynq_init(MachineState *machine)
@@ -247,9 +249,9 @@ static void zynq_init(MachineState *machine)
         pic[n] = qdev_get_gpio_in(dev, n);
     }
 
-    zynq_init_spi_flashes(0xE0006000, pic[58-IRQ_OFFSET], false);
-    zynq_init_spi_flashes(0xE0007000, pic[81-IRQ_OFFSET], false);
-    zynq_init_spi_flashes(0xE000D000, pic[51-IRQ_OFFSET], true);
+    n = zynq_init_spi_flashes(0xE0006000, pic[58 - IRQ_OFFSET], false, 0);
+    n = zynq_init_spi_flashes(0xE0007000, pic[81 - IRQ_OFFSET], false, n);
+    n = zynq_init_spi_flashes(0xE000D000, pic[51 - IRQ_OFFSET], true, n);
 
     sysbus_create_simple(TYPE_CHIPIDEA, 0xE0002000, pic[53 - IRQ_OFFSET]);
     sysbus_create_simple(TYPE_CHIPIDEA, 0xE0003000, pic[76 - IRQ_OFFSET]);
@@ -298,7 +300,7 @@ static void zynq_init(MachineState *machine)
         sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, hci_addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[hci_irq - IRQ_OFFSET]);
 
-        di = drive_get_next(IF_SD);
+        di = drive_get(IF_SD, 0, n);
         blk = di ? blk_by_legacy_dinfo(di) : NULL;
         carddev = qdev_new(TYPE_SD_CARD);
         qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
-- 
2.31.1

