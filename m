Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp1960408njb;
        Sun, 2 Mar 2025 00:22:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX7hIKfvH/gPp/0h0kYazMcyhukWCmTgAR/ojD+OvjkNRa1zFo1Ewev5zYf2Lghgm6nCsduUmA1R8zz/A==@linaro.org
X-Google-Smtp-Source: AGHT+IHE859ZUV/yU9hsq1ZmVqM6Je/R5RkL9kLDD5Sj52YmmD9/iNLBGRSqeWjeyFWa7zrFcth2
X-Received: by 2002:a05:620a:430e:b0:7c0:86c7:1a46 with SMTP id af79cd13be357-7c39c4be8aamr1156927785a.23.1740903770461;
        Sun, 02 Mar 2025 00:22:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740903770; cv=none;
        d=google.com; s=arc-20240605;
        b=kDljwvk0GaIYiwJuoP+pIZ0R4kygZvqctCAfQyGbnJor7B3JmkVo7fs4RI238qIarA
         g044+PNtu5t7to9AR3SWL8MppXWgVEZCj0+6DSL6+LToc4QyqugjZEQUwOwfhrEO8nuz
         LFU1r8weEjFsXr9lf9eYq1Bfh6IK4BbkERRvA0GTBtZhp9+cJuogrL2U+v2xxJxQAJ06
         P347OUlPqLRyKbh+oRfPLMjnRHHgUygfDOF5lRyOcvVa5f+UEw9sjEszAo3Z1Z+hpW7z
         uEFvjuUUtSa/aHIccfL3puixzOsRYXrEFJn0pRXSE3gEnPiP0tDouXuTYcGwjBh2Hil1
         GATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=X1l+S3feqsbgzv9hPmwmshezNLpLmBcY545xptEy4LQ=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=LskfNl4FwuyB+wv1YZahZdt7J8ufSZLJTT7XR5+n1W58sS7W0uT1PpH2FGw3o1KGl6
         T7DWKG/yBdOxLpwuBWMyzSDJODrmvqucuShkNbkghuAMsfArXZmP+BkwkBdqhKtn0dQG
         8cb39ut/geqD846+Vq780eUVc+2vkd97PbsmzEL4pzbIs0mdYL9/Z8mCvhqoIXauWxYw
         a1qnWhvhd/IDPXdwgy4KoypXKVonoAktCkaICPpvrZ/Ea8cXufdHgudli4jpxUYnKJ2P
         cZIEWm1l/WrD0dNeQgaPI1WxvHg8FfYfS3M3zmtI7cmHmo0qm5Q7rvoBTV5bqpbD5N3I
         XSIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=JT9Xvo5+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c36ff6d9c8si634393685a.221.2025.03.02.00.22.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Mar 2025 00:22:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=JT9Xvo5+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1toeav-0005wi-LM; Sun, 02 Mar 2025 03:22:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1toeap-0005iq-MP; Sun, 02 Mar 2025 03:22:35 -0500
Received: from tor.source.kernel.org ([172.105.4.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1toeak-0005gG-5G; Sun, 02 Mar 2025 03:22:35 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DEA1A611CD;
 Sun,  2 Mar 2025 08:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4C3C4CEE4;
 Sun,  2 Mar 2025 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740903737;
 bh=8BoyWsZH7yMX5VJVVDi6rK24BbVZK+x44gJfcWJ6v2o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JT9Xvo5+PupCJQH5/yyURi7l8xB/YgXTOqTMckA/KucluhC5V8qQ1zOhdLGkK/UgR
 IZsHMMrMY6CNF0bmmZLS1ylz0nWTCTTgNNv8WTzJllLd11cWcA3Dzn6ZvdFRU7ZgKU
 sy1/YiQeep7sM34LI55W0FSlpGceipTiYMW+ZOD104iRVqrad/zK54t/sMnDKKqKI7
 vHDj4yZKYUwrOc0igP9T+yVMG6uD56lStooKFVQqe3/91CGVz0mNvYf89eFMxk5SEN
 FnBz6oNntoVtzQ/z6swxPdS2R6eb8S89InmShk0mHx3g86/YzIOlRnOCYIA/StsrUp
 f8ZpTFPHayWzA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1toeaU-000000043Rs-2cCf; Sun, 02 Mar 2025 09:22:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 06/19] acpi/ghes: add a firmware file with HEST address
Date: Sun,  2 Mar 2025 09:21:53 +0100
Message-ID: <ce879a83b47f7fe3e6671a340892db71cb376382.1740903110.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740903110.git.mchehab+huawei@kernel.org>
References: <cover.1740903110.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.105.4.254;
 envelope-from=mchehab+huawei@kernel.org; helo=tor.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: kguuliZHpQLc

Store HEST table address at GPA, placing its the start of the table at
hest_addr_le variable.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c         | 22 ++++++++++++++++++++--
 include/hw/acpi/ghes.h |  6 +++++-
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 9243b5ad4acb..cbc96c1909f0 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -30,6 +30,7 @@
 
 #define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
 #define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
+#define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
 
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
@@ -341,6 +342,9 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
 {
     AcpiTable table = { .sig = "HEST", .rev = 1,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
+    uint32_t hest_offset;
+
+    hest_offset = table_data->len;
 
     build_ghes_error_table(ags, hardware_errors, linker);
 
@@ -352,6 +356,17 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
                   ACPI_GHES_NOTIFY_SEA, ACPI_HEST_SRC_ID_SEA);
 
     acpi_table_end(linker, &table);
+
+    if (ags->use_hest_addr) {
+        /*
+         * Tell firmware to write into GPA the address of HEST via fw_cfg,
+         * once initialized.
+         */
+        bios_linker_loader_write_pointer(linker,
+                                         ACPI_HEST_ADDR_FW_CFG_FILE, 0,
+                                         sizeof(uint64_t),
+                                         ACPI_BUILD_TABLE_FILE, hest_offset);
+    }
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
@@ -361,7 +376,10 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     fw_cfg_add_file(s, ACPI_HW_ERROR_FW_CFG_FILE, hardware_error->data,
                     hardware_error->len);
 
-    if (!ags->use_hest_addr) {
+    if (ags->use_hest_addr) {
+        fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
+            NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+    } else {
         /* Create a read-write fw_cfg file for Address */
         fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
             NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
@@ -484,7 +502,7 @@ AcpiGhesState *acpi_ghes_get_state(void)
     }
     ags = &acpi_ged_state->ghes_state;
 
-    if (!ags->hw_error_le) {
+    if (!ags->hw_error_le && !ags->hest_addr_le) {
         return NULL;
     }
     return ags;
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 411f592662af..ea9baab764e2 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -70,9 +70,13 @@ enum {
  * When use_hest_addr is false, the GPA of the etc/hardware_errors firmware
  * is stored at hw_error_le. This is the default on QEMU 9.x.
  *
- * An GPA value equal to zero means that GHES is not present.
+ * When use_hest_addr is true, the GPA of the HEST table is stored at
+ * hest_addr_le. This is the default for QEMU 10.x and above.
+ *
+ * Whe both GPA values are equal to zero means that GHES is not present.
  */
 typedef struct AcpiGhesState {
+    uint64_t hest_addr_le;
     uint64_t hw_error_le;
     bool use_hest_addr;         /* Currently, always false */
 } AcpiGhesState;
-- 
2.48.1

