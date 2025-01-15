Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3261556njn;
        Wed, 15 Jan 2025 10:15:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVk1WqlvVpRQxTQLS9YxHV67KzJgS7iCVbDQ7hdzSGYLX4+NwuuyLjMMqmNi0LULv4/x6nJxoJEn4gWJA==@linaro.org
X-Google-Smtp-Source: AGHT+IG70AsLDqsBeO2ldEnuWSIg1ZcCYZmJBVTkLvwww/yMPcmtL0hf2/n/WzzlFOdkBgoHzAEs
X-Received: by 2002:a05:6214:19c8:b0:6df:97a3:5e5a with SMTP id 6a1803df08f44-6df9b255d62mr552316476d6.28.1736964921149;
        Wed, 15 Jan 2025 10:15:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736964921; cv=none;
        d=google.com; s=arc-20240605;
        b=QyWTaZAVWSZVqJtTzh3qo1wEvUB4uQlV9bHImiFGX9GmCNgVXxetKbj3Yo2mqYnV1h
         tCYhoXOW4tDEkLqvi15f+J7HmdhEl5hbzCBwx7d/M5tKJ/JeAtbTt+Cc/a9TxZ966nNd
         VFmTDPoQAgCWtB8Tk8qkKWZ9fPo3uZTQVPF3G1oRrsxEvSLv9kVx5PZd/asqS3xGzSMd
         HdV3YiGvAcze5QzMmYTDp774dmlKOOQ1Ylic9632KKW/VxXHhrw2SYgIQRjR+5pKBi3o
         0aipn1FA0LRrvm0Yg3h78Ejz/M9Kob6vCasrrhb26ry+HjmWsekduOZOENZ+qV3qDgyo
         dKAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=AB4WiK8znpsIPslofkGRIt3WQYAc+EnhWGK/9uLoHcg=;
        fh=6z10/me6AvHYY7OXjYBvrBKJxdzY5KgcYM2YVN+wrok=;
        b=IAwe/LkeeY5XcJQwT17plGtHIgDIeU5gvaU/gYQGmfiEh5f6yX6vGnrZuWqUkwM8kV
         4anNQaRNCSO7hRJ+v/uWL3RqiSz8LIlAcLPGIJ219vSZpIkzw86Vf6zHR4L3E0DCNurA
         ICfkibtF7pXyJA9ydUNaSQmiN5fZcuISlVC96ZElagPQfyBklvFc1GoMfVLjR9MfgyNl
         1kRVQ1k8jfbymuIak+TAlCaFyouHmJQPCEs8yARJO4J9k+aUIYyuvlBMu/ZLZjLJrKWC
         z4FYVq68tXjGpVajBuDG3NJZVE7AsrroJ9nBDCd3bKt5J5VTeUcwa7pviPq5yveuSqkU
         ltLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RX1F2p6I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfadff8907si155301396d6.423.2025.01.15.10.15.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 10:15:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RX1F2p6I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY7ru-0004j6-8E; Wed, 15 Jan 2025 13:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qn-0008GB-Sp
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qj-00072h-Om
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736964640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AB4WiK8znpsIPslofkGRIt3WQYAc+EnhWGK/9uLoHcg=;
 b=RX1F2p6IT7MnSEzVMW6duQgJcoMTrRxswJJkOA0x7fQWVcpzHwqRl/sojvAv64783/L2tt
 2oKIcWA7qYf47EGPJemlsLu/LiE+CHP9S1K12G5TusdTO0dPEzUx5MLdrCN16OZi5QTxYx
 wff1KkhS1NN9o5ASxH4bXdHjpG4UNok=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-Eeug3QEnOPW0v_QWzn8BFw-1; Wed, 15 Jan 2025 13:10:39 -0500
X-MC-Unique: Eeug3QEnOPW0v_QWzn8BFw-1
X-Mimecast-MFC-AGG-ID: Eeug3QEnOPW0v_QWzn8BFw
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43582d49dacso47643565e9.2
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 10:10:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736964638; x=1737569438;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AB4WiK8znpsIPslofkGRIt3WQYAc+EnhWGK/9uLoHcg=;
 b=SWlqMCOrwAnZqxoLie1nNTNCYrhkFJ6mCI/ez6mF3+VzR3/44ATKzELi6p59/Jq0Wi
 Wq/YkeYTlPzJLQujzvUrOlnaXf+ey4D3h6wjYWShGK0m64KDnq4FLSjPEF73ibfQASmG
 lcEfhIWRn0Yfs8Kp6ilpad/DEkGfJRUlktfajWTFK6taC7juvYra96L/hOYUqbMrAObn
 4e7YS08BRfplilXYFTwUPzfoOACA6UcHkpyADvIdGWe/sJQfViwDpoJyBCqwbwPeKtRc
 VFHwIslV6sjdTMunY1AFG90W4GFMPHn0rWt9DXBtPozCxtVc0F7DGhBgNMITMH9XWr6x
 q3pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1Lcrts8czK2pmS5UJGjV2qLfkKns21f2l0vfB3FMBEcmIrwejF+fwypqxoN0McfwYEtFRBN6XOQ==@nongnu.org
X-Gm-Message-State: AOJu0YwVzaDHBdj7GSI4ebAPFD31Jm5MzmS09zMGNgMTZt6Rt09VaHeO
 1S3HfgY1PuIt/44ioMVSJfqR+oqaWRUST5rfjt9Wl4K2xTKFz6c4A19oKGAkLaeMoDjX2Dk0XHr
 EnNRZd26YKTzHcmNuxu+UjlSig9Xyn7BUHCd7p0jjMn3SnuKtQg==
X-Gm-Gg: ASbGncu62AaU+z2NncPWN25kG4FVKzQ30JvY5fwWzuC9j4Hr7ztUN6nF5ZtdPM99NDp
 JEEeLF8HuKOCURHtMkPQRnc++XUffZxNRv573MaiJgIrDD39+JAX7W1/2eh5CnSwLuH1S7KUdYt
 viPr2VUAsxq+YNmLnyLASrllzakMiKId13tQH09wIRcZn7LfOn4+dwp7FKO7oJTZmtxzM8MtkAI
 NsCQBmG8j7qYHU9V+tnlmHBBJlrR6vRt7y4VERoWbJcCyjgmgVl
X-Received: by 2002:a05:600c:5491:b0:434:fddf:5bfa with SMTP id
 5b1f17b1804b1-436e268626emr263771005e9.2.1736964638009; 
 Wed, 15 Jan 2025 10:10:38 -0800 (PST)
X-Received: by 2002:a05:600c:5491:b0:434:fddf:5bfa with SMTP id
 5b1f17b1804b1-436e268626emr263770695e9.2.1736964637620; 
 Wed, 15 Jan 2025 10:10:37 -0800 (PST)
Received: from redhat.com ([2a0d:6fc7:342:db8c:4ec4:322b:a6a8:f411])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74c5bb5sm32289855e9.22.2025.01.15.10.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 10:10:36 -0800 (PST)
Date: Wed, 15 Jan 2025 13:10:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL 40/48] acpi/ghes: move offset calculus to a separate function
Message-ID: <1cd59b8981ce234c1d790111afce4a32218a88dd.1736964488.git.mst@redhat.com>
References: <cover.1736964487.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1736964487.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SOnSaeR1FRC1yH3vT5oswF1pn_OdFJwc0WIT3uo5f3A_1736964638
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
X-TUID: pDVTGEmp4cX/

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Currently, CPER address location is calculated as an offset of
the hardware_errors table. It is also badly named, as the
offset actually used is the address where the CPER data starts,
and not the beginning of the error source.

Move the logic which calculates such offset to a separate
function, in preparation for a patch that will be changing the
logic to calculate it from the HEST table.

While here, properly name the variable which stores the cper
address.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <60fdd1bf379ba1db3099710868802aa49a27febb.1736945236.git.mchehab+huawei@kernel.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/ghes.c | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 983e28505a..ddb576b940 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -364,10 +364,37 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     ags->present = true;
 }
 
+static void get_hw_error_offsets(uint64_t ghes_addr,
+                                 uint64_t *cper_addr,
+                                 uint64_t *read_ack_register_addr)
+{
+    if (!ghes_addr) {
+        return;
+    }
+
+    /*
+     * non-HEST version supports only one source, so no need to change
+     * the start offset based on the source ID. Also, we can't validate
+     * the source ID, as it is stored inside the HEST table.
+     */
+
+    cpu_physical_memory_read(ghes_addr, cper_addr,
+                             sizeof(*cper_addr));
+
+    *cper_addr = le64_to_cpu(*cper_addr);
+
+    /*
+     * As the current version supports only one source, the ack offset is
+     * just sizeof(uint64_t).
+     */
+    *read_ack_register_addr = ghes_addr +
+                              ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
+}
+
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
-    uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
+    uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
     uint64_t start_addr;
     AcpiGedState *acpi_ged_state;
     AcpiGhesState *ags;
@@ -389,18 +416,13 @@ void ghes_record_cper_errors(const void *cper, size_t len,
 
     start_addr += source_id * sizeof(uint64_t);
 
-    cpu_physical_memory_read(start_addr, &error_block_addr,
-                             sizeof(error_block_addr));
+    get_hw_error_offsets(start_addr, &cper_addr, &read_ack_register_addr);
 
-    error_block_addr = le64_to_cpu(error_block_addr);
-    if (!error_block_addr) {
+    if (!cper_addr) {
         error_setg(errp, "can not find Generic Error Status Block");
         return;
     }
 
-    read_ack_register_addr = start_addr +
-                             ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
-
     cpu_physical_memory_read(read_ack_register_addr,
                              &read_ack_register, sizeof(read_ack_register));
 
@@ -421,7 +443,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
                               &read_ack_register, sizeof(uint64_t));
 
     /* Write the generic error data entry into guest memory */
-    cpu_physical_memory_write(error_block_addr, cper, len);
+    cpu_physical_memory_write(cper_addr, cper, len);
 
     return;
 }
-- 
MST

