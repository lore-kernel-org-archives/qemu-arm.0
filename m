Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1378548njb;
        Sat, 7 Dec 2024 00:58:03 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWly3dbcT5/oR3hyk4GZMg8QzQhDrdLom/8g+24DGJQJtjh23zOFEdJYqNuirApnl2gyvJX5ub07NvPvA==@linaro.org
X-Google-Smtp-Source: AGHT+IG/VzSqcoOMAqmhAuX+O81dzj4CWFNT9g7t498jXyPy3PQFwA+jZ1BP9JyvGEPkgp7N0bHj
X-Received: by 2002:a05:6402:40c3:b0:5d0:c67e:e263 with SMTP id 4fb4d7f45d1cf-5d3be678280mr4904074a12.8.1733561883159;
        Sat, 07 Dec 2024 00:58:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733561883; cv=pass;
        d=google.com; s=arc-20240605;
        b=TaQ5ZzOZMnEh4oh2rHXa8pwtHjXc4eDgypzl+zZFiyykYq+520oVtt3oj65RNma0et
         Cd10/BsPpU/7IH8p7OTB7Cxazg9ErxgutrwcuIy38KDFTceKpcumWSkNQW+TbspzDL06
         LKhRwT0LYS8Aues+ZQjryjtZk78/fdouEgIaK6ZhVfRTfvnZ4SbDDqAkEv3+cH1/QY7Q
         GAAyRiYenjcxRL8H3pbcLOE2nTWzIjCXMkSahJWLUU5kx0+bCd41zAd8/RZKgFkREpBa
         I7s1YZKngGkn25wX1AteNFZ0MkB1rdyM+EyiB6U+h8kEclF55ljsNKBZU+BwLiql9u/O
         ozFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=09/aZuAnUh9aFb3741TW2a8ZuQEoMj6jlL77dP9fLhU=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=ANL2j0iX16AlvRBfgq7ara5sdV0EcFznGTL09mIz07q54TTiFhzeOKffXMQL7JSSQZ
         J/X5WpuaYTF/czg55AAkncFNsN02e3sLurOhPCBJWQ0kwhOWvTG4wWASrf71DiKvDQZb
         5azZmLiqTTeRfmOCWnG+TOvhVlfWZZJXCD9lvPhozVvu+jqwdfBdhp8njjgOnhyUb7dR
         yjc9qPy458aIx0tz/xV5Yshxk4tTF1t9yuIKHvRE+QC/p9v4ALLj/y+fyjHWTHjLifxY
         WvX4L6iTJczWT19+Q8CfzL0PHWNzlqaOFBtzyW6Her0WU2wq4ngzCsAHwVqGllhyH0Tm
         dNNw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=IJV9brqA;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435968-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435968-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435968-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5d14c7c6ec2si3724277a12.250.2024.12.07.00.58.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 00:58:03 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435968-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=IJV9brqA;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435968-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435968-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 222E31884167
	for <alex.bennee@linaro.org>; Sat,  7 Dec 2024 08:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2482514F9CC;
	Sat,  7 Dec 2024 08:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJV9brqA"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9644213E8AE
	for <linux-kernel@vger.kernel.org>; Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733561805; cv=none; b=QzLtPu0R1JykpjKApJTQFyEtAit+rnzndQqPZClcuwrKf9tq/d4dR8IW4SrTohLSbE+U0u5HDruN1GkWDO5Yc73LKFAyS2nKF0fNdTFwRzwPqboB0u1WqZfLpwX2psjS5RA42yKf/I4C3sMjvlj1NgFZt1ANxYMzfo5scJ/saxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733561805; c=relaxed/simple;
	bh=er2E7uTLlujIsFePhTmXIu236pd9wB9P2GkaIjEE/Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oAX210V5HidO3YIdKIpPoNbKIYteZ4qNBihD1T39taHfu1CyJrn5WSv3B1RZ+BeQ3irknrycCLa/TNBjMAO0asTVZONmPqyLeOQE/LTxkPt89VuxcTBKm8AlFeV7A3+rH6xMi/d7abzVv3TnmqLfwEiGGe7zIbIyNuk7aFBJCUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJV9brqA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3A8C4CEE9;
	Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733561805;
	bh=er2E7uTLlujIsFePhTmXIu236pd9wB9P2GkaIjEE/Vc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IJV9brqAmsq1klILgWPVuVo74lJekKqAntx7ov2mwa53oYIVFVKv9zjsjdfd29M3f
	 BjdNKVG3vJpPnVhW4qAGKetH51HL+ZLZxp6fEt5D1UkKmcsTe2E5bcQfX1gdapcjCc
	 eL8jks27meZhdOFUNIcZtpqQlJOw/GqHRQvoOEoIBQDuGwR4jJ2tnbgRpHMJG4wVw3
	 NoHixiWRH6/OLCLikCEpJcTQAJiw5G+hkQoV4WyxyH3cdNgKAPGP3xHJ6C+DTH4qwu
	 /dEELyZxC1ApgIFk/jxn7m6e5SKyyM3N/wCdg2rsctNEbiC6q8PXW+dQaoB3JQVhC1
	 YDBK/4j6DZE0Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJqcF-00000005j5G-0yeh;
	Sat, 07 Dec 2024 09:56:43 +0100
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
Subject: [PATCH v6 12/16] acpi/ghes: rename etc/hardware_error file macros
Date: Sat,  7 Dec 2024 09:54:18 +0100
Message-ID: <c470330293c0cf8cfca0210ca3d74f08ef11a11f.1733561462.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733561462.git.mchehab+huawei@kernel.org>
References: <cover.1733561462.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: rxhpR3LC2g3W

Now that we have also have a file to store HEST data location,
which is part of GHES, better name the file where CPER records
are stored.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 2df5ddf68a13..52c2b69d3664 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -28,8 +28,8 @@
 #include "hw/nvram/fw_cfg.h"
 #include "qemu/uuid.h"
 
-#define ACPI_GHES_ERRORS_FW_CFG_FILE        "etc/hardware_errors"
-#define ACPI_GHES_DATA_ADDR_FW_CFG_FILE     "etc/hardware_errors_addr"
+#define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
+#define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
 
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
@@ -234,7 +234,7 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
         ACPI_GHES_MAX_RAW_DATA_LENGTH * ACPI_GHES_ERROR_SOURCE_COUNT);
 
     /* Tell guest firmware to place hardware_errors blob into RAM */
-    bios_linker_loader_alloc(linker, ACPI_GHES_ERRORS_FW_CFG_FILE,
+    bios_linker_loader_alloc(linker, ACPI_HW_ERROR_FW_CFG_FILE,
                              hardware_errors, sizeof(uint64_t), false);
 
     for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
@@ -243,17 +243,21 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
          * corresponding "Generic Error Status Block"
          */
         bios_linker_loader_add_pointer(linker,
-            ACPI_GHES_ERRORS_FW_CFG_FILE, sizeof(uint64_t) * i,
-            sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE,
-            error_status_block_offset + i * ACPI_GHES_MAX_RAW_DATA_LENGTH);
+                                       ACPI_HW_ERROR_FW_CFG_FILE,
+                                       sizeof(uint64_t) * i,
+                                       sizeof(uint64_t),
+                                       ACPI_HW_ERROR_FW_CFG_FILE,
+                                       error_status_block_offset +
+                                       i * ACPI_GHES_MAX_RAW_DATA_LENGTH);
     }
 
     /*
      * tell firmware to write hardware_errors GPA into
      * hardware_errors_addr fw_cfg, once the former has been initialized.
      */
-    bios_linker_loader_write_pointer(linker, ACPI_GHES_DATA_ADDR_FW_CFG_FILE,
-        0, sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE, 0);
+    bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, 0,
+                                     sizeof(uint64_t),
+                                     ACPI_HW_ERROR_FW_CFG_FILE, 0);
 }
 
 /* Build Generic Hardware Error Source version 2 (GHESv2) */
@@ -290,8 +294,10 @@ static void build_ghes_v2(GArray *table_data,
     build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0x40, 0,
                      4 /* QWord access */, 0);
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
-        address_offset + GAS_ADDR_OFFSET, sizeof(uint64_t),
-        ACPI_GHES_ERRORS_FW_CFG_FILE, source_id * sizeof(uint64_t));
+                                   address_offset + GAS_ADDR_OFFSET,
+                                   sizeof(uint64_t),
+                                   ACPI_HW_ERROR_FW_CFG_FILE,
+                                   source_id * sizeof(uint64_t));
 
     /* Notification Structure */
     build_ghes_hw_error_notification(table_data, notify);
@@ -308,9 +314,11 @@ static void build_ghes_v2(GArray *table_data,
     build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0x40, 0,
                      4 /* QWord access */, 0);
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
-        address_offset + GAS_ADDR_OFFSET,
-        sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE,
-        (ACPI_GHES_ERROR_SOURCE_COUNT + source_id) * sizeof(uint64_t));
+                                   address_offset + GAS_ADDR_OFFSET,
+                                   sizeof(uint64_t),
+                                   ACPI_HW_ERROR_FW_CFG_FILE,
+                                   (ACPI_GHES_ERROR_SOURCE_COUNT + source_id)
+                                   * sizeof(uint64_t));
 
     /*
      * Read Ack Preserve field
@@ -346,11 +354,11 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
                           GArray *hardware_error)
 {
     /* Create a read-only fw_cfg file for GHES */
-    fw_cfg_add_file(s, ACPI_GHES_ERRORS_FW_CFG_FILE, hardware_error->data,
+    fw_cfg_add_file(s, ACPI_HW_ERROR_FW_CFG_FILE, hardware_error->data,
                     hardware_error->len);
 
     /* Create a read-write fw_cfg file for Address */
-    fw_cfg_add_file_callback(s, ACPI_GHES_DATA_ADDR_FW_CFG_FILE, NULL, NULL,
+    fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
         NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
 
     ags->present = true;
-- 
2.47.1

