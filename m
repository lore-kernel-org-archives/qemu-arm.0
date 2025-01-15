Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3039940njn;
        Wed, 15 Jan 2025 04:50:48 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXrVI2eyW+5VsvxhXAHmJH+KFMhiHcoQjjaMbb3LyhJJTgf8KsGpOvPb+j/1xF5ZHfdY8paqfcJk+8Ztg==@linaro.org
X-Google-Smtp-Source: AGHT+IEhx32fmA4z04b5BNtGmuCYuhCHoyK7gFjbmY9C7Zb9qPTvYG+apd2izYx6zYhcDOde3Fit
X-Received: by 2002:a05:6a00:6c83:b0:72a:a7a4:b641 with SMTP id d2e1a72fcca58-72d22017a37mr43707399b3a.18.1736945448638;
        Wed, 15 Jan 2025 04:50:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736945448; cv=pass;
        d=google.com; s=arc-20240605;
        b=NuPXeVTMK9lWcZf01Byon3btuhsbzcCWCgKg/TXgoWj3GJLcS3nf6u1TxDORozkhQS
         KRklIrl7Kkv61wTNgBOrilhFKdglAzJdDZ2pTvXBL6vWSE3VJP1IuMMRDqM5+S7S7ia6
         elXE8A/Pz28pKtlJaD2+DdcrIjzpmRtY1JZNqc4zrSHyEwvCoZ/0PwnP7LQmxgIWbUAJ
         /B5NSmzUHXajBTlisFD7PK1GZtVceS6QDzwtjDiyKZbAzDxi0IrM85gSOwrfkKpLtT70
         QyHj5qD3dqJEHvDzTBvw+QOREKQ1f8fWpC9R0uw/+clpWAue+ZufZNwuGPh8otb50bT7
         TTHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=HHM3nDvwvarbU0kfK3795adHF9fVbPKszZvUT3RIpn4=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=Z/MBflNpBXA+TLi67h+jxlDtojPJddrt/s5r5Rt5ZTT7cdElYTzhfR4pquEBss6Mwi
         +06lM0uWuyS0cKK4FocrFQxTEIxr4Ikjv634aZ4pXwau2IsctqlyB5nHcJUoYBoSc27G
         /wp2RKHZxaFi5OYmEqgxPvQN5o7NTDhZh0CK12eCpc9DnXnFB/CmPMtc/d1juh0YtAOA
         3/a3qOtz+d8ssbZY3DH+TDz8fscN0sQQJB7p+GRJY++fBl+qbNr4+t1huw0Ztovj+vhq
         8z7QMTYlHlhUIjR9lIxAOpUIXWYs8aPJlJg+22pVN6BDbieQFp18+CjGmL1oRgoqFnpk
         ZiCg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ChM6oWd+;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477904-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477904-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-477904-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-72d406d2aabsi15595273b3a.243.2025.01.15.04.50.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 04:50:48 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-477904-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ChM6oWd+;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477904-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477904-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B4733A7593
	for <alex.bennee@linaro.org>; Wed, 15 Jan 2025 12:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51C1241694;
	Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChM6oWd+"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822561E9911
	for <linux-kernel@vger.kernel.org>; Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736945441; cv=none; b=lrbQ8KWY0HmY5hWSSN6G817mBc8gY3UvHPHlkNsqZgh5rcXiQQ877cU9eCz1O1sHjFtSIjX2WSPq2fI5tqs6IboJD+sIlgghU4tlQOkCxGo/fKI117w0Wd7VSPQXxEB0Z3847KL931nFgYiD3+PQT0emRH706r3mOiSgmWeyvkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736945441; c=relaxed/simple;
	bh=uDihMbAVHajyrPqIm6xCk4kSLNVBW/olOYucuqFWoPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bI0hrBYzyCRgpwuqWzgYmuPd+S+yRqr8PezZ06Ai8PKHaocR+BhJzU0ah89gDGNkWmfSXhFHmDVwfGrBrddxanxTOkGoe0K01HiFElKrU2feT3LbKWXMdocl3j4JYZzoiszGohVsfdzpMv5wg5xjfZNZLyO0KtxPzt63NpzeTgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChM6oWd+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADCAC4CEE5;
	Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736945441;
	bh=uDihMbAVHajyrPqIm6xCk4kSLNVBW/olOYucuqFWoPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ChM6oWd+2lBdH0p72KHlTa0jRZvJm5MVr3igtES/OHo0aJe/ZHtb3vnl3NeiW1wYU
	 P2/bHB5OSz8PmSnOJmpxMr5F3/gLWvcdZBX8jEY1Z5ii6mLPqT8j9KX8lU+AWQH1oh
	 LxEykpywWmG8N3EW9fh8iffDnuc74ksl4pRLVFOmkrpQ2wl0dnUfFVsukbhImHYLVI
	 KScfycpDXLLWtM16FwquaeCPihnYwi/3+1jEc6aw5kTa3tVynMeVQB2sLyZUDG46Ad
	 tURE+0d3LoDHpXfJbWbjo+Eh4vBuaqROPnlgtZOmgVFLzWfIqlYG7QtZnoFFomtdQd
	 51pxljRz2XVYQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tY2r1-00000004yFU-0IGp;
	Wed, 15 Jan 2025 13:50:39 +0100
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
Subject: [PATCH v7 02/16] acpi/ghes: simplify acpi_ghes_record_errors() code
Date: Wed, 15 Jan 2025 13:50:18 +0100
Message-ID: <19af4188535217213486d169e0501e592bc78a95.1736945236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736945236.git.mchehab+huawei@kernel.org>
References: <cover.1736945236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: m2qcf7bN3GxV

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
2.47.1

