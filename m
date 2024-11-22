Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5248315njc;
        Fri, 22 Nov 2024 01:11:57 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUCGE/89XQNctY98NI0kNYSXrii5wRnY8B6wj6ZVuXXukMRo31F/fM6QW/5F9YN/ytlSjYiHPmQwtouUA==@linaro.org
X-Google-Smtp-Source: AGHT+IH5sxsUjFQOkEo11icCqLASNHlhpB2HLlLL7CzXQLJMmMcnAIfht5k/8WytTsz4102ps417
X-Received: by 2002:a05:6a20:4303:b0:1db:d84f:c7d8 with SMTP id adf61e73a8af0-1e09e3b6c96mr2690213637.2.1732266717154;
        Fri, 22 Nov 2024 01:11:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732266717; cv=pass;
        d=google.com; s=arc-20240605;
        b=eu4QPFk9wfcDXXhLsH2SHVhjNKvlB20OozhU1dFQJ8Vjzs7LUaAMNrZbGnf4HzM0dD
         2CKzBxk0bmnd6BR99y0cEyZ07hTz8VGLDGfQG6aI/ZfGbMj529M5+r2NsvfANntYyQ0P
         Mw68C721sqIR+Ur0McbAltRfgakMwbxtylqmmnKJqRrRjlKrmyfijXOD94qiJ/mGLx6X
         xWRUEeY9m7w1h4nypOcqeit26AKqYiv6Qs74vDNzyDE8pW0UtkjKnvTEkQyxlNpyIxev
         zoM3nCHhqLCc3V3eWq7kUslIxJjyWAc171HVTSh0/TyRQG42gyIN8ulKHKnPnaQis36V
         CUPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=Jtjfg8K8yhjvsoahO8zH1ORRgGJRrLyiMGLU9JHFp94=;
        fh=Gv5C9dyTti48UiwDFihARak0O4X62EqE0FGenSCqeuk=;
        b=EY+FwsWkgZdfoAPtlXVGgMTvIAOdnkEuh7XdXXDriM41fWDQJlnDeUtxdgBE12KjoH
         ioToG4sDezPo38FnO1OzpFehdVlffQ6i6qFvyhPokJhXA/z6quQ1zUk5PQDZks+ICg5A
         9xKYukFMIWGut6g9Xswj2BDd9GMWc3wy+2i987/W/+ar4hkN+ZoQ35u1UnyZdJ4j+G5n
         tiSrdbudCXK/1Np/yGansxVugsXbu+HPtkRn82wkmPFM3YgRWOS9FNj1oWcr7L3DLwvf
         1PqjU4ibJ0fWKlwKQisjNC2NgRWapEH5hLp848bdK+osj0qFWlkzdolqL6SDf/meqfCu
         hnkg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=TT8xeero;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-417977-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-417977-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-417977-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7fbcc1eba80si1829042a12.18.2024.11.22.01.11.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:11:57 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-417977-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=TT8xeero;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-417977-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-417977-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9983B21AD0
	for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 09:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E548C16FF5F;
	Fri, 22 Nov 2024 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TT8xeero"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A325B4A04
	for <linux-kernel@vger.kernel.org>; Fri, 22 Nov 2024 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266708; cv=none; b=bGVPIk4kFBUVrv5kuzseuuCNbZimsCUvM7QFpuLV9qrY4GAj+mlwXBIbYoG1BX9ZHSCkPpyyyGWo5uJO97+F2a3D0luZVPxe4yiM9ybzsvrS3AZKrjDShTvHxXpifxJZAMGsNwodeiG8oG8Q1H6s081aaqekSEJyfAwV4Vhhnn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266708; c=relaxed/simple;
	bh=BAIrfONVknkmj4qoXvrO8lvnEuBSNbh9qzzbtdJrOyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csnl0vHtT0NYyeOBnMSw6sejqniBp6ypoRKaWP4Ygi0Lc0XcmWutcicRtgOm7zuqCW16MzkoM6j5h/sY5yOeQHCnKJjKrFle20YIU4Zg86EWViuj5jA92sjhD3npfMy6QJUCTxEkByNCOGDNbF+n/z1iyOcYfSjCN8tlOwGprtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TT8xeero; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F91C4CECE;
	Fri, 22 Nov 2024 09:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732266708;
	bh=BAIrfONVknkmj4qoXvrO8lvnEuBSNbh9qzzbtdJrOyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TT8xeeros3BBOlnqHn+dJ/nOv4iC39JWc1/XxmXOQZZW5SIH0Cpd7swbe8t7Msm8i
	 rtv2KtcAWxzaX3hYR5quxeo7UQiv0tCyhcMcFRrb6iCAarn01tbkPyDTcsvKEztVx5
	 DNYMnRX7QxZ09ZV6fEuSwyr7yc56dr/CQ2Jyi6qKc9mP86hIKLpUs6OhiGUDa/EAtM
	 UhJibWvxhVmUMFrhYUmX6WHwd50/F+rtYzoi2pzT0/4VCg8bUK6VJUu5VuiAfd8t49
	 XNH2UYJeIpwCZ7cFfG4NSuCcTxdkkZqjxEfKoU+GleWkgeiVOwkO5c6V6g+7AoETEW
	 lhiJqoAm1e5hA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tEPhX-00000006l3e-05YK;
	Fri, 22 Nov 2024 10:11:43 +0100
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
Subject: [PATCH v4 03/15] acpi/ghes: simplify the per-arch caller to build HEST table
Date: Fri, 22 Nov 2024 10:11:20 +0100
Message-ID: <f157f9c84c74c5f386ea6d6735ed3efcae7a2d6c.1732266152.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732266152.git.mchehab+huawei@kernel.org>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: vQP1EPVoeelQ

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

