Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5055605wrx;
        Wed, 20 Feb 2019 14:56:45 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbnV5H2jcSpOYjGDjHLSDYyAnkp9jes/bEfWVH5SkJFX7367RsqbXgsfuio1dIC6wKTbDyI
X-Received: by 2002:a25:f20a:: with SMTP id i10mr14031351ybe.132.1550703405893;
        Wed, 20 Feb 2019 14:56:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550703405; cv=none;
        d=google.com; s=arc-20160816;
        b=Y/lsTt8yA+Y8ltjy7Yp0V+MTvEhd/Y2exOlNXAOdCBQTjRn8wq5XxkBpnEp7tM3+3W
         J4P31Dg6x4nVhAGbbOF8oJCZ4+WvbElcYCv0bB/oWExMot/7LfLsY/e2cqVwNQ/fEP2w
         IKsfVBLeKZfiUyFL6G+U5dyRICmYC/VmYo1Cy6i7VHja4/mkJnBtEEmQFAauEndw2UNs
         2mkN2QkIbG/Dnc+lXh1EBembWZkQS01b8FGPGLbWlgxyPQcPNvXCNApb5QIjhIngNVPs
         fnIBgmeCG4ixHBSnf8ybGx5cRZFTXmrohKSk1kKBMet2T2RDy7DYGfGRmDPloB6+04dF
         WDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=vuW4BC8PaCe0NuzYIWfPPJSVNfyxFp2/D/2Nnv+wFkw=;
        b=S4Rc1ZUx3hqSPI/iNafu5nqGOus5UoX0b1cWavyJ3l+LEdmUPXILvK30+0u7JkeYtC
         jK0QBzg2fZwzMRNrssQAiUAa3MaqjSjzIUz1V7fsS3uJSdN5jMRRKA62MqpQ16hUGxxQ
         1qgoz9NwWBXCLquJ8SBBkgq2IkbgTiDwfmnMvKVy4iXzm6JGQNXUJxYWOkk6g8c0GFdg
         Q4+Y10py09AwGdei4iIpJ2nn6ssyjiwa11u+4sl9g3zvRY0dGEwtV2/bDFq0FW6h032J
         CHanlQ6R0V6LKubCG1nw3prh+ku/S/LgLtI8/597vU+GIiwBsLb0dCOLXTezv6UenPSs
         1hbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 63si2333987ybo.487.2019.02.20.14.56.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 14:56:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50194 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwanF-00082I-BT
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 17:56:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaYa-0004po-Ee
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 17:41:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaYT-0001fT-Fh
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 17:41:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55544)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gwaYI-0000vn-Od; Wed, 20 Feb 2019 17:41:18 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 964BC3082E09;
	Wed, 20 Feb 2019 22:41:16 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E84E85D6AA;
	Wed, 20 Feb 2019 22:41:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 20 Feb 2019 23:40:03 +0100
Message-Id: <20190220224003.4420-18-eric.auger@redhat.com>
In-Reply-To: <20190220224003.4420-1-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Wed, 20 Feb 2019 22:41:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v7 17/17] hw/arm/virt: Add nvdimm and
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yphI6/2Pk6iT

Machine option nvdimm allows to turn NVDIMM support on.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1896920570..c7e68e2428 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1814,6 +1814,47 @@ static void virt_set_iommu(Object *obj, const char=
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
@@ -1856,13 +1897,14 @@ static void virt_memory_pre_plug(HotplugHandler *=
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
@@ -2076,6 +2118,19 @@ static void virt_instance_init(Object *obj)
         vms->extended_memmap =3D true;
     }
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

