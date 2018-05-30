Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4418191wre;
        Wed, 30 May 2018 00:07:20 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLObLHNf/I2VlRpU31nJ4mbS5fn/E/pSEtf/RPrIk6FmXhW4ivYKQW4C5nv35/+I5S9+dvG
X-Received: by 2002:aed:2448:: with SMTP id s8-v6mr1380052qtc.336.1527664039941;
        Wed, 30 May 2018 00:07:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527664039; cv=none;
        d=google.com; s=arc-20160816;
        b=OczeA4xLFbLcpAd140Z6YNy4wJIOIIwOboeJc/9x2RTX+fpOqxfKlWV1u2FNa/diYy
         lVppXQoT0jb6Fy06fgPZHMj1xnq4nIQ0hqMDckzrSqy+AwcssOGAgcAAqJl4MqhuMCKS
         OJMzI81XAeyLyp1bGemkoS9xZ6veWTi5bn+RI1H4KvsikVDG0EctvqMkZE9UyIxCBVVQ
         qxsQoQEETUdsyy9ejd8dv+ILoHI9Te/umWM+kVnzh5u18CZXoWLHuFrUAGgEfEcCMwKX
         Ti5ts1CD41DMnGs6oK/nw3+WQmYPDvKl7hlNKYm8cOyVm6hLNHNLgRsoRbivm9zu27t+
         LBFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=dmphkCmWZv3j+6J5IT7Cazi/Bw49vGe7+mh011MtRr8=;
        b=Do63kjzUDwXpoOrmU1v0i3mnk+u3GNButQ52nQOLtSQbJVkKwfNgrJc+pvAon2PDQt
         4FQ/1c8zxMLBz28Gpw0y8JeU5SPCKFP0qwBDEI9yok/5efn7Xnu6OERsiwDy3WZit8Oi
         DDc3MLXfTs/+7jC7iMSU+7qP8GOWSnaTBV/+zytSFsp2OCaJ0nOcqSfwngwaoEQ5sbPx
         c40UCQ+fGDEOcmfXii3pxZPPMWNd0Nx88lrItPfmuL2m6vmd/+RJN9aAG7VAoaciVzYF
         dW8qLUMmtsz54y+X/D4GspQKJ+EPn27i7tIrhU8536VfldV0SkKo+BgX3kZW+iG4bRFm
         sUug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e30-v6si6183971qtg.171.2018.05.30.00.07.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 00:07:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36605 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNvCZ-0003IP-FD
	for alex.bennee@linaro.org; Wed, 30 May 2018 03:07:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fNvCJ-0003Ch-Pf
	for qemu-arm@nongnu.org; Wed, 30 May 2018 03:07:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fNvCG-0007WI-LT
	for qemu-arm@nongnu.org; Wed, 30 May 2018 03:07:03 -0400
Received: from [45.249.212.32] (port=34630 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fNvCG-0007Uh-AG; Wed, 30 May 2018 03:07:00 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id AF1C3215E4417;
	Wed, 30 May 2018 15:06:53 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server
	id 14.3.382.0; Wed, 30 May 2018 15:06:47 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Wed, 30 May 2018 15:05:51 +0800
Message-ID: <1527663951-14552-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH v3] ARM: ACPI: Fix use-after-free due to memory
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com, qemu-devel@nongnu.org,
	f4bug@amsat.org, shannon.zhaosl@gmail.com,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fVbM3VM5u4pH

acpi_data_push uses g_array_set_size to resize the memory size. If there
is no enough contiguous memory, the address will be changed. So previous
pointer could not be used any more. It must update the pointer and use
the new one.

Also, previous codes wrongly use le32 conversion of iort->node_offset
for subsequent computations that will result incorrect value if host is
not litlle endian. So use the non-converted one instead.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
---
V3: Fix typo and add some words in commit message to explain another bug
---
 hw/arm/virt-acpi-build.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 92ceee9..74f5744 100644
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
@@ -413,7 +413,12 @@ build_iort(GArray *table_data, BIOSLinker *linker, V=
irtMachineState *vms)
=20
     iort_length =3D sizeof(*iort);
     iort->node_count =3D cpu_to_le32(nb_nodes);
-    iort->node_offset =3D cpu_to_le32(sizeof(*iort));
+    /*
+     * Use a copy in case table_data->data moves during acpi_data_push
+     * operations.
+     */
+    iort_node_offset =3D sizeof(*iort);
+    iort->node_offset =3D cpu_to_le32(iort_node_offset);
=20
     /* ITS group node */
     node_size =3D  sizeof(*its) + sizeof(uint32_t);
@@ -429,7 +434,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
         int irq =3D  vms->irqmap[VIRT_SMMU];
=20
         /* SMMUv3 node */
-        smmu_offset =3D iort->node_offset + node_size;
+        smmu_offset =3D iort_node_offset + node_size;
         node_size =3D sizeof(*smmu) + sizeof(*idmap);
         iort_length +=3D node_size;
         smmu =3D acpi_data_push(table_data, node_size);
@@ -450,7 +455,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
         idmap->id_count =3D cpu_to_le32(0xFFFF);
         idmap->output_base =3D 0;
         /* output IORT node is the ITS group node (the first node) */
-        idmap->output_reference =3D cpu_to_le32(iort->node_offset);
+        idmap->output_reference =3D cpu_to_le32(iort_node_offset);
     }
=20
     /* Root Complex Node */
@@ -479,9 +484,14 @@ build_iort(GArray *table_data, BIOSLinker *linker, V=
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


