Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2999745ejb;
        Wed, 25 Oct 2023 13:09:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlmkxVd0b/ycwfqGfe3Q50xaPBUFKjmIcHYMyx6Babk5xzGn5n9FBggRkc/IKULT1K30zQ
X-Received: by 2002:adf:e40e:0:b0:32d:a310:cc2a with SMTP id g14-20020adfe40e000000b0032da310cc2amr11323182wrm.23.1698264589469;
        Wed, 25 Oct 2023 13:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698264589; cv=none;
        d=google.com; s=arc-20160816;
        b=MD6qdZa5m6YQwenLjG3F3BiU1Pgf8T8j12tVM9Ws92XPV6RoHFeaGeE/aIayU/6MUN
         O4On8ASVpNdGWjSlRQUIHrx4cMCMJlTp8OxqZcZiFoHYd8QB+oz/on6Sf6BqNaBnGrMu
         cFQxfFF9yEICxsw+Zd+elNvPHGE8ERUHhE96PRr+vet2BGBOnt7dGzG6BpznvPHG748i
         q25DrNpXTKQc8nvqjAirhgvqP2c9kKJyZRwiUZ5IX/mpoMiQowe2+XOkaHoSRITpXAz0
         UPy45s6dO5lxzwWeQ3a4IYVJ8lB1QedvMxv3Zz28BlNvGvqaghmWNUnYbDQV2UnxBF9s
         SUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=axfbQ/lCL4+TsO9FA+miqVFGldI0+BwW7Pnjw899woY=;
        fh=ieNWTeoXViVzjD3GbjL7nI2u2Tkk33Uc9BsQY+9ivz0=;
        b=pDdAOOReFcKcUmztLqwKqsaKM4hJVzWiEwxEDGOP/rq5N+Cb1EDkfYkqstWAt9GKvg
         9FPP3tc3unFbrv45pAs29vUj/oD+Zmg/mxY7SLN+sF0vsJzbciaUVWrFfEoEary3R2d5
         YZBk0rYXBMznTF+LxpPPuvzkn9iJIahj7ZAdX0MoHyTYwwsJFAVGwzKhA1G0obmrBKqS
         PewnvCCHRwqGSiGP0WM0SAPkntsciS3SjS7mZaQ6DgJ7aRAz5do3esWGc51cJ67yJ20O
         iVNaZLeQEBe9/4ya8sc7+clDy37OnZuHm5xB2LfFM5MGoMVZE0/yYF9hlwn4gcX46IgM
         jexw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=gdyzvZtK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5-20020a056000124500b0032d8183743bsi7646757wrx.568.2023.10.25.13.09.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 13:09:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=gdyzvZtK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvkAw-0007nA-Un; Wed, 25 Oct 2023 16:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAw-0007hi-5H
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 16:08:22 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAt-0003Ye-OY
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 16:08:21 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6934202b8bdso129155b3a.1
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 13:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698264498; x=1698869298; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=axfbQ/lCL4+TsO9FA+miqVFGldI0+BwW7Pnjw899woY=;
 b=gdyzvZtKGQ1CYbMbncSi+LIgZRU/wIBqGXX/2CPni4mLe/JxY+X1FIy5Gw7QvAr+wS
 h2WNdp7Qp6GauH6W518x73+9tl3uT+BFGahxFNCmvtIpDhbA3eY0YeTxqRpFdWjUBgJo
 5uRA8SXn/RQKDZQ79BLMyXKXLFJ35NSDHSVo5J6lWZ//Vr5FeTkUv3H4TMI8uAOY4enj
 inPYZik6YNrAkzPWzTqPPa4TSecwuLFyEAZpzPfxN+8d+H3e+s3VoUp86+m1TA0uKvLH
 1ivu84+rBMt7ymwp3vAFcgh0RAhUC2QdrFiFN+XcU70YvG880eqM+twPPUVZLEQZcdQu
 /B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698264498; x=1698869298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=axfbQ/lCL4+TsO9FA+miqVFGldI0+BwW7Pnjw899woY=;
 b=LkC1ZV/fu8Ava0gVQorZGTPWuUrklDG/KDImn1e5IkJBS0O426UjyYoJaHodiPXG52
 N3yXQW13G4wqIDgOZD7LHZwmojZXdiJy+ytkEuIr6K7gbZcgTJxpCd6I7DFBUtoUeC97
 dtztDubBY9maxHQ0bQva67Wlo6UUSi+59qt6BcCJVC8yP8VkwBv7NXUYO1sXSs50w5kf
 VDL+MM53wTps9ER6iyagyxV9np/XCZ3WuqJ8J9Q+NPIo9BocR+vBvucizDwaj7v1P1PX
 Gu1DXGxrRBF7gB4KGWE1b9HdZQQWrDm0/us0W6W+kBdLq3WXifvVXBA95SJFwsBl0jDJ
 eV6Q==
X-Gm-Message-State: AOJu0YwFm9X6Bq8D8kaX/9m51vouiedy5ShjwtHXD2Ga2gfr5fIACvJS
 Mckn7dmStRpPlFq0r55XQdlQGO8BdX9UkRVLDh8Oeg==
X-Received: by 2002:a05:6a00:2e8e:b0:6be:9c0:7195 with SMTP id
 fd14-20020a056a002e8e00b006be09c07195mr18477385pfb.20.1698264498050; 
 Wed, 25 Oct 2023 13:08:18 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa79681000000b0068fe7c4148fsm9696768pfk.57.2023.10.25.13.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 13:08:17 -0700 (PDT)
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
Subject: [PATCH v4 09/13] hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
Date: Thu, 26 Oct 2023 01:37:09 +0530
Message-Id: <20231025200713.580814-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025200713.580814-1-sunilvl@ventanamicro.com>
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x434.google.com
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
X-TUID: kxbophOH605G

MMU type information is available via MMU node in RHCT. Add this node in
RHCT.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index ebe7062b9b..dc7c0213f5 100644
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
 
@@ -233,6 +239,26 @@ static void build_rhct(GArray *table_data,
         }
     }
 
+    /* MMU node structure */
+    if (cpu->cfg.satp_mode.supported != 0) {
+        satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
+        mmu_offset = table_data->len - table.table_offset;
+        build_append_int_noprefix(table_data, 2, 2);    /* Type */
+        build_append_int_noprefix(table_data, 8, 2);    /* Length */
+        build_append_int_noprefix(table_data, 0x1, 2);  /* Revision */
+        build_append_int_noprefix(table_data, 0, 1);    /* Reserved */
+        /* MMU Type */
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
     /* Hart Info Node */
     for (int i = 0; i < arch_ids->len; i++) {
         len = 16;
@@ -245,17 +271,26 @@ static void build_rhct(GArray *table_data,
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
         build_append_int_noprefix(table_data, num_offsets, 2);
         build_append_int_noprefix(table_data, i, 4);   /* ACPI Processor UID */
-
         /* Offsets */
         build_append_int_noprefix(table_data, isa_offset, 4);
+        if (mmu_offset) {
+            build_append_int_noprefix(table_data, mmu_offset, 4);
+        }
+
         if (cmo_offset) {
             build_append_int_noprefix(table_data, cmo_offset, 4);
         }
+
     }
 
     acpi_table_end(linker, &table);
-- 
2.39.2

