Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp520407wrt;
        Wed, 23 Jan 2019 02:19:22 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4RKFjyfpoFV9gG9FSJdGSwW9Iyei4gvE13qbSlWUToDI/WdvW7chiALkzuY8ufzPjq70w4
X-Received: by 2002:a1c:3c06:: with SMTP id j6mr1934864wma.27.1548238762144;
        Wed, 23 Jan 2019 02:19:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548238762; cv=none;
        d=google.com; s=arc-20160816;
        b=iaYg9lfPmGzNagc9iegUjiZ9qzvvw7fTdE2wz3YTmdyc4jpUjWA7IUTIFYZC6LBp2I
         dYSy1BN8YY8hWu5Iy/UDAHilWRAVNHdM/VNHZRAhe8W+J9M5/RfLe6KG1lXyGD4UW23m
         Y0+ZLgiBhgRFzn42w8a2/RXUJajoT+FP6X7QpkGEpI/MBW4fEccAgqj03C3m7GsjOdxa
         jxnU8lXBqBtoJamFSxiw/lYUU8eFq/DdkqzCkL1tCt2w5mrrjn6rpSjnDvbG0igWu7y0
         Xj1sAOsBZt5EWdQCWcSEhwrJag5Yxq+heTAkYeCXSn9lqnnF/kY08VH8omaSEmIOcFRw
         /2+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=4GoLFR+rJ4KelqblFLBHxZLuUrcjKEj3NlPo/jMn8cc=;
        b=YboXZb7Opa2upG26zVfq2Qe0EouHRsoLVd89cEOxovivpL8Ank3WR3cpc3dhvRl9LD
         xZicdChHsgIK7ke5jhc4HGYOwERRZLkOchXEUt2jpe5gM4K7lp2XccSv8PFYzHbGy7o9
         6b8iLmgwYEV0huQoAgwy4qK0nfFJ2slLhg2jEfEtiFgPz6K2jEzW4r6It2C8Govr9WsY
         nl2imQsifir+h0uYyR72CuaPIFHHFb0onKpnIo0EO8wcpfq5JGova2V308ah3xISzr7J
         y5wPLZSFdCqlpTDqioLArmUfh2HJeKiNHBxHh0U1LKOZdQyBiT7trRVpRNDCV/U9DD0N
         6YZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o64si35306016wmo.98.2019.01.23.02.19.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 02:19:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmFcv-000404-4U
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 05:19:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZN-0001Oo-MB
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:15:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZM-0007Ci-AQ
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:15:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45084)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gmFZL-00078v-IN; Wed, 23 Jan 2019 05:15:39 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC0A27A19B;
	Wed, 23 Jan 2019 10:15:34 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-91.ams2.redhat.com [10.36.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C38460181;
	Wed, 23 Jan 2019 10:15:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 23 Jan 2019 11:14:45 +0100
Message-Id: <20190123101458.12478-6-eric.auger@redhat.com>
In-Reply-To: <20190123101458.12478-1-eric.auger@redhat.com>
References: <20190123101458.12478-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 23 Jan 2019 10:15:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 05/18] hw/arm/virt: Move memory map
 initialization into machvirt_init
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
X-TUID: XEJmo8hbrxGX

This patch moves the memory map setup into machvirt_init().
The rationale is the memory map will be soon affected by the
kvm_type() call that happens after virt_instance_init().

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ba4088895a..ea1fb3ddfd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1359,6 +1359,22 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineSt=
ate *vms, int idx)
     return arm_cpu_mp_affinity(idx, clustersz);
 }
=20
+static void set_memory_map(VirtMachineState *vms)
+{
+    int i;
+
+    vms->memmap =3D extended_memmap;
+
+    for (i =3D 0; i < ARRAY_SIZE(a15memmap); i++) {
+        vms->memmap[i] =3D a15memmap[i];
+    }
+
+    for (i =3D VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++=
) {
+        vms->memmap[i].base =3D extended_memmap[i].base + vms->high_io_b=
ase;
+        vms->memmap[i].size =3D extended_memmap[i].size;
+    }
+}
+
 static void machvirt_init(MachineState *machine)
 {
     VirtMachineState *vms =3D VIRT_MACHINE(machine);
@@ -1373,6 +1389,8 @@ static void machvirt_init(MachineState *machine)
     bool firmware_loaded =3D bios_name || drive_get(IF_PFLASH, 0, 0);
     bool aarch64 =3D true;
=20
+    set_memory_map(vms);
+
     /* We can probe only here because during property set
      * KVM is not available yet
      */
@@ -1786,7 +1804,6 @@ static void virt_instance_init(Object *obj)
 {
     VirtMachineState *vms =3D VIRT_MACHINE(obj);
     VirtMachineClass *vmc =3D VIRT_MACHINE_GET_CLASS(vms);
-    int i;
=20
     /* EL3 is disabled by default on virt: this makes us consistent
      * between KVM and TCG for this board, and it also allows us to
@@ -1849,18 +1866,7 @@ static void virt_instance_init(Object *obj)
                                     "Valid values are none and smmuv3",
                                     NULL);
=20
-    vms->memmap =3D extended_memmap;
-
-    for (i =3D 0; i < ARRAY_SIZE(a15memmap); i++) {
-        vms->memmap[i] =3D a15memmap[i];
-    }
-
-    vms->high_io_base =3D S_256GiB; /* Top of the RAM */
-
-    for (i =3D VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++=
) {
-        vms->memmap[i].base =3D extended_memmap[i].base + vms->high_io_b=
ase;
-        vms->memmap[i].size =3D extended_memmap[i].size;
-    }
+    vms->high_io_base =3D S_256GiB; /* default RAM top */
     vms->irqmap =3D a15irqmap;
 }
=20
--=20
2.20.1

