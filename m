Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7224081njc;
        Tue, 12 Nov 2024 02:16:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWiBiL5KIapcD1sWKZaM7ahTLsowAaS/9hfarloG1bhDXePet8XLO1HX5t7Wi5/wlR/BaTy0OSOZ5uNFA==@linaro.org
X-Google-Smtp-Source: AGHT+IG49tooe9fobKTLv12SmN+lqYGaBS9WeWEwtCPTpc/RAR6pi5ZEEYmyK1hHZ8kEoJ/yZmlk
X-Received: by 2002:ac8:730c:0:b0:463:1677:c05 with SMTP id d75a77b69052e-46316770d81mr134268791cf.54.1731406587151;
        Tue, 12 Nov 2024 02:16:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731406587; cv=none;
        d=google.com; s=arc-20240605;
        b=HffqpWD5BgWffJ/Hlu8MiJk9+Z+sVF9JxENBEekFGLYl/ym7qAylO1kqtlG7riw95J
         nY4Ni7iclpoOwPMRcTqlaWQlwAyqiGNOa6QCLjeM8sfBqb63L0rZn/mVvgMRCcwkIu1d
         Xe99ygMR1kxEb1bN/K9Kna+N2Mym39hL05JVZsP8vUZ6IY1OTguH1QfvsvVLb1WpWaqp
         40611K18R/TxRg/8gpyTDV1zlN5SwW2VrfjgWGCQm+kDqrdo2pCuSIt57k9j8Q4yXQjC
         MyyL04CBVDl52eSfZd9y8fUZ3yLQY8gcUOxkQVLfrOFg7K/uOnYJLaLVeTzAz6b7xrHp
         Z4Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Jtjfg8K8yhjvsoahO8zH1ORRgGJRrLyiMGLU9JHFp94=;
        fh=Gv5C9dyTti48UiwDFihARak0O4X62EqE0FGenSCqeuk=;
        b=PSmPEKrz1JfFUhJ6iDZVRpO/5VY3B5NhqekZkKbtUNCLPY3pZXmAYYgUy8yofgKq7A
         6Q53iF/SuJ3/TVH0uoCmaflilc/qN2smoGpMb92zpNbtW+xaG72s79CB67dsBbHio18H
         Bu6JUOkrmW689JYu7AvV2YgF+2OJyiWsvoiAVfEHXGubyQ71UfiEi4X1HKZET66iSJdb
         QdxF2+yYfH/WGMPR6mFfIGDakkjSTjYx/BcSdA6DDWfuBoifrl9kwDX8MUv8d5PpeIUc
         xuW//yd10BkVHSNKqBvFTtJzvCyoopJZsyZnQmMknXDIqDWtHAmPY0C6zGtZ8xfXnXME
         n4Ag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="GRPIH/Ff";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff61afa6si136909001cf.414.2024.11.12.02.16.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 02:16:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="GRPIH/Ff";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tAnvv-0004hn-RO; Tue, 12 Nov 2024 05:15:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvi-0004ZC-P7; Tue, 12 Nov 2024 05:15:27 -0500
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvg-0008Rs-Kp; Tue, 12 Nov 2024 05:15:26 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B35C0A4188B;
 Tue, 12 Nov 2024 10:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02786C4CEE3;
 Tue, 12 Nov 2024 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731406510;
 bh=BAIrfONVknkmj4qoXvrO8lvnEuBSNbh9qzzbtdJrOyE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GRPIH/FfbT/6s+IPzzKLenRuBqbnJgncYIoRQyT8YxJ8na2UzAAzf27LlL6KDSOrx
 +XOir3tKxn3UJBCHQF+oG6zXcISkkGDGHWAGytVp17R7qH9/Z4PJHC1hzFhW9QtVe8
 LHQF/A7d21Y+RRXTHOWVBJl0hitkEvXRT6kcpZYpfhqLyxz3etTWLgRiH1Qb2tABYr
 X7lLuKrLH84ZBddrrCcxOvaZt3F/RwRaGIgdWsuAHSDlOwAURdRrplX1ky2N89hQOF
 NAtgW/aeduW57oO6/gqie4zX+7c5BdMFYCdH72dT8/TUjaMYVQRLM9E9/1LbqbvxGv
 XQD+owBDTE6UQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvP-00000000Jck-0AGZ; Tue, 12 Nov 2024 11:15:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 03/15] acpi/ghes: simplify the per-arch caller to build
 HEST table
Date: Tue, 12 Nov 2024 11:14:47 +0100
Message-ID: <3117951634520a7e9ef1737c12f0ce2d4e8657cf.1731406254.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731406254.git.mchehab+huawei@kernel.org>
References: <cover.1731406254.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WOYTLgivlulT

The GHES driver requires not only a HEST table, but also a
separate firmware file to store Error Structure records.
It can't do one without the other.

Simplify the caller logic for it to require one function.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---

Changes from v10:
- Removed the logic which associates notification and source
  ID. This will be placed on a separate patch.

Changes from v8:
- Non-rename/cleanup changes merged altogether;
- source ID is now more generic, defined per guest target.
  That should make easier to add support for 86.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c           | 7 +++++--
 hw/arm/virt-acpi-build.c | 5 ++---
 include/hw/acpi/ghes.h   | 4 ++--
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index e66f3be1502b..4a6c45bcb4be 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -233,7 +233,7 @@ static int acpi_ghes_record_mem_error(uint64_t error_block_address,
  * Initialize "etc/hardware_errors" and "etc/hardware_errors_addr" fw_cfg blobs.
  * See docs/specs/acpi_hest_ghes.rst for blobs format.
  */
-void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
+static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
 {
     int i, error_status_block_offset;
 
@@ -356,12 +356,15 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
 }
 
 /* Build Hardware Error Source Table */
-void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
+void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
+                     BIOSLinker *linker,
                      const char *oem_id, const char *oem_table_id)
 {
     AcpiTable table = { .sig = "HEST", .rev = 1,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
 
+    build_ghes_error_table(hardware_errors, linker);
+
     acpi_table_begin(&table, table_data);
 
     /* Error Source Count */
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 620992c92c12..e059317b002e 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -942,10 +942,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     build_dbg2(tables_blob, tables->linker, vms);
 
     if (vms->ras) {
-        build_ghes_error_table(tables->hardware_errors, tables->linker);
         acpi_add_table(table_offsets, tables_blob);
-        acpi_build_hest(tables_blob, tables->linker, vms->oem_id,
-                        vms->oem_table_id);
+        acpi_build_hest(tables_blob, tables->hardware_errors, tables->linker,
+                        vms->oem_id, vms->oem_table_id);
     }
 
     if (ms->numa_state->num_nodes > 0) {
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 59e3b8fb24b9..20016c226d1f 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -68,8 +68,8 @@ typedef struct AcpiGhesState {
     bool present; /* True if GHES is present at all on this board */
 } AcpiGhesState;
 
-void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker);
-void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
+void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
+                     BIOSLinker *linker,
                      const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
-- 
2.47.0

