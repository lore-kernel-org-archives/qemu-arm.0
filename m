Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1863988ejc;
        Mon, 30 Oct 2023 06:22:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5LsnvxMpgtJWy7yt4GUWJmDdA92v4t9KQWVQ7GvYwprq8wZtCEg6fSGaFSWtxiBuKOzoq
X-Received: by 2002:a05:620a:4514:b0:775:7d81:f8bb with SMTP id t20-20020a05620a451400b007757d81f8bbmr13315898qkp.11.1698672145011;
        Mon, 30 Oct 2023 06:22:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698672144; cv=none;
        d=google.com; s=arc-20160816;
        b=LzKL6hJMgDAMj4ceJBOV5rUEtRauzQ5GqZwylbfJVauD1X769pkGgLqbxSfl85AaaY
         GEkcDyDSvvQcqFCB9G1D6a8+toKh6cWAea8YWPJ/jVOpo3JUuR8bHI9soKmcNMU3Hsjv
         LWyxlXb/iaCE47nLqdA1OdohHotEnKgzBLXrydK13lbq9NsuCBPq/xRJgbmLmrJqKKKx
         L7j+aLdg5qspZbJx0iYYnrUV2ZTthfjpszBLcF5c64Is6R2zJRPmOrnT/+U+RhXxtW8P
         AXQwMRdB02OhFCXUTUfhalUaQtxmqMa02T49vO20I5tJT89RtIG6II9ubckLkbcIkYR+
         MZjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KMqId8zOyBROAfCr/ApxNc76H4ky9nZ2QMykSoL/rsY=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=OZ/T7H73KhIru3D8P+5E1JjPyquV8W5beUH9vwJ6C9FpSiDVSynYP4fG6D8MBVrWEb
         bptgVXWOa9a9h8EC6BJlyEz662xcKetZu7zSUSwr855K4rGSgcRre6bvsJfITOcC9SXm
         EsKdtS4udZI4EEady6RkyHeaF+uKoPeiPAQqE7XJxLHpDBhsK7FbmkIDGOfLNIMm9P1i
         S0whY9L6rTo/wbXmtcBFpVUhhlPk+aX8BD7u5rHRPIOZJ6XXHCpMF7Aj5w+8GlDthQo4
         J3r7SehxgLAN5KEkRJEOx6Yqeq1WncSl9RzJqraGVYKos+Mbjg2crmcZqwLitua3QQKj
         919A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=K8hSxs2a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17-20020ae9e311000000b007757fdc191dsi5364348qkf.451.2023.10.30.06.22.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 06:22:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=K8hSxs2a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qxSDi-0007U9-PA; Mon, 30 Oct 2023 09:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSDb-0007Kb-DC
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 09:22:11 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSDV-0002wh-6J
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 09:22:09 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5b7f3f470a9so2785317a12.0
 for <qemu-devel@nongnu.org>; Mon, 30 Oct 2023 06:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698672123; x=1699276923; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KMqId8zOyBROAfCr/ApxNc76H4ky9nZ2QMykSoL/rsY=;
 b=K8hSxs2adzuioHyQUmz3x01DYknUu/V+uO0xt66icezh/TPkwEdTYmOD06OHOndqmG
 E2vGfrbR2qHe+GouMnCLUBbvKqbtxkB+OdCJvO/LBW3jbSOfEESXt2a3zSK0uP2m7QGO
 yE4zXvoUqdzO3ywmFWUmCkY70puJMGF3f0y9D0jU/e1nWqH0lDxNl4lwHxvGq91ZkVnW
 MY1D7QUXh7R+MpvoKKcQoL/Ew/QwQrjZyB6Z2aC35eRCLBoSAsXHgVzQGH27TVVoB4S4
 JESYu6R1JMKingqIU1xxfTJ1XzvBZZPgy7xITuq5LoBm8SI3QrilQtkgEc7R5Z/BhH7j
 XAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698672123; x=1699276923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KMqId8zOyBROAfCr/ApxNc76H4ky9nZ2QMykSoL/rsY=;
 b=vTGAkmUzOcGrm0Mk7AgNKKKoaOEAjLRin6YBS/glTX5a+WHyxycOzCT8Aj3LFr6mUu
 QDhuI8PpgMP5eawFejftiJV7zeL1nwKY9ZavBVGQODheuyrQLva8L/EEAnRcQ3I9lJSX
 sKNAjzl130plLIW46rjXsshyKZNHGv6UR7LTsP0m2bGQZwBSYljEsj4HrugMdLWAA8kC
 3BngSLk/3v8pzZ9uLSJ1664OBvqb7DJHhkNM7i6GuI1rXELVh2ZsrXQklR1IRX7xGLbi
 G7CUrGcydGADKILyUMi52+X2vjlAeZP86r6k5JYNVlxAomj7/ZM1qnD6cjUGhpHS1eSn
 uUVQ==
X-Gm-Message-State: AOJu0Yw1BFFAm6AWeNsKkeQacwRQsmWlO7CyiNkePQkRhJ57QqhK258x
 oAcFrz0JDlEbOFQeeqo/OOWfXQ==
X-Received: by 2002:a17:90a:ff17:b0:280:53b2:4b9f with SMTP id
 ce23-20020a17090aff1700b0028053b24b9fmr1914561pjb.20.1698672123012; 
 Mon, 30 Oct 2023 06:22:03 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 15-20020a17090a000f00b0027ced921e80sm8122412pja.38.2023.10.30.06.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 06:22:02 -0700 (PDT)
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
Subject: [PATCH v5 09/13] hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
Date: Mon, 30 Oct 2023 18:50:54 +0530
Message-Id: <20231030132058.763556-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030132058.763556-1-sunilvl@ventanamicro.com>
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x535.google.com
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
X-TUID: 8iL3Msop2Rte

MMU type information is available via MMU node in RHCT. Add this node in
RHCT.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 506d487ede..86c38f7c2b 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -152,6 +152,8 @@ static void build_rhct(GArray *table_data,
     size_t len, aligned_len;
     uint32_t isa_offset, num_rhct_nodes, cmo_offset = 0;
     RISCVCPU *cpu = &s->soc[0].harts[0];
+    uint32_t mmu_offset = 0;
+    uint8_t satp_mode_max;
     char *isa;
 
     AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = s->oem_id,
@@ -171,6 +173,10 @@ static void build_rhct(GArray *table_data,
         num_rhct_nodes++;
     }
 
+    if (cpu->cfg.satp_mode.supported != 0) {
+        num_rhct_nodes++;
+    }
+
     /* Number of RHCT nodes*/
     build_append_int_noprefix(table_data, num_rhct_nodes, 4);
 
@@ -226,6 +232,26 @@ static void build_rhct(GArray *table_data,
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
@@ -238,17 +264,25 @@ static void build_rhct(GArray *table_data,
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

