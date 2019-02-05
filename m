Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5049645wrt;
        Tue, 5 Feb 2019 10:04:02 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZLDDwxuJ9WMDHSJFOxeecTbU+5n6D4pniChbtdm2yTzuqLs1pxyM9Z9MoZtFIMOL4MITpc
X-Received: by 2002:a5b:847:: with SMTP id v7mr4872403ybq.521.1549389841903;
        Tue, 05 Feb 2019 10:04:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549389841; cv=none;
        d=google.com; s=arc-20160816;
        b=Qeyjx/HO+PuwYCprhAMl4G4+dabB30OxfaHCIpJz30t8NJAL6G+zHs+FTDi51Ng9OD
         nTGFmMhfr84MZop7tZeLfkLzfq+urGw2sz8oryYHrlMP/zrqpMZXukfPmoCXfyyIHWv0
         Oak/iraVON7JqikRwj+LpKZr6XMOtKxfHDD9ly1OU2DNaWJ1p/iduUnJOGBTxK9755IR
         Ra8xiKQsk0vkcYfD7OSJ6fa4yFjpjlldXme6TrXpMsNYHFF8zwnewTGyOsVZDBBenyPN
         J4odIneaiDai6NRBVu5h4f4rMHscbVXSafujbexFjWG+u9O2+VdX/G2ksw8dVrEoJnzR
         QT9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=u0x7nH9eeezmi1gzcGHSYGmOW/UYeS48ExCLveeKYM4=;
        b=dGY/jnyDB32PUo2tb07df4jyEgDbYoYvMCetEW9SW4REXy57MDWs7lmbjEDoJUwB4L
         tVdwPc9u9Mup7yuj6dqXzuH4154iOvMtW53NX6hJ8lmwa9D9PpDdG7qPX5cfBeloWHuj
         YFYK3vZXd5YoVJip/5nDzx5/WrXzSNtKefnDfBlc8K92cHV6fP3GkVYp8XKd60jlbz18
         gyk+raq21IdwfPX8xIUDSK6ZD+h4rPp03Us39Y4Bw/42WLa9p+ZCqTdN/tvGZuAg4pjW
         PwCtEoCZ2/nqC+jIJIB/r1qmelsv1PcjXEC7bLv59HlHzVI1YqPf99FzmqIret654XsI
         zNIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9si2334630ybo.13.2019.02.05.10.04.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 10:04:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr54j-0008M7-Cj
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 13:04:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4c0-0000XM-MI
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 12:34:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4bz-0004Wa-La
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 12:34:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39660)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gr4bz-0004WE-8M; Tue, 05 Feb 2019 12:34:19 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 60E962C9779;
	Tue,  5 Feb 2019 17:34:18 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 415ED57981;
	Tue,  5 Feb 2019 17:34:09 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  5 Feb 2019 18:33:01 +0100
Message-Id: <20190205173306.20483-14-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-1-eric.auger@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 05 Feb 2019 17:34:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 13/18] hw/arm/virt-acpi-build: Add PC-DIMM in
 SRAT
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
X-TUID: SrV55YAIZiq3

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Generate Memory Affinity Structures for PC-DIMM ranges.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v5 -> v6:
- fix mingw compil issue

v4 -> v5:
- Align to x86 code and especially
  "pc: acpi: revert back to 1 SRAT entry for hotpluggable area"

v3 -> v4:
- do not use vms->bootinfo.device_memory_start/device_memory_size anymore

v1 -> v2:
- build_srat_hotpluggable_memory movedc to aml-build
---
 hw/arm/virt-acpi-build.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 829d2f0035..781eafaf5e 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -516,6 +516,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
     int i, srat_start;
     uint64_t mem_base;
     MachineClass *mc =3D MACHINE_GET_CLASS(vms);
+    MachineState *ms =3D MACHINE(vms);
     const CPUArchIdList *cpu_list =3D mc->possible_cpu_arch_ids(MACHINE(=
vms));
=20
     srat_start =3D table_data->len;
@@ -541,6 +542,14 @@ build_srat(GArray *table_data, BIOSLinker *linker, V=
irtMachineState *vms)
         }
     }
=20
+    if (ms->device_memory) {
+        numamem =3D acpi_data_push(table_data, sizeof *numamem);
+        build_srat_memory(numamem, ms->device_memory->base,
+                          memory_region_size(&ms->device_memory->mr),
+                          nb_numa_nodes - 1,
+                          MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABL=
ED);
+    }
+
     build_header(linker, table_data, (void *)(table_data->data + srat_st=
art),
                  "SRAT", table_data->len - srat_start, 3, NULL, NULL);
 }
--=20
2.20.1

