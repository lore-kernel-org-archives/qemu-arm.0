Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7224282njc;
        Tue, 12 Nov 2024 02:16:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVFhHLy6sfF1jmkJE7l5ncsNmov9hOHbyyNjX9NvWPK9wsfipyqDWGsbIc4aT+MsYSbBKfsI9VzmtxS6g==@linaro.org
X-Google-Smtp-Source: AGHT+IHGHk5rhagRhfvMlo3QAIZVk1vdtF16f9aPD+y+6AFJdvwfqFn3UzFHaeCsoBo8R8bi0j7m
X-Received: by 2002:a05:690c:6e0a:b0:6e7:e22b:fb80 with SMTP id 00721157ae682-6eadddbae52mr147474427b3.19.1731406615267;
        Tue, 12 Nov 2024 02:16:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731406615; cv=none;
        d=google.com; s=arc-20240605;
        b=iXm4atrGqQ45VV9RWLbG7sXVlniP4HA3xWGD2FambVaQUd+TGL7Swe//aufXddPUcg
         Mb4GxehIk5TFIC0MB8nLGoCnf5eX00iLDUqn4PM2+BguOnR/78vEMNKI02AK3Qda++Jn
         ANFvi+hvtUhUQqd+y4Dxt0y47AA28Yx0YAdhgG1ceuuwva7ZQ/KvtyNDv/XW2FajS0xw
         QbMvNZl02J7HthXshBrVpdlPrml9qKzs0Jrtsy80KER7IxW1aQWZSo/z7XVzw2n4rR3C
         Bu1alCx57qYKFF8r17GsHVMOgcwF2rcW8TxIH12bsmkYGjzm+PW5bSxt0E6jXUo2tZKH
         Fz3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WhwCdiL5xqOeEi/QBJu622p0Wb3wSO+CYfeX33qfrLQ=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=hkcrMG8VmtYfLBOhC+OcQhWJfbujtKgB3fl1nkfHLG8xgzBUl2RrcoUvu2dF7xf6NB
         AxZPqJf+pDdr0fH90MzgSusTU3F+oUYl4MsxtiEjBxrZcHLHJ/PNkQ/J5DxQFcPAXltf
         VJQZvcMr6wGdqiWRR1q8EelNwhHI9SFXHfBtFLgpZMycItrVUgYStFlLmkhgnldHiMrM
         EY4pECHug1PmnCRrUOuVqXpjv6opQ31uS8flnDfUPvX6BE8G+Mm9Wx+YhAOXOIQeydmk
         BSyzWMnew8tBrIV142cELu6BScDyq6AByFy2VIhsQye6tk4SaKeAMkuBymRMtm69mGYs
         4srQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=c5WhjVKb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d39664b796si135061416d6.282.2024.11.12.02.16.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 02:16:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=c5WhjVKb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAnvl-0004aT-6L; Tue, 12 Nov 2024 05:15:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvf-0004Ww-W8; Tue, 12 Nov 2024 05:15:24 -0500
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvd-0008PO-6j; Tue, 12 Nov 2024 05:15:23 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 83D3FA41872;
 Tue, 12 Nov 2024 10:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CE0C4CEE1;
 Tue, 12 Nov 2024 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731406510;
 bh=/J8Ik2gV7ARAny61vMhfWIVszDkkmW/W+wjqFlb9x4g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c5WhjVKbp89mZGQ8ENJ+ekeuQgF+pzk2iBX7qQCTkMiowXlV6nALu8ICEfF9PHvf2
 fFh8Yg772DnxhhYOZNJ4p/WXTQThcwnuDrGHgjU4OVcX1ON7ThKpvfC6TCQw0T/PK9
 KDRAO8fqM3MhyvGTRmeBSsn9aeSAzWdXGSacwUZspI2tPFj2zWWHv9bnKsVZwfizKz
 LtRajCjRYFel0UfrPyQ5WYUcpw94FrdMAhznq7r8euLwzjtjJDXasLdNF+dRzFb2vo
 0E/kM1whKn8iJn6BvvYKbXor+eBtW8QDAae1BGyb+M23esUPz7oFwtEwRh0wv1WPkq
 mHPgacVrEMj1w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvP-00000000Jcn-0H5k; Tue, 12 Nov 2024 11:15:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 04/15] acpi/ghes: better handle source_id and notification
Date: Tue, 12 Nov 2024 11:14:48 +0100
Message-ID: <c3e608a16a795b2d2be476eddc3707febcdb1ca3.1731406254.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731406254.git.mchehab+huawei@kernel.org>
References: <cover.1731406254.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: KwNu4+C3TZ2c

GHES has two fields that are stored on HEST error source
blocks associated with notifications:

- notification type, which is a number defined at the ACPI spec
  containing several arch-specific synchronous and assynchronous
  types;
- source id, which is a HW/FW defined number, used to distinguish
  between different implemented sources.

There could be several sources with the same notification type,
which is dependent of the way each architecture maps notifications.

Right now, build_ghes_v2() hardcodes a 1:1 mapping between such
fields. Move it to two independent parameters, allowing the
caller function to fill both.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---

Chenges from v10:

- Some changes got moved to the previous patch.

Changes from v8:
- Non-rename/cleanup changes merged altogether;
- source ID is now more generic, defined per guest target.
  That should make easier to add support for 86.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 4a6c45bcb4be..29cd7e4d8171 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -284,9 +284,13 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
 }
 
 /* Build Generic Hardware Error Source version 2 (GHESv2) */
-static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
+static void build_ghes_v2(GArray *table_data,
+                          BIOSLinker *linker,
+                          enum AcpiGhesNotifyType notify,
+                          uint16_t source_id)
 {
     uint64_t address_offset;
+
     /*
      * Type:
      * Generic Hardware Error Source version 2(GHESv2 - Type 10)
@@ -316,18 +320,8 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
         address_offset + GAS_ADDR_OFFSET, sizeof(uint64_t),
         ACPI_GHES_ERRORS_FW_CFG_FILE, source_id * sizeof(uint64_t));
 
-    switch (source_id) {
-    case ACPI_HEST_SRC_ID_SEA:
-        /*
-         * Notification Structure
-         * Now only enable ARMv8 SEA notification type
-         */
-        build_ghes_hw_error_notification(table_data, ACPI_GHES_NOTIFY_SEA);
-        break;
-    default:
-        error_report("Not support this error source");
-        abort();
-    }
+    /* Notification Structure */
+    build_ghes_hw_error_notification(table_data, notify);
 
     /* Error Status Block Length */
     build_append_int_noprefix(table_data, ACPI_GHES_MAX_RAW_DATA_LENGTH, 4);
@@ -369,7 +363,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
 
     /* Error Source Count */
     build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
-    build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
+    build_ghes_v2(table_data, linker,
+                  ACPI_GHES_NOTIFY_SEA, ACPI_HEST_SRC_ID_SEA);
 
     acpi_table_end(linker, &table);
 }
-- 
2.47.0

