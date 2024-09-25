Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp94184njb;
        Tue, 24 Sep 2024 21:04:58 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXrpeZHeQCSX6GTj8vJS65TedPKOv99v2L5qX0efJ9F2MpvajHCvm30Kah706hrx9Qcx22fGY1+Jr5YLQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFnkMxzXhU3ihEW4YScV20CRARHY46ACiK7BQ2t/hshlYMuK2jzAAQqxBIOGy/jwaZBOL0x
X-Received: by 2002:a05:620a:178c:b0:79f:73d:d2e with SMTP id af79cd13be357-7ace740179bmr208266785a.24.1727237098383;
        Tue, 24 Sep 2024 21:04:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727237098; cv=pass;
        d=google.com; s=arc-20240605;
        b=DiBcUqU8zPftN/Qotj3rbJqDBTTxBXe+ZSymsEG3zVDKwxVkJJlMB0zFTkbyH8WnIg
         nH6MWLrOK7IIRKhMcGcgt69+Sj5T4eDpv+abpdZsxKXqOupEeQ2jaSBKa9pjnIV1P2Yy
         6NN9KGx6T3W3O2crq4IRT7ltuSa/u6JGoVPQOPOciLiLRD+O/HiR39L1DG0AfpqAKkHA
         7YUwz4v/WXYFSaZbIkGexeDjIv/pdUqNuXTyh4ldrKyTBlWalgWVOuPYXDa0COnVmyD+
         azm9CGG0N5nrbj/CKofJqzZ3sIEM33Z74rMxGnsJeMiHxVSnNyDxEVI5kBzcLl3iL1PP
         Wrmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=B5vsw2v0Xj+67YcXwY8mK87M6Zvk2lPIW6cBULbvlFw=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=Gohgf6qdKJDK25xpidU1AJ13vNLBNzF7RdnFWAnMKS2DECdE5uvnkUqbb+4DFNoyY3
         r0pN7HzHY0YQ7XVCr0/gl91nh9xH3qyL0r/J78aApYaIVlwyWZroVLo4NRSf5kTyvooS
         wc6o5rrFF1M1vTjQ+13wMdh8Mxp9+FqLVC5o8ewYh2P302QtGaDGXsRUxYqRszpy2lRi
         UtLDwzUvyTZVrGn0xx24FiAos5WR79h/nIVg9ElletFm6B0+knOqxe7mT++76BODYLac
         rCVzU9XCWmLhdYOW0y0ba4j+zvysLlvXTO5H+YQRI2KDRYbf2edBefSJXbWgWjjeRk3k
         UgQw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=WEsdXcyd;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-337977-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-337977-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-337977-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id af79cd13be357-7acde646d72si314659785a.729.2024.09.24.21.04.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 21:04:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-337977-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=WEsdXcyd;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-337977-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-337977-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FCAC1C22745
	for <alex.bennee@linaro.org>; Wed, 25 Sep 2024 04:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4AD914D2A3;
	Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEsdXcyd"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E63914BFA2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727237088; cv=none; b=AgGt6fWu3n4E779aCOx9wq4OSGc3aWq/W2R9OtIkuZ2I2u+2gdus4+J6XPNRsFXF3BZ8izkxfwpllhZAJ1eIcaWZmSlkX7Vrtneaijfgy7lT+FCx8b96tt/8yxlLZyTzjO6Naix8HV8RUjIfmd8iF3Sj0PSxEwPMPcWO1mFL5/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727237088; c=relaxed/simple;
	bh=nBKJN8HnPZNNP4hYZrf3OFUxClvSEboHXAz3CwHADyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+B9Z+BVX11ZPRKuaoGVxuyIR/OPXH7+ZDpW7GU9e9lb8TTUlXnLCcAm3yGef7PWhohGz550yeM+CR8Gz5Vr5CDhhD4mBo43uDb9FZ+IX5sFQ1l6xcQxpuL/z4sg1s0OyxNGtCVPxCNCNy0fMmPJER6JVWr2EIUs3pXSzwxJR+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEsdXcyd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F3FC4CECD;
	Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727237088;
	bh=nBKJN8HnPZNNP4hYZrf3OFUxClvSEboHXAz3CwHADyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WEsdXcydUg8hMicE2Jskh4hIbo0vjmGEWzyDKWEvYLZXkJoxJh5XRKZ81icvEoToM
	 FgRMGwh6affiTmZ46KTBhmNe+bYuB0X/Rv2TQRWIkj4rH08e5GqqFetFfBfCL84Mdu
	 LSVLAGMmmjTLmd+qdmOgyCIuUjmzCA9UQhNGCt4fjol8+dT2R/oihjRfQiKW9UcwJl
	 AGCosDjve+pnfeUWpwZPx0DEGKAMSDpJeHLLVYCPRMX6Zpat4roxw+DPvjg7EWLSrH
	 QNIB6eRmCWkebo2+TrU+y/gznJsdWNO5valjr6gR6+EFb2Jm0WjhPTueP8OHhME1fL
	 BzbwjYwW4RQHQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1stJGg-0000000827k-0RNk;
	Wed, 25 Sep 2024 06:04:46 +0200
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
Subject: [PATCH 02/15] acpi/ghes: simplify acpi_ghes_record_errors() code
Date: Wed, 25 Sep 2024 06:04:07 +0200
Message-ID: <45dcc7644e2b2a04645a37e561ed7294482b0744.1727236561.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: 4A+GXTrz/hz2

Reduce the ident of the function and prepares it for
the next changes.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c | 56 ++++++++++++++++++++++++++------------------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index dc217694deb9..dacbd4d0c093 100644
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
+                                sizeof(error_block_addr));
 
-        error_block_addr = le64_to_cpu(error_block_addr);
+    error_block_addr = le64_to_cpu(error_block_addr);
 
-        read_ack_register_addr = start_addr +
-            ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
+    read_ack_register_addr = start_addr +
+        ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
 
-        cpu_physical_memory_read(read_ack_register_addr,
-                                 &read_ack_register, sizeof(read_ack_register));
+    cpu_physical_memory_read(read_ack_register_addr,
+                                &read_ack_register, sizeof(read_ack_register));
 
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
+            " so can not record CPER for current error anymore");
+    } else if (error_block_addr) {
+        read_ack_register = cpu_to_le64(0);
+        /*
+         * Clear the Read Ack Register, OSPM will write it to 1 when
+         * it acknowledges this error.
+         */
+        cpu_physical_memory_write(read_ack_register_addr,
+            &read_ack_register, sizeof(uint64_t));
 
-            ret = acpi_ghes_record_mem_error(error_block_addr,
-                                             physical_address);
-        } else
-            error_report("can not find Generic Error Status Block");
+        ret = acpi_ghes_record_mem_error(error_block_addr,
+                                            physical_address);
+    } else {
+        error_report("can not find Generic Error Status Block");
     }
 
     return ret;
-- 
2.46.1

