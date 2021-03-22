Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3718953lfg;
        Mon, 22 Mar 2021 08:57:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRjJHM6Y8JSDCXnzIKmFqqSQcS+91ehQRsTmAWjlpA0w3R57me121R4r7RCzJ8237+2WSo
X-Received: by 2002:a92:ad11:: with SMTP id w17mr515176ilh.199.1616428666829;
        Mon, 22 Mar 2021 08:57:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616428666; cv=none;
        d=google.com; s=arc-20160816;
        b=hcZzBykqaXNF57gMYAG5FXxgPIgEy/p+GS+5vz0ZjG+QBve8ICD3CU+y0CU5b/ma4I
         kgzR2/ou2je/jjn1UMXSIgrbJoL8J17v+oE8j3saqzyc4fuLzYu3KL9nN+JbnSa8iyfy
         rdinz3mo4mLUK267GWCYG8SJLYrhqIb56DKUWUmOAaSJDz5B3u4fU6UAV1JjWXX6YOPE
         qRGrC/wOf26SbFOMopv0gcbX8s02et0CoCsiyeRkDCRpTKKiNvH90mTgD9+HQjOO3642
         pANqzftM8ZC/FVEc/5W1Y56bVW8SOorZRz9ikNqrdsOztOm6vO+ufcnJSP4Ev+EvaRGw
         k7OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=943xaER/uZ2yx+0NU3LkWfKz9OTuumEUfbOODT+zbzU=;
        b=Jc8jZK9+WbroKt/hDF9JMl6CtLIeaTSj6ToP2dVUnGw59+3xxk3XjRFAwqA9iRVDZ4
         Sqo1qp3XBNxEfL4Diz4wUELt8vFlHYfk3HBBqrgtRjEwlEX0Q0QP6hLBUhulfsGwQkJ9
         KSy6Ig0ikbIuJFfkCi2XbNFUTd6Wl+4lBckbk42/h6WGV4KaM7nQ3nsi5HTBbG6rarhW
         uMKHqZUYEPx/6fYfg+SC0GQbZlnU1rYmBQYsZ5vKSwF/SxchuGOdXP5K2hDRwtt9Dzq9
         YJJkBQKCpUfu3dZMf6gpdijtdfLiyqrLbfMC5uXS0xABtxOcAzBv2ddVTUaiApxfp417
         MHRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="UXVZ/jav";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1si9242555ilg.52.2021.03.22.08.57.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 08:57:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="UXVZ/jav";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOMw6-0002Mn-4M
	for alex.bennee@linaro.org; Mon, 22 Mar 2021 11:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMkH-0005Xz-G1
 for qemu-arm@nongnu.org; Mon, 22 Mar 2021 11:45:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMk8-0007Jn-NZ
 for qemu-arm@nongnu.org; Mon, 22 Mar 2021 11:45:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616427922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=943xaER/uZ2yx+0NU3LkWfKz9OTuumEUfbOODT+zbzU=;
 b=UXVZ/javHIth0d+7xaYhuAEEHhxHGcaC/DBFqI78UZ/sTcsjcN54nFLbhBZEnrfvNl27vy
 I+NAh+3woXsq0NjII7R7Vrfywwv+ZstVTmX/bynW7DZG8J/mBoewj9O5p+tLT7PwS4bUnW
 xCY+Bx2HMh996GB0Yczn7cYzp5Ff9D4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-RqHeZ4m0M6e87ekK6Rse7A-1; Mon, 22 Mar 2021 11:45:20 -0400
X-MC-Unique: RqHeZ4m0M6e87ekK6Rse7A-1
Received: by mail-wr1-f71.google.com with SMTP id h30so26370641wrh.10
 for <qemu-arm@nongnu.org>; Mon, 22 Mar 2021 08:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=943xaER/uZ2yx+0NU3LkWfKz9OTuumEUfbOODT+zbzU=;
 b=e5x52qWu/w3ldJlFxX5QlbYA0IWTdEdy7CIR3BCN0sW5pD+0bXMUxpNj2DjYjUBLRT
 mPSLRHHiH+Y7N3gHpMknnVgFhwH8mhLyLr0VGpu96hGWqS3BwwGam0QVME1C+AHkA+Qg
 CVy2m/f70yuIsk15xP2rwwy8fFTtdzLcFUF28B2jm1VGm3KIZQ1ENApYpJOSm8eMWPUD
 ANhvQebAGOvHJo4kNOYK2tplkDRRvxIiiSyhWV9BPkfqAOHxFgVO79AnmDLyZS7GPKc6
 C9HQ6v14casO+hL5ENTzn3B7R7CwdP7qVnq3Wx0bJg19IGg6JO3DppwAmh2pKrUMppSf
 65sQ==
X-Gm-Message-State: AOAM530Q0gqmSeS8U92jMvlRc5vwzvziZ8R+Z47nhZ6MgMBzcg4XHk2g
 0+ERvbn+sqHwvB6AB7SFWJ0vsVm3PMTVpfma6G2Qs/IxWc6NIFUdq+d0FeoKX8hcioVVKNk4226
 pFzMZHetOGOa8
X-Received: by 2002:a05:600c:1992:: with SMTP id
 t18mr412860wmq.125.1616427919114; 
 Mon, 22 Mar 2021 08:45:19 -0700 (PDT)
X-Received: by 2002:a05:600c:1992:: with SMTP id
 t18mr412843wmq.125.1616427918959; 
 Mon, 22 Mar 2021 08:45:18 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id u2sm20840802wrp.12.2021.03.22.08.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 08:45:18 -0700 (PDT)
Date: Mon, 22 Mar 2021 11:45:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/20] acpi: Move maximum size logic into acpi_add_rom_blob()
Message-ID: <20210322154417.524229-19-mst@redhat.com>
References: <20210322154417.524229-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322154417.524229-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UMKM9+2XnB+4

From: David Hildenbrand <david@redhat.com>

We want to have safety margins for all tables based on the table type.
Let's move the maximum size logic into acpi_add_rom_blob() and make it
dependent on the table name, so we don't have to replicate for each and
every instance that creates such tables.

Suggested-by: Laszlo Ersek <lersek@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210304105554.121674-4-david@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/aml-build.h |  4 ----
 include/hw/acpi/utils.h     |  3 +--
 hw/acpi/utils.c             | 12 ++++++++++--
 hw/arm/virt-acpi-build.c    | 13 ++++++-------
 hw/i386/acpi-build.c        |  8 +++-----
 hw/i386/acpi-microvm.c      | 16 ++++++----------
 6 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index ca781f3531..471266d739 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -4,10 +4,6 @@
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/bios-linker-loader.h"
 
-/* Reserve RAM space for tables: add another order of magnitude. */
-#define ACPI_BUILD_TABLE_MAX_SIZE         0x200000
-#define ACPI_BUILD_LOADER_MAX_SIZE        0x10000
-
 #define ACPI_BUILD_APPNAME6 "BOCHS "
 #define ACPI_BUILD_APPNAME8 "BXPC    "
 
diff --git a/include/hw/acpi/utils.h b/include/hw/acpi/utils.h
index 140b4de603..0022df027d 100644
--- a/include/hw/acpi/utils.h
+++ b/include/hw/acpi/utils.h
@@ -4,6 +4,5 @@
 #include "hw/nvram/fw_cfg.h"
 
 MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
-                                GArray *blob, const char *name,
-                                uint64_t max_size);
+                                GArray *blob, const char *name);
 #endif
diff --git a/hw/acpi/utils.c b/hw/acpi/utils.c
index a134a4d554..f2d69a6d92 100644
--- a/hw/acpi/utils.c
+++ b/hw/acpi/utils.c
@@ -27,9 +27,17 @@
 #include "hw/loader.h"
 
 MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
-                                GArray *blob, const char *name,
-                                uint64_t max_size)
+                                GArray *blob, const char *name)
 {
+    uint64_t max_size = 0;
+
+    /* Reserve RAM space for tables: add another order of magnitude. */
+    if (!strcmp(name, ACPI_BUILD_TABLE_FILE)) {
+        max_size = 0x200000;
+    } else if (!strcmp(name, ACPI_BUILD_LOADER_FILE)) {
+        max_size = 0x10000;
+    }
+
     return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
                         name, update, opaque, NULL, true);
 }
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index a91550de6f..f5a2b2d4cb 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -859,14 +859,13 @@ void virt_acpi_setup(VirtMachineState *vms)
     /* Now expose it all to Guest */
     build_state->table_mr = acpi_add_rom_blob(virt_acpi_build_update,
                                               build_state, tables.table_data,
-                                              ACPI_BUILD_TABLE_FILE,
-                                              ACPI_BUILD_TABLE_MAX_SIZE);
+                                              ACPI_BUILD_TABLE_FILE);
     assert(build_state->table_mr != NULL);
 
-    build_state->linker_mr =
-        acpi_add_rom_blob(virt_acpi_build_update, build_state,
-                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE,
-                          ACPI_BUILD_LOADER_MAX_SIZE);
+    build_state->linker_mr = acpi_add_rom_blob(virt_acpi_build_update,
+                                               build_state,
+                                               tables.linker->cmd_blob,
+                                               ACPI_BUILD_LOADER_FILE);
 
     fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
                     acpi_data_len(tables.tcpalog));
@@ -880,7 +879,7 @@ void virt_acpi_setup(VirtMachineState *vms)
 
     build_state->rsdp_mr = acpi_add_rom_blob(virt_acpi_build_update,
                                              build_state, tables.rsdp,
-                                             ACPI_BUILD_RSDP_FILE, 0);
+                                             ACPI_BUILD_RSDP_FILE);
 
     qemu_register_reset(virt_acpi_build_reset, build_state);
     virt_acpi_build_reset(build_state);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index dc56006353..3aeae15e57 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2628,14 +2628,12 @@ void acpi_setup(void)
     /* Now expose it all to Guest */
     build_state->table_mr = acpi_add_rom_blob(acpi_build_update,
                                               build_state, tables.table_data,
-                                              ACPI_BUILD_TABLE_FILE,
-                                              ACPI_BUILD_TABLE_MAX_SIZE);
+                                              ACPI_BUILD_TABLE_FILE);
     assert(build_state->table_mr != NULL);
 
     build_state->linker_mr =
         acpi_add_rom_blob(acpi_build_update, build_state,
-                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE,
-                          ACPI_BUILD_LOADER_MAX_SIZE);
+                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE);
 
     fw_cfg_add_file(x86ms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
                     tables.tcpalog->data, acpi_data_len(tables.tcpalog));
@@ -2674,7 +2672,7 @@ void acpi_setup(void)
         build_state->rsdp = NULL;
         build_state->rsdp_mr = acpi_add_rom_blob(acpi_build_update,
                                                  build_state, tables.rsdp,
-                                                 ACPI_BUILD_RSDP_FILE, 0);
+                                                 ACPI_BUILD_RSDP_FILE);
     }
 
     qemu_register_reset(acpi_build_reset, build_state);
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 502aac0ba2..271710eb92 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -249,16 +249,12 @@ void acpi_setup_microvm(MicrovmMachineState *mms)
     acpi_build_microvm(&tables, mms);
 
     /* Now expose it all to Guest */
-    acpi_add_rom_blob(acpi_build_no_update, NULL,
-                      tables.table_data,
-                      ACPI_BUILD_TABLE_FILE,
-                      ACPI_BUILD_TABLE_MAX_SIZE);
-    acpi_add_rom_blob(acpi_build_no_update, NULL,
-                      tables.linker->cmd_blob,
-                      ACPI_BUILD_LOADER_FILE, ACPI_BUILD_LOADER_MAX_SIZE);
-    acpi_add_rom_blob(acpi_build_no_update, NULL,
-                      tables.rsdp,
-                      ACPI_BUILD_RSDP_FILE, 0);
+    acpi_add_rom_blob(acpi_build_no_update, NULL, tables.table_data,
+                      ACPI_BUILD_TABLE_FILE);
+    acpi_add_rom_blob(acpi_build_no_update, NULL, tables.linker->cmd_blob,
+                      ACPI_BUILD_LOADER_FILE);
+    acpi_add_rom_blob(acpi_build_no_update, NULL, tables.rsdp,
+                      ACPI_BUILD_RSDP_FILE);
 
     acpi_build_tables_cleanup(&tables, false);
 }
-- 
MST

