Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3040513njn;
        Wed, 15 Jan 2025 04:51:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUkOWbdYCgg1OK0KCT49x61aZdGzIphpwfmsTvBWytdg+luHtHxOj1ZQ2UGpXAAMwTSdzxOwcI337u8Ww==@linaro.org
X-Google-Smtp-Source: AGHT+IE5uMvQLwxie21wT7p9NehEG67SWICuJaITAyLeVR6rMW7CkszcLlPNrfmXJmDtsvg3Y1XJ
X-Received: by 2002:a05:620a:444f:b0:7b6:f1be:4f7e with SMTP id af79cd13be357-7bcd9755084mr3930875485a.26.1736945518208;
        Wed, 15 Jan 2025 04:51:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736945518; cv=none;
        d=google.com; s=arc-20240605;
        b=h3wbrgJBnQCXKpsSHpmYUSp5zMwjkDTCgFYjBliZ9MTEdA+BFMrnez7s2kZMKCdM3t
         cT6oKmwBur6g9mYZ+xh1CMWSc6Y+JKSfAtZ2TYoExE0/FUEmrxusWH59ynPjDRoofxGb
         zfQ6Cc1WWklbYPg+OGAZf+2kxrd8GCkDM3E36mWWs9Bh24s5gKZHpTJVe2CEXAQio3dj
         u2q+KZH3/fY7nyo1C6GpdPbAF7wlcL8/pqhI5phNsllaKp8OcIgd9E5SxKw1G85cCOEI
         9qDqmaLPjScUPVQgOW1xrAB0glIWbTlRHZXm9d8RJHJoeYhJRQoRSdu9fz/eW60594Rf
         Cl6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1FgM537TK2HRYD1G5Zw2i2Y7kd/Aw/d2qOLx8XNQsoY=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=GAYiD/GJ6FoJBLhrczxHT3n4UvofzRtXZWbr4jD0QT++kI/LY6e6BFul0yHKfxa/mj
         HmSRKRw6ztM9GeRJ41y1a/JLCmGr1eK4qsWp36RCKfZZo08BfDtrtQeCZLycsfZqGMeC
         hi3nlrnpIciqNEMJKUAp1NGtUX21hc8M72dcu0YFI6rNZUc8EnAdSpv8I2OeglBKTNUO
         i5ee8sJ4mtLtWkqmFgcgnqqon5diYubOh5n/M7OJYcZJusLCVSEsoLCNbhdrtzDDvZe0
         27OK3Hod9Ut5vyKJBVUK7zIEsxXJNvLUtUTxjsuF5F5GvHm/peMZBQ79xa55fzxyUiTz
         NM/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="ou/Adl6e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce3507e02si1588110785a.529.2025.01.15.04.51.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 04:51:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="ou/Adl6e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY2rv-0007rn-LV; Wed, 15 Jan 2025 07:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tY2rO-0007dn-2t; Wed, 15 Jan 2025 07:51:02 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tY2rM-0006se-H8; Wed, 15 Jan 2025 07:51:01 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 85D9E5C5C82;
 Wed, 15 Jan 2025 12:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD29C4CEFC;
 Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736945441;
 bh=xsPr7Wep5XMNKduaPSiVQyhTQXE031xTg/4plS/bAJo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ou/Adl6eWceqWJ2pqntMNHO4Z2Y6c4YTSkxnNn8OWJDVbbT6N3AQfLtGUnYmK2uPl
 9yUPTdjKrX8t+uKu0V7scbC6kG3jtWSEFMLitJsNJT3VrK1cP6FWpuVipj4reTnOJD
 +BszTUlDrw3cPkFJNMMpQDVdrS+xTdKm2XYJeloi3wQ2nd1D5tkuTxjUYCvq6XnETp
 ovvnXL7MPeIS9WqXQ8rP1FJtjTlOoXIbWoqi/6jLh3IkxW7HUNbLCyiC4Gv9VQZQWt
 gtYgKi9xEj3qR/CJ7X4yLMDW4gWM1otnxCzInQdcNdPg9X2AqmwEu5JSTli8fMr2QN
 +nWsgY9McSYZg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tY2r1-00000004yGM-1lAk; Wed, 15 Jan 2025 13:50:39 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 15/16] acpi/ghes: Change ghes fill logic to work with only
 one source
Date: Wed, 15 Jan 2025 13:50:31 +0100
Message-ID: <66bddd42a64c8515ad98b9975d953b4a70ffcc6d.1736945236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736945236.git.mchehab+huawei@kernel.org>
References: <cover.1736945236.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
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
X-TUID: C1j5dS6J/woR

Extending to multiple sources require a BIOS pointer to the
beginning of the HEST table, which in turn requires a backward-compatible
code.

So, the current code supports only one source. Ensure that and simplify
the code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 8f59d327d3e5..b709c177cdea 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -387,15 +387,13 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
      * As the current version supports only one source, the ack offset is
      * just sizeof(uint64_t).
      */
-    *read_ack_register_addr = ghes_addr +
-			      ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
+    *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
 }
 
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
     uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
-    uint64_t start_addr;
     AcpiGedState *acpi_ged_state;
     AcpiGhesState *ags;
 
@@ -412,11 +410,9 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     }
     ags = &acpi_ged_state->ghes_state;
 
-    start_addr = le64_to_cpu(ags->hw_error_le);
-
-    start_addr += source_id * sizeof(uint64_t);
-
-    get_hw_error_offsets(start_addr, &cper_addr, &read_ack_register_addr);
+    assert(ACPI_GHES_ERROR_SOURCE_COUNT == 1);
+    get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
+                         &cper_addr, &read_ack_register_addr);
 
     if (!cper_addr) {
         error_setg(errp, "can not find Generic Error Status Block");
-- 
2.47.1

