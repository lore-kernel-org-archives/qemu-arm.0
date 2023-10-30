Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1864515ejc;
        Mon, 30 Oct 2023 06:23:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLflklKSB1x3GkWdI45KntVfKf6vbDz8Fa5Q8tciqgvoSHgKIlJ8FkVQxLZEfgJ+KgV0TK
X-Received: by 2002:a05:6830:1219:b0:6c6:4a8d:da98 with SMTP id r25-20020a056830121900b006c64a8dda98mr9760145otp.24.1698672195912;
        Mon, 30 Oct 2023 06:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698672195; cv=none;
        d=google.com; s=arc-20160816;
        b=RNmS4SurE3kJki0PI/p4Twys5sg9pHIikIqTmXklB08J7bc8cykPdLvxnQgHrdOTWZ
         oJWno9VicI+6qtVVmJ6mxKVwYzHzIlsBaUZRbzDX/oEZ8oQBdD9c4dfkPzSK2Wyq8xaC
         cFaCRLTA6CUtmHLKFaahKrA6+yKKV3VT+jgqGt1HN/upFnM6dyIK9ca2OycO6b1a99rR
         752eA/Qz8hR+UJ97fH7qp3bQdYSDUajl10wHbWsokCIfl0Yc36eVAy/vEItXDxKuMIVR
         HvCSQb2XxeXVbtADbfu1W/4ljTGZrv0vqjcb86XJa3aTJ+VFpsGrVXzTbfvaA3A7NR9P
         3Paw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BIDV9HkogsPZri1ipsWFjw8pgoXgN2I+UnERgpGK/Yw=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=ZrGQfsMNL20fSMVAa3g4GhQJr0lwfrEXFqVOmlOee54ciyjoM/oyHO5P6qbfVwtrK/
         P6lgz2zIrO816Uu62cfM94jRDxH6rcVGo5mM7S5JCERQItJ9GzbWryzFYQGIzzI9WaOh
         57fwD6upaCFOpGYXFAFmNdNK8khCXgpLM0pttJ1eFmpKs+XXpPOH8PqnCcXq+4OqaP7u
         RbJ/AYUC0AEZVqenKkY5Vv7hIeJBL8TAp5fwWFgk7X7tSyKPrgG0PAj57W7yM94zyLYw
         E4n6fLxqLI9iyXCfBRMbZGA6rSlEC3y7EPaLc8fOJLVIfLiDxMJCEFXScxQgTxD8o02k
         6exQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="PJQb6V0/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9-20020a05622a050900b0041973211528si5687300qtx.495.2023.10.30.06.23.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 06:23:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="PJQb6V0/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qxSDY-0007BA-5s; Mon, 30 Oct 2023 09:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSDK-0006vT-VJ
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 09:21:55 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSDC-0002t0-DI
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 09:21:54 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2802c41b716so1046542a91.1
 for <qemu-devel@nongnu.org>; Mon, 30 Oct 2023 06:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698672105; x=1699276905; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BIDV9HkogsPZri1ipsWFjw8pgoXgN2I+UnERgpGK/Yw=;
 b=PJQb6V0/KsqFiOvUR8QwbKDVdSPW5nI6fAL7EMOQT4xNt0P2RYkP0w7OHJWsDSFMCS
 OrR/lku1Gm78xERUfDOVuXM95yz2E0LfBOYSI1OgL9gKe4mT4AcxLgI3ciW6RL9T0iPd
 /WD4fmmczQ8CzDGeGolj7QvHVjr/r7IkA/BgjoZoC3xAbBj0bJpP32+tQEknZHIzcx2J
 7ZJK57S/djJpifFAoIh6MkMeFiGbjHzmZe+TmpQLruIev0uewwlEB4G+jdKCWtsO0vhL
 iwk1ZNymygTs1UyfCLme6mO+a4l+0yjxNdfb3NZuMOHTp7XtIfg/NavDcqBlDfRhTnRM
 lmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698672105; x=1699276905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BIDV9HkogsPZri1ipsWFjw8pgoXgN2I+UnERgpGK/Yw=;
 b=Oo9SNW2pG8L6Qce3YMhqiJUR3jAh/XF3lKj4pjZ17SsZqsstxDv4sbCmb9z8nT9hMu
 IexqXsqlog1pgXUj7FsTzgt85X0mfKkRi3+cZPhPPIi1GpOVaBI1LBFWoF/eqpk6JwLe
 fsmqe3XOsVLbEUMlSPBo3z4sBLqrIMtf5LZha+6+tUt6DFyF+Rq+UWYalCpDebVptKe6
 f3CvH14nf4AJ+33yPMD3ZLcHKNk0MwoceMynxx8lgZrNLa0ucpEoFOOHQQ3tICRHTQ3y
 +Rl8wC8IzWC3wAbpVTcMD7QDJ637ubZeDLEiVX6bTDKm6ApVVEDOi8jo8zyF65ZXWkHa
 7mKA==
X-Gm-Message-State: AOJu0Yxpuj0qhSBVqFVg7l4SGbCz9IM+K+awN7LncAOdl5bbhYCi23n1
 h8NJjiwqsz3Yn/MSBpHGlOASvA==
X-Received: by 2002:a17:90a:134c:b0:280:35ce:5e0f with SMTP id
 y12-20020a17090a134c00b0028035ce5e0fmr2556293pjf.11.1698672104692; 
 Mon, 30 Oct 2023 06:21:44 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 15-20020a17090a000f00b0027ced921e80sm8122412pja.38.2023.10.30.06.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 06:21:44 -0700 (PDT)
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
Subject: [PATCH v5 06/13] hw/riscv/virt-acpi-build.c: Add IMSIC in the MADT
Date: Mon, 30 Oct 2023 18:50:51 +0530
Message-Id: <20231030132058.763556-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030132058.763556-1-sunilvl@ventanamicro.com>
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: uEVqYgfGZf1y

Add IMSIC structure in MADT when IMSIC is configured.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt-acpi-build.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 3f9536356e..6bb21014fd 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -270,6 +270,19 @@ static void build_madt(GArray *table_data,
     MachineClass *mc = MACHINE_GET_CLASS(s);
     MachineState *ms = MACHINE(s);
     const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
+    uint8_t  group_index_bits = imsic_num_bits(riscv_socket_count(ms));
+    uint8_t  guest_index_bits = imsic_num_bits(s->aia_guests + 1);
+    uint16_t imsic_max_hart_per_socket = 0;
+    uint8_t  hart_index_bits;
+    uint8_t  socket;
+
+    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
+        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
+            imsic_max_hart_per_socket = s->soc[socket].num_harts;
+        }
+    }
+
+    hart_index_bits = imsic_num_bits(imsic_max_hart_per_socket);
 
     AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
                         .oem_table_id = s->oem_table_id };
@@ -284,6 +297,28 @@ static void build_madt(GArray *table_data,
         riscv_acpi_madt_add_rintc(i, arch_ids, table_data, s);
     }
 
+    /* IMSIC */
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+        /* IMSIC */
+        build_append_int_noprefix(table_data, 0x19, 1);     /* Type */
+        build_append_int_noprefix(table_data, 16, 1);       /* Length */
+        build_append_int_noprefix(table_data, 1, 1);        /* Version */
+        build_append_int_noprefix(table_data, 0, 1);        /* Reserved */
+        build_append_int_noprefix(table_data, 0, 4);        /* Flags */
+        /* Number of supervisor mode Interrupt Identities */
+        build_append_int_noprefix(table_data, VIRT_IRQCHIP_NUM_MSIS, 2);
+        /* Number of guest mode Interrupt Identities */
+        build_append_int_noprefix(table_data, VIRT_IRQCHIP_NUM_MSIS, 2);
+        /* Guest Index Bits */
+        build_append_int_noprefix(table_data, guest_index_bits, 1);
+        /* Hart Index Bits */
+        build_append_int_noprefix(table_data, hart_index_bits, 1);
+        /* Group Index Bits */
+        build_append_int_noprefix(table_data, group_index_bits, 1);
+        /* Group Index Shift */
+        build_append_int_noprefix(table_data, IMSIC_MMIO_GROUP_MIN_SHIFT, 1);
+    }
+
     acpi_table_end(linker, &table);
 }
 
-- 
2.39.2

