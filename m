Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1836232lfm;
        Thu, 2 Jul 2020 13:49:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPgTDmfELuxMwvIv4kMYr1eAFV8oXI/Rdb8TC/ECloDKpMebxvqwvfES7m5Am34H8b7DE3
X-Received: by 2002:a25:ac5e:: with SMTP id r30mr58051961ybd.68.1593722987411;
        Thu, 02 Jul 2020 13:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593722987; cv=none;
        d=google.com; s=arc-20160816;
        b=DYENlHuQCR3feaUboPEOsddaWjlq1hsT5Rg67fZlyVZJm8RtFSQkpl6s6u42FvrHlc
         qAaDYDw3UFu/VcfAjD9QWvn8rnPPyTKDO15o7kiw732oCfO6MEhMjCQjHvdrNcmyakVf
         NDSrbID38a6EX34JmshZXXBOrJMF4gs3vRV6f3uNyGZ6bsiFxW7OF3vm7DQ8h1bIRQLT
         jeZl1YOeKC8wQzLRFjrOoYYwMx2xpoYALHuNSufbncJI9vi93Fv4affGZtboBBxt+hpL
         TYhc8ZPvjx4Hso6BVdMdtAL1P3M+LrX220hPVDdwyMnmfzuqlJy6a92IR3bwmFYwlG2F
         DYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=Z16Tgq/lHTtNURBIfdG7/VdPyWMNzUE7lIxlb0vcRX8=;
        b=xVEeumSAaTapONzjbLZ+gcRLt+KFev/6HVO9f12bFy/dH90cJi4kQqlOyRnowby+rC
         nQUS0fXQJFW06igqmsEc1UmRwp96TS9FWQHRlLBE2wYXyNXYeLQZ0iqse5uThXrb1e9n
         v21XWXUsXymBRxjS7Y1fLK9j+EyszY21adVxPe+R4Fe9EXDn+x6aJ1HDdsRzTRwNiB2R
         TCLc1lrSq5lCsHjU8MSeZoIr1Kvz14LLXZyG22GOk1MZHz2FRWUXjrKhX+ZBYrkwFXnb
         cHW6SOfWcm4cYPh2M6Ir2nRv4pu7cP4Kf3rTrCcXvKEZVPelqoQFYi7FGgzPVB+Obpns
         x76w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=X1cwcspe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8si9349931ybq.97.2020.07.02.13.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 13:49:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=X1cwcspe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr69S-0004rS-OM
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 16:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr694-0004F0-LN
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:22 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:56543
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr692-0003Xb-DD
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593722959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=Z16Tgq/lHTtNURBIfdG7/VdPyWMNzUE7lIxlb0vcRX8=;
 b=X1cwcspei6qvEuo8812/Qm+lAmXFz2IG+p6NU8wk/GayrkrDmy2ekU79lluoDRwEDTRxpd
 9Ov/wnd9xC67LTiiVOe4FgXw3O7YVYh3N2E4tsxiDhWz46ZL7wH+czR2A+04BcnV558Lcd
 b1YYC0OlMC7mIStANsy/0neHFfgMvaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-zN2EekpyNi-bPY3scVeqnQ-1; Thu, 02 Jul 2020 16:49:18 -0400
X-MC-Unique: zN2EekpyNi-bPY3scVeqnQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCBB3107ACF4;
 Thu,  2 Jul 2020 20:49:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76EE31A925;
 Thu,  2 Jul 2020 20:49:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 84F6531EE9; Thu,  2 Jul 2020 22:49:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/21] microvm: wire up hotplug
Date: Thu,  2 Jul 2020 22:48:54 +0200
Message-Id: <20200702204859.9876-17-kraxel@redhat.com>
In-Reply-To: <20200702204859.9876-1-kraxel@redhat.com>
References: <20200702204859.9876-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:18:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aWGbPDPEqcM8

The cpu hotplug code handles the initialization of coldplugged cpus
too, so it is needed even in case cpu hotplug is not supported.

Wire cpu hotplug up for microvm.
Without this we get a broken MADT table.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/microvm.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 3d8a66cfc3ac..a5b16b728f9f 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -320,6 +320,39 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
     g_free(cmdline);
 }
 
+static void microvm_device_pre_plug_cb(HotplugHandler *hotplug_dev,
+                                       DeviceState *dev, Error **errp)
+{
+    x86_cpu_pre_plug(hotplug_dev, dev, errp);
+}
+
+static void microvm_device_plug_cb(HotplugHandler *hotplug_dev,
+                                   DeviceState *dev, Error **errp)
+{
+    x86_cpu_plug(hotplug_dev, dev, errp);
+}
+
+static void microvm_device_unplug_request_cb(HotplugHandler *hotplug_dev,
+                                             DeviceState *dev, Error **errp)
+{
+    error_setg(errp, "unplug not supported by microvm");
+}
+
+static void microvm_device_unplug_cb(HotplugHandler *hotplug_dev,
+                                     DeviceState *dev, Error **errp)
+{
+    error_setg(errp, "unplug not supported by microvm");
+}
+
+static HotplugHandler *microvm_get_hotplug_handler(MachineState *machine,
+                                                   DeviceState *dev)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        return HOTPLUG_HANDLER(machine);
+    }
+    return NULL;
+}
+
 static void microvm_machine_state_init(MachineState *machine)
 {
     MicrovmMachineState *mms = MICROVM_MACHINE(machine);
@@ -503,6 +536,7 @@ static void microvm_machine_initfn(Object *obj)
 static void microvm_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
     mc->init = microvm_machine_state_init;
 
@@ -523,6 +557,13 @@ static void microvm_class_init(ObjectClass *oc, void *data)
     /* Machine class handlers */
     mc->reset = microvm_machine_reset;
 
+    /* hotplug (for cpu coldplug) */
+    mc->get_hotplug_handler = microvm_get_hotplug_handler;
+    hc->pre_plug = microvm_device_pre_plug_cb;
+    hc->plug = microvm_device_plug_cb;
+    hc->unplug_request = microvm_device_unplug_request_cb;
+    hc->unplug = microvm_device_unplug_cb;
+
     object_class_property_add(oc, MICROVM_MACHINE_PIC, "OnOffAuto",
                               microvm_machine_get_pic,
                               microvm_machine_set_pic,
@@ -572,6 +613,7 @@ static const TypeInfo microvm_machine_info = {
     .class_size    = sizeof(MicrovmMachineClass),
     .class_init    = microvm_class_init,
     .interfaces = (InterfaceInfo[]) {
+         { TYPE_HOTPLUG_HANDLER },
          { }
     },
 };
-- 
2.18.4

