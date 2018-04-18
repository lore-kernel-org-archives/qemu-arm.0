Received: by 10.28.4.212 with SMTP id 203csp179527wme;
        Wed, 18 Apr 2018 07:29:23 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+CQ1RC5WYS9OqZynJwY0JiO9myCqxtI3hEFW81QTBK6McIRoZ7ci5qvW/jwJ12aC0Ky7iy
X-Received: by 10.233.223.69 with SMTP id t66mr2152847qkf.25.1524061763026;
        Wed, 18 Apr 2018 07:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524061763; cv=none;
        d=google.com; s=arc-20160816;
        b=BHpRXjihtKCHZJEO/LPwFaoYoFT7BlvsGBWahD2Gz2oqmSRaX7QvYINjpOtKDPqxdo
         KWO7oDDltWzhF2Jbs5T1AOMJDlrrEJhVo5xqh9xJmkUZHJ3mjBDVKA7d+pQbvyByh5Lc
         LY2MRdO4GlZFrr3Yq6B910v7NFdWdf06Eoer9A/E7XfsO5K5/BARwndcaQMV+MBIOkzg
         1aYagIMQ4xEre5zUIatSw2NZiOaSb7hOWKrI4Y5GRcIFvQj5H0zXCX0IVSgwr2eDliSk
         3/u/JXkPzYoY77kk+IkibVMsdrAVuVR0atCwNgkG8XRyX9R2G+tSe7Wo0S6Vsnn104bc
         1yeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=CNsvC7MDJ02n+dbf4Tj5gvqggvCZgZu09TTXiOlU/O0=;
        b=BFZ7ig0oql+MVgZpuV8ceXBQs6MttWli4sK2rM9192m3ZA7qzEOV0ygOTYHrrC72vb
         BeqPTahCupLgzhLs8jNTR1/1A4k7pyTBV/I2oZfAZYbDvvqHyweMMQRY78dxKUkmybHY
         1kcuXqRBXmAUSpMuuTbEfmsqLPgWlw1L3u/6I4LDFeOyT0y1DXgxz0Sd2ZSVVYu7XhcM
         eR7372HxpfvVQsQReAMAzVbF0Gpj9oPD5n7/HHQse/888ofNj0x9z+b5nS85wyQS4WKf
         sJh+IkPl5aew6bQgHdNExDw8noCzr4CicNCKYt/ukmj9H3HzHMwfiIhX1Fg2Fv7SRGhY
         P3xA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b6-v6si1698267qto.399.2018.04.18.07.29.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Apr 2018 07:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8o5K-0006lR-GF
	for alex.bennee@linaro.org; Wed, 18 Apr 2018 10:29:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f8o57-0006jp-Ay
	for qemu-arm@nongnu.org; Wed, 18 Apr 2018 10:29:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f8o56-0003ue-Eo
	for qemu-arm@nongnu.org; Wed, 18 Apr 2018 10:29:09 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35832 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1f8o56-0003uS-An; Wed, 18 Apr 2018 10:29:08 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E5451406803E;
	Wed, 18 Apr 2018 14:29:07 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DFBC32166BDA;
	Wed, 18 Apr 2018 14:29:06 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 18 Apr 2018 16:28:03 +0200
Message-Id: <1524061685-83305-4-git-send-email-imammedo@redhat.com>
In-Reply-To: <1524061685-83305-1-git-send-email-imammedo@redhat.com>
References: <1524061685-83305-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 18 Apr 2018 14:29:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 18 Apr 2018 14:29:07 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH for-2.13 v2 3/5] pc: simplify
 MachineClass::get_hotplug_handler handling
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, mst@redhat.com,
	ehabkost@redhat.com, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 54oVx6IFaeWY

By default MachineClass::get_hotplug_handler is NULL and concrete board
should set it to it's own handler.
Considering there isn't any default handler, drop saving empty
MachineClass::get_hotplug_handler in child class and make PC code
consistent with spapr/s390x boards.

We can bring this back when actual usecase surfaces and do it
consistently across boards that use get_hotplug_handler().

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: mst@redhat.com
CC: ehabkost@redhat.com
---
 include/hw/i386/pc.h | 8 --------
 hw/i386/pc.c         | 6 +-----
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index ffee841..fac6689 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -84,10 +84,6 @@ struct PCMachineState {
 /**
  * PCMachineClass:
  *
- * Methods:
- *
- * @get_hotplug_handler: pointer to parent class callback @get_hotplug_handler
- *
  * Compat fields:
  *
  * @enforce_aligned_dimm: check that DIMM's address/size is aligned by
@@ -107,10 +103,6 @@ struct PCMachineClass {
 
     /*< public >*/
 
-    /* Methods: */
-    HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
-                                           DeviceState *dev);
-
     /* Device configuration: */
     bool pci_enabled;
     bool kvmclock_enabled;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d36bac8..bc144d2 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2056,15 +2056,12 @@ static void pc_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
 static HotplugHandler *pc_get_hotpug_handler(MachineState *machine,
                                              DeviceState *dev)
 {
-    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(machine);
-
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
         object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         return HOTPLUG_HANDLER(machine);
     }
 
-    return pcmc->get_hotplug_handler ?
-        pcmc->get_hotplug_handler(machine, dev) : NULL;
+    return NULL;
 }
 
 static void
@@ -2344,7 +2341,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
     NMIClass *nc = NMI_CLASS(oc);
 
-    pcmc->get_hotplug_handler = mc->get_hotplug_handler;
     pcmc->pci_enabled = true;
     pcmc->has_acpi_build = true;
     pcmc->rsdp_in_ram = true;
-- 
2.7.4

