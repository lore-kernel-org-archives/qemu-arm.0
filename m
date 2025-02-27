Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp140530njb;
        Thu, 27 Feb 2025 03:04:22 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCW1I3cKDVAEBptr5Hx6SJ3dIRrRlQaILXIt2mpVNNXxsJMl11YllzrvE2bbue1y7PmnDD+XGskEwCI1Sg==@linaro.org
X-Google-Smtp-Source: AGHT+IFlL9odIIefKT9taxxosx037++FwZ/HsJIiPGbt64jyilgPJ1qk3t8osueSnmddVXRtKv8V
X-Received: by 2002:a05:6214:d46:b0:6e8:95b2:d4d2 with SMTP id 6a1803df08f44-6e895b2d6d5mr41365506d6.15.1740654262666;
        Thu, 27 Feb 2025 03:04:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740654262; cv=pass;
        d=google.com; s=arc-20240605;
        b=bK+d+jThX4nYVD2CV7ZIHNuUpXXbBk+N0gV7Ql+w2PvoEr7Q5G58JsqzbX0G8TU6GP
         a4VBJGg9UsTluZEARsCVb+IKCXaormAVgosrnaVIb4JtpXjj7gtZigWpLxk2UI1o5XGM
         R+AYAJloao70Dg9SOycrh96ygv929iN4RJtHMoTIFB5CxOYcyiiLcb0nTiHkGJgzb0Fa
         GgdBKDPCfU/qbf/YjtzwkIRoa9q8rJMOd3JvRbAOPETJGiH7U2rOw4dMU8qdI4l+kjR+
         mDLkRZ7831ggY56MjfjRcySYdTMg7KBIYeCn81IzoC4J98PN5C/ti0FDTTdyB7g+vAcJ
         AAIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=dfPCWUEkvbF/cQC3HZO8ixEGJ2TTv0/wImwHEUqqn1k=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=eioDfVSEox9sjkIQVmcXIUSjOuJkY9Pamp0NTVgrGntgDSx87hnd97aC9anH3K9cXV
         XYuU6JjrMROxe1flhGbfrE8a9DhffA7yv+kLYqAzPu6FPU2mmeDbmjJXWQqA4n61ZsQr
         3uHndG744pS9uWIWurgyHpHJHW7Gka1WKA0UTFRk6J8JJWQqTsEd5kGd2Ofg3aeghZ53
         Kddnd/liTfccY8hRhzuum4P5OjGqGVExZ9UKyt/ovDUaOmfRqWrzYkjYwogF7kcYF2D9
         /rSCKq9I2x13JUG0y9kz8ZEUS06GgitYmFp59NE3+TcxqhDAC7L6Hn5cG+YtSFJPca0N
         VfzQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=TXqmDtea;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536068-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536068-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-536068-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e89798b885si9833226d6.386.2025.02.27.03.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 03:04:22 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-536068-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=TXqmDtea;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536068-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536068-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7E0716AA49
	for <alex.bennee@linaro.org>; Thu, 27 Feb 2025 11:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD95122B5A8;
	Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXqmDtea"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796C122AE4E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654238; cv=none; b=mtUKJeKbR+fvjbGe7FzbigcAek2jifJjCCYk/htz72+GnM2uDrhRof7FgnBGwtaP0gFM2G6FKLuTNvCUncIsEhxARb64J6aXJNwq/p/YF3t24vggaqW+rmW8c6D3XbCwmNe6AytXHO8L32/wHy3U1NeDwWUYCrYkzSf9I0ZE4eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654238; c=relaxed/simple;
	bh=XYmCAO03K7PjNg3F4YvDIfzrnLiWeCjqMYdceVKe+TU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dNXSWktXi4dzDZjWCME656juDiyWSwu9+4vXi8NPe+bdLuV2JXY3uwWNoRizrOVi72AOTHkL8RTKYMT93bjcvyN6Ef5613e96oNaJ8KCmO/Yz1/+7pWIpCsn3ogVpaUP3wgf6W4HaZGf+JBPB3R8035V8FF6UWn/R9UyMAvoHa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXqmDtea; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02597C4CEEF;
	Thu, 27 Feb 2025 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740654238;
	bh=XYmCAO03K7PjNg3F4YvDIfzrnLiWeCjqMYdceVKe+TU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TXqmDteaKPPHQ5FJ1CsXZ3js5G/Rn3n9BKvPS0epJ6FK+/vdCY7FoxkclCdvOb3LI
	 vDAsaTNd5vo2Eg5s9mBVV5t1CCP3w1hvFOWx5h2/RnpgrYoVFxsiaoLRa5oMmmCgLX
	 92J+Kksz5rxbagXq3Ulu7No5PveZvXBExTnzz68niRE70MDMae/U374De9L9DpXXGd
	 19PUmmJC3EjxqxAAuzPbXJ69rKCjGaNfMxodv6I+aKf9hx/fPRoR+R3KAe65U9yTN/
	 aaYbulm+TGxjmqxWBLKcOxCu+/0iiArkVuqjUFKs9jLXavuhrv6WImbERLvDzaoHb3
	 RMP/0fIGJ3CTg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tnbgK-00000001mQu-0gLI;
	Thu, 27 Feb 2025 12:03:56 +0100
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
Subject: [PATCH v5 06/21] acpi/ghes: add a firmware file with HEST address
Date: Thu, 27 Feb 2025 12:03:36 +0100
Message-ID: <ce0db0a85f31a58c44e25198f0ef3614c717cb07.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740653898.git.mchehab+huawei@kernel.org>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: Dp8Q2ZkTk7H1

Store HEST table address at GPA, placing its the start of the table at
hest_addr_le variable.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c         | 20 +++++++++++++++++++-
 include/hw/acpi/ghes.h |  7 ++++++-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 9243b5ad4acb..8ec423726b3f 100644
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
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 5000891f163f..38abe6e3db52 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -70,9 +70,14 @@ enum {
  * When use_hest_addr is false, the GPA of the etc/hardware_errors firmware
  * is stored at hw_error_le. This is the default on QEMU 9.x.
  *
- * An GPA value equal to zero means that GHES is not present.
+ * When use_hest_addr is true, the stored offset is placed at hest_addr_le,
+ * meaning an offset from the HEST table address from etc/acpi/tables firmware.
+ * This is the default for QEMU 10.x and above.
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

