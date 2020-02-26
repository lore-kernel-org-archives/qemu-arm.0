Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2880376lfg;
        Wed, 26 Feb 2020 02:26:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqy5SRyG0GQ+o4lOpH1lAEQ6hllEsE7Sh4DWVq5fw2DApUZ9ybjyBzCjuJGnTYS+hkUQBkzr
X-Received: by 2002:aed:3786:: with SMTP id j6mr4610309qtb.62.1582712787720;
        Wed, 26 Feb 2020 02:26:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582712787; cv=none;
        d=google.com; s=arc-20160816;
        b=eiSRae/eKZAbvlShy2GWtvHULfYoShtl09EV1qM1wXzqRmFztPLaszIXH9V/qdq/BS
         JkGQa4vQuc/3uYujnGSspUXfGKA7VFWsOc4dJnVUa50/bLOf15jCQaNv0mx8hf4b/2HK
         zkE++wF4lKLrbWh9tLW4sArljLjMO+fLA2+vZf1uQjAbr6TQAgbYT9BHmZIuma7RgFQx
         TvkiwKe//5Js26LO7H+B4xagnizIVLcV9zwUCYAcVO3flQDsABiR6dmjKwI+ULevmn82
         4oQ5HRvocWIHLpC4URyLywyl4M3/GZsrChyzqXbHDO6LTTTNvMle6poPGKz4VUW5HUVX
         uxNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dczexdrzKnZ7PKgnzotlQQq1ZEpy0uEpqYyknsl6HD4=;
        b=UPArcJi7yOwW1gghO4gYVP+MBXTLAourn3bklmbRIhsLVBNuFp/JOHxpgiV2kzykkR
         TOG9byFtDyZMzYHNjRTf80URxdo5jOW7QJdgP9eH6zPjrMGz4YRwOx1w3GwNI5ebp/c3
         z/1zIacA6vDebkhFsLz0ppYnHSOtS3lq4hgw5ABRhiyAJ5eXmsMIaJPGSQlIvD+B/Yzx
         eiyNguJ3CwJxjrVT+AWqaTDdNAFO7Lm7kXn9WdtYFtRyGZ0IclLQXzokgq51X9+6BVKg
         rVWnmwMZoFbqthYRjz8M2O0oohMNDVRJ8ciNA91WNa07kBx5ngBff2pXLzoMw2TfENSa
         PfBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KSfNHdpI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1si869804qtn.31.2020.02.26.02.26.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 02:26:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KSfNHdpI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6ttb-0004MA-3O
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 05:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51954)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j6ttM-00046p-DY
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 05:26:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j6ttL-0003Jz-BE
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 05:26:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42764
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j6ttL-0003Jm-7O
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 05:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582712770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dczexdrzKnZ7PKgnzotlQQq1ZEpy0uEpqYyknsl6HD4=;
 b=KSfNHdpIKCpvLr+DeJ1mrGPmEF30LstThsmqaH0ntOVUxOZ+WqoR7BCtAORkCeW+mRL9tG
 9XYUmmlnRnQ5p2X7prqlOJUocDM7+V+ULIUUfwy/ScvQelA18ODJLTTdzegOe7+gLLLUhO
 iiP0oHiljhy0iEWygab3Jh32lLJpzt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-heVrupBnO3iOb6I5zH8k1A-1; Wed, 26 Feb 2020 05:26:09 -0500
X-MC-Unique: heVrupBnO3iOb6I5zH8k1A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 223FB1882CCC;
 Wed, 26 Feb 2020 10:26:08 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5ECE60BE1;
 Wed, 26 Feb 2020 10:26:05 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v3 01/10] tpm: rename TPM_TIS into TPM_TIS_ISA
Date: Wed, 26 Feb 2020 11:25:40 +0100
Message-Id: <20200226102549.12158-2-eric.auger@redhat.com>
In-Reply-To: <20200226102549.12158-1-eric.auger@redhat.com>
References: <20200226102549.12158-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HK2hAI8FcOEg

As we plan to introduce a sysbus TPM_TIS, let's rename
TPM_TIS into TPM_TIS_ISA.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

---

RFC v2 -> PATCH:
- added Philippe and Stefan's R-b
---
 hw/i386/acpi-build.c | 6 +++---
 hw/tpm/tpm_tis.c     | 4 ++--
 include/sysemu/tpm.h | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 9c4e46fa74..26777f8828 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2026,7 +2026,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         }
     }
=20
-    if (TPM_IS_TIS(tpm_find())) {
+    if (TPM_IS_TIS_ISA(tpm_find())) {
         aml_append(crs, aml_memory32_fixed(TPM_TIS_ADDR_BASE,
                    TPM_TIS_ADDR_SIZE, AML_READ_WRITE));
     }
@@ -2197,7 +2197,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             /* Scan all PCI buses. Generate tables to support hotplug. */
             build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_en);
=20
-            if (TPM_IS_TIS(tpm)) {
+            if (TPM_IS_TIS_ISA(tpm)) {
                 if (misc->tpm_version =3D=3D TPM_VERSION_2_0) {
                     dev =3D aml_device("TPM");
                     aml_append(dev, aml_name_decl("_HID",
@@ -2304,7 +2304,7 @@ build_tpm2(GArray *table_data, BIOSLinker *linker, GA=
rray *tcpalog)
         (char *)&tpm2_ptr->log_area_start_address - table_data->data;
=20
     tpm2_ptr->platform_class =3D cpu_to_le16(TPM2_ACPI_CLASS_CLIENT);
-    if (TPM_IS_TIS(tpm_find())) {
+    if (TPM_IS_TIS_ISA(tpm_find())) {
         tpm2_ptr->control_area_address =3D cpu_to_le64(0);
         tpm2_ptr->start_method =3D cpu_to_le32(TPM2_START_METHOD_MMIO);
     } else if (TPM_IS_CRB(tpm_find())) {
diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
index 31facb896d..c609737272 100644
--- a/hw/tpm/tpm_tis.c
+++ b/hw/tpm/tpm_tis.c
@@ -91,7 +91,7 @@ typedef struct TPMState {
     TPMPPI ppi;
 } TPMState;
=20
-#define TPM(obj) OBJECT_CHECK(TPMState, (obj), TYPE_TPM_TIS)
+#define TPM(obj) OBJECT_CHECK(TPMState, (obj), TYPE_TPM_TIS_ISA)
=20
 #define DEBUG_TIS 0
=20
@@ -1008,7 +1008,7 @@ static void tpm_tis_class_init(ObjectClass *klass, vo=
id *data)
 }
=20
 static const TypeInfo tpm_tis_info =3D {
-    .name =3D TYPE_TPM_TIS,
+    .name =3D TYPE_TPM_TIS_ISA,
     .parent =3D TYPE_ISA_DEVICE,
     .instance_size =3D sizeof(TPMState),
     .instance_init =3D tpm_tis_initfn,
diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
index 15979a3647..1691b92c28 100644
--- a/include/sysemu/tpm.h
+++ b/include/sysemu/tpm.h
@@ -43,12 +43,12 @@ typedef struct TPMIfClass {
     enum TPMVersion (*get_version)(TPMIf *obj);
 } TPMIfClass;
=20
-#define TYPE_TPM_TIS                "tpm-tis"
+#define TYPE_TPM_TIS_ISA            "tpm-tis"
 #define TYPE_TPM_CRB                "tpm-crb"
 #define TYPE_TPM_SPAPR              "tpm-spapr"
=20
-#define TPM_IS_TIS(chr)                             \
-    object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS)
+#define TPM_IS_TIS_ISA(chr)                         \
+    object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_ISA)
 #define TPM_IS_CRB(chr)                             \
     object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
 #define TPM_IS_SPAPR(chr)                           \
--=20
2.20.1

