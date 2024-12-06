Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1014104njb;
        Fri, 6 Dec 2024 09:22:53 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVrBSC2OZ/cQpyHctBGm/WbQQwVVFvHRIFSumMM2WZmnSm7yjVXS//c6ASaeiHBCu6Zk9l2TV3//sJ2kg==@linaro.org
X-Google-Smtp-Source: AGHT+IEndh3nDktNFF3YEZ1Z49oZyrEbGnn/IgidxYK7NdT57LcnA2Sn4178xqF05J6PKxN5ZJx/
X-Received: by 2002:a17:906:31d6:b0:aa6:2edd:cbe9 with SMTP id a640c23a62f3a-aa639fa4878mr320000666b.8.1733505773192;
        Fri, 06 Dec 2024 09:22:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733505773; cv=pass;
        d=google.com; s=arc-20240605;
        b=AL15N4kqBevRNmtVFKRIiATZdug140M5HM/MRwQzbeJRDGRetNe6j54qww1RcleAip
         YjV1mpSd87XfsJWdy8jAoThl7YHcQEjtC6nkqSe2oofjGDZ1i4aQq0R8derxJUh01p1a
         dKidQ666XipB7tEwDLiacMS0lfSWcHbfeyBHvlhrDlxHkyxyRHjtD6sSVtoPAo27Ef/v
         jRpohJzmNS2ne9oqmwwyYHZQMC2UUQgfmHezav2GEHRyfBhgtis/idZqk7RI72Mq/aRm
         Qwn5l/3y8hxzl3DY/dGYe2DHuP4h6fZ4NnpvkoTBMG4XZbH5t2pS1j6z17qSxReIRP5+
         3yuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=lSWV6pdWgje7cwUqhIu/DnKrKwxNMheIEMlgIvsjh+c=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=HG/jT4c2p2WKorvUY+ga2+njxqS4GgUkh4Q0Kab85PGvqvCWe8HKPB+wVLnYSG4soB
         KIUuEVSZZrAhvIMZj0BaAoF2mV2YWLvCW3US5YDLY8jPwxXO3L2ZXI1pHrTT/56Vng1g
         p4hS77OgIwoABiiyzoc1yWLYkGlJ8I7KUfUc4mgM73udEPcRYeNrWRu/zjYmWSBjDPhu
         W0DBWttwmZMnxjhiLFzwwmVEHLXShshYcduec9QOKeNX3ZxRcz1gEbuwDq/wbYiNvliQ
         mZzGUqIFSSuu/fqU5pieW1QKmDyrD/FKh5FlajwKuKQ4xFIjejDKmUtL4ZTjjUcn+0pd
         52vw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=lxJqFXIl;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435392-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435392-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435392-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-aa625f0d6acsi282085366b.221.2024.12.06.09.22.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:22:53 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435392-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=lxJqFXIl;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435392-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435392-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2DA41882407
	for <alex.bennee@linaro.org>; Fri,  6 Dec 2024 17:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB3D219EB9;
	Fri,  6 Dec 2024 17:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxJqFXIl"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E25203D5B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733505688; cv=none; b=YHxnH5tFIjDIysgfPdc8FxwnL4ke7Ys0PrkEZMxfMtQdz914sdCi11tB4gazFIvv20WPZjrIHZCwlhy2nucrJL0bkvHM3SiWJb3LTci20vJvNowtT2z48yjKTWjuvICxnzYEIX0ZCxJdqlyKmpAgEp+6o+OqVJMI5NfnypuVmNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733505688; c=relaxed/simple;
	bh=gwgbl9QPWRqsj4+s+cvoZuN98x6LKYvPiDEqOzm2GJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZhiQO3h8m1+uD+vqEzzCG2bE1LS/6+3/S5hTlWTtuhyLAY5ijAqcWsIP2uONL+AHfm0Pp6zVEqzFuE1OASbJ/zisPcTVUNC8nnuBhlY/DV1PUpwkFoP+YyRLlqjS00alD7MI+BHzQ7F7V3YThxsYVEGGQ8IJPWxjaU4cbaBJWCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxJqFXIl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85886C4CEE7;
	Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733505687;
	bh=gwgbl9QPWRqsj4+s+cvoZuN98x6LKYvPiDEqOzm2GJc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lxJqFXIlBgIQEl3Nxn106LGILfYf1B7GkETmIUrO48wISAN7He3f/L7xSeOcm8Yq+
	 9CfMffyJnD45HVW1uv4T8Jb4Vpolv9DoPTUbnNl5N/+2sBe7uo/FubfEAGBy2cyg+D
	 wSfM4JJbXy/IdfluFkG0Bjs88VFRaXSEQhvH/6+IEtZTzYdKMG1yY+ZlNT8SliKoT+
	 8ik2twFH+a61fNFDqew9pHcF/Hy9E4GbHtp09zXeMERXdw5F57gHu9Zf6YwNitRt7b
	 +lL+wzVP0KEUszknyXGTChzrM1lJi7vtWD1n87gJzOkCFEY2uajPk3f9+gXDMDWkGH
	 A1x/gTmEil3yw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJc17-00000005RK6-2yRM;
	Fri, 06 Dec 2024 18:21:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/31] acpi/ghes: make the GHES record generation more generic
Date: Fri,  6 Dec 2024 18:12:31 +0100
Message-ID: <a8346e5f84c0f9014e3a379baf9eee9ac2f108c2.1733504943.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733504943.git.mchehab+huawei@kernel.org>
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: oHS6EnUwC4E0

Split the code into separate functions to allow using the
common CPER filling code by different error sources.

The generic code was moved to ghes_record_cper_errors(),
and ghes_gen_err_data_uncorrectable_recoverable() now contains
only a logic to fill the Generic Error Data part of the record,
as described at:

	ACPI 6.2: 18.3.2.7.1 Generic Error Data

The remaining code to generate a memory error now belongs to
acpi_ghes_record_errors() function.

A further patch will give it a better name.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c         | 121 ++++++++++++++++++++++++-----------------
 include/hw/acpi/ghes.h |   3 +
 2 files changed, 73 insertions(+), 51 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a3dffd78b012..4b5332f8c667 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -181,51 +181,24 @@ static void acpi_ghes_build_append_mem_cper(GArray *table,
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
-
-    block = g_array_new(false, true /* clear */, 1);
-
-    /* This is the length if adding a new generic error data entry*/
-    data_length = ACPI_GHES_DATA_LENGTH + ACPI_GHES_MEM_CPER_LENGTH;
-    /*
-     * It should not run out of the preallocated memory if adding a new generic
-     * error data entry
-     */
-    assert((data_length + ACPI_GHES_GESB_SIZE) <=
-            ACPI_GHES_MAX_RAW_DATA_LENGTH);
 
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
@@ -383,15 +356,18 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     ags->present = true;
 }
 
-int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
+void ghes_record_cper_errors(const void *cper, size_t len,
+                             uint16_t source_id, Error **errp)
 {
     uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
     uint64_t start_addr;
-    bool ret = -1;
     AcpiGedState *acpi_ged_state;
     AcpiGhesState *ags;
 
-    assert(source_id < ACPI_GHES_ERROR_SOURCE_COUNT);
+    if (len > ACPI_GHES_MAX_RAW_DATA_LENGTH) {
+        error_setg(errp, "GHES CPER record is too big: %ld", len);
+        return;
+    }
 
     acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
                                                        NULL));
@@ -406,6 +382,10 @@ int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
                              sizeof(error_block_addr));
 
     error_block_addr = le64_to_cpu(error_block_addr);
+    if (!error_block_addr) {
+        error_setg(errp, "can not find Generic Error Status Block");
+        return;
+    }
 
     read_ack_register_addr = start_addr +
                              ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
@@ -415,24 +395,63 @@ int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
 
     /* zero means OSPM does not acknowledge the error */
     if (!read_ack_register) {
-        error_report("OSPM does not acknowledge previous error,"
-                     " so can not record CPER for current error anymore");
-    } else if (error_block_addr) {
-        read_ack_register = cpu_to_le64(0);
-        /*
-         * Clear the Read Ack Register, OSPM will write it to 1 when
-         * it acknowledges this error.
-         */
-        cpu_physical_memory_write(read_ack_register_addr,
-                                  &read_ack_register, sizeof(uint64_t));
-
-        ret = acpi_ghes_record_mem_error(error_block_addr,
-                                         physical_address);
-    } else {
-        error_report("can not find Generic Error Status Block");
+        error_setg(errp,
+                   "OSPM does not acknowledge previous error,"
+                   " so can not record CPER for current error anymore");
+        return;
     }
 
-    return ret;
+    read_ack_register = cpu_to_le64(0);
+    /*
+     * Clear the Read Ack Register, OSPM will write 1 to this register when
+     * it acknowledges the error.
+     */
+    cpu_physical_memory_write(read_ack_register_addr,
+        &read_ack_register, sizeof(uint64_t));
+
+    /* Write the generic error data entry into guest memory */
+    cpu_physical_memory_write(error_block_addr, cper, len);
+
+    return;
+}
+
+int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
+{
+    /* Memory Error Section Type */
+    const uint8_t guid[] =
+          UUID_LE(0xA5BC1114, 0x6F64, 0x4EDE, 0xB8, 0x63, 0x3E, 0x83, \
+                  0xED, 0x7C, 0x83, 0xB1);
+    Error *errp = NULL;
+    int data_length;
+    GArray *block;
+
+    block = g_array_new(false, true /* clear */, 1);
+
+    data_length = ACPI_GHES_DATA_LENGTH + ACPI_GHES_MEM_CPER_LENGTH;
+    /*
+     * It should not run out of the preallocated memory if adding a new generic
+     * error data entry
+     */
+    assert((data_length + ACPI_GHES_GESB_SIZE) <=
+            ACPI_GHES_MAX_RAW_DATA_LENGTH);
+
+    ghes_gen_err_data_uncorrectable_recoverable(block, guid,
+                                                data_length);
+
+    /* Build the memory section CPER for above new generic error data entry */
+    acpi_ghes_build_append_mem_cper(block, physical_address);
+
+    /* Report the error */
+    ghes_record_cper_errors(block->data, block->len, source_id, &errp);
+
+    g_array_free(block, true);
+
+    if (errp) {
+        error_report_err(errp);
+        return -1;
+    }
+
+    return 0;
 }
 
 bool acpi_ghes_present(void)
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 9295e46be25e..8859346af51a 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -23,6 +23,7 @@
 #define ACPI_GHES_H
 
 #include "hw/acpi/bios-linker-loader.h"
+#include "qapi/error.h"
 
 /*
  * Values for Hardware Error Notification Type field
@@ -73,6 +74,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
                      const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
+void ghes_record_cper_errors(const void *cper, size_t len,
+                             uint16_t source_id, Error **errp);
 int acpi_ghes_record_errors(uint16_t source_id, uint64_t error_physical_addr);
 
 /**
-- 
2.47.1

