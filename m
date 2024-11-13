Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp207160njc;
        Wed, 13 Nov 2024 00:37:42 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCX8B25qZLu7MUPU8qdRcyB7OFSz+cNW4e9qziDhTEkMt4jIhctxfIDKLH24yDVPRUxW8ovnvZA6hCvinA==@linaro.org
X-Google-Smtp-Source: AGHT+IF+IUWg5KeF3BqMMEYB38qA54kC/1ra3Jl+2v0e1ktzp+Bx3uLlNoCLzkPHIn5YzHCabFLq
X-Received: by 2002:a17:903:2301:b0:20f:aee9:d8d7 with SMTP id d9443c01a7336-211ab987b0cmr75487785ad.32.1731487062137;
        Wed, 13 Nov 2024 00:37:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1731487062; cv=pass;
        d=google.com; s=arc-20240605;
        b=fGesIMiecx4KnhfEgb30iE2gmwBccUuCGUX3Bk0ucRI7MmasqkAHHirXK0MRZhkJdR
         a8mqyo4A8Bcr9p34iUt2RxaaMISNThD0zEfPDUNTasMiuG+KQDzMXfI/MliifZEVaMha
         KBp4FDl1F0dKmbJhkbkftkprjcDiBtetEmm15NK8av6PxK6qp9K6vNu6+tdbn2sQYfYv
         JaI3hxB7nFmFmJL7ghuf72v0NjEpPx8vf4oCzaf43/+LC7Ff/5Xtx1vL9JBqagIGnmLb
         W19oPdbPeArLU7sCNx1d/4FcenI010wmW7XRWiWOTRuXRsnpFmIVtoM96GRD2UDpFJoT
         Eesg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=yX3SUtab2AnOETjb9ZIdd/KD5Lc13qvxAWj82PptcfQ=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=JW4vX6AMJZTithFyWy80ED5R9lpNlMs7vEjHSgOL2No7v1IJ81/tJ9fq20qWIFfKxs
         kke4M4eHLUfjMrC5VmDOIeZ/z+bPkSHV5XVEb+ts+oPCHXQaxCNXV7Hv8vvtXSQ2Jaq4
         Z2uWNITOFUgXQcdHLNNq6IdRnYvXh6TrvBzZ1li47NWb4P/f3oFO2XZEIVOZoBU1hoHd
         QQPUT4Xdqk/jpZ+6s+t5PhxcGX3Zg54/qWX+0lVYJCuBxH+FFKBKB3PM9rCRynEqii6n
         2MCbxXFQrhuK/AFnNzOsqas1Fpm4elvlfhKuGwOOdVE46zMIGMJuthq2ousvKX+am37+
         pJKQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=r5yRAwye;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-407237-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-407237-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-407237-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d9443c01a7336-21177dcc268si158922815ad.34.2024.11.13.00.37.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:37:42 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-407237-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=r5yRAwye;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-407237-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-407237-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD2742828EE
	for <alex.bennee@linaro.org>; Wed, 13 Nov 2024 08:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B21F18A6C3;
	Wed, 13 Nov 2024 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r5yRAwye"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADDA185955
	for <linux-kernel@vger.kernel.org>; Wed, 13 Nov 2024 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731487058; cv=none; b=HSB4n+s8T7Z7Z3ThBPsnRZN2kDffG/lxhNT+lqj3JrfksrT2ILRZFKvfniamhDTK9zkDrBh/Fb0h4sOylz4k2B2vlJVX4pA7YDDenf7znOS8OgnpCTOhzI6nEdjQ/9hH/BKrQ1V/TdGOcf3mBDDwO4CQT8/X79xt2XT4RSyt/qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731487058; c=relaxed/simple;
	bh=gdndAQElEiSThiB//XhZPACDqXwEeg2bg8wCE0V83R8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b7bJvGGJ+cP17t2FjKdU8EZZ6QkfqJSJ+7HV0TK6q3glbAR8pyGZcAITmgzs3IyVoTZFjqsHDjPoZhqEd7gRGxfeXaZKpqmyi5cDnTK0jHqwihWg8O+1Swqh8br2p1j86ATi2kYIzvKnJWGQOMGFNNr8J7oiNDVQTUSBnSk801A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r5yRAwye; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6FFC4CED7;
	Wed, 13 Nov 2024 08:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731487058;
	bh=gdndAQElEiSThiB//XhZPACDqXwEeg2bg8wCE0V83R8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r5yRAwyebzBUhOkPtoDH9K23cWIL+KHQUO6K94YStAx2L/TyYgU7keJ3JrTDXX2Ve
	 q6UwkNlc+rw98DRS+HUIJH2oOipUWTiodERASFGxxcNTa0Y++9i1DskqXybQxbbIty
	 ppgu95tihrelKLVJ1/+1UE01E03GpoSM1OoukrAgaXJrv09x5bjUL4/ApzxImNQP99
	 CtJYgcsIOOCOnK5yMu1ENTgrHBrZI4e01/y4HTzSeWOFpHzNDCWDac5DF2E45xeaTu
	 Fai9nmXH8ZpbNesyB36yHge6YTPEULrFQjOB0EVj2aBdVt8w1PzMYXZr+c3J7FbG8F
	 mdeTharkEtXVQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tB8sZ-00000001Kw4-3OzK;
	Wed, 13 Nov 2024 09:37:35 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/6] acpi/ghes: add a firmware file with HEST address
Date: Wed, 13 Nov 2024 09:36:59 +0100
Message-ID: <70ed97b5b335a3e399121be988bf37136aaaa7fd.1731486604.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731486604.git.mchehab+huawei@kernel.org>
References: <cover.1731486604.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: 4oCNgNuVuWKw

Store HEST table address at GPA, placing its content at
hest_addr_le variable.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---

Change from v8:
- hest_addr_lr is now pointing to the error source size and data.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c         | 15 +++++++++++++++
 include/hw/acpi/ghes.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a590b0f6f85f..4cd79d42cd04 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -30,6 +30,7 @@
 
 #define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
 #define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
+#define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
 
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
@@ -361,6 +362,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
 
     acpi_table_begin(&table, table_data);
 
+    int hest_offset = table_data->len;
+
     /* Error Source Count */
     build_append_int_noprefix(table_data, num_sources, 4);
     for (i = 0; i < num_sources; i++) {
@@ -368,6 +371,15 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
     }
 
     acpi_table_end(linker, &table);
+
+    /*
+     * tell firmware to write into GPA the address of HEST via fw_cfg,
+     * once initialized.
+     */
+    bios_linker_loader_write_pointer(linker,
+                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
+                                     sizeof(uint64_t),
+                                     ACPI_BUILD_TABLE_FILE, hest_offset);
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
@@ -381,6 +393,9 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
         NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
 
+    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
+        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+
     ags->present = true;
 }
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index e47ffacbb5c9..a07c30ef13b7 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -58,6 +58,7 @@ enum AcpiGhesNotifyType {
 };
 
 typedef struct AcpiGhesState {
+    uint64_t hest_addr_le;
     uint64_t hw_error_le;
     bool present; /* True if GHES is present at all on this board */
 } AcpiGhesState;
-- 
2.47.0

