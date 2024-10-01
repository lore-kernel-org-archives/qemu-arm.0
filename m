Received: by 2002:a05:7022:698c:b0:8b:e46e:3391 with SMTP id cj12csp64677dlb;
        Tue, 1 Oct 2024 00:04:23 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVKaJSQHs4GhhMT+NnDWhaw24gjB7hyyuYOfC/c3mkhPSzaP7yMoMboF2JW/KVb3E2TL/OE6qQKPL3fgQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH3bTCKfbzb2H0RpFobLKvz9BCfDBpX9fgZ09pRpxaKNv4BKxLafXwn0zp4r6NVWk8V8BSO
X-Received: by 2002:a05:6808:22a0:b0:3e2:7f9f:7f5e with SMTP id 5614622812f47-3e3939cd5d7mr9311153b6e.30.1727766263612;
        Tue, 01 Oct 2024 00:04:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727766263; cv=pass;
        d=google.com; s=arc-20240605;
        b=jzmkH/ZYdYIsRSP53+7bSiVExOXIDbV5sdtbZZh4S5A7ltflhYEcKc3N//DB5+mPv3
         QptbmFDWURMZ9xpwAY5REPJW84HtmcuitJbAUQS7CjZ1xB1QjxrLBn8A3T8DL8TrPvHK
         1WECQf7v8cRmUX0LUeEBWFZevlf89vTyGXlDne6G2J4/zFM/aFGasXx2QdfWFajUKhHb
         eA57hTuXDhRWWehPFq25nMw9knrCukA/16NC3AK4tPmPUJjpYWbNUvaf/wxcoqqJ9IpB
         axa3ErnuD1XNayZvdM7gLV49yMpOYV9gQR6lOewG8qym7S0I0Ltb2ovixMxzdr9/no4Z
         iVEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=R8t7feTdaPtL50ANU6ScNQtJvqumcabgzgnSAZ4n4vw=;
        fh=rzGDMRJFBBrjbOaW7dLpUOdm+9c++WP8RCbD+hTQXmk=;
        b=B/bBPbG1O4b6pZ4a6eR3qMVZlbtZxjjAeJj2TxPfFCqmCpAIS4nwJJ6zxv3S/D3umf
         a+8x/RWPBJ080QcE5I1W3CQHYhDjlkRHvztrgcNuuMcWsQ+evzIRkYPQpSVBL2/KdRWy
         LsG9On9/u4wJq8tRfYlgZVXqX1qGdJv37gCvnksb3OZgtH86CM4Li0dcD4B13NhTdKml
         f9LwgPRVySqZKfjlhglERUSPrW6cccqFOThVbpSi5+tBR9aCzGmie3CX/j4QpYdV98Rh
         B6XtzbpQb6pggCsTjVhf/yu9N1+Ftqfa2F/sgIUTTJcTVIYHGveG3kAi+ddwOdPGD/8E
         OhDA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=WKhB7puq;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345350-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345350-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-345350-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7e6db5fc48dsi10439937a12.34.2024.10.01.00.04.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 00:04:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-345350-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=WKhB7puq;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345350-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345350-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9362CB21999
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 07:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC361BD01D;
	Tue,  1 Oct 2024 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKhB7puq"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0F31BC9F4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Oct 2024 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766251; cv=none; b=bBwbazV9SDc8zrz6mAOA68FW9nkBot7yp+yyddkz11k2rVrmYEl4FHkA1C4knNlCDTEN129XlhoqNO6vhSczNngSI72zIK+tvvjHaDdrXNAzjm0U4uHgBv6UCO2TpMDYB8Y4ujcPAxJVzCKV8RqYk+5BsieYrmdN6GCe68ff+Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766251; c=relaxed/simple;
	bh=zkop42TFRLpY7ULuyBanfVruQ6JbCYVDcuNKDW81Y1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ozwatxfBA/+k1ddfbMFWVE0jbugGO8qGv+/CK5wqupqk+nrKlF/dBNvwqwkVqFPyzj+oVCTPnJc1tmCUAfPBLbbAOABrFreIqzF6eiYfWFlUFtd+v2SuLEQHdgG/PkyzeMLklPJWL81/7Hl8cTdLkGzWoU6kGdqFbdwvF/1mZBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKhB7puq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C82C4CEC6;
	Tue,  1 Oct 2024 07:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727766251;
	bh=zkop42TFRLpY7ULuyBanfVruQ6JbCYVDcuNKDW81Y1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WKhB7puqWLjWEh5WYvXQE0rTdVWeDN5LVjylm2JNCfGw36C9B3RgdhFiU3pOOCOdm
	 UYkHmf3N84IWPAUUY8Ks+bbYzR/PPqrpiyKYOI7DWDlSunSKxboSq7rqteYSBdtrUZ
	 I7Q6CTbB6gi82Au7iP5bFOEjLAcsubfHBtk7DRTpWQqrotb6bxTZO+1V4eGacC+/ro
	 fj12AUupWZpyJ1tBo+2qbf68QpVgImo/KgjfsZNrPRD5aMpDGAGY/CDqR3RzasUg/o
	 jXCmypQ2pCc4BIft6xZraHM06VFVMlE+Er3RfiFgtXm5n21ogDZChIqSV4y2eNjkD5
	 5v8GJt3FzyWHQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab@kernel.org>)
	id 1svWvY-00000001V0R-1Rfk;
	Tue, 01 Oct 2024 09:04:08 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 02/15] acpi/ghes: simplify acpi_ghes_record_errors() code
Date: Tue,  1 Oct 2024 09:03:39 +0200
Message-ID: <3c7830e2db3aa2655db0487611c853728a1dca54.1727766088.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1727766088.git.mchehab+huawei@kernel.org>
References: <cover.1727766088.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
X-TUID: 3Y1qb3NF54EX

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
2.46.0

