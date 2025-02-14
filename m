Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp1051541njc;
        Thu, 13 Feb 2025 20:17:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVwjGnL0TRCYqGsUEwWc1JJmdmBc0fuT/3NqmOpoakcj13v3KNEyFel6b5tJI2NrZcoO2VwlXMIvw7fOg==@linaro.org
X-Google-Smtp-Source: AGHT+IFGnMTTVRuDRzLh6rXT3dNYSYE+4ylnS9jdcuaRk9H0XhqW75/WaZ2NTsV029B4HAKpiSN8
X-Received: by 2002:ac8:5ac5:0:b0:471:9ce0:f2f3 with SMTP id d75a77b69052e-471bedf9edamr98477411cf.39.1739506671677;
        Thu, 13 Feb 2025 20:17:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739506671; cv=none;
        d=google.com; s=arc-20240605;
        b=I38M1+9g4Xt1s3jzVRACY4PZe9h38uicVeJKS4ZJAHOYAWFFsLt/CEdZl3/ABEqzFg
         pkoKHESS9wz+WJ84yLaMOjPriBtvCtnnAZeckoq9vPuZEjk/CIui2zEvWDeQm7YWV2ll
         +5XpQYGXzdakL0WYQb7UAe54068lJmrnUkw1G+Fmm4uOlEOOeLlJ5VMie+ui/GoGGOxV
         ZGDgOoABiX1Qs79VWHLDQnQWF9vpjSm/MbULh95ZntI9y01fy04YpxF2p1D/HWey94k+
         /f0q5OPq8KtSe4bdz08cmmGPYXxdN9JvEa+vkcJMZI6n+8YQGQZFuapu60afuwl01mh4
         KMNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1ZQkjM4kHbfBWA6DXLB1gENCQu/+ABtUZ4HwunpxUY4=;
        fh=wmAecxDqeNBCKAnoeE8JRGLQLypWZwcHXbjIDFVSUxs=;
        b=abs0aKKawe9UreMxgZLpv/13/6MYcHl67H559wN0n24RmJnUqqUyRl7CqYgLIIcCMr
         xDfRSxJFcjGNt/ZLekd2g9aTySdYIsYSVXKx2a/vvFXdTisE2J834bnake3YoQlg4h9o
         vYPH1qnlIOEMkg8HIOCCMDhKuBe07EVVRLELqm33gd9H6Kgaps4yDtMjMgUoxk5+AReH
         jhhVGH85DeTRqSdsMWiuHuqLg8CsJe+Wl9YhJuxj6ruD4qJsd2IwDFuEQLIESIBylqoL
         2SUtxmBgGyek3nApd/xbc3lKtSVHplWo5YttnIa4gZMp9F/WLBB/WzCA9mhvFzTcxpp5
         M07g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N3RXgD5J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471c29f01desi26266211cf.92.2025.02.13.20.17.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2025 20:17:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N3RXgD5J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tin8k-0005WW-1b; Thu, 13 Feb 2025 23:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tin8i-0005Vy-Dt
 for qemu-devel@nongnu.org; Thu, 13 Feb 2025 23:17:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tin8g-0002bJ-M9
 for qemu-devel@nongnu.org; Thu, 13 Feb 2025 23:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739506636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ZQkjM4kHbfBWA6DXLB1gENCQu/+ABtUZ4HwunpxUY4=;
 b=N3RXgD5JDVtbfLJsnFMPlKiFOIGQbL7mA9F+z2845yiz9VB/2W0ouBbw7Y8uD5LFW7LwOO
 K0GLeZ8sN27xDJWSoc9kupt/p1Z4w+xhbO3Fd5IJL71NKifn3EmBXXiCjiFhctv6SK9E3H
 FmhvaGqaWze4WrxsRvQHYjMB5TfQ6o4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-265-L-QaMNBaPTSIhDrfb2TGvA-1; Thu,
 13 Feb 2025 23:17:14 -0500
X-MC-Unique: L-QaMNBaPTSIhDrfb2TGvA-1
X-Mimecast-MFC-AGG-ID: L-QaMNBaPTSIhDrfb2TGvA_1739506633
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6F9191800872; Fri, 14 Feb 2025 04:17:12 +0000 (UTC)
Received: from gshan-thinkpadx1nanogen2.remote.csb (unknown [10.64.136.82])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 51F1419373C4; Fri, 14 Feb 2025 04:17:07 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
Subject: [PATCH 3/4] acpi/ghes: Allow retry to write CPER errors
Date: Fri, 14 Feb 2025 14:16:34 +1000
Message-ID: <20250214041635.608012-4-gshan@redhat.com>
In-Reply-To: <20250214041635.608012-1-gshan@redhat.com>
References: <20250214041635.608012-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wRvkh/GrErjk

Multiple CPER errors can be raised on multiple vCPUs at the same
time. The error -1 is returned from ghes_record_cper_errors() and
QEMU is terminated due to abort() in kvm_arch_on_sigbus_vcpu().
it isn't correct and expected behaviour since the affected vCPU
can't proceed with execution. It's reasonable to retry if the
reported error is transient, for example the previously reported
CPER error isn't claimed by the guest.

Add one more parameter (@retry_allowed) to acpi_ghes_memory_errors(),
passed down to ghes_record_cper_errors(). The differentiated error
number (1 or -1) is returned if the the previously reported CPER
error hasn't been claimed by the guest. The caller will retry the
request if the returned error number is 1.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/acpi/ghes-stub.c    |  3 ++-
 hw/acpi/ghes.c         | 12 +++++++++---
 include/hw/acpi/ghes.h |  3 ++-
 target/arm/kvm.c       |  2 +-
 4 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
index 7cec1812da..5c807afe21 100644
--- a/hw/acpi/ghes-stub.c
+++ b/hw/acpi/ghes-stub.c
@@ -11,7 +11,8 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/ghes.h"
 
-int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
+int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address,
+                            bool retry_allowed)
 {
     return -1;
 }
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a67326fd50..60587f3c1b 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -391,7 +391,7 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
 }
 
 static int ghes_record_cper_errors(const void *cper, size_t len,
-                                   uint16_t source_id)
+                                   uint16_t source_id, bool retry_allowed)
 {
     uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
     AcpiGedState *acpi_ged_state;
@@ -424,6 +424,10 @@ static int ghes_record_cper_errors(const void *cper, size_t len,
 
     /* zero means OSPM does not acknowledge the error */
     if (!read_ack_register) {
+        if (retry_allowed) {
+            return 1;
+        }
+
         error_report("OSPM does not acknowledge previous error,"
                      " so can not record CPER for current error anymore");
         return -1;
@@ -443,7 +447,8 @@ static int ghes_record_cper_errors(const void *cper, size_t len,
     return 0;
 }
 
-int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
+int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address,
+                            bool retry_allowed)
 {
     /* Memory Error Section Type */
     const uint8_t guid[] =
@@ -468,7 +473,8 @@ int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
     acpi_ghes_build_append_mem_cper(block, physical_address);
 
     /* Report the error */
-    ret = ghes_record_cper_errors(block->data, block->len, source_id);
+    ret = ghes_record_cper_errors(block->data, block->len,
+                                  source_id, retry_allowed);
 
     g_array_free(block, true);
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 578a582203..1dad62100a 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -74,7 +74,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
                      const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
-int acpi_ghes_memory_errors(uint16_t source_id, uint64_t error_physical_addr);
+int acpi_ghes_memory_errors(uint16_t source_id, uint64_t error_physical_addr,
+                            bool retry_allowed);
 
 /**
  * acpi_ghes_present: Report whether ACPI GHES table is present
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index da30bdbb23..5c0bf99aec 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2387,7 +2387,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
              */
             if (code == BUS_MCEERR_AR) {
                 kvm_cpu_synchronize_state(c);
-                if (!acpi_ghes_memory_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
+                if (!acpi_ghes_memory_errors(ACPI_HEST_SRC_ID_SEA, paddr, false)) {
                     kvm_inject_arm_sea(c);
                 } else {
                     error_report("failed to record the error");
-- 
2.48.1

