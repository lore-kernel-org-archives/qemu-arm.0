Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5056228wrt;
        Tue, 5 Feb 2019 10:10:27 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaDEBTuHQSpliLGoijR6vrWcr6gG9nej9P85/6lOnLx2mYEBZpFNYhtop+UOdFdSEOBciU+
X-Received: by 2002:a25:454:: with SMTP id 81mr5290793ybe.69.1549390227573;
        Tue, 05 Feb 2019 10:10:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549390227; cv=none;
        d=google.com; s=arc-20160816;
        b=JiiQcAxZ/qwsrXvXceZU42SVrdC+8cV9QIbDXwJqs2TU8DrctHJky0fL4jkb/w8Qtv
         fzpljL9oEeuFN0Bbl1+Yin6PF6/LwTPJ8zlfwXCINDl5OXK8NH6EnM3y/ht4+CtLOHWA
         TdKJ1VooX/tj6zn5gHrpa88dyqgMrBhxakF8zuYx5ZtsLpHjtfJ7fFuqbISoofUdPZ7i
         L1uUkEtXjTZXkk0KqNGtkiQ+9dR9uP+/4bonx1HrJntUtrCp98OWgeY/KxBXu3cX6MGw
         uSJOqzb8WRBXZJ/fKrPPVxlPA0ErN9/TNDJ3a22VuXtuu+Cz4AlxJa0t0EyWO/cAWWpv
         HjwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=dlQQc7HElkZIfO3R+gpFmRPbT3x3I5lQIcYoP8PGYKk=;
        b=KVjhiQbN3TdWNORID8pNnSkiQ1HAKKcHz8/Gvt5K9PyUSnKBGp0WE0fvCYQB078dgf
         kF8ATYpyU1pclnjxkk3RWJ3kwcNh6yA3CEPjGUPGvSuP3uNnHxpM6DE0zhYXDf56ldlV
         /KpF3BbsFwSRoVkc+Gps1Ujhwl/J5Xdd57omNNo4wD3UesZt2IyN5TPI/t+uhlqGDOyE
         XZV7sPK7eId4h+6oGKJto2xG+SqzCHhF9T1/I6tmTDoq+LGAc7Lx/dH8Q6pFsefWycO8
         1nZd0t51/a5pKnHD+Ao619u8PdSx5V57I7VEuivkADqfaojsnPTpyjOuJAy2wEQtcb6m
         CXAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5si2442065ybb.229.2019.02.05.10.10.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 10:10:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36430 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr5Aw-0005hB-R7
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 13:10:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4cZ-000100-4o
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 12:34:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4cX-0004jY-9m
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 12:34:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40112)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gr4cV-0004d5-Gw; Tue, 05 Feb 2019 12:34:52 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 44A11155E0;
	Tue,  5 Feb 2019 17:34:40 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C94457983;
	Tue,  5 Feb 2019 17:34:37 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  5 Feb 2019 18:33:06 +0100
Message-Id: <20190205173306.20483-19-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-1-eric.auger@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 05 Feb 2019 17:34:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 18/18] hw/arm/virt: Add nvdimm and
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Z1CSV1/VDdj

Machine option nvdimm allows to turn NVDIMM support on.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0c8c2cc191..85ce9becdb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1776,6 +1776,47 @@ static void virt_set_iommu(Object *obj, const char=
 *value, Error **errp)
     }
 }
=20
+static bool virt_get_nvdimm(Object *obj, Error **errp)
+{
+    VirtMachineState *vms =3D VIRT_MACHINE(obj);
+
+    return vms->acpi_nvdimm_state.is_enabled;
+}
+
+static void virt_set_nvdimm(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms =3D VIRT_MACHINE(obj);
+
+    vms->acpi_nvdimm_state.is_enabled =3D value;
+}
+
+static char *virt_get_nvdimm_persistence(Object *obj, Error **errp)
+{
+    VirtMachineState *vms =3D VIRT_MACHINE(obj);
+
+    return g_strdup(vms->acpi_nvdimm_state.persistence_string);
+}
+
+static void virt_set_nvdimm_persistence(Object *obj, const char *value,
+                                        Error **errp)
+{
+    VirtMachineState *vms =3D VIRT_MACHINE(obj);
+    AcpiNVDIMMState *nvdimm_state =3D &vms->acpi_nvdimm_state;
+
+    if (strcmp(value, "cpu") =3D=3D 0)
+        nvdimm_state->persistence =3D 3;
+    else if (strcmp(value, "mem-ctrl") =3D=3D 0)
+        nvdimm_state->persistence =3D 2;
+    else {
+        error_report("-machine nvdimm-persistence=3D%s: unsupported opti=
on",
+                     value);
+        exit(EXIT_FAILURE);
+    }
+
+    g_free(nvdimm_state->persistence_string);
+    nvdimm_state->persistence_string =3D g_strdup(value);
+}
+
 static CpuInstanceProperties
 virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 {
@@ -1818,13 +1859,14 @@ static void virt_memory_pre_plug(HotplugHandler *=
hotplug_dev, DeviceState *dev,
                                  Error **errp)
 {
     const bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_NVDIM=
M);
+    VirtMachineState *vms =3D VIRT_MACHINE(hotplug_dev);
=20
     if (dev->hotplugged) {
         error_setg(errp, "memory hotplug is not supported");
     }
=20
-    if (is_nvdimm) {
-        error_setg(errp, "nvdimm is not yet supported");
+    if (is_nvdimm && !vms->acpi_nvdimm_state.is_enabled) {
+        error_setg(errp, "nvdimm is not enabled: missing 'nvdimm' in '-M=
'");
         return;
     }
=20
@@ -2032,6 +2074,19 @@ static void virt_instance_init(Object *obj)
                                     "Valid values are none and smmuv3",
                                     NULL);
=20
+    object_property_add_bool(obj, "nvdimm",
+                             virt_get_nvdimm, virt_set_nvdimm, NULL);
+    object_property_set_description(obj, "nvdimm",
+                                         "Set on/off to enable/disable N=
VDIMM "
+                                         "instantiation", NULL);
+
+    object_property_add_str(obj, "nvdimm-persistence",
+                            virt_get_nvdimm_persistence,
+                            virt_set_nvdimm_persistence, NULL);
+    object_property_set_description(obj, "nvdimm-persistence",
+                                    "Set NVDIMM persistence"
+                                    "Valid values are cpu and mem-ctrl",=
 NULL);
+
     vms->irqmap =3D a15irqmap;
 }
=20
--=20
2.20.1

