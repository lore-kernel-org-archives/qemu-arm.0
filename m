Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3617232njk;
        Wed, 29 Jan 2025 00:05:42 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWxfTVQ5CACDCVJR8GuMkJgSrmc1awWXzODwXNw5CqNPASP2wNu28ABkznYWK9bFr8rl/94kTe4uMZteQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFmF/zQmYXr9Q4W4B96ZRpyrbjGis0PkgXuVghv9BO31KrUgC1JsAUYVWgYinFvwoHKaWEx
X-Received: by 2002:a17:903:2384:b0:215:a179:14d2 with SMTP id d9443c01a7336-21dd7e0b51amr35625395ad.50.1738137941617;
        Wed, 29 Jan 2025 00:05:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738137941; cv=pass;
        d=google.com; s=arc-20240605;
        b=MkmlNpCURpRaUU1GDnLBVaae1w1DLYe92mA1fzeXjMl0IbOsMCBPpUv5e35ozSryOq
         /6wTXU7jl8gxMzeIICAHquIixJK8LjXkfxvwiSv/ZL5NdGWXpYnBBG1NaiR1wRypgiaE
         ozqQPlF7viMUnMBJttFG/Tap48RMU1I4QD4EKAmX4LKVzcdQht4ymEr2Qiuk+O/ZwpRj
         DtdNbWVObEjB8Ev6z9sWXCUhh9tWRHXmv5ljklRx6Pz5gwKchask/Q/qibU6/jVCg81D
         JYAsBWJ9xlsM5pN9aeHILHRXWztvPjYWi4uWVnCztPCqrsuEuSS6ApGo8AfH/KHpSCEB
         7qLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=bEz4ZYGA/BVQWkwoHVN0yia1hODFcWlFVdTHeQGq02g=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=FB2kA7CdnnULv0U5F6kvrKI2Iv2N1tmwMsb3sil30tsOHWZt9o87wtInaG4HF7CCi/
         cEP0/x5tYjaiMlasZmNuhK8nPnq1dNl0RSl/Z3/gssn+UwBjI3NEl973Q6CAgzr20BYf
         zh16W4izbGmF3QTP7Rhv0zPzO959TM4utYYHUFsEhDtypWCaqsFs7tw4iVngvhI7NV6t
         x5Qn3vHdpM/xplOjBZl6Al9pxmLQsOkyGfXzxhsQ1tIfhJ5+WYIHRuSUuu+Z2J/OS4Nx
         2R3Op+we2P8/w8YOp6dJ+LWtnmUoytXsbayikJpxuoImzC9MblFKARHiuxX+ssukOuRI
         fpEQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=sRTWNWHZ;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492178-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492178-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-492178-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d9443c01a7336-21da3da3d45si159024995ad.18.2025.01.29.00.05.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:05:41 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492178-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=sRTWNWHZ;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492178-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492178-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 973983A528B
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 08:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807471AC42B;
	Wed, 29 Jan 2025 08:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRTWNWHZ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B191199947
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 08:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738137867; cv=none; b=LNCGIYRB4T21SE3SxC2y3ZPnf7Job+SznmrhFRgrO5lK7N9diwHvHKmpr711R7tV0/MGVcVmd+izEczzhz1B0+z2zILvAa2jz0hMYNcIJzGOKNT4ipcwErGU9H7Mgvi4MEA+wz0NI3rZRcZCsmif4N7gCD/EKDm6sfWK/cmWatw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738137867; c=relaxed/simple;
	bh=u3ze4ZcvfwtYPfxtKvalX1Nzde0fAsKJ77ymltElAXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fXfzRf/GsTIHpSTNe9E9blScjxHpBBpTlOZH7LODx2gfjEDIzwLmIpKTb0VRtc+E12uklJ7aud2Nj0A0hNoqzIWsRrBjQIHS+20lcI3QeYFrjGwk/5SZ+uke9bMGQUY3TByWbVLDWqxssH5/huItQPktu97gZlTK62hk9cgI3fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRTWNWHZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3134C4CEE9;
	Wed, 29 Jan 2025 08:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738137866;
	bh=u3ze4ZcvfwtYPfxtKvalX1Nzde0fAsKJ77ymltElAXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sRTWNWHZ7g7ojPmXV9wt3Xl0utTXep3buUL5qTgyi2GjX/GyW/5/K3oDIPo0THKcd
	 lcBSqPb34O8UMuZWdpxLKI5j5Dgfp63+3d/Gx1ZKhcezxRG11LkrlcmvvqJVpz3KxW
	 hyF7r/YuWbMLFV7/fIb8+rRrnhtK36AVhHhD5HiwE/uReBmIguwWaqbMRFuzb+oBon
	 jDl74KUwzoQQaFk/yIg9DgubIRK9s0YNwSUxyxi+beSP98IIc7UaivPlKVieANcfzS
	 itP8bJ0Q2bGeIiNrZrLOVzAURdOJ7EY3/CWi7u8WxS55UD8LzJwCMekmpAXMPb5x8K
	 rUc+T5QnnrVKw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1td33g-00000004DPi-31tg;
	Wed, 29 Jan 2025 09:04:24 +0100
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/13] acpi/ghes: add a firmware file with HEST address
Date: Wed, 29 Jan 2025 09:04:09 +0100
Message-ID: <294577300217e4f7a606f3cb17382fd108c8c021.1738137123.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738137123.git.mchehab+huawei@kernel.org>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: Yz/URn7iALqq

Store HEST table address at GPA, placing its content at
hest_addr_le variable.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

While here, capitalize first letter on a comment about hardware_error
address.

---

Change from v8:
- hest_addr_lr is now pointing to the error source size and data.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c         | 18 +++++++++++++++++-
 include/hw/acpi/ghes.h |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 4cabb177ad47..db6bed010eb0 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -30,6 +30,7 @@
 
 #define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
 #define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
+#define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
 
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
@@ -261,7 +262,7 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
     }
 
     /*
-     * tell firmware to write hardware_errors GPA into
+     * Tell firmware to write hardware_errors GPA into
      * hardware_errors_addr fw_cfg, once the former has been initialized.
      */
     bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, 0,
@@ -349,12 +350,15 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
 {
     AcpiTable table = { .sig = "HEST", .rev = 1,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
+    uint32_t hest_offset;
     int i;
 
     build_ghes_error_table(hardware_errors, linker, num_sources);
 
     acpi_table_begin(&table, table_data);
 
+    hest_offset = table_data->len;
+
     /* Error Source Count */
     build_append_int_noprefix(table_data, num_sources, 4);
     for (i = 0; i < num_sources; i++) {
@@ -362,6 +366,15 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
     }
 
     acpi_table_end(linker, &table);
+
+    /*
+     * Tell firmware to write into GPA the address of HEST via fw_cfg,
+     * once initialized.
+     */
+    bios_linker_loader_write_pointer(linker,
+                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
+                                     sizeof(uint64_t),
+                                     ACPI_BUILD_TABLE_FILE, hest_offset);
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
@@ -375,6 +388,9 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
         NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
 
+    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
+        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+
     ags->present = true;
 }
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 9f0120d0d596..237721fec0a2 100644
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
2.48.1

