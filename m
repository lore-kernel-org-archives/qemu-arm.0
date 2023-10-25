Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2998836ejb;
        Wed, 25 Oct 2023 13:08:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGZtQExcUG07gaOYGfVxgqZzSvEf5xZUdeOoYGK3dMAiFdWIOtwxUf1RGrmsJyThjCkGpr
X-Received: by 2002:a05:6214:27cb:b0:66d:253a:3cb0 with SMTP id ge11-20020a05621427cb00b0066d253a3cb0mr18527202qvb.36.1698264506388;
        Wed, 25 Oct 2023 13:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698264506; cv=none;
        d=google.com; s=arc-20160816;
        b=f00p2qfGTg4nXzcceZa9/F3yUCUg4LoYUNXUzdHVka/tQ4QpUV1BQqug5CElLIDvLg
         hMmxExGTf0zGgIl7vjv8lpT3D2qv5plun0jxgqnBOJ3Trhkwkjzvb1pgkhHHWW87I2BK
         4ZJziUiHuFgma5NI0SkfDUuw0L/bgV1RikhyU5IaLgv7az51wVDbSKcHi1OzLmV1aO6H
         McJ/fh0JLEqdoySsaNC8vJp8XYEECr1yahJMUfScjd+B2egM8Xfj+cD9j0ZteS8X1V+1
         Uw0kJ7h5zh7gQ1RfwZRPTN9brRbKXr0f9t6os3YZJwx9ht6x2Dkz18NG5aDiUAOKq4HM
         piPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TfFeqiwy/lnMV+wtArC/MMG4vgmZOnTJ6KJSLyrtCZ4=;
        fh=ieNWTeoXViVzjD3GbjL7nI2u2Tkk33Uc9BsQY+9ivz0=;
        b=0qGwvm4BuMgroeboaQR3nGhBZkJ2z0C3XTg8JjrjVsWzwnYtmETkKmv37tQmqWRE7E
         Tn1hj+p1jaohm2Ufl0zZAP4DnMKAd1sfl1kGZWu+UHSTSz5MiumUwTzUlA+b0qnoYZSC
         SrK6QarA+hnGyMC5TsjI3yzejwy02qPeXy3Nfzv49xY4JDSxsHFvhnRyLvOHZw+LbhT3
         vh/ZU8j5P8IuLyu4K6FzSJSimw3vWA1jBXR9DFZI7hIL3rhRqaLheyBd0n+Vy9N4lRG7
         /IMSIA39y8kiW0LD9zl1onR0tAVeafcmmNBNCN4kZYB62yVT7wLvcnsPhELPOc09udIU
         oucw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=mQtXv0ER;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7-20020ad457a7000000b00651658c204dsi8516048qvx.280.2023.10.25.13.08.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 13:08:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=mQtXv0ER;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvkAc-0007R7-Pk; Wed, 25 Oct 2023 16:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAY-0007Nv-Jn
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 16:07:59 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAW-0003TS-02
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 16:07:58 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6b6f4c118b7so135566b3a.0
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 13:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698264474; x=1698869274; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TfFeqiwy/lnMV+wtArC/MMG4vgmZOnTJ6KJSLyrtCZ4=;
 b=mQtXv0ER6ER3+s2kg1qheh+RSRvF/6zPTGiapG/mjuwr+5jxMcDqLIT0kXjgAtQvb+
 z0KHFD7wn6BI6/GZFYGKsmS5mZXeu0JPvblw9Qvqmwws5Kx2p4kniV1eq+5r6SPqcoOA
 jXT4bk98OmHEuxh9x+9CjHnJCuL7uTcdq1IJ6JofXfKlkKzvNE2nyxaq1A3oHmpnp72I
 srxTKboZ2fumQYoT4Gx1Q/Iy1u6eU28MbcDROhSL9oUi5x8mlFCkOBMRCQzCmdVni48K
 4AlfKhXG6Jd4FSuaTDmnKyAVOkMpAl2lXDymQUS0R3lmP4v/MgrdmgMLJuqdrTGftNbm
 1IwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698264474; x=1698869274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TfFeqiwy/lnMV+wtArC/MMG4vgmZOnTJ6KJSLyrtCZ4=;
 b=wbTsflYsL9ObCvKhOtoVUj2040Gy+TTWrt9CVTxhhR11YdAzG2iBj145fOqsuon9OK
 jUdhx+rmDRC0apwjhMr3Hz8J9rrtE3iM1vfah1IJLxD+ztbx044/lvjw1CIlFrFrY3rw
 DKRUDTeiRFNED3YWhkqFpoJ2uKVZcpy4w44Frr5QVCuOpqbFzL7/Nn80H2MFrChjZpyp
 K11yU+xl/2o242Fwrk2aHWpzn1DSU3Y+71M5GMm+lbpLRaGYAFg9BI21nP6FR/fbcFyk
 AOjPVpp9gUa743wwD57QTl58ewaNoRwTU5ToMaAtTbh8nTtdg7bAcFv60rscML5rS2qo
 bzaw==
X-Gm-Message-State: AOJu0Yz76O49a8jppOBVERseWJExQomcwRD6OBT6s5NQSmSzZw9UV5xp
 mIEExgVT87iGyDGyowlhIbsg+FSumtOZlSOmhG8SJA==
X-Received: by 2002:a05:6a20:7f9e:b0:140:c838:2b2e with SMTP id
 d30-20020a056a207f9e00b00140c8382b2emr8605045pzj.22.1698264473463; 
 Wed, 25 Oct 2023 13:07:53 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa79681000000b0068fe7c4148fsm9696768pfk.57.2023.10.25.13.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 13:07:53 -0700 (PDT)
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
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v4 05/13] hw/riscv/virt-acpi-build.c: Add AIA support in RINTC
Date: Thu, 26 Oct 2023 01:37:05 +0530
Message-Id: <20231025200713.580814-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025200713.580814-1-sunilvl@ventanamicro.com>
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: kmWonGukL1Ae

Update the RINTC structure in MADT with AIA related fields.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt-acpi-build.c | 66 +++++++++++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index d8772c2821..073c85f327 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -38,6 +38,7 @@
 #include "hw/intc/riscv_aclint.h"
 
 #define ACPI_BUILD_TABLE_SIZE             0x20000
+#define ACPI_BUILD_INTC_ID(socket, index) ((socket << 24) | (index))
 
 typedef struct AcpiBuildState {
     /* Copy of table in RAM (for patching) */
@@ -58,18 +59,42 @@ static void acpi_align_size(GArray *blob, unsigned align)
 }
 
 static void riscv_acpi_madt_add_rintc(uint32_t uid,
+                                      uint32_t local_cpu_id,
                                       const CPUArchIdList *arch_ids,
-                                      GArray *entry)
+                                      GArray *entry,
+                                      RISCVVirtAIAType aia_type,
+                                      uint64_t imsic_addr,
+                                      uint32_t imsic_size)
 {
     uint64_t hart_id = arch_ids->cpus[uid].arch_id;
 
     build_append_int_noprefix(entry, 0x18, 1);       /* Type     */
-    build_append_int_noprefix(entry, 20, 1);         /* Length   */
+    build_append_int_noprefix(entry, 36, 1);         /* Length   */
     build_append_int_noprefix(entry, 1, 1);          /* Version  */
     build_append_int_noprefix(entry, 0, 1);          /* Reserved */
     build_append_int_noprefix(entry, 0x1, 4);        /* Flags    */
     build_append_int_noprefix(entry, hart_id, 8);    /* Hart ID  */
     build_append_int_noprefix(entry, uid, 4);        /* ACPI Processor UID */
+    /* External Interrupt Controller ID */
+    if (aia_type == VIRT_AIA_TYPE_APLIC) {
+        build_append_int_noprefix(entry,
+                                  ACPI_BUILD_INTC_ID(
+                                      arch_ids->cpus[uid].props.node_id,
+                                      local_cpu_id),
+                                  4);
+    } else {
+        build_append_int_noprefix(entry, 0, 4);
+    }
+
+    if (aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
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
@@ -77,6 +102,11 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
     MachineClass *mc = MACHINE_GET_CLASS(s);
     MachineState *ms = MACHINE(s);
     const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
+    uint64_t imsic_socket_addr, imsic_addr;
+    uint8_t  guest_index_bits;
+    uint32_t imsic_size, local_cpu_id, socket_id;
+
+    guest_index_bits = imsic_num_bits(s->aia_guests + 1);
 
     for (int i = 0; i < arch_ids->len; i++) {
             Aml *dev;
@@ -87,8 +117,19 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
             aml_append(dev, aml_name_decl("_UID",
                        aml_int(arch_ids->cpus[i].arch_id)));
 
+            socket_id = arch_ids->cpus[i].props.node_id;
+            local_cpu_id = (arch_ids->cpus[i].arch_id -
+                            riscv_socket_first_hartid(ms, socket_id)) %
+                            riscv_socket_hart_count(ms, socket_id);
             /* build _MAT object */
-            riscv_acpi_madt_add_rintc(i, arch_ids, madt_buf);
+            imsic_socket_addr = s->memmap[VIRT_IMSIC_S].base +
+                                (socket_id * VIRT_IMSIC_GROUP_MAX_SIZE);
+            imsic_addr = imsic_socket_addr +
+                         local_cpu_id * IMSIC_HART_SIZE(guest_index_bits);
+            imsic_size = IMSIC_HART_SIZE(guest_index_bits);
+
+            riscv_acpi_madt_add_rintc(i, local_cpu_id, arch_ids, madt_buf,
+                                      s->aia_type, imsic_addr, imsic_size);
             aml_append(dev, aml_name_decl("_MAT",
                                           aml_buffer(madt_buf->len,
                                           (uint8_t *)madt_buf->data)));
@@ -227,6 +268,7 @@ static void build_dsdt(GArray *table_data,
  * 5.2.12 Multiple APIC Description Table (MADT)
  * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/15
  *      https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
+ *      https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view
  */
 static void build_madt(GArray *table_data,
                        BIOSLinker *linker,
@@ -235,6 +277,12 @@ static void build_madt(GArray *table_data,
     MachineClass *mc = MACHINE_GET_CLASS(s);
     MachineState *ms = MACHINE(s);
     const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
+    uint64_t imsic_socket_addr, imsic_addr;
+    uint8_t  guest_index_bits;
+    uint32_t imsic_size;
+    uint32_t local_cpu_id, socket_id;
+
+    guest_index_bits = imsic_num_bits(s->aia_guests + 1);
 
     AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
                         .oem_table_id = s->oem_table_id };
@@ -246,7 +294,17 @@ static void build_madt(GArray *table_data,
 
     /* RISC-V Local INTC structures per HART */
     for (int i = 0; i < arch_ids->len; i++) {
-        riscv_acpi_madt_add_rintc(i, arch_ids, table_data);
+        socket_id = arch_ids->cpus[i].props.node_id;
+        local_cpu_id = (arch_ids->cpus[i].arch_id -
+                       riscv_socket_first_hartid(ms, socket_id)) %
+                       riscv_socket_hart_count(ms, socket_id);
+        imsic_socket_addr = s->memmap[VIRT_IMSIC_S].base +
+                            (socket_id * VIRT_IMSIC_GROUP_MAX_SIZE);
+        imsic_addr = imsic_socket_addr +
+                     local_cpu_id * IMSIC_HART_SIZE(guest_index_bits);
+        imsic_size = IMSIC_HART_SIZE(guest_index_bits);
+        riscv_acpi_madt_add_rintc(i, local_cpu_id, arch_ids, table_data,
+                                  s->aia_type, imsic_addr, imsic_size);
     }
 
     acpi_table_end(linker, &table);
-- 
2.39.2

