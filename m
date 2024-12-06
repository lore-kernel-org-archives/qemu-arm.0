Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1013370njb;
        Fri, 6 Dec 2024 09:21:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXuTTcf/fm/KNQWvoenQWBUf9OaMAYRZJg9MwVYUxdCf0ze6DCmMQG6zoOna1i0+JWgnvnMtXPFmXPhEA==@linaro.org
X-Google-Smtp-Source: AGHT+IGUuudf9IfO6E4/Y6ficXdR7w9ji7zIbtlMmFArXTYn5im78nHDyDSJS2QNxqXaSiFX4NwT
X-Received: by 2002:ac8:7d48:0:b0:466:a3f9:f8ab with SMTP id d75a77b69052e-46734cb4118mr59279391cf.12.1733505707398;
        Fri, 06 Dec 2024 09:21:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733505707; cv=none;
        d=google.com; s=arc-20240605;
        b=Q/ZZUocl4+7ulLSn1feg31W/ZEOXwnIPvbH6JHV4gyCeOE8YxGKxaReewOxOYamXKT
         6+7qutyn2JV/QR58obZICvpXnWCDI8hiV8TxJIzy8i/3ZWhbz0ZZSycYEKr9+GarHb9n
         JPo7oAswbkhHjwHqRFbpS5mzjsLW2WVE+vE3KVvqxXr4f/HP/eBocPeTk4UmU7pRU2WJ
         3LxdvOOsn+ETtWYRiHDkhQR6zQYrbOC7Frih1iXqQwpe4lti39UEYpxRHvPhvsB/HfFE
         MYMtPc70oEFrSxo7SiPS5NdLnZzLtF/biS/tGpLLfAOs9TrkzKn7nbDwxmZJ8zl6CgeS
         BOEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=09/aZuAnUh9aFb3741TW2a8ZuQEoMj6jlL77dP9fLhU=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=BUw8qWpBKv4Qnm6YNx8VRTgOOLejqvXouX/dhbs0xu06tA01nFTgvalhaW3WIFUQJ0
         icD1D/gz6bbN0uj/QeAscfYy12drlCHmLZxWO775QbbIWXwW7hoRRJ80jV3un2yVTwbU
         U6Kmgu9G3xS3LIG4jkwiGUAqHLOYgGmR6Z8X+nX2kE+ay5v9ArZL/I9sg8HGGLkTF/uc
         wWgNSQ+3JPm0X36+49dVabVtFdo0CuvNsTTjbUh+hHASv2o6jQwxxEbiPS/ygwdFqP5D
         PXW0zCKo7qhEJ9qv0btAUBzvlA5drWO5xDOG2SU+X1RDKV5M3Lyhqr9WdthK/XoSyWcX
         3ROw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Az4PvQf5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467297f80b0si46015401cf.367.2024.12.06.09.21.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 09:21:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Az4PvQf5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJc1S-0004GP-Q5; Fri, 06 Dec 2024 12:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc1L-00043j-VR; Fri, 06 Dec 2024 12:21:40 -0500
Received: from nyc.source.kernel.org ([147.75.193.91])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc1J-0000uu-8T; Fri, 06 Dec 2024 12:21:39 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 49984A443B8;
 Fri,  6 Dec 2024 17:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA3CC4CEF1;
 Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733505687;
 bh=er2E7uTLlujIsFePhTmXIu236pd9wB9P2GkaIjEE/Vc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Az4PvQf5z6o4c4kCG/+EirRQhEa7/X4gsITbf3DX80llVBSpeo8T68D0FB5ldmGOr
 hZ/LrmENNciDqSxQcs8B84G3FzGraY3iaezyQj62wLmjUJ8HVBYqh4RZgrMUlirt3/
 D+eWLla2FB5a83FhdfZMvwOVy6FWy4HcS4XP9b7nztZxHri657txv7LSMTcsP4BcnL
 T5iV7XTTc2Vj7BbBJpLpu+zubHf6qwFa0WFDlIYw1eALYO74LCEPpcxOYH96ZzXJSW
 DoAXNH31GpF+D75wudtQB0QQFHgIQs4jpP9EVkwgurcUG+ILzCuqhwPPWFoDeKtqTM
 bhjfmBBlna5tA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc17-00000005RKI-3L7S; Fri, 06 Dec 2024 18:21:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 12/31] acpi/ghes: rename etc/hardware_error file macros
Date: Fri,  6 Dec 2024 18:12:34 +0100
Message-ID: <cf5b3f343d35fa6477b5287d4263c4d3991bb8d4.1733504943.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733504943.git.mchehab+huawei@kernel.org>
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=147.75.193.91;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: RPGt61fJax+Z

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

