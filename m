Received: by 2002:a05:7022:4195:b0:8a:132c:44a7 with SMTP id i21csp213467dli;
        Fri, 13 Sep 2024 23:14:07 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCX+FZQPLFiwSdmBlHi9U5i/jOlNrZ6m1nI2sg78MjzX3gH5AKzcbCd+YiDcqKHBHH2FyHVH2Wh+1/ixAw==@linaro.org
X-Google-Smtp-Source: AGHT+IGj1qV25c30nZLEeLfZ8b1vKKav93rWrviWHO53QhbijVNaHGXIHcFiqt4iJPw17mRmT+LL
X-Received: by 2002:a05:6402:3484:b0:5c2:54a3:6b3e with SMTP id 4fb4d7f45d1cf-5c41e195d53mr3509211a12.16.1726294447300;
        Fri, 13 Sep 2024 23:14:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1726294447; cv=pass;
        d=google.com; s=arc-20240605;
        b=kjHnWhqe1mNDdCUjKMk1aexVDrT0Er3iBBtgGCgxouwgwKW2BfB2BvU5l2leGACEIb
         u992NwspsdGcR1LIqwWSYsOJndprlnYOmP7TcW3Nv/8MumUx8+gfSgQFrogKt9ju77Ef
         fCJkQfAXQWD8w47fKMzfCKbH+GM7tv4bGtuBzbAVNVghKM3GGWRSUpf5rZiwGuiAJksD
         rCzIsKkqTurAaa2QeDHcbt1nOADrcpj3jBI3EP6RUXQxWiDaR7z/oBEwjjFz3lXcqHva
         r/uH9lrdHcLgBNHfgQ5ylAGB/x2ArsVdyBvvJKRzWCFxmoi0Nftk+4vYQwhnpKAxhHjv
         RsTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=tsioall5ba2CSx9b5v9cv1dQKfd6IC0CZhPt1Mfk198=;
        fh=Gv5C9dyTti48UiwDFihARak0O4X62EqE0FGenSCqeuk=;
        b=eU05+c+iqNDTjWwn9osiHxcroDowwthoM0H48Omu1cG3xHi6JmMbXffSUbyNBuf6fO
         c+d5/jwrJ21tphK0UPGyi08Ie+V8PFLODokAg+fCzzJq9xfPkZdPXpQO9mz/KWTe6Bxf
         r0EiVTgkXP0IA38B+p2V58YlMrdjVpi4Q/VvMR2hFxt7n7Ph4xXFjsSIp9/dUao76aAS
         L3C2YEvpA2wnj6tId9IY+nSg3sgSjwWRj+icyuIh2nI8eZxwItD4XF1SU3BTO8Fucmpv
         BHB/nS2sRZ5CXdAnn6e7DkjK799uc0lHkHYWXC4aD4UiY7fYcqGgehRR2ATa1o949Gwj
         bFuQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=FSTB2IFI;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-329160-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-329160-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-329160-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5c42bb90580si528102a12.220.2024.09.13.23.14.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 23:14:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-329160-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=FSTB2IFI;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-329160-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-329160-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EE2C1F23C8A
	for <alex.bennee@linaro.org>; Sat, 14 Sep 2024 06:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9A87C6D4;
	Sat, 14 Sep 2024 06:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSTB2IFI"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CA047772
	for <linux-kernel@vger.kernel.org>; Sat, 14 Sep 2024 06:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726294434; cv=none; b=UAt3RtkwkWIiPKt5mOFi5xtCsEkwaEyfE54fBLaK36kQ4PMGovyHkPqspb4GGxFvg8La36kAa3Ow5/4BgfufripcwSwjb7ky3Zs26pZ0HTdUtWel9dV9V1y5pTf76GprooY3ujbEQlN9Rw/+xPHWSIMKrDfWJ3LUetWltbCkHfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726294434; c=relaxed/simple;
	bh=EWLyILZhCmCqcM/xaUKf+oF1P3KuMlWwct4g79O+XOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GYGtx2eVw4X6mtWl9G0UusIKhy9lCCDWTaZg25qt8eagvgWS8qXs1vegXNRJrFonKV+/BxmbtX7GgKvpsfDLFjRaCU07zjlXtVYwC4JSyfEX4LKLD/OXaHq9AB6RUKLu8hN54lBA1eca1F/RUe0V89AYJXXv9aL5gnN+7esdPbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSTB2IFI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016CCC4CED0;
	Sat, 14 Sep 2024 06:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726294434;
	bh=EWLyILZhCmCqcM/xaUKf+oF1P3KuMlWwct4g79O+XOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FSTB2IFIosJuVdm74y9wJR9dM/lBNHjiDH76v/rOhjIsuhl1sfwWp7ZvM502rRv2+
	 KCBy9CnecJhveDK/lzMkCla/PJLhyArcetFN6jpNZWyOzfclyZuHWShdpf0QK64z92
	 sasjN3p89ZLM+R9VMSuAbPgX9Us5phens2+xrXTav/2Db8zM9CmZH/X8xatijMz4Sp
	 5k9GbktJ8UU2KEr7s4mIn7tKLKJKF5qcP7hlxJ91PXUjbschbnqEs+Lv+9zROWH67K
	 x2karIbvcNaTUn1YrxuhMkfTFyhxaTGdg0jWO6EoytePydblwD8WMy8WTvN2cpo5FJ
	 7d+voAxwJTSXw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1spM2a-00000003V5i-0HSX;
	Sat, 14 Sep 2024 08:13:52 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v10 05/21] acpi/ghes: better handle source_id and notification
Date: Sat, 14 Sep 2024 08:13:26 +0200
Message-ID: <409491c21021b3cc0b239bb95ca6cc78e6adda10.1726293808.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726293808.git.mchehab+huawei@kernel.org>
References: <cover.1726293808.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: SqFEglJC79bu

GHES has two fields with somewhat meanings:
- notification type, which is a number defined at the ACPI spec
  containing several arch-specific synchronous and assynchronous
  types;
- source id, which is a HW/FW defined number, used to distinguish
  between different implemented hardware report mechanisms.

The current logic is arm-specific, implementing a single source ID,
for an armv8-specific synchronous report mechanism (SEA).

Cleanup the code to make easier to add other types and make the
code portable to non-ARM.

As a collateral effect of such change, build_ghes_error_table()
function is now an internal function.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---

Changes from v8:
- Non-rename/cleanup changes merged altogether;
- source ID is now more generic, defined per guest target.
  That should make easier to add support for 86.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c           | 31 +++++++++++++++----------------
 hw/arm/virt-acpi-build.c |  5 ++---
 include/hw/acpi/ghes.h   |  6 +++---
 3 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 17b7d9e10f3e..939e89723a2f 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -234,7 +234,7 @@ static int acpi_ghes_record_mem_error(uint64_t error_block_address,
  * Initialize "etc/hardware_errors" and "etc/hardware_errors_addr" fw_cfg blobs.
  * See docs/specs/acpi_hest_ghes.rst for blobs format.
  */
-void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
+static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
 {
     int i, error_status_block_offset;
 
@@ -285,9 +285,13 @@ void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
 }
 
 /* Build Generic Hardware Error Source version 2 (GHESv2) */
-static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
+static void build_ghes_v2(GArray *table_data,
+                          BIOSLinker *linker,
+                          enum AcpiGhesNotifyType notify,
+                          uint16_t source_id)
 {
     uint64_t address_offset;
+
     /*
      * Type:
      * Generic Hardware Error Source version 2(GHESv2 - Type 10)
@@ -317,18 +321,8 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
         address_offset + GAS_ADDR_OFFSET, sizeof(uint64_t),
         ACPI_GHES_ERRORS_FW_CFG_FILE, source_id * sizeof(uint64_t));
 
-    switch (source_id) {
-    case ACPI_HEST_SRC_ID_SEA:
-        /*
-         * Notification Structure
-         * Now only enable ARMv8 SEA notification type
-         */
-        build_ghes_hw_error_notification(table_data, ACPI_GHES_NOTIFY_SEA);
-        break;
-    default:
-        error_report("Not support this error source");
-        abort();
-    }
+    /* Notification Structure */
+    build_ghes_hw_error_notification(table_data, notify);
 
     /* Error Status Block Length */
     build_append_int_noprefix(table_data, ACPI_GHES_MAX_RAW_DATA_LENGTH, 4);
@@ -357,19 +351,24 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
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
 
+    /* Beginning at the HEST Error Source struct count and data */
     int hest_offset = table_data->len;
 
     /* Error Source Count */
     build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
-    build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
+    build_ghes_v2(table_data, linker,
+                  ACPI_GHES_NOTIFY_SEA, ACPI_HEST_SRC_ID_SEA);
 
     acpi_table_end(linker, &table);
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f76fb117adff..bafd9a56c217 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -943,10 +943,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
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
index 5421ffcbb7fa..c9bbda4740e2 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -69,12 +69,12 @@ typedef struct AcpiGhesState {
     bool present; /* True if GHES is present at all on this board */
 } AcpiGhesState;
 
-void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker);
-void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
+void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
+                     BIOSLinker *linker,
                      const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
-int acpi_ghes_record_errors(uint8_t notify, uint64_t error_physical_addr);
+int acpi_ghes_record_errors(uint8_t source_id, uint64_t error_physical_addr);
 
 /**
  * acpi_ghes_present: Report whether ACPI GHES table is present
-- 
2.46.0

