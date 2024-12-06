Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1014043njb;
        Fri, 6 Dec 2024 09:22:46 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVBHN6tss+593gi1QCanFjUQ8Zcdktr6F3g9VGsrORxwaooYUfvgg1k6HulR+eUVUlpWZQuK4vP81wgEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHxcv6S7Kdj6dYS6b2CucNr5IlSHoVSApOFTIH7nfMAvxVGiLciS2X8BoJR8khRlUN83Ktb
X-Received: by 2002:a17:902:d485:b0:215:711f:4974 with SMTP id d9443c01a7336-21614dfe44emr47629035ad.55.1733505766665;
        Fri, 06 Dec 2024 09:22:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733505766; cv=pass;
        d=google.com; s=arc-20240605;
        b=SlWoiUU1sCddlqVOkFDWyOgFp/fG0Hrc3rdGjdpTWz8UGCqzV5pdYFSRYHgh97e+8N
         WjVu1pNL4k4wsSTtUzQgrjBU+8G9QaeBv/QXyNJJFehZrboT6SN6cp3nyer85T9ru12t
         zTl7v/G+jZ+6Z9RA0x1TpV3OsHR9aUIRMa1KqoNdmFyQymU77na70XnajwDvCMZr6qs9
         OB5tULc4BirgIEiviUM76QxcBcN7dJGrS9c9c7ghQLyZQRIw8xjuei11/qENSGHFGCho
         7jkUbj2cfKSF8IfxANs1JhpYkSBVehsmcOEs5L6mGyTXs/WFIgKpbhfTv6avsIkuV6sc
         W/gg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=6U3LL8frwDzyutuR7cp/fHKYKic104njPo4BwkQ6dGo=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=hkmO+k0jpV+b/zehsMCTbtmqtuh9P8R9KJrtlrekGRpkM+ErgSl+7gbcwy0Xj/XWi+
         5y+GNdCoq3eYw+Kk8qwMCYWW/SmhRjAzECgNSrx/OA4xLS8LiKz3t5TiM+/D4JxPlM8/
         EjaQHPZIpcZlP/s6PncBOmmHPPqnq3i3db/rYI5tRQO21HB8nZnk2LVSCpvtJcqowZKz
         0VDObrYMs9z6dvTZ7mKwXZDg23ecAQdBDamQw3SxiDrRLrtL9sHSBUDC5asCwLXV/Btb
         /vANoRrsDx8Pyaz63Lg3s3D2g6knVfJmg1TRAyARgZ9T1n9rhTwyniTlFhmuQhBRrbAR
         9Hhw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=CGyGoIL5;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435393-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435393-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435393-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d9443c01a7336-215f8e42088si35538915ad.84.2024.12.06.09.22.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:22:46 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435393-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=CGyGoIL5;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435393-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435393-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 302412878ED
	for <alex.bennee@linaro.org>; Fri,  6 Dec 2024 17:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911B0219EBD;
	Fri,  6 Dec 2024 17:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGyGoIL5"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E83203D6E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733505688; cv=none; b=RbWBgelyhWDBZGTYuEgWtE0MZGJ52H9LNPyqeA3EZvEw4YVYbLy+6ctvC1BPWXRwZ72ueYVy/ky8wA5k219SJ95n2LOb3unWhlzoCZ8sscg5gydFz5dlG2s8mXqpP51mKl2qqHYg9QLokwxlkUeVd1Yv8gipvfc1EChZa2c9F/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733505688; c=relaxed/simple;
	bh=wJulQYESwlqAXPVkXZVUiU2AeJ1Jd49Tk06eYN+hXRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ANcp2KpEnohNh2u1QCuB22yA8w1b3Imb87wBBMZaIYS1UQK9hOSOjq6wWGYl4FjEZKjxUSMidFys/GP8U5VvWVLmjvjF1/8ICMEAi62Srr8RVEtlVMbVdJ9NVUiCtJppau68zwA5ryAcbhQAF/UV5t2bcP1UTfemT85Wo8ZujRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGyGoIL5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CBEC4CEDC;
	Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733505687;
	bh=wJulQYESwlqAXPVkXZVUiU2AeJ1Jd49Tk06eYN+hXRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CGyGoIL5p8IxaASTLUCHXZtwg5BYMJeDiNbVz7W8TbCpXzVWZQfKk5cqtRLu9xpHN
	 TqdyTdCZkTzBn0d6fiqua39cRQuV3/QeduFG/AbB8JzGsubfuQngdnpUClyVx3xZRt
	 odkkzy82RMlXqk9fDxNnh3ZV0ISJb4vBAF6AGq3oNX4VZa9E0NCfB89wa2+gSWbcPo
	 uGWGZKlsWHjkfhgiGQ+jzaPjaU+q43pdjNCFi6Gf9RfQLhWUSbp55vxOzRt9RN5bKb
	 CC6JFR5GKACQLXJeHIKB78tSpGnc2WfCv7gzKE9zFiD9aHc1KkNqOA93/8Moi740eP
	 JDNnw84xfjUiw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJc17-00000005RKY-3pfq;
	Fri, 06 Dec 2024 18:21:25 +0100
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
Subject: [PATCH 16/31] acpi/ghes: Use HEST table offsets when preparing GHES records
Date: Fri,  6 Dec 2024 18:12:38 +0100
Message-ID: <9bef0020b1c4f3df76aebe334eb0567d9773d304.1733504943.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733504943.git.mchehab+huawei@kernel.org>
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: Nnrq9S/GH0I9

There are two pointers that are needed during error injection:

1. The start address of the CPER block to be stored;
2. The address of the ack, which needs a reset before next error.

It is preferable to calculate them from the HEST table.  This allows
checking the source ID, the size of the table and the type of the
HEST error block structures.

Yet, keep the old code, as this is needed for migration purposes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c | 106 ++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 96 insertions(+), 10 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 4a826c8ca6d4..af55bfe106bf 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -61,6 +61,25 @@
  */
 #define ACPI_GHES_GESB_SIZE                 20
 
+/*
+ * Offsets with regards to the start of the HEST table stored at
+ * ags->hest_addr_le, according with the memory layout map at
+ * docs/specs/acpi_hest_ghes.rst.
+ */
+
+/*
+ * ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2
+ * Table 18-382 Generic Hardware Error Source version 2 (GHESv2) Structure
+ */
+#define HEST_GHES_V2_TABLE_SIZE  92
+#define GHES_ACK_OFFSET          (64 + GAS_ADDR_OFFSET)
+
+/*
+ * ACPI 6.2: 18.3.2.7: Generic Hardware Error Source
+ * Table 18-380: 'Error Status Address' field
+ */
+#define GHES_ERR_ST_ADDR_OFFSET  (20 + GAS_ADDR_OFFSET)
+
 /*
  * Values for error_severity field
  */
@@ -212,14 +231,6 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
 {
     int i, error_status_block_offset;
 
-    /*
-     * TODO: Current version supports only one source.
-     * A further patch will drop this check, after adding a proper migration
-     * code, as, for the code to work, we need to store a bios pointer to the
-     * HEST table.
-     */
-    assert(num_sources == 1);
-
     /* Build error_block_address */
     for (i = 0; i < num_sources; i++) {
         build_append_int_noprefix(hardware_errors, 0, sizeof(uint64_t));
@@ -419,6 +430,76 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
     *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
 }
 
+static void get_ghes_source_offsets(uint16_t source_id, uint64_t hest_addr,
+                                    uint64_t *cper_addr,
+                                    uint64_t *read_ack_start_addr,
+                                    Error **errp)
+{
+    uint64_t hest_err_block_addr, hest_read_ack_addr;
+    uint64_t err_source_struct, error_block_addr;
+    uint32_t num_sources, i;
+
+    if (!hest_addr) {
+        return;
+    }
+
+    cpu_physical_memory_read(hest_addr, &num_sources, sizeof(num_sources));
+    num_sources = le32_to_cpu(num_sources);
+
+    err_source_struct = hest_addr + sizeof(num_sources);
+
+    /*
+     * Currently, HEST Error source navigates only for GHESv2 tables
+     */
+
+    for (i = 0; i < num_sources; i++) {
+        uint64_t addr = err_source_struct;
+        uint16_t type, src_id;
+
+        cpu_physical_memory_read(addr, &type, sizeof(type));
+        type = le16_to_cpu(type);
+
+        /* For now, we only know the size of GHESv2 table */
+        if (type != ACPI_GHES_SOURCE_GENERIC_ERROR_V2) {
+            error_setg(errp, "HEST: type %d not supported.", type);
+            return;
+        }
+
+        /* Compare CPER source address at the GHESv2 structure */
+        addr += sizeof(type);
+        cpu_physical_memory_read(addr, &src_id, sizeof(src_id));
+
+        if (src_id == source_id) {
+            break;
+        }
+
+        err_source_struct += HEST_GHES_V2_TABLE_SIZE;
+    }
+    if (i == num_sources) {
+        error_setg(errp, "HEST: Source %d not found.", source_id);
+        return;
+    }
+
+    /* Navigate though table address pointers */
+    hest_err_block_addr = err_source_struct + GHES_ERR_ST_ADDR_OFFSET;
+    hest_read_ack_addr = err_source_struct + GHES_ACK_OFFSET;
+
+    cpu_physical_memory_read(hest_err_block_addr, &error_block_addr,
+                             sizeof(error_block_addr));
+
+    error_block_addr =  le64_to_cpu(error_block_addr);
+
+    cpu_physical_memory_read(error_block_addr, cper_addr,
+                             sizeof(*cper_addr));
+
+    *cper_addr = le64_to_cpu(*cper_addr);
+
+    cpu_physical_memory_read(hest_read_ack_addr, read_ack_start_addr,
+                             sizeof(*read_ack_start_addr));
+
+    *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
+}
+
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
@@ -439,8 +520,13 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     }
     ags = &acpi_ged_state->ghes_state;
 
-    get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
-                         &cper_addr, &read_ack_register_addr);
+    if (!ags->hest_addr_le) {
+        get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
+                             &cper_addr, &read_ack_register_addr);
+    } else {
+        get_ghes_source_offsets(source_id, le64_to_cpu(ags->hest_addr_le),
+                                &cper_addr, &read_ack_register_addr, errp);
+    }
 
     if (!cper_addr) {
         error_setg(errp, "can not find Generic Error Status Block");
-- 
2.47.1

