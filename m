Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp813127eja;
        Thu, 2 Nov 2023 20:18:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr17EZLGBIvGz6Ojud4DjWRHSB2Ejh+OPF/t3MiE9A5XeGQag0xAC4JBcc4+xT4P/qnJDG
X-Received: by 2002:ac8:5ad5:0:b0:41e:31b5:5c8d with SMTP id d21-20020ac85ad5000000b0041e31b55c8dmr28247049qtd.56.1698981533883;
        Thu, 02 Nov 2023 20:18:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698981533; cv=none;
        d=google.com; s=arc-20160816;
        b=cno1mAZtllOm0rIJKsEjtnLxthiCmVZcpZ4b5O5pCATAejqs+YBYW99jwtzS5QnA8A
         UfHppEG8mTZIZniaLPAr3i8tRBk8kzZF8ZkN8tQnHJwLQ3Ojkqhm01pPg3QqOqk4yID2
         sOFad/nJO8b8v4GiFP7EFpsZHQL2Bcxx/kISe8O9u7gDgBdAscuo9PqzYQayr3dQ0eqA
         a2A8l7bFBKSDjsFKQ7mypNMp8T/8UFFGBdarJUASQ5uFxCPFotVpufXbrpnAPTM0J0vv
         KXzn0Pnl0Un7hP1H9wTKIWWlTIoUjgIJzp+64dH6Tz6He0Jx9DNB5pYyrtjtmNK34pmg
         Cl2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ozwEIx8DJpOuIHNR2h+O+1SfwqWBoYWeAIIvl7CgSBg=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=TfulVIPVc4hr46RBHIoTWyk+wcJjY2ZjULEVoYdSHO/bHfUMDnj9GEnfqPmHESQhWp
         +O3Fq7Dq2PIPFHzg8oGiwRXrwp6qO2QZ71qPv624P7rEIo8om9khKOwo6EFI+3T1LYFN
         tFcfHwbrNAYnytXLXzjQrURB+D0gXNx0N4Sdonrt4lcwuKHIQIFrdmctI9+s0qC1ZfyZ
         myCocThF/H+DkxGz6fDChCr07BS6qZjDUyKzaUjM7E50eLepNBilij2EHhS/uMHK2rFQ
         +xuGUA1DM8TFyRWcOxaVd5hjDyiU2UAU2W36yNR5C591sQKqSSedlG4gU9zmspRE1Lbp
         /pgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=iP0fRV4Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14-20020a05622a048e00b00417c0806678si740609qtx.725.2023.11.02.20.18.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 20:18:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=iP0fRV4Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qykh1-00082T-6V; Thu, 02 Nov 2023 23:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykh0-00081s-7k
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 23:17:54 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykgx-00042D-I1
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 23:17:53 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-5b999980689so1266854a12.1
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 20:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698981469; x=1699586269; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozwEIx8DJpOuIHNR2h+O+1SfwqWBoYWeAIIvl7CgSBg=;
 b=iP0fRV4QzCaBrddUlFNUMpB9702SbbMCk0pra7n5GG8C29o0DYH1zr/J0qOKqtN2GM
 mDel/AbuPVftlFkUSvlhiu9Kaes+ABcGBZmALH6xXgQXpKt2koCDVWLa719AvGuIUQJm
 9VQXfkS3v8eDwBEMZ0wslO+gWpBy6RfFiZAwtsW/1LwqX9/lcWAGep3khRcGHJwPX/hJ
 rXOJRSHkwj6GkzV7dzxYqKSjcYNTcSl/Ti3hK+6iVW+z0pVTVWi5vj18xE/zm25K8Gqu
 44Obbc8CDf9UoX0fMi6fp6ZeWs8HGQ9BkoWLhOM3SZ/YG96POW9vkTb7EKSR7tXFL0h6
 k2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698981469; x=1699586269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ozwEIx8DJpOuIHNR2h+O+1SfwqWBoYWeAIIvl7CgSBg=;
 b=ffAjCD2beJBDkvC5K4hi3h25OsL2Omv3xKHTX8YF+c2D3avOr1oYEIQArKABNzDkq+
 P6gECY27/JWJEnXL5vKMFmJjlpix8WXzDfhO7m6JOS0cMgB754My8QFwpusn59YFlm0x
 CMQ3h3oN6MdM649FGFJ3Rt5XZvjiLQcLv7YINAr+zIesx6O8HBwcqVUVWNdW7H6Gvsjo
 rPhMLJb9auURbwgn7n+xFsT0KotRSYG4MEseQ0UO2Dq6hns5lhU7Mfl5T8YKgENSO6yw
 t/y0eBwjICut2TaL5560egb9uwIqd+JAOAjsTsTagT5qaXB8K2kKAxqfnOORWJ26GcKX
 ntFQ==
X-Gm-Message-State: AOJu0YwT91UrrVhM9QkncXIWwGZFXUge00f+23rOl2pFdM1TxvSw7fKB
 j9DbWVwNYt0NlPwGKewrQ/OT5KIUu0U5WNNRILvzxw==
X-Received: by 2002:a05:6a20:840d:b0:180:7df:76ab with SMTP id
 c13-20020a056a20840d00b0018007df76abmr15536747pzd.44.1698981468815; 
 Thu, 02 Nov 2023 20:17:48 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a17090aca9100b0027cf4c554dasm499971pjt.11.2023.11.02.20.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 20:17:48 -0700 (PDT)
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
Subject: [PATCH v7 08/13] hw/riscv/virt-acpi-build.c: Add CMO information in
 RHCT
Date: Fri,  3 Nov 2023 08:46:44 +0530
Message-Id: <20231103031649.2769834-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
References: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x532.google.com
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
X-TUID: P8f7HtN2d3Pd

When CMO related extensions like Zicboz, Zicbom and Zicbop are enabled, the
block size for those extensions need to be communicated via CMO node in
RHCT. Add CMO node in RHCT if any of those CMO extensions are detected.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/riscv/virt-acpi-build.c | 64 +++++++++++++++++++++++++++++++++-----
 1 file changed, 56 insertions(+), 8 deletions(-)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index ec49c8804b..506d487ede 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -140,6 +140,7 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
  * 5.2.36 RISC-V Hart Capabilities Table (RHCT)
  * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/16
  *      https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view
+ *      https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsaf/view
  */
 static void build_rhct(GArray *table_data,
                        BIOSLinker *linker,
@@ -149,8 +150,8 @@ static void build_rhct(GArray *table_data,
     MachineState *ms = MACHINE(s);
     const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
     size_t len, aligned_len;
-    uint32_t isa_offset, num_rhct_nodes;
-    RISCVCPU *cpu;
+    uint32_t isa_offset, num_rhct_nodes, cmo_offset = 0;
+    RISCVCPU *cpu = &s->soc[0].harts[0];
     char *isa;
 
     AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = s->oem_id,
@@ -166,6 +167,9 @@ static void build_rhct(GArray *table_data,
 
     /* ISA + N hart info */
     num_rhct_nodes = 1 + ms->smp.cpus;
+    if (cpu->cfg.ext_zicbom || cpu->cfg.ext_zicboz) {
+        num_rhct_nodes++;
+    }
 
     /* Number of RHCT nodes*/
     build_append_int_noprefix(table_data, num_rhct_nodes, 4);
@@ -177,7 +181,6 @@ static void build_rhct(GArray *table_data,
     isa_offset = table_data->len - table.table_offset;
     build_append_int_noprefix(table_data, 0, 2);   /* Type 0 */
 
-    cpu = &s->soc[0].harts[0];
     isa = riscv_isa_string(cpu);
     len = 8 + strlen(isa) + 1;
     aligned_len = (len % 2) ? (len + 1) : len;
@@ -193,14 +196,59 @@ static void build_rhct(GArray *table_data,
         build_append_int_noprefix(table_data, 0x0, 1);   /* Optional Padding */
     }
 
+    /* CMO node */
+    if (cpu->cfg.ext_zicbom || cpu->cfg.ext_zicboz) {
+        cmo_offset = table_data->len - table.table_offset;
+        build_append_int_noprefix(table_data, 1, 2);    /* Type */
+        build_append_int_noprefix(table_data, 10, 2);   /* Length */
+        build_append_int_noprefix(table_data, 0x1, 2);  /* Revision */
+        build_append_int_noprefix(table_data, 0, 1);    /* Reserved */
+
+        /* CBOM block size */
+        if (cpu->cfg.cbom_blocksize) {
+            build_append_int_noprefix(table_data,
+                                      __builtin_ctz(cpu->cfg.cbom_blocksize),
+                                      1);
+        } else {
+            build_append_int_noprefix(table_data, 0, 1);
+        }
+
+        /* CBOP block size */
+        build_append_int_noprefix(table_data, 0, 1);
+
+        /* CBOZ block size */
+        if (cpu->cfg.cboz_blocksize) {
+            build_append_int_noprefix(table_data,
+                                      __builtin_ctz(cpu->cfg.cboz_blocksize),
+                                      1);
+        } else {
+            build_append_int_noprefix(table_data, 0, 1);
+        }
+    }
+
     /* Hart Info Node */
     for (int i = 0; i < arch_ids->len; i++) {
+        len = 16;
+        int num_offsets = 1;
         build_append_int_noprefix(table_data, 0xFFFF, 2);  /* Type */
-        build_append_int_noprefix(table_data, 16, 2);      /* Length */
-        build_append_int_noprefix(table_data, 0x1, 2);     /* Revision */
-        build_append_int_noprefix(table_data, 1, 2);    /* Number of offsets */
-        build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
-        build_append_int_noprefix(table_data, isa_offset, 4); /* Offsets[0] */
+
+        /* Length */
+        if (cmo_offset) {
+            len += 4;
+            num_offsets++;
+        }
+
+        build_append_int_noprefix(table_data, len, 2);
+        build_append_int_noprefix(table_data, 0x1, 2); /* Revision */
+        /* Number of offsets */
+        build_append_int_noprefix(table_data, num_offsets, 2);
+        build_append_int_noprefix(table_data, i, 4);   /* ACPI Processor UID */
+
+        /* Offsets */
+        build_append_int_noprefix(table_data, isa_offset, 4);
+        if (cmo_offset) {
+            build_append_int_noprefix(table_data, cmo_offset, 4);
+        }
     }
 
     acpi_table_end(linker, &table);
-- 
2.39.2

