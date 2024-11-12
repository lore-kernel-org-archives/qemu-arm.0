Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7223948njc;
        Tue, 12 Nov 2024 02:16:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWvv6HvcugFHiDavWatzbaqghQrYC8hpDNJ6yejM23GQkriSrMlN3iVLa9W7ROuhw/7wqQl0yVp4Py7cA==@linaro.org
X-Google-Smtp-Source: AGHT+IFHOMCj23DvcRBwL+BUP7oQsI7rC0jfBoxUM3ldx9JwXQX3uGaYqteKx/XoGp9SVGcixEyI
X-Received: by 2002:a05:6214:310e:b0:6d3:7712:b223 with SMTP id 6a1803df08f44-6d39e1552cemr214309826d6.7.1731406569018;
        Tue, 12 Nov 2024 02:16:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731406569; cv=none;
        d=google.com; s=arc-20240605;
        b=HzcS5kadp8TAoVmq0vVnR9GDwx8w6i/0oBn6Xj+KMLeXEwWkDPtMfb7yUg7L1H7f47
         +xuBNpKFb4Yl82ng3qAuIq2i/TDPMVakjH5sDOtwLPddJ5V/4vGVx14HZnwsL1LoAe38
         m2N55a/dqp+isKI+Tu3DsLEcQeQGnh1Z0ilbFVzmHmAGe/KVN3kojtd6QuMeV1YAOvKl
         tuGUT6UkEyDbKwYCxvS9aBs9A3sOo9WT0w8wz0OLivxRWtRd3HqyyaW17VcnmtTz6WiK
         ULhlIAp1CZOyFWgb1Iufg10yhKQ1j1XVIjabcd2eqHyPcDPkGXmoEGZlapA31vi1Doql
         z1nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8amq55IZRQZgH2ZCoGsccchNF/STDgViheUCCDqJoI4=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=lv4ZFOkZ5KDswkrgNmdE6u65L8uiKpQRBEtAuAz6gunJSZJfAK7Ff/htuuIZkX62K1
         Gd9BX36YWx/T/5LcGVZJjIa0DBv/ljQ1tz0djNqEGPjUk96MCJiZnZ3U7V/rKLLZGxPK
         h+Fx4FTUv+BDrtubANdfSSkkbqNFWZgr1wF0BdYzqTBXPz4Nas1sD0sZTYoTBwTox9oC
         ye7Mk8RxyQJueKBoxhyEEXHKQUedaSDjw3SSXGHO8jT+5ipHYgovkfj0WC4F5k++8ikb
         sZFl4jiIsI9i66wNBgVUmiQloYO4LZ3pkJ5wIowIDPTnfMGdJi334oU2opdnnIQwE+8q
         yaBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=o3gi0WvQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3962100dfsi140148116d6.78.2024.11.12.02.16.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 02:16:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=o3gi0WvQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAnvw-0004iz-U9; Tue, 12 Nov 2024 05:15:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvg-0004X6-2x; Tue, 12 Nov 2024 05:15:24 -0500
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvd-0008PK-5D; Tue, 12 Nov 2024 05:15:23 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 525A4A41867;
 Tue, 12 Nov 2024 10:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5432C4CEDA;
 Tue, 12 Nov 2024 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731406510;
 bh=u/evd6VNZ2Rw7eUqK3iewtjOB7zhkG2fVMmc7C1F68o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o3gi0WvQopWRICupoKmFr1/G2yy/lvOucpAxA8nWQzbkX4ZUeTDJzOubk+X766vx2
 p+oLh57elIvjxVJMFIuOIeC78GigrKvOCWWrEuOykkcxAiVlHtbmLJcofis3J1zNkx
 ILcVDTEZWbYM2Pjamz8HIRVYG7elsqcbUc033GvbmeLYgXruwQWx0PRhAGRGwHLqUw
 Pns7tbck44vXxBgM4Q+f8Nskxi7UkO2UoHvlPQz2hrKjumVne3NYADH9JNB4757jyb
 nDLjJ/ZNOZq+q9yIT83p8sMJbX1ajs7hZ8JsMHLifyksUdpVGVcO2LlrXLclDsdo6t
 Q7LlqB7lDbDiA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvP-00000000Jch-03JF; Tue, 12 Nov 2024 11:15:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 02/15] acpi/ghes: simplify acpi_ghes_record_errors() code
Date: Tue, 12 Nov 2024 11:14:46 +0100
Message-ID: <285ad59f9643a2b39563c8e9b904be94379f9947.1731406254.git.mchehab+huawei@kernel.org>
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
X-TUID: 71d3jPjfNrar

Reduce the ident of the function and prepares it for
the next changes.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c | 56 ++++++++++++++++++++++++++------------------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index dc217694deb9..e66f3be1502b 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -402,40 +402,42 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
 
     start_addr = le64_to_cpu(ags->ghes_addr_le);
 
-    if (physical_address) {
+    if (!physical_address) {
+        return -1;
+    }
 
-        if (source_id < ACPI_GHES_ERROR_SOURCE_COUNT) {
-            start_addr += source_id * sizeof(uint64_t);
-        }
+    if (source_id < ACPI_GHES_ERROR_SOURCE_COUNT) {
+        start_addr += source_id * sizeof(uint64_t);
+    }
 
-        cpu_physical_memory_read(start_addr, &error_block_addr,
-                                 sizeof(error_block_addr));
+    cpu_physical_memory_read(start_addr, &error_block_addr,
+                             sizeof(error_block_addr));
 
-        error_block_addr = le64_to_cpu(error_block_addr);
+    error_block_addr = le64_to_cpu(error_block_addr);
 
-        read_ack_register_addr = start_addr +
-            ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
+    read_ack_register_addr = start_addr +
+                             ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
 
-        cpu_physical_memory_read(read_ack_register_addr,
-                                 &read_ack_register, sizeof(read_ack_register));
+    cpu_physical_memory_read(read_ack_register_addr,
+                             &read_ack_register, sizeof(read_ack_register));
 
-        /* zero means OSPM does not acknowledge the error */
-        if (!read_ack_register) {
-            error_report("OSPM does not acknowledge previous error,"
-                " so can not record CPER for current error anymore");
-        } else if (error_block_addr) {
-            read_ack_register = cpu_to_le64(0);
-            /*
-             * Clear the Read Ack Register, OSPM will write it to 1 when
-             * it acknowledges this error.
-             */
-            cpu_physical_memory_write(read_ack_register_addr,
-                &read_ack_register, sizeof(uint64_t));
+    /* zero means OSPM does not acknowledge the error */
+    if (!read_ack_register) {
+        error_report("OSPM does not acknowledge previous error,"
+                     " so can not record CPER for current error anymore");
+    } else if (error_block_addr) {
+        read_ack_register = cpu_to_le64(0);
+        /*
+         * Clear the Read Ack Register, OSPM will write it to 1 when
+         * it acknowledges this error.
+         */
+        cpu_physical_memory_write(read_ack_register_addr,
+                                  &read_ack_register, sizeof(uint64_t));
 
-            ret = acpi_ghes_record_mem_error(error_block_addr,
-                                             physical_address);
-        } else
-            error_report("can not find Generic Error Status Block");
+        ret = acpi_ghes_record_mem_error(error_block_addr,
+                                         physical_address);
+    } else {
+        error_report("can not find Generic Error Status Block");
     }
 
     return ret;
-- 
2.47.0

