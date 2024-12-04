Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp24153njb;
        Tue, 3 Dec 2024 23:43:06 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVYARNKXHniwHh9wHiWv3OAlUSWXAFXhLXTZpDYbr33FJG32ukG5E7C10X6tfBv/nP5BDFwcspJupLslg==@linaro.org
X-Google-Smtp-Source: AGHT+IFaQy2i1O97sBXTExZttwTwu9duw5l1dAGy8AgqZ7ZbPSGd3MBAcGsDNTNoHqPqCvDxiUy4
X-Received: by 2002:a05:620a:c4b:b0:7b6:6f81:a528 with SMTP id af79cd13be357-7b6abaed14emr484526985a.22.1733298186336;
        Tue, 03 Dec 2024 23:43:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733298186; cv=pass;
        d=google.com; s=arc-20240605;
        b=Vuv3tDgnyGEpQI44WMDQu139S77MvqXRJRbHALkGydJBp/xSLmTBg3fiNAhkwQUA1Q
         01wqTk2AW2wNFcoT1ZG3JITBrMu8z/y1k3Oge7te9e7lrfiQGxS2R9OMNWTgLWzJ2B36
         +kv/H+UsqTkm9zS2bwuBLD6k+mSEfNiNcvNYr8Kp9n/0jCgeSE0EP9V7Z0gbDlfC5Mtw
         hNoJ8jPPQYFEx6UorGYDYYRj3rdCyUFUHwDFMtpa6XimBOoS4Jm+80iC83UYTE+6szhP
         Ckmty5sfUeE89ZfwEAuAFy8ur5hIThtdEw8xXkGyPflyVWwzbYuWCC9309+oC8AxB+pc
         MUWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=HHM3nDvwvarbU0kfK3795adHF9fVbPKszZvUT3RIpn4=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=dV9GmMp4BXsAEQY2P+HtDf0OM96aVSSPA6xiGEEzXk/upT+4+qnKqTnDHhnQCGH853
         jzG+mItzoUZE1BmccHPDyn9tGiD11C1o77mIAZISxTSEi/jC1DUFRE3BL5DfE9RUAXvw
         zVv9BqRfu7/+2olIPzZyGw3axUHNRJg3Pqk+WSrMkSXqQwpMTiOPmgR6PwBf/QzJu/Wb
         0QP4ho97QRsDqPiqQRASwXeRgRLvq517P6z6SOeiySjFvWDsOp9AfbtFaOy+4mPC3IkH
         pnhYzJSIkZNxozS6WeSbtNKJrzpgH7sVTFjS3jR77vkzbIPVYYubQJVIjGOTA7MubxPr
         UJjw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=czQmyl+A;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-430667-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-430667-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-430667-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id af79cd13be357-7b684932992si1653685485a.187.2024.12.03.23.43.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 23:43:06 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-430667-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=czQmyl+A;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-430667-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-430667-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD73E16818E
	for <alex.bennee@linaro.org>; Wed,  4 Dec 2024 07:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D5E19047A;
	Wed,  4 Dec 2024 07:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czQmyl+A"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AC718E379
	for <linux-kernel@vger.kernel.org>; Wed,  4 Dec 2024 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733298153; cv=none; b=Wn3jTxRp2cyF99YSlqO8N+9JVgZL8y98O2qKXJ2ncL3u1L4h6WNpY5IgQigCdcTYJaA1zyoIPXGikPosjm3O7n5FIutGxQEDTw5xSx/guNY6wHBJen9gDrjfowG60c+AtJ4pBJY0SpFwg14G/SbKQBMCGMpFZOiBewDEHB9imKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733298153; c=relaxed/simple;
	bh=uDihMbAVHajyrPqIm6xCk4kSLNVBW/olOYucuqFWoPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8PBQdzlHWmnYzmuKdZ+RI/5a8NqnepfKvO4Wu9ytFw+owWl6QGxYhXJdbCOHgX4nJy4m3X0baoWeCntr1bxuEjh8oN+wQIiYJDP0Ddir0Lj5uj+CyeNssI6XJWJQSX3GC/R4B76+v08hyCcK9+lqAAsITlbNeVwlE0nsP/3+5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czQmyl+A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A86FC4CEE7;
	Wed,  4 Dec 2024 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733298153;
	bh=uDihMbAVHajyrPqIm6xCk4kSLNVBW/olOYucuqFWoPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=czQmyl+AX++IkbELUJZwjAdtdZVgC05x2aD2bG8G8cyH8UJ4EkIxeya5BijhrA4b1
	 szhkd6Y+T/XjGy6GsrcYDfEf4IojvzwavXDeTWA5tYm/fQpTihyyC8Euc5cUbrbU62
	 ivkAiCgRM9+eHPJ8M6ciTzf8ZENa6hLVwFzjSrT5BEX/T6H+QaBeQiypOZrTd6CGNl
	 Chd+0QJaJxOhJYCwtBg8xpLJfPpAwpRLxsxySDeUzNZasrtnzxK1GAXNFVWuB7tM8h
	 Yru8jz5xY57VHWamI4xBNHxjLDvj9VOW4zbHEIruKDRkDglai7G/QZxdyUymRGBrA1
	 ct1CpABnhWsoA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tIk1m-00000004Kim-47VJ;
	Wed, 04 Dec 2024 08:42:30 +0100
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
Subject: [PATCH v5 02/16] acpi/ghes: simplify acpi_ghes_record_errors() code
Date: Wed,  4 Dec 2024 08:41:10 +0100
Message-ID: <766ac4c230af004689e464f6f8a731bbc31508c5.1733297707.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733297707.git.mchehab+huawei@kernel.org>
References: <cover.1733297707.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: U7CoYVzosKSV

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

