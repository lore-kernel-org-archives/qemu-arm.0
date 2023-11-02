Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp531611eja;
        Thu, 2 Nov 2023 10:04:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvxvx794pUKxxa7Lz8sCMFsC9F6DjMrLiJODveeArSO7KpJQOTKo5JplsD84uyGFplnh8W
X-Received: by 2002:a05:622a:114:b0:41e:217a:bad5 with SMTP id u20-20020a05622a011400b0041e217abad5mr21935293qtw.67.1698944683625;
        Thu, 02 Nov 2023 10:04:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698944683; cv=none;
        d=google.com; s=arc-20160816;
        b=UCibe3/hGZKqHqydOacATqRhEAz5UcVO6UH8nKctz73yxJvfGCfqUxmkL6CQRatAM1
         Og0hkgPOOf57+ZJJp1DF5CA8CA1wVlSduUesD1PGucuGlObDo8YmLc7NHI8NVkFupGKV
         uFLmUchRWyUu1OmS4lBdObVDjZBF1q46hA0ibH//ZZ8vVqh6vc4N8HAJQn/ZYq81xqZX
         cwqvMppzhXpRxDZ7pm0e4+ymD0+rvmNmLWuGfkJsVUWo7luOM3iXoaX2LGrid03daWzn
         9UZUWvWaHyeiPj2tY7/7igCkP/LIMFqmubxmZDkdnpURm+U2uh2lo77+fgItYNEQC51i
         EgcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ozwEIx8DJpOuIHNR2h+O+1SfwqWBoYWeAIIvl7CgSBg=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=eiU+Omi1Bft3+wva3Yiq+7BwiHqnuVMzjM3wg5i7wt+m0YfKeMCmXkt2bM82TJuPkX
         HYZT+vG84TflBn/mqJgxCNKp1p3PpWTd+eqPzoFP0p7qAc1HUY9yXrZs3VtgrgWu+GbT
         dQB7HnXPQ8GmcEQot958szmnAYYEW8PySvxg/gWMsCvZj0Xvte7bWLr9NW/wOkRQTtOe
         GC+J6XIty0dFWGErEX1fhtcPGq6cCWEgg3aoA0k5lyOkxRfZZ/Cvd8gC8Lq0zfDn6jIw
         IxeH3Hyp6OTpKAV66ZPTY1p2Eyg9BNM2GMufRoc8vs6AgPcAHU1hdLdgRXGzucG0GUnz
         hB4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="d/zhPjjP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7-20020ac85fc7000000b00417cf21cf2esi209890qta.676.2023.11.02.10.04.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 10:04:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="d/zhPjjP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyb6R-0003RB-6D; Thu, 02 Nov 2023 13:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyb6P-0003QU-S2
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 13:03:29 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyb6L-0004Gr-DE
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 13:03:29 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2809a824bbbso1058112a91.3
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 10:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698944604; x=1699549404; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozwEIx8DJpOuIHNR2h+O+1SfwqWBoYWeAIIvl7CgSBg=;
 b=d/zhPjjPSDezm/HmYludRP+4WE6HeUZUnpA7LOAmgPMtdwEPq7F/OL2s2CfEXqiL5+
 sACUuHjTHJ+79YwlNXE0xXZg0Pkz7nugUwXqqSkZGCMMGFHlSIIQL565Deuz0FHWvh6B
 kVXqy2wNdtqxbg9ly2nn8BPf8MrWf+WjmAbAOYeT/9igacpUvyi8XK4KKjE6GawIMJ90
 UDin7C7YBljpg7/aXAQQ4cEmoMEsHytr4vV3BZlDNQ5VjzJ2mlbkFmtz6NLmjeHMzbAa
 5gQzz5Q79ubPPnbxVAbXZUWg2XJKucUFoAKKwnMS74OF7Nm/Zm3hjBoWTysmn5LwHiO6
 agWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698944604; x=1699549404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ozwEIx8DJpOuIHNR2h+O+1SfwqWBoYWeAIIvl7CgSBg=;
 b=xCOojwzHaUTR2ETPpNMY+lASHqqJVlbNW8PRqB/aLNjn4Cj+whtDoWfTipCz0WKj1o
 QbgYTZ8CAaOQWobQMOQZPJXncrQQ8f0o/NfiQoUC+XZY8RDtFPnH1/TN7cAblD5vJYSd
 iCeFDY8wB3hOjndO/F8VJhLJFgROQW0FPeFTf77yb6XQ+79cIY40xYZVjw4J0Dhh+zpx
 ZCqKVVd0mRG5Ibl4SKJ8x6k9s/UTjsupnq0Q/1yIJCSQtXuvjfbShLl1azWUUlkhmL3J
 lUqbyXiJZkPQQnWiyYoyGllmuRPS5PFteFtWePAa2UvUi8yB6i56y17RVP0QcQuDErBu
 FInw==
X-Gm-Message-State: AOJu0YwZbh27HVRjCijWIXUuGKkFy4OTCyuivqeQmJLyj/10fea3K5Be
 NEIzHq3i9ygkxZLPYYFQeKhpzy739xWbm4Be6w7sMg==
X-Received: by 2002:a17:90b:1904:b0:280:16bb:8169 with SMTP id
 mp4-20020a17090b190400b0028016bb8169mr13029955pjb.40.1698944603118; 
 Thu, 02 Nov 2023 10:03:23 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 18-20020a17090a031200b0026b70d2a8a2sm25098pje.29.2023.11.02.10.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 10:03:22 -0700 (PDT)
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
Subject: [PATCH v6 08/13] hw/riscv/virt-acpi-build.c: Add CMO information in
 RHCT
Date: Thu,  2 Nov 2023 22:32:18 +0530
Message-Id: <20231102170223.2619260-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
References: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102a.google.com
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
X-TUID: JdS3o8dhWTHk

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

