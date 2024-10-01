Received: by 2002:a05:7022:698c:b0:8b:e46e:3391 with SMTP id cj12csp65138dlb;
        Tue, 1 Oct 2024 00:05:34 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWlQ7BqA88A2dlqlUPA5DVnALjOZpPED1bezTVGeH+Z3vPLTtXtUMEiJpStejeNbbwgD7LJSm0/Xv14Xw==@linaro.org
X-Google-Smtp-Source: AGHT+IFV7JsJ3Vhxv3KyZR4/gshevKaFZg8ay6tBDn6xzSwV9mo+rfSkd7KTlzipygMAh84+N+U5
X-Received: by 2002:a17:907:7249:b0:a8f:f799:e7c9 with SMTP id a640c23a62f3a-a93c48f1c38mr1361294966b.2.1727766334722;
        Tue, 01 Oct 2024 00:05:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727766334; cv=pass;
        d=google.com; s=arc-20240605;
        b=A2aZYLgV/E0J32Xb2/yDQgYaJubGKl+zx1YXSktCb6fOCWpCUu0wN8w/LnC/+c8Bmq
         M0XInLhOAfZeGqoV3T0teZYkejfDU+9g2uEHrssoZe+sq7qregT/z26qMdhFC7oRo7bU
         zWqvX4wLUH5YYxLV0jcDj5trFyoYVLIl01invWwCdNB+zQ/t80PzGw+krgHrFT3eLE9+
         BCsdlvZDejwLkHDuOPM27czijqRuOPpZHp0qX9a5BcEhIAUAbFwJ2HQtnTTpDxQAGLEr
         BTX9CP9rXGJpyBKcwb5VlbViyKUU7rrh4LhXgwKGG1WQDrubWBTF06YFjkOk4Zb6046/
         QqjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=5+ZajSN0Riof9aBY+eck2BvGNvdnxGMFZgnLk7WLWx0=;
        fh=pPkGxWme5eHrXNbCX28EQ5uo8gIF7Skrn+rD6mc6P1I=;
        b=RuBHVMnIo7zzwYv7OLntKzhs4HZp0auULJfIZvC3iVeuWfS8Ons968Dw3xX3eMWVN9
         61xN3nkYbUOijY22QCQLtYBb+wwup+7lJgaSqWRZ2+gTbNXAQYzG4tAiDNHSyF6+RLoP
         +fvJUC55bRvz0Msnjgte4PwebW4euOQkXVc8sm0BIElcPSw8y3G+1EzeqMMucbatMKoT
         ycAzUEiVcJglH2ne+hTk1JlcsqwP7pIaT9Cx5Mhl8dR+mAjXkh9KuxbEY26bU+Zm3WLA
         IkcP4X4KoRMLgor1Cuy/PArtYn54I1DDNgpHHoEf+QJHrk9ZspA+JCuDVWIwRkKWOHS/
         X7nw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ciwP6AnM;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345355-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345355-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-345355-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a93c29b3b9dsi698171466b.352.2024.10.01.00.05.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 00:05:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-345355-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ciwP6AnM;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345355-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345355-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48EC21F214E5
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 07:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27691BE250;
	Tue,  1 Oct 2024 07:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ciwP6AnM"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B361BD005
	for <linux-kernel@vger.kernel.org>; Tue,  1 Oct 2024 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766251; cv=none; b=NvRYWhUw5AqnyYkXupH6OJU6mTC6s63pQQl14tbSxOwZqXQ3NswlgH7Jc5RLUblVuYRWlL5cQyX6j7hVqbBBNde1jVgzZDPJ3Ft/wvExZ7b8oUZAcMD5HCoKa+EgNA3cZsIpGp0gcCfzfW9oWQB38ze0rF6+f3U2B5Oo0/2cAiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766251; c=relaxed/simple;
	bh=gE66plh5Ccq78f0B7n/cfi2RLPCdjB5/duOjscO/Y2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NjhVWwQVkItcHgFBaNQpt7xACVj6CmJig3fVXrwZfycZurY/XCPoGeJL1DXbRJ8qqYQX5zx62THrRSLUVelMAXXR9z3qOuIFTbxokqfUV4qgP0Y/LqgwUPXM2qPKMhoS8aQxeWTkdMy08xU4W+1WAw5Iz1VRAdiZE8ZWNh6iplM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ciwP6AnM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28786C4CED4;
	Tue,  1 Oct 2024 07:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727766251;
	bh=gE66plh5Ccq78f0B7n/cfi2RLPCdjB5/duOjscO/Y2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ciwP6AnM++vYVNJQt5gvXc9ltCwJ3LE2S+hmwhoAInnjBLo5A0HIWT8qBek4wXb3S
	 ZP3rzyq6mXe1BBaFxnaeidrQ794moxuFBLE/aoFSW32AfhCMgZjOxAC2ipXD+f1B/R
	 UCWTJfTqm9uC1zCbwbnWYZG6RKvwwRBBHS0OvqLojrppbMv+0LSq93ZIiPLMpK3VSR
	 R+xRshthycTF3rcwQ9RuaF5NO9d0tYfvN2F4bPMlyqbdU9AenpvPk7VH1ZA9HVGRZb
	 ZByUYdA7uxmZ1rNG5e8tqOhfCheSxEURer+1B+l6AYKhxbwMRl5VrtbOolb2CBAnoD
	 IAKVehLrLbKVg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab@kernel.org>)
	id 1svWvY-00000001V0U-1f0O;
	Tue, 01 Oct 2024 09:04:08 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 03/15] acpi/ghes: simplify the per-arch caller to build HEST table
Date: Tue,  1 Oct 2024 09:03:40 +0200
Message-ID: <a106318a134a2aa9d75aa07f906bad959cb0600a.1727766088.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1727766088.git.mchehab+huawei@kernel.org>
References: <cover.1727766088.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
X-TUID: xqR6a7/ofU5o

The GHES driver requires not only a HEST table, but also a
separate firmware file to store Error Structure records.
It can't do one without the other.

Simplify the caller logic for it to require one function.

This prepares for further changes where the HEST table
generation will become more generic.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

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
2.46.0

