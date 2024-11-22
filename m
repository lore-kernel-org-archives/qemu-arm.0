Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5249094njc;
        Fri, 22 Nov 2024 01:13:26 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVUoN1b4kHk2twigyqrWFt1QngVlgr6LTfQN7eMtqu/W02GNM3w+IopTHCVAso+2qx5kxC6zeBfPxidfw==@linaro.org
X-Google-Smtp-Source: AGHT+IHwBHw5vlvChl1/pxvXImz9079xZhTkTxcgEvdnigx/2tLEm9QwIKp32FNeajVXIq1MPOax
X-Received: by 2002:a05:6870:658d:b0:27d:10f5:347 with SMTP id 586e51a60fabf-29720ce6f8amr2012790fac.15.1732266803452;
        Fri, 22 Nov 2024 01:13:23 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732266803; cv=pass;
        d=google.com; s=arc-20240605;
        b=cFiFWsQEC1ed2DpXgLR7DTpA2dL+dpSUwZQ98ffRp+B/jTMHffHaXsPDSX2fFIAB55
         r9emU0EpuR5t7LDZK/WqJ5eI/HtwzmDM8RyQSBBpJ9IdNQ+BVYVDRwu8xM/9TcGQK/2s
         +ucp2yk4IIjyLr5VsilOsQQyrSqmjmWC/44UiKgqM8qVdCfM35tvba8Icmt3W60PVFHw
         aBVqjsoPPhBuI15vYvLWAtqwQB1j07QRF5TkepWzYRiWzFRDEp1RKXwtK7t6PO+l8qdG
         TkvAQY/REJ/loSO9fSzMl9XyvBqfekge4BbKMWSLAUX5MenBEFsYxodVS84oTM5JmpqU
         +eWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=8amq55IZRQZgH2ZCoGsccchNF/STDgViheUCCDqJoI4=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=lZOOL5AjF95NO52xuUPveE2IHetPmjCFNqCMKhQgJHIK04mLcX+XS8l4SPujyJx02b
         GJuuL3r1Aa4xLHLgvmdn8Ge6UOBAOlOktjSr2btvXKDkY8xniOwOxvgNMBBhbKcfaSbF
         sz3HJbpPGGlZpFmyEoKBXHf3CFUCJP7+TP4bBk2+k926FlLGq9EE5wDZ7EhGYQ4nkKzB
         xbon0RyMysKOT8i/OOfYL67qhUHPhqXcjU9DN+PzMPXq0fd9FpGK5WxFVAsE0cfTVZQl
         V1apu3JIkMKZ0tIQuHPCzK5N3IVfFEHbttstvag+3GESGgPgUYOwsfOOta6Eq+1jNjRr
         vL6w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=flVnF+G6;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-417989-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-417989-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-417989-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7fbcc3e8a38si1794779a12.340.2024.11.22.01.13.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:23 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-417989-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=flVnF+G6;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-417989-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-417989-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2CA3283CEF
	for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 09:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BF51DE899;
	Fri, 22 Nov 2024 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flVnF+G6"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0405E1DB55C
	for <linux-kernel@vger.kernel.org>; Fri, 22 Nov 2024 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266710; cv=none; b=jI+WCxxPcg/oBcTJwU7DKg0ywguFSn5GNDTZYdJmxPubrRaRJ8d/st5ri+2hIl1cMPySGp7ideC70tfa6pVYP+QH2JyaxAXHzu3fDpaKTYJXrqgE0zxUPYO5+b1Dk6H+xuzumNtyRFcmPY2Eam9sJloVG7lmre0vj6F8ARO/UrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266710; c=relaxed/simple;
	bh=u/evd6VNZ2Rw7eUqK3iewtjOB7zhkG2fVMmc7C1F68o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jjhDCwP3zG+2JvYwAqlABbooIVTWaaGHC/3PjAUvZGRd994ez86sumEEBHMJUjP94MXLpoWmBkoDNUZUQi8m+92JhIWkKoPmXsqaUYwEAaVArfw7CewRgaeSUDS8GmsTQcM7akh6lLfaoX57RfzOdusKMLIt8FqFo3PJt9aCCSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flVnF+G6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D637BC4AF0B;
	Fri, 22 Nov 2024 09:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732266709;
	bh=u/evd6VNZ2Rw7eUqK3iewtjOB7zhkG2fVMmc7C1F68o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=flVnF+G6K8xjTew3rEgHR++AelrZMDjgU3036bxDCI8h5y2sMNwqOk3vssUBpyv9G
	 KSrSZnsQjDuwfpRXw6bv/WGP5c0K4VSYe3aomKTXRTzTB/t0mVnskkrYcE0TTqohTN
	 LeSkTJiQsD1WQZatNTLt6CW+F0kxBVsPMXnSOioCcpSEq3Ql/tFAXVamAM/dhx6AKQ
	 AjMgwC9v80NnOHOFOugI5hOwoS5XD/f9g00j9JXcEKE/qmjmAjPt1x/WHnKPQVgtYn
	 QK2nPXMTlAGf7q0LSj7c/g4yTE6o0LUumPf6QJsG81nOMDDssbh/R5j+EbQkqj+giC
	 prW5938O05CQQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tEPhW-00000006l3b-4Am5;
	Fri, 22 Nov 2024 10:11:42 +0100
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
Subject: [PATCH v4 02/15] acpi/ghes: simplify acpi_ghes_record_errors() code
Date: Fri, 22 Nov 2024 10:11:19 +0100
Message-ID: <b8b4218b1dac9e83575d50793657872317bdf419.1732266152.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732266152.git.mchehab+huawei@kernel.org>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: /Q7zyzx6YQcy

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

