Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F36CCA472
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Oct 2025 19:26:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5UED-0007jg-I6; Sun, 05 Oct 2025 15:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v5UE1-0007fs-P0
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 15:16:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v5UDz-0006R0-SE
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 15:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759691811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OhUIAcnmQM/zKU/vQjFpt3gEtPEYN7XIQ1W4eirGAyc=;
 b=YfVpm00lgF21ibyOFl4N9XVBPDVT0IxNbHJMuN8ijpYMOoTRPx4hCBQALmNz8H68k0Df4u
 rud0r2VEUL0l7e2K+V/NWidDZHJkdIa2o05EsZvA5HNFXriA6n+5XJ9OxSySdS4N08j3SB
 ulj4b6/TParOxkD0pmCsaoNipKKGnIQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-5AIXTRQSN_q7KWJyjukoHA-1; Sun, 05 Oct 2025 15:16:50 -0400
X-MC-Unique: 5AIXTRQSN_q7KWJyjukoHA-1
X-Mimecast-MFC-AGG-ID: 5AIXTRQSN_q7KWJyjukoHA_1759691809
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3efa77de998so2422328f8f.0
 for <qemu-arm@nongnu.org>; Sun, 05 Oct 2025 12:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759691809; x=1760296609;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OhUIAcnmQM/zKU/vQjFpt3gEtPEYN7XIQ1W4eirGAyc=;
 b=QzaSEh95vgwEvtk25zre97IC+xb9+8rOA96wDTKJ8UvweD7ZhG+AVFVlBh2nSeuQtX
 O2i8MQN2XNI6XbERzy9Xo36P8NAkxDBcMTQ9CZLWJ4YAIM8OYs2gwwjwZGpR1Gt5+0yF
 sGgMHrXW610Jakj8atxN7fT5GrVfRblhzbKJpO6MXtCr0do9mdgVFrSQ1uN9TvzpTxak
 ekhpp/kfW1eMRFXPmkCaH3b0uIjxghAXAxiau4lFfUMgs6OH2GMoWndWE2sravh7zKJ8
 V9xZMZwDNL2GCQa4LaNEef8T0NcPCytrOeGGHND86t3wCFbDdt9wPvurZQEVbQHhx2xR
 V8Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWls+dGGXjmCtyrrpI6JgTyfvNaci6TxXNbKWyxb6/xKMwTpoayqvXEAC9w2jPjhRNjKn977WERQw==@nongnu.org
X-Gm-Message-State: AOJu0YzBCUgcnY4iYOBExy/Tb7Bt+U/UC+r0rWL6YOiqQnXLeiimDICV
 H9y1Q4GxQ3Y4poTuMt0qiGZcKETelByiOgbXpC8KSupBM/44NlC161U5vUmjCQQXkicE0Gj9cNC
 t5h0hSGPz3o1jR4h27aDFu5YHtS5X4R97UZwuYE+xICuYXxY9V74HBg==
X-Gm-Gg: ASbGnctkNgBHCQVv0/+ZvWIk7RkOIU7AbA8CRgZthylFKNNyPWkkrHLaM0kZa4oT+Kx
 3jiOQKAhsd9DFRhpfgKnkVXM6yda2C09EalwG5pXf+7zHkL7qTgWuqwPupDVCjhrtxuG9q78vRq
 JAWgm6GAhRHl7VIJIqaWylGQG066oD5Wwvk/MW7ScRJN/pwSQ0HuMMJyTmaxPn5MiiRxJZrzTPy
 /nCBS0BGjoFlWnYTiBuXg+Mssmex+JL4B5UpY24YjPm5JGWf38lCAks7qTKwpTLB7bPXy/pYEAP
 vLnqIchY5mN7xw15+ofJFpnz/w8uQWRV9U70fyU=
X-Received: by 2002:a05:600c:1d05:b0:45d:d353:a491 with SMTP id
 5b1f17b1804b1-46e711002damr58957025e9.1.1759691808750; 
 Sun, 05 Oct 2025 12:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnI3QzF955EPnYrzFeohbyruMJEXq1zjmTD98cXJ4ebvS4vYaqwtEfv2fewDwhtSdDCnS+5Q==
X-Received: by 2002:a05:600c:1d05:b0:45d:d353:a491 with SMTP id
 5b1f17b1804b1-46e711002damr58956945e9.1.1759691808297; 
 Sun, 05 Oct 2025 12:16:48 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1518:6900:b69a:73e1:9698:9cd3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e61a4161bsm234287055e9.16.2025.10.05.12.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 12:16:47 -0700 (PDT)
Date: Sun, 5 Oct 2025 15:16:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Ani Sinha <anisinha@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org
Subject: [PULL 20/75] acpi/ghes: don't hard-code the number of sources for
 HEST table
Message-ID: <2c5a2616ed047e9d5e70970af5c4b2a54e9fa290.1759691708.git.mst@redhat.com>
References: <cover.1759691708.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1759691708.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0YFzEgio1LHs1OEpC1dMfE7cnS_dICpxAqR1vtRWuNQ_1759691809
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.43,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The current code is actually dependent on having just one error
structure with a single source, as any change there would cause
migration issues.

As the number of sources should be arch-dependent, as it will depend on
what kind of notifications will exist, and how many errors can be
reported at the same time, change the logic to be more flexible,
allowing the number of sources to be defined when building the
HEST table by the caller.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <1698680848c11d6f26368426f1657e14faaf55c4.1758610789.git.mchehab+huawei@kernel.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/ghes.h   | 17 ++++++++++++-----
 hw/acpi/ghes.c           | 39 +++++++++++++++++++++------------------
 hw/arm/virt-acpi-build.c |  8 +++++++-
 target/arm/kvm.c         |  2 +-
 4 files changed, 41 insertions(+), 25 deletions(-)

diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 5265102ba5..8c4b084337 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -57,13 +57,18 @@ enum AcpiGhesNotifyType {
     ACPI_GHES_NOTIFY_RESERVED = 12
 };
 
-enum {
-    ACPI_HEST_SRC_ID_SEA = 0,
-    /* future ids go here */
-
-    ACPI_GHES_ERROR_SOURCE_COUNT
+/*
+ * ID numbers used to fill HEST source ID field
+ */
+enum AcpiGhesSourceID {
+    ACPI_HEST_SRC_ID_SYNC,
 };
 
+typedef struct AcpiNotificationSourceId {
+    enum AcpiGhesSourceID source_id;
+    enum AcpiGhesNotifyType notify;
+} AcpiNotificationSourceId;
+
 /*
  * AcpiGhesState stores GPA values that will be used to fill HEST entries.
  *
@@ -84,6 +89,8 @@ typedef struct AcpiGhesState {
 void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
                      GArray *hardware_errors,
                      BIOSLinker *linker,
+                     const AcpiNotificationSourceId * const notif_source,
+                     int num_sources,
                      const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 668ca72587..f49d0d628f 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -238,17 +238,17 @@ ghes_gen_err_data_uncorrectable_recoverable(GArray *block,
  * See docs/specs/acpi_hest_ghes.rst for blobs format.
  */
 static void build_ghes_error_table(AcpiGhesState *ags, GArray *hardware_errors,
-                                   BIOSLinker *linker)
+                                   BIOSLinker *linker, int num_sources)
 {
     int i, error_status_block_offset;
 
     /* Build error_block_address */
-    for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
+    for (i = 0; i < num_sources; i++) {
         build_append_int_noprefix(hardware_errors, 0, sizeof(uint64_t));
     }
 
     /* Build read_ack_register */
-    for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
+    for (i = 0; i < num_sources; i++) {
         /*
          * Initialize the value of read_ack_register to 1, so GHES can be
          * writable after (re)boot.
@@ -263,13 +263,13 @@ static void build_ghes_error_table(AcpiGhesState *ags, GArray *hardware_errors,
 
     /* Reserve space for Error Status Data Block */
     acpi_data_push(hardware_errors,
-        ACPI_GHES_MAX_RAW_DATA_LENGTH * ACPI_GHES_ERROR_SOURCE_COUNT);
+        ACPI_GHES_MAX_RAW_DATA_LENGTH * num_sources);
 
     /* Tell guest firmware to place hardware_errors blob into RAM */
     bios_linker_loader_alloc(linker, ACPI_HW_ERROR_FW_CFG_FILE,
                              hardware_errors, sizeof(uint64_t), false);
 
-    for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
+    for (i = 0; i < num_sources; i++) {
         /*
          * Tell firmware to patch error_block_address entries to point to
          * corresponding "Generic Error Status Block"
@@ -295,12 +295,14 @@ static void build_ghes_error_table(AcpiGhesState *ags, GArray *hardware_errors,
 }
 
 /* Build Generic Hardware Error Source version 2 (GHESv2) */
-static void build_ghes_v2(GArray *table_data,
-                          BIOSLinker *linker,
-                          enum AcpiGhesNotifyType notify,
-                          uint16_t source_id)
+static void build_ghes_v2_entry(GArray *table_data,
+                                BIOSLinker *linker,
+                                const AcpiNotificationSourceId *notif_src,
+                                uint16_t index, int num_sources)
 {
     uint64_t address_offset;
+    const uint16_t notify = notif_src->notify;
+    const uint16_t source_id = notif_src->source_id;
 
     /*
      * Type:
@@ -331,7 +333,7 @@ static void build_ghes_v2(GArray *table_data,
                                    address_offset + GAS_ADDR_OFFSET,
                                    sizeof(uint64_t),
                                    ACPI_HW_ERROR_FW_CFG_FILE,
-                                   source_id * sizeof(uint64_t));
+                                   index * sizeof(uint64_t));
 
     /* Notification Structure */
     build_ghes_hw_error_notification(table_data, notify);
@@ -351,8 +353,7 @@ static void build_ghes_v2(GArray *table_data,
                                    address_offset + GAS_ADDR_OFFSET,
                                    sizeof(uint64_t),
                                    ACPI_HW_ERROR_FW_CFG_FILE,
-                                   (ACPI_GHES_ERROR_SOURCE_COUNT + source_id)
-                                   * sizeof(uint64_t));
+                                   (num_sources + index) * sizeof(uint64_t));
 
     /*
      * Read Ack Preserve field
@@ -368,22 +369,26 @@ static void build_ghes_v2(GArray *table_data,
 void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
                      GArray *hardware_errors,
                      BIOSLinker *linker,
+                     const AcpiNotificationSourceId *notif_source,
+                     int num_sources,
                      const char *oem_id, const char *oem_table_id)
 {
     AcpiTable table = { .sig = "HEST", .rev = 1,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
     uint32_t hest_offset;
+    int i;
 
     hest_offset = table_data->len;
 
-    build_ghes_error_table(ags, hardware_errors, linker);
+    build_ghes_error_table(ags, hardware_errors, linker, num_sources);
 
     acpi_table_begin(&table, table_data);
 
     /* Error Source Count */
-    build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
-    build_ghes_v2(table_data, linker,
-                  ACPI_GHES_NOTIFY_SEA, ACPI_HEST_SRC_ID_SEA);
+    build_append_int_noprefix(table_data, num_sources, 4);
+    for (i = 0; i < num_sources; i++) {
+        build_ghes_v2_entry(table_data, linker, &notif_source[i], i, num_sources);
+    }
 
     acpi_table_end(linker, &table);
 
@@ -515,8 +520,6 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
         return;
     }
 
-    assert(ACPI_GHES_ERROR_SOURCE_COUNT == 1);
-
     if (!ags->use_hest_addr) {
         get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
                              &cper_addr, &read_ack_register_addr);
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index bbe83fab9a..c856d293c6 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -1125,6 +1125,10 @@ static void acpi_align_size(GArray *blob, unsigned align)
     g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
 }
 
+static const AcpiNotificationSourceId hest_ghes_notify[] = {
+    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
+};
+
 static
 void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 {
@@ -1189,7 +1193,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
         if (ags) {
             acpi_add_table(table_offsets, tables_blob);
             acpi_build_hest(ags, tables_blob, tables->hardware_errors,
-                            tables->linker, vms->oem_id, vms->oem_table_id);
+                            tables->linker, hest_ghes_notify,
+                            ARRAY_SIZE(hest_ghes_notify),
+                            vms->oem_id, vms->oem_table_id);
         }
     }
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 891d4fcde9..4f769d69b3 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2456,7 +2456,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
              */
             if (code == BUS_MCEERR_AR) {
                 kvm_cpu_synchronize_state(c);
-                if (!acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SEA,
+                if (!acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC,
                                              paddr)) {
                     kvm_inject_arm_sea(c);
                 } else {
-- 
MST


