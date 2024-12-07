Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1378201njb;
        Sat, 7 Dec 2024 00:56:51 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXfY3bxe07PLkrUw7KSt7QmZkoHPXqyvItGH3zB05j8aA+HYcoo0dW6IAZxJdLtC8oBog2KEJzHLtPiig==@linaro.org
X-Google-Smtp-Source: AGHT+IEo3uoPepmIcGCQCnPX4PAx0Y+2tvg4Ne6RSPeTys+mdkmPQHZJ8UmGA5V9gfGWDmW+dj6Q
X-Received: by 2002:a05:6214:c84:b0:6d8:a64d:da51 with SMTP id 6a1803df08f44-6d8e707ddcdmr95231316d6.8.1733561811706;
        Sat, 07 Dec 2024 00:56:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733561811; cv=pass;
        d=google.com; s=arc-20240605;
        b=Z1/ZzMYOk2Rc32+bjD/rFL5zhFL0E7IvTrZnzmVcGGjj58VFDy7olVxaWkvNPCI5RG
         LrP/AlQLTWehixHJP6PuW78kVJbmJayOfOnMXmJl9tX16ds4nR/CoNwSxZKrw4DAduKB
         Q1Z0WdXDTiDcTQPNgSxGgJcc1n2gYchzHx0NCrIl1iHBUyJASY/OyP2hckEEFeCW05y9
         L7K4Tt5m0tXLe96DmWjACZ/9KszGmgNCY9aVwE0JJNVM6YIgc3OPXk/6QULDHG4QcK4E
         bhh9n3qS+JQvUA9YkPmHyuPI6nLYPozZx7S/8sPdVRBEggun2ipPZkJH6JrsZG5In+CU
         6zQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=HHM3nDvwvarbU0kfK3795adHF9fVbPKszZvUT3RIpn4=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=i1ddJ4ncXDxSyQvqQhtheIeHhM0A1jdl7Wtn9gDAmKENilSDky3Aqheq/7nzpEt36V
         ICSDyaOofNbTvam1ZxJJPgV0Ylvzkd9AmzsAQ892ttJsfLXIp3BoeV5CUczZOKXnxasp
         7CYegelhzzov6jU58W3cnS/W5BEQ56wTKEj5eGYvqlJ7Ln+dtRT6fHhdtOkl6cMbk2dp
         dLWj6vV0GqfgP6e638Ilsd3ACP8a50lXiBIjiuO2TVjPzbBGgloWCfdDiGpwYB+G3PLg
         Ido77lLLE485Y8tnFTEZY9/RSMtGgvgl9Qmh37X4xUZ77+6gypcPh6htxRhjrPKvtgRK
         9+Sw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ohr7NtkX;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435956-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435956-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435956-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8eb43f4c0si34989456d6.297.2024.12.07.00.56.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 00:56:51 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435956-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ohr7NtkX;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435956-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435956-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C6DB1633ED
	for <alex.bennee@linaro.org>; Sat,  7 Dec 2024 08:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E39013D89D;
	Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohr7NtkX"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2F713665A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733561805; cv=none; b=NH51dUXIooTQZQAubr5GXNcqsYBh2Py8Uh6jj92eNtJNixT0omGsfIfby7eAjZFsmPsf6iFUUSaYZonmqkcSRDrnoeeb7K26UiO2arUZkAQoqix4tq5CtteKXAAd7sAjfWCxxSZHW+NIvrI1t5VKmS9/nQo6Yq3WB7evBkKGmT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733561805; c=relaxed/simple;
	bh=uDihMbAVHajyrPqIm6xCk4kSLNVBW/olOYucuqFWoPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPrDiZgFPr1idqMw3ZqbweaP8VqYQeowraky+01zwaLurTkw4D3hb9XhzWQtR59OLXpS6W8dYq+8sOfz8Qr9hd1osc5GCqwNoH4+esvncsvzyxGUpD5pa+CmAwMqXrYV/GkqLsf63f1/H2/2xJso7UaPH3G30Q/aGraTyiSBXIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohr7NtkX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA68C4CED2;
	Sat,  7 Dec 2024 08:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733561804;
	bh=uDihMbAVHajyrPqIm6xCk4kSLNVBW/olOYucuqFWoPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ohr7NtkXGMR4K259ylJGHxGttAVBnGZb8ZpjjawDu0KLZ6i0JnSogemnF+0kbfnUP
	 XEiyYd1e59x1431uRAs/dCRsIIGCpmXR9qB/DiOYVqz7wJrQiJDnzh/7vJtRarAwNp
	 u6YL5OlYVw1Dli1RwOHkq0NNsskKC6xVLD/L0rqBwOrcPa40vuvbZGFenuO4o9XMPN
	 N0+Gy1ZO7WE2040l0d693e3DLLtrW+ZNmX/5SbiaY5z/KKPFMdiezMl8bE4nRe/QlY
	 iSJwqMwAK+fiK5S09IstIdjMMq9Zr/knt7qpMNdK8q60k5QSZ3Xxq9V66xBATOlGIK
	 s7hQVWyeUAw3g==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJqcE-00000005j4c-42v3;
	Sat, 07 Dec 2024 09:56:42 +0100
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
Subject: [PATCH v6 02/16] acpi/ghes: simplify acpi_ghes_record_errors() code
Date: Sat,  7 Dec 2024 09:54:08 +0100
Message-ID: <766ac4c230af004689e464f6f8a731bbc31508c5.1733561462.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733561462.git.mchehab+huawei@kernel.org>
References: <cover.1733561462.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: cmgsjPQ24c7S

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

