Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp664222njb;
        Sat, 24 Aug 2024 20:47:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1KY+CcWYF9x7Lavmqb3SZg1gMAKyZ5DdUgn6hSZ2VdAzlgyL6p+j8JPiWJq/iHU1XjetKtD1cBjbE+g==@linaro.org
X-Google-Smtp-Source: AGHT+IE//+EAlXdK+93Q2YCLSstj0M33bIAgWn3/1iAaYXgH/bLNQ+MeH99e0+Mra4tXqnNVcn9k
X-Received: by 2002:a05:6102:6c9:b0:492:9ef9:9d1b with SMTP id ada2fe7eead31-498f46ea98fmr7911587137.22.1724557627914;
        Sat, 24 Aug 2024 20:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724557627; cv=none;
        d=google.com; s=arc-20160816;
        b=MtAxl9Q7OOXZraWiVhwLZtjz/xiSl2bll8BWo7VMvGclumsP1xTJWOMNb3l6Z63pFT
         tqxNgVvak68thoxvr6pbQ8yKDsU7D9rhubshjLZ33HPoelDHyZdwS5Sk5YgwKUSZUMxh
         6i4EE6e2EvJCMyUiVVAPIwIy3MWiN7qhgz+z7Ih63np6th/N8fJEaFimr23/o9kqKsRs
         MKZdHJDnl3dl36Mp5moUtptzPofGgzbroy5YFz3m8+noKI21Z48o8t0XgpVBOXK3doX/
         l1IsKRPR8jGfOY5V4rZkIjLpgBgcTpokN1E8QMhEYvdMhuAO976xbk41NGSl6dcrIrKu
         /tdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oRRpFXFQ6hgR+UGnh+j9tDMMPnsmSUFtJu44YeYmTiU=;
        fh=ZYXDMGsPCeoYBpXjLOhd99rrzH2TFA3IUwvQduyTi64=;
        b=lmN4jXme+PRgKU/AbR1ivgQkVpSK/YIxgieBAtw4JmYsIjEpgdl1o3WrkhTBr6L/ya
         dtCPNxxbUnXOqM6Fj549aAhYRRaxIFTb1Q9Nfho0LI20pq0GmZ5z3RtSly0zpqqSNLoF
         t3TVTNKUZz2K/147Ll81YEfWzhnto2SgysZXOLmu8DsOmAoJKTv9PNz/aoJdkRZbBaEn
         3hPDTsWAv+iiHVOkfuBM3YHgv2zlTR1bOcmadQxjWQsw7ciZR/ap0vGeX8G9OFUgZP3B
         T5y/fIEHxbbs8AY/IwAAuGSu0Lf5C1koD//gwii3k5oh5cAu0hNQ0bdo9R9Jf+xMi/dQ
         i4sA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=h5TCafEN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f45dc1esi763354985a.771.2024.08.24.20.47.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Aug 2024 20:47:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=h5TCafEN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1si4DS-0003yS-Qe; Sat, 24 Aug 2024 23:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab@kernel.org>)
 id 1si4DR-0003rT-5K; Sat, 24 Aug 2024 23:46:57 -0400
Received: from sin.source.kernel.org ([145.40.73.55])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab@kernel.org>)
 id 1si4DP-0004PW-20; Sat, 24 Aug 2024 23:46:56 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1C037CE09F8;
 Sun, 25 Aug 2024 03:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA871C4AF11;
 Sun, 25 Aug 2024 03:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724557610;
 bh=IMcNa/Jx7IKi3w4s7sj+SFfeYHLBTpL5ykjORVZs0OY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h5TCafENcP/golIfUL6Bf9MwDwukyFCqNoUJfij7v+2YhyoVHhWAQBRVNczgOcl3B
 lrUZ57tm/Ar7eQCDdaZh5WAzdPUh1nv2n2l6xPr5D6X+dh7CO8ePW8hb/IGdLsmV4f
 I/d3DXExYqgdOF67L6OLG8RPhnuNHSKt9Q62qq+rNZopjEKBDIA1ucKGP7e/ZtSX6N
 Y+aMIyWuVZvBYO+2SdHkmlBiCcNqXGZvavPMM0utX7+N+h7BeIMYAuGw7o7q1vIu5j
 Ooahbw1Lk5CJ6tzkULf+ku8c89znDi2AFeGxSKY6fmLWZavNb4vxz8JbEqMOh6cQLG
 tY0rHtB+uGSgw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab@kernel.org>) id 1si4Ch-00000001RMd-2LeB;
 Sun, 25 Aug 2024 05:46:11 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v9 03/12] acpi/ghes: rename etc/hardware_error file macros
Date: Sun, 25 Aug 2024 05:45:58 +0200
Message-ID: <866a06839420e69fa5a96ea3e0384658abb7e70a.1724556967.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1724556967.git.mchehab+huawei@kernel.org>
References: <cover.1724556967.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.73.55; envelope-from=mchehab@kernel.org;
 helo=sin.source.kernel.org
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: PV4XcbvgiCgu

Now that we have also have a file to store HEST data location,
which is part of GHES, better name the file where CPER records
are stored.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 965fb1b36587..3190eb954de4 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -28,8 +28,8 @@
 #include "hw/nvram/fw_cfg.h"
 #include "qemu/uuid.h"
 
-#define ACPI_GHES_ERRORS_FW_CFG_FILE        "etc/hardware_errors"
-#define ACPI_GHES_DATA_ADDR_FW_CFG_FILE     "etc/hardware_errors_addr"
+#define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
+#define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
 #define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
 
 /* The max size in bytes for one error block */
@@ -255,7 +255,7 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
         ACPI_GHES_MAX_RAW_DATA_LENGTH * num_sources);
 
     /* Tell guest firmware to place hardware_errors blob into RAM */
-    bios_linker_loader_alloc(linker, ACPI_GHES_ERRORS_FW_CFG_FILE,
+    bios_linker_loader_alloc(linker, ACPI_HW_ERROR_FW_CFG_FILE,
                              hardware_errors, sizeof(uint64_t), false);
 
     for (i = 0; i < num_sources; i++) {
@@ -264,8 +264,8 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
          * corresponding "Generic Error Status Block"
          */
         bios_linker_loader_add_pointer(linker,
-            ACPI_GHES_ERRORS_FW_CFG_FILE, sizeof(uint64_t) * i,
-            sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE,
+            ACPI_HW_ERROR_FW_CFG_FILE, sizeof(uint64_t) * i,
+            sizeof(uint64_t), ACPI_HW_ERROR_FW_CFG_FILE,
             error_status_block_offset + i * ACPI_GHES_MAX_RAW_DATA_LENGTH);
     }
 
@@ -273,9 +273,9 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
      * tell firmware to write hardware_errors GPA into
      * hardware_errors_addr fw_cfg, once the former has been initialized.
      */
-    bios_linker_loader_write_pointer(linker, ACPI_GHES_DATA_ADDR_FW_CFG_FILE, 0,
+    bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, 0,
                                      sizeof(uint64_t),
-                                     ACPI_GHES_ERRORS_FW_CFG_FILE, 0);
+                                     ACPI_HW_ERROR_FW_CFG_FILE, 0);
 }
 
 /* Build Generic Hardware Error Source version 2 (GHESv2) */
@@ -315,7 +315,7 @@ static void build_ghes_v2(GArray *table_data,
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
                                    address_offset + GAS_ADDR_OFFSET,
                                    sizeof(uint64_t),
-                                   ACPI_GHES_ERRORS_FW_CFG_FILE,
+                                   ACPI_HW_ERROR_FW_CFG_FILE,
                                    source_id * sizeof(uint64_t));
 
     /* Notification Structure */
@@ -335,7 +335,7 @@ static void build_ghes_v2(GArray *table_data,
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
                                    address_offset + GAS_ADDR_OFFSET,
                                    sizeof(uint64_t),
-                                   ACPI_GHES_ERRORS_FW_CFG_FILE,
+                                   ACPI_HW_ERROR_FW_CFG_FILE,
                                    (num_sources + source_id) *
                                    sizeof(uint64_t));
 
@@ -389,11 +389,11 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
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
 
     fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
-- 
2.46.0

