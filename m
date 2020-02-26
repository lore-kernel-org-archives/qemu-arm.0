Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3539883lfg;
        Wed, 26 Feb 2020 13:00:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqwFIlqpR6KAqJtCRQGk/ST0iy4njtxf1luRIK8BCbiltP3efWn5ppwghVGtEe8b1AwP39gD
X-Received: by 2002:a37:4bd3:: with SMTP id y202mr1344869qka.32.1582750820210;
        Wed, 26 Feb 2020 13:00:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582750820; cv=none;
        d=google.com; s=arc-20160816;
        b=kJoU9xsap9xddLHDnza/KoUGi2KW7tgpwiSZXobvrIJk7n6oKqj+f0utDKEINsYBYc
         Gvb3iWG4p/KU2YQx12mPJv26nA3IGq1KD2lZkqksYAESNU0TP4WbBPNmiiHyUfSRbJTE
         CVIwp0OkcgVyCiPXlQJWRpnXPxYHSO8uJdoL0QlY17aaE7quzEMFnmNW9cFZ53fPyoEu
         LcqmiRX1dfvOoXnieibESzJBXQeVjXHHI6/BT4cFl0Ywjq5rbR8JkNxlRAg94gF3i5mS
         iwUM/yhQY+Z3OuxRd1NBWGCnCP80vqqURAUQ4jFsDFOsNSyRgbiulMTNjXAe6jwaSdhA
         fj4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ydEUTzYDeS8m3DXDxDiuUpRyMkCwaTisv5HItnAGSLg=;
        b=hpdMN+EVKvizpM5D2spMUu1NWPge7j/sAdyajOdlrhnEIVIkZH6pW2FNg/CS1KcRtB
         zq50TSTb+k1XXTm8KkMZILG/vpZvzIAaoDWR1+oqa+0oK4TYPv1zqcXczJk0mkRDRGDq
         BI7Y/9lJynmF5Uk155QpSbSTGrmhUBOsZPEyYccKEjixQz3xk0VXin7WuqFIGx7Hf5jC
         IyRppB8vTuFr91cxHMxHy9eaf+83DrZ78R42fPNoqPyezxyktroa6l73WkkVk8SrmyUC
         AHpk5BGYOnO5DrqAK7jJ7EiRTcsytKwbf95y6/XEKN8Oqbi2Zy5OgTH0q3LXxavtHPAD
         3lQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aQLgB6g8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8si338367qtq.38.2020.02.26.13.00.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 13:00:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aQLgB6g8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j73n1-0006TK-9I
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 16:00:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45607)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j73mn-0006Ny-3H
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 16:00:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j73ml-0002BB-PM
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 16:00:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52336
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j73ml-00029R-LT
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 16:00:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582750802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydEUTzYDeS8m3DXDxDiuUpRyMkCwaTisv5HItnAGSLg=;
 b=aQLgB6g8eAiXZd4s2UiLD3juxwx/DikT5Lcim9DzqamJkmlO3l+xzRZ6kya+gfB0Onlzik
 NrsHDICQADny0Smdy4ail6/K2MpvL1W1wVdJ2h2fVl6h5iejMrFNDaZhEGvDL4ADNXybzs
 C1fVT3/5VRIuZi8VmhRAhp4xCsajeP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-DWI_X6o6N-60FDyp5M2Gbw-1; Wed, 26 Feb 2020 16:00:01 -0500
X-MC-Unique: DWI_X6o6N-60FDyp5M2Gbw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10060477;
 Wed, 26 Feb 2020 21:00:00 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E4E95C545;
 Wed, 26 Feb 2020 20:59:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v4 01/10] tpm: rename TPM_TIS into TPM_TIS_ISA
Date: Wed, 26 Feb 2020 21:59:33 +0100
Message-Id: <20200226205942.11424-2-eric.auger@redhat.com>
In-Reply-To: <20200226205942.11424-1-eric.auger@redhat.com>
References: <20200226205942.11424-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yXBJi10Yxrau

As we plan to introduce a sysbus TPM_TIS, let's rename
TPM_TIS into TPM_TIS_ISA.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

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

