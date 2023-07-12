Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp2740964eje;
        Wed, 12 Jul 2023 09:40:24 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG0uFB20hkHNmzY+8njkBHn/10ZrSLx5EMoOStqM72kxoL4Ohd1HW3RDXfOHg+onaSzG4SW
X-Received: by 2002:a0c:f4c9:0:b0:632:25c5:6fb8 with SMTP id o9-20020a0cf4c9000000b0063225c56fb8mr17019100qvm.31.1689180024297;
        Wed, 12 Jul 2023 09:40:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689180024; cv=none;
        d=google.com; s=arc-20160816;
        b=QKtkvc/p/lAMmXWplCxUjgg9viIMfrYXiL8Ek2he1c5qE0wflR+6+7ptE4Qm+JDKyb
         wLrwIJHrQthVxbOuZs1Sc9fbImHz1gxclyTQeY2tXEDXGPuoxjp9wG0KpU2bRzAlb+qx
         bUYt2eqzCyVlz9kp/i/upCcWJQN9xg9d+9pi//j+sJ8u8U4Ex0CWBHUo14KcB5zXYYmc
         3wV7P9fFTedB10+Kx0531M5ViOsQxb/5k/3wXmLzhn5sdLHI9pM6GFf19OH36xN4q360
         RJL6TwK/vspauWNlBPNSPdODqC5OGj6gWctIx6vTeBn2nCgDRQ+g/vPOKHcE0WsHPxBr
         gxhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YO6q94z1b55DMhCVDxdVi8lkeoDHIzdqcZLtLcOPdJs=;
        fh=QsSyH/XJB0d/FRsyBb/wvDqny4l1zc3rGbeONrDGr3Y=;
        b=OR211HerNgCBSaQidXzBe2dx6yjdPFd//xptI+qsBC1zyBKkTHx9w8Mb0l0zs73c2J
         ht6Q1jJ3TmAioiuLLIRJTN+Q/3gGCNCzFDmh5FSOnHJh/tc2mQt2CN13h2EZzFvm4vNB
         8QVYYLnkRK07jnnAktqgCPkFuDelzkrpkEiL/5AA8gUQV+XOINsmnpQ/ZYy03KyEmjt2
         TYtqCGeOTPZXKZac+nW0gBRYFQrzKmhnZUkyU99N3P9O5NxsWdGz/cMTk3rGIqQAISt/
         veoeGuT2lFaRQnjTzEyZ8RhQyy8pVQJzi014VNods6TEBpKH9fADfSkSFe/Y506zzs2X
         8ENg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=btUPRI8K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18-20020a0cf512000000b006362fa5fd83si1884434qvm.266.2023.07.12.09.40.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jul 2023 09:40:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=btUPRI8K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJcsy-0003mC-FB; Wed, 12 Jul 2023 12:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJcsw-0003kT-Sz
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 12:40:14 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJcsu-0004py-8Z
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 12:40:14 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1b8ad8383faso52970785ad.0
 for <qemu-arm@nongnu.org>; Wed, 12 Jul 2023 09:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689180010; x=1691772010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YO6q94z1b55DMhCVDxdVi8lkeoDHIzdqcZLtLcOPdJs=;
 b=btUPRI8Khsv6HQrYeB6fzInd9HNRhJxxY1bxtWZlHdUb/UizeJnNLClGcJo2gsWwcE
 n6BFgJWYn5Scc04JJH/F867EjfHW/rlN2t9q2Yj4ytcKmg/uT2XEK1YFFn+IyjereWb6
 4+bP5bzflafFRBeH1t18AJcDcChOv75rKxpDxcncmK3XF/FIUgsGXXFJIaG6yMfG2uHf
 /3mFXp3ekEWq7+XhMeFVIAPFSxC6veajxN57D8HYL1N5xH7ziuQw3fbYAuSr5z3eG+Pf
 YSxXy7IYwJpkNGsCuU0uZYdVp5yGmBC1INmbdhrM42uxWsi2BWUB+5GyzHVJQCxPH5I9
 WS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689180010; x=1691772010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YO6q94z1b55DMhCVDxdVi8lkeoDHIzdqcZLtLcOPdJs=;
 b=PUgdL1zbbgKMlGTrDR9Ztzt3HFgsFEEsrsNV98t/t+VbGo3xRCJXX+liQfjsVCCnXI
 ENPT+A9Uz83m1VjJR03k6ZN1zKZCJmjUiUqQj520MzwzCTzmYBa99Bm+cwH56pOFSQrn
 jSjRM59PNow2l+fbTQ+OFIT0gcEiMOdxMsLNlFTi9iAoZpG3sJ68rCXPSI8boJJNiHz3
 tcRk46mXngTrRpG1JHDWd5liFS0ECk0YWnu6g66KUdAF/WWp9XTohZrKMd78Z6hNMU+p
 dfFOCnuJW1tTMaoHG0jAwvcnCv5X0PDOIacZpDXjlN0dHP51EOGwVitb8Tn0BSjYbviP
 lohQ==
X-Gm-Message-State: ABy/qLbErDQJMA8uhrMmRhZNa6a0m61zumehYtdY9lfMQNoB+f9Jyg9F
 FX8+26grjPL+6IaD/m6QUjU1RQ==
X-Received: by 2002:a17:902:ecc2:b0:1b6:6e3a:77fb with SMTP id
 a2-20020a170902ecc200b001b66e3a77fbmr26321110plh.2.1689180010652; 
 Wed, 12 Jul 2023 09:40:10 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.25])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a1709027d9200b001ac7f583f72sm4172824plm.209.2023.07.12.09.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 09:40:10 -0700 (PDT)
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
Subject: [PATCH 04/10] hw/riscv: virt: Add PCIe HIGHMEM in memmap
Date: Wed, 12 Jul 2023 22:09:37 +0530
Message-Id: <20230712163943.98994-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712163943.98994-1-sunilvl@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x633.google.com
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
X-TUID: +1Te2GJRfQIA

PCIe High MMIO base is actually dynamic and fixed at
run time based on the RAM configured. Currently, this is
not part of the memmap and kept in separate static variable
in virt.c. However, ACPI code also needs this information
to populate DSDT. So, once the base is discovered, merge
this into the final memmap which can be used to create
ACPI tables later.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt.c         | 31 ++++++++++++++++++++++++++++++-
 include/hw/riscv/virt.h |  9 +++++++--
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index f6067db8ec..7aee06f021 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -84,6 +84,22 @@ static const MemMapEntry virt_memmap[] = {
 
 static MemMapEntry virt_high_pcie_memmap;
 
+/*
+ * virt_memmap doesn't include floating High Mem IO address entry. To enable
+ * code organization in multiple files (ex: ACPI), it is better to have single
+ * memmap which has complete information.
+ *
+ * VIRT_HIGH_PCIE_MMIO is always greater than the last memmap entry and hence
+ * full_virt_memmap is capable of holding both virt_memmap and
+ * VIRT_HIGH_PCIE_MMIO entry.
+ *
+ * The values for these floating entries will be updated when top of RAM is
+ * discovered.
+ */
+static MemMapEntry full_virt_memmap[] = {
+    [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 0 },
+};
+
 #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
 
 static PFlashCFI01 *virt_flash_create1(RISCVVirtState *s,
@@ -1444,7 +1460,20 @@ static void virt_machine_init(MachineState *machine)
             ROUND_UP(virt_high_pcie_memmap.base, virt_high_pcie_memmap.size);
     }
 
-    s->memmap = virt_memmap;
+    /*
+     * Initialize the floating values in full memory map
+     */
+    full_virt_memmap[VIRT_HIGH_PCIE_MMIO].base = virt_high_pcie_memmap.base;
+    full_virt_memmap[VIRT_HIGH_PCIE_MMIO].size = virt_high_pcie_memmap.size;
+
+    s->memmap = full_virt_memmap;
+    /*
+     * Copy the base virt_memmap entries to full memmap
+     */
+    for (i = 0; i < ARRAY_SIZE(virt_memmap); i++) {
+        s->memmap[i] = virt_memmap[i];
+    }
+
 
     /* register system main memory (actual RAM) */
     memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 00c22492a7..1d7ddf5df0 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -60,7 +60,7 @@ struct RISCVVirtState {
     char *oem_id;
     char *oem_table_id;
     OnOffAuto acpi;
-    const MemMapEntry *memmap;
+    MemMapEntry *memmap;
     PCIBus *bus;
 };
 
@@ -84,7 +84,12 @@ enum {
     VIRT_PCIE_MMIO,
     VIRT_PCIE_PIO,
     VIRT_PLATFORM_BUS,
-    VIRT_PCIE_ECAM
+    VIRT_PCIE_ECAM,
+    VIRT_LAST_MEMMAP /* Keep this entry always last */
+};
+
+enum {
+    VIRT_HIGH_PCIE_MMIO = VIRT_LAST_MEMMAP,
 };
 
 enum {
-- 
2.39.2

