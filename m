Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp913117lfm;
        Tue, 7 Jul 2020 05:59:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWrOa7zBrAx2CHwbL8fLmR7VEOGu0GYDxUmwm0ik+FjM1mmXU30HS7PbXtuCZ+FeRRCbgD
X-Received: by 2002:a25:908d:: with SMTP id t13mr83286925ybl.450.1594126755213;
        Tue, 07 Jul 2020 05:59:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594126755; cv=none;
        d=google.com; s=arc-20160816;
        b=Bj5C5dhOxaie8bUET9LUL3rMf9N6eJigOkiL5UETkg01I1/dov/EKYk2zq2AXysv5S
         TP41WnpTi6NXCjA9pYoYuXG2jZRJhiXCzBONIHB8JR5/npLaxnd1oinhHLKEuD2owxNn
         D4PTbSkVGOrr9v2dDa9R1bWBQrEycPFgZdXQnGmJIaZu+xNo81xMBR/0EnDH1tzI9b53
         GLT+MXOp9qsh+xXL4tXGpxii7VOT0eWG26Y2itSFvvv99cFf/6mdT2tKVimUF2ODB/EV
         bDCeyAcoWPWCQwxmBhOPsh6+MwzjmzwIGlEvman3mcLFAkKdwx4U6AbeSBTd86SW9+9T
         742g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=Z16Tgq/lHTtNURBIfdG7/VdPyWMNzUE7lIxlb0vcRX8=;
        b=vRodOKZjGY30s+m4/mueENQDQbOGKqgtnthi2IGdfl4yxYsg6NikYetqFZ4Ju4huIZ
         l1QNed3enAkRoLaA9CzLK7xTAIiPiLBGzTroQxFBbVQWuni+Z/ukLfl7MVEQmw5uzBTG
         vL0IE5v/Ur0R04yfQmRrillWTKd+yku9SgO/P1uWqFHERTQ02C2ZBAserEQ747oRz266
         ntiBQqQgcSTk2wOyTiwBsDyaclR58ZI3WYM89eqMPHg4nyCYRZcGZWvP79QEEUMVyY+j
         SeYihgBe1IN/75sREJCRMX2klI6pZir9yKKkXHfzXIIvReIxfER73qOUr5gRCYD33vzE
         Fbdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=glqfS2CM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 144si22890569ybn.444.2020.07.07.05.59.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 05:59:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=glqfS2CM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsnBq-0007ML-LR
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 08:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsn7i-0008D7-3O
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 08:54:58 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:53327
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsn7e-0004rx-Sb
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 08:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594126494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=Z16Tgq/lHTtNURBIfdG7/VdPyWMNzUE7lIxlb0vcRX8=;
 b=glqfS2CMkXo4uBBS860yu+qbiWSsyuRmJ9aT8ADmmMg0kdMRw6iSNxtXrnPfLr+GbnqFLE
 qqJU7kEwSDUELfw/gfRBBx1G+tPBV2xsOhrABNv7QdEsCRMsLVBFlM0MWuZLHrv9xhhmzB
 /TIMTYFQSzRVvue+cXUoHzIQ8lXkv/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-RkvcAhOnMXm2yandsucMjA-1; Tue, 07 Jul 2020 08:54:52 -0400
X-MC-Unique: RkvcAhOnMXm2yandsucMjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAF17891555;
 Tue,  7 Jul 2020 12:54:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-200.ams2.redhat.com
 [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CB2610023A7;
 Tue,  7 Jul 2020 12:54:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A338231F99; Tue,  7 Jul 2020 14:53:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/20] microvm: wire up hotplug
Date: Tue,  7 Jul 2020 14:53:52 +0200
Message-Id: <20200707125356.32450-17-kraxel@redhat.com>
In-Reply-To: <20200707125356.32450-1-kraxel@redhat.com>
References: <20200707125356.32450-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:20:54
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
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j+aNl6GR3vaj

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

