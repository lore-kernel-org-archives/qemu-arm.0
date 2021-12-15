Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp222102lfj;
        Wed, 15 Dec 2021 06:50:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0l+6IOGeAdguQu3hptezCoVdR9IzyFzz85AOUN3q2dadjCWg2lc7A0V1utPKUFtTVPJWl
X-Received: by 2002:a05:6638:12d6:: with SMTP id v22mr6002518jas.6.1639579839299;
        Wed, 15 Dec 2021 06:50:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639579839; cv=none;
        d=google.com; s=arc-20160816;
        b=yXTc1dmdMOH0CDtPGepdN6pnpeNCRwNUdr5sTNlLB4E2Q5KCWVYXO3/RJrrn7FPobm
         5ffoezADlT+t6daGP2XLDwmpJ9IVZYjjCcsGLJgh8ghZn9+Q6gh/MeNhjszcFpqPeWPK
         pW/LEQAvuWeX5dnuUbQ2tiAtSKy8oBDv7/qv9CiicQyuhA3U0TRFl+IoFPCqNMQEbqOf
         HZlssPNkhEc963xeCpQG9JL2Ehb4D6UeRhx3k5w55FjL/0l4VMLr8Ms0ni2IMvX0d2tE
         bBRz3r5OSpZBN4YrlC6SteR9KTVJtWbgdzDybvrk2NprHcflfzhf/zrhgZpJxVYju3WK
         hoMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3VDWlihgIQN1ahbyNL4iqIQ345qkWnfRwEmVyLliHxw=;
        b=i4Pm+j4dS+Sn622CbeeSCXXBRIfOPLXxxDN5MBV6oyaTP9D5u9Iod+AXfzWgYxQV5E
         MdnmeIdPqn/U3Z9My0Yh9E9gwh8UWWh6wVct3aM8U7vSG3ZzEIBpsm58bh6CIsM2bFNg
         zSOcA/tUdaiuJvIULiNw7FaQ05FQlwxG+hK/eHXk5xADclOY63fGltG/U1vwkjvCjGyv
         5MACemMtjl2H+nfykDsnSzcQmnBav26sOAHNBxxsxzBj4PSh15vnkVRkgCHxCvOLFx4E
         Gw/i5vNajx54+cg0MVCgA3TU72ahUg63BeTPdZKKUHptdLsSlxtWrfjUS4CxHphqDUke
         HWiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b0cFVNnt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8si649119jae.564.2021.12.15.06.50.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Dec 2021 06:50:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b0cFVNnt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxVc5-0005jf-UN
	for alex.bennee@linaro.org; Wed, 15 Dec 2021 09:50:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrd-0000rc-KF
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:02:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrY-0001SK-N8
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:02:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639576951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3VDWlihgIQN1ahbyNL4iqIQ345qkWnfRwEmVyLliHxw=;
 b=b0cFVNnt2QCfoRv7H7EL4M2Lxl6R2AvgDBMqKmwgeJrIY50Oq1pYgpsqv0S5W1xcYIOoLt
 anHE2HWtx+UNz8Tl0rzatXheMHUM/iAcvlMsyt5MPeRvdAyKexwrdFQPqgYh3+WgslnRH4
 /DoDBaNO3qlWNx1M52jokFmgsPCMmUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-waxmmB28OwKyIKh1XTmD2A-1; Wed, 15 Dec 2021 09:02:27 -0500
X-MC-Unique: waxmmB28OwKyIKh1XTmD2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09B51101D60D;
 Wed, 15 Dec 2021 14:02:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB7B55BD07;
 Wed, 15 Dec 2021 14:02:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6E9F11138224; Wed, 15 Dec 2021 15:02:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/13] hw/arm/xilinx_zynq: Replace drive_get_next() by
 drive_get()
Date: Wed, 15 Dec 2021 15:02:20 +0100
Message-Id: <20211215140222.769652-12-armbru@redhat.com>
In-Reply-To: <20211215140222.769652-1-armbru@redhat.com>
References: <20211215140222.769652-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, richard.henderson@linaro.org,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q6Dsvoov1KBv

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
Message-Id: <20211117163409.3587705-12-armbru@redhat.com>
Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
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

