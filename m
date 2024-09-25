Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp94549njb;
        Tue, 24 Sep 2024 21:06:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX1NFS5+6ZAOwdOtRrVNSX7WlZYouqHiBX4/GKlfhxQSBUzjAVgZ6dN3YWuG0gmsCqw1TvcQExXkQfc0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEaent+KJEySXFOtNmGwQr4cOv3yKeoQAd4x6SFkgJ+6g6GlsDaj0FFnkeQnYpAJ1rIDpSn
X-Received: by 2002:a05:620a:414b:b0:7ac:b1fb:3ef3 with SMTP id af79cd13be357-7ace744d558mr232968585a.46.1727237171095;
        Tue, 24 Sep 2024 21:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727237171; cv=none;
        d=google.com; s=arc-20240605;
        b=LGdQQ4Q7m9dByW6+8mTfzcOxrKdLFxF/mOwrCE+VawO/Zzr2/cpqHOz3kf4ihTq+eo
         yCg/0JolgKYqwTGp8yXxyiFKAHpuT5HZidB3SherpotO6c3tcl6VmZ983ht1gdE/2qso
         WzAyGCf/znsE0IPtIr6mC63zBHXx6VWEij47jtifiglN5OOIP5Vd9Cfd6F+kZJxKtM4Q
         Nz63ejEN3rlecXO3D0nCG1P41ntB7EiGLI5YUI+p/muVVuYjjjQ1VXA48McQ7Xh19OJT
         IJsCKTExXuObjNy8EePD+DGsxMH3sOhmhoMM29qQSTdVVLlIFZ/8AoKWf0oUOs3tPMRp
         s2Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SgosUooLXgN4TKCSimcnYdgsueasTY8I6df70W9jbzY=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=XKoXi2CSnYCOSqxrdVUNdvoi+46XXNq0WQLw/fweBmGqOhz+3/n3+YR3UrNvtn+icg
         HqC/s3oW1DS2WvtZ9J55WW/UgInFz2Lorq0UEXzZRromOJErqVtS+wkWv5EmeTAnjAs0
         oWp5Hw3D0fU+/iNNcDbjnAFgQYBH1SuGPaIGrg+2iZgwewQzrAMSrCLECJ2hZ9V9uRts
         dOjBXRbDaWJAMTcs05piVYEup8eGSapNKsNuw3qg4Opi2RHRXyBNguDPvS9Vsfviy1MU
         MydwCypjcsYdRuNdtBzUhxqxtyy6e1E8EKoe3+yIILPQIpoZhkQUr6T5wzV32KdJwLwR
         cMHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=NoCkAaXC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7acde543106si314018485a.200.2024.09.24.21.06.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2024 21:06:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=NoCkAaXC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1stJHC-0006MU-Ki; Wed, 25 Sep 2024 00:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1stJGq-0005gx-2x; Wed, 25 Sep 2024 00:04:56 -0400
Received: from nyc.source.kernel.org ([147.75.193.91])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1stJGo-0001xz-8Y; Wed, 25 Sep 2024 00:04:55 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B55E6A43B5C;
 Wed, 25 Sep 2024 04:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A688C4AF0D;
 Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727237088;
 bh=QMf07fLY8U2/zfLdTvC2c8psraorT7q7xlt4YyPh/QU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NoCkAaXCNbgzC5JNjk1B8gpa1+hCFxT+vXr4FA+aSQ6/t/nfQBw2sEGso2iJtUbgk
 0tHz9RzVNLowSEUyg5ZZxm2kIYujZOfhBRjh7MpSPijmu4zIfkaeSpNxNPJd9o5IYc
 yJ5qY2xwAdiW8pR/8TBb2PtCbZmyerG7TcIPGt7qF9hWeXi6NsJt1H/qap22JbM2N1
 tuZEMSg+o+VEEwEivddUcUvG+u63CZzfXKje86RDW2RFeRpDSZWkOZ/A1jCYEj1jHm
 ISOlYHsmMrjQ8u51Znp0aqSPRMQvHd5CzWQB4vUVpASppYn+R1fjlLgubtmxoF4l9H
 xWbzK8yI5KNrQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1stJGg-0000000827h-0KZH; Wed, 25 Sep 2024 06:04:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 01/15] acpi/ghes: get rid of ACPI_HEST_SRC_ID_RESERVED
Date: Wed, 25 Sep 2024 06:04:06 +0200
Message-ID: <0518c86d8724ba7f9986727676b64c531bd26b6f.1727236561.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=147.75.193.91;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.09,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +y7td9iSJ8I5

This is just duplicating ACPI_GHES_ERROR_SOURCE_COUNT, which
has a better name. So, drop the duplication.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c         | 7 ++-----
 include/hw/acpi/ghes.h | 3 ++-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index e9511d9b8f71..dc217694deb9 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -34,9 +34,6 @@
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
 
-/* Now only support ARMv8 SEA notification type error source */
-#define ACPI_GHES_ERROR_SOURCE_COUNT        1
-
 /* Generic Hardware Error Source version 2 */
 #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10
 
@@ -396,7 +393,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
     AcpiGedState *acpi_ged_state;
     AcpiGhesState *ags;
 
-    assert(source_id < ACPI_HEST_SRC_ID_RESERVED);
+    assert(source_id < ACPI_GHES_ERROR_SOURCE_COUNT);
 
     acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
                                                        NULL));
@@ -407,7 +404,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
 
     if (physical_address) {
 
-        if (source_id < ACPI_HEST_SRC_ID_RESERVED) {
+        if (source_id < ACPI_GHES_ERROR_SOURCE_COUNT) {
             start_addr += source_id * sizeof(uint64_t);
         }
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 674f6958e905..59e3b8fb24b9 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -59,7 +59,8 @@ enum AcpiGhesNotifyType {
 enum {
     ACPI_HEST_SRC_ID_SEA = 0,
     /* future ids go here */
-    ACPI_HEST_SRC_ID_RESERVED,
+
+    ACPI_GHES_ERROR_SOURCE_COUNT
 };
 
 typedef struct AcpiGhesState {
-- 
2.46.1

