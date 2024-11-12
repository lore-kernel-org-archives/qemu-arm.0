Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7223618njc;
        Tue, 12 Nov 2024 02:15:21 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWTbeh0zwFriQ7ReBY0sqfAbffeuPTayjLeEYKVUYkAGa7wZ+1ef5+MuYhFV2vfA6OvVmLHJUa/4S5Aeg==@linaro.org
X-Google-Smtp-Source: AGHT+IHX3Bk0oEJ3TMbObT6Q28GX3E8snnumMfZyJnJ5aKfPB6i3m1t0ZamUo/LhPMy8it51J82N
X-Received: by 2002:a05:6402:5241:b0:5c9:4b8c:b92e with SMTP id 4fb4d7f45d1cf-5cf0a43f0b7mr21564800a12.26.1731406521291;
        Tue, 12 Nov 2024 02:15:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1731406521; cv=pass;
        d=google.com; s=arc-20240605;
        b=RtyeOkqTdEbHjusnYRURds6lBb5i/MoTjNB/kcVN6oXoRB15t5aXSk5oQNdi4dS4Am
         8dt4sH5b2CczXwnbd+unsGOVRVkJNH9Xao50raEFeBQIcvh6zsml3IPEFRKmkJx9AyzC
         FW4LWRZQ+q4cFZJ44F0C/nSeFkOuWV65aZ4akLbuhgSlGg3IQHB9GnbFmc+k6RWsDOnN
         ZTWWzgaJ6zPf427S41jITlAa5w3Fs7PAX7/H+eZ91jQf4nrd28sxiEbqzAZHMbGMiMKA
         2s0+jct3jQQ7w/G6+a8jJwGNpBApT9I6Bqq1Ov2Uo9BEanzglzCfn+lz3yRnK0srazbm
         jw4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=WfxdaTTBcnvKoBM8QNmLFFrJsK8LhrUHEuKxVmRS3kc=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=IX8/BeTRUkFzgnit43a2joVIG6Rw0BOUP3TPayCpe/hAmTTlp2Dk8eKL9RUHP/2AoH
         U5bBxFlFWx20iDw7SMw4OlBJChdfw2hpIRyFGaCjcE/3AIPXG5D3NwUMKAjjh1BKb/NV
         DaXC6FTZUx09wLufZANjxFN/XzTv33CFnhnkRKPipl2blctGkzteE3C73N6HxJsJ/+k/
         sFM7O3gc8EH3PsI2junmla4eMsKJ+T9EjjJWlppjhFnezFuqnJX9gSQalaQd3CDQV/re
         t8Nk7Tgocfo5XmEVa5iTZdYQnMRi1NGDIKguRPzNN34Z9eFi8AUBdTerMcfhQqC6CJvY
         /vrg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=t0UztSzR;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-405560-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-405560-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-405560-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5cf03c9bf36si7697189a12.334.2024.11.12.02.15.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:15:21 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-405560-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=t0UztSzR;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-405560-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-405560-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B59701F22457
	for <alex.bennee@linaro.org>; Tue, 12 Nov 2024 10:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EEA2123E3;
	Tue, 12 Nov 2024 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t0UztSzR"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3589B2123C5
	for <linux-kernel@vger.kernel.org>; Tue, 12 Nov 2024 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731406510; cv=none; b=j97Cuwj4wwZ+DqWf3wmr5nWtytFrHTMyiR8CH5a5VI6EkCN4vU+ZiSWulzah/ahl2q7EVOGXxLGBatZ6lvX5+4brnMLlO1tSJaNzscQdq4xwq3g4/zHv0trha59LAS4osvlgdDckPaXX0OHF0dUcCGaxCxXFWNFBJW7dFvZgla0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731406510; c=relaxed/simple;
	bh=0ZOz1y0zUZnfATU6KF0jVwbnNhs6of5oTSBzFmpYtvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F27exPwuWxdd35M8HNaZD3gdN57xvCOQde9UI4FtJMwVWlN3TQ1PyEwgFWK2eQMmTdp+/lqFe+ihrdmQPyWGnBDedYFKe942CWc0YeBxiH0awxGX52NMVXh6aFLN8Y0xBvmnbJ8GzUPS/fK4vueC3X/xzFWj0KwNhI7YoHDJku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t0UztSzR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F42C4CED6;
	Tue, 12 Nov 2024 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731406509;
	bh=0ZOz1y0zUZnfATU6KF0jVwbnNhs6of5oTSBzFmpYtvY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t0UztSzR0nAub5FJyGl9IIF6gvrmu1IsipZPEWQR1r6tCBeKjWcF+AtPaJ1TC2aOr
	 YCYB08aUzxbwhEf1NEzt0XVO1svek/oqdU+zyx2ciJyCVuAOIsRkIxCZbafmsNkYBG
	 t9ClT39T4o/FGFcTrINn/YB1+NSggOiGU+K4yzOP7YIdgxlIZM1aLyu2jkafFrhO4H
	 7lJKy3bfbld47zz6R7No703EuVBH/lzzy9hyUlS4T+tlRlO/I0Z5scz8va5OrLkZwA
	 OVHLHa9d3Yu7AHeFLVkJoFcs4n0NjCdPULnrt8heUIX8/vkJYGXe5TepXUUFl3H8Ly
	 85AR8jrd3txFA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tAnvP-00000000Jd9-13Vb;
	Tue, 12 Nov 2024 11:15:07 +0100
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
Subject: [PATCH v3 11/15] acpi/ghes: rename etc/hardware_error file macros
Date: Tue, 12 Nov 2024 11:14:55 +0100
Message-ID: <1da667f2ed726951605e3a19610a5f1c4f210f06.1731406254.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731406254.git.mchehab+huawei@kernel.org>
References: <cover.1731406254.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: fm+RCBMsYx5A

Now that we have also have a file to store HEST data location,
which is part of GHES, better name the file where CPER records
are stored.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index e15a411b47e1..f698951630e3 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -28,8 +28,8 @@
 #include "hw/nvram/fw_cfg.h"
 #include "qemu/uuid.h"
 
-#define ACPI_GHES_ERRORS_FW_CFG_FILE        "etc/hardware_errors"
-#define ACPI_GHES_DATA_ADDR_FW_CFG_FILE     "etc/hardware_errors_addr"
+#define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
+#define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
 
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
@@ -240,7 +240,7 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
         ACPI_GHES_MAX_RAW_DATA_LENGTH * ACPI_GHES_ERROR_SOURCE_COUNT);
 
     /* Tell guest firmware to place hardware_errors blob into RAM */
-    bios_linker_loader_alloc(linker, ACPI_GHES_ERRORS_FW_CFG_FILE,
+    bios_linker_loader_alloc(linker, ACPI_HW_ERROR_FW_CFG_FILE,
                              hardware_errors, sizeof(uint64_t), false);
 
     for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
@@ -249,17 +249,21 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
          * corresponding "Generic Error Status Block"
          */
         bios_linker_loader_add_pointer(linker,
-            ACPI_GHES_ERRORS_FW_CFG_FILE, sizeof(uint64_t) * i,
-            sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE,
-            error_status_block_offset + i * ACPI_GHES_MAX_RAW_DATA_LENGTH);
+                                       ACPI_HW_ERROR_FW_CFG_FILE,
+                                       sizeof(uint64_t) * i,
+                                       sizeof(uint64_t),
+                                       ACPI_HW_ERROR_FW_CFG_FILE,
+                                       error_status_block_offset +
+                                       i * ACPI_GHES_MAX_RAW_DATA_LENGTH);
     }
 
     /*
      * tell firmware to write hardware_errors GPA into
      * hardware_errors_addr fw_cfg, once the former has been initialized.
      */
-    bios_linker_loader_write_pointer(linker, ACPI_GHES_DATA_ADDR_FW_CFG_FILE,
-        0, sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE, 0);
+    bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, 0,
+                                     sizeof(uint64_t),
+                                     ACPI_HW_ERROR_FW_CFG_FILE, 0);
 }
 
 /* Build Generic Hardware Error Source version 2 (GHESv2) */
@@ -296,8 +300,10 @@ static void build_ghes_v2(GArray *table_data,
     build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0x40, 0,
                      4 /* QWord access */, 0);
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
-        address_offset + GAS_ADDR_OFFSET, sizeof(uint64_t),
-        ACPI_GHES_ERRORS_FW_CFG_FILE, source_id * sizeof(uint64_t));
+                                   address_offset + GAS_ADDR_OFFSET,
+                                   sizeof(uint64_t),
+                                   ACPI_HW_ERROR_FW_CFG_FILE,
+                                   source_id * sizeof(uint64_t));
 
     /* Notification Structure */
     build_ghes_hw_error_notification(table_data, notify);
@@ -314,9 +320,11 @@ static void build_ghes_v2(GArray *table_data,
     build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0x40, 0,
                      4 /* QWord access */, 0);
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
-        address_offset + GAS_ADDR_OFFSET,
-        sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE,
-        (ACPI_GHES_ERROR_SOURCE_COUNT + source_id) * sizeof(uint64_t));
+                                   address_offset + GAS_ADDR_OFFSET,
+                                   sizeof(uint64_t),
+                                   ACPI_HW_ERROR_FW_CFG_FILE,
+                                   (ACPI_GHES_ERROR_SOURCE_COUNT + source_id)
+                                   * sizeof(uint64_t));
 
     /*
      * Read Ack Preserve field
@@ -352,11 +360,11 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
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
 
     ags->present = true;
-- 
2.47.0

