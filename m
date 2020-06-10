Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp163331lfc;
        Tue, 9 Jun 2020 21:34:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlX+gE+wcjdSyNlrCMc0XP1CDLVbP9FNbp6uj5ssOy8eDrWQxO12kpHDz4YhG78TBBQauH
X-Received: by 2002:a25:b8c:: with SMTP id 134mr2585874ybl.428.1591763683409;
        Tue, 09 Jun 2020 21:34:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591763683; cv=none;
        d=google.com; s=arc-20160816;
        b=JyE1v1baFpayVTcKHLKz9tihRdWRXIdff+XBOSKjoPHD9tEZfuvVAWT3jWmTVTkhtB
         tOB6H58uUx3ayIxNfwdZqq7U+lDa0Us351Lf1jes4dX3dIWGtFRqB0G/z+Sef7eWglSB
         fE6ySESqkRfB4GtJ69MDMFB51f8r2tITvSA1jNpVSAUtYbJmCNRDagRpDup4bwLwqpQX
         DzAdrNvCYhItZ9RQAMz5ODO15XlCuSPsSqhTzdRV72Y3/BRGRGrp2udxkjbz/JGhLAQi
         g8EoSAC/hJIfV5El3cnC3Mwy8z8ey73otN9MC6vI/6Z9CR5sw44yuKyAFjs5F5qRKQte
         GJgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=zGOoHYc7BnEUE5/Tw0vbz2Gw05a97G6XRUJWvEWyGjA=;
        b=y83FPTnKoFoEdhtwR5eSeXdyGzCqjE5GUVh5ylTBIRMWfMDV7kG2nRMuqI1h6qNIMq
         lkA6wF8Fi9dGf3qhl5HXJP3ttiE2GPEogXd3oVmAuup8tlRsw3EAivxGCASq6QHAhz6g
         kgPz/K51Wlp6Xx1/xN9FRBGp+jEl5J15EWK2EYXs42nBVF8/qTyBBJA467bHJ+Oq3V7S
         Wts46hHr08m/wod/hDL2pjtIsbt+r1YTW7NjI3Q5b/dNnqMuwe0s2+LmhQF+e61qeB5C
         WU25reXWPURz/I9X1UmOQfHmaxEUDPqV+fI3y/YbbVU/kV2PxcMf9dzxzepl5KTLvTgF
         4XrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hGNEygwB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si3535814yba.308.2020.06.09.21.34.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 21:34:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hGNEygwB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jisRm-0008PI-Hn
	for alex.bennee@linaro.org; Wed, 10 Jun 2020 00:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jisKZ-0007Ye-P7
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 00:27:15 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26994
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jisKY-0008FH-UP
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 00:27:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591763234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zGOoHYc7BnEUE5/Tw0vbz2Gw05a97G6XRUJWvEWyGjA=;
 b=hGNEygwBh9TGqXjaCTERgxIjxmuE+4IdQ/KUIu8aE6OPwI8B9sO5Wn/JDMLXlJHVx85mwx
 QR4jtojJla3aG1Vixl1ZHW7+urtbcwjdf6ThL8NrVlKX7okgyryxcsB54Zlh1WorEQVls5
 h3m500jBDZnZbHZxnkkZG9aI/TN2DlY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-r11W93iOPeG9g4HOQZNZFw-1; Wed, 10 Jun 2020 00:27:12 -0400
X-MC-Unique: r11W93iOPeG9g4HOQZNZFw-1
Received: by mail-wm1-f70.google.com with SMTP id p24so89198wmc.1
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 21:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zGOoHYc7BnEUE5/Tw0vbz2Gw05a97G6XRUJWvEWyGjA=;
 b=aeZ5n9BuevV8Jze2dNIY54UrMEWkgE5Ji+FU2CvLgFpMry+hUBlQggRRUr9vy/Q4AB
 vQI1lgpGHM2Hs3wUPUpqPi9xvtUu5WLNtYvOjWVMcyiNvX9YSeXGqchUg2fnb2ta1LOL
 Ut66/4hCHNWfwCz9A4cVlson6uWhy5Dr/F/Ju6XBwyP73ub/uLLtwKriIX7y+GRPh6OL
 fcBifkPwUrfyctlpIP0dknuGQIMHP3eoZNHt2pj8t73S+zNRd5ykPRfgDzTdCBxSb27l
 jy0Rv1BPEzlVilQ3nYZqMcZjnbtyuRd1QWmHcsfy0rwCaBSylS5xOdM+u3XW+LR9TLfo
 uDFw==
X-Gm-Message-State: AOAM531d4rl9rF8dv6oy5zfw7lvFOeYh6dOyHCfn87HDnE9UYj9HNHbR
 IX5mdOPQ2DrDEoA9Xm1ripBmjIVt7pfi3/9yw45cG0az1pzzo4j+sIuMNUPlFjvzdmTpzYAXJrS
 1QVoFVTQSYAICrP0=
X-Received: by 2002:adf:ef47:: with SMTP id c7mr1398086wrp.57.1591763230823;
 Tue, 09 Jun 2020 21:27:10 -0700 (PDT)
X-Received: by 2002:adf:ef47:: with SMTP id c7mr1398072wrp.57.1591763230611;
 Tue, 09 Jun 2020 21:27:10 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id 50sm6432827wra.1.2020.06.09.21.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 21:27:10 -0700 (PDT)
Date: Wed, 10 Jun 2020 00:27:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/56] arm/acpi: TPM2 ACPI table support
Message-ID: <20200610042613.1459309-17-mst@redhat.com>
References: <20200610042613.1459309-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200610042613.1459309-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 23:51:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1qK7CjQL3K9Y

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

