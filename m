Received: by 2002:a05:7022:fe04:b0:85:21:bd5b with SMTP id vc4csp987230dlb;
        Thu, 1 Aug 2024 07:47:28 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUaaHqHkZkbPTppw3OkX4fsBvOXstNbHrMOChKZAsF1E08Tg+LRpmxoU+eHXqPWH7v5435ld+hxxPW94VbicIv+sLL+n0a4
X-Google-Smtp-Source: AGHT+IHmqZhf4hI6yi63J39d6Y5r+YGtISz+M8gZvQaU/Atwy/liUlcAqodznL9MBgOWP8fQLg9R
X-Received: by 2002:a05:6871:582b:b0:254:8f8b:719b with SMTP id 586e51a60fabf-26891e929e1mr421997fac.37.1722523648568;
        Thu, 01 Aug 2024 07:47:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722523648; cv=pass;
        d=google.com; s=arc-20160816;
        b=nbKXe6l3LGNr7rt8G3+z4ROL05xpNnHB+OnoYbTqwR5OjfTFPfk5JQgqDkGnKv996/
         u4nWXkpj6VIN9JngTurqayFbaBOnYxTu/Y78ESM9+AWol/joD1tswKNzupGwtMQuq6cC
         icykwfG7S1BjZUFR+3eNP4ztekEZv2lx9BfzupUrr0l4TJ2Sl4ZZev4AZr+pWQjA8hEO
         wMN5oPqS4k69fBEFZxpIkxb/KuFYIp5TEpM/Y2bmN6g++FAV7yiQUoTNnrWlBEy6cxBk
         LEEqaSx1IVENbAnBV38bACCiX+f2PUelRjetbLQ5g6EXkFZsjF6ibp0eBbSFJ1C8ebba
         ErBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=G6G5bcuy9xPoP31mqGnxq/0QLaL4iNEMOlZdgvbtM5Q=;
        fh=/A1Jk9ewZ81/NwMlhJJbmsFJMBNnZp0hdN4unxYVqf0=;
        b=G0INf+WLycxX8ZEIdW6SmPHGracsmZhJvdcxl3jD8OL4YK9FniVMxHJNxu/i0n5a/g
         sI3JQNh6zPIoOg1mDAS1FyEWWYNgdQ7khP06JNAn2iLU0FlNDiMTwPjCRDyiGTTHGs3H
         r7Hs0Cbth/p6HuvzpM0DTnP5w4O4N7NBg+bgmjT+V53ksRkNXZDOXAH8p2ZqD6gjFWr/
         5ci7L7pa4So4useqdtLCPUtaIr3d1L37H39i8b5t0VrHBHRGGGHIZkWawg5lX4nsgz31
         fE/vUIegN7VdX95/2BNbXxGgV1sccXmbUO5sFkWfX6WHXpJt5tyVLT4soVWmIHA9RSBC
         0Lrg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=eRSBm+NA;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-271452-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-271452-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-271452-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7a9f8b305d2si17258090a12.567.2024.08.01.07.47.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 07:47:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-271452-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=eRSBm+NA;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-271452-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-271452-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47C90B231D3
	for <alex.bennee@linaro.org>; Thu,  1 Aug 2024 14:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566C71A7F79;
	Thu,  1 Aug 2024 14:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRSBm+NA"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E531A6177
	for <linux-kernel@vger.kernel.org>; Thu,  1 Aug 2024 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722523638; cv=none; b=A/lBzDgNV0+L28bVzPvGMYMGwmAlUgcu/mV7w0QX8RB6SBig9V72vDV7ygp+p02TfptM3VYrnWItQwkMsJm1MYRfyT27NNdXnvKLaJ+DmmXdp8/PpL4sdom2wYNBRScOnCMn2rVzClfNobwtzoXJDEVE6l+0Dhhk23gyhqjJ0v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722523638; c=relaxed/simple;
	bh=5vVNmeoIiLhqMUtCAtu3KNbQH6/d3NxIciD+hVX1/nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cn8E/46wkb8iGWXmUQC7Y7ZnmnGibDl75DRoTGZTcn0q1RyvWvHJLfrHYkWqy5wnR/mBe5pAy7C4Qs8DJrVBzBE+n01EEPjb1P3j+R3ZPjj6XKejBaibFCmpRbTkcTjoqV8wLatLt1vQGpBfSPDqtQSDXTDr71Yv7e7SaGhyopM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRSBm+NA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950D2C4AF09;
	Thu,  1 Aug 2024 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722523637;
	bh=5vVNmeoIiLhqMUtCAtu3KNbQH6/d3NxIciD+hVX1/nw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eRSBm+NAXOrW9hy/RU2Ph9A51tXaCswQEYzguoqvdTJQ2MhrkAXvc2ZTKxUz00/mQ
	 SMqJtsNw11FpnALX4FgRTXHXNk97s0RJRqsEgB/VS3pazRCVxSmn9p/IK72ubXAqkn
	 7WZlm7XPzJ/HKeY3I2U9YDrIcRDJrXhwE8BNMtnqE4owoLbFdrgzyf3Mei1fPj+PPv
	 X/o9DHX/5nzHuXsral6sd+zl9sE4JMpN8b0PJO5ODrnHBe+T1LbOKG8ZEKs/fB1Itm
	 8z3vwcwQoEA3EkthtAh5KWfome5+iUm6oIgfO1RQV/5ik1ao9QPQpTJ/xZRju/YqRq
	 wENWc4b2mbqQg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1sZX5H-00000001WCn-3My4;
	Thu, 01 Aug 2024 16:47:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 6/7] acpi/ghes: add support for generic error injection via QAPI
Date: Thu,  1 Aug 2024 16:47:09 +0200
Message-ID: <cf3cb36aca6eb9050ffc0b245768f5152fe69733.1722523312.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722523312.git.mchehab+huawei@kernel.org>
References: <cover.1722523312.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: CXY/U+pTY9PF

Provide a generic interface for error injection via GHESv2.

This patch is co-authored:
    - original ghes logic to inject a simple ARM record by Shiju Jose;
    - generic logic to handle block addresses by Jonathan Cameron;
    - generic GHESv2 error inject by Mauro Carvalho Chehab;

Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Co-authored-by: Shiju Jose <shiju.jose@huawei.com>
Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Shiju Jose <shiju.jose@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c         | 159 ++++++++++++++++++++++++++++++++++++++---
 hw/acpi/ghes_cper.c    |   2 +-
 include/hw/acpi/ghes.h |   2 +
 3 files changed, 151 insertions(+), 12 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a745dcc7be5e..f5a05f4cb81d 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -395,23 +395,22 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     ags->present = true;
 }
 
+static uint64_t ghes_get_state_start_address(void)
+{
+    AcpiGedState *acpi_ged_state =
+        ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED, NULL));
+    AcpiGhesState *ags = &acpi_ged_state->ghes_state;
+
+    return le64_to_cpu(ags->ghes_addr_le);
+}
+
 int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
 {
     uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
-    uint64_t start_addr;
+    uint64_t start_addr = ghes_get_state_start_address();
     bool ret = -1;
-    AcpiGedState *acpi_ged_state;
-    AcpiGhesState *ags;
-
     assert(source_id < ACPI_HEST_SRC_ID_RESERVED);
 
-    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
-                                                       NULL));
-    g_assert(acpi_ged_state);
-    ags = &acpi_ged_state->ghes_state;
-
-    start_addr = le64_to_cpu(ags->ghes_addr_le);
-
     if (physical_address) {
         start_addr += source_id * sizeof(uint64_t);
 
@@ -448,9 +447,147 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
     return ret;
 }
 
+/*
+ * Error register block data layout
+ *
+ * | +---------------------+ ges.ghes_addr_le
+ * | |error_block_address0 |
+ * | +---------------------+
+ * | |error_block_address1 |
+ * | +---------------------+ --+--
+ * | |    .............    | GHES_ADDRESS_SIZE
+ * | +---------------------+ --+--
+ * | |error_block_addressN |
+ * | +---------------------+
+ * | | read_ack0           |
+ * | +---------------------+ --+--
+ * | | read_ack1           | GHES_ADDRESS_SIZE
+ * | +---------------------+ --+--
+ * | |   .............     |
+ * | +---------------------+
+ * | | read_ackN           |
+ * | +---------------------+ --+--
+ * | |      CPER           |   |
+ * | |      ....           | GHES_MAX_RAW_DATA_LENGT
+ * | |      CPER           |   |
+ * | +---------------------+ --+--
+ * | |    ..........       |
+ * | +---------------------+
+ * | |      CPER           |
+ * | |      ....           |
+ * | |      CPER           |
+ * | +---------------------+
+ */
+
+/* Map from uint32_t notify to entry offset in GHES */
+static const uint8_t error_source_to_index[] = { 0xff, 0xff, 0xff, 0xff,
+                                                 0xff, 0xff, 0xff, 1, 0};
+
+static bool ghes_get_addr(uint32_t notify, uint64_t *error_block_addr,
+                          uint64_t *read_ack_addr)
+{
+    uint64_t base;
+
+    if (notify >= ACPI_GHES_NOTIFY_RESERVED) {
+        return false;
+    }
+
+    /* Find and check the source id for this new CPER */
+    if (error_source_to_index[notify] == 0xff) {
+        return false;
+    }
+
+    base = ghes_get_state_start_address();
+
+    *read_ack_addr = base +
+        ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t) +
+        error_source_to_index[notify] * sizeof(uint64_t);
+
+    /* Could also be read back from the error_block_address register */
+    *error_block_addr = base +
+        ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t) +
+        ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t) +
+        error_source_to_index[notify] * ACPI_GHES_MAX_RAW_DATA_LENGTH;
+
+    return true;
+}
+
 NotifierList generic_error_notifiers =
     NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
 
+void ghes_record_cper_errors(AcpiGhesCper *cper, uint32_t notify)
+{
+    int read_ack = 0;
+    uint32_t i;
+    uint64_t read_ack_addr = 0;
+    uint64_t error_block_addr = 0;
+    uint32_t data_length;
+    GArray *block;
+
+    if (!ghes_get_addr(notify, &error_block_addr, &read_ack_addr)) {
+        error_report("GHES: Invalid error block/ack address(es)");
+        return;
+    }
+
+    cpu_physical_memory_read(read_ack_addr,
+                             &read_ack, sizeof(uint64_t));
+
+    /* zero means OSPM does not acknowledge the error */
+    if (!read_ack) {
+        error_report("Last time OSPM does not acknowledge the error,"
+                     " record CPER failed this time, set the ack value to"
+                     " avoid blocking next time CPER record! exit");
+        read_ack = 1;
+        cpu_physical_memory_write(read_ack_addr,
+                                  &read_ack, sizeof(uint64_t));
+        return;
+    }
+
+    read_ack = cpu_to_le64(0);
+    cpu_physical_memory_write(read_ack_addr,
+                              &read_ack, sizeof(uint64_t));
+
+    /* Build CPER record */
+
+    /*
+     * Invalid fru id: ACPI 4.0: 17.3.2.6.1 Generic Error Data,
+     * Table 17-13 Generic Error Data Entry
+     */
+    QemuUUID fru_id = {};
+
+    block = g_array_new(false, true /* clear */, 1);
+    data_length = ACPI_GHES_DATA_LENGTH + cper->data_len;
+
+    /*
+        * It should not run out of the preallocated memory if
+        * adding a new generic error data entry
+        */
+    assert((data_length + ACPI_GHES_GESB_SIZE) <=
+            ACPI_GHES_MAX_RAW_DATA_LENGTH);
+
+    /* Build the new generic error status block header */
+    acpi_ghes_generic_error_status(block, ACPI_GEBS_UNCORRECTABLE,
+                                    0, 0, data_length,
+                                    ACPI_CPER_SEV_RECOVERABLE);
+
+    /* Build this new generic error data entry header */
+    acpi_ghes_generic_error_data(block, cper->uuid,
+                                ACPI_CPER_SEV_RECOVERABLE, 0, 0,
+                                cper->data_len, fru_id, 0);
+
+    /* Add CPER data */
+    for (i = 0; i < cper->data_len; i++) {
+        build_append_int_noprefix(block, cper->data[i], 1);
+    }
+
+    /* Write the generic error data entry into guest memory */
+    cpu_physical_memory_write(error_block_addr, block->data, block->len);
+
+    g_array_free(block, true);
+
+    notifier_list_notify(&generic_error_notifiers, NULL);
+}
+
 bool acpi_ghes_present(void)
 {
     AcpiGedState *acpi_ged_state;
diff --git a/hw/acpi/ghes_cper.c b/hw/acpi/ghes_cper.c
index 0d32874a84f1..504ba43ad0cc 100644
--- a/hw/acpi/ghes_cper.c
+++ b/hw/acpi/ghes_cper.c
@@ -47,7 +47,7 @@ void qmp_ghes_cper(CommonPlatformErrorRecord *qmp_cper,
         cper.data[i] = p->value;
     }
 
-    /* TODO: call a function at ghes */
+    ghes_record_cper_errors(&cper, ACPI_GHES_NOTIFY_GPIO);
 
     g_free(cper.data);
 }
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 02ea3715f655..a426c47f2b96 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -84,6 +84,8 @@ typedef struct AcpiGhesCper {
     uint32_t data_len;
 } AcpiGhesCper;
 
+void ghes_record_cper_errors(AcpiGhesCper *cper, uint32_t notify);
+
 /**
  * acpi_ghes_present: Report whether ACPI GHES table is present
  *
-- 
2.45.2

