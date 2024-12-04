Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp307784njb;
        Wed, 4 Dec 2024 07:59:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUeXcs1dFuqILAsxdxDZOKDIPok1rK/hDT5ogqvL2luKkB020Kx5+ZpPOayhOVykJ2SLqoN3uOFYxQh/A==@linaro.org
X-Google-Smtp-Source: AGHT+IHR3B+uX+7aW3J2lqCHkEbtKUif4YB28VHZRukNSCg87Ee4uMUgskhBlybhWCbP4DNF/aHK
X-Received: by 2002:a05:6122:32d2:b0:515:3bfb:d421 with SMTP id 71dfb90a1353d-515bf303c44mr9670690e0c.6.1733327981878;
        Wed, 04 Dec 2024 07:59:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733327981; cv=none;
        d=google.com; s=arc-20240605;
        b=BTdXPcvWg7Z76MEDwaHY9dQEnQQe86MBdgK4czYc1Wn8ze1WuHykaLBP8ru64ZT/vm
         4OxlgL4i/Vh/r2A2V3oZKQj4KbFrwC3wdhjvEu9FmesQHj2V8DF2zW5IhZdbi7E/jVhQ
         XjrcedlnBwkmSQ+eVsiUyEws4DNyodb19lxIyjtPWjuLq2vQe1RM0xRRzMGKbhVzH9Zq
         hgIdoFReTDPc3Rn1wkDBiQqKIvyNof1M+bQlc1ZSMsaJdAYe0NnLdsatiQGXZbdR22aE
         a1APPDmWptxkLZuy+ERK1fIH7isy/oEl8IcM5mTKCknN2n9tr4y2fDfnDcP0HbU1FBCn
         8yRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7CwxEinX9z/9YC3whAOrtIDR4TKNT4oP6uHCE3HWIyU=;
        fh=rzGDMRJFBBrjbOaW7dLpUOdm+9c++WP8RCbD+hTQXmk=;
        b=cnF9jUgzRBcDkMyVStxtJuJB4pASNyFDcq/DhhBdj/SZ97zyKGS88jHpvS9mQ5PCvm
         KTy5vbS9rqF7nc48pOxgS/o8KUuoj924scvl/souRyR0ganraOQ+Hn2yEoq4Bc1wKfOK
         HenEHcMY/z7lvbZ1RL/Z59TndWVTLzYUmTtUaTqsd9M4SiR3X/kZDmucr4Ah7Z9/pnjL
         oAOA2+fonwMdkBRSRMlLs8KpX1zAuzp89b3YsfGbfXaCe505a2x9T+zxIQvoxBXHVZAi
         W2vLV4k9PskNaRZhOW6vRQMe1vkhij4ZvJAd4O1zA5I+9tjSjM50izv8EDbqrLtR9bV2
         vQ/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="gAB/4wIp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-515df1fa7cfsi320180e0c.37.2024.12.04.07.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 07:59:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="gAB/4wIp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIrm2-0007dF-Eq; Wed, 04 Dec 2024 10:58:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab@kernel.org>)
 id 1tIrly-0007bh-PS; Wed, 04 Dec 2024 10:58:43 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab@kernel.org>)
 id 1tIrlx-00074t-1X; Wed, 04 Dec 2024 10:58:42 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3AF3C5C6F21;
 Wed,  4 Dec 2024 15:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6465C4CED1;
 Wed,  4 Dec 2024 15:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733327907;
 bh=PWkIqGw8xzIQOhMT/EALs64oTgCjzdotXGAcwpZhIhk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gAB/4wIpCYSlr1G3G9EBPuk+LdIlERZ2l7hqeVaTJ268KToJ0ifkmSs/SvcrgzugC
 H5CuEh+QPQLGCxe9iAPwVDMjayaYoiCo9ZEEXXqd4MAgbifiRvGZwA6oUXCFy/i04r
 bIRa9P67rIdkN643jisvG6Ep3qJyRL7c6VOFfcnrZ9x+7lHu/zhi0FzmwmtgN8pkwv
 VP6SdjQTzcxvaGPZ7QB0So8lW/8dcTGmF+DITmrVMkW/sA4KLT9+RgIfoCeAjkbNOp
 RemTp/2ePeC6sGiA7pPjUdHk1s900TYNW1SXw9QXfyStm64+CYIMr8akwt3JvrQON6
 umQZ27A1PiEFQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab@kernel.org>) id 1tIrlf-00000000HYv-3NFC;
 Wed, 04 Dec 2024 16:58:23 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v3 2/5] acpi/ghes: add a firmware file with HEST address
Date: Wed,  4 Dec 2024 16:57:56 +0100
Message-ID: <71b888996a71dc0913c8a26e98464b0fb881da21.1733327276.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733327276.git.mchehab+huawei@kernel.org>
References: <cover.1733327276.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=mchehab@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -100
X-Spam_score: -10.1
X-Spam_bar: ----------
X-Spam_report: (-10.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SaCh4BTiFlyM

Store HEST table address at GPA, placing its content at
hest_addr_le variable.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---

Change from v8:
- hest_addr_lr is now pointing to the error source size and data.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c         | 17 ++++++++++++++++-
 include/hw/acpi/ghes.h |  1 +
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index b77e5c9d1b19..4a826c8ca6d4 100644
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
@@ -355,6 +356,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
 
     acpi_table_begin(&table, table_data);
 
+    int hest_offset = table_data->len;
+
     /* Error Source Count */
     build_append_int_noprefix(table_data, num_sources, 4);
     for (i = 0; i < num_sources; i++) {
@@ -362,6 +365,15 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
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
@@ -375,6 +387,9 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
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
2.47.1

