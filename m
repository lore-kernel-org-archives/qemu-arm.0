Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1014176njb;
        Fri, 6 Dec 2024 09:22:59 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUVIq3T7ZsSu+zV6eEuI4ELM90VeozAgsaxBIPqNgHdcYzZyLCZVBHnqnCT0oViQkTs1bLVsYSj10/QMQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH+EjHfyD6Ret8MtGVRQfb/Timf7RS9QdzqZpR/geY209jAogR31GVGK75crZA5cYUfSkCZ
X-Received: by 2002:a05:6830:2aa2:b0:71d:4cdf:e694 with SMTP id 46e09a7af769-71dceafb210mr2300249a34.0.1733505779090;
        Fri, 06 Dec 2024 09:22:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733505779; cv=pass;
        d=google.com; s=arc-20240605;
        b=LOynaf5Bo4+9gS+KF6qWUZHE0bJp2Bk7gHk2Bb1xXRoQcFRmRPT9paxI2dbE6KfR0u
         J8CVeUghaw63UjJM5Jn4oHgIIqm3UaJHGXCZYamclJxZD8VlCZiqxmMPM+aMoXzost7+
         NF6aRGOFa7lrzWSAuRvHNzYbPPdpfwt8g8/vd/r1wxt39yIhVlkfzgIYvDcwRR1/RaGf
         dcpaxZ3uhPgawQBC8Omhcl8XghUl7JwuFWFfQ1mH+9gnGr1ZwBuT9qx2OQdwdJlLnasD
         VZn689G+6ANYm4/M7ajVk9bli6Aqqj0wlb6fBEHwPQ0cfSkDEuA7etKovi3UpBsSHHzI
         CNhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=wHUc8gDp5Zlc1vMQzSFZquDMV5oIb3RZY7YCXuwPWHU=;
        fh=Kq/R1e6yZPuelBmLbbERi3vQ2o/iUtEjbHYXqk4Pt/c=;
        b=ScVityM4qFlqFR2h7flMkQAo5NtqI6pU5aQXWuBwS0ehyPzOG7qYWcZ3b+gxSPZzB0
         KgOesAs1JB9gm58RyT1CG+dBho5I8F2pexRM0dLk9in+2tU7+L2NmA7BVYHpCa1JTC12
         gbkk0GUl752K+1g7HRUZ7iXuL81wWkBZ6r0Yip2XMFLj0t6QVAJlUaiaKXJALVlt9d7B
         4kidex3Nf/9rGyc+olL/I96c4RU75sLNm1WSFr0INhMnVjXqkZL+MgwmyX8YT11RA3TP
         baxhm5BPDRl0PIJ9IcdZo/FaibwcP2nsWRxmAAmB3QbF8vVKl+TnKi47ghugopCbJOGZ
         wTDQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=vNcRfhMf;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435394-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435394-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435394-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 46e09a7af769-71dc4a3e916si2393627a34.217.2024.12.06.09.22.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:22:59 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435394-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=vNcRfhMf;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435394-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435394-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C1352877F2
	for <alex.bennee@linaro.org>; Fri,  6 Dec 2024 17:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0F021B189;
	Fri,  6 Dec 2024 17:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vNcRfhMf"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376C2204561
	for <linux-kernel@vger.kernel.org>; Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733505688; cv=none; b=jfH+cZ5n6IpeurYEeh3SF5EF5teNJcqA++c3dZCrEvLbzq6q4kzUqrrCep9pmuPr6SKukiw/M8860+Aw5JE6B2KbV9X3oLYqklV/evhyvtfpRjuMJxEL0Vcd+d8vLCGXraXwD7qbNl6axwI+EJfNYchVPCy0BsR4FV9708CCkHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733505688; c=relaxed/simple;
	bh=zBOGmzobFvp2lIQ7+789CjkQz81YRefZttUO1zNdg+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X1aL1t9onq3EjbE9kdioasPS4oEKVCd03ZGb26ELHYJJPtbdjRn30Tb6icR8YdNoOMdXp+9ZtGzLuGVsR9vOpj+Y4oGLaluUP+WtqmCVcsncrh92InPQBAASZjd3NDFYVc1r+uWi13pOLBIvB0T5VDeqO2MHKjC+TPK9SZI8tro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vNcRfhMf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92AB3C4CEEB;
	Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733505687;
	bh=zBOGmzobFvp2lIQ7+789CjkQz81YRefZttUO1zNdg+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vNcRfhMfoC3UWsfUiWmjfDSEQx0t15+NAxEe9LMZA4kbDJqoyHuObqRN+BGe32n4f
	 dV0E5qB8uRml8oXIDgCg+3ITkB9Nm+w2gQz5skJ9kurCTtZmSjewL37LnvNBuqyb5G
	 89F8mWjpwdSfPCDjd0QVmY7TBpfF8zeTivAHbLWMRj1zQhS2TbJc3u6JaHlIsb06KW
	 cXyk3d/IYoBLWhjRzY1PD4VGmJUz8mVRUepQWUWFKqIgbsSHY+yg7oxvq3Y8kwStY4
	 jbvHal/LCWNSE9jScM7GXawFFy1/LUeO53zvznvBWqtCg86AGvsPIwK1c+tu0HXX/f
	 aySzp0gEK5oBA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJc17-00000005RKQ-3aAe;
	Fri, 06 Dec 2024 18:21:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/31] acpi/ghes: Prepare to support multiple sources on ghes
Date: Fri,  6 Dec 2024 18:12:36 +0100
Message-ID: <eaa697a854e9e23de0b8e46ee3ac7495668f026d.1733504943.git.mchehab+huawei@kernel.org>
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
X-TUID: KrNWadopE9Ps

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
index e059317b002e..bd5582bc75f8 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -889,6 +889,10 @@ static void acpi_align_size(GArray *blob, unsigned align)
     g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
 }
 
+static const AcpiNotificationSourceId hest_ghes_notify[] = {
+    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
+};
+
 static
 void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 {
@@ -944,6 +948,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
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

