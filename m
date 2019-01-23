Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp524144wrt;
        Wed, 23 Jan 2019 02:24:06 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4djP7TfF/5mKf2k6qCfyNduqI3ylkfGe7W7nBWgecBmfEd9bVv4F3saFSS7tnEi7rXE33r
X-Received: by 2002:adf:ef88:: with SMTP id d8mr2018877wro.163.1548239046705;
        Wed, 23 Jan 2019 02:24:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548239046; cv=none;
        d=google.com; s=arc-20160816;
        b=G4ofn8X0NeIj0jegAmbms0AW2RQsYxlOi4nfihPefiQ3abwoaU/epRASMdDHCPOcpg
         lms/MW/76gDaFHWbH5xUzmp9igO0vtJrS4eIV/YskI6vriPREoxa7i1+Q2omUSYXarAt
         RgoiGu2u5zz8rEeWyIZvCNL4ZCY1wcDsLlJWEtXk8xbn3pV5Q7gumKi6XqE/1FlPIAbY
         /8MaZaKIY+1D46NoO3yAYyLJHnCQq9jjEqttc0iFfk00zyo6cO7KFB2yHNmgy8QvjHKE
         l40dei/pt7C6qiXMfM8ebSbIZZLQQDqpyM2JZTayKnNwuLBFCnwymoXm+7UcJr3K8hm5
         Yc8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=e57LzUlp9l0sSejkIz5IsWxGrX3HvfFUg/ZGPgRJkK4=;
        b=j54OPOjkVMcH4dL16Ys2omE5PcFeBfQMfsQVYnQxJP0ngWHwTnyJH0x/WX3GOcrJ3T
         hES9KpV638GeWbdG3cGHAGdgBeW54H9dHTppDebe+C7xqPqLt8wP2f0wCgqlEDSKL++K
         kVYmC27Rgo1EVIulbBuqfSEzMMVdTF2LAZHwU20ZjBK1Heu2k5rtvFpk4fBwVxzqszVw
         cCHU2bEX7rrXl06KXrtV2NB/WeQexodKQfIKIO+ml2UfZ6ff0qA7SqVxbLP6/rb1TZgD
         e8Yu41qHxxOMEzws9iSDmCjoHe9RIrzWcnV8Jcowh44hFgj5mCsR7Td/ValuMb+tZbIR
         X4mA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 89si32045143wrk.98.2019.01.23.02.24.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 02:24:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59787 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmFhV-00087D-OI
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 05:24:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZv-0001sO-DV
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:16:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZt-0007aj-7d
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:16:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52950)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gmFZr-0007ZR-EM; Wed, 23 Jan 2019 05:16:13 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 505B580E7B;
	Wed, 23 Jan 2019 10:16:09 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-91.ams2.redhat.com [10.36.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3765560192;
	Wed, 23 Jan 2019 10:16:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 23 Jan 2019 11:14:53 +0100
Message-Id: <20190123101458.12478-14-eric.auger@redhat.com>
In-Reply-To: <20190123101458.12478-1-eric.auger@redhat.com>
References: <20190123101458.12478-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 23 Jan 2019 10:16:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 13/18] hw/arm/virt-acpi-build: Add PC-DIMM in
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
X-TUID: Ei7KyESjOocU

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Generate Memory Affinity Structures for PC-DIMM ranges.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v5 -> v5:
- Align to x86 code and especially
  "pc: acpi: revert back to 1 SRAT entry for hotpluggable area"

v3 -> v4:
- do not use vms->bootinfo.device_memory_start/device_memory_size anymore

v1 -> v2:
- build_srat_hotpluggable_memory movedc to aml-build
---
 hw/arm/virt-acpi-build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 829d2f0035..a2feacf6ce 100644
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
@@ -541,6 +542,13 @@ build_srat(GArray *table_data, BIOSLinker *linker, V=
irtMachineState *vms)
         }
     }
=20
+    if (ms->device_memory) {
+        numamem =3D acpi_data_push(table_data, sizeof *numamem);
+        build_srat_memory(numamem, ms->device_memory->base,
+                          ms->device_memory->mr.size, nb_numa_nodes - 1,
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

