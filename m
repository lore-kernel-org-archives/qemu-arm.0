Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3114311lfq;
        Tue, 15 Sep 2020 05:15:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl5VBoZoh8ZSNq1H0Ow7jLlOB/su4PZPYdeeb4SCOzUx4LUdED0LFetv7ahZaRzi7dbuWN
X-Received: by 2002:a25:b701:: with SMTP id t1mr8816375ybj.393.1600172118884;
        Tue, 15 Sep 2020 05:15:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600172118; cv=none;
        d=google.com; s=arc-20160816;
        b=bjmBN49mZR+qBjKnAeQOc8Y/1iq7qKaNs9g0WDOcMb3/bku692pOBW+KXZUQ6XhOdx
         bL1q4StVILXEydsYP9Ir/Hwbn16Gx0qMlNFtMtfAZujqvYGGXcHIJZRVYpbhpal/JGeZ
         QbGiTb0J5g6EFa1J9CcliBMg/v47zUUTQt2A9VeA+7cPuq/0JzWFC5WsqW6raiy/C5OG
         TD+wRCA/tEKbCREr1yaAG0USKcs9Pr/rtUAdIQIAGMPmSVKlelm2OfV+ykAPk7yJFql0
         SrDuHMf463XUiKoAcha0Cmx710OZIG4dxxhcq8WBEaDdN8gQHTD5LcglK4J+ZNy3LgkR
         wCcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7WupihrubTyVUDCyRuf11xOUpe+0jDZC5WwdAXgUf0U=;
        b=mtb/uzkTepIkxGNBU5vOIJLXS7amR6oOBIuDomXU7kvb1JKk8eg4TOLk15UkcaDeSt
         a+IQaBhay0aFUw98TA396fV1ZcWnKe5C2BRUDzE/HpXfBvSUOsVXjAoyKbnLDmj+2rk8
         NARsq/sE9Ours/8NkfwvumbVpxBl1Wn0ubXVWlbHK9aIO7o6yMF688U8qnZggZ9fPYJJ
         hf9gZ90yGEDLvlagNX8giolkl5ef/7EANBrhfx9zbE44UMdUDNc649Qkv0bG1pqd/WxU
         D7szf0UfaaAUVgPTYn8E5TdVmsIeM1PO36fR+/NyFT5PuI5yeNLhSMjIOzy3ijXVbRLv
         +Hrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="boZbm/Gs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e142si12506872ybh.104.2020.09.15.05.15.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 05:15:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="boZbm/Gs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI9ri-0001kp-40
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 08:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9ng-0005E8-Tu
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 08:11:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44170
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9na-0007p7-PI
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 08:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600171861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7WupihrubTyVUDCyRuf11xOUpe+0jDZC5WwdAXgUf0U=;
 b=boZbm/GslBfSQLvLC39r08jA0jTiCCUvtyIII2ye66uqSYj4qDArICjShpI8TnXc1GgWGv
 giz7TESaHWXrYkRwixpT0pfEpdhyxG5dEpsKTAJPwX9eUYKtZWuGXc6X6sTDq8srh7PN0O
 AZ2ZkGj83sP0djD+7Syef2DncaO5u+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-D5BgoJ_gOT-qmaCj06bs5w-1; Tue, 15 Sep 2020 08:09:33 -0400
X-MC-Unique: D5BgoJ_gOT-qmaCj06bs5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B781F1091066;
 Tue, 15 Sep 2020 12:09:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63BC11975F;
 Tue, 15 Sep 2020 12:09:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 411F540BFB; Tue, 15 Sep 2020 14:09:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 16/21] microvm: wire up hotplug
Date: Tue, 15 Sep 2020 14:09:04 +0200
Message-Id: <20200915120909.20838-17-kraxel@redhat.com>
In-Reply-To: <20200915120909.20838-1-kraxel@redhat.com>
References: <20200915120909.20838-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:11:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: w9h57m71wPkO

The cpu hotplug code handles the initialization of coldplugged cpus
too, so it is needed even in case cpu hotplug is not supported.

Wire cpu hotplug up for microvm.
Without this we get a broken MADT table.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
---
 hw/i386/microvm.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 9df15354ce0f..8de8ca864963 100644
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
 
@@ -524,6 +558,13 @@ static void microvm_class_init(ObjectClass *oc, void *data)
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
@@ -573,6 +614,7 @@ static const TypeInfo microvm_machine_info = {
     .class_size    = sizeof(MicrovmMachineClass),
     .class_init    = microvm_class_init,
     .interfaces = (InterfaceInfo[]) {
+         { TYPE_HOTPLUG_HANDLER },
          { }
     },
 };
-- 
2.27.0

