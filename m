Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp532949wrt;
        Wed, 23 Jan 2019 02:34:03 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6+ZvQ9se2nGPk8M4GjY7wlQWdvefE2bjcEFGp1KJiH+ng3F1AoVp9cFu5UtB8mkNXo0D+N
X-Received: by 2002:adf:81b6:: with SMTP id 51mr2178682wra.240.1548239643871;
        Wed, 23 Jan 2019 02:34:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548239643; cv=none;
        d=google.com; s=arc-20160816;
        b=MbojnwXyUjKLFoqF6H8G2knMOI+9eU2Lcm51bUfJyE/2egWl9o1e6M+Mg9pD1xfLsp
         lmONcPmszPzZKCdoBk7Lxbyxkffdg7lQ+ZE/FGc9r0nWwDowWTzxUm72VivythSNSUbA
         Q0SkOmB+mFNuJTblSLvzCnz7wKmXrel+sQqrP7bvZKVDBk5zMmNALPgkfxwSC+q0YJsC
         tv/7pdVPZ7oqpaFG93YmIjR9B3xq9jtmZI4a6cvbWU3FkeE2JDJjh7qBIJwpecSuFKKb
         o3AWR4cSWsRmP2hFmcDkF18MGZ3hw/BKkXY/wFKZW0suzEjywnmnRhQ4Kbi5dKrN2f0S
         /G7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=o9f5UhkgkbxYsuCy7vyvmWdTEgC/PVqeOIa7iXdhNSw=;
        b=lOUbVjDwjcluIiT6pz54pCY1AhjCu1xUmMt973bu8b45JAai7wubUPN0lCiNODGt1M
         ICiHV9CUwD3mfqYNsJ7gwwMozWV1BqfQiHVOi4Y9I5Pk5hHKdutfclhpFZq8ahEJRhI8
         YH6R407RGLlz7bAMQ97a1dJuQhbnV3TXMF0yIgFGNEYyO3AtgY7GDPrbl1mY8R7z+Ne5
         C1r3a6AeBPI4D1TgFmIbD1/7uUrvEcu4R2KxMW2nUbEu/I4lmXPaoXGWJC/XdeQgBT4g
         C0WBAf0AbrEEVej0WZE4ChiwJvQ2jkewznevUZOeFNW4GtCB5FMXRf0jVIN45Kurb0LT
         H9gw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si70642466wrn.132.2019.01.23.02.34.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 02:34:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmFr8-0007sU-Uf
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 05:34:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFag-0002Tw-LT
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:17:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFae-0007v1-PZ
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:17:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:25123)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gmFac-0007uA-Tk; Wed, 23 Jan 2019 05:17:00 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6251D7F6C7;
	Wed, 23 Jan 2019 10:16:57 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-91.ams2.redhat.com [10.36.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60E65601A5;
	Wed, 23 Jan 2019 10:16:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 23 Jan 2019 11:14:58 +0100
Message-Id: <20190123101458.12478-19-eric.auger@redhat.com>
In-Reply-To: <20190123101458.12478-1-eric.auger@redhat.com>
References: <20190123101458.12478-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 23 Jan 2019 10:16:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 18/18] hw/arm/virt: Add nvdimm and
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
X-TUID: BTZP7rqtMAYw

Machine option nvdimm allows to turn NVDIMM support on.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f21cf32936..8c6dd59c69 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1749,6 +1749,47 @@ static void virt_set_iommu(Object *obj, const char=
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
@@ -1791,13 +1832,14 @@ static void virt_memory_pre_plug(HotplugHandler *=
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
@@ -2001,7 +2043,19 @@ static void virt_instance_init(Object *obj)
                                     "Valid values are none and smmuv3",
                                     NULL);
=20
-    vms->high_io_base =3D S_256GiB; /* default RAM top */
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

