Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp2741539eje;
        Wed, 12 Jul 2023 09:41:21 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFAA41t6sVUzSRlo8ehwIA3s9QUX42WSv/vsx/PytvqsO1XUOZ34kuKIrB47PDKhLIdtSfZ
X-Received: by 2002:a05:620a:2493:b0:767:c7d2:2f15 with SMTP id i19-20020a05620a249300b00767c7d22f15mr15749997qkn.58.1689180081666;
        Wed, 12 Jul 2023 09:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689180081; cv=none;
        d=google.com; s=arc-20160816;
        b=AO8g5IvLeR3dv0jTHvkUlbPB8KbYzpFbknEq+ZebKBh6NZfX5bjVeXBztXbkzukV7A
         U4dHNWW83Sr8toKqXPn2hv3EQVzruBsIylUxFboaQ/+I+OTfEDNMa7HKtYoYI6b7YYw5
         vMQMFutAGXfBPRZrKAzKdu/FUKzA6mqXN54I75RcUwrRxy5c/uSycbOjXxt4QvAcB72m
         ym+AcV0D/yKpWz9wBgg/6thT2oPLoy3QD3E2NN137vRDmZy5rdrfO5K622ZjgC+dF26i
         yxyQKTi84iPgKbvpRNhux8liLy7+UyZajN/Gc8zL/6/EQT94R9pNhTmgs3QhwAW4jmsK
         x7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=siw19EWcfZmdOoQY236nImX04rVVHl0kf0GWq2R61Hk=;
        fh=QsSyH/XJB0d/FRsyBb/wvDqny4l1zc3rGbeONrDGr3Y=;
        b=lZQsPKb0LqubEVIEZff8nGmf0fzp7WSEcUBlUnz7ML2sHX/lrqDmjfmTQMKBcDj45D
         yvwuIV35qhb8dOwVbQEfoikx0mFX/hrjZZwKDP51V0ElcInvS4l+wpaNiuijY+Y2JqxL
         zq7kyboisoQzyNGThqr+BWuu/tXpcNDm7cn5+fCTZ5Ul7hru5ytbPaa4PBHp3CKTIlXW
         7RybHcpH5fK3VyVggQz6vT2yOaT7WpeXG/BFR67qzZCY7tKWKGxf/BZDcECHP443H9sj
         1A4+um5gIR32EN2MlETIjA4nBg42L/GcGOrD6b020u0KgIlkolj0PmjIeCxr+wGV1cPf
         397w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="c2tK/8Be";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x24-20020a05620a0ed800b00763b96d1170si1883213qkm.586.2023.07.12.09.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jul 2023 09:41:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="c2tK/8Be";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qJct8-000430-Lz; Wed, 12 Jul 2023 12:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJct6-0003w1-Cb
 for qemu-devel@nongnu.org; Wed, 12 Jul 2023 12:40:24 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJct3-0004tc-Qr
 for qemu-devel@nongnu.org; Wed, 12 Jul 2023 12:40:24 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1b890e2b9b7so37831095ad.3
 for <qemu-devel@nongnu.org>; Wed, 12 Jul 2023 09:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689180020; x=1691772020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=siw19EWcfZmdOoQY236nImX04rVVHl0kf0GWq2R61Hk=;
 b=c2tK/8BeplAFy+aGmvyFScph37NZnqKeGyG7ExdRTdZNPmVPJkWwUBVv2FSWk4Xr1o
 7wt+R9Pc7NdCswS8hiExqEO1c0U/s/l35Wqhnclr7lKQM3UeUX0zNmdZyz7z2u/2hvnp
 Nyh8GF9pKNTh+MAoHO0vX3fFBEnfHMH3A0+Kam/ZWJ/rArX8VYHTXPEDteQc1woqIoeE
 sEm3q3oAxn9kLyGXQTVcSyi63eBzph4Ba3PteXXB8ae1cflvQ2z3k0WzIAt6hm9s73M5
 Nmjlu1XJ4TmzQueC9V1sDvB3L6KtmMH0/jVPkJrWF9vZzrfvaK5l7t+jojXFxKSqImKH
 hJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689180020; x=1691772020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=siw19EWcfZmdOoQY236nImX04rVVHl0kf0GWq2R61Hk=;
 b=eo6SjORxvLreXKE024xFWHPYs4veV2OloY1SqOClqJiREHNQth2pEZoKwMyhMGbqO/
 vegzDOQp+12Nfau5DxgnvDZynNOtAi4KCBw+gAjEPb9FvZtPObN9iKzAlCjytuK+dXZN
 XlBXvzCvgLnYtfbNDzhcLW5CP07vlpHkgcKBDgl4vCB7mCJBf3aOpxMBMJJL5BCf2C7g
 i8ycfuFfhGnTHxKRcbPcxOfX0Z5/lq/+weIAYMl3PPF/jHmV6C+YMdApSyvzhu6esK4C
 TkauKs6OYWeWV7Nms/eZAlaZMsVh8RRXxCES46hy0tJ+NkhtSGaKDUr0aCzCtwN1d7md
 E0ew==
X-Gm-Message-State: ABy/qLbW3LW1DSCdfNyaCu1gsyC6Q7u0EnXonz1wIlRgg4FyY32YZqM3
 UvXByNpbuo9iGoWdY07usfR5upgYOkO4vE8i/rw=
X-Received: by 2002:a17:903:428d:b0:1b2:46ab:a9e1 with SMTP id
 ju13-20020a170903428d00b001b246aba9e1mr13731489plb.28.1689180020031; 
 Wed, 12 Jul 2023 09:40:20 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.25])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a1709027d9200b001ac7f583f72sm4172824plm.209.2023.07.12.09.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 09:40:19 -0700 (PDT)
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
Subject: [PATCH 06/10] hw/riscv/virt-acpi-build.c: Add IMSIC in the MADT
Date: Wed, 12 Jul 2023 22:09:39 +0530
Message-Id: <20230712163943.98994-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712163943.98994-1-sunilvl@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62d.google.com
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
X-TUID: qT0FjWrk1zUs

Add IMSIC structure in MADT when IMSIC is configured.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 12b8ef0352..ebdc3bffea 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -280,8 +280,20 @@ static void build_madt(GArray *table_data,
     uint8_t  guest_index_bits;
     uint32_t imsic_size;
     uint32_t local_cpu_id, socket_id;
+    uint8_t  hart_index_bits, group_index_bits, group_index_shift;
+    uint16_t imsic_max_hart_per_socket = 0;
+    uint8_t  socket;
+
+    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
+        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
+            imsic_max_hart_per_socket = s->soc[socket].num_harts;
+        }
+    }
 
     guest_index_bits = imsic_num_bits(s->aia_guests + 1);
+    hart_index_bits = imsic_num_bits(imsic_max_hart_per_socket);
+    group_index_bits = imsic_num_bits(riscv_socket_count(ms));
+    group_index_shift = IMSIC_MMIO_GROUP_MIN_SHIFT;
 
     AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
                         .oem_table_id = s->oem_table_id };
@@ -306,6 +318,28 @@ static void build_madt(GArray *table_data,
                                   s->aia_type, imsic_addr, imsic_size);
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
+        build_append_int_noprefix(table_data, group_index_shift, 1);
+    }
+
     acpi_table_end(linker, &table);
 }
 
-- 
2.39.2

