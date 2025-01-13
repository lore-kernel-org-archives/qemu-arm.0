Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp1686415dlj;
        Mon, 13 Jan 2025 05:09:10 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUVlmT9b/r53sQ6azXp4DzArtYSPfKPA6d1FMHvRGe3W5YSsEPWwVzHwOyV2u0ro/MVTvIXZBvjyfDzag==@linaro.org
X-Google-Smtp-Source: AGHT+IHbje2DSxieRC1yV1AEEpcPoyw0NiXCZhmIqHtOM/CcC3wzZs/tfiKeFpNiZBaFAqjbiJhg
X-Received: by 2002:a05:620a:4694:b0:7b6:dfbb:3227 with SMTP id af79cd13be357-7bcd972f200mr3351694785a.10.1736773749953;
        Mon, 13 Jan 2025 05:09:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736773749; cv=pass;
        d=google.com; s=arc-20240605;
        b=kaurdo5V4d/u8FrZ2dI7QtrmzQ3ZVToqu3ST5SDRPaolUx+Ps7f/TT158zlbPuxiVl
         gF8YIxSvk3Mt8TkU52zYWy4lIKcfyZbb+tZk9Nj9CW1a77SBi6NIW85SywTeOGRmWTsk
         Jh/6Dfb7ZbZHNZpZWKUpozi6z1zzZPluJS+jwx0U2mq1bhXm0G3MvyqFfv4k0U0qWCAR
         9qzl1sbhwmlONGe9lpWKxG2vW7Zvj1Qa4WcG0sQdqeSJMCESccRapSOZh4ZvQHm1UBki
         HYuNhHv8ctKug51cY6JQaOGhVLzW3IAks86ae8rNjHHYbGhmhw2C7QjGuMoH0ijnu5dD
         cQuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=gfvgjhtb63MUQ3K26ELkvofdyT4+Dny3EGGJ4FxXttY=;
        fh=6g+XkWzQ6FxDoFGpGpDf0c5zAAOiu1xjE/i+EDDeu3M=;
        b=ATxTcc6eWU7U9alMuyx/4pRlsG5CnXBoRBdUIvgXKMkk/EgDj/GrTHLFxYO7AG0fkP
         C9Tt7cu0wsBCI8lYeNpxjyti9uNNEDQfGNYFNkHvY59ZNBzkl5QmOfLCXw0LbyIdMo7P
         inZaxHLDFben41jQtPFIw2L7SQOEJlP3FoauWTzmJxo73RPtcEwMFyLptq/nwTfnm39F
         T/ITFGi9QI0eT3h6HkKCF26kI69kN6aEug8SIYrf8u/eP8bGM/mBO+gS46bN4WdsvRwx
         BPb8z8uTfHEEHoNUiY+kH9iGnb5z0Yz3mrRk2WTHdGjAUv9M9JaFK753Qtjbak5uuIeW
         1afQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ldWIuuVj;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-474011-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-474011-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-474011-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-8623b3dce8dsi2200018241.144.2025.01.13.05.09.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 05:09:09 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-474011-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ldWIuuVj;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-474011-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-474011-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 666C71659CD
	for <alex.bennee@linaro.org>; Mon, 13 Jan 2025 13:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0125235BED;
	Mon, 13 Jan 2025 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldWIuuVj"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C83A18E361
	for <linux-kernel@vger.kernel.org>; Mon, 13 Jan 2025 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736773739; cv=none; b=WzmV3a2xs3V7y6rsjife4PbfVKcbP9/k+xIwi/rnk7BP4dWjU30hz/vYYwYOAkdr3W2R+XW3OvGnaXwTOx6//xTzqZB8ilkB47eWzfE/pxMKBA+LgnAicim7CaTIStwtMiV5dxU+wzdpifkyr9i1e+pkz0IM/lqAWDGT+8d7Fbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736773739; c=relaxed/simple;
	bh=OYVQypUzDi4Cf3qQaJDc8OvuyyGTjIUupXaEzoidN0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iL3g9b7qlJLxr8/VyCUwR/hoFjpAQps3eyUTT4LzeewyuXruRSdbUX+GZNCA3Fj5ptkhcczpzx0m4ukSOswq4lo23UCMwUqGnlfMixkqH/AiUPhOMuD7YHHZZ1E1OgBml/w3fhP+mtqzShVGg8AYD42sp7NaRZWMJPE+TtnNoDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldWIuuVj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF42EC4CEE5;
	Mon, 13 Jan 2025 13:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736773739;
	bh=OYVQypUzDi4Cf3qQaJDc8OvuyyGTjIUupXaEzoidN0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ldWIuuVjBQxlOPDc9MviWGHK6s6oV4j6kuzETMhmlpBWdK2xIyzYJ3urxSXVW99Jk
	 L0pbo9RCr2zIrXeCseylsUteYA0ByMFN0w5nhSDexQWz0utmcOTQgn9I5cRZy5FiM+
	 bSjy/TEhhgYIWgdamAaqZOEv3L4tVzRH43WSCH8wum46Duj4Z7NH93lO/BAlIr9YIV
	 sBhU12SexSMgxpD+cBJjG7B44ArxX6xPtUFy6oVinp04LBjAA13WNwoGUqpCRkd3Si
	 nN0CR9quEWXzNXeZbsoqcdI9oeFZHP/xTsCnaE44lfd+L3WnwTd8lU6veaoP2QyVx5
	 k8KZA0KE2hhfQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tXKBc-00000003Ymt-3HdW;
	Mon, 13 Jan 2025 14:08:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v4 1/5] acpi/ghes: Prepare to support multiple sources on ghes
Date: Mon, 13 Jan 2025 14:08:47 +0100
Message-ID: <20250113130854.848688-2-mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113130854.848688-1-mchehab+huawei@kernel.org>
References: <20250113130854.848688-1-mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: LVuRtoHr0vrJ

The current code is actually dependent on having just one error
structure with a single source.

As the number of sources should be arch-dependent, as it will depend on
what kind of synchronous/assynchronous notifications will exist, change
the logic to dynamically build the table.

Yet, for a proper support, we need to get the number of sources by
reading the number from the HEST table. However, bios currently doesn't
store a pointer to it.

For now just change the logic at table build time, while enforcing that
it will behave like before with a single source ID.

A future patch will add a HEST table bios pointer and change the logic
at acpi_ghes_record_errors() to dynamically use the new size.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c           | 43 ++++++++++++++++++++++++++--------------
 hw/arm/virt-acpi-build.c |  5 +++++
 include/hw/acpi/ghes.h   | 21 +++++++++++++-------
 3 files changed, 47 insertions(+), 22 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 5efa50413af3..b77e5c9d1b19 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -206,17 +206,26 @@ ghes_gen_err_data_uncorrectable_recoverable(GArray *block,
  * Initialize "etc/hardware_errors" and "etc/hardware_errors_addr" fw_cfg blobs.
  * See docs/specs/acpi_hest_ghes.rst for blobs format.
  */
-static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
+static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
+                                   int num_sources)
 {
     int i, error_status_block_offset;
 
+    /*
+     * TODO: Current version supports only one source.
+     * A further patch will drop this check, after adding a proper migration
+     * code, as, for the code to work, we need to store a bios pointer to the
+     * HEST table.
+     */
+    assert(num_sources == 1);
+
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
@@ -231,13 +240,13 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
 
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
@@ -263,10 +272,12 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
 /* Build Generic Hardware Error Source version 2 (GHESv2) */
 static void build_ghes_v2(GArray *table_data,
                           BIOSLinker *linker,
-                          enum AcpiGhesNotifyType notify,
-                          uint16_t source_id)
+                          const AcpiNotificationSourceId *notif_src,
+                          uint16_t index, int num_sources)
 {
     uint64_t address_offset;
+    const uint16_t notify = notif_src->notify;
+    const uint16_t source_id = notif_src->source_id;
 
     /*
      * Type:
@@ -297,7 +308,7 @@ static void build_ghes_v2(GArray *table_data,
                                    address_offset + GAS_ADDR_OFFSET,
                                    sizeof(uint64_t),
                                    ACPI_HW_ERROR_FW_CFG_FILE,
-                                   source_id * sizeof(uint64_t));
+                                   index * sizeof(uint64_t));
 
     /* Notification Structure */
     build_ghes_hw_error_notification(table_data, notify);
@@ -317,8 +328,7 @@ static void build_ghes_v2(GArray *table_data,
                                    address_offset + GAS_ADDR_OFFSET,
                                    sizeof(uint64_t),
                                    ACPI_HW_ERROR_FW_CFG_FILE,
-                                   (ACPI_GHES_ERROR_SOURCE_COUNT + source_id)
-                                   * sizeof(uint64_t));
+                                   (num_sources + index) * sizeof(uint64_t));
 
     /*
      * Read Ack Preserve field
@@ -333,19 +343,23 @@ static void build_ghes_v2(GArray *table_data,
 /* Build Hardware Error Source Table */
 void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
                      BIOSLinker *linker,
+                     const AcpiNotificationSourceId * const notif_source,
+                     int num_sources,
                      const char *oem_id, const char *oem_table_id)
 {
     AcpiTable table = { .sig = "HEST", .rev = 1,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
+    int i;
 
-    build_ghes_error_table(hardware_errors, linker);
+    build_ghes_error_table(hardware_errors, linker, num_sources);
 
     acpi_table_begin(&table, table_data);
 
     /* Error Source Count */
-    build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
-    build_ghes_v2(table_data, linker,
-                  ACPI_GHES_NOTIFY_SEA, ACPI_HEST_SRC_ID_SEA);
+    build_append_int_noprefix(table_data, num_sources, 4);
+    for (i = 0; i < num_sources; i++) {
+        build_ghes_v2(table_data, linker, &notif_source[i], i, num_sources);
+    }
 
     acpi_table_end(linker, &table);
 }
@@ -410,7 +424,6 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     }
     ags = &acpi_ged_state->ghes_state;
 
-    assert(ACPI_GHES_ERROR_SOURCE_COUNT == 1);
     get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
                          &cper_addr, &read_ack_register_addr);
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3ac8f8e17861..3d411787fc37 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -893,6 +893,10 @@ static void acpi_align_size(GArray *blob, unsigned align)
     g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
 }
 
+static const AcpiNotificationSourceId hest_ghes_notify[] = {
+    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
+};
+
 static
 void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 {
@@ -948,6 +952,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     if (vms->ras) {
         acpi_add_table(table_offsets, tables_blob);
         acpi_build_hest(tables_blob, tables->hardware_errors, tables->linker,
+                        hest_ghes_notify, ARRAY_SIZE(hest_ghes_notify),
                         vms->oem_id, vms->oem_table_id);
     }
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 39619a2457cb..9f0120d0d596 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -57,20 +57,27 @@ enum AcpiGhesNotifyType {
     ACPI_GHES_NOTIFY_RESERVED = 12
 };
 
-enum {
-    ACPI_HEST_SRC_ID_SEA = 0,
-    /* future ids go here */
-
-    ACPI_GHES_ERROR_SOURCE_COUNT
-};
-
 typedef struct AcpiGhesState {
     uint64_t hw_error_le;
     bool present; /* True if GHES is present at all on this board */
 } AcpiGhesState;
 
+/*
+ * ID numbers used to fill HEST source ID field
+ */
+enum AcpiGhesSourceID {
+    ACPI_HEST_SRC_ID_SYNC,
+};
+
+typedef struct AcpiNotificationSourceId {
+    enum AcpiGhesSourceID source_id;
+    enum AcpiGhesNotifyType notify;
+} AcpiNotificationSourceId;
+
 void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
                      BIOSLinker *linker,
+                     const AcpiNotificationSourceId * const notif_source,
+                     int num_sources,
                      const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
-- 
2.47.1

