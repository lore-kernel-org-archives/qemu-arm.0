Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1864570ejc;
        Mon, 30 Oct 2023 06:23:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLmlsUMG5f5CjyhgwSn5abjD+8jftoflxkUtWZ3qG2tHy3GornGNjKTaQt1nfH9ZEigwiC
X-Received: by 2002:a05:6808:bd4:b0:3a9:e8e2:57a7 with SMTP id o20-20020a0568080bd400b003a9e8e257a7mr10350130oik.53.1698672201222;
        Mon, 30 Oct 2023 06:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698672201; cv=none;
        d=google.com; s=arc-20160816;
        b=HhUqAl6UK0DRseDePTQwJ/8BB1cShn1xo/s28BP9jnk9HX6t/bB4mPbb3XOfko9BgH
         6pIm2eA5aRBl3EaAumtZ3RGMdjB9YjdVJffVUbCxg6KriBA0gqdhcltPtAJrfkT1t5yw
         YB7qLqxVXB5yXhXBeqFX/hSRe5bzo4/U4t6F9OoyZOBTt+ojCbqxgsYWeu1dHEW+aLH1
         lhjYaDKtkiB0lORX7/rYXjxIF835J7HyUb6gy/0Suz2MikgbpWGN9e13nPNDYwsVuMTq
         hhq+ml7m9EKQcMwZwB8+OeFsj1RZRkVDuu12trwGzQVSyLC3Os0PFs0uC4+v97Fbi7ml
         +xvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2ClCKii7oO8Jb+60noegclT3zC+MTWH46ePT9qOzRUs=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=K97/i4EE6NQstxW91BDDjgFe29fgaAyF6kVTMH7KEGBEDcERTAaRAAH6Uos4d91hPt
         kv6peZ7FkJXp5CtmEP3wUCzX3leveUcfRuvSR84ykCLRfzRFrVcu0R3UNtTpLzFeAhWX
         nZldyXjvjWhvrfm3wh5sAjlyYniGCfsKJKwss1F9XQ2IuP4Ado1FY2zGh5bSe0Vl+K9X
         te92X2yGLu65EpuUY8sCseW2M85hwBtgwDRLQ+vbvFCU3RTgwBK0F/kWJ5AU7rXu4Fq+
         A+FrF17euQeSf8zPlkn4PqvowBaCGz7Hev2LGLEWl/cz2Wo3BQ+xpXrVPYjEQwZWPTVA
         AwyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=GyD8UbEV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5-20020a0cd645000000b0067089696293si4474725qvj.245.2023.10.30.06.23.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 06:23:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=GyD8UbEV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxSE0-0008Iu-Id; Mon, 30 Oct 2023 09:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSDy-0008Gx-5z
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 09:22:34 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSDv-00030G-7S
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 09:22:33 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1cc1e1e74beso27183095ad.1
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 06:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698672148; x=1699276948; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ClCKii7oO8Jb+60noegclT3zC+MTWH46ePT9qOzRUs=;
 b=GyD8UbEVtnHWcl34FzjTjFtpwzPHxjltG5eCHR15Hdw9scTjTTWJ0xIRPibLycIN6c
 iyeEJGjqqIQ6/DKuE2Imi4MMGRjZU8zkdyxs40eyxcx8WzyJOv3MQz9xeJanevbrJHWb
 BZJMJQT0jkQ+sfmJXMNhylk6cRKNtZJ9NyVMt3ApB6wUm6A3R86+DM7PRA6ystsQiUCv
 UdAfepUYbwMryN1JFKjVsTykw+veLOnhT4oDtOwhY2oaMJ7MZDAIAGSlO8x9vqkfuD8b
 owGc775gBIuvlRh0OcYbdGqW/VZcw6j864sOak0hFLZ8QENAQMhFTDkwe1V2b5eYJQnd
 Z4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698672148; x=1699276948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ClCKii7oO8Jb+60noegclT3zC+MTWH46ePT9qOzRUs=;
 b=YlHcEuu60Qlvmp9hJfxEWkSEHuHhckOubcl2T+5F0cGsOea+7Q5QuavIwLIeuTQ4Fc
 84iGI+0H7kiqk85cWcYUDEJ/bjfe8oXvUMS7emUdxaSgAs1qIgYqZ3iW+bkLNdSqxayZ
 nKIJ9jSO5aPhJJRV9YoTfZHpd+MsnJxdEDkwi2aEQBfxAPqYJPxByTMo4khbRyZtHcwR
 3zN2+Y+7ZUNyvw7Pdb2oq41Tz2RqA2jfw6uYT/rpwBR0QAmcj/XvE/nC/knF5fwTIVXe
 l9DXiohL+pBuocUiJVcwPzjgMha1TkjiOOTPbGHKLfiiMZ6qipyeaIYvua2J8VQbMo+v
 SqWg==
X-Gm-Message-State: AOJu0Yxb2Dg4eAULOGWzdtEARmA80gWZromNpbe2IRu0JFZHQ1gf8Pef
 a/7bJMNyP1Nq+LCOhdcx1HrtaNYiDOSD6cSEdUy5xw==
X-Received: by 2002:a17:90a:ac09:b0:280:19b8:83a6 with SMTP id
 o9-20020a17090aac0900b0028019b883a6mr6525499pjq.13.1698672148053; 
 Mon, 30 Oct 2023 06:22:28 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 15-20020a17090a000f00b0027ced921e80sm8122412pja.38.2023.10.30.06.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 06:22:27 -0700 (PDT)
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
Subject: [PATCH v5 13/13] hw/riscv/virt-acpi-build.c: Add PLIC in MADT
Date: Mon, 30 Oct 2023 18:50:58 +0530
Message-Id: <20231030132058.763556-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030132058.763556-1-sunilvl@ventanamicro.com>
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: hWzmGh0qqh2W

Add PLIC structures for each socket in the MADT when system is
configured with PLIC as the external interrupt controller.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt-acpi-build.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 4d03a27efd..d4a02579d6 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -94,6 +94,12 @@ static void riscv_acpi_madt_add_rintc(uint32_t uid,
                                       arch_ids->cpus[uid].props.node_id,
                                       local_cpu_id),
                                   4);
+    } else if (s->aia_type == VIRT_AIA_TYPE_NONE) {
+        build_append_int_noprefix(entry,
+                                  ACPI_BUILD_INTC_ID(
+                                      arch_ids->cpus[uid].props.node_id,
+                                      2 * local_cpu_id + 1),
+                                  4);
     } else {
         build_append_int_noprefix(entry, 0, 4);
     }
@@ -494,6 +500,29 @@ static void build_madt(GArray *table_data,
             build_append_int_noprefix(table_data,
                                       s->memmap[VIRT_APLIC_S].size, 4);
         }
+    } else {
+        /* PLICs */
+        for (socket = 0; socket < riscv_socket_count(ms); socket++) {
+            aplic_addr = s->memmap[VIRT_PLIC].base +
+                         s->memmap[VIRT_PLIC].size * socket;
+            gsi_base = VIRT_IRQCHIP_NUM_SOURCES * socket;
+            build_append_int_noprefix(table_data, 0x1B, 1);   /* Type */
+            build_append_int_noprefix(table_data, 36, 1);     /* Length */
+            build_append_int_noprefix(table_data, 1, 1);      /* Version */
+            build_append_int_noprefix(table_data, socket, 1); /* PLIC ID */
+            build_append_int_noprefix(table_data, 0, 8);      /* Hardware ID */
+            /* Total External Interrupt Sources Supported */
+            build_append_int_noprefix(table_data,
+                                      VIRT_IRQCHIP_NUM_SOURCES - 1, 2);
+            build_append_int_noprefix(table_data, 0, 2);     /* Max Priority */
+            build_append_int_noprefix(table_data, 0, 4);     /* Flags */
+            /* PLIC Size */
+            build_append_int_noprefix(table_data, s->memmap[VIRT_PLIC].size, 4);
+            /* PLIC Address */
+            build_append_int_noprefix(table_data, aplic_addr, 8);
+            /* Global System Interrupt Vector Base */
+            build_append_int_noprefix(table_data, gsi_base, 4);
+        }
     }
 
     acpi_table_end(linker, &table);
-- 
2.39.2

