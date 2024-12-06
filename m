Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1013928njb;
        Fri, 6 Dec 2024 09:22:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV289x6Bm/wTP/GgPxvdXwv2cGivuMQhDjPTXJO/Jpuq8bZtWQ8FwEqEo7uCTxGn1P1nKnDAneXfD8DRg==@linaro.org
X-Google-Smtp-Source: AGHT+IFOomzXalVcKHmvOpzvkzojz1z21V7hQ3w6UnaMdXF0ZKNbDn7HTZ4JS2UOL/7V0R6lPmlB
X-Received: by 2002:a05:6214:529b:b0:6d8:8f3d:4d82 with SMTP id 6a1803df08f44-6d8e71c73f7mr53531556d6.46.1733505755678;
        Fri, 06 Dec 2024 09:22:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733505755; cv=none;
        d=google.com; s=arc-20240605;
        b=RObYf2+hC8uFjUiBasOYEp/ZcPQ1TiUZace4iWuIL7sn0wseFrQn9JWgvLIbo8Neyw
         hmQXWTe26SlhdTgwl5ae/0N4ip/cswAtTYqIyLEzcgwnrZsMlL2bQcxIA4ntQwbAkjc+
         aV+gNe/dIhESIOBr0WDhbNmmdqavbXB/N7EsiulKfglfYAUv5FSfrMYycUJNlP+MJ+TW
         eqGKgz2U1Rz91fQanF6xNPncU54KFkiyg1GNsWXwtDcjhmvrDPvofkwfjVrrKrWxrnHr
         Jt5BdQ4IvhF+mZxMvdnSCcJNDmTfVs9HExOO2GaqEXeMo0VMs7OicRa0f5PcJRYggdH9
         gYOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7CwxEinX9z/9YC3whAOrtIDR4TKNT4oP6uHCE3HWIyU=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=VmiW8O8Eml1UZrMMobRW2ChyAPe0Z2t1EHBz0MdgZboBFwFi0S1bjZRjotUX5CmPGA
         N5kDTWZ6+Ojcma7ME1FfOiEZ1KDtsG+AfTweQbqE64HdDj1lPADG3xooeXj1RX9u/RmE
         ozE7TfFEDmE5cw4gojai771JtoPICdJLwP4g+FNAfkK6ic2ahav2ZVKGCDW6VEzo8CXQ
         7NxEYqYyAbCCZCrrdWC19AOCpMvVKl2c8I6qegJLHSrmYYXj/sBlvdRFmhBSiD2TIwR/
         +XbXeSst4iWh/nNTyRMR3pXbZi0mnXqmYmUHS76u9bzyy3Uy/gd0I2/JKZwWPA9H0spn
         ybpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nYFgA7kf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8daa07c85si19862236d6.257.2024.12.06.09.22.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 09:22:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nYFgA7kf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJc1j-0004UM-Sr; Fri, 06 Dec 2024 12:22:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc1N-000467-4t; Fri, 06 Dec 2024 12:21:41 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc1K-0000wj-AB; Fri, 06 Dec 2024 12:21:40 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6DCF95C67D6;
 Fri,  6 Dec 2024 17:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B211C4AF0D;
 Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733505687;
 bh=PWkIqGw8xzIQOhMT/EALs64oTgCjzdotXGAcwpZhIhk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nYFgA7kfPgLzCXiti2bi0Cblr3R7uzgu6PTq6RSVL2daS/IzKDFvqlPn5LDZ5gUVH
 ZRnvYR+2NGoGZ2eW5TNSNKmqaYC1b6/3RzejXykL3YcexdBT95N5eglQGEYP6yLus1
 lBtthWShX+5Xvu4801dS6yDiYfocmEa/7ztOgK7Ndzl47pqoZw7LvEOwGZhdrfaLZK
 yjU9gmSaqu0wANQctMTEW9V0BAD7qumPXdPN6YtJVN+Xp9FT3hu3jaqhV7gMMNHpEO
 FPvxCXqcTSI1kOH402T4MLTFrB2Og0rXNXHIPQe4w7wiPEJWnNM8CNVewc5poUSsh4
 +dWATJoFZE9UA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc17-00000005RKU-3i7J; Fri, 06 Dec 2024 18:21:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 15/31] acpi/ghes: add a firmware file with HEST address
Date: Fri,  6 Dec 2024 18:12:37 +0100
Message-ID: <2e05b55365ad2d9269a0fd3ebfe6991fda489207.1733504943.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733504943.git.mchehab+huawei@kernel.org>
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6KraJgYjoRoS

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

