Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1117368njf;
        Fri, 16 Aug 2024 00:38:39 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCW3dLStnNHObmYodr+FocN7LYmPdtVn0yPk/aCspwd5UnwGkpwjeJY9Sd+Nkpp/60DLZLlhTZmqNcMCIgd2QKS3zGxqGQO4
X-Google-Smtp-Source: AGHT+IEGP3+g9eF9SJpeVp75zwpfbPEN6t2xb7Qvqsm5NYad74ddlUIadKsPaFluGmHLs9q9NSXy
X-Received: by 2002:a05:620a:3184:b0:79f:b0e:2e70 with SMTP id af79cd13be357-7a5069bf164mr230960885a.55.1723793918853;
        Fri, 16 Aug 2024 00:38:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723793918; cv=pass;
        d=google.com; s=arc-20160816;
        b=GD/eDCI58TY2KSEnQGkLkLTBQTmwz+AmLApFJ25IX4/Wxw+TOjdgMgMlbMtjLWh1Y9
         DrG23wHzIa6E7CS70VW8/bRd3KwlkjHoAvEFEY9S5MTD9GJkKeAFXBeDxUyNYcwjI903
         NbTKXohkHsqXpyB4yvFI4oHde437mCJMP80TnIPogc3aZmiRgYfB8UPc7Bu+vOA4cdZ1
         cx7UbaQ7GvKuzuleXIncJLWGxTYoqAAz1aZPOUY0ldCk9fwK72wUrh1WGw8gnHWON9dA
         9Vf+3gn7wMStLzkXWNb26/35y1AyWIakKboGZy49EbQ8WHEODV9lTv7HWKIGyVGvJ5Be
         PuIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=xy7meEjfxS7VcP8UWRVE7GBnfDTyDgO40T6FaUmbuF8=;
        fh=PYzESMHRCN54xMvk1OJZGifUXEB82Dl7bh3mo35Izrg=;
        b=kcrPpJRkE6JvsBvLv5EyK5C0WubYH7MHdLjRfpdaxhdqLheNW9E/ex0awxdCdMTTOt
         fC+9TG/k0NVdA9GminE8cjewuTV26l5TX01SFkEe35vF5WwXU46kIZchK/RO/fs6bDxA
         XU15EZ3cOLASRGC/cinn25AcI0XBy0/IF44KSA7YRf9e6sYxBNF61burHLTr3wGJjeUr
         1zBMHAh/kYzq7CUMKqHPDRS0gXJsG2050NKSe+KnqaCqhRsc9Afk2Nzc8aEDFsq2joUn
         YJ+1G3Gk+ewQCjLfW9IRgToJyERwDtr0+gBrNCvlW5V/y3u1Ag8MQor7okUxWzjHreIf
         sAvw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=FCfYt9Lq;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-24358-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-24358-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <kvm+bounces-24358-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id af79cd13be357-7a4ff1103d9si383568185a.584.2024.08.16.00.38.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:38:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-24358-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=FCfYt9Lq;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-24358-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-24358-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 801241C25B06
	for <alex.bennee@linaro.org>; Fri, 16 Aug 2024 07:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E3113A868;
	Fri, 16 Aug 2024 07:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCfYt9Lq"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23840139CEF;
	Fri, 16 Aug 2024 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723793874; cv=none; b=bmdrZA9J2FX7t2stR9aFDhpVxXFXW0/i0gglH/C3c2x5uGimw3s5JmZkRzTpQp8UhQqBkqG2dzDxPLmL6F1RG8enbxPFm47VmOHlfz/wUkAUsaXbuBgrFcPspqY0/1NnlXeAICvA+6wuhBPvl40EyDQmDKZnlcKJ9WVYFehXpy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723793874; c=relaxed/simple;
	bh=CVbWcAOnbhzuAqQUj9IQkyqnNpkcMiuJof1ZiJ1dGRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YdiMUKqEIlUKYC1E/ydn4JiXd6bUSQvaH7dxvDmuq2eNOG2yUnRRsjpLAWZlU3Rz8L4+RbXbUzg2Lzx34e94dcEC8cfVtXOQuhChBlIhPLseGJQS1/DFs/szV1h7hOByWQs0tYXUsAE4Cl+1z0AtU9wriWSKhXaypMa1BXUZmlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCfYt9Lq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634D5C4AF12;
	Fri, 16 Aug 2024 07:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723793873;
	bh=CVbWcAOnbhzuAqQUj9IQkyqnNpkcMiuJof1ZiJ1dGRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FCfYt9Lqm6OC4uvG675SboMAdiq2f6O4aVkWr4zC9swcaazaVbq5pNHWs903JbpFl
	 25Q/xXJnLm9M8SIPLwMkFedoMx/K3W2GqKmtK8rLgv0eMhnQLndGZjaKPWfVawfOgW
	 6axe2Ae23THZRGliJGhuty74vnts7zGDfUtohNQmVbKCo0YiVM8Ex+9ZU2YaQoI6Kf
	 At6GTFMcIW/Mq83W0piu5ZB4orrrrfcbZRxA9emGL95pnTStH+lHq0svlXs3s/ppOf
	 okUbX2q54itYt7w28ScBHp5SXYR09vfvms77zoo6TCXOS1avxRCuNmGkQKeYgLyCI2
	 YADVLhGUlVztw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1serWx-000000055ej-2Tik;
	Fri, 16 Aug 2024 09:37:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v8 07/13] acpi/ghes: cleanup the memory error code logic
Date: Fri, 16 Aug 2024 09:37:39 +0200
Message-ID: <b7837d0db674d535139971ae81c5da70c18f1d41.1723793768.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1723793768.git.mchehab+huawei@kernel.org>
References: <cover.1723793768.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: a4we6/6fVi92

Better organize the code of the function, making it to use the
raw CPER function, thus removing duplicated code.

While here, rename the function to actually reflect what it does.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes-stub.c    |   2 +-
 hw/acpi/ghes.c         | 125 +++++++++++++++--------------------------
 include/hw/acpi/ghes.h |   4 +-
 target/arm/kvm.c       |   2 +-
 4 files changed, 50 insertions(+), 83 deletions(-)

diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
index 8762449870b5..a60ae07a8e7c 100644
--- a/hw/acpi/ghes-stub.c
+++ b/hw/acpi/ghes-stub.c
@@ -11,7 +11,7 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/ghes.h"
 
-int acpi_ghes_record_errors(enum AcpiGhesNotifyType notify,
+int acpi_ghes_memory_errors(enum AcpiGhesNotifyType notify,
                             uint64_t physical_address)
 {
     return -1;
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a3ae710dcf81..4f7b6c5ad2b6 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -206,51 +206,30 @@ static void acpi_ghes_build_append_mem_cper(GArray *table,
     build_append_int_noprefix(table, 0, 7);
 }
 
-static int acpi_ghes_record_mem_error(uint64_t error_block_address,
-                                      uint64_t error_physical_addr)
+static void
+ghes_gen_err_data_uncorrectable_recoverable(GArray *block,
+                                            const uint8_t *section_type,
+                                            int data_length)
 {
-    GArray *block;
-
-    /* Memory Error Section Type */
-    const uint8_t uefi_cper_mem_sec[] =
-          UUID_LE(0xA5BC1114, 0x6F64, 0x4EDE, 0xB8, 0x63, 0x3E, 0x83, \
-                  0xED, 0x7C, 0x83, 0xB1);
-
     /* invalid fru id: ACPI 4.0: 17.3.2.6.1 Generic Error Data,
      * Table 17-13 Generic Error Data Entry
      */
     QemuUUID fru_id = {};
-    uint32_t data_length;
 
-    block = g_array_new(false, true /* clear */, 1);
-
-    /* This is the length if adding a new generic error data entry*/
-    data_length = ACPI_GHES_DATA_LENGTH + ACPI_GHES_MEM_CPER_LENGTH;
     /*
-     * It should not run out of the preallocated memory if adding a new generic
-     * error data entry
+     * Calculate the size with this block. No need to check for
+     * too big CPER, as CPER size is checked at ghes_record_cper_errors()
      */
-    assert((data_length + ACPI_GHES_GESB_SIZE) <=
-            ACPI_GHES_MAX_RAW_DATA_LENGTH);
+    data_length += ACPI_GHES_GESB_SIZE;
 
     /* Build the new generic error status block header */
     acpi_ghes_generic_error_status(block, ACPI_GEBS_UNCORRECTABLE,
         0, 0, data_length, ACPI_CPER_SEV_RECOVERABLE);
 
     /* Build this new generic error data entry header */
-    acpi_ghes_generic_error_data(block, uefi_cper_mem_sec,
+    acpi_ghes_generic_error_data(block, section_type,
         ACPI_CPER_SEV_RECOVERABLE, 0, 0,
         ACPI_GHES_MEM_CPER_LENGTH, fru_id, 0);
-
-    /* Build the memory section CPER for above new generic error data entry */
-    acpi_ghes_build_append_mem_cper(block, error_physical_addr);
-
-    /* Write the generic error data entry into guest memory */
-    cpu_physical_memory_write(error_block_address, block->data, block->len);
-
-    g_array_free(block, true);
-
-    return 0;
 }
 
 /*
@@ -448,59 +427,10 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     ags->present = true;
 }
 
-int acpi_ghes_record_errors(enum AcpiGhesNotifyType notify,
-                            uint64_t physical_address)
-{
-    uint64_t cper_addr, read_ack_register = 0;
-    uint64_t read_ack_start_addr;
-    enum AcpiHestSourceId source;
-    AcpiGedState *acpi_ged_state;
-    AcpiGhesState *ags;
-
-    if (ghes_notify_to_source_id(ACPI_HEST_SRC_ID_SEA, &source)) {
-        error_report("GHES: Invalid error block/ack address(es) for notify %d",
-                     notify);
-        return -1;
-    }
-
-    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
-                                                       NULL));
-    g_assert(acpi_ged_state);
-    ags = &acpi_ged_state->ghes_state;
-
-    cper_addr = le64_to_cpu(ags->ghes_addr_le);
-    cper_addr += ACPI_HEST_SRC_ID_COUNT * sizeof(uint64_t);
-    read_ack_start_addr = cper_addr + source * sizeof(uint64_t);
-
-    cper_addr += ACPI_HEST_SRC_ID_COUNT * sizeof(uint64_t);
-    cper_addr += source * ACPI_GHES_MAX_RAW_DATA_LENGTH;
-
-    if (!physical_address) {
-        error_report("can not find Generic Error Status Block for notify %d",
-                     notify);
-        return -1;
-    }
-
-    cpu_physical_memory_read(read_ack_start_addr,
-                             &read_ack_register, sizeof(read_ack_register));
-
-    /* zero means OSPM does not acknowledge the error */
-
-    read_ack_register = cpu_to_le64(0);
-    /*
-     * Clear the Read Ack Register, OSPM will write it to 1 when
-     * it acknowledges this error.
-     */
-    cpu_physical_memory_write(read_ack_start_addr,
-                              &read_ack_register, sizeof(uint64_t));
-
-    return acpi_ghes_record_mem_error(cper_addr, physical_address);
-}
-
 NotifierList acpi_generic_error_notifiers =
     NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
 
-void ghes_record_cper_errors(uint8_t *cper, size_t len,
+void ghes_record_cper_errors(const void *cper, size_t len,
                              enum AcpiGhesNotifyType notify, Error **errp)
 {
     uint64_t cper_addr, read_ack_start_addr;
@@ -557,6 +487,43 @@ void ghes_record_cper_errors(uint8_t *cper, size_t len,
     notifier_list_notify(&acpi_generic_error_notifiers, NULL);
 }
 
+int acpi_ghes_memory_errors(enum AcpiGhesNotifyType notify,
+                            uint64_t physical_address)
+{
+    /* Memory Error Section Type */
+    const uint8_t guid[] =
+          UUID_LE(0xA5BC1114, 0x6F64, 0x4EDE, 0xB8, 0x63, 0x3E, 0x83, \
+                  0xED, 0x7C, 0x83, 0xB1);
+    Error *errp = NULL;
+    GArray *block;
+
+    if (!physical_address) {
+        error_report("can not find Generic Error Status Block for notify %d",
+                     notify);
+        return -1;
+    }
+
+    block = g_array_new(false, true /* clear */, 1);
+
+    ghes_gen_err_data_uncorrectable_recoverable(block, guid,
+                                                ACPI_GHES_MAX_RAW_DATA_LENGTH);
+
+    /* Build the memory section CPER for above new generic error data entry */
+    acpi_ghes_build_append_mem_cper(block, physical_address);
+
+    /* Report the error */
+    ghes_record_cper_errors(block->data, block->len, notify, &errp);
+
+    g_array_free(block, true);
+
+    if (errp) {
+        error_report_err(errp);
+        return -1;
+    }
+
+    return 0;
+}
+
 bool acpi_ghes_present(void)
 {
     AcpiGedState *acpi_ged_state;
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 6e349264fd8b..a24fe8a3bc33 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -71,7 +71,7 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
                      const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
-int acpi_ghes_record_errors(enum AcpiGhesNotifyType notify,
+int acpi_ghes_memory_errors(enum AcpiGhesNotifyType notify,
                             uint64_t error_physical_addr);
 void ghes_record_cper_errors(const void *cper, size_t len,
                              enum AcpiGhesNotifyType notify, Error **errp);
@@ -80,7 +80,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
  * acpi_ghes_present: Report whether ACPI GHES table is present
  *
  * Returns: true if the system has an ACPI GHES table and it is
- * safe to call acpi_ghes_record_errors() to record a memory error.
+ * safe to call acpi_ghes_memory_errors() to record a memory error.
  */
 bool acpi_ghes_present(void);
 #endif
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 849e2e21b304..915f07376c8f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2373,7 +2373,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
              */
             if (code == BUS_MCEERR_AR) {
                 kvm_cpu_synchronize_state(c);
-                if (!acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
+                if (!acpi_ghes_memory_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
                     kvm_inject_arm_sea(c);
                 } else {
                     error_report("failed to record the error");
-- 
2.46.0

