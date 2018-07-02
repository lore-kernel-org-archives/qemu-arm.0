Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp121789wrq;
        Mon, 2 Jul 2018 10:35:06 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeQrUnBiWEgXUXEgvyi6u/UqcLZJIAe5DQGxpyz8mAS66XIo3Hdcbe78x8r/l0U8GWzLDRf
X-Received: by 2002:a37:1fdf:: with SMTP id n92-v6mr23669212qkh.333.1530552906824;
        Mon, 02 Jul 2018 10:35:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530552906; cv=none;
        d=google.com; s=arc-20160816;
        b=R8vvUqW0RzZLt2PMxlKsWOQ/0bl/ImnmeVv21JYxZM70CsHE0QxkG/57yzVrZDVYJ4
         K6BReoODdC0K6WvxpkQILgdkwwmNCTC+fA2rPuKwek75w0O0hbgHDt8tvbOlSSwOMeOW
         jaNvS2QRvtpLRN2Tq6C5tXejrJ4NWr56ff6U4QjJRWQxpVoTxat+KV4rum9uqcCZD56o
         OZC6sxbkgoXJUt9S0+/g69zPKvCY3Z1jaeXprXjeb+9ttfkuib07TNUwyJJsui2RSYnj
         hNFEDn+R096kGs5H2ShrcAcYLUVEbB8f7ELn6eOLUXoUPd08TRy0a6rtABC3rmkzFpj1
         tfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=U+VYLGYRBg5FB4iCHfFjsS6dEMreFjwwtbtwCMhizlk=;
        b=Oaov/F93/rnw1OJDSXL/ij3IGHQ1f+4FxnrjYxyG9dwqpk8qCajEUOmijd5txVGlg+
         mKjvUcxnSglvqSx5pwTjvQhkN6MRLS+hB1zH14YUjv/3dY8Mreif4hJrUGBZb/TqSV6Q
         hjkdd0TkrYA4eFMfAP9QF8Q7r9hrYZVUJ8mog9a4SbnxQ8wq6i7BHSK1G1HT6RmKkz/z
         kJmV2a1fvBuFrtmOYrxTCsgEXm/oPsbKRjwbFJwKrZY9xFOCNMXfoEXBvu4/r0zEYaSd
         RdoZtGVjnixtRmMdl8VMQW5TRvbQhZd3AnZQGjSW2evQPlQY4rjwTYKf/PU/hEUmZDvf
         70UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h57-v6si1559808qtf.71.2018.07.02.10.35.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 10:35:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34558 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa2jC-0000Eq-9w
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 13:35:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2YT-0000fd-Vw
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 13:24:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2YP-000766-0s
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 13:24:01 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49814 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fa2YM-000735-GR; Mon, 02 Jul 2018 13:23:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 170A97CBBA;
	Mon,  2 Jul 2018 17:23:54 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-57.ams2.redhat.com
	[10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 07203111AF38;
	Mon,  2 Jul 2018 17:23:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Mon,  2 Jul 2018 19:22:42 +0200
Message-Id: <1530552162-15533-16-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
References: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 02 Jul 2018 17:23:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 02 Jul 2018 17:23:54 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC v2 15/15] hw/arm/virt: Add nvdimm and
 nvdimm-persistence options
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei@redhat.com, drjones@redhat.com, david@gibson.dropbear.id.au,
	dgilbert@redhat.com, agraf@suse.de
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FW1RvnGTwBBR

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

