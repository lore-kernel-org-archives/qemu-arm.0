Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9716EA7942
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Feb 2026 19:07:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vniAY-00008c-A7; Wed, 04 Feb 2026 14:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vniAV-0008D7-NG
 for qemu-arm@nongnu.org; Wed, 04 Feb 2026 14:04:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vniAT-0007zg-V2
 for qemu-arm@nongnu.org; Wed, 04 Feb 2026 14:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770231841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k970/8IAuTxyxYQnCxpGZam99VQS84f+0lcT7yhaPYA=;
 b=fnEdQ35h+nX88SIllTZRhDNO+IvB0uT5cGhouedfSAGvLqVudxRA2oiqglIhM3PXn246mt
 4F5K70hr7IBTCzsDplzXqR/d/I3NJpTjs+4TcJX7TiDMaX+3cdF+70W37NieRVqbLirOgu
 ePYFXaIyz70/mie5l7i2gkie9J3AaJ0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-swUHTiI0NSWa58LavwAhGA-1; Wed, 04 Feb 2026 14:03:59 -0500
X-MC-Unique: swUHTiI0NSWa58LavwAhGA-1
X-Mimecast-MFC-AGG-ID: swUHTiI0NSWa58LavwAhGA_1770231838
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4804157a3c9so1272775e9.1
 for <qemu-arm@nongnu.org>; Wed, 04 Feb 2026 11:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770231838; x=1770836638;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k970/8IAuTxyxYQnCxpGZam99VQS84f+0lcT7yhaPYA=;
 b=rkH5LDbilHnDKi0TB7JKBQow9YNhMc4XAkmQ6d5VEzsUggitv422+2vWEd5SH4v619
 IGXkfsW4zNtwTMDiZV+fvwkjJF9y01rFgfm1gj8gVIOmayu0BwYl7dNpu1/ephZrqT2J
 IF2aL4d5Dbk/lXvxfLIDelYeIeYxm+q5AlWUzPjOXeeN4+2fU0Qhm/sbHd8OxhyyJk8I
 snzUARGqhRUqp8X9z9sBwrDWfueH6TXTv4SKgZKtCYZtKIU4S8q7EtrpFQ1G0XtdZ3Ru
 DAihJMVMXtUFDirz/gNJ+F8yH/90IeuJCRRcS9yoSW8k1PMzJIEJV39rWNiDlXkGeB5g
 9MDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnYv20KSsyHkc/D4qVKGymk/zI4iK8NqPOFRPcn8g2dt6Zg4TpQKotJVUfuy1W9jW0Wz5sz050Xw==@nongnu.org
X-Gm-Message-State: AOJu0YwyTb6sPmQzgpvMcmOFGAjT8NVIfVcwV6hEWx0n7xTe+JT2l57v
 kbIub6pdcgtt7QBWJgV3QueW65lQHYWNktCf8W8btMB53zYDGpSyvifWqOFXfKwK0skIBlknW6i
 Rf+JmqIFuBnF1impQOblP/uSeeLgW+abEaTdF0EUb/9gtPG8ncv9CGw==
X-Gm-Gg: AZuq6aLCaNCnADzuaataHRwNbDhWi4d0SziHz1pWRzQpvVqfPYPgZRekbaua2WGSwCW
 NDWk8LiD/I4z/93FtGJYocLsfYmR7rzlY/7pHiMuvdEcDShSEVsV9sMXjiY/icI5XcMElRQSYBi
 h2L8KmekdewwJHJN9ti3dFmx/31wg78Pf7HQ5Q2JfRnUAuIcqGlll3Dq1eTxhOOL0a85watpYv5
 7jiP08eovisPxns8hWBEZ56MDzwePml+C6YDV6PSix+d1DRCVkXot7qM9LAAwAx76Hmu0JcXl1e
 kZUa/FSU8Ei+CVR4mvCGdTXTAqWJb658u+NdwHUNuh1YXuo9s0B31Oc+nMSycYdJ6vY9g6Oiz2Y
 1q6fkTdTH+a4Y5baWwwvO29NBYWwlHVgndQ==
X-Received: by 2002:a05:600c:1f16:b0:46e:4b79:551 with SMTP id
 5b1f17b1804b1-4830e9897dcmr64074005e9.31.1770231837696; 
 Wed, 04 Feb 2026 11:03:57 -0800 (PST)
X-Received: by 2002:a05:600c:1f16:b0:46e:4b79:551 with SMTP id
 5b1f17b1804b1-4830e9897dcmr64073585e9.31.1770231837220; 
 Wed, 04 Feb 2026 11:03:57 -0800 (PST)
Received: from redhat.com (IGLD-80-230-34-155.inter.net.il. [80.230.34.155])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43618057f9esm7058054f8f.28.2026.02.04.11.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 11:03:56 -0800 (PST)
Date: Wed, 4 Feb 2026 14:03:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Gavin Shan <gshan@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL 29/51] acpi/ghes: Bail early on error from
 get_ghes_source_offsets()
Message-ID: <43eca99483f62e6d8610dbeee1e00ab94edb8962.1770231744.git.mst@redhat.com>
References: <cover.1770231744.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1770231744.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6GuMgv0QxfVoUXMkC8zO8Yb7J9irCiEfRqHkKE0kXRw_1770231838
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Gavin Shan <gshan@redhat.com>

In ghes_record_cper_errors(), get_ghes_source_offsets() can return
a error initialized by error_setg(). Without bailing on this error,
it can call into the second error_setg() due to the unexpected value
returned from the read acknowledgement register. The second error_setg()
can trigger assert(*errp == NULL) in its callee error_setv(), which
isn't expected.

Bail early in ghes_record_cper_errors() when error is received from
get_ghes_source_offsets() to avoid the unexpected behavior.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20251201141803.2386129-5-gshan@redhat.com>
---
 hw/acpi/ghes.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 4e6903a8d3..d51d4bd466 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -444,7 +444,7 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
     *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
 }
 
-static void get_ghes_source_offsets(uint16_t source_id,
+static bool get_ghes_source_offsets(uint16_t source_id,
                                     uint64_t hest_addr,
                                     uint64_t *cper_addr,
                                     uint64_t *read_ack_start_addr,
@@ -475,7 +475,7 @@ static void get_ghes_source_offsets(uint16_t source_id,
         /* For now, we only know the size of GHESv2 table */
         if (type != ACPI_GHES_SOURCE_GENERIC_ERROR_V2) {
             error_setg(errp, "HEST: type %d not supported.", type);
-            return;
+            return false;
         }
 
         /* Compare CPER source ID at the GHESv2 structure */
@@ -489,7 +489,7 @@ static void get_ghes_source_offsets(uint16_t source_id,
     }
     if (i == num_sources) {
         error_setg(errp, "HEST: Source %d not found.", source_id);
-        return;
+        return false;
     }
 
     /* Navigate through table address pointers */
@@ -509,6 +509,8 @@ static void get_ghes_source_offsets(uint16_t source_id,
     cpu_physical_memory_read(hest_read_ack_addr, read_ack_start_addr,
                              sizeof(*read_ack_start_addr));
     *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
+
+    return true;
 }
 
 NotifierList acpi_generic_error_notifiers =
@@ -527,9 +529,10 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
     if (!ags->use_hest_addr) {
         get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
                              &cper_addr, &read_ack_register_addr);
-    } else {
-        get_ghes_source_offsets(source_id, le64_to_cpu(ags->hest_addr_le),
-                                &cper_addr, &read_ack_register_addr, errp);
+    } else if (!get_ghes_source_offsets(source_id,
+                    le64_to_cpu(ags->hest_addr_le),
+                    &cper_addr, &read_ack_register_addr, errp)) {
+            return;
     }
 
     cpu_physical_memory_read(read_ack_register_addr,
-- 
MST


