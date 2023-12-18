Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp853384eji;
        Mon, 18 Dec 2023 07:04:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAAL/y4+P+KXEuLzua1elh58E1bPbl17LTMpXayi3qQfGupmekIoqYjuP75N2FNnObZEii
X-Received: by 2002:a05:6358:42aa:b0:172:cbd1:43bf with SMTP id s42-20020a05635842aa00b00172cbd143bfmr2587626rwc.51.1702911891531;
        Mon, 18 Dec 2023 07:04:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702911891; cv=none;
        d=google.com; s=arc-20160816;
        b=jjrng1vwTSXSt3O48g35N8ii9E1ue6wu/gupAPc1yILn41BetTe7uPqrJs6ymNpjG7
         nD7nAL8SMRIatjOMzv7AT9+KdwBOTkQBtlS2L+80wVeXXemPjdJ1cKedZkuho+POiu+Y
         xGLqbKYb7fgFwG0ovDcY8mYJh2g+1yltwCT85wjAtuQ6/vcjzBA6hGhUIKoJVLYf8nok
         vhMCRTEJ4ma9Ws64m1cZsMXNVLe9XJ2TSQ7/BVzgxe614DcfQ+et+tlaQ9T43GDiJgGS
         6UQNnMz2qcKYhHGrDQQR/2SwSdqrQVdCHu0u+wV2AM39ggJZwBwdkvW3LRCajAa8gGTk
         RIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ozwEIx8DJpOuIHNR2h+O+1SfwqWBoYWeAIIvl7CgSBg=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=NCVhU+gktqHiUhyDWHPqPhl85MeSQLE2TX6GtUn4C511AaqRn5SzTKpi+93Zj+XS+o
         s7Mq+vjwL2u9sOOx06RdF8+BhOnGt5AJLVCfmbymcnkOo+lzFFuCG1m9qIkCiUbaGaOB
         A/IHJKX/VoCQwapqMyLE/W8tW5UArrJUq/xFkitAuPy31QAw6ShX5paSol3849XrKJWM
         XM8Ze4rSeN4MzeeiUK5l0n9F5fF1q1ygMKZhsjWUtzPSGWadPkCWlpIUK9tFgfmFr6G7
         Lh3+XJasaE9mNreHU1g1xK1WszH3OsxcxlqNxDVoIkxrneELrkZNsl7XMLQOqNSKH6ei
         dXyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=ev5NVcLC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3-20020a1f6203000000b004b4d2d14de5si385977vkb.292.2023.12.18.07.04.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 07:04:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=ev5NVcLC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rFFA1-0003Hu-ED; Mon, 18 Dec 2023 10:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9u-0002PY-DP
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 10:03:54 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9r-0007GU-6o
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 10:03:54 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6d7750e2265so479820b3a.3
 for <qemu-devel@nongnu.org>; Mon, 18 Dec 2023 07:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702911829; x=1703516629; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozwEIx8DJpOuIHNR2h+O+1SfwqWBoYWeAIIvl7CgSBg=;
 b=ev5NVcLCJ6eGdYIKdEBwInza6MLFs7WtRvhmLQDkvRoPKZh7hjQj/QgUCPD70R1Zlj
 FkzsHywMDsWFEBh4gPQxURsVFWZK76SONW4pNFOTA6s3P6c0IXp4pMsPD3YoF/dZCIOU
 TyzMXcrep/x6bSpLd36Oj6y9AQXfxportsZxL97WiaPnOGWTK49FvRyHl8/ce8H+O70M
 6LeJCNNaf7/1QPSZQEBBFI6eEQ/QrTAUmf+OCkN5tG1rfb5lurRfHkR8sSZb0UDHu6E6
 DILsR48zfiZeY15lf87QsIFU6c05UpBSVLZqmiTovBYnkEdgBWFXqsfTifREAajIUh1K
 uMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702911829; x=1703516629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ozwEIx8DJpOuIHNR2h+O+1SfwqWBoYWeAIIvl7CgSBg=;
 b=sgCsBCctgZO8/4eNfHsMZ3CrfnhAkKG9vkDcXxDzQ+jbYdG0y/bRd6+0Q+oZEU2MD4
 M+7pgEM9+ps7+hxqg4UZYpKaQOYxUtS8iNcRqH2MU8MbeaIlmUoPudBnJVIrAkIEl/Yq
 s63h/mtm5kAEtFCkBawBq6A7dA9eyw2WHIho3cVZsGuP/OlUGORN+MDoyCLFv3DqtyA2
 IOnM7S48n1D930AWxxKPcIh0HZXiI8KEhJERjRlimdXOzajB/M5YWWjDFe3rIS/x30Ng
 kxzqsOw/de1WsT4M1kwuccYD1fvRnrs3e+V/LwM0uocPsmMhjFvddzkBE9x1ksfiS3qs
 8z1A==
X-Gm-Message-State: AOJu0YzNKfipVfZGW6rmNfyIrbsNOXZ5koXR5CRHNPAnRj95JVEbtzE3
 b7a8qQeAotVNHb/pk2z9lMTw1Q==
X-Received: by 2002:a05:6a20:258d:b0:190:d1d2:56ff with SMTP id
 k13-20020a056a20258d00b00190d1d256ffmr8166647pzd.88.1702911828825; 
 Mon, 18 Dec 2023 07:03:48 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a056a000a0100b006c06779e593sm18975505pfh.16.2023.12.18.07.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:03:48 -0800 (PST)
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
Subject: [PATCH v8 08/13] hw/riscv/virt-acpi-build.c: Add CMO information in
 RHCT
Date: Mon, 18 Dec 2023 20:32:42 +0530
Message-Id: <20231218150247.466427-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218150247.466427-1-sunilvl@ventanamicro.com>
References: <20231218150247.466427-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: w3lrmH41b6uE

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

