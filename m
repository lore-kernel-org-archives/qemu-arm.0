Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp812982eja;
        Thu, 2 Nov 2023 20:18:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa47e3opEssqVUNSScWI+25/woKt0wQWW3XvizgnVpFtLf63cyXa2HiLBv5B0Ket/kv2Z8
X-Received: by 2002:a67:c28e:0:b0:458:47e6:70e4 with SMTP id k14-20020a67c28e000000b0045847e670e4mr20687531vsj.19.1698981504018;
        Thu, 02 Nov 2023 20:18:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698981503; cv=none;
        d=google.com; s=arc-20160816;
        b=xPy6sCw4za1dErP1I03BCxj12rypJu0eTdgvzu1On4pbDii1F9ZCmTmGzR5rvAIbvz
         YcNNcM5k/3gPoZXh1uVrbXg9qrMIQwOZ6P7oXXeixFDWjQFp0iYp2MHlvb1UKrTiKaHy
         w6cbVWHODbVQQjtEbXJ7QCIJHLMz2e/VB4iqRqme+PYbV6o6TmkPWckQwz7UtcCrmgDo
         PvLy9ltbcB62ryGD+HUcbI3Z9MHgLCx9q4Uhag6VTZVOjujpPx5AYSIsbzGKMyyGcnOl
         RHfHOcODhKa6kQRwqDDrLYCffb9PjvtuihM7OOWQ15h7Iikoe8tX00hhMVwBBcLabs4h
         4WBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=su/VT/HTU5sh+lAV3A29ZvxEgV6Ge3BHzxOfbd2pD+o=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=gaNr94v0nPw3ez3AsUx1a1ERZgs6ZzbQlISUdEyV0fP/N+O0aHu6luII+tgWDflVVo
         kQcPOWz+dXzXGJgdn+3tPz+mBrhDYfH7sLd7Oqn31iZcedFGwzOLl9f1eU2Dvd50Rq8v
         Zyu5Z9rm30YZ7PN3mlVIIshE0U4JmKZTC8dmOB3EDq8KlUe3h/0XxbA0+Uk+0JNTiMf9
         qXLWWO7awOge2OcVw4+m5XPhEGq1EzaeSLYBLdjdptTZUgKyXo4RHYVyWIAhiYO9BgMm
         2GgE2+h29+g0AvBNl8PXryhPM8pTnDWf+6MqNLP89yPDWYjZIBDfuXZS9+5fYif2RhuH
         0gEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=fiQ3C8c3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8-20020a05622a11c800b00413150183dbsi757661qtk.737.2023.11.02.20.18.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 20:18:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=fiQ3C8c3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qykgm-0007uh-LS; Thu, 02 Nov 2023 23:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykgk-0007tF-9k
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 23:17:38 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykgf-0003r8-4T
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 23:17:37 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-28041176e77so1468839a91.0
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 20:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698981451; x=1699586251; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=su/VT/HTU5sh+lAV3A29ZvxEgV6Ge3BHzxOfbd2pD+o=;
 b=fiQ3C8c3of91iVF81PmgGfpjVRZK+lGE68PkGfI9PktYG1SEBrWZ8sUmN77DN8HUI4
 OaQsnL2/9BjAfZSAyCMHEs/6tHtU/7QjbqTP6mRQrdsKgy3udnwshPGVvvf6GkLwIbw1
 +K/DJoEvjqascJhKms1JkBmkL3Rr0JzbL84z/8P4mF4gIOFTbT3EWnUmiKRgvTqNWTfl
 D/Hggha5SOe0Y4PBpT4yizvYNX7N6VZzVP2Iuci5KydUMVMwtzENnly61V40lmuwnqxH
 YpiMK3sZgnsGHMcrB7xNPzNczWTJibIEcuNFwqPZIfomHrSC6wEhO/NlAoPjR48EAj4V
 dkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698981451; x=1699586251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=su/VT/HTU5sh+lAV3A29ZvxEgV6Ge3BHzxOfbd2pD+o=;
 b=MEMl8kl5WpypS9o+CGjhWwJ593BQ6xkIBS60ztdwHHut5AJk9SGy/Jaj7tTAoMMq4k
 bv19dzuHMm+0MMjFsXDDULQes9rB9nbbhN2aW3T+JL4ETPki2SUDzL3gAGQiVF1bPDb5
 dsyOPN/TfT+GI8I7BH6rUTuptdsssksS8rfE9/glVf+24HmIRqqOWTQvgHQT8qHlil0f
 e7ZTEkW2S03bzLOAB1ZJzwzRGblIpIiz0hFoCGsvOf78Xug4NBC40tfOe2eCn/wZc8Yh
 PEwjBn3OKXGM09NnmKXklIuvRiNL5Ot8GAdUgiv4t3w4SAmK0rBQGvyO472U+DZHvpBP
 /Z7g==
X-Gm-Message-State: AOJu0Yza0Sq8Hvc5X+2o8LZDMtXZ+qymG2asg6xdWFp2eerWbLvb6+m9
 sKtSK+SpRiNgNueiFXtlQe+Us9fz3DMMg77UcLESUw==
X-Received: by 2002:a17:90a:4922:b0:27d:1862:a494 with SMTP id
 c31-20020a17090a492200b0027d1862a494mr16835253pjh.11.1698981450354; 
 Thu, 02 Nov 2023 20:17:30 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a17090aca9100b0027cf4c554dasm499971pjt.11.2023.11.02.20.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 20:17:29 -0700 (PDT)
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
Subject: [PATCH v7 05/13] hw/riscv/virt-acpi-build.c: Add AIA support in RINTC
Date: Fri,  3 Nov 2023 08:46:41 +0530
Message-Id: <20231103031649.2769834-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
References: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102e.google.com
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
X-TUID: Xrpxg6iD6OZ3

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

