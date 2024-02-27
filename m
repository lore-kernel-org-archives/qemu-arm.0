Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2755846ejf;
        Tue, 27 Feb 2024 07:49:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUfedFTIC1zWTRQpGy9XFzeq/Ks+X/w2o+sYZlDiQUqw5nc0QIHzPSVHt9qmHmJBPTzafZsv5yDjdsqxwHgYGJc8YguT0tz
X-Google-Smtp-Source: AGHT+IFt5C1x5C0Cax6N60JBvMyXUzGl790GmyECCGweBUMdNF6ytyz3+2a8u01dtgtTcrxQhXSN
X-Received: by 2002:a05:6870:1711:b0:21f:f485:6b59 with SMTP id h17-20020a056870171100b0021ff4856b59mr8342671oae.26.1709048970565;
        Tue, 27 Feb 2024 07:49:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709048970; cv=none;
        d=google.com; s=arc-20160816;
        b=dUkXN8w4N0Xq4vzK7Yxq5V96gdt39bgzoZ8CfusHTmt8u6FGD4oLDsHeiE3uDi1gmb
         FMhb3Rl2u7I0+sPc/BH/+bvh4RJIP7WmBmke9jKTesgeL49aOLHobsO2vEtyFEwQxCX5
         pATLySGrH6cxV7GIuScF2HmbWCMXwfX2QKnYexBbK94zNTXX421FveoZULqr+Fnc3I1n
         rTmTpUj52xAlt/43iopGun9zmNA2qWzCrUtqDtZiqFF2F9kMFTotZ4FbWBFs+K0nHnRW
         8YLV4h+C6PqPIIzbjcLSrRYkdUDpaOtiiKOHib0/AtiBYVLRziHc88k+OIZOiRkm3lme
         A/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=d+BQTpn0bp8pXGO7NT5wHbJA+LOgaLbwGOLQf9cPlEA=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=upSjHyVXlDf6ReFwq/mTKDituHAmJ+5NELFZaep5GUevuZwK7+euW/2qWCTq310kn/
         5HhT82WqSg301/t3dQ0WfV++9LgpEDRM4reD0f2s5Z1Nvjww+3yVugKYyN0KcGAb5DOg
         fND2Y6+rKB0hCQGSbrrtudG4v8kpQRSN/8p6Uxnp1OXxc7PF8keJxsLUVWbprDS7cAvC
         98Z2Oge8OvetIaZgqU9u11llVBzkQyI69AaHNxl+7BXtq7NL0VycZ+lBvG5vQiCgWXui
         7xfK4/Y/YMru8LqaxaHUZQ/k0ESOh265E0DRH4j/gj4hXo3fc1jJ4q3dliCHGTGLFw98
         grwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JBtY8DXL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10-20020a05620a16aa00b00787b487ef99si7579007qkj.625.2024.02.27.07.49.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 07:49:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JBtY8DXL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rezgu-0005b9-2t; Tue, 27 Feb 2024 10:48:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezgs-0005aR-RT
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 10:48:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezgn-0008PL-9K
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 10:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709048896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d+BQTpn0bp8pXGO7NT5wHbJA+LOgaLbwGOLQf9cPlEA=;
 b=JBtY8DXLGed2zJN16KeYa4XzrwP9FMvcvVLoqLTkJJMtBZxCKio2EkO99EEML0vZf1HrZs
 TjUknLJVhWdfE5mBLXpxsHPi7NGEAHD6gkEKp3P9BljjM2nCFbhsC6xRHHu5XaVpiP25D8
 iJmMwJVqCq8pFxCCkBrDMPxex0zQiV8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-mBMWMcpvONW9_LhRjVwo1w-1; Tue,
 27 Feb 2024 10:48:12 -0500
X-MC-Unique: mBMWMcpvONW9_LhRjVwo1w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06E3F3C11C69;
 Tue, 27 Feb 2024 15:48:12 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75CB62166AE4;
 Tue, 27 Feb 2024 15:48:09 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH 06/19] smbios: get rid of smbios_legacy global
Date: Tue, 27 Feb 2024 16:47:36 +0100
Message-Id: <20240227154749.1818189-7-imammedo@redhat.com>
In-Reply-To: <20240227154749.1818189-1-imammedo@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6UgcZ3YzAkTY

clean up smbios_set_defaults() which is reused by legacy
and non legacy machines from being aware of 'legacy' notion
and need to turn it off. And push legacy handling up to
PC machine code where it's relevant.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
PS: I've moved/kept legacy smbios_entries to smbios_get_tables()
but it at least is not visible to API users. To get rid of it
as well, it would be necessary to change how '-smbios' CLI
option is processed. Which is done later in the series.
---
 include/hw/firmware/smbios.h |  2 +-
 hw/arm/virt.c                |  2 +-
 hw/i386/fw_cfg.c             |  7 ++++---
 hw/loongarch/virt.c          |  2 +-
 hw/riscv/virt.c              |  2 +-
 hw/smbios/smbios.c           | 35 +++++++++++++++--------------------
 6 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index a187fbbd3d..0818184834 100644
--- a/include/hw/firmware/smbios.h
+++ b/include/hw/firmware/smbios.h
@@ -293,7 +293,7 @@ struct smbios_type_127 {
 void smbios_entry_add(QemuOpts *opts, Error **errp);
 void smbios_set_cpuid(uint32_t version, uint32_t features);
 void smbios_set_defaults(const char *manufacturer, const char *product,
-                         const char *version, bool legacy_mode,
+                         const char *version,
                          bool uuid_encoded, SmbiosEntryPointType ep_type);
 void smbios_set_default_processor_family(uint16_t processor_family);
 uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *length);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0af1943697..8588681f27 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1633,7 +1633,7 @@ static void virt_build_smbios(VirtMachineState *vms)
     }
 
     smbios_set_defaults("QEMU", product,
-                        vmc->smbios_old_sys_ver ? "1.0" : mc->name, false,
+                        vmc->smbios_old_sys_ver ? "1.0" : mc->name,
                         true, SMBIOS_ENTRY_POINT_TYPE_64);
 
     /* build the array of physical mem area from base_memmap */
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index fcb4fb0769..c1e9c0fd9c 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -63,15 +63,16 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg)
     if (pcmc->smbios_defaults) {
         /* These values are guest ABI, do not change */
         smbios_set_defaults("QEMU", mc->desc, mc->name,
-                            pcmc->smbios_legacy_mode, pcmc->smbios_uuid_encoded,
+                            pcmc->smbios_uuid_encoded,
                             pcms->smbios_entry_point_type);
     }
 
     /* tell smbios about cpuid version and features */
     smbios_set_cpuid(cpu->env.cpuid_version, cpu->env.features[FEAT_1_EDX]);
 
-    smbios_tables = smbios_get_table_legacy(ms->smp.cpus, &smbios_tables_len);
-    if (smbios_tables) {
+    if (pcmc->smbios_legacy_mode) {
+        smbios_tables = smbios_get_table_legacy(ms->smp.cpus,
+                                                &smbios_tables_len);
         fw_cfg_add_bytes(fw_cfg, FW_CFG_SMBIOS_ENTRIES,
                          smbios_tables, smbios_tables_len);
         return;
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 0ad7d8c887..73fb3522ba 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -320,7 +320,7 @@ static void virt_build_smbios(LoongArchMachineState *lams)
         return;
     }
 
-    smbios_set_defaults("QEMU", product, mc->name, false,
+    smbios_set_defaults("QEMU", product, mc->name,
                         true, SMBIOS_ENTRY_POINT_TYPE_64);
 
     smbios_get_tables(ms, NULL, 0, &smbios_tables, &smbios_tables_len,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index fd35c74781..e2c9529df2 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1235,7 +1235,7 @@ static void virt_build_smbios(RISCVVirtState *s)
         product = "KVM Virtual Machine";
     }
 
-    smbios_set_defaults("QEMU", product, mc->name, false,
+    smbios_set_defaults("QEMU", product, mc->name,
                         true, SMBIOS_ENTRY_POINT_TYPE_64);
 
     if (riscv_is_32bit(&s->soc[0])) {
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 15339d8dbe..c46fc93357 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -54,7 +54,6 @@ struct smbios_table {
 
 static uint8_t *smbios_entries;
 static size_t smbios_entries_len;
-static bool smbios_legacy = true;
 static bool smbios_uuid_encoded = true;
 /* end: legacy structures & constants for <= 2.0 machines */
 
@@ -570,9 +569,16 @@ static void smbios_build_type_1_fields(void)
 
 uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *length)
 {
-    if (!smbios_legacy) {
-        *length = 0;
-        return NULL;
+    /* drop unwanted version of command-line file blob(s) */
+    g_free(smbios_tables);
+    smbios_tables = NULL;
+
+    /* also complain if fields were given for types > 1 */
+    if (find_next_bit(have_fields_bitmap,
+                      SMBIOS_MAX_TYPE + 1, 2) < SMBIOS_MAX_TYPE + 1) {
+        error_report("can't process fields for smbios "
+                     "types > 1 on machine versions < 2.1!");
+        exit(1);
     }
 
     if (!smbios_immutable) {
@@ -1006,28 +1012,13 @@ void smbios_set_default_processor_family(uint16_t processor_family)
 }
 
 void smbios_set_defaults(const char *manufacturer, const char *product,
-                         const char *version, bool legacy_mode,
+                         const char *version,
                          bool uuid_encoded, SmbiosEntryPointType ep_type)
 {
     smbios_have_defaults = true;
-    smbios_legacy = legacy_mode;
     smbios_uuid_encoded = uuid_encoded;
     smbios_ep_type = ep_type;
 
-    /* drop unwanted version of command-line file blob(s) */
-    if (smbios_legacy) {
-        g_free(smbios_tables);
-        /* in legacy mode, also complain if fields were given for types > 1 */
-        if (find_next_bit(have_fields_bitmap,
-                          SMBIOS_MAX_TYPE+1, 2) < SMBIOS_MAX_TYPE+1) {
-            error_report("can't process fields for smbios "
-                         "types > 1 on machine versions < 2.1!");
-            exit(1);
-        }
-    } else {
-        g_free(smbios_entries);
-    }
-
     SMBIOS_SET_DEFAULT(type1.manufacturer, manufacturer);
     SMBIOS_SET_DEFAULT(type1.product, product);
     SMBIOS_SET_DEFAULT(type1.version, version);
@@ -1103,6 +1094,10 @@ void smbios_get_tables(MachineState *ms,
 {
     unsigned i, dimm_cnt, offset;
 
+    /* drop unwanted (legacy) version of command-line file blob(s) */
+    g_free(smbios_entries);
+    smbios_entries = NULL;
+
     if (!smbios_immutable) {
         smbios_build_type_0_table();
         smbios_build_type_1_table();
-- 
2.39.3

