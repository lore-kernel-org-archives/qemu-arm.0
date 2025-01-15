Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3262347njn;
        Wed, 15 Jan 2025 10:16:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWflNcmoVB9OgwwHI6IH0E6bz4dOo7Sr4B++dcuDazQ6TdihUwUT269cDjw3FukzYFhEBzFZwZUnTXrqg==@linaro.org
X-Google-Smtp-Source: AGHT+IGHnhDWVEm2ZePU/aI8XG54/1bHp7kqE1q4Qv/LDKQInzhsfYEeR73J8t/QeRxlcvmvqoFK
X-Received: by 2002:a05:6214:240d:b0:6da:da7b:c196 with SMTP id 6a1803df08f44-6df9b1ef794mr528667406d6.16.1736964980062;
        Wed, 15 Jan 2025 10:16:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736964980; cv=none;
        d=google.com; s=arc-20240605;
        b=RRpn4Ksg6sKRQwa9NJ8Eq2MUWLsqs4FNpd9WwaunjvI7UC1kTHUX0T0jqwNWJ+EHX8
         Qi2YaxpBF2UmfC/J+qL0XdB7qisXPIdaA50yYc+bQ0WAU1K/qyaipRQmiH0/5kHR4iIv
         LYI3QbQuFE4qgdNeDqgG8jMt0y7D6TCAZ8Km4wMgJX4HMWe0Y4MPTHl8xX+rGr5qhtt7
         MTJyztKsq3nhy6ZFaeNfD9/9jgbw0aVx/NAKcyHg94IVdoYPvYq7XFptC7fDwBMYWcT2
         3Zu1djyeQ9ytwGGfVIef6s4VPM7o5kY9xINYzs2z3o2Vq+ZjreJ+gfF3VbyOEg9jo/DH
         WxUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=K7TcV59XEakRMbH2rRFcP0+60inS50NTD8WhVaPlkoo=;
        fh=S1uqM7CPELMoOC3nPnKEhLF6j+2ytCK/lMLUh2IIl1s=;
        b=gEClqhi3YHkw+RJnE6iJAGqI39qvfYApnwgZq0rWJoEHLGA6qff6TKhds7Ldbsuipa
         C7vdpkBoL8rW77f6ap3/LpAsSJJTnsIf2cyLGMufr9rCWeG6JoJpmL7EL8yjIcub1ZWR
         axUU6HL8uqR2oZh2nrNPdcaPBenyyCQzlT6zp6bAriHFwgX16bw5POIPchFu4gaBQrdx
         +uVJf+BBPn4+gYWopiuqWzcd40fQ9NY0zDV70hFV2cDpaoj3skpHP5T1cmGQ7SiQDTXe
         aiyw+4G02JjJX4TX4gH9v2fQkK9QPTHGs5tMDaVP/5X1HEBmNkLuYPH0zXGbhIC4sHAF
         2AKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YDobszk4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce322a591si1674888185a.99.2025.01.15.10.16.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 10:16:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YDobszk4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY7sJ-00075C-7y; Wed, 15 Jan 2025 13:12:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qq-0008Mt-Sn
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qk-00071h-ME
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736964635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K7TcV59XEakRMbH2rRFcP0+60inS50NTD8WhVaPlkoo=;
 b=YDobszk4pUwJnZ93XWFeAmOLQKfk1IXp8BTmo0uBxjT3FHs96uhoUE7ZKbtvQBCFn+01yF
 DAHxQADKwQAge8FmqnkruHObwULhNbwuneuL3xPaileiz1T4CPYIokTeQii700UveOb32O
 Xha54usFR7wvP+UMQcBs5LDhy5nczbA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-U5FTADPHPB68I3_qIPlyGA-1; Wed, 15 Jan 2025 13:10:32 -0500
X-MC-Unique: U5FTADPHPB68I3_qIPlyGA-1
X-Mimecast-MFC-AGG-ID: U5FTADPHPB68I3_qIPlyGA
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3862e986d17so36070f8f.3
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 10:10:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736964631; x=1737569431;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K7TcV59XEakRMbH2rRFcP0+60inS50NTD8WhVaPlkoo=;
 b=ws6SpdzXXfK2Gc8reE27VXv/Ma2GEdThXVUwHfjrcUzymXnOfZdOscGQQ/nJZ5Mkw1
 /FU7V+cCUNwkdxgZdt9+qgu8DlzOxqP6bdfPvcRjnm6uvLd7NzMEw7SkYBodvYKxWIuJ
 xeQZdpwYfo7pQCMSBqCA4hFMX5kaW0Cw7KS5tM6Fp+UcP6RBji9netEDmn6/A8ieG7o3
 ppqY/lNfctaVyb6NyYNRhBkZzczoV9JeuUjEyA1z0VX48JMGuHbpyPb1/vClK7wwk7a0
 ZboEB6iIes4pZl8tQcSJFnAjM/dDrBT8odA8H4bFBJNIMTRiVkRmpiCKUniiRTCr1csq
 aIPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSJy2PLaCRL4dz57gzIp1uSIQW2P1FM0TJ2HNPkmE2YOCruQ9LZoM6No+4eq4rTtZ756y0S7VQrA==@nongnu.org
X-Gm-Message-State: AOJu0YyDvL2LhBXqNKGwhBsphBNb73wOQBW+7dVWAQUnAHtiDzMgXyYo
 TcW5Yj3D9HvvZhakBQL6GZunTdbaNv65pj3yV4OWS30wGkFdAset1LS3pumPF3vLq8a/l0ZvpR1
 pwph6YQGgSbbk0AEdeMYXlgVv5wx8eiCL/mH+DhQffyidw3Ko5A==
X-Gm-Gg: ASbGncvMnNpt94DFR1/YFqXiRPrMrL/3kLJK5P54qaHizX7RsoVzM2AvOF3NozXvi5h
 vkxG/jnSzrKsShNIAeNlKrSC0RJLSAedUJzNtaQ7TOXAssg6TfPcjc7zwPHX0gwkEROOwwunhk1
 2g8n8wMqVzbdsFJu0t4YoputKTk+c7DUbtUmZKxH9wc5WWtAU/sToztCYz5CkLhFA50JOgNaRHN
 /VQYFqRxkmbzS99/i3NxfiBcoP+sbJSxyVrj310RDu8w+55i7in
X-Received: by 2002:a5d:648b:0:b0:386:3e3c:ef1 with SMTP id
 ffacd0b85a97d-38a87312f36mr31933148f8f.35.1736964631544; 
 Wed, 15 Jan 2025 10:10:31 -0800 (PST)
X-Received: by 2002:a5d:648b:0:b0:386:3e3c:ef1 with SMTP id
 ffacd0b85a97d-38a87312f36mr31933127f8f.35.1736964631210; 
 Wed, 15 Jan 2025 10:10:31 -0800 (PST)
Received: from redhat.com ([2a0d:6fc7:342:db8c:4ec4:322b:a6a8:f411])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e37d2f5sm18409210f8f.17.2025.01.15.10.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 10:10:30 -0800 (PST)
Date: Wed, 15 Jan 2025 13:10:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 38/48] acpi/ghes: rename etc/hardware_error file macros
Message-ID: <4651745dfc8d384bd260969c23d8423741462eac.1736964488.git.mst@redhat.com>
References: <cover.1736964487.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1736964487.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qbkf__VJC2EUtpGHZ_4EZBdJjlAAvKJK0QKQSWB3STk_1736964632
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
X-TUID: /t1xALIZOgKz

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Now that we have also have a file to store HEST data location,
which is part of GHES, better name the file where CPER records
are stored.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <e79a013bcd9f634b46ff6b34756d1b1403713af3.1736945236.git.mchehab+huawei@kernel.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/ghes.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 6843ddf64b..3f94a5542b 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -28,8 +28,8 @@
 #include "hw/nvram/fw_cfg.h"
 #include "qemu/uuid.h"
 
-#define ACPI_GHES_ERRORS_FW_CFG_FILE        "etc/hardware_errors"
-#define ACPI_GHES_DATA_ADDR_FW_CFG_FILE     "etc/hardware_errors_addr"
+#define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
+#define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
 
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
@@ -234,7 +234,7 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
         ACPI_GHES_MAX_RAW_DATA_LENGTH * ACPI_GHES_ERROR_SOURCE_COUNT);
 
     /* Tell guest firmware to place hardware_errors blob into RAM */
-    bios_linker_loader_alloc(linker, ACPI_GHES_ERRORS_FW_CFG_FILE,
+    bios_linker_loader_alloc(linker, ACPI_HW_ERROR_FW_CFG_FILE,
                              hardware_errors, sizeof(uint64_t), false);
 
     for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
@@ -243,17 +243,21 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
          * corresponding "Generic Error Status Block"
          */
         bios_linker_loader_add_pointer(linker,
-            ACPI_GHES_ERRORS_FW_CFG_FILE, sizeof(uint64_t) * i,
-            sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE,
-            error_status_block_offset + i * ACPI_GHES_MAX_RAW_DATA_LENGTH);
+                                       ACPI_HW_ERROR_FW_CFG_FILE,
+                                       sizeof(uint64_t) * i,
+                                       sizeof(uint64_t),
+                                       ACPI_HW_ERROR_FW_CFG_FILE,
+                                       error_status_block_offset +
+                                       i * ACPI_GHES_MAX_RAW_DATA_LENGTH);
     }
 
     /*
      * tell firmware to write hardware_errors GPA into
      * hardware_errors_addr fw_cfg, once the former has been initialized.
      */
-    bios_linker_loader_write_pointer(linker, ACPI_GHES_DATA_ADDR_FW_CFG_FILE,
-        0, sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE, 0);
+    bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, 0,
+                                     sizeof(uint64_t),
+                                     ACPI_HW_ERROR_FW_CFG_FILE, 0);
 }
 
 /* Build Generic Hardware Error Source version 2 (GHESv2) */
@@ -290,8 +294,10 @@ static void build_ghes_v2(GArray *table_data,
     build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0x40, 0,
                      4 /* QWord access */, 0);
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
-        address_offset + GAS_ADDR_OFFSET, sizeof(uint64_t),
-        ACPI_GHES_ERRORS_FW_CFG_FILE, source_id * sizeof(uint64_t));
+                                   address_offset + GAS_ADDR_OFFSET,
+                                   sizeof(uint64_t),
+                                   ACPI_HW_ERROR_FW_CFG_FILE,
+                                   source_id * sizeof(uint64_t));
 
     /* Notification Structure */
     build_ghes_hw_error_notification(table_data, notify);
@@ -308,9 +314,11 @@ static void build_ghes_v2(GArray *table_data,
     build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0x40, 0,
                      4 /* QWord access */, 0);
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
-        address_offset + GAS_ADDR_OFFSET,
-        sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE,
-        (ACPI_GHES_ERROR_SOURCE_COUNT + source_id) * sizeof(uint64_t));
+                                   address_offset + GAS_ADDR_OFFSET,
+                                   sizeof(uint64_t),
+                                   ACPI_HW_ERROR_FW_CFG_FILE,
+                                   (ACPI_GHES_ERROR_SOURCE_COUNT + source_id)
+                                   * sizeof(uint64_t));
 
     /*
      * Read Ack Preserve field
@@ -346,11 +354,11 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
                           GArray *hardware_error)
 {
     /* Create a read-only fw_cfg file for GHES */
-    fw_cfg_add_file(s, ACPI_GHES_ERRORS_FW_CFG_FILE, hardware_error->data,
+    fw_cfg_add_file(s, ACPI_HW_ERROR_FW_CFG_FILE, hardware_error->data,
                     hardware_error->len);
 
     /* Create a read-write fw_cfg file for Address */
-    fw_cfg_add_file_callback(s, ACPI_GHES_DATA_ADDR_FW_CFG_FILE, NULL, NULL,
+    fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
         NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
 
     ags->present = true;
-- 
MST

