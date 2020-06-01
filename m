Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2947883lfc;
        Mon, 1 Jun 2020 02:59:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjmRuTFKR7dK6g904efwR0gdCtCM7XdPnM34rJx5SRHjl+2DfRyDbB41E1f4f8+pTuyim8
X-Received: by 2002:a5b:bcf:: with SMTP id c15mr31556749ybr.284.1591005557378;
        Mon, 01 Jun 2020 02:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591005557; cv=none;
        d=google.com; s=arc-20160816;
        b=curkUuAfXL5HilLbDFq9g29ELvhLA0wCV2xI0dIX1zimd0TuSn5SJKkSLjpOGmeQbG
         ounfWXpaZUhMxM/WitYwwupG4re5ElWCPL78XGvJ7Tl94uyEyd9W8dy70IG1A4sWC0LJ
         edMs1V/lM2j/JtWS7faSJ6jYIavzsRWseEXaAe5WhSWdKLWKYzD9hxzZe3ysWRKy8ONm
         hOsXgFKgIamwaAYIaLj3UONSUKKjuIW5QnS//fyEUskoJ0gjjeUZRvVs306s9paOIkQA
         4s3ZopEW46Nu528KG4mkYEbnBZD0g1uiu4fzrux1LOe1oStegBp3oYoUf1E/QYFEtL0q
         feKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XYiiwme7WfuWB0ndPxkjzgsBDwOUIWN8LYrbMB4RDNM=;
        b=cI+KQjg5CymZePkx1yzjRhRD2s7StXiqzLAhZ+/G3nfA/60w7gwOGqGwfEsRLkSfkp
         estHqNRsrufZBfJcg1VH/wSg0s1KtBVUkEv09sFWnx1EG6UF/sKVN4O3ZoiSTMqVAGmm
         vdvhqJQcgtd26mD0wCg04kkoWtrvbAM6oErPQ2HAc3K5Gsics8puxQc9f3H6t+91XOI9
         5Ly6TREF4ov89bMzkc1u6nKGEaHxvMpPzEbWKAQw3uMHHkkKOVCGG3wXnX0lnT+a+ZIU
         iRt2KVKsbycGkZCW/uhV94bzeQ15RWzYuCR4gd0YwG/IyPTicgOhpzTP3YjULbjPf0r8
         983A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=It0pfR7k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 189si4430198ybb.109.2020.06.01.02.59.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 02:59:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=It0pfR7k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfhDw-000655-ML
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 05:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jfhCl-0004MP-0P
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 05:58:03 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43853
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jfhCk-0002Ka-1f
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 05:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591005480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYiiwme7WfuWB0ndPxkjzgsBDwOUIWN8LYrbMB4RDNM=;
 b=It0pfR7kasOKGCJKKSMEu69y8DvKa6pT8TMaFnawVLLmZtGziF/2okNSBGmzowEIcOokVm
 Koj+80pgE1e1AxvU4aMgbJ0keCl8TDIinQhhVhy5hDrXOx4JFs9uQ4Zof3VtpiLvLOFPIM
 JNoflqkc48shWFyP+Vw0loVDSEll/1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-jB1YRWOWPxqhdH1wJwntWQ-1; Mon, 01 Jun 2020 05:57:59 -0400
X-MC-Unique: jB1YRWOWPxqhdH1wJwntWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5519219200C0;
 Mon,  1 Jun 2020 09:57:58 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-56.ams2.redhat.com [10.36.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B774E5C1D3;
 Mon,  1 Jun 2020 09:57:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v3 2/4] acpi: Move build_tpm2() in the generic part
Date: Mon,  1 Jun 2020 11:57:35 +0200
Message-Id: <20200601095737.32671-3-eric.auger@redhat.com>
In-Reply-To: <20200601095737.32671-1-eric.auger@redhat.com>
References: <20200601095737.32671-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 05:58:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HfJy22UIxvha

We plan to build the TPM2 table on ARM too. In order to reuse the
generation code, let's move build_tpm2() to aml-build.c.

No change in the implementation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/acpi/aml-build.h |  2 ++
 hw/acpi/aml-build.c         | 44 +++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c        | 44 -------------------------------------
 3 files changed, 46 insertions(+), 44 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index ed7c89309e..d27da03d64 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -437,4 +437,6 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms);
 
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id);
+
+void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog);
 #endif
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 3681ec6e3d..b37052c1b4 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -26,6 +26,7 @@
 #include "qemu/bitops.h"
 #include "sysemu/numa.h"
 #include "hw/boards.h"
+#include "hw/acpi/tpm.h"
 
 static GArray *build_alloc_array(void)
 {
@@ -1877,6 +1878,49 @@ build_hdr:
                  "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
 }
 
+void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
+{
+    Acpi20TPM2 *tpm2_ptr = acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    unsigned log_addr_size = sizeof(tpm2_ptr->log_area_start_address);
+    unsigned log_addr_offset =
+        (char *)&tpm2_ptr->log_area_start_address - table_data->data;
+    uint8_t start_method_params[12] = {};
+
+    /* platform class */
+    build_append_int_noprefix(table_data, TPM2_ACPI_CLASS_CLIENT, 2);
+    /* reserved */
+    build_append_int_noprefix(table_data, 0, 2);
+    if (TPM_IS_TIS_ISA(tpm_find())) {
+        /* address of control area */
+        build_append_int_noprefix(table_data, 0, 8);
+        /* start method */
+        build_append_int_noprefix(table_data, TPM2_START_METHOD_MMIO, 4);
+    } else if (TPM_IS_CRB(tpm_find())) {
+        build_append_int_noprefix(table_data, TPM_CRB_ADDR_CTRL, 8);
+        build_append_int_noprefix(table_data, TPM2_START_METHOD_CRB, 4);
+    } else {
+        g_warn_if_reached();
+    }
+
+    /* platform specific parameters */
+    g_array_append_vals(table_data, &start_method_params, 12);
+
+    /* log area minimum length */
+    build_append_int_noprefix(table_data, TPM_LOG_AREA_MINIMUM_SIZE, 4);
+
+    acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
+    bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE, tcpalog, 1,
+                             false);
+
+    /* log area start address to be filled by Guest linker */
+    build_append_int_noprefix(table_data, 0, 8);
+    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
+                                   log_addr_offset, log_addr_size,
+                                   ACPI_BUILD_TPMLOG_FILE, 0);
+    build_header(linker, table_data,
+                 (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL, NULL);
+}
+
 /* ACPI 5.0: 6.4.3.8.2 Serial Bus Connection Descriptors */
 static Aml *aml_serial_bus_device(uint8_t serial_bus_type, uint8_t flags,
                                   uint16_t type_flags,
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f0d35d7b17..b7c7583b5f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2295,50 +2295,6 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
                  (void *)tcpa, "TCPA", sizeof(*tcpa), 2, NULL, NULL);
 }
 
-static void
-build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
-{
-    Acpi20TPM2 *tpm2_ptr = acpi_data_push(table_data, sizeof(AcpiTableHeader));
-    unsigned log_addr_size = sizeof(tpm2_ptr->log_area_start_address);
-    unsigned log_addr_offset =
-        (char *)&tpm2_ptr->log_area_start_address - table_data->data;
-    uint8_t start_method_params[12] = {};
-
-    /* platform class */
-    build_append_int_noprefix(table_data, TPM2_ACPI_CLASS_CLIENT, 2);
-    /* reserved */
-    build_append_int_noprefix(table_data, 0, 2);
-    if (TPM_IS_TIS_ISA(tpm_find())) {
-        /* address of control area */
-        build_append_int_noprefix(table_data, 0, 8);
-        /* start method */
-        build_append_int_noprefix(table_data, TPM2_START_METHOD_MMIO, 4);
-    } else if (TPM_IS_CRB(tpm_find())) {
-        build_append_int_noprefix(table_data, TPM_CRB_ADDR_CTRL, 8);
-        build_append_int_noprefix(table_data, TPM2_START_METHOD_CRB, 4);
-    } else {
-        g_warn_if_reached();
-    }
-
-    /* platform specific parameters */
-    g_array_append_vals(table_data, &start_method_params, 12);
-
-    /* log area minimum length */
-    build_append_int_noprefix(table_data, TPM_LOG_AREA_MINIMUM_SIZE, 4);
-
-    acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
-    bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE, tcpalog, 1,
-                             false);
-
-    /* log area start address to be filled by Guest linker */
-    build_append_int_noprefix(table_data, 0, 8);
-    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
-                                   log_addr_offset, log_addr_size,
-                                   ACPI_BUILD_TPMLOG_FILE, 0);
-    build_header(linker, table_data,
-                 (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL, NULL);
-}
-
 #define HOLE_640K_START  (640 * KiB)
 #define HOLE_640K_END   (1 * MiB)
 
-- 
2.20.1

