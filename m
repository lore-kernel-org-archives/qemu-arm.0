Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1013308njb;
        Fri, 6 Dec 2024 09:21:42 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUXmBPzhHvz5HvcQdmtCgrYKnwgoyIVMGoeWElyf2h659zGoWA1sldDG3gpOp6E+Cze/SdXuowCtXJy0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGO7pOW1snzIs6imruUA/62xxNsv+0HC56DL0l/9210EVrZMGW5psv5KNY03koF7M9vwy+D
X-Received: by 2002:a05:6a20:12d1:b0:1e0:cc01:43da with SMTP id adf61e73a8af0-1e186b7ea6amr6837714637.0.1733505701888;
        Fri, 06 Dec 2024 09:21:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733505701; cv=pass;
        d=google.com; s=arc-20240605;
        b=Zh8ktKRjC9Y67fWk7KFNlTZzhafTi85vEnwq4PMsRNrVXhxah78rS04wq3ULv8FrpV
         Pz8cdSL3JNO4RFnkkcq7hSwWS6gZB+ScvoLK2WNjRJmJZH9iEo3cL914AOMg/pJc8dW4
         3bUQAR8OtrTKJkzyX5d9lAMH952OhoeZvftQLdX/xuGSLtsd8y9T2uAErbk82JxSmZlp
         Llew3vyxMu/R3DKAoDl8KjM+WzR3EPNi2ou+CFvvOvZKk3maLfVjtPa5PSs+NoRfW6yM
         /JuqD+XQ42EJDAOXLZWDGGYRjGjepaNt6z50fatAET1H6SJEUBMm76z4KQLqi3UZ55JZ
         cycQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=HHM3nDvwvarbU0kfK3795adHF9fVbPKszZvUT3RIpn4=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=WQJrUYd3FuJwTr5kDw1hMDK5fhuakQFI0b1yem7f8OormxeLDYr5EkslcUUgNyRB4k
         ByY/cWb6ZIRz/5dVm6s7znUdUq3yBUnuNWzpHAm7zw/1Uq3ygQCEqHXgZdjsQtrfLxLC
         sqDPohrj9Zteug/3hFUWjjalTMud4LkZZaetfiRUi4J7hb84sq5WyOeZput7SE7UDLEF
         JcW7SLSYOeFvXQ/7h7RmQwRDD5Sl2TwBZGKbIfmTFGhZHvJ83/XCo6EwGvyQWILbOlWQ
         iEu+wLfQlR/spcBehSmyREcw+HsvefvTv4vzeANBa7biDmmOWQdGHvNiLtLIRA2jsyga
         rQfQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Oe7xDL6G;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435385-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435385-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435385-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7fd1576bb72si1418191a12.314.2024.12.06.09.21.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:21:41 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435385-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Oe7xDL6G;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435385-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435385-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C124287803
	for <alex.bennee@linaro.org>; Fri,  6 Dec 2024 17:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F565203D5A;
	Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oe7xDL6G"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48411FFC73
	for <linux-kernel@vger.kernel.org>; Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733505687; cv=none; b=b0f9aumyM6+YDg+suciXokX4QBaARQJcJfXvoJeDEapHPxCuxOIiPpaYltpW2rSAu3UOm2J6zwEmouAJ3ikyG6VM0HbZ+tycVdRO6oVDbwvj1/wWKzsMYHn4pCaldmuKcyjICw6EBhuhmLnok+rmFCstLrrcPsep+8FaqKl7nJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733505687; c=relaxed/simple;
	bh=uDihMbAVHajyrPqIm6xCk4kSLNVBW/olOYucuqFWoPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RmPhIr/klUF8K5r6VjshEUxh/90mFCgmP/CFqboIarziGy/qvRjBmsWBEXmvZBuQ0i4l9LGCihkYGklXkX8Adx/FZS0mFdtOQsB7oHkKxJKUMI5Ruj0aXE4BQrYXeqHYUknkcdvGH9eizyrEDIbBWv4iyLoUQsKHm4Wo8CZJDAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oe7xDL6G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73384C4CEE5;
	Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733505687;
	bh=uDihMbAVHajyrPqIm6xCk4kSLNVBW/olOYucuqFWoPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oe7xDL6GE7WAYqI30QewxA6CrP5xggn2/6CkHlSaJ7Fv7RgXDapDvo+YYclVb4sNi
	 L2mRau+/YDoaP8XYCAqh5+PdVem0FFnCREyeXuuLpJc6YpPOEncNDulzeu1680MD9e
	 G1JFeft8PhNGLOomgPRDslasZBDKU57xiTptLQwTnAyApK65jMRwWN7UTgfCZ/21i2
	 vUHrcr41wHSJnpIHQ6TTlNC9DzS8AmtziVjRerCnqyE4nAGPUOMij2czaRiWfE4puk
	 n4jZgrRuDyqkasDVNSb1KIAGwUBK+yCWLKq+shN5OicgcmEfLMmhOXmD3AhKFeLnjk
	 ZN0SJuudzTuYw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJc17-00000005RJe-24ct;
	Fri, 06 Dec 2024 18:21:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/31] acpi/ghes: simplify acpi_ghes_record_errors() code
Date: Fri,  6 Dec 2024 18:12:24 +0100
Message-ID: <001a0b01ca89405ba8b7b801ba3c397f1f6e413b.1733504943.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733504943.git.mchehab+huawei@kernel.org>
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: FCO+2ZGK+29d

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

