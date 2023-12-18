Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp852675eji;
        Mon, 18 Dec 2023 07:04:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9GDJQ84RhAgzX8Eum3oGo70b2/55fu7lovM6AyQaCLX/+WtyTSsBLs+pOCy1SQ/il6yHC
X-Received: by 2002:a05:6870:a54b:b0:203:c477:7f9d with SMTP id p11-20020a056870a54b00b00203c4777f9dmr956723oal.18.1702911846734;
        Mon, 18 Dec 2023 07:04:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702911846; cv=none;
        d=google.com; s=arc-20160816;
        b=gCebd040t6mCSARgAI1mdPh1EIFKin2rivA8kByeyfzPJ8NAyFxte/k9CWuBAw8T9w
         lgeBCc/STjzAyL4HvGYUR9bGXXLpuMP4JFAwudpLOjfymYFIgvw8uJvPu3z1nz1o6/i6
         ASKT9qOyw1rIUviRFrDPASarh/TP8lCBB5fbNW543cNPhnZ1R9zePgCDEuY5zF7++ISk
         fcYosWDUxGq7qDd+QZJfpz5ngkU79R2gRn76iqLDf4M/kZVVzBvjQzR30mhLeEFRJ2PA
         5UMk2xe1v6y1hI9bHmDs1AK2vgcyL+shKxtiL7Q+D7TlSWsL9vMThhx0M/tWk5lV0c27
         J8gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KcgJ4FRc9yz2b5H8HRo0vnvqFidecDDHMaAJ2DLpido=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=WKXavhOpV3cUdjBhqlnTC6LF2DB3Ab/ZOJRNbGcreKmUVMisa+RTUa92BV8og2VH+L
         bKU/1ZlUfrYUrdB2SxM/INRPyyASSNRL+n/bpD3Sn2RbqQ4wifQGmsKifQhXzBeD5x/J
         T+5s/3ydGGSnsTSNhYOXdFn/nnvHqDUf99r2bOx2BkP/naxsVrwqgJ+BNsTkylkYpRNm
         +6UwNP2CxTu4zOImUpRwYT53e2WWnPulpGsI1g4nEKHAWQ9IAY1Jmjj8VDeH4NYthihU
         /SN9ibTO4A2y4d7JPp4B3boCkUtHhIuDKjUkDtqsGKqRlVQpM/kzpx1o7TdV1OektvNz
         9G2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=lUbMag6p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cd19-20020a056102419300b004649215260csi5092234vsb.404.2023.12.18.07.04.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 07:04:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=lUbMag6p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFF9y-00032B-Hw; Mon, 18 Dec 2023 10:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9o-0002IN-JQ
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:03:52 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9l-0007Fl-Ao
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:03:48 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6d2350636d6so2951182b3a.2
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 07:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702911822; x=1703516622; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KcgJ4FRc9yz2b5H8HRo0vnvqFidecDDHMaAJ2DLpido=;
 b=lUbMag6pAwk7VRDdLk9qs5e6u+yDvUHsmmvzz911E/1Ekc/ATxLpGbGn2aeQhbMg8O
 Zpm/FTUbpDoo3pxJ1Q2btO4RJvrivaPDRifCamsX3HCwKq+3P1u+gAM9SQ/BFYMJxEzw
 KufR63uEpz9SSNH5dgtn9WrT7sLCNhIh8BVgeK8Bsk9xdgBhkN+q4SpOkU9B0sqxxc+h
 qb07Q4TaSxmdWYzg42FKwR6pGNyCWCzY+cIoPXiCd4/SzbE0TEaHP6IMm3299pwcYBop
 CbpZXTk5ogNF4cl0wEstw0qYy1NOoLzS6TXbiqSlMCvcxwCokIdgQmgoRXaCCstetyDA
 jhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702911822; x=1703516622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KcgJ4FRc9yz2b5H8HRo0vnvqFidecDDHMaAJ2DLpido=;
 b=NsKZdwQmBph2To83UWPBOXxJzkIoNRSaz91GcDuDSvxVbYfxCBAEJj6atOPx3iDfj7
 dmvyuUJEuQmqE/fvUS9LEWflJuk+bOulv9vS7hgn8oERdhwQNfc8Joxk5ooEgMeuTgF8
 o+rAnF40+7CsfH3jWfKu4wnTDPhyMbA3CR/3bfm/78Gn5DZi0iaydS0WkkjGAepiwLqb
 24XoA36/59H6oYXL+27yaGqEAIgtxBRuNHOIuvQttFEY2SNvYhJ9N5/yAu74OMGwRX5B
 7P5kQ8N22Jhctve5nzw5TmtVZgn3UGFs7X54V5S6HTBGCNJg8z53c5sVY9wO258+dW0L
 oPSw==
X-Gm-Message-State: AOJu0Yx31hfP/trpmDH+3qlXoYyfyYfOaaXElU9VCcvxGfjpNn2bAbof
 Yl0KcWGGPnK7m6Fzo8GG3Hn2hSv2WIISfKlDwxU=
X-Received: by 2002:aa7:8152:0:b0:6d2:8127:2921 with SMTP id
 d18-20020aa78152000000b006d281272921mr5776019pfn.36.1702911822442; 
 Mon, 18 Dec 2023 07:03:42 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a056a000a0100b006c06779e593sm18975505pfh.16.2023.12.18.07.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:03:42 -0800 (PST)
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
Subject: [PATCH v8 07/13] hw/riscv/virt-acpi-build.c: Add APLIC in the MADT
Date: Mon, 18 Dec 2023 20:32:41 +0530
Message-Id: <20231218150247.466427-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218150247.466427-1-sunilvl@ventanamicro.com>
References: <20231218150247.466427-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42c.google.com
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
X-TUID: 59oQgovTRN3O

Add APLIC structures for each socket in the MADT when system is configured
with APLIC as the external wired interrupt controller.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/riscv/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 6bb21014fd..ec49c8804b 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -274,6 +274,8 @@ static void build_madt(GArray *table_data,
     uint8_t  guest_index_bits = imsic_num_bits(s->aia_guests + 1);
     uint16_t imsic_max_hart_per_socket = 0;
     uint8_t  hart_index_bits;
+    uint64_t aplic_addr;
+    uint32_t gsi_base;
     uint8_t  socket;
 
     for (socket = 0; socket < riscv_socket_count(ms); socket++) {
@@ -319,6 +321,38 @@ static void build_madt(GArray *table_data,
         build_append_int_noprefix(table_data, IMSIC_MMIO_GROUP_MIN_SHIFT, 1);
     }
 
+    if (s->aia_type != VIRT_AIA_TYPE_NONE) {
+        /* APLICs */
+        for (socket = 0; socket < riscv_socket_count(ms); socket++) {
+            aplic_addr = s->memmap[VIRT_APLIC_S].base +
+                             s->memmap[VIRT_APLIC_S].size * socket;
+            gsi_base = VIRT_IRQCHIP_NUM_SOURCES * socket;
+            build_append_int_noprefix(table_data, 0x1A, 1);    /* Type */
+            build_append_int_noprefix(table_data, 36, 1);      /* Length */
+            build_append_int_noprefix(table_data, 1, 1);       /* Version */
+            build_append_int_noprefix(table_data, socket, 1);  /* APLIC ID */
+            build_append_int_noprefix(table_data, 0, 4);       /* Flags */
+            build_append_int_noprefix(table_data, 0, 8);       /* Hardware ID */
+            /* Number of IDCs */
+            if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
+                build_append_int_noprefix(table_data,
+                                          s->soc[socket].num_harts,
+                                          2);
+            } else {
+                build_append_int_noprefix(table_data, 0, 2);
+            }
+            /* Total External Interrupt Sources Supported */
+            build_append_int_noprefix(table_data, VIRT_IRQCHIP_NUM_SOURCES, 2);
+            /* Global System Interrupt Base */
+            build_append_int_noprefix(table_data, gsi_base, 4);
+            /* APLIC Address */
+            build_append_int_noprefix(table_data, aplic_addr, 8);
+            /* APLIC size */
+            build_append_int_noprefix(table_data,
+                                      s->memmap[VIRT_APLIC_S].size, 4);
+        }
+    }
+
     acpi_table_end(linker, &table);
 }
 
-- 
2.39.2

