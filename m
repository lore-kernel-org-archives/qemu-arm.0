Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp291031lfa;
        Fri, 23 Oct 2020 00:15:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0v1aKX6b3GUJtjn4VWpyoH/KQfNwbglQmBHBroXW3ePm+mmIxNf8RxJye0QZq1kitNyPo
X-Received: by 2002:a05:6102:7a3:: with SMTP id x3mr492437vsg.12.1603437317102;
        Fri, 23 Oct 2020 00:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603437317; cv=none;
        d=google.com; s=arc-20160816;
        b=HRhxL25fibq8Zvisza0Qu4H+BnIMJcnPp5Obo9MpbqVKPTiwuVV8fWd6nMLwBob6xr
         5HUf4CUehrRYpWFYEa51IFbx2bymLA4whCJgAP7hxxWWB/mCu4yUTPsktxkGrL9sW5Y2
         3A/P6T9/pOoSqIH4n6L78UuqGVhxHPaVYr6tgihiecinsXSynh1dBEGxLwwFlrf232Ep
         1crY4ePx2a/rfl7qKshQq2GUASUi8tn79ixfHE+6SLTR4DrZHHmEUdxsUrxFIlYQ3Xyt
         uARv+s5n3fFLk0cb8gAn81eUOSq6X7F8H6mrBaAueIH8WZPTIPRYWEPhG3CJiaYSp6Gx
         6ihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=chRhdyqhJeU3vaWtXMlHrEVu9ohXTyMhht/61+Hx6+4=;
        b=JanmI7meiXMedZy6Fpb6FIe7CoSuNfP114taCjeNzrdAtU0Ul7bizM1VqHRS2nC0hr
         sjy8V4Jv2cNF4dsl8mJ4E3kNm9vu9vBIXWFKYnJYp3GDbZ2VU9qfBr3MfHrtqk4cZu9O
         zqDLfyc3C57NmF4YWVbN6odHjc1J9OV9AAWhNpEbgIH2Aa4CNRtn2AOiGQcpc3RwpZ8P
         ths/BFSRaj0lvtjyCwzE5O2DsBHqk35bTvygFibowVc9LEUIu1jvyuLDS8JQaWkajOOz
         ZG3htY1SSKgNLuGFGhQPnD51jKpStBtMPjazR6Z1zOjShQC42/X6ajJWVRdN+PjAwaph
         Zfzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=beUgTGMZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22si55053vsn.426.2020.10.23.00.15.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 00:15:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=beUgTGMZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVrIC-0006KD-Dx
	for alex.bennee@linaro.org; Fri, 23 Oct 2020 03:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVrDk-0000yB-Ao
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 03:10:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVrDh-0003dk-Fr
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 03:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603437036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=chRhdyqhJeU3vaWtXMlHrEVu9ohXTyMhht/61+Hx6+4=;
 b=beUgTGMZ8wR7LSW0VDDOb/SzrEfN5KhyvkAnMbPKoz3GE9G/cuiitKDqFDkDyfsQbeFEf3
 2OK1MY1NunWxH0UpHjpN6PkGD1d9Q6mSI6tPftDpDFf2ppT+J24BXczMDa7D+V+tGwVwvb
 DS+3YGqGxDFnImhHLGizdnAXvT786Xw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-5COFfMteOtC3aBdiUWBckg-1; Fri, 23 Oct 2020 03:10:33 -0400
X-MC-Unique: 5COFfMteOtC3aBdiUWBckg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86899186DD41;
 Fri, 23 Oct 2020 07:10:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 063995D9D5;
 Fri, 23 Oct 2020 07:10:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 41379204A1; Fri, 23 Oct 2020 09:10:22 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] arm/virt: add device tree node for xhci
Date: Fri, 23 Oct 2020 09:10:18 +0200
Message-Id: <20201023071022.24916-5-kraxel@redhat.com>
In-Reply-To: <20201023071022.24916-1-kraxel@redhat.com>
References: <20201023071022.24916-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: thXZ3P0cGwFH

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/arm/virt.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f2b34fd33be4..4319dd95ef78 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -812,7 +812,10 @@ static void create_rtc(const VirtMachineState *vms)
 static void create_xhci(const VirtMachineState *vms)
 {
     hwaddr base = base_memmap[VIRT_XHCI].base;
+    hwaddr size = base_memmap[VIRT_XHCI].size;
     int irq = vms->irqmap[VIRT_XHCI];
+    const char compat[] = "generic-xhci";
+    char *nodename;
     DeviceState *dev;
 
     dev = qdev_new(TYPE_XHCI_SYSBUS);
@@ -823,6 +826,16 @@ static void create_xhci(const VirtMachineState *vms)
     sysbus_realize(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(vms->gic, irq));
+
+    nodename = g_strdup_printf("/usb@%" PRIx64, base);
+    qemu_fdt_add_subnode(vms->fdt, nodename);
+    qemu_fdt_setprop(vms->fdt, nodename, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
+                           GIC_FDT_IRQ_TYPE_SPI, irq,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    g_free(nodename);
 }
 
 static DeviceState *gpio_key_dev;
-- 
2.27.0

