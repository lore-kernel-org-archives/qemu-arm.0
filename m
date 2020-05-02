Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2157063lfm;
        Sat, 2 May 2020 13:36:23 -0700 (PDT)
X-Google-Smtp-Source: APiQypIp4kjXmDqNCK9MKkSy/utESKLYdnZVqD6oCupRGtn+70thSPCSY/BVVvm38EU5hxsuT3r7
X-Received: by 2002:a05:620a:138e:: with SMTP id k14mr9634852qki.452.1588451783608;
        Sat, 02 May 2020 13:36:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588451783; cv=none;
        d=google.com; s=arc-20160816;
        b=hh7MdkoCdvhpvvaiXuV/iLSEzCnkAbVCe1TGwRGuqme9wu+hvn2501/kdcXBG6L844
         OnfcMZAR3wIod2bCZ3XE+P6zg77VgQB214P3SZ4tjBh/AYIm+Hm2PLC0nmNx53xRP0hX
         TIQhTNmVYytpedrWMeHBiYOKdRmSgX2orQ3JiThsYvrPpKsIiQnZ3uiefEAUOfQ+YcJk
         AWuCsmuLLyNvSwtYENU8fxpAT0pckcWvnoHyDujne2fTmRZyEc06YCKU9YABBcR70QGv
         zQViusXvBp9LF5uY7lbEo9IJEH0yRQ7k6FCUCBAc51cGjglgOXsaXtjBLK/dxPCsLOpR
         Vuhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=08iwP7LqFIqqeGyoG9u6SDwyyi8beRnRJa3nu+7iKrY=;
        b=1D8iqCeTXMNp3QN+BRcom3T1sHmKDEl/5ITiKSxXGHyTDfCig+CJW6sSf4Ki4ffskE
         mf8pfokED5ktG05GMgMlBb6T6AMGMfvD95EAFNsQjB2YIOzzTd1yUwT6oydGaN7FIrux
         ynAV+9nButhCYTltleTFQmw5J+KWwfj5lKVwRXHJFk9x1eTsn6PzrAk7Cg2C9yynN3qh
         PmG4HmwaPrkWmRUy2W9FSstlAyOVp4gqo7PW2QpUii3wwgzaQj/ufOKpX+1Y5eLHAljM
         Y53igdb4NmjQrhXRYTEu6Zq0NW2WHy0inRUzUfBHm6UQ+gCGGtu0mGxbgL1pHcqZosAy
         kV1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="gmb9c/gi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id o10si3925302qtf.120.2020.05.02.13.36.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 May 2020 13:36:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="gmb9c/gi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUys3-0002Sm-2K
	for alex.bennee@linaro.org; Sat, 02 May 2020 16:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jUyrn-0002Az-8w
 for qemu-arm@nongnu.org; Sat, 02 May 2020 16:36:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jUyrm-0003Uw-KE
 for qemu-arm@nongnu.org; Sat, 02 May 2020 16:36:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37772
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jUyrm-0003SB-7X
 for qemu-arm@nongnu.org; Sat, 02 May 2020 16:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588451765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=08iwP7LqFIqqeGyoG9u6SDwyyi8beRnRJa3nu+7iKrY=;
 b=gmb9c/giN9cEHsbUT3wizG9NIlrUAqXjCIy/VL3Vu/dW7c0g84BgVF34GgjWmTv/BAF5O/
 e1/98r7c+Jo5m+p3zrW/d7jHQvFOG9uX1l9+ifIvCJ/TBnmcELuo3Brz2se9TSedYEVoM/
 8VliWyEjZ61Is83v5RX2KXndjK4WKgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-8UIoZFC9PayXxV2_-_UUZQ-1; Sat, 02 May 2020 16:36:03 -0400
X-MC-Unique: 8UIoZFC9PayXxV2_-_UUZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0897C80183C;
 Sat,  2 May 2020 20:36:02 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-58.ams2.redhat.com [10.36.112.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B5D810002AA;
 Sat,  2 May 2020 20:35:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 imammedo@redhat.com, shannon.zhaosl@gmail.com, mst@redhat.com
Subject: [PATCH 1/2] arm/acpi: TPM2 ACPI table support
Date: Sat,  2 May 2020 22:35:35 +0200
Message-Id: <20200502203536.15011-2-eric.auger@redhat.com>
In-Reply-To: <20200502203536.15011-1-eric.auger@redhat.com>
References: <20200502203536.15011-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/02 16:36:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: vk81Dnas+5iN

Add a TPM2 ACPI table if a TPM2.0 sysbus device has been
dynamically instantiated.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/sysemu/tpm.h     |  2 ++
 hw/arm/virt-acpi-build.c | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
index f37851b1aa..03fb25941c 100644
--- a/include/sysemu/tpm.h
+++ b/include/sysemu/tpm.h
@@ -50,6 +50,8 @@ typedef struct TPMIfClass {
=20
 #define TPM_IS_TIS_ISA(chr)                         \
     object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_ISA)
+#define TPM_IS_TIS_SYSBUS(chr)                      \
+    object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_SYSBUS)
 #define TPM_IS_CRB(chr)                             \
     object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
 #define TPM_IS_SPAPR(chr)                           \
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 81d41a3990..cc5863eaf2 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -41,11 +41,13 @@
 #include "hw/acpi/pci.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/generic_event_device.h"
+#include "hw/acpi/tpm.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/arm/virt.h"
 #include "sysemu/numa.h"
 #include "sysemu/reset.h"
+#include "sysemu/tpm.h"
 #include "kvm_arm.h"
 #include "migration/vmstate.h"
=20
@@ -704,6 +706,35 @@ static void build_fadt_rev5(GArray *table_data, BIOSLi=
nker *linker,
     build_fadt(table_data, linker, &fadt, NULL, NULL);
 }
=20
+static void
+build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
+{
+    Acpi20TPM2 *tpm2_ptr =3D acpi_data_push(table_data, sizeof *tpm2_ptr);
+    unsigned log_addr_size =3D sizeof(tpm2_ptr->log_area_start_address);
+    unsigned log_addr_offset =3D
+        (char *)&tpm2_ptr->log_area_start_address - table_data->data;
+
+    tpm2_ptr->platform_class =3D cpu_to_le16(TPM2_ACPI_CLASS_CLIENT);
+    if (TPM_IS_TIS_SYSBUS(tpm_find())) {
+        tpm2_ptr->control_area_address =3D cpu_to_le64(0);
+        tpm2_ptr->start_method =3D cpu_to_le32(TPM2_START_METHOD_MMIO);
+    } else {
+        g_warn_if_reached();
+    }
+
+    tpm2_ptr->log_area_minimum_length =3D cpu_to_le32(TPM_LOG_AREA_MINIMUM=
_SIZE);
+    acpi_data_push(tcpalog, le32_to_cpu(tpm2_ptr->log_area_minimum_length)=
);
+
+    /* log area start address to be filled by Guest linker */
+    bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE,
+                             tcpalog, 1, false);
+    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
+                                   log_addr_offset, log_addr_size,
+                                   ACPI_BUILD_TPMLOG_FILE, 0);
+    build_header(linker, table_data,
+                 (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL, NUL=
L);
+}
+
 /* DSDT */
 static void
 build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
@@ -831,6 +862,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildT=
ables *tables)
         build_iort(tables_blob, tables->linker, vms);
     }
=20
+    if (tpm_get_version(tpm_find()) =3D=3D TPM_VERSION_2_0) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_tpm2(tables_blob, tables->linker, tables->tcpalog);
+    }
+
     /* XSDT is pointed to by RSDP */
     xsdt =3D tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
--=20
2.20.1

