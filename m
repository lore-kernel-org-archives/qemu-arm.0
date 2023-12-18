Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp854234eji;
        Mon, 18 Dec 2023 07:05:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgRVMrc/RC2nav3q17ZCQeZWf3j03W/NGSai87aqW9XTgVFKrLaR0jvRCpsSwtjVdk7t1K
X-Received: by 2002:a05:6808:191e:b0:3ae:251b:5552 with SMTP id bf30-20020a056808191e00b003ae251b5552mr20896473oib.12.1702911941172;
        Mon, 18 Dec 2023 07:05:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702911941; cv=none;
        d=google.com; s=arc-20160816;
        b=OBt7IPpuqNp+cw1GmtIu0J256BIA3xZMCLF6ZgKJ7zcAaiZ5mAR9fkwQ6jiN4POBAv
         XHQ9Jv7h8MaLsrAdCPXXs5GUQhEKsqmXpTQ6eGUNtk/dmM2dDbxceOCxHVe3jd6Du7d+
         R0QLmcuStiu72iDptc2r6nzKFazE+QHSVEFQkRSznAtcf2gkOmar4RTewuiMXo5EzQSL
         uEjzRXXk9qPKsmSBxybq4+Cc4KQ+m+rXHS1ez5Fkx0ov+cyi3sgPFT/rknejMIZVjXqh
         aNt+t1VGith+GqS+NF3HTidOwbSJfSOPHb2w/6EprIVGepvryAGxwhAc8ARlFzw63jmO
         0NyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BsgIu9p85jZ07rKaDYYcGl5EF2P5MOIWw3LEVA7+ZiY=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=RV3h9xOS8//gQYSCP6cHbgKAHtc4eDENZEDDU+m65vkRgreL/h6K/GXWsqWs6PM2AN
         7WP3WtjPprvJ59Nw44UVc/F9dQK488tQbGdQPnJ5QBT5186DKAk/nvxAqHgNRoW6snyU
         MWTBrU/KVtvaidGiivKSmpHY7Uhep2Hzf615E9SrrVzGmrS7AD8zZ9UHcXMMr3K8+Yeg
         UplubZyaET+ZVHQyoBuzAjtqwlvpPTu+cq1AhGfMzjOyIGoDZeKx9ICyb3OWZonnInyF
         VuqNwYRKlMKy1wy5jn5B0D2huBzRGjyl99s6OE31oyQWd9WxoFFyIweCyBaIEVVqguq5
         g97A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="i3oz9Ic/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4-20020a67e8c4000000b004669c16668esi213721vsn.725.2023.12.18.07.05.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 07:05:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="i3oz9Ic/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rFFA2-0003J4-Il; Mon, 18 Dec 2023 10:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9z-0003AT-M8
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 10:03:59 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9w-0007Hd-TO
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 10:03:58 -0500
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6d66a0d10dcso640378b3a.0
 for <qemu-devel@nongnu.org>; Mon, 18 Dec 2023 07:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702911835; x=1703516635; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BsgIu9p85jZ07rKaDYYcGl5EF2P5MOIWw3LEVA7+ZiY=;
 b=i3oz9Ic/GVc1QGUbMfmGNWRZxHNlDf3u4njTEuUzPEwk3g4Z4pn3dHju6QmYuVf+OU
 hqs+w20hMeCsZKFZQpKTAiTycCZ+8ROPB/UECNE2EZKpxGgbIsVHhKmZBNt6feJPJZEV
 69G7vP7bZgSSgxmmnCt5DDZO+1+0bkc9MSHokW4HxZScOIKuPHgaUCb5tJLsdZL7SJtQ
 3CSftKVrARhGXD/iUJ8cUwx1j4KM9MeqgnVZcNp1uDPK63FHrd4mnbzv0XcIOrtQUf3E
 ZrBvuvS6QI/0T/NPgF6ozVX/bPz/5DROLy5Z4I5eGp0YJs/AqY1YrXOOz2Cy97vwMXtW
 5dvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702911835; x=1703516635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BsgIu9p85jZ07rKaDYYcGl5EF2P5MOIWw3LEVA7+ZiY=;
 b=dzrxL6L4jPP7DdxAdWLFPQbsoNIEeJTaXTYwn1K6lW7RMjZ+uwrA0EpOCITFjaCZ9J
 s1xg/o7/XisLiTgKSzTJQZHx9ieA/U2XtIsmc5vz38+XoKes6oGmeCFiqQslZVqDpDI0
 I71Z8gSr4y/APLmEO5XK2gO+DS9HTsR7SZm35gTsSwOjX49EuXLM8AvLvPwj72MJrQS3
 NoEJk2b5llFbO1t86KUCdh8ji9C8gyP1TcX9OPPBqF4IPHnaDPTJwCJyK+WKfEUmIPpg
 ZS1B5KOHJ6fq6EdMgBK0z8lxVzSY1ja4nptNjAGPKwAgi243SZAOaau6tLErHcphUERW
 38Vw==
X-Gm-Message-State: AOJu0YyjvJ1F52LXfy0gkuVRthwDniVBHzcDO7cb9ldlkvitS05C+pRN
 yhO81CaNtKMs5S5xonYdAQNd3g==
X-Received: by 2002:a05:6a00:21d3:b0:6c4:cf33:cbe8 with SMTP id
 t19-20020a056a0021d300b006c4cf33cbe8mr9258285pfj.6.1702911835213; 
 Mon, 18 Dec 2023 07:03:55 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a056a000a0100b006c06779e593sm18975505pfh.16.2023.12.18.07.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:03:54 -0800 (PST)
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
Subject: [PATCH v8 09/13] hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
Date: Mon, 18 Dec 2023 20:32:43 +0530
Message-Id: <20231218150247.466427-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218150247.466427-1-sunilvl@ventanamicro.com>
References: <20231218150247.466427-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8rcJLQjsr+pX

MMU type information is available via MMU node in RHCT. Add this node in
RHCT.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
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

