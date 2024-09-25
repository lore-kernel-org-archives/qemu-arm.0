Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp94194njb;
        Tue, 24 Sep 2024 21:04:59 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVuvYDmBdLY6aLHN/VVwIp/FPAaOQjiVTjHUZ2yvHV3hnQaasqbutk1K/xkSFptno+ckcat8X8xJmYrng==@linaro.org
X-Google-Smtp-Source: AGHT+IHn8hctlzTJG/Bmjy60wgNN8nWFJjaf+d6pQ4n6fo3vCkZDwVdb5ZPgu1OTy2VXB01tSOGW
X-Received: by 2002:a17:907:960c:b0:a8d:2faf:d333 with SMTP id a640c23a62f3a-a93a03c3fc1mr97700366b.35.1727237099779;
        Tue, 24 Sep 2024 21:04:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727237099; cv=pass;
        d=google.com; s=arc-20240605;
        b=ayp7NAe9O5UBiSuvJUvYDJkDfD7BZ2fJzgKNGkH2sdJa9Z6GbkKdpEOMiRGa3VBeMd
         DyzKw7YEQXbtoItV2UoY1MRAxl3JiT8V5tmYzvSuu8V9e05iGf/otsbmvCuGHIWqYJif
         FRQl6cnTZSYYTIULexdOJbS4+vqM4xpaYIUUhwZUWWShxbkTZr/WIBtBidyfreG7/8gC
         MVTSK3LGSIlr3EOyhvGsGUSLxSqcQO51n+xPbo+jfuenGwo97zXlmKHAcZab1zBmNpcG
         OdShg7dW7uMB0IstNUnvgciwctWn+NZZ5FpAxsPjRvGhiPqJhwSvbeSpARKokaKDzcgB
         rn6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=tKw64RBc+JGNFJuniMs7DI/NpJ5h5ZWIg8cvdyprX3A=;
        fh=Gv5C9dyTti48UiwDFihARak0O4X62EqE0FGenSCqeuk=;
        b=ZeWzdRZAp5T3iWw5EeaT6EAjP02QdyNPJOfyaa5jwFJOGkxcqSrEuUX/u23cLdesio
         J7WP9Zt6wVkqqGPxyutDlV714Do7xjV+/hdpZppGw4zgh6AFofzGZjPfnLPOJbRO/WWb
         NIiYQ2uLKH1oRfqGe/Foht9hdtblxeRhY4coAWjL+aHx5XD0HvaYF+Y/cmUPXUXrOTyd
         y43dlGr53cmQ1/17TptSqScuACZiU+VOPKzdvmXkSWFv2FjrTSFyKbb9EQqe1dprKF1H
         rufxE/2nj4U1lLLRp04NrGWZOfqQBHoeHNsnbWL2QngiFN2NGlFSb2y1FnPtGvJGdS08
         N9xQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=shmB2GV2;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-337976-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-337976-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-337976-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-a93930ec4a7si184914866b.669.2024.09.24.21.04.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 21:04:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-337976-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=shmB2GV2;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-337976-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-337976-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E5921F23C47
	for <alex.bennee@linaro.org>; Wed, 25 Sep 2024 04:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BD414D2B3;
	Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shmB2GV2"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE3714B962
	for <linux-kernel@vger.kernel.org>; Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727237088; cv=none; b=lOqPyOGzzftDSOfWdbthwPYF9EkyhMdLiDebUYfh1XxTYGXYxA2T+WAy3QMeickB7eIZUjU1BTpR3x41nxy4hH/v3AfC81C8ymqjQcxyTzvcVJ9SUCT6yMgJdLxDyK4N8SaFzIG5F68YFNgWRU28MPKO2HgZpQpa9TY/Sa6vazU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727237088; c=relaxed/simple;
	bh=uYZ5dxTIe+VsUJtAek0OqcRidDumQi2sjdVoy0tc9tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qEmD/O6xauSxzN6ylu3yz1ulZOFqfMdV1dKvwfEHkhdqfgDje2YKlKRUYjBa98CkirZt3610iAP85/8zZYg3g+kTzDIj+IWVnZHU+WnFlhSHRWMphjfwUeohPoh43vait0SXdGx+2XLZcqUlnAvByIx3R9RNFWXmgH9VtU4LIjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shmB2GV2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03FC1C4CEC3;
	Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727237088;
	bh=uYZ5dxTIe+VsUJtAek0OqcRidDumQi2sjdVoy0tc9tA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=shmB2GV2jeSyZHkxcWITr6JxIxZWdrV+rsIwj58fQHHlmBJonzOmxFUWik9+wAWKd
	 GuLpllCdXjk9tguWvXqJiNTtnm18zFNTVr+ACpTPrXI+MJogzijJIE2S+n8xlQk1Fh
	 lvO7Kmou37MGQQsm30798oEX9dBJaihJ9uXra+QZqfq9uvjuy8OKmH+mrCkEM1uumx
	 KYaqZoqNO+LL1LRylNsBv4ym10uXIjRyNjluKT0NwCNPXmyw4jAK/dhN7/4vFT7WRs
	 6GC7qV1AkKJMKBqEtkvs2H1QKmQf1ad9ygPnhpObgdo1a91vHcHH2NCIiIn3mcY4/N
	 VsN4eyk2WiOEw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1stJGg-0000000827p-0Y4E;
	Wed, 25 Sep 2024 06:04:46 +0200
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
Subject: [PATCH 03/15] acpi/ghes: simplify the per-arch caller to build HEST table
Date: Wed, 25 Sep 2024 06:04:08 +0200
Message-ID: <6305bca3d0c4fc02853fe2794eeb39f46823c733.1727236561.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: ipQJE060uGkj

The GHES driver requires not only a HEST table, but also a
separate firmware file to store Error Structure records.
It can't do one without the other.

Simplify the caller logic for it to require one function.

This prepares for further changes where the HEST table
generation will become more generic.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

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
index dacbd4d0c093..7b42ed59cd15 100644
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
2.46.1

