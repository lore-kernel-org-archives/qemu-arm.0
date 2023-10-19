Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp514878ejb;
        Thu, 19 Oct 2023 06:29:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSEu4+lOzzcZGe/h/hx6G246z8DsFkS6J9pmqGkpBdz9K1IrEeNDW3lbHdtZtFM/vydMKP
X-Received: by 2002:ac8:5bd0:0:b0:403:b12b:908d with SMTP id b16-20020ac85bd0000000b00403b12b908dmr2212391qtb.8.1697722185741;
        Thu, 19 Oct 2023 06:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697722185; cv=none;
        d=google.com; s=arc-20160816;
        b=WoOLK4AwNPYQbPS8MMt5B4VjXxrkeARSMS00rEXOJgD8N6AVawNfkWmPnXnLs8x2Wd
         pAl4vNGN/dEtEiA0rYhyF2reIIAKSovD5hDNhu2/BTKofYLFGXKGzf9f0SwiINi3KHcS
         avGKPv5ga2rAQyrMAIs5UWuXxmrdZFY0cDJ3tXuxw/L4PR9bY2AOPIWCH8h4NJnEUDEl
         qhr5SSTmhkUjzQ2bIyb8XgND3YdPKrlK4TkUipIp79fd1eLb3chv9kj57kw/bJZBiRRz
         PVwaU+S2CZch+fyCt7TaObWNULY9tWECgvWQ+rj0BxYaV3jW4w18VmgrIrtwDlG/7Nvn
         fh3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AVYCmUTkT/Dlf49V49vz1Mc0V8x1yCEAC/GsjHHVlw0=;
        fh=qS7HOACB/fnzOG4UkP/DQwrsj+RVK26yEZmW8KA6D/k=;
        b=u+Nw9Y9sDpXbfRdXoSfYZ54mT9+186s9jgYmG+y8IEX8se9XOb7RlRasbDiyCu4sFs
         WW9lxP7WpPLIccDyIeb2QU95IGkQDhd+79D6/A8YdBQ6L7P4yzKShffbECNYxdnG0TNV
         wpKNI5iGI2SiPy6HYlDzhcW27VLNRjiK9kbMLjOVIZzF0KYX+qEzRL+qZdFxY1Dkg/+P
         sBpegK7ZEQcqnspAb+KGY29fJJYnXUSk/2sUKu+J15rEbUbarpwIqWDDsZBPrgCRO1vm
         THMQqpp6abFjfoKgC1IFWW2PWbIyKYjQS3/FO+E4uovdp9Bccac06D0zdWQZ2H6BEUFV
         I8Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=c9Ld7ORU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11-20020ac85d8b000000b004069466b1c0si1536004qtx.562.2023.10.19.06.29.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:29:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=c9Ld7ORU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtT4Y-0004MW-41; Thu, 19 Oct 2023 09:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qtT4X-0004Lt-I8
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:28:21 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qtT4V-00072h-J7
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:28:21 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6ce2aac0644so366425a34.0
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697722098; x=1698326898; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AVYCmUTkT/Dlf49V49vz1Mc0V8x1yCEAC/GsjHHVlw0=;
 b=c9Ld7ORUYqQtPnFpDqoi58GS3x3weiKWrRPNL1jOe+WNjemeUuPKYnb5zFqQOE1QGd
 1SeN663jGBbF5DSQZaJQhDO8AqgmR7LBW+Cf9q+q+BUw0b9TT6ioM7Wals7yBAdoMkaO
 KzJSnUhTuzlYRNEBP1LS2UgIRaqw+c0k6q99LUaIcbo4IKsWoNYANR/rzPAwxy5nRsM8
 X3MGDb/BvNuPXNGAdLtH59tEMcjuj/5Yg5WJBjsqWRvmYxoUWo5n3fBu388o8CbJ5Kyv
 T8AFYaWjvG4QVK0VqsP1nAbMwlew1vGHtuREC5Jlp+qn8LzO1m6WkanHN3IB+Jrhk/Y/
 Wv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697722098; x=1698326898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AVYCmUTkT/Dlf49V49vz1Mc0V8x1yCEAC/GsjHHVlw0=;
 b=GcwAJjbnxynMGZ3Jo7vd3xT7L3gu+N6av4T0v5v7rhi2lRCI+a512NyKQFM+rhv56I
 NDjW7nZyrD1wXmb2txY0/72U9qHeZikYCx8dTg1/VUCDMzZLNlLqYXFaDmSBptdTt9aD
 xhfpIIp4V+pzWGIeHeS17v7vbWqkPcc7Iroj4hHf4pRxKfH+UeEm6OgqgtTNGta5rMfD
 AVqXWRl+qNK3Y4by6Gr9+G/Cm4ij8M2yQk9q/edyT1WeCgPDmxoqgBWhWlNpm0ch+zcT
 XEk/8SM/ry/iMwam5GRfN7EWNB2Fxl3j5HEidluDjQmMOKqt5Wd8MmOzzUspEkqG4Mjc
 y2dw==
X-Gm-Message-State: AOJu0YyC9Ha2C2+Px0nXJle1AbpImi9zlHrvRFjbFZucQbt0GN0BOCui
 HMwzshzegOpVIxRIZ52sTglelw==
X-Received: by 2002:a05:6830:114b:b0:6bc:63c9:7946 with SMTP id
 x11-20020a056830114b00b006bc63c97946mr2212311otq.14.1697722098467; 
 Thu, 19 Oct 2023 06:28:18 -0700 (PDT)
Received: from sunil-laptop.dc1.ventanamicro.com
 ([2409:4071:6e8b:3a98:dd76:4e82:7da6:44ab])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a056a00228b00b0068feb378b89sm5273113pfe.171.2023.10.19.06.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 06:28:18 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
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
Subject: [PATCH v3 08/12] hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
Date: Thu, 19 Oct 2023 18:56:44 +0530
Message-Id: <20231019132648.23703-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231019132648.23703-1-sunilvl@ventanamicro.com>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-ot1-x334.google.com
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
X-TUID: 8tSOGsmV13p0

MMU type information is available via MMU node in RHCT. Add this node in
RHCT.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index bf47eef792..4895c9669d 100644
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
+        build_append_int_noprefix(table_data, 2, 2);    /* Type */
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
     if (cpu->cfg.ext_zicbom || cpu->cfg.ext_zicboz) {
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
2.34.1

