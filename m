Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11098134wrx;
        Tue, 26 Feb 2019 05:58:50 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ7+rn8jOGx/Y97Y5NOoOXqhZEXext32NDh463XgPJW+AnM9JxtEYzOdj+jFL8p8wmxbmK5
X-Received: by 2002:a0d:d803:: with SMTP id a3mr18133087ywe.183.1551189530169;
        Tue, 26 Feb 2019 05:58:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551189530; cv=none;
        d=google.com; s=arc-20160816;
        b=KY2NAfW3UEcy18w2CoybCW4Kezni4Lp39oxS2035nKId6vef20Rj4KQS9ct4NyDRam
         kd/bxzYHUrLnn2LRYbZMiWVIOclJ2EXRvSXGdisvitTw/NTK+lbZX4GCy8CwkcquAiuW
         cPJ0iiv4S/N6ovS0ZDfRmg3H6uJjt1OJexPCWRy3M3cjm9XfunS53uFtUsP+7sn077ej
         ENfGa0raGeYYCZYqNOwqi0Uj6i1Qh3KBZRQ9coB1U5FARuqrcMIc9Bjum76eGgDV7D9t
         rIdU07IeGyS/fdkdEFC6Osnh9mK+yok+EiVC3loI1a7m67tLTopsDxF9waCWxUnp0J49
         699w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Anmpy+zjHyfa1KpPS2WniZccTsyVTtYFJ6aVKEWRdv4=;
        b=xZYQyn9khARVGJ/mQO5Re1kPGjBeiE+SblR3i+7L4wu/LHkadRO92rZ6QKJR2q4CQI
         +n5BbhT2FY5A8+wQndkvj0IfVghuXsTVPdudBK/F1kO9nl1y+6WsBKYrYSDe8HS0bsEi
         WLDecHmXTLUMMqiBxp05KoNBonqWD5XCcdTk6WqX4WpkY+QxSzDqyaL7DyibQtvFCfpZ
         CEzcF7wTgspm81ov1Z/jleHjUAUFDL/1VySgHnLgXiIAsOd3UkiI29wA55FBz9jdvPfZ
         5+wzJlu3/pBQKparixamO5tSHnxDrnMeh8EH59F3KRj3RYhl0AyA3Fpa0m5FXHpxYqIN
         tLoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p206si7319665yba.350.2019.02.26.05.58.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 05:58:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gydFx-0006Ku-JL
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 08:58:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd90-0000ZS-Nu
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 08:51:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd8z-0007WK-Qe
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 08:51:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49936)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyd8z-0007U4-KK; Tue, 26 Feb 2019 08:51:37 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A341630C1929;
	Tue, 26 Feb 2019 13:51:35 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA93F5E1B0;
	Tue, 26 Feb 2019 13:51:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 14:50:09 +0100
Message-Id: <20190226135014.31854-14-eric.auger@redhat.com>
In-Reply-To: <20190226135014.31854-1-eric.auger@redhat.com>
References: <20190226135014.31854-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 26 Feb 2019 13:51:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v8 13/18] hw/arm/virt-acpi-build: Add PC-DIMM in
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gkvJTPmHjHsq

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Generate Memory Affinity Structures for PC-DIMM ranges.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---

v6 -> v7:
- add Igor's R-b

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
index d7e2e4885b..8151fda239 100644
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

