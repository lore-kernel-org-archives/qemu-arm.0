Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3260250njn;
        Wed, 15 Jan 2025 10:13:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXiDFu8544tVJaXYo/YI4vVUEwwoMiwfVCQtO+Uf5J7hxQi2t+nj/VaJwmYVh+vR8YrwYsdc8v85VKkTg==@linaro.org
X-Google-Smtp-Source: AGHT+IFef01HH/WXyUTfbxnUXENBlwPP3zhkoaPXnZ5tW/McgPseJ0Tq+1yEo3wxacqfmTJ4OyPs
X-Received: by 2002:ac8:5f82:0:b0:46c:7647:2ace with SMTP id d75a77b69052e-46c76472c87mr382214621cf.0.1736964806662;
        Wed, 15 Jan 2025 10:13:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736964806; cv=none;
        d=google.com; s=arc-20240605;
        b=IBITW5Raobtgl5MZ4vJiaUvgZuEzefxmm/Aw0hZoiLvWoZFOmiY5J+1d/Osxb/lyl1
         hyzDxiDnzfdSHaD5wDIJbwrlNhAia4wESqv33LDQdcbEroBOMvrY+rwkGDPa1AFqGQra
         3OFiGY1D8nwpAOunRfMc/jSJ8F+v11Cu4GbXvkmSI0aM0d5Hp0tZ6D/snbLuHoNhndao
         kO6CnXufwrRKtNOUPRyIHr7Bud1uFWRQE35MODZXTGCO2U5Cjvuggkp1bs4hHyBlmY6Y
         DdnxXIblMcosQiLJ8H35IGz3xrA7l7zqfUNi+QNzRao9ZFgMSyk1vyulDShafn3sUJWI
         +0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=91AZqunFcitL0HyZ4NOaEanpB7Q6GWIn9e4SYbBrSGc=;
        fh=fX9oOUoO5g4W1L6X/MSe0RzH9mWymxVvW79TLpSOgwg=;
        b=S9Jgn10aKFS9sMybJ5v7kXIFj7Vf6auyW/zhDC8TrA3zp/ntg5HU2tp1i/eA2Okmas
         u/svyaKPQs8ipdzHDh3YSKrJIPFThd4Lefy2MDC20EXn/Dh7w83RZnUZabrOE6Uhoy95
         fYjC1ALO6wHFpJmdgBv+4VAxHG6MQT3I/OYyULxeHGJBGVQUiF28ixit7juZ0xQ3hmvv
         z4SU6AHjPAxmT6SIaDLyuVFSvngYIa6Y1bW72lrfgUDVyypgQ+pERUl65kDKdBFGpFcJ
         yBec9ZykiVqbkUxp1wlT3hB7pnoEPYVSBPgHjLSIYy2FlMXn9xG47p1hMuzEwGNBbSHS
         tACA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=coFeaNY2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c87331c0asi153891351cf.89.2025.01.15.10.13.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 10:13:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=coFeaNY2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY7r7-0000ma-1B; Wed, 15 Jan 2025 13:11:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qB-0007HV-CV
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7q7-0006lS-Hb
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736964602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=91AZqunFcitL0HyZ4NOaEanpB7Q6GWIn9e4SYbBrSGc=;
 b=coFeaNY2rYWbL+zZN88IXJcRdQ3kaDJ+kESbAlJ7lZVMXOhTQ8Ljb6R+y/zBcX+uAGgn3p
 iGBxjv/XK6Ski08IZZDUn7V21Ix+6Lazz/poxE67ygn+usAurfzKHCfWO58i2pywLRBHSB
 xqeqsMGOfNE4mwblm58HZq3YncFIx3Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-Y2rFNxTsNJuwvM6XQ10DlA-1; Wed, 15 Jan 2025 13:10:01 -0500
X-MC-Unique: Y2rFNxTsNJuwvM6XQ10DlA-1
X-Mimecast-MFC-AGG-ID: Y2rFNxTsNJuwvM6XQ10DlA
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4362f893bfaso37663095e9.1
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 10:10:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736964600; x=1737569400;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=91AZqunFcitL0HyZ4NOaEanpB7Q6GWIn9e4SYbBrSGc=;
 b=F38uah/iI4MwpnW7mj/vjFEXIW8aOQ67H9kRAmdQqebMoZ+1ZdMkGJ1fvpEMN4eK1N
 552GxGZJceNaKk4Ai7yZ86opNqIWghaaZnjdFQ3zYAUADRwAD29+cx0u+t2rraGd8A+2
 z7LP85Q3yD2vhxd/fcx7PLUVV1RILdGhXkv1yDi5RuF8HVi/u8BmM5vVy6bRJIQtbYGV
 82Oz3H4sHWL3rGCn7lJ5FI6o5S+9IZWhgCQzmnqEImqrtQ/Ie8rc6mUEsw4jdQn9RLJW
 Lq8CtGl1VsIf7aeyALqCMgjg3IbdVf3cbXm3UZPiU2L/dvwzI35Ce2LZ+anYkIwLtdXh
 VjNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaFYlGkpym/+oTRBNJGExe5xrBZJbTq+iJ9J1W9ijrYRrRmVGjpKvI82G9yVo03lm14g51Y8rLpg==@nongnu.org
X-Gm-Message-State: AOJu0Yx1GqzBirEeE2mkWHoEG056VIW7OIg1MgnwA9oUkh6+56BuOBXG
 9XIKTP9twGl3piSWd97M/h5mnbbs78wrsXxL2HB7X4NcE66TbxBebDTXripTlVAr4R8rV7WNwES
 nNeFYwTTjKR5lYMUQ8Za1Jy5lttQsotZU4P4IuiOmeaIrJv3s8GvzGjhjBg==
X-Gm-Gg: ASbGncvnvyAnd0jdUbbMtibN1MVqtyNJ5x56tcdWI73gXU/ZrIgR6qG4npCiYXB5MAQ
 f91MLyBfJmFUTPZ+DAOZZv8OoDLUf2uuoMFxjxLcx0oWn4E5ZeMm94+BIqRUGCMPFSIIONTcGTm
 HlIjS7+gDq2DJWd4bBsQ+xP0LfEt2BliY45m8HD7269xEPWx3/CQaxNojIRTbuCpZXvtxtvVoMA
 frvXbunZyNtJwfTnwogrsBPnv0fG5AoEf1uop1vytKeTCmQG2W7
X-Received: by 2002:a05:600c:3584:b0:434:9dfe:20e6 with SMTP id
 5b1f17b1804b1-436e26f47efmr207489965e9.23.1736964600018; 
 Wed, 15 Jan 2025 10:10:00 -0800 (PST)
X-Received: by 2002:a05:600c:3584:b0:434:9dfe:20e6 with SMTP id
 5b1f17b1804b1-436e26f47efmr207489775e9.23.1736964599689; 
 Wed, 15 Jan 2025 10:09:59 -0800 (PST)
Received: from redhat.com ([2a0d:6fc7:342:db8c:4ec4:322b:a6a8:f411])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e37d472sm17923756f8f.1.2025.01.15.10.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 10:09:58 -0800 (PST)
Date: Wed, 15 Jan 2025 13:09:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL 28/48] acpi/ghes: simplify acpi_ghes_record_errors() code
Message-ID: <872b69f21fe34f133982e02d04e33425d761d33b.1736964488.git.mst@redhat.com>
References: <cover.1736964487.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1736964487.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oxpGs7IjFImZmHq4YWIOTRJQRl5snGPgLNgkh-xCJiU_1736964600
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: gnWjHe1wqONn

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reduce the ident of the function and prepares it for
the next changes.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <19af4188535217213486d169e0501e592bc78a95.1736945236.git.mchehab+huawei@kernel.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/ghes.c | 56 ++++++++++++++++++++++++++------------------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index dc217694de..e66f3be150 100644
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
MST

