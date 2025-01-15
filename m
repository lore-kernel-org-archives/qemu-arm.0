Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3259492njn;
        Wed, 15 Jan 2025 10:12:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXc1E16ujeB+qpUFkMgxhbNq2KG3c6/Cuco3pUoiuv1ml4TOVAqlzDjw7t2xfHwbeAGbdLK37wUw9PESw==@linaro.org
X-Google-Smtp-Source: AGHT+IHt090A8C0fYJVMyYuwdypaItUJeuIbKwydQLmEO0kSN/3dhpuryxYXceijggkElWsrO/87
X-Received: by 2002:a05:620a:c42:b0:7b6:d4a2:f123 with SMTP id af79cd13be357-7bcd96e57f6mr4298749985a.2.1736964745351;
        Wed, 15 Jan 2025 10:12:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736964745; cv=none;
        d=google.com; s=arc-20240605;
        b=XiFzMzGfPVm4NyEGXKW9XnqFAJ482hFl/kIaKGJlijlV510DTaLiyz8UaZpSWUdtpn
         NpVViLYBX9foaCxK/34RfE8vdouzpT2vNfljhi2h0QxMNPtrA8oMyO61kpJ/DLJYIakb
         +4W5fZr1wCSgXOMSnv4LeQ3UWDwNbAp3FSM52SzyS4Uck/fQrGmqAsWh/Blv1zveh1Xn
         r0xZbZHv75SsIH6Vlr71kjpA2fC9szU9gnTK147pQ7onr8NgAdc1fR+l79rMZHUSzZdg
         xnniP3BaraAKCdv34+gEPoBP6cohD6eEdYfY4limA790jb7+wLhItshhp8bpFa9XzH+t
         nUog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=xBNsFrSHC6tZPAuv4tMyzabgeu+qdwUQ6rMhb6UnyS0=;
        fh=5Nv/9AEXOAuQSFAiVJR/lcnL+6bpywot5acYfS0bOm0=;
        b=EpcJirFYWRC1u+8ZWKbXzjGloBtXDYIX/Iu5hBwAtm0C+TwgZ3mjMOb8ClK9PxAVLd
         BwTeM94bKDn4YCqX+qWaGJnvLSIw9X/rbw4DlkXYyssHxSRD6O1A53VdR8hjIi2HheFa
         46qSG/03Sgf6s2xREPukdlaO4K91gwInU4DRBWrHpXtitz9k0v/QKyf4vAIbZNzuy9Sk
         IkpF3jLSfWltvWu+q0Q1TU8C9oLyKFKLEOAMyyyu0VEqkPx0DbnoBx+JmM6povcpvHYz
         6p4QN/pD30TN4p89YBNpqPrNeQCRyOAMMmhJt5AJLLNGrULnX9IbmajytS9znuQI5bfc
         k0UQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dyDl77Sp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce3307dbesi129933885a.268.2025.01.15.10.12.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 10:12:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dyDl77Sp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY7rV-00037r-TJ; Wed, 15 Jan 2025 13:11:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qg-00083r-QS
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qZ-00070H-Fn
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736964624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xBNsFrSHC6tZPAuv4tMyzabgeu+qdwUQ6rMhb6UnyS0=;
 b=dyDl77SpR7CrzmBs6gcw47HB1B0p3oPuwQmY3is7HWP4OBD+XiUc7rQnz8ZbLWV8hVjvPj
 tPNB9KVuwG5mW2KT3AUgw9SZar3cS7/BzOi8Flf4SjRGRQaQCaW4VXuoQpQzydqQwZE7yo
 YtTCzka1zwHVzJlcH7KoePjc/vDyoUQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-ngzC_JkBO_KYjDfX6NERpg-1; Wed, 15 Jan 2025 13:10:23 -0500
X-MC-Unique: ngzC_JkBO_KYjDfX6NERpg-1
X-Mimecast-MFC-AGG-ID: ngzC_JkBO_KYjDfX6NERpg
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-385d7611ad3so45459f8f.2
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 10:10:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736964622; x=1737569422;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xBNsFrSHC6tZPAuv4tMyzabgeu+qdwUQ6rMhb6UnyS0=;
 b=TkXktkFWZTNfINM1b2MERQUBUHBjh9JL7AxgFpzMXBVGGsM+rborLpMhWzTE2lnBs4
 mzKYS2ApBYVK1z1Nk2DqGtTOAPAj7T9iIK70WnDNKeE/eSddxQ0Pd4krXFl3b91tRa/y
 +ZQg0nTM8eU+NfzOrS844zkhcRldgy1cBik440rk0ryQdA+zfzOFs6FauTfnk4f1HulZ
 ioWplxGbYBQVjCfEQBFBlAqYEQdDD1ypQu3hE1XYks764/xv1TpfCQEzAFGQsIhWmjY1
 iTLeq7OJisNhttRnFafBB6NfkuKRymX1ZNnBHPgjo1p4cSARZulwdeF5Fe3KUi405Oar
 xoAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHhP5SRb51aGgIfl48hs9r1iMeMcxDHeCZ7THhKQCTbBWZIi3jCYhaO0gDRkE37lDDQxKjMWHI6w==@nongnu.org
X-Gm-Message-State: AOJu0YzSntpz/egSqVrs3GOaivRyS3PwR73MpCgFQ+7Ba8zFqkxlcwtb
 aiKlyKgPxzPlKl0wh8xEH4NZsrgyWatQLoj23jzNoLzhExbli5x8BfLNp4NsyxFTxtpLPcDql5B
 GX0Le61DWBvWKEWJyiYmByXq+4DNQQThy/465nVaum95HQuV1kg==
X-Gm-Gg: ASbGncuD8lnhuHlyD5YKayapoQ3+hWC+FQ4pxM1n4N7pwCctqDR7LY7OCeiC5MIVgcH
 ByoPGF/F4xxZeM+JRoVzh72Ok9DCipjSqw1fLegnpWKg3StV2EOHPZyLpkKaWgrd4JnMMAMREnC
 hE5Kht/eOSAoYkEI3vNgO8/0oRUMGyPo56Mt4I+UUPjn4EzzOiAotRggjVKkEBDCJTBJyVG+fcW
 4gaNzfXdyUDOPad0McYyctAOmAaCN0WybaIGxvA2MGb2Kn8lCwO
X-Received: by 2002:a05:6000:4711:b0:386:2d40:a192 with SMTP id
 ffacd0b85a97d-38a872f51ffmr26463428f8f.34.1736964621801; 
 Wed, 15 Jan 2025 10:10:21 -0800 (PST)
X-Received: by 2002:a05:6000:4711:b0:386:2d40:a192 with SMTP id
 ffacd0b85a97d-38a872f51ffmr26463408f8f.34.1736964621434; 
 Wed, 15 Jan 2025 10:10:21 -0800 (PST)
Received: from redhat.com ([2a0d:6fc7:342:db8c:4ec4:322b:a6a8:f411])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74ace90sm32150395e9.16.2025.01.15.10.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 10:10:20 -0800 (PST)
Date: Wed, 15 Jan 2025 13:10:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 35/48] acpi/ghes: make the GHES record generation more generic
Message-ID: <48b0dcdd67d3fafbd07f6298257259dec4f541ce.1736964488.git.mst@redhat.com>
References: <cover.1736964487.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1736964487.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nqdmYnVMx2gRddF4-kavdOPQCX7PDHYv_j-sFpxjy-8_1736964622
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Vj3TXPGdCoxY

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

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
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <68d9f787d8c4fc8d1dbc227d6902fe801e42dea9.1736945236.git.mchehab+huawei@kernel.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/ghes.h |   3 ++
 hw/acpi/ghes.c         | 120 +++++++++++++++++++++++------------------
 2 files changed, 72 insertions(+), 51 deletions(-)

diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 9295e46be2..8859346af5 100644
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
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a3dffd78b0..6f40cd35a9 100644
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
+        error_setg(errp, "GHES CPER record is too big: %zd", len);
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
@@ -415,24 +395,62 @@ int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
 
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
+                              &read_ack_register, sizeof(uint64_t));
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
+    ghes_gen_err_data_uncorrectable_recoverable(block, guid, data_length);
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
-- 
MST

