Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3039956njn;
        Wed, 15 Jan 2025 04:50:50 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUuqMuCcEx/mZPOsFI9ybdWdCd7NuVpzTwEz04p4gTfYs8vJjkTarbnTxK+3VyirbzXAYaNCZsPdEaK2A==@linaro.org
X-Google-Smtp-Source: AGHT+IEOuVDyFTFvlg9VlrJxsGcvGcOPCWfhaPzD+c998JzqbcJpZRvioTqe90g5SNZo2ZTn0df3
X-Received: by 2002:a17:90b:6d0:b0:2ee:889b:b11e with SMTP id 98e67ed59e1d1-2f5490bd257mr41255798a91.30.1736945450473;
        Wed, 15 Jan 2025 04:50:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736945450; cv=pass;
        d=google.com; s=arc-20240605;
        b=clAVWpdtC1tN7c3Seo3erSCgm3M3eb4mSXnZMxnG3fEzMllEiGaXwyJpX1kHts+ZJm
         JrsrQi43XKTKpkKpATQeijPIJf5r7f7MLG9zYIeonODcuAYr6siJqZvHhQz2Nij5KTWg
         EXcph3Zr2ujE2CPyirIDAFq9RPbK7iux6GTtNUByBin5FJCFAr7Jv1R0pa38xbmrbRJZ
         YWoMnDUDg3lDG7q7EMZzVEkF+6YaQQByUnbL8JGw8aXfagxjN3DxGCJ4TAVWq0tm6AF7
         JxdT0Tu/IhVmgHp7kGTAVQPuWB5Sg/wTvycaA20UJCHz1u42SAu+HIdLsx3H4q8bZrlh
         RD2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=V5EM+sx6E3E6QnrEW+1ZF8hwO605vvfYqzJldRYrrL4=;
        fh=M7BIFN6MARWKkWyrZnacp989sIldlEKVCOu1j14z3wo=;
        b=VKePnH9zXB8Ttf4CY1CVUjWe6wZkGr0ugz4BFbIQqOL3o7Z+ZelPJ8H4yyTULyTxaM
         iba93thnXtnH8QVhN+ac/Q4tB6AqbctQ/WbA08wM15ZFHnXeYJbX8DD0oedmihdc+yQO
         rPuvdMYODluZI6wR25DI4OV/qBKTw2K+lEEjEZVIpk4VMCzV3OK+/rOX9SaSjYxlplpE
         Rk3E5KDfAvWmyGFiqLHfjTSvbj7BGetEXmiSQ2Kf9ZCt6AGKrFSVjSBThVvFFhNo1UxU
         wvbYN619x6pOs7jnKN8SqcUQnmgJxiqUndao6vIWbOsEcGl0Sac20B71iGIp2POWW8sy
         X6VA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=sae7btBN;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477900-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477900-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-477900-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2f72c254639si1588305a91.170.2025.01.15.04.50.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 04:50:50 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-477900-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=sae7btBN;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477900-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477900-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51B147A31CC
	for <alex.bennee@linaro.org>; Wed, 15 Jan 2025 12:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E6B241689;
	Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sae7btBN"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769291E4BE
	for <linux-kernel@vger.kernel.org>; Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736945441; cv=none; b=IouRCalrnszLpY8FkjUG9evGFRuoTZQn2lgtCLYsxqVVsDROZSUE8ZlKnUhKpys3t3sPbRdZ4KDgNj6mSHsGmiT7MEmmBM0eluclF4yv16qL9W65Jw0XnZr7N5KNEO4FKuboWMT/4K9njakNVcB3Fe91nd6e7vENP2/zuOTIGbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736945441; c=relaxed/simple;
	bh=Drdi5YGB4kFVBNhq8Al4WwbYbsSrsMZrBCcM5rLaz1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CdE3Q1mQBaGsjgV76a+QWWFOvKVWPMANjHvccA8slqOOpOnkDs8aetxAJG80p7JyKlsFRnRK7VIJCFC+ELYogMo+dDZZmbFZLO1paOKlHV4QzvhyHcVHN/MRIMbX7tDCGvH0wXKg4BY3Ubv+5mJIW1FwSHGjm443VrUzRHitQvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sae7btBN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138E3C4CEE0;
	Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736945441;
	bh=Drdi5YGB4kFVBNhq8Al4WwbYbsSrsMZrBCcM5rLaz1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sae7btBNk2uacpxH3vNurVKo+GbZRNtxJ79nnchheoxud+qJifHAbq7LXhbru86ZI
	 zV5yILjBS6vCR0AfA7JPSB2CVeE52ErbqKNcn2FOzQkaHNfzXMydhDpw5o/dLwTy/0
	 dpsgL2ytOqsbm+7Nh+PQQoUT53K7LLkEXOonuMw50EjKffONgBMqPBKTKg0I+4ZHSs
	 KKhw/sPioBWP7o06fQgenMBl6ZWb4prMp7QOwNqVs7JQA5iyFyGLgixpZizz8ugDJ1
	 z23KXQYITGScr4+3297zssckskgxmC6TWWdQdtEuYyBjJ3HN73LY0MHuaMm7NeXPWl
	 XMkqfUTzvEuaQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tY2r1-00000004yFa-0PWo;
	Wed, 15 Jan 2025 13:50:39 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 03/16] acpi/ghes: simplify the per-arch caller to build HEST table
Date: Wed, 15 Jan 2025 13:50:19 +0100
Message-ID: <9584bb8953385e165681d5d185c503f8df8ef42f.1736945236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736945236.git.mchehab+huawei@kernel.org>
References: <cover.1736945236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: Orj35hHmRahw

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
index c9b13057a34e..3ac8f8e17861 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -946,10 +946,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
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
2.47.1

