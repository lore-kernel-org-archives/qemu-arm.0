Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3097497wre;
        Mon, 28 May 2018 20:09:29 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLt9DGwVPFko2gLn5WHHJZLXLj8ipqnjV8dg4ANuZbZe5/zJVVlPmPCAEHD8hNte5Crc429
X-Received: by 2002:a37:9ad4:: with SMTP id c203-v6mr13622572qke.378.1527563369382;
        Mon, 28 May 2018 20:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527563369; cv=none;
        d=google.com; s=arc-20160816;
        b=xaf1azZkBvJjuc4iafe/rOL9fbgkW0TIfgCGQvNoCnQbttl26JyStEKBFFouOrtdqb
         IUvNH9NMz/pD6VMEOyyOhrO54Lvn1L9BtcTxQ+QzSifICBWo5nD1NL7q8o7PnCvilx50
         bDFEvjMzziQ36Gto7ZwG89pKqnBRhmKpBGn8zLSObV2GvlZy/jl3aGPKcSXSFCXwEUxW
         o4kbOdZWUsX9WV3nRYHWtD+e+xPG2V5BLC83sSmHR1ztxv0VMmfq/j/jtgkM/M5sjkMF
         Z03R5fxH/xnRUggzZaahv5CtSq+X8AhxItJK+FR+ZihC5vYMKdd5WwkACoN3M4m/2/Yu
         8g9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=0C8ll6aObgblBvy05d6FKWIARETXzx0htouX+BMpQGk=;
        b=lN2YDFrpAVxd8u0GeR8lLpZVvftR83xk9KxDSmknlnCOfN50HVinh8dEbi5VvTCqXO
         l0CJ4JyBgVKTS1HSJiuiunTlrKll4wNWp0dXVCNgdlBrH1Y3rHNVwJ95tjo8XtDxzJnv
         f/erelDppFMpqsp7WtFKEZSkrvYh4aYQmVXPHsDFv6g6D+4cAOIeRjBMff6ymOy/SLXJ
         ejCzjOstUgHt1X+hSzwlQgmBLi/OB/mtpHXJczh/QfXBxQYv9Edx7XgqHhesPOsJ4GFt
         4RJvr8WDRxhZ2faWXADbvEds/K4Wm0w8B9ZbT09Ru8Y19fa3+IsAGC5Z5SZbcGzMpc9D
         Jlcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m3-v6si2315400qkf.111.2018.05.28.20.09.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 20:09:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58711 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNV0q-0007xG-TM
	for alex.bennee@linaro.org; Mon, 28 May 2018 23:09:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fNV0j-0007wu-8M
	for qemu-arm@nongnu.org; Mon, 28 May 2018 23:09:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fNV0g-0007AW-1x
	for qemu-arm@nongnu.org; Mon, 28 May 2018 23:09:21 -0400
Received: from [45.249.212.35] (port=39425 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fNV0f-00077V-L7; Mon, 28 May 2018 23:09:17 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 38C7653540BA6;
	Tue, 29 May 2018 11:09:12 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server
	id 14.3.382.0; Tue, 29 May 2018 11:09:05 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Tue, 29 May 2018 11:08:03 +0800
Message-ID: <1527563283-13148-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v2] ARM: ACPI: Fix use-after-free due to memory
 realloc
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
Cc: Shannon Zhao <zhaoshenglong@huawei.com>, peter.maydell@linaro.org,
	shannon.zhaosl@gmail.com, qemu-devel@nongnu.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jo8KuB1jg0V8

acpi_data_push uses g_array_set_size to resize the memory size. If there
is no enough contiguous memory, the address will be changed. So previous
pointer could not be used any more. It must update the pointer and use
the new one.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
---
V2: add comments for iort_node_offset and reviewed tags
---
 hw/arm/virt-acpi-build.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 92ceee9..6209138 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -400,7 +400,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
     AcpiIortItsGroup *its;
     AcpiIortTable *iort;
     AcpiIortSmmu3 *smmu;
-    size_t node_size, iort_length, smmu_offset =3D 0;
+    size_t node_size, iort_node_offset, iort_length, smmu_offset =3D 0;
     AcpiIortRC *rc;
=20
     iort =3D acpi_data_push(table_data, sizeof(*iort));
@@ -415,6 +415,12 @@ build_iort(GArray *table_data, BIOSLinker *linker, V=
irtMachineState *vms)
     iort->node_count =3D cpu_to_le32(nb_nodes);
     iort->node_offset =3D cpu_to_le32(sizeof(*iort));
=20
+    /*
+     * Use a copy in case table_data->data moves duringa acpi_data_push
+     * operations.
+     */
+    iort_node_offset =3D sizeof(*iort);
+
     /* ITS group node */
     node_size =3D  sizeof(*its) + sizeof(uint32_t);
     iort_length +=3D node_size;
@@ -429,7 +435,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
         int irq =3D  vms->irqmap[VIRT_SMMU];
=20
         /* SMMUv3 node */
-        smmu_offset =3D iort->node_offset + node_size;
+        smmu_offset =3D iort_node_offset + node_size;
         node_size =3D sizeof(*smmu) + sizeof(*idmap);
         iort_length +=3D node_size;
         smmu =3D acpi_data_push(table_data, node_size);
@@ -450,7 +456,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
         idmap->id_count =3D cpu_to_le32(0xFFFF);
         idmap->output_base =3D 0;
         /* output IORT node is the ITS group node (the first node) */
-        idmap->output_reference =3D cpu_to_le32(iort->node_offset);
+        idmap->output_reference =3D cpu_to_le32(iort_node_offset);
     }
=20
     /* Root Complex Node */
@@ -479,9 +485,14 @@ build_iort(GArray *table_data, BIOSLinker *linker, V=
irtMachineState *vms)
         idmap->output_reference =3D cpu_to_le32(smmu_offset);
     } else {
         /* output IORT node is the ITS group node (the first node) */
-        idmap->output_reference =3D cpu_to_le32(iort->node_offset);
+        idmap->output_reference =3D cpu_to_le32(iort_node_offset);
     }
=20
+    /*
+     * Update the pointer address in case table_data->data moves during =
above
+     * acpi_data_push operations.
+     */
+    iort =3D (AcpiIortTable *)(table_data->data + iort_start);
     iort->length =3D cpu_to_le32(iort_length);
=20
     build_header(linker, table_data, (void *)(table_data->data + iort_st=
art),
--=20
2.0.4


