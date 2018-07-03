Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp695907wrq;
        Tue, 3 Jul 2018 00:26:29 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeQZ8t+oN3X8AahnBJhsDvv7lq6EyDBjtVMpDl4aoEUVO/UYKluqXzPtA3m5jWCKnoe4QZg
X-Received: by 2002:ac8:82e:: with SMTP id u43-v6mr9030106qth.88.1530602789316;
        Tue, 03 Jul 2018 00:26:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530602789; cv=none;
        d=google.com; s=arc-20160816;
        b=vrWn9AVUupcWRwca5ik4jMiEVvGrBI1b0mRqhyiAyy0kTHlIMvFHZOrBckz3MEup3V
         XTnWDnw/4dA6Fx2K6SSD91pbaBU8GQEp8OMbqdyjg6eopoPSL8sacMqanf/Wd7yoBAFY
         BTTN9qEQ5so8UPhjajUlnKMso+iNOMKiw3y7ZTs5VXpu40UoD87VDGKeoT/QxhSLzEnd
         bumZIPmD2iSDFyf816hbbqPtryE0hD/3OE+aP3ndEdH8IiQAOvcvPt7lctZactSWXs/6
         DbabzV7LZfvH7navY0F9JdEgnNu6cBJWwn3Pzsoa2VVfExwMgsHzJgT6kB/mFeDpNvNb
         +h1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=U+VYLGYRBg5FB4iCHfFjsS6dEMreFjwwtbtwCMhizlk=;
        b=HEOFQM1EZUMb8jHaF4gRw70B5MRcDs+h0aOlTVSpvwmzhqaDEQc7mpiGjafZ0lDjDq
         aiXaRUKb8w1/0aXC6hmaFlGe/dJWXmgzTaRPbUi5Jb/jZg/tUFU6WRGd7yQ/Gu5Mx43B
         bZSziLffCMQjvPbC1ox+3pNk5zVOK6MWMCqxwt84JoEMHdAdjS4QpYpy41q2Vyhz3Nyp
         ZyVGm4vxi+xT6WnjrENNoUHuwBWGXQLpC0njeYWZN4GVmUhUXg0sb4hqDLGr1F6h/AE/
         tSbWU3hxAShOXIgs7tUM5EYX1MkYZnTzEeBa7O0GOanLDohEJRVm33eFjbnv08KO0Cpt
         ZDJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u16-v6si469887qvf.157.2018.07.03.00.26.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 00:26:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faFhk-0004W6-SY
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 03:26:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFgZ-0003uM-Fg
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:26:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFcW-0005nx-FW
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:25:15 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46880 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1faFcV-0005ls-MB; Tue, 03 Jul 2018 03:21:03 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0BD4E7262D;
	Tue,  3 Jul 2018 07:21:03 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-71.ams2.redhat.com
	[10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BB131C5B5;
	Tue,  3 Jul 2018 07:21:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  3 Jul 2018 09:19:58 +0200
Message-Id: <1530602398-16127-16-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 03 Jul 2018 07:21:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 03 Jul 2018 07:21:03 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v3 15/15] hw/arm/virt: Add nvdimm and
 nvdimm-persistence options
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
Cc: drjones@redhat.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DDt62Bllio21

Machine option nvdimm allows to turn NVDIMM support on.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 51f42cd..13e6dec 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1762,6 +1762,47 @@ static void virt_set_kvm_type(Object *obj, const char *value, Error **errp)
     vms->kvm_type = g_strdup(value);
 }
 
+static bool virt_get_nvdimm(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->acpi_nvdimm_state.is_enabled;
+}
+
+static void virt_set_nvdimm(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->acpi_nvdimm_state.is_enabled = value;
+}
+
+static char *virt_get_nvdimm_persistence(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return g_strdup(vms->acpi_nvdimm_state.persistence_string);
+}
+
+static void virt_set_nvdimm_persistence(Object *obj, const char *value,
+                                        Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+    AcpiNVDIMMState *nvdimm_state = &vms->acpi_nvdimm_state;
+
+    if (strcmp(value, "cpu") == 0)
+        nvdimm_state->persistence = 3;
+    else if (strcmp(value, "mem-ctrl") == 0)
+        nvdimm_state->persistence = 2;
+    else {
+        error_report("-machine nvdimm-persistence=%s: unsupported option",
+                     value);
+        exit(EXIT_FAILURE);
+    }
+
+    g_free(nvdimm_state->persistence_string);
+    nvdimm_state->persistence_string = g_strdup(value);
+}
+
 static CpuInstanceProperties
 virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 {
@@ -1804,10 +1845,10 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                                  Error **errp)
 {
     const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
 
-    if (is_nvdimm) {
-        error_setg(errp, "nvdimm is not yet supported");
-        return;
+    if (is_nvdimm && !vms->acpi_nvdimm_state.is_enabled) {
+        error_setg(errp, "nvdimm is not enabled: missing 'nvdimm' in '-M'");
     }
 }
 
@@ -2044,6 +2085,19 @@ static void virt_3_0_instance_init(Object *obj)
     object_property_add_str(obj, "kvm-type",
                             virt_get_kvm_type, virt_set_kvm_type, NULL);
 
+    object_property_add_bool(obj, "nvdimm",
+                             virt_get_nvdimm, virt_set_nvdimm, NULL);
+    object_property_set_description(obj, "nvdimm",
+                                         "Set on/off to enable/disable NVDIMM "
+                                         "instantiation", NULL);
+
+    object_property_add_str(obj, "nvdimm-persistence",
+                            virt_get_nvdimm_persistence,
+                            virt_set_nvdimm_persistence, NULL);
+    object_property_set_description(obj, "nvdimm-persistence",
+                                    "Set NVDIMM persistence"
+                                    "Valid values are cpu and mem-ctrl", NULL);
+
     vms->memmap = a15memmap;
     vms->irqmap = a15irqmap;
 }
-- 
2.5.5

