Received: by 10.28.4.212 with SMTP id 203csp4795801wme;
        Tue, 1 May 2018 05:13:57 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoc+aBEG9Zf4KKqXM0HcUJjh2uAJPMHBbddS2meh0/F5TwSgWRqHomlSaIJVctmWSHbvq8u
X-Received: by 2002:aed:2d43:: with SMTP id h61-v6mr13710236qtd.31.1525176837762;
        Tue, 01 May 2018 05:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525176837; cv=none;
        d=google.com; s=arc-20160816;
        b=RrF3F6749pTOOudnuxedRzwaJtevaCkisr/2oMtRyKObOqX6S3wsgkNyERz8z2JO7a
         pHna+kdHmifb6harrRo/Fnmk9WnVcrat9zVslfJWDVfd/fJiR4xx+CqZRanGrw2h0GMb
         lp35221PeKloMt2r1854P+ATD/JbpiIiJyIHEwAjkvs1moxQdCO/On8Sriqxm6RNllZY
         xMApdD/x4+ojM+EqtuYK1cKwKH1xZJqKDxiUz4EYNNyKSyTnND3QdX+z0ktt2mLT5Vyg
         uHvD581jtDLwrjH4Mye5+GzT0hlRyXW+0C8BvPFJNhrgX1jh0tmGIRdc6UTcnhUffUqv
         WQ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=P7ju7j2a5bgXGcukSHrIQhsbjqmls7YUwfTIEzPBv9M=;
        b=rTRQZzdi9+gSVtinN3y1KkvZH3FzBIOMlRHdEKnPz4Me9Qsnw57CYCrlg0n+pDQ8kK
         z7xwme7GELfEj/hABmSBgQw5qh598WwXu53hXxgYqGeoBeMKGMAWXHZjIer174kOCQOs
         kqDv/63p940szko1TuGA1DTNgBzgWEXpIPVvV9mBue7Vnf02Q465qDI80F3Cwk2mu+t2
         q6eTMQ+d7rgnZzRI1N5n57UFYzyECDbNt1C9/moPw/PHSN98JwzmmTRUO3HwvIlj8Idd
         rykwkSoGSZSLH5avCXvuKpjw1aO8ChE8YMse9y6wwB+7V+YHCiR6eEeunxJRGsw4F0MP
         hTxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b4si5414438qkb.209.2018.05.01.05.13.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 May 2018 05:13:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42276 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fDUAP-00005f-BE
	for alex.bennee@linaro.org; Tue, 01 May 2018 08:13:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fDU6N-0005aV-W4
	for qemu-arm@nongnu.org; Tue, 01 May 2018 08:09:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fDU6L-0003RC-AV
	for qemu-arm@nongnu.org; Tue, 01 May 2018 08:09:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53020 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fDU6L-0003R1-51; Tue, 01 May 2018 08:09:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CAEED427095C;
	Tue,  1 May 2018 12:09:44 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 126402022C00;
	Tue,  1 May 2018 12:09:43 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 May 2018 14:08:42 +0200
Message-Id: <1525176522-200354-6-git-send-email-imammedo@redhat.com>
In-Reply-To: <1525176522-200354-1-git-send-email-imammedo@redhat.com>
References: <1525176522-200354-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 01 May 2018 12:09:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 01 May 2018 12:09:44 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 5/5] make sure that we aren't overwriting
 mc->get_hotplug_handler by accident
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OZQbFYHCvSzF

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt.c              | 1 +
 hw/i386/pc.c               | 1 +
 hw/ppc/e500plat.c          | 1 +
 hw/ppc/spapr.c             | 1 +
 hw/s390x/s390-virtio-ccw.c | 1 +
 5 files changed, 5 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 71661c6..9b0a931 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1578,6 +1578,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
+    assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
     hc->plug = virt_machine_device_plug_cb;
 }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 018fd8d..019be25 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2355,6 +2355,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->acpi_data_size = 0x20000 + 0x8000;
     pcmc->save_tsc_khz = true;
     pcmc->linuxboot_dma_enabled = true;
+    assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = pc_get_hotpug_handler;
     mc->cpu_index_to_instance_props = pc_cpu_index_to_props;
     mc->get_default_cpu_node_id = pc_get_default_cpu_node_id;
diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
index 1a469ba..d8e3f20 100644
--- a/hw/ppc/e500plat.c
+++ b/hw/ppc/e500plat.c
@@ -74,6 +74,7 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
     MachineClass *mc = MACHINE_CLASS(oc);
 
+    assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = e500plat_machine_get_hotpug_handler;
     hc->plug = e500plat_machine_device_plug_cb;
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index b35aff5..5b2b00a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3995,6 +3995,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     mc->kvm_type = spapr_kvm_type;
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SPAPR_PCI_HOST_BRIDGE);
     mc->pci_allow_0_address = true;
+    assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = spapr_get_hotplug_handler;
     hc->pre_plug = spapr_machine_device_pre_plug;
     hc->plug = spapr_machine_device_plug;
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 435f7c9..905583a 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -476,6 +476,7 @@ static void ccw_machine_class_init(ObjectClass *oc, void *data)
     mc->use_sclp = 1;
     mc->max_cpus = S390_MAX_CPUS;
     mc->has_hotpluggable_cpus = true;
+    assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = s390_get_hotplug_handler;
     mc->cpu_index_to_instance_props = s390_cpu_index_to_props;
     mc->possible_cpu_arch_ids = s390_possible_cpu_arch_ids;
-- 
2.7.4

