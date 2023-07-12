Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp2741778eje;
        Wed, 12 Jul 2023 09:41:45 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGTa4LFSY/Zya57wcZlROowoROaMMlJnVGKe04nd0qPygqXRX7TSufMrB3spFsv/7UH92Tu
X-Received: by 2002:a0c:ac0e:0:b0:619:4232:aa87 with SMTP id l14-20020a0cac0e000000b006194232aa87mr14597994qvb.24.1689180105634;
        Wed, 12 Jul 2023 09:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689180105; cv=none;
        d=google.com; s=arc-20160816;
        b=1BcoVLZr+s3xaMKgoQaFHm21pyrBRtmHZbqob4zLXmAOtWB5HJl1E9JsFoa+/r9BjA
         biF4/f/5635ybLJ5mvzlQ1go3DTDT7DTG7r23NK6vFXo3jYaJpnLs21E5aUKuQgQcAzS
         ZLlYoRvB8W6bG+zFYgfxvOO0ZRqTag5GLnK4cod3Z0TPkA9ZyfdZLNgxwYgxwZTA7d3H
         DD0VeBbn+Mtd87HL2tPKBMwJTDlE1bCGQzUzg8gyf4sL87CGrZKvVXU2jeUm0IDu9m7g
         fd0lXUX/j97DWaX1CSFNk0hHu2F9ZjkG1gHD+eBrEGoSX262WE5Yxs9dmdrjShcw+d2w
         mxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Jso/j+63oBqdVRx3pDSKT/j8yNOcjXEUIlYkCeW99DQ=;
        fh=QsSyH/XJB0d/FRsyBb/wvDqny4l1zc3rGbeONrDGr3Y=;
        b=MLLHoZIt6+f6t5lqdSkAS9usd0aeyRoVfYSKgdYggz+syeX8/mkMZCfGBsTE99/7yo
         km8ymr0HGttkywZ+0UzF2MXfqjS0fwEBjKvLIGLYczrbbvf7pGdEzfVZhd33bfbxYFyO
         9S+3Br9Cyk1uVuCkxz5KZwldTZXdlOVE/qo3VaChhSxue8TDvKG6wyMQpQEOuxmxFE/J
         TGxdIniyeiUq9GxHDO4GjMUx2fBj11lOy2KlsKWzNFfi2HB3y4UeuvbnxBHna+ztAFbE
         YoV+QBWuEJegygCovIpDmwnngUEXCa1NmgJ9TSRU5KmTiabuylewO/Xm+Lh6akrB00dz
         peKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=WY9NzGTH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12-20020a0caa4c000000b00637420658ebsi1848005qvb.110.2023.07.12.09.41.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jul 2023 09:41:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=WY9NzGTH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJctS-0004Ra-M9; Wed, 12 Jul 2023 12:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJctJ-0004Cw-K1
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 12:40:40 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJctI-00051N-3s
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 12:40:37 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1b89600a37fso37770475ad.2
 for <qemu-arm@nongnu.org>; Wed, 12 Jul 2023 09:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689180035; x=1691772035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jso/j+63oBqdVRx3pDSKT/j8yNOcjXEUIlYkCeW99DQ=;
 b=WY9NzGTHmIQvLhoOqK7OoQNHNJxx0514Z4zB1XapcM+ydX99hN34dlvs0qOQEI786j
 UQzXQv5TbhuVwk1XibUgn2M7qxNgbL+tNpryr2AwegQ4jtBo0FVXhRWE++aF9/iHGt/6
 7kxFideVXiZAcowiG6U7+gZQRK7NHlb/+tx/LS1TU5alRus+zYVsjC7YOMCj8avhtlO4
 uySel5GM1BcK/fJoVIHSA8AQVEF3RGW3IgwuTEesZogeY8pRKrr8ou4IKTXCfzsQv7Zb
 obQ4CzKFL9I/NiVCQuOzwO8THewh2o+5CFG1NfUmqNye+YUK1SqukcvUZXbia4gQnKki
 nDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689180035; x=1691772035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jso/j+63oBqdVRx3pDSKT/j8yNOcjXEUIlYkCeW99DQ=;
 b=Or7SoogoQozo482kxQ0Yo6SeIm29CCyxMTPxKDkzGVZvEqcvDliwSETo5B/G1OX1ab
 emjEb30xgOKXsztHx6Mih7mrgIM8Gtgq6HKXKWUZ18MZ8WWngiIUghpK9ZS05X6kzDLL
 7u3QiaSndrAlkRd+PayjduNbWLR7j+D9ng9kQJqgREGmTA5wnaXWYnJ4pnSfp16cBI6j
 69aMwJvwA2RXhhi4AKkkVZ+IXBdPXOcp7WvVgcDkucevSKc+zqzAxyK3QY2rgO4UNoEw
 FkFe3dkVOU2ObWrc+pX/EMud7xXj7hFSeIWGUDH3pwGAR+P4c/8c3EZ6T3OVu08ooshW
 sKPQ==
X-Gm-Message-State: ABy/qLZ6qgA5llzNeLe82Z/yKSwo+AjTJu0MHvINRpDhqBUJDWZ2eCeF
 +AZRipMh+YMWdaFljQt/dSiUMg==
X-Received: by 2002:a17:903:25d3:b0:1b8:a328:c1e6 with SMTP id
 jc19-20020a17090325d300b001b8a328c1e6mr5373527plb.63.1689180034742; 
 Wed, 12 Jul 2023 09:40:34 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.25])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a1709027d9200b001ac7f583f72sm4172824plm.209.2023.07.12.09.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 09:40:34 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 09/10] hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
Date: Wed, 12 Jul 2023 22:09:42 +0530
Message-Id: <20230712163943.98994-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712163943.98994-1-sunilvl@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: fWEh64+wIN09

MMU type information is available via MMU node in RHCT.
Add this node in RHCT.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 2d2bd3b970..25745eee4c 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -158,6 +158,8 @@ static void build_rhct(GArray *table_data,
     size_t len, aligned_len;
     uint32_t isa_offset, num_rhct_nodes, cmo_offset = 0;
     RISCVCPU *cpu = &s->soc[0].harts[0];
+    uint32_t mmu_offset = 0;
+    uint8_t satp_mode_max;
     char *isa;
 
     AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = s->oem_id,
@@ -177,6 +179,10 @@ static void build_rhct(GArray *table_data,
         num_rhct_nodes++;
     }
 
+    if (cpu->cfg.satp_mode.supported != 0) {
+        num_rhct_nodes++;
+    }
+
     /* Number of RHCT nodes*/
     build_append_int_noprefix(table_data, num_rhct_nodes, 4);
 
@@ -202,6 +208,26 @@ static void build_rhct(GArray *table_data,
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
@@ -244,6 +270,11 @@ static void build_rhct(GArray *table_data,
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
@@ -252,9 +283,14 @@ static void build_rhct(GArray *table_data,
 
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

