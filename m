Received: by 10.28.4.212 with SMTP id 203csp2849301wme;
        Mon, 7 May 2018 04:15:25 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqcCPg7wL0FyxeWOqZNlcbaaKjLW6kI1/C8G4MnD+Lzy/YynUS1xmJdwNmPAAZWFmesxcpS
X-Received: by 10.55.169.145 with SMTP id s139mr31611557qke.194.1525691725635;
        Mon, 07 May 2018 04:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525691725; cv=none;
        d=google.com; s=arc-20160816;
        b=tHBRNd13OLJGMlxRNMdzYKDRnOURiTvYGRLTbTHGVTUH2i9bGywL361wXpbD936fgW
         ScCm64QVUwy5M9YuId7CodE3UL4yKc7NPXb2dsXJmNWIUmU24wjvP9MWhFjEJFhA84Wb
         22uISaFDvidJTpplqF9IYJwFzjzD5CfA2qtI/8IC4GVaiSuvdAqBEuGffWacbtHrDqek
         f9rGF1InRXao1xkUgPg6A+gsn0G/PhkOtT1KuLgP0rGSPCMowRw9lNDwHKGcQt1kyFB5
         omlVXTHrwwZ8aRcdFpDYmUcLjOJJe/NBgIssQhBTLmjipDqaHiNtnZUEV16cMdGnqU6B
         htng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=t95xY48z6LyMi0OThWkmhxCSjxa+H7eUIxBbgqguy7w=;
        b=gre9hScg6ftzLuNmA/7tY7EweYqUhiEBu0BYIKVFsbLSXvsf2DujjB1M036FEe1lxQ
         p2zYi1dzjrhBlfFMgOjCvsg1Hbe1I2dc3BqMDXbuuYj19CLUNKT2M0/eau6iA/tuceWL
         UdxSTVagiA+ndLE7ymHOu0Xvna1Xt7ovPdL4D1oiIspYckFMxFfWTMVYnV5lhqUVA4KK
         /oc/NSrNVWUN0b5P4r/IuAAfJYOqzzoynEuYf917xbNe45kIcCp711AMqVEke501ypJr
         vG1NppII/ACYzSeekfAoMiBFqVSja7mEZfFXpHUc41AXZB0P94yjW+gZNqDJqOguGZ1+
         37zg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e75si495640qka.183.2018.05.07.04.15.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 May 2018 04:15:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45231 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fFe73-0003m7-2x
	for alex.bennee@linaro.org; Mon, 07 May 2018 07:15:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fFe4s-0002IR-NL
	for qemu-devel@nongnu.org; Mon, 07 May 2018 07:13:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fFe4r-0007Cv-NA
	for qemu-devel@nongnu.org; Mon, 07 May 2018 07:13:10 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36782 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fFe4k-00077K-Ff; Mon, 07 May 2018 07:13:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27DE4401DEA9;
	Mon,  7 May 2018 11:13:02 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 831617C58;
	Mon,  7 May 2018 11:13:01 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 May 2018 13:12:04 +0200
Message-Id: <1525691524-32265-5-git-send-email-imammedo@redhat.com>
In-Reply-To: <1525691524-32265-1-git-send-email-imammedo@redhat.com>
References: <1525691524-32265-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Mon, 07 May 2018 11:13:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 07 May 2018 11:13:02 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v4 4/4] make sure that we aren't overwriting
 mc->get_hotplug_handler by accident
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z3ZkwlN6SECV

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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
@@ -1578,6 +1578,7 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
     mc->cpu_index_to_instance_props =3D virt_cpu_index_to_props;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id =3D virt_get_default_cpu_node_id;
+    assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler =3D virt_machine_get_hotplug_handler;
     hc->plug =3D virt_machine_device_plug_cb;
 }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 018fd8d..019be25 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2355,6 +2355,7 @@ static void pc_machine_class_init(ObjectClass *oc, =
void *data)
     pcmc->acpi_data_size =3D 0x20000 + 0x8000;
     pcmc->save_tsc_khz =3D true;
     pcmc->linuxboot_dma_enabled =3D true;
+    assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler =3D pc_get_hotpug_handler;
     mc->cpu_index_to_instance_props =3D pc_cpu_index_to_props;
     mc->get_default_cpu_node_id =3D pc_get_default_cpu_node_id;
diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
index 1a469ba..d8e3f20 100644
--- a/hw/ppc/e500plat.c
+++ b/hw/ppc/e500plat.c
@@ -74,6 +74,7 @@ static void e500plat_machine_class_init(ObjectClass *oc=
, void *data)
     HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(oc);
     MachineClass *mc =3D MACHINE_CLASS(oc);
=20
+    assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler =3D e500plat_machine_get_hotpug_handler;
     hc->plug =3D e500plat_machine_device_plug_cb;
=20
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 32ab3c4..1a4cf42 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3977,6 +3977,7 @@ static void spapr_machine_class_init(ObjectClass *o=
c, void *data)
     mc->kvm_type =3D spapr_kvm_type;
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SPAPR_PCI_HOST_BRIDG=
E);
     mc->pci_allow_0_address =3D true;
+    assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler =3D spapr_get_hotplug_handler;
     hc->pre_plug =3D spapr_machine_device_pre_plug;
     hc->plug =3D spapr_machine_device_plug;
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 100dfdc..5796e24 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -491,6 +491,7 @@ static void ccw_machine_class_init(ObjectClass *oc, v=
oid *data)
     mc->no_sdcard =3D 1;
     mc->max_cpus =3D S390_MAX_CPUS;
     mc->has_hotpluggable_cpus =3D true;
+    assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler =3D s390_get_hotplug_handler;
     mc->cpu_index_to_instance_props =3D s390_cpu_index_to_props;
     mc->possible_cpu_arch_ids =3D s390_possible_cpu_arch_ids;
--=20
2.7.4

