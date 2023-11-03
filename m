Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp813124eja;
        Thu, 2 Nov 2023 20:18:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2TxkpygZkcXzy9NJhmA8eAu4KWeH7ZUWPBg3XQcf2DyCu6ThIR90EXBonBpPTHDj6XAIp
X-Received: by 2002:a05:620a:4551:b0:777:5044:8c2e with SMTP id u17-20020a05620a455100b0077750448c2emr24403788qkp.9.1698981533713;
        Thu, 02 Nov 2023 20:18:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698981533; cv=none;
        d=google.com; s=arc-20160816;
        b=joTE6uKf644PiWdFZXzvcp3rghhVdhQxP25Mp3nDRnTKIe9Rb0tvFPFXjYUFtQvtq9
         1/Cge+yfRXVQ4imO2Jw2Lh9PHzv5Okc/MxMipHjdaIc4m5hfsykpD5XWpPzga3oLpqYa
         ybPuY0oOXXt6G4bHeGyW1MbR89HoaYm2LjUCisS/kMhW2A2WCAfmgP2zKsKITLok8mem
         Ygk4j7JfEI2gzV7rhr/BeSRynKrR3FAOl25HFBaErBhdPVhqLVGL8HCnNwCWGn4yYjlm
         uG+H7C6NmB/QhiiVL0qbXGawgIe3S+6RXdqHtfN01We9TiTMqA9KihowIR/P7f3Epz1x
         zTlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PB3DqcYgnFgdIBTb4dftT5adpHcIIMTtv2wlN9XjGFU=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=gsTCiiWDxxO64E7DbscNTgQ3cIZnn4iDc4tRljokGGJr3QEM5HNUhnpW4TqERqgIc3
         r4EzTlcy49BGBEO0CLl5abDa3vaFiRhsPUjShohm2oWGQJgPqkjSJ71iabFKIi/yTEfI
         PZtBBHj/jCIbY80r1HH4epmqTeMpz8dpt4PhExXeLZYt4CVaRodN17aiIpWAZrki7b4A
         0LZ29v5lndBPnmsurIksl2Ldyq1LB7BSHAZj/uFrBgjDKjWyE2Mhi1I3PpFiIx/fp2so
         jOk238AvKjVjrWR0wu37xofpplwLSRw7Zegw7crQ6gbeqg2JlEo8zegLy5fIKqZ4ls3x
         v1Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="hLdmXE/G";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qz6-20020a05620a8c0600b007770bfd4044si748742qkn.459.2023.11.02.20.18.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 20:18:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="hLdmXE/G";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qykgo-0007vM-Np; Thu, 02 Nov 2023 23:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykgn-0007v3-84
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 23:17:41 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykgk-0003yl-NR
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 23:17:41 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6c32a20d5dbso1338756b3a.1
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 20:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698981456; x=1699586256; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PB3DqcYgnFgdIBTb4dftT5adpHcIIMTtv2wlN9XjGFU=;
 b=hLdmXE/GWM6snST8lljGemvvA9jlnDz6DMCu/PEkUZZAJFyKCrk+KG4dCo8sowu7TS
 KF3lbm7BEIg6aDcXThTFb8M+e3PiD47GrXQRSuu0nCW/IjCF7oOib+pjOBASu3vFAnpY
 FENr8/mg+03vsH8cWMFwca4/zRd5L962V5zLYc/ySavb3S7OLGBRld8pr/7vWGt1CPd3
 zH2ghuNvlH+gQUUkPGG85YJR1wnQQkdx/PJz1PW6ALgBBQztVh/Q7365ciic9J/IZAd7
 W3FLHDGJF77ffun1/5u6Hmidpaw8DYKG9UFJ6Vg9NP3vj7o8mcDPxUV4YEbLL5op4aaC
 5LHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698981456; x=1699586256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PB3DqcYgnFgdIBTb4dftT5adpHcIIMTtv2wlN9XjGFU=;
 b=jvuyDaKIjtmeFN0s+ZboneBNPi1i1d8vVRfnnFPT0G6OCDXJxwKo+3exsV6z57SAJY
 YQZxeEmHmaVM5aPf3ktffsIvIdR3OopnN4xCSYWHJywTSvYcAKN9E+GAm0fyDbHYWM4+
 QySWZAcODQReNZhdGiYOU5kK6gqPfjvMF43SI4ZXaCpUaJpEYmtoaxaVnLvmIxKe1IEh
 wkI8KuE5sJJp5yZLgZMPicYz0UfntiqMhr3DpSrWqSG4f9Hf1Ja9GBF7ipN86mCqK1IK
 HNaqVLHwmKm9TGUPsnCXNlX4gJrV65gSuafN/migMyxcAuU7NnKBn71tHvkNK/BsY0FW
 fNGw==
X-Gm-Message-State: AOJu0Ywt+K9GkdhpWvuCZVfy9GN8f319weOaDtaJT49lV1EwouU1Hab9
 eU7JYBoE+tXOyhS/UjjXQkxNNAFub6qzDpVNBEuKLA==
X-Received: by 2002:a05:6a20:4426:b0:181:a9b6:8897 with SMTP id
 ce38-20020a056a20442600b00181a9b68897mr3883958pzb.28.1698981456504; 
 Thu, 02 Nov 2023 20:17:36 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a17090aca9100b0027cf4c554dasm499971pjt.11.2023.11.02.20.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 20:17:36 -0700 (PDT)
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
Subject: [PATCH v7 06/13] hw/riscv/virt-acpi-build.c: Add IMSIC in the MADT
Date: Fri,  3 Nov 2023 08:46:42 +0530
Message-Id: <20231103031649.2769834-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
References: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42f.google.com
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
X-TUID: Pohvxzu2ebTT

Add IMSIC structure in MADT when IMSIC is configured.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
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

