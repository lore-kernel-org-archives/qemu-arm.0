Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1864949ejc;
        Mon, 30 Oct 2023 06:23:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMj5SwgPvD6bWAMe3j7iAjRi4A41jv5mQZ/pCkfMiKQTnzvY171OqjZB8gqAOI33pNnyzj
X-Received: by 2002:ad4:5f4e:0:b0:66d:6705:5c50 with SMTP id p14-20020ad45f4e000000b0066d67055c50mr12460860qvg.44.1698672235234;
        Mon, 30 Oct 2023 06:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698672235; cv=none;
        d=google.com; s=arc-20160816;
        b=oqGALThVHxkthxn9dpwYiK85fhbmcLqT/3GoJ1e1jtWCV4T3GGLlIxTdfcx73w22At
         CuXDhY1PHNTKDBxA1QZKx+GmcwBTVmTVFWrio1Ju2f6t22MotoSGS/SjvHHFheS3oaBB
         wfrUph3wJDDkJmyvYUUnMxACzDxpEa/X/4/aJmzA0gsNLl7nuBDL9H5psRCNuH9FRKrQ
         lRyMcR9dSt5mKk2AI9pbhJsn/xhGc09lGOIKoELm5anBXI5YyiIFGft3xwpNhS6ZPNBV
         et/ozW8zUHDB2gENIlHPKIiV67iHw+JUaWqBrzOGo4ZtVEQTa75X3cE2CYYnUDSP4l80
         YpIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2vd4z02i5MUjS+md3dmfd4/u+HVQ03/wckr2cfGkWeU=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=TxsIr86ac0QgVoCMGCwLAQ0PsS+0uJTlrCnrYe5vjoz1yX3v0RfD7FLZ2p+CZKaG2R
         VhzEHap1OoiWTnJOSmO67JbPn2VpIPCfr+ef4a7iuy8NbpYWLQb1l7PqBEGrF7zNUTQ9
         KKXZ2UF9tiHKtvP5/eaGYJmIaV/JasySiRiP7kwJcLISONhGcUaoQW1s+j/lH249tad2
         w08KeIALUfQrfKUdsFysu21vbf5zbxmmUsQlj2qy6tDGFu8YAOkPzQyQIVfSvNcNNOvE
         7ktbpH5HEYxIDal2dcDZsSn37qKaHJ5STm+Bc9ysd9mqsj6CO1hYB/9f/C39zUWJ14wU
         kb2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=ghmFyvwn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10-20020ad4444a000000b0065891b94fecsi5550467qvt.426.2023.10.30.06.23.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 06:23:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=ghmFyvwn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxSDe-0007Mc-Ha; Mon, 30 Oct 2023 09:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSDX-00078O-DS
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 09:22:07 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSDP-0002uq-IF
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 09:22:05 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5b856d73a12so3475080a12.1
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 06:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698672117; x=1699276917; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2vd4z02i5MUjS+md3dmfd4/u+HVQ03/wckr2cfGkWeU=;
 b=ghmFyvwn68lkuISEhWMAsIA3EkNl7OzbKlW0m6vVc+eSEdq3BWidiDYtq4jAfhlW4l
 MqXd29ddPvcC5NAKRc9Zs56cg9ZLSL++oz00O23/F5dqJBUFuiHYWb7N9OAPoJJcZGUs
 3tapIM245t58N0FNqRzDk3cNajlDTPxRut3mrd7y7v1njiNufsSYgthTjR5/mEvvBRBW
 NU3w2QIQdUs2SgsP1ueusCjHtdV9J2WR65Gj370kRvDKp26Lh3L4tqT+1LJrNKjFFeVk
 zYlAw7/Yh9gIr8/2zkxSqQ9abtsHlMh+cDohER3Ukp017GlaH+nN61hKmufaj7MsS9PD
 NkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698672117; x=1699276917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2vd4z02i5MUjS+md3dmfd4/u+HVQ03/wckr2cfGkWeU=;
 b=YpF0mMwvDpGRh+ooud50onzzWRyfVkqoihTOVwmlDaNrmoH0pFqdYe7Iu7Gu5tqsYs
 Sf2OLOxprUZ5/s2HzvHVyKyqOrwwEoCRHTBNGFcYcVuD+MkBjRo24NNhV4b8ClE/vbQU
 bOhYYyak0iP4c1TYzxGce78fFr7vZFF/d5zrbif2NGGts9iuQZKMi4tEU3slIaKNK6H0
 J37Mxf+sy5cV0RMevl7ZxtAFbdsnpFMYXoCfpLs+xaCNno2SEuTwU+Zwf8I+QvWzjSD5
 4RLzja0NxfcFBNM2WnRMfwBTxT0iPvM1CdK+L+8FKyxwPAI3RIM98anRKm31WXxGdoeV
 N6pQ==
X-Gm-Message-State: AOJu0YxGdQZTjxtaN4VuGwV4ed65P2lxNyhqSuv5YL82BWUJzYYyRneC
 /dwXo4cltOQe6JYtvrX63rG27vRkYLcMQSxpGM0ZTg==
X-Received: by 2002:a17:90a:d101:b0:280:3f37:f8a1 with SMTP id
 l1-20020a17090ad10100b002803f37f8a1mr3705355pju.12.1698672116904; 
 Mon, 30 Oct 2023 06:21:56 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 15-20020a17090a000f00b0027ced921e80sm8122412pja.38.2023.10.30.06.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 06:21:56 -0700 (PDT)
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
Subject: [PATCH v5 08/13] hw/riscv/virt-acpi-build.c: Add CMO information in
 RHCT
Date: Mon, 30 Oct 2023 18:50:53 +0530
Message-Id: <20231030132058.763556-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030132058.763556-1-sunilvl@ventanamicro.com>
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: rxVBpFdFAhU+

When CMO related extensions like Zicboz, Zicbom and Zicbop are enabled, the
block size for those extensions need to be communicated via CMO node in
RHCT. Add CMO node in RHCT if any of those CMO extensions are detected.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
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

