Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp1960342njb;
        Sun, 2 Mar 2025 00:22:33 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXxtUHtkMW4Ub1N9hR/aXd947OLpyA9flfa/3ixX0kQUk4vKRs4s8Ex249nG+OljagjORePozQsh4TOFQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFKAAhnwMifVvXqo1Vbuw+T6yw9FzQFUQMtpmIjGhXv2441HyenWKaoi+OjKuURamRFglua
X-Received: by 2002:a05:622a:11d1:b0:471:b9e1:6714 with SMTP id d75a77b69052e-474bc0e893emr126706611cf.35.1740903753037;
        Sun, 02 Mar 2025 00:22:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740903753; cv=pass;
        d=google.com; s=arc-20240605;
        b=kbvROxt9ey1v9wqT+/oHdsyk5BpgzJH9FQjIKnNsvIT8AFoWVIoXd04aSR05TYR1sY
         WaJZd7xjBQp5fiZ1kk3edZUWHjVsa8QaFsRt54/YHT2/QCMEDj0TCIbJGrBVRaP3mt0F
         QmnnbMOnY7yiD8zQrqRKPZE5GEzmKyKIFnSHYgBf8ieu1MWSBXC10a6B/Ow6wHQsVwLS
         U9ugaZdHUwMmWPPCTQmKhseKaeHlXTstJeOW1q96DRQh0iI0OQ5YqFIeZhf7szNwKkTq
         apjkbUmJcCs95nFk5NlG+vRsi6LjLKK80NdOD6Rduj5vXK5i8viUhsp0N0n1ZNPaEnnG
         +wnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=XvKZSUU8DL3NzvII5hb3HIzvLHpGW1qX3tHHuX3dBfw=;
        fh=XWh5htqT3WH2YEMjtF7Wb+aAuEeefwVLf9/4lGSFZ0A=;
        b=Aq5pJdLOa251nratYeVWkPDWSFkBmBMwP9sHgqlL2qBjPUpEjYorPKGa0KEE6l8ylp
         YJ2VL5PQftg625iKQa32K5cHCW3ib6/ZXs3JRi6WCeDqDqb0R28ucRH7udcncHOvY0Wf
         Kn2X9C6CJo3Kz9DVwffA+iK4l/52XvLqVcd03t/DTq1JewAZD11DomA9a5PuEAGRSR89
         w6Xb96VGdNI+OGMP7FdjHHN0kzCllV1O25XucTysmZUbvikVeW717FHJIhoQZJLGHVUn
         WlvCAdTQ7mYK+yvjcjJTfpDXA1JhLyJV5/hDe0dZHCkrJ8KgexuBuNSc+Q8uNlc0OQoP
         7PJg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=FGRyGtZw;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-39811-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-39811-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <kvm+bounces-39811-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id d75a77b69052e-47472439f18si69258071cf.557.2025.03.02.00.22.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 00:22:33 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-39811-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=FGRyGtZw;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-39811-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-39811-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEFE816DCF0
	for <alex.bennee@linaro.org>; Sun,  2 Mar 2025 08:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B8F1DB92C;
	Sun,  2 Mar 2025 08:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGRyGtZw"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4601D9346;
	Sun,  2 Mar 2025 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740903738; cv=none; b=FPgmEXL5bI82u9EQGpuLN2a4VKAzyC92IGfBZofGANZzqAgzFe6dx+pXsFA78xGUj9YoqCDIvgoaDe/LEWNS3uREGo76C3ciwwhM+VPVmqRXLHedtR4iw7dfhMDK0exOXelQHfQcANoIv7IDEy+luu2zQe2usroXLrlc0dPL188=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740903738; c=relaxed/simple;
	bh=j7bQn0WyzOINM0sP/MsNKbpJjZLs2yqAQ+dlgYJyDLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PXKY+u/PT+rdu9FzKjfP7EnKhz4O3x0XFgSzmKhHlAzYL6U0bSNRicRcYKFz32qyiCl4Gckr4Bf4VOu3ifowHPsi1cdeHgBqh8hB4rxeFdhHHthMgRopWiHGWPBC7ZIuO6+8B+l5H5aHTkrVXfpjOECf8j9tHw7Q2QPp8Kej7b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGRyGtZw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB1AC4CEE8;
	Sun,  2 Mar 2025 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740903737;
	bh=j7bQn0WyzOINM0sP/MsNKbpJjZLs2yqAQ+dlgYJyDLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FGRyGtZwl+FP1iOP0ClA2MNyc0rc0XPQHmuSA2icz3ceZCH88lcTN8m2M03wsd5Hb
	 YtMr0ht7Kd5fgSJiawnEUyhX8KVt9+cnmBd5NMMDMOvE+xA/7RobgEBaoGtRWVsucP
	 Yr4hxqT4yusnrDQRgHtE+rdfv2B8rtFyhCowmeLT+CrYEbexwTrOtrRKiWqhGI/Vyn
	 NbjMu68xb8IaIikPqkMwMF5xIQ1SXFRKbdPkJrd09FERrR/zFe5oc+BYb+MxFRdbmh
	 dY9X0tDNO3tOAE02F18Qd2L2nj2thrAMACdWU3gQyFN8V9/oMXodmUFZnUU0dNKpKH
	 89Pbv6ZwwJGrg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1toeaU-000000043Rk-2NUO;
	Sun, 02 Mar 2025 09:22:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 04/19] acpi/ghes: Cleanup the code which gets ghes ged state
Date: Sun,  2 Mar 2025 09:21:51 +0100
Message-ID: <c3401503d78310b3f636e57789759d77092528dd.1740903110.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740903110.git.mchehab+huawei@kernel.org>
References: <cover.1740903110.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: jX3Ec7tuT7gr

Move the check logic into a common function and simplify the
code which checks if GHES is enabled and was properly setup.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes-stub.c    |  7 ++++---
 hw/acpi/ghes.c         | 38 +++++++++++---------------------------
 include/hw/acpi/ghes.h | 14 +++++++-------
 target/arm/kvm.c       |  7 +++++--
 4 files changed, 27 insertions(+), 39 deletions(-)

diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
index 7cec1812dad9..40f660c246fe 100644
--- a/hw/acpi/ghes-stub.c
+++ b/hw/acpi/ghes-stub.c
@@ -11,12 +11,13 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/ghes.h"
 
-int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
+int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
+                            uint64_t physical_address)
 {
     return -1;
 }
 
-bool acpi_ghes_present(void)
+AcpiGhesState *acpi_ghes_get_state(void)
 {
-    return false;
+    return NULL;
 }
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index b709c177cdea..84b891fd3dcf 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -360,18 +360,12 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     /* Create a read-write fw_cfg file for Address */
     fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
         NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
-
-    ags->present = true;
 }
 
 static void get_hw_error_offsets(uint64_t ghes_addr,
                                  uint64_t *cper_addr,
                                  uint64_t *read_ack_register_addr)
 {
-    if (!ghes_addr) {
-        return;
-    }
-
     /*
      * non-HEST version supports only one source, so no need to change
      * the start offset based on the source ID. Also, we can't validate
@@ -390,35 +384,20 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
     *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
 }
 
-void ghes_record_cper_errors(const void *cper, size_t len,
+void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
     uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
-    AcpiGedState *acpi_ged_state;
-    AcpiGhesState *ags;
 
     if (len > ACPI_GHES_MAX_RAW_DATA_LENGTH) {
         error_setg(errp, "GHES CPER record is too big: %zd", len);
         return;
     }
 
-    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
-                                                       NULL));
-    if (!acpi_ged_state) {
-        error_setg(errp, "Can't find ACPI_GED object");
-        return;
-    }
-    ags = &acpi_ged_state->ghes_state;
-
     assert(ACPI_GHES_ERROR_SOURCE_COUNT == 1);
     get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
                          &cper_addr, &read_ack_register_addr);
 
-    if (!cper_addr) {
-        error_setg(errp, "can not find Generic Error Status Block");
-        return;
-    }
-
     cpu_physical_memory_read(read_ack_register_addr,
                              &read_ack_register, sizeof(read_ack_register));
 
@@ -444,7 +423,8 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     return;
 }
 
-int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
+int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
+                            uint64_t physical_address)
 {
     /* Memory Error Section Type */
     const uint8_t guid[] =
@@ -470,7 +450,7 @@ int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
     acpi_ghes_build_append_mem_cper(block, physical_address);
 
     /* Report the error */
-    ghes_record_cper_errors(block->data, block->len, source_id, &errp);
+    ghes_record_cper_errors(ags, block->data, block->len, source_id, &errp);
 
     g_array_free(block, true);
 
@@ -482,7 +462,7 @@ int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
     return 0;
 }
 
-bool acpi_ghes_present(void)
+AcpiGhesState *acpi_ghes_get_state(void)
 {
     AcpiGedState *acpi_ged_state;
     AcpiGhesState *ags;
@@ -491,8 +471,12 @@ bool acpi_ghes_present(void)
                                                        NULL));
 
     if (!acpi_ged_state) {
-        return false;
+        return NULL;
     }
     ags = &acpi_ged_state->ghes_state;
-    return ags->present;
+
+    if (!ags->hw_error_le) {
+        return NULL;
+    }
+    return ags;
 }
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 39619a2457cb..f96ac3e85ca2 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -66,7 +66,6 @@ enum {
 
 typedef struct AcpiGhesState {
     uint64_t hw_error_le;
-    bool present; /* True if GHES is present at all on this board */
 } AcpiGhesState;
 
 void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
@@ -74,15 +73,16 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
                      const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
-int acpi_ghes_memory_errors(uint16_t source_id, uint64_t error_physical_addr);
-void ghes_record_cper_errors(const void *cper, size_t len,
+int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
+                            uint64_t error_physical_addr);
+void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
                              uint16_t source_id, Error **errp);
 
 /**
- * acpi_ghes_present: Report whether ACPI GHES table is present
+ * acpi_ghes_get_state: Get a pointer for ACPI ghes state
  *
- * Returns: true if the system has an ACPI GHES table and it is
- * safe to call acpi_ghes_memory_errors() to record a memory error.
+ * Returns: a pointer to ghes state if the system has an ACPI GHES table,
+ * NULL, otherwise.
  */
-bool acpi_ghes_present(void);
+AcpiGhesState *acpi_ghes_get_state(void);
 #endif
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index da30bdbb2349..80ca7779797b 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2366,10 +2366,12 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
 {
     ram_addr_t ram_addr;
     hwaddr paddr;
+    AcpiGhesState *ags;
 
     assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
 
-    if (acpi_ghes_present() && addr) {
+    ags = acpi_ghes_get_state();
+    if (ags && addr) {
         ram_addr = qemu_ram_addr_from_host(addr);
         if (ram_addr != RAM_ADDR_INVALID &&
             kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
@@ -2387,7 +2389,8 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
              */
             if (code == BUS_MCEERR_AR) {
                 kvm_cpu_synchronize_state(c);
-                if (!acpi_ghes_memory_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
+                if (!acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SEA,
+                                             paddr)) {
                     kvm_inject_arm_sea(c);
                 } else {
                     error_report("failed to record the error");
-- 
2.48.1

