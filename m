Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp530575eja;
        Thu, 2 Nov 2023 10:03:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWOikkz3JhuumEcNqUWc2qUW8i+T/vdBOqDs42uEFb7KYw/SnMD3s8/XS+49jQ47f3YUg0
X-Received: by 2002:a05:622a:256:b0:41c:dfb0:3bb5 with SMTP id c22-20020a05622a025600b0041cdfb03bb5mr23300816qtx.55.1698944618287;
        Thu, 02 Nov 2023 10:03:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698944618; cv=none;
        d=google.com; s=arc-20160816;
        b=HtNfjvNy4xw0RTMBOplID/Q2Z3OXI+FR478CpbXM57/cHIC/o1Kv0udPo+XjCwqT7J
         QpZus3EmIfmHqs0zExoV0T4/P/oZFsTIZxbpNXVCAb0mebLqP/cFZsgZ31OyezNuyh14
         V4hqDRa5CbzDzlzOPDok+koVoRKakAeijAKxFEI7lRgOVt6DAAIGRexwOppsI7BWRUoH
         jmDHwuEztGZhv1bjycoqficV43E5KcT9XWTxUrwPayZpPAb1zVwpVNuifrrOS7jbh0w4
         8Z+32jYyeWlZvac6HCKBCo4fJpUHauOSNxHs4WYBZI1UkUAK4G8b9g4rFZ3V7D7FFIWY
         BaQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=su/VT/HTU5sh+lAV3A29ZvxEgV6Ge3BHzxOfbd2pD+o=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=jzOwCe70oaJdQ8ULcRKio4b137Hywt8dTRnWMebPmfMB6JYOZEFqG8hFZJk1Wh0lVn
         pXz7XHmErV9Xwk0yOr6swl7QjzXGpeHmM8pEqb/5TP9L53NCQbgrfPruujYik5U4+QfO
         QhfT0gdDJoRZ4819mKdP+VQUgA9s/T4MNRPoXusFF1jUF/VOb2ej50LKdXSVxBDhPTy6
         gMrWCy53VRi3qkFVFNQrb7mgQk4EekJkWpIU3oUgPWW9xlhVmIzMLj92/uvG33auf6Yf
         Byv4I6RiQ5mm3036m2hX/D/x7QZF03wIjNKAsOUC/p/KTCA67SVVQWz79NGRn92kgCtI
         8knw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=GwDSWH3C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18-20020a05622a009200b00419859dfdc9si243308qtw.62.2023.11.02.10.03.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 10:03:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=GwDSWH3C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyb68-0002xg-RE; Thu, 02 Nov 2023 13:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyb67-0002vi-63
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 13:03:11 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyb64-00048v-8n
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 13:03:10 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-28023eadc70so1161499a91.2
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 10:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698944586; x=1699549386; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=su/VT/HTU5sh+lAV3A29ZvxEgV6Ge3BHzxOfbd2pD+o=;
 b=GwDSWH3CRoxoZ3HznZSujDtS0/MWiy1bxa5/AVWJ7YO3UYHcrRgjD/EE64V2qt5itN
 0jT3ludN3WaFaOfnB3MFM9Ng6MZg6JtYrxOx1OdeoImIYJZhAHC/hjOIWnr70eaFh7zA
 u7MgFpJLllBfRfO9vR2h/0pk0PwhqCKcsGTEXagV30F6tYDpzs8PV6uUxgnEuxtZ25y/
 WUEPmluuuMsn1PSMsKU2gYi57NnaOl2+ErmHheRGNUqIH/LD37sZrhPtDIWFgz7ThP9V
 mEypMIEip2dNcEGkFa47ebgnrqUjJaUTvgJtB7QSQWeJuXpfRAKWGuSTLdVVbboZhKDo
 tKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698944586; x=1699549386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=su/VT/HTU5sh+lAV3A29ZvxEgV6Ge3BHzxOfbd2pD+o=;
 b=mJcpS4HL6UYZBgSfDoyCWQh4NrQ056Vyf7M39MR/0YM554+tKzUAbKAYDpIOdcjuLh
 Ho6Rnm3kftirW3pSk++wbXfEiZ0a6VC20e49Nz6S3Sb77DTbo8DkF4doh+YwWIwDVuHB
 seGuDTsvGj3uC4aB+5YSBE8U3PW1za9LXrJh7w5+S70x3MWVGACTlh4KMzFQprpb3a9t
 z6x7Vx5mQ1eR7wmMNqfE/1J/bdaPxAsrmllxEqoCbpzFo3Zi93Fi7G8QLvLotGETF61V
 6JnJ+3rkBNv9Iz/w2c1+nVuYPruVOSpyxs1XPDSNh3jJ2GmF6d6mtenXP7vpv6qurynd
 ITGA==
X-Gm-Message-State: AOJu0YxONGMzjuYNem/Iuc/znHps4i/LSwn/1OwIwu+f5INzwCeRuqWA
 uUj9u/PY6iS5ieYSfs0pzyNxDoig0Gq9YeHsunAf8g==
X-Received: by 2002:a17:90a:fd01:b0:27f:ebfa:1112 with SMTP id
 cv1-20020a17090afd0100b0027febfa1112mr15865217pjb.5.1698944584745; 
 Thu, 02 Nov 2023 10:03:04 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 18-20020a17090a031200b0026b70d2a8a2sm25098pje.29.2023.11.02.10.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 10:03:04 -0700 (PDT)
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
Subject: [PATCH v6 05/13] hw/riscv/virt-acpi-build.c: Add AIA support in RINTC
Date: Thu,  2 Nov 2023 22:32:15 +0530
Message-Id: <20231102170223.2619260-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
References: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ygr0wHr5I8o8

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

