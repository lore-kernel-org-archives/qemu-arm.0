Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp742202ejc;
        Thu, 24 Aug 2023 07:31:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5MSnerVs/HrvyW/8X9ir2HSQK1/Qwrs7zRc5UykAMY4fA0ZmdIsa1EMZVq2YafKdwpZMb
X-Received: by 2002:a05:620a:430f:b0:76c:e346:ca65 with SMTP id u15-20020a05620a430f00b0076ce346ca65mr18359385qko.41.1692887516386;
        Thu, 24 Aug 2023 07:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692887516; cv=none;
        d=google.com; s=arc-20160816;
        b=s22RhUzzv3VljJPUM52CdO88CYai2D74Mi/fYxEob/r7kZF3gRyfoYqe+pNkAi3D5T
         sSgN8q6nyVrNHmOS4XCr4T4YLCHWlWDG8gKoE5eVuK4omTl90dGF8rvPnIWo3Seq4qsr
         VGaqVgb69z7JjVpgBty20Yzd0G2AF2r6Uuv3XbZ3un228KpKJhpDGcrO3oMr+ACME6Ec
         DTi/X9zXrPtn8M06aQsmC37aP4IlpMOa/zEi7N6eeKBKE4/Jkf0NLOeCOQUFp0wwb5wH
         bMNRxrKoeNlhn/y8Yco9ecW6NkvtNDiJLpk+ZToPKi+Z01aNh9rut2BgVSmxJ5sxd6NI
         0RXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Y0KZRC+bw+53iUGfc+8SQsc2BP7bSScpEVOJg2mRMtU=;
        fh=FstQSHJ5xalY0qvCfwQnzF4rG/Wi+NaC2f1qQ65wDU0=;
        b=jY07bTBGY5TYaawmyKSlxiMg70vfqsOdO0+s0TIpr0+eSOQpNLGaoPrCWnUxI/lANx
         1ELkO9Pw+AEhvpFgeYk8RxDeCJ8okWcw9TQqQ9ST7TWIPnLF/kf99DekIjhZkB0m4GBx
         dyTZ0seHICPvxQDR7fNkWme1MDIxgkNkFL1f4Hsi/kZxR3+I40hmZoi9K7M17pAUeQM6
         K/tcAycPZFsyasc7AfqW3U9grkaNdbYbWwRwr7vqdNnaIe4Jflu9NNA1SCHYNFESMaw2
         NcLgQ8npX++8YzeUNAhxJHACh4y12rV9RxrSbs2ZMvAfTIfM38rzwv8svsoSjnr5r24t
         dilw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="Zx3/LxWZ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18-20020a05620a0a9200b00767c4ff980asi3378977qkg.417.2023.08.24.07.31.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Aug 2023 07:31:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="Zx3/LxWZ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qZBNH-0001ix-51; Thu, 24 Aug 2023 10:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBMz-0000qL-93
 for qemu-devel@nongnu.org; Thu, 24 Aug 2023 10:31:33 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBMw-0000t5-QM
 for qemu-devel@nongnu.org; Thu, 24 Aug 2023 10:31:32 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bf5c314a57so32237225ad.1
 for <qemu-devel@nongnu.org>; Thu, 24 Aug 2023 07:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692887488; x=1693492288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y0KZRC+bw+53iUGfc+8SQsc2BP7bSScpEVOJg2mRMtU=;
 b=Zx3/LxWZkq7ahDZdJg1dtBEknn2vwDtLN796yb8x/8LS2A7wkbm5y7VJgZC1J3+h+o
 I7KGFyizeLHvtP82NjQ+wnQqJwMKm61n0stuMqIdRJeeJwJfC7g0uGF1vyU4BRTWX4nP
 vnU1lMd3ITAEi4OwiVuz1hqkdBmRj7zL9YKQMu7pbA4EvO4bepUC92/TDUmxs9uhRkWu
 /91LlXMTZoZHqhhswJHcQEBm1QhoAtQBjPRwhfsaGZgFh/4JOQ04QCZnsgNjFNu0oO5B
 Rp/8xVLoYAATy9SHeV7mBjAN+FVvlyvxUPx0DqVP1/qQPMcjtq6ix/UKPXarxnFRj8jZ
 2COA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692887488; x=1693492288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y0KZRC+bw+53iUGfc+8SQsc2BP7bSScpEVOJg2mRMtU=;
 b=CUd/QVe5QKXF/ncf4JNoy7UoRmim/hH+La+Dwrxzq6QtP/afXFWGvu3gnHmh+EI3ld
 ukTHKnem/yBoC7NlVrwLD4K2tf/iCuWKWdpQIIp8jXm7sg5HlinmMVFoB6KNn94wJnlP
 RqqpFG5Y6zVmjEEY4bDP0VjYk+kZ0g4DGXyD/4vjI/z0Av6Sgrty68bCc7rPaVat8tyZ
 lmPnLp/hi0UsEJThegauBgS+w08IiMwMEyVtmWsLETfYvR9pyWpntfFZPrfqu3/XR9ee
 1plKXf3fSHS2O7lmHfuxfUbDqKDx9jiN/q6ubuAoAlk8GVC59C/1HBDZtYs74tmfNWBE
 HX3g==
X-Gm-Message-State: AOJu0Yy3TcT5plVGnMubxXt0aRdGqyu+qJ1BS0StQc5Drd6mJ/5QYvjG
 hWrj4bRcUbaVnFaOmg/g5aizQg==
X-Received: by 2002:a17:90b:19c1:b0:26c:f9a5:4391 with SMTP id
 nm1-20020a17090b19c100b0026cf9a54391mr12436598pjb.26.1692887487884; 
 Thu, 24 Aug 2023 07:31:27 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.191.205])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a17090a2bc600b00262fc3d911esm1666864pje.28.2023.08.24.07.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 07:31:25 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v2 08/12] hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
Date: Thu, 24 Aug 2023 19:59:38 +0530
Message-Id: <20230824142942.3983650-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
References: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: d01XdSBCugjE

MMU type information is available via MMU node in RHCT. Add this node in
RHCT.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 72c2a3e45f..40bd43efd0 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -159,6 +159,8 @@ static void build_rhct(GArray *table_data,
     size_t len, aligned_len;
     uint32_t isa_offset, num_rhct_nodes, cmo_offset = 0;
     RISCVCPU *cpu = &s->soc[0].harts[0];
+    uint32_t mmu_offset = 0;
+    uint8_t satp_mode_max;
     char *isa;
 
     AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = s->oem_id,
@@ -178,6 +180,10 @@ static void build_rhct(GArray *table_data,
         num_rhct_nodes++;
     }
 
+    if (cpu->cfg.satp_mode.supported != 0) {
+        num_rhct_nodes++;
+    }
+
     /* Number of RHCT nodes*/
     build_append_int_noprefix(table_data, num_rhct_nodes, 4);
 
@@ -203,6 +209,26 @@ static void build_rhct(GArray *table_data,
         build_append_int_noprefix(table_data, 0x0, 1);   /* Optional Padding */
     }
 
+    /* MMU node structure */
+    if (cpu->cfg.satp_mode.supported != 0) {
+        satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
+        mmu_offset = table_data->len - table.table_offset;
+        build_append_int_noprefix(table_data, 1, 2);    /* Type */
+        build_append_int_noprefix(table_data, 8, 2);    /* Total Length */
+        build_append_int_noprefix(table_data, 0x1, 2);  /* Revision */
+        build_append_int_noprefix(table_data, 0, 1);    /* Reserved */
+        /* Virtual Address Scheme */
+        if (satp_mode_max == VM_1_10_SV57) {
+            build_append_int_noprefix(table_data, 2, 1);    /* Sv57 */
+        } else if (satp_mode_max == VM_1_10_SV48) {
+            build_append_int_noprefix(table_data, 1, 1);    /* Sv48 */
+        } else if (satp_mode_max == VM_1_10_SV39) {
+            build_append_int_noprefix(table_data, 0, 1);    /* Sv39 */
+        } else {
+            assert(1);
+        }
+    }
+
     /* CMO node */
     if (cpu->cfg.ext_icbom || cpu->cfg.ext_icboz) {
         cmo_offset = table_data->len - table.table_offset;
@@ -245,6 +271,11 @@ static void build_rhct(GArray *table_data,
             num_offsets++;
         }
 
+        if (mmu_offset) {
+            len += 4;
+            num_offsets++;
+        }
+
         build_append_int_noprefix(table_data, len, 2);
         build_append_int_noprefix(table_data, 0x1, 2); /* Revision */
         /* Number of offsets */
@@ -253,9 +284,14 @@ static void build_rhct(GArray *table_data,
 
         /* Offsets */
         build_append_int_noprefix(table_data, isa_offset, 4);
+
         if (cmo_offset) {
             build_append_int_noprefix(table_data, cmo_offset, 4);
         }
+
+        if (mmu_offset) {
+            build_append_int_noprefix(table_data, mmu_offset, 4);
+        }
     }
 
     acpi_table_end(linker, &table);
-- 
2.39.2

