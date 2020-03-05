Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp3136944lfi;
        Thu, 5 Mar 2020 08:54:48 -0800 (PST)
X-Google-Smtp-Source: ADFU+vufFJjXtvuz+OcxCIpc6En4VFQz2uNDR3jJDlazynPBhIw+ZS9HOgXTXiVPJVXOIvJhvkxS
X-Received: by 2002:ac8:7090:: with SMTP id y16mr7865971qto.356.1583427288236;
        Thu, 05 Mar 2020 08:54:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583427288; cv=none;
        d=google.com; s=arc-20160816;
        b=ZE9f3RmDXc+CXxyBiS6mxlQ3+KTaoXUAhLn+5AIDbAZE/VfAcW6hwLaUgqF7YNzOYb
         Oh7fsYJbFTihQIToylaZPCOEZ0y7pCXITT363ZF8fe1Ypj33m9iA6P0bhI2PPiyjrJ1b
         aGUIb1KSoI/TfP9GGS4eQxLg7/+x4X5jzwZhjOsxKrUM9ed1KRa/d40CJGlqX3pUEe1M
         9Sn5ZwGTe/R7fKueGdbiXklyqREVwM1z81RFNpNvJEwT2n4OVXHqOc4lttoNxie9ctkI
         Ez34QQdVbCNJ91l4C8mVVe8lbKdouoOXBAkMJiUbTdC3bjaM2egdML5XMBO+N6KMo9qD
         JFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FySGZfQV/wsAWKAtuutnrS0B7ZEIUrsZinpcqe3yPmQ=;
        b=apXIs98VH1SpBZBimlfclN0elKLZkCDTjJwwM9G4A9RA4Mvd2VqqL12PrDz1tfUXvi
         hcRi7IWV48PLYTHBmtklD7LD9CN4IyTjHjcJM8TKbThmHYgTk7zAsmQj+XrdqNfSUV7s
         Qtd7dn53VbnyJ+BmFowNyETzKAvGmIct/bTi0urvEbOyjelS1WBnyHtgeqj9DdrDhfZc
         LZFnvq/32eMvpJ52kAr7rgkUTyuS53DJPS8Blb4PhfFL0Sl/+O8YdNc3V/DpJGYkFY5L
         X80bEd6z8pKSqp6ifhSesMRbldg1rKB8PwbhUoLAHqayr42FGX+8gcAE5Ug87KAVDSkt
         xgGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QqFlS+HO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c21si3137225qkj.67.2020.03.05.08.54.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 08:54:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QqFlS+HO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9tln-0000zB-Kx
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 11:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34504)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j9tjL-0004l2-2E
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 11:52:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j9tjJ-00078F-Si
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 11:52:14 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42290)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j9tjJ-00077x-OS
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 11:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583427133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FySGZfQV/wsAWKAtuutnrS0B7ZEIUrsZinpcqe3yPmQ=;
 b=QqFlS+HO19rTrN5lEzHzr0LF9/xoG/A4H9AtlxDgm/ZcbboLa7vkWivsWuttLhDBVIuOlG
 E+MWjJqpysjDwCPaSXZ6BXO3mLlJQZQP8KCisoYuYCjPCtJKurHEQzGOUe1areLCQMGHbE
 kyin5FPyxZa0h6ozgltjmKWVD3YbsPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-KIIj6nSaMWaBPTE2arv3Dw-1; Thu, 05 Mar 2020 11:52:12 -0500
X-MC-Unique: KIIj6nSaMWaBPTE2arv3Dw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8FEB18C35A4;
 Thu,  5 Mar 2020 16:52:10 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A20139A;
 Thu,  5 Mar 2020 16:52:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v5 01/10] tpm: rename TPM_TIS into TPM_TIS_ISA
Date: Thu,  5 Mar 2020 17:51:40 +0100
Message-Id: <20200305165149.618-2-eric.auger@redhat.com>
In-Reply-To: <20200305165149.618-1-eric.auger@redhat.com>
References: <20200305165149.618-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-TUID: +x39r6zheLcV

As we plan to introduce a sysbus TPM_TIS, let's rename
TPM_TIS into TPM_TIS_ISA.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 include/sysemu/tpm.h | 6 +++---
 hw/i386/acpi-build.c | 6 +++---
 hw/tpm/tpm_tis.c     | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

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
--=20
2.20.1

