Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp138901lfb;
        Tue, 5 May 2020 07:44:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypKal0Y41kbXeaZ/rdO4YvPxg1Fm0bTcRgf+NDlVlhqKWQRo6SlfBbAE3KeE4dcqd/2cSkWe
X-Received: by 2002:a0c:8262:: with SMTP id h89mr2939140qva.173.1588689892517;
        Tue, 05 May 2020 07:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588689892; cv=none;
        d=google.com; s=arc-20160816;
        b=ZZqjO/wojwlxFBv5pVU+WS2eIckjr4qUs1jJS9Bmgo7VhHoQ4up6oiUNcsSBL0ysQB
         gIIigDVAkzDdaHAFkY+9Cr0mR6105rDv1zAnHVUTxvY/+Vmhaau8cMpxc0QBm7dF9t9A
         nst+q+rE0Vc7sEQHV6Fnzrb3YHh+Bl1+scWGKSuqs9OkpFhZgmTyTUfUkEUMH8efH1gS
         OdToBPbW7a8VpTehYbwEKI9APTyVXm1EP7w3seat1pCszN5YI068MOQfzW/80b380YsC
         jB8e6q8vVZOHRLi19OPbKd2zm4jRMab8M3L4/TnZ1Sca2ARJpzu0qLfGPlrHkOUy4IqT
         nVjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ru0ck5Z3LkTeKedMNPkCV9j9cijHHs4CW0s7fvSqEe4=;
        b=jyhxit39+pxgawkUzU3X2aVa1unYmAM/nzN3sqOEDExPQLvOGLIsSi4eJ5On4kPspk
         42NVvRv9HJdIdywnb7gcluFf18K97z/9MihF9GYMtYRT2ZOvEsq4pyJk4zZhf5zWWo05
         6ldjq98yfHBZ6tCeSC/G/1Z/vdqw/vOdOBWJfnkSQimxuFYMbaQSJm1OEWEmD7pM2wcb
         obi0nAHKt+5pDyzIDeLTf72fYtkvwgDIKdI81e6cQVV8BoPMhy6sBeL1MaL6d6MmfpeR
         eOeLFTwGj8z4nEU6QLbPIOTBrmggHJh4qHP2nF3A7ji/ZRPsRgnv5zdoAk3ckqIZZclD
         cBfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NoBLV9fA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id m20si1093541qtn.248.2020.05.05.07.44.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 May 2020 07:44:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NoBLV9fA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVyoV-0005MV-QE
	for alex.bennee@linaro.org; Tue, 05 May 2020 10:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jVyoM-0005K8-9X
 for qemu-arm@nongnu.org; Tue, 05 May 2020 10:44:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42488
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jVyoK-0004Xz-2T
 for qemu-arm@nongnu.org; Tue, 05 May 2020 10:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588689879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ru0ck5Z3LkTeKedMNPkCV9j9cijHHs4CW0s7fvSqEe4=;
 b=NoBLV9fAvae8XjUvVMe3AonP0Fic2sQOfo5GwbhXoawg3kQEzAMoAqaNHmI2y1SUu4g8ZU
 brTKGNP845dlY+fR3w1IdUMXTywybmajSklrqIto/KkclnfWL8D5nAYNwPd0ox+uufu5x+
 R1g50iO30Y5zG1cBfL9eYTLq+vMCAmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-YAaJlirPPhG1H8W_iyXS6w-1; Tue, 05 May 2020 10:44:37 -0400
X-MC-Unique: YAaJlirPPhG1H8W_iyXS6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 486FD1902EA0;
 Tue,  5 May 2020 14:44:36 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3005A70532;
 Tue,  5 May 2020 14:44:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 imammedo@redhat.com, shannon.zhaosl@gmail.com, mst@redhat.com
Subject: [PATCH v2 1/3] acpi: Move build_tpm2() in the generic part
Date: Tue,  5 May 2020 16:44:17 +0200
Message-Id: <20200505144419.29174-2-eric.auger@redhat.com>
In-Reply-To: <20200505144419.29174-1-eric.auger@redhat.com>
References: <20200505144419.29174-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 03:48:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, gshan@redhat.com,
 lersek@redhat.com, ardb@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sf1IHKpVqho8

We plan to build the tpm2 table on ARM too. In order to reuse the
generation code, let's move build_tpm2() to aml-build.c.

No change in the implementation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/acpi/aml-build.h |  2 ++
 hw/acpi/aml-build.c         | 30 ++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c        | 30 ------------------------------
 3 files changed, 32 insertions(+), 30 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 0f4ed53d7f..a67ab4618a 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -437,4 +437,6 @@ void build_slit(GArray *table_data, BIOSLinker *linker,=
 MachineState *ms);
=20
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id);
+
+void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog);
 #endif
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 2c3702b882..1f7fd09112 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -26,6 +26,7 @@
 #include "qemu/bitops.h"
 #include "sysemu/numa.h"
 #include "hw/boards.h"
+#include "hw/acpi/tpm.h"
=20
 static GArray *build_alloc_array(void)
 {
@@ -1875,6 +1876,35 @@ build_hdr:
                  "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_=
id);
 }
=20
+void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
+{
+    Acpi20TPM2 *tpm2_ptr =3D acpi_data_push(table_data, sizeof *tpm2_ptr);
+    unsigned log_addr_size =3D sizeof(tpm2_ptr->log_area_start_address);
+    unsigned log_addr_offset =3D
+        (char *)&tpm2_ptr->log_area_start_address - table_data->data;
+
+    tpm2_ptr->platform_class =3D cpu_to_le16(TPM2_ACPI_CLASS_CLIENT);
+    if (TPM_IS_TIS_ISA(tpm_find())) {
+        tpm2_ptr->control_area_address =3D cpu_to_le64(0);
+        tpm2_ptr->start_method =3D cpu_to_le32(TPM2_START_METHOD_MMIO);
+    } else if (TPM_IS_CRB(tpm_find())) {
+        tpm2_ptr->control_area_address =3D cpu_to_le64(TPM_CRB_ADDR_CTRL);
+        tpm2_ptr->start_method =3D cpu_to_le32(TPM2_START_METHOD_CRB);
+    } else {
+        g_warn_if_reached();
+    }
+
+    tpm2_ptr->log_area_minimum_length =3D
+        cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
+
+    /* log area start address to be filled by Guest linker */
+    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
+                                   log_addr_offset, log_addr_size,
+                                   ACPI_BUILD_TPMLOG_FILE, 0);
+    build_header(linker, table_data,
+                 (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL, NUL=
L);
+}
+
 /* ACPI 5.0: 6.4.3.8.2 Serial Bus Connection Descriptors */
 static Aml *aml_serial_bus_device(uint8_t serial_bus_type, uint8_t flags,
                                   uint16_t type_flags,
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 23c77eeb95..c7c560e269 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2296,36 +2296,6 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linke=
r, GArray *tcpalog)
                  (void *)tcpa, "TCPA", sizeof(*tcpa), 2, NULL, NULL);
 }
=20
-static void
-build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
-{
-    Acpi20TPM2 *tpm2_ptr =3D acpi_data_push(table_data, sizeof *tpm2_ptr);
-    unsigned log_addr_size =3D sizeof(tpm2_ptr->log_area_start_address);
-    unsigned log_addr_offset =3D
-        (char *)&tpm2_ptr->log_area_start_address - table_data->data;
-
-    tpm2_ptr->platform_class =3D cpu_to_le16(TPM2_ACPI_CLASS_CLIENT);
-    if (TPM_IS_TIS_ISA(tpm_find())) {
-        tpm2_ptr->control_area_address =3D cpu_to_le64(0);
-        tpm2_ptr->start_method =3D cpu_to_le32(TPM2_START_METHOD_MMIO);
-    } else if (TPM_IS_CRB(tpm_find())) {
-        tpm2_ptr->control_area_address =3D cpu_to_le64(TPM_CRB_ADDR_CTRL);
-        tpm2_ptr->start_method =3D cpu_to_le32(TPM2_START_METHOD_CRB);
-    } else {
-        g_warn_if_reached();
-    }
-
-    tpm2_ptr->log_area_minimum_length =3D
-        cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
-
-    /* log area start address to be filled by Guest linker */
-    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
-                                   log_addr_offset, log_addr_size,
-                                   ACPI_BUILD_TPMLOG_FILE, 0);
-    build_header(linker, table_data,
-                 (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL, NUL=
L);
-}
-
 #define HOLE_640K_START  (640 * KiB)
 #define HOLE_640K_END   (1 * MiB)
=20
--=20
2.20.1

