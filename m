Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5046394wrx;
        Wed, 20 Feb 2019 14:41:35 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaQitdm9f09iGaEBXqRcOSMNxkCIsfoJ1JlffMVAVNg0BLKqHawyyZWXKlTdn+qOIZJ7H4P
X-Received: by 2002:a25:3045:: with SMTP id w66mr29825302ybw.185.1550702494996;
        Wed, 20 Feb 2019 14:41:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550702494; cv=none;
        d=google.com; s=arc-20160816;
        b=i5KL0F3OAvsPPwi1s5f3EuRBRXFfJtJLdaxBLcRlPfyFD5gpI9cEDSy7/BO/6U4Znm
         9dzW799EDc5nuRand2w2rH+fXVoeVn+tH/pu5InHbEh5F8aRK7n2Hx704zqf8huVDgsZ
         j+WFZCHIXlcdiEmJsJh0vQPhFu4SXurYNy47PRktVsZXsROL17CUg5xWwEq3QwO8VwVv
         FNpF3LlfiIvAbTv4C0ftyPe/Io7VbcK5hYAEel1QzovUdbPY87t93s+2ARWrDPe5WxGb
         e+HcOhWvYSqtzgVB07dRiOTj5hU4Xzes/0v2ihSdRWxborgF9t0Tdgr/KkoYk76far/6
         DteQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=KHDm4yY4SX73AeaEEuX3TPo3LcN5BJ8W2PH6R2XsBUo=;
        b=DibR+IclEk7a5CuuXQ+jKVeAcFi0Ii0ZOV6PH8P1cZBShmXZtNWRQs6iL8JOAjp0pc
         LqEHnQiLIrEBmKKFVTUPtG2yijRrp3eOLaqM4VS+aaH1lFb4f6UhFqOWMIXUEpNEh0hW
         85hZu723nZm0wUtRgSE4eDwxDfnw3BUKCu3Ecghdx51VzgU2tTofRWgH4sDNXdG7KGjc
         PYximh5TF1/fDuFYpy/x6ge0bsPzOAgVDxzG0Ypco8TGdw5G6yy1sEQde4UtG+XsZKhL
         TKAlHDDI/acNfx3D+9kLL3bsriCyK9QCggYPgy+cm6RgmyiK49TkCycTSG2EBPsoZiH/
         VD0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h40si13401644ywk.242.2019.02.20.14.41.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 14:41:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwaYY-0004dF-C2
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 17:41:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaY4-0004MW-Kf
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:41:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaY3-0000Np-Nz
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:41:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59186)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gwaY1-0000H7-Mc; Wed, 20 Feb 2019 17:41:02 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C2EF1307D8BE;
	Wed, 20 Feb 2019 22:40:57 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F71E5D6AA;
	Wed, 20 Feb 2019 22:40:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 20 Feb 2019 23:39:58 +0100
Message-Id: <20190220224003.4420-13-eric.auger@redhat.com>
In-Reply-To: <20190220224003.4420-1-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 20 Feb 2019 22:40:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 12/17] hw/arm/virt-acpi-build: Add PC-DIMM in
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
X-TUID: 8/vBArOGfpAS

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

