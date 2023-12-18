Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp853514eji;
        Mon, 18 Dec 2023 07:05:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJhicBJZanSkfT2BCRyl6OPVf0BN3EYIX1N1KnJaA+gN2l/cio3V5kAYZSkTcPF8TZ7hLo
X-Received: by 2002:a05:6122:4b10:b0:4b6:daae:5d26 with SMTP id fc16-20020a0561224b1000b004b6daae5d26mr549791vkb.11.1702911900425;
        Mon, 18 Dec 2023 07:05:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702911900; cv=none;
        d=google.com; s=arc-20160816;
        b=UIrnaVknSYNn6XbFOqOmvYc7k4g3OvJClUUUI3kr9R2CFmwbwN37MqTsTTPL1kt9NM
         GbaQ9rLZfDfuZU4RhZpTUEpglYMjCACMG1KO58XGj2ZElBLoHatz4tH5ibrls9EvUxJs
         5dEY9aUSrvEY6KuvndLHVmMmDh4iFxmhMoub3A2ZfA6O9teKqfgUwitY6Lj8W81wcjj/
         MkqvW4lEIRN85sQxeEmaokvdZHeUWLXHs14q6ir0kHZrNcT6mA3h+yhIsBtoLXkMWtJ8
         TZIpE6Ri2+2+IgMcsH9WLP2JZnBNQZ9/fhutneKgVbkwfu6s5A8TlPIUsN1rZWX5pggw
         0eRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=su/VT/HTU5sh+lAV3A29ZvxEgV6Ge3BHzxOfbd2pD+o=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=fOPeew6367QBURgBG/fOf06gnNpOu238ZOvMVWh0TrUOeJNKNpEnjc3zFg5GUooLP9
         r8hWdSKENblcKUbvpr/euHsELrmWxzytpdVpGGEYxkhSc5gNKZz0/AkJlHga4rz1aTdI
         U9eIcq5/oJnOk11nHF6NElR9wj+bSAFNbom1L2S9D31wATBIVAg+mZskVMeR/pGXaoqR
         /1yjKytOvOLDhLSoYmRtUFvTrrKaXcr5GjYp9SmFXBLc0Q5Cd0z2g7wXTwLAfw9+fOca
         sw6weWWVdO3QjTJ0z+65+2LS0DEpj0zEIax0OV0AKHH0QuxV+Gqs+lpyFqh1AZlj7KHD
         55iA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=flpomga3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5-20020a1fc405000000b004b2821d67b6si4363752vkf.210.2023.12.18.07.05.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 07:05:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=flpomga3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rFF9f-00021C-V1; Mon, 18 Dec 2023 10:03:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9Z-0001wM-3n
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 10:03:33 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9X-0007E0-9d
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 10:03:32 -0500
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5c6839373f8so2093999a12.0
 for <qemu-devel@nongnu.org>; Mon, 18 Dec 2023 07:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702911810; x=1703516610; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=su/VT/HTU5sh+lAV3A29ZvxEgV6Ge3BHzxOfbd2pD+o=;
 b=flpomga3p9gEQJqd0aBPyq4RgySWbRCri615NBJaWDt6uPZPFZ3aoZYg8G2+b+Jm66
 84dg/pLbJhxJWJkgVIjNCqhdAZR917RWt/acMEn4dZsSshECvvmZt9Vzd9ITm/qNUiDC
 Zu3nhRvA1gvIpMdR/xXIP6xmpqbyuQpkGM7wuoZ1vlXfcZiUNgbwq6L1TAA1okuNsAzA
 nA+m1NriNBy7wINSSkF7+zxY5hR+ksC2Zkkopip38iADIe3xW5JC+Ccwt7XS7g+x2a8k
 GvQNvDsaY+vb63veFMVQfj2eVf04NRjC+baASyRPLJ1BhmJuoOgWibiUeI9Phi/jkJhH
 Wp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702911810; x=1703516610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=su/VT/HTU5sh+lAV3A29ZvxEgV6Ge3BHzxOfbd2pD+o=;
 b=WSo5p4e0jP5rY+vVvnKJ/OhD4Q7K7RkyD6lB1GsY94AKAD0jbtphAjQvLlRPrPlr1q
 zvM7URrifWa2xHJqvZZqvGA4sdFRJv2sr2YsFVhaKF9F+dlDVE9s8dLxQsdOVFXgnv0g
 BqACpJXW7Z+GxlUrzQ+hHdvZzNpLXBpyOR1AAELRb2GrCOGv5HXCND8OUBy9dPedvsZu
 OA0Q25FNcg6wVywy6qfmRZSDo7SRHV1BY6yV+5aZ6Q3RwWbBdTo9RLOrVf55SDtVzX20
 lCeP7OnvcZvkcWWW5ckFpDEETzHZGcwQkxhCEGKk4WSN+kXQylWJwsgO/igHX6i9BLnu
 twDA==
X-Gm-Message-State: AOJu0YwloATvcSClr8Gt2s/V8gw1RORJdeIk79XZdoRT96C/+HhpskRP
 RJetlbUbPEsOeINO4MuN8PMM3w==
X-Received: by 2002:a05:6a21:3e0a:b0:194:1d9:aafc with SMTP id
 bk10-20020a056a213e0a00b0019401d9aafcmr5507469pzc.46.1702911809405; 
 Mon, 18 Dec 2023 07:03:29 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a056a000a0100b006c06779e593sm18975505pfh.16.2023.12.18.07.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:03:28 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v8 05/13] hw/riscv/virt-acpi-build.c: Add AIA support in RINTC
Date: Mon, 18 Dec 2023 20:32:39 +0530
Message-Id: <20231218150247.466427-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218150247.466427-1-sunilvl@ventanamicro.com>
References: <20231218150247.466427-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ciT9jFxzdUEb

Update the RINTC structure in MADT with AIA related fields.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/riscv/virt-acpi-build.c | 43 ++++++++++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index d8772c2821..3f9536356e 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -38,6 +38,7 @@
 #include "hw/intc/riscv_aclint.h"
 
 #define ACPI_BUILD_TABLE_SIZE             0x20000
+#define ACPI_BUILD_INTC_ID(socket, index) ((socket << 24) | (index))
 
 typedef struct AcpiBuildState {
     /* Copy of table in RAM (for patching) */
@@ -59,17 +60,50 @@ static void acpi_align_size(GArray *blob, unsigned align)
 
 static void riscv_acpi_madt_add_rintc(uint32_t uid,
                                       const CPUArchIdList *arch_ids,
-                                      GArray *entry)
+                                      GArray *entry,
+                                      RISCVVirtState *s)
 {
+    uint8_t  guest_index_bits = imsic_num_bits(s->aia_guests + 1);
     uint64_t hart_id = arch_ids->cpus[uid].arch_id;
+    uint32_t imsic_size, local_cpu_id, socket_id;
+    uint64_t imsic_socket_addr, imsic_addr;
+    MachineState *ms = MACHINE(s);
 
+    socket_id = arch_ids->cpus[uid].props.node_id;
+    local_cpu_id = (arch_ids->cpus[uid].arch_id -
+                    riscv_socket_first_hartid(ms, socket_id)) %
+                    riscv_socket_hart_count(ms, socket_id);
+    imsic_socket_addr = s->memmap[VIRT_IMSIC_S].base +
+                        (socket_id * VIRT_IMSIC_GROUP_MAX_SIZE);
+    imsic_size = IMSIC_HART_SIZE(guest_index_bits);
+    imsic_addr = imsic_socket_addr + local_cpu_id * imsic_size;
     build_append_int_noprefix(entry, 0x18, 1);       /* Type     */
-    build_append_int_noprefix(entry, 20, 1);         /* Length   */
+    build_append_int_noprefix(entry, 36, 1);         /* Length   */
     build_append_int_noprefix(entry, 1, 1);          /* Version  */
     build_append_int_noprefix(entry, 0, 1);          /* Reserved */
     build_append_int_noprefix(entry, 0x1, 4);        /* Flags    */
     build_append_int_noprefix(entry, hart_id, 8);    /* Hart ID  */
     build_append_int_noprefix(entry, uid, 4);        /* ACPI Processor UID */
+    /* External Interrupt Controller ID */
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
+        build_append_int_noprefix(entry,
+                                  ACPI_BUILD_INTC_ID(
+                                      arch_ids->cpus[uid].props.node_id,
+                                      local_cpu_id),
+                                  4);
+    } else {
+        build_append_int_noprefix(entry, 0, 4);
+    }
+
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+        /* IMSIC Base address */
+        build_append_int_noprefix(entry, imsic_addr, 8);
+        /* IMSIC Size */
+        build_append_int_noprefix(entry, imsic_size, 4);
+    } else {
+        build_append_int_noprefix(entry, 0, 8);
+        build_append_int_noprefix(entry, 0, 4);
+    }
 }
 
 static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
@@ -88,7 +122,7 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
                        aml_int(arch_ids->cpus[i].arch_id)));
 
             /* build _MAT object */
-            riscv_acpi_madt_add_rintc(i, arch_ids, madt_buf);
+            riscv_acpi_madt_add_rintc(i, arch_ids, madt_buf, s);
             aml_append(dev, aml_name_decl("_MAT",
                                           aml_buffer(madt_buf->len,
                                           (uint8_t *)madt_buf->data)));
@@ -227,6 +261,7 @@ static void build_dsdt(GArray *table_data,
  * 5.2.12 Multiple APIC Description Table (MADT)
  * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/15
  *      https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
+ *      https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view
  */
 static void build_madt(GArray *table_data,
                        BIOSLinker *linker,
@@ -246,7 +281,7 @@ static void build_madt(GArray *table_data,
 
     /* RISC-V Local INTC structures per HART */
     for (int i = 0; i < arch_ids->len; i++) {
-        riscv_acpi_madt_add_rintc(i, arch_ids, table_data);
+        riscv_acpi_madt_add_rintc(i, arch_ids, table_data, s);
     }
 
     acpi_table_end(linker, &table);
-- 
2.39.2

