Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp507085lfc;
        Fri, 12 Jun 2020 07:55:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWSsGi3rZdmknWKiFtuB6Ed2tde4Zksy0ni7zCjxb21jiQUKXHbChbVVnJtUk5oVXhupJ6
X-Received: by 2002:a25:a408:: with SMTP id f8mr20338105ybi.145.1591973736279;
        Fri, 12 Jun 2020 07:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591973736; cv=none;
        d=google.com; s=arc-20160816;
        b=vzYiGFjOVPR2ucqRer+E+OfEfVqSyZDx9gbx+QxLK5HfR/v3dzuxZBeL29DQwWP4h7
         fXhrnTs/clGsj0pBRc2jjT2OGvC3O335PeAzRrXQwJGsibogJ0aGXatgh21sEJTpvW4d
         3O0dwfzXW0CkwnRot1+UVFHOGlIXStZIvM2rdUxoZbmzHdXQWLbzNnlDOybd9L9x82vy
         EamVnV0uQODxfUeaGxKLZH/xSXihkGPy7ybmyqq+bqqOuWbF+QqwB9Y17nIAHzR2pHmw
         uBn9fE6kjBAvyLHnoR+Szc2iBzNFcYWmxrs2AOVZ03KDlFzCRfydZHgv0P84tdMyd3MK
         nRyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=zGOoHYc7BnEUE5/Tw0vbz2Gw05a97G6XRUJWvEWyGjA=;
        b=BEMFN2d+kAhKPv4RkLWEt4U8fioLviHLlkaecoOq64kcVl6rzdFEWpv7vOBRKpSKBL
         JXuSMHcle5DjT2S1Kz8gO/SdRkS55P4eoWNjts8rAutanVmCMrunB+bE6IJDAzifiCjc
         bZb7QKtOPyV8PotSlySQxk/HHnHhdPERz+Kr8xY91ArRg/nYKfJYWu1DRlOFaRIecDCR
         OdA9+unGRT+4qzsA59bfbrzBp5hybpPAq68G6b1DkExpxNp3rSQUA71RTg4bUPU1cbBB
         gpWM5AO5J0gFtqSGzsmba+nHdU/yXP5BwD0VdHEgCnzwXpQ5IRIbYNnuTTP/5JMBtNH3
         kigg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SEECtxpe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b204si5290597ybg.181.2020.06.12.07.55.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jun 2020 07:55:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SEECtxpe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjl5j-0005Ci-Fa
	for alex.bennee@linaro.org; Fri, 12 Jun 2020 10:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjl22-0006FJ-FV
 for qemu-arm@nongnu.org; Fri, 12 Jun 2020 10:51:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27526
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjl20-0001Pl-W7
 for qemu-arm@nongnu.org; Fri, 12 Jun 2020 10:51:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591973504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zGOoHYc7BnEUE5/Tw0vbz2Gw05a97G6XRUJWvEWyGjA=;
 b=SEECtxpeXkCFqmslM2ls3wTCJ8ocpJ/rjbxg9M0KOQdhTHERbUcekFQ5Hcez/A7x4tpCVZ
 5Notsa7YpfZHX9Rf211RX8I8AN5wMfK8W9kwU3wCotTUJKMoZhyUJJ3LQuYwyuzx28k2L5
 CLlw36ihHxSsOGGIzB5Vd/eIKhm9A2U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-XpofyySpNqSypyOyiDVLVQ-1; Fri, 12 Jun 2020 10:51:40 -0400
X-MC-Unique: XpofyySpNqSypyOyiDVLVQ-1
Received: by mail-wr1-f71.google.com with SMTP id c14so3961726wrw.11
 for <qemu-arm@nongnu.org>; Fri, 12 Jun 2020 07:51:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zGOoHYc7BnEUE5/Tw0vbz2Gw05a97G6XRUJWvEWyGjA=;
 b=XLv6jFcJDHNzMMzOJAy8bYYm17748mp30kZgdzCvciyB1gYFKnRXD5wN4yBTxbVZap
 kH4rIcfmNRT5vJ4inL7obscdLREYjvdLfLTuIoLsf3DdEmOTk4etCXPOzxxKYuMv3tph
 yV9QnEyx293S97WcmcR2gqBe84RnnKdr6MLrK0PqD907eTAAhjfjE9BGhQL888Bx71Hy
 47G5BejyXlrPnmmT5PABIk5LVx4qFdhyHdj4urJ6c4sAC8YUzhBIXx9L7kRo056yt+6z
 l5lAPFG/ZjekEgrvWfe7s3Np3w4qLDgACQ+P8u82+y9fSp1vT9axd/8ED0DdsUx4MYcu
 HZSQ==
X-Gm-Message-State: AOAM531ONH9A7x27i4B7EU3bT8ScqJKJ1QKJC9n7ZePPKiSCFCZVdNg0
 1zgS7u8oo7tVC3+wrKGvlJ5hbw7kfCB+2wNLcFueXyXQhWoB8KNS8Y1G88pqJsq1LA1MBVsH2+E
 QXwTMQ66PlK7o
X-Received: by 2002:a1c:7903:: with SMTP id l3mr13483921wme.50.1591973499327; 
 Fri, 12 Jun 2020 07:51:39 -0700 (PDT)
X-Received: by 2002:a1c:7903:: with SMTP id l3mr13483903wme.50.1591973499160; 
 Fri, 12 Jun 2020 07:51:39 -0700 (PDT)
Received: from redhat.com (bzq-79-178-18-124.red.bezeqint.net. [79.178.18.124])
 by smtp.gmail.com with ESMTPSA id y37sm11339873wrd.55.2020.06.12.07.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 07:51:38 -0700 (PDT)
Date: Fri, 12 Jun 2020 10:51:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 16/58] arm/acpi: TPM2 ACPI table support
Message-ID: <20200612141917.9446-17-mst@redhat.com>
References: <20200612141917.9446-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200612141917.9446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/12 08:07:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wROpTbvrNPa2

From: Eric Auger <eric.auger@redhat.com>

Add a TPM2 ACPI table if a TPM2.0 sysbus device has been
dynamically instantiated.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

Message-Id: <20200601095737.32671-4-eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/sysemu/tpm.h     | 2 ++
 hw/acpi/aml-build.c      | 5 +++--
 hw/arm/virt-acpi-build.c | 7 +++++++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
index f37851b1aa..03fb25941c 100644
--- a/include/sysemu/tpm.h
+++ b/include/sysemu/tpm.h
@@ -50,6 +50,8 @@ typedef struct TPMIfClass {
 
 #define TPM_IS_TIS_ISA(chr)                         \
     object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_ISA)
+#define TPM_IS_TIS_SYSBUS(chr)                      \
+    object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_SYSBUS)
 #define TPM_IS_CRB(chr)                             \
     object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
 #define TPM_IS_SPAPR(chr)                           \
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index b37052c1b4..d24e9e6c3a 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1885,17 +1885,18 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
     unsigned log_addr_offset =
         (char *)&tpm2_ptr->log_area_start_address - table_data->data;
     uint8_t start_method_params[12] = {};
+    TPMIf *tpmif = tpm_find();
 
     /* platform class */
     build_append_int_noprefix(table_data, TPM2_ACPI_CLASS_CLIENT, 2);
     /* reserved */
     build_append_int_noprefix(table_data, 0, 2);
-    if (TPM_IS_TIS_ISA(tpm_find())) {
+    if (TPM_IS_TIS_ISA(tpmif) || TPM_IS_TIS_SYSBUS(tpmif)) {
         /* address of control area */
         build_append_int_noprefix(table_data, 0, 8);
         /* start method */
         build_append_int_noprefix(table_data, TPM2_START_METHOD_MMIO, 4);
-    } else if (TPM_IS_CRB(tpm_find())) {
+    } else if (TPM_IS_CRB(tpmif)) {
         build_append_int_noprefix(table_data, TPM_CRB_ADDR_CTRL, 8);
         build_append_int_noprefix(table_data, TPM2_START_METHOD_CRB, 4);
     } else {
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 2cbccd5fe2..ca31f70f7f 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -41,12 +41,14 @@
 #include "hw/acpi/pci.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/generic_event_device.h"
+#include "hw/acpi/tpm.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/arm/virt.h"
 #include "hw/mem/nvdimm.h"
 #include "sysemu/numa.h"
 #include "sysemu/reset.h"
+#include "sysemu/tpm.h"
 #include "kvm_arm.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
@@ -848,6 +850,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
         build_iort(tables_blob, tables->linker, vms);
     }
 
+    if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_tpm2(tables_blob, tables->linker, tables->tcpalog);
+    }
+
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
-- 
MST

