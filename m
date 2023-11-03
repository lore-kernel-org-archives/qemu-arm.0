Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp813503eja;
        Thu, 2 Nov 2023 20:20:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFck3iQR/W4DDAg4qex6ANiVc6Tr04pe4j8I/V5Scjcfor6MFFK59fM2uhqkcR684PVbED/
X-Received: by 2002:a05:620a:6585:b0:778:958f:4c22 with SMTP id qd5-20020a05620a658500b00778958f4c22mr17941824qkn.45.1698981602450;
        Thu, 02 Nov 2023 20:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698981602; cv=none;
        d=google.com; s=arc-20160816;
        b=M6MFyv1mqTHXTP6ms1onnGR0Jw8AfxC2dy9pc4VT86uec+8ACS1izcjji9dScIrM5g
         wrfOA1CHXjvGdX6Rtwr8KYGWyuVqY+wM5qcpMt4MTlo2E+S0fhbgcu8KhbVcacZgtv0d
         LhFWwoeimuTjpV2jpYtSiJmcDKg5SGVjSTtRa8krhP/DMwxExJGXyH/nbT/yjxR+zOGU
         lgjuCt21uAejdY5FzegvTTCsxO+WoQ7b5v0AfUOx5e3knhSSakv1cHvMw1lJHuZfWST6
         GzVl1pUWcDTw6RpRGGrcepKD8MiWJldKBtAC3gfbE7W7JppA0wXQIM0umIp2xe2bl8qU
         ox4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kEJDi666XlkLe9PxXC5wqKzUtJirne5zNNBfjCv1MRg=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=pBWDjjrrF5pSnCi7RPvTvl0ExMkICpsPCjvTJoBdgn3T+FSdxaFCy4Jm4QwAz6WvgP
         sy7bWnzZlnPiHX4+BjYs0GgIML/AcB/5fQGCDZ4VO9V6tFCa8kwE7a/Jd3culYEmqDgE
         ZI0NKh2bCHaqKMRs8Kv7OW13jRtqyKgADYilhtEa2vfS4rwbwhyqpkM5+9CeerlE/v3u
         2LY7oBjUNKrIR9QkXmXixFE73VLq4ZnChCI+0hTssBmPzpW9hJGCMNDFLo7vv0N6q7Pv
         c89NeS4v3zxxrsXV2nZOJtuNe0H8uYudCmTbU7h6XpBWAJ0taozHVPPxF4j15hzIhqcS
         AbTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=jpR7PIRB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z22-20020a05620a08d600b0076d8bb2e9f9si721707qkz.680.2023.11.02.20.20.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 20:20:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=jpR7PIRB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qykhV-00013w-7w; Thu, 02 Nov 2023 23:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykhT-0000y0-6u
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 23:18:23 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykhR-0004eh-A2
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 23:18:22 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-28041176e77so1469230a91.0
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 20:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698981499; x=1699586299; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kEJDi666XlkLe9PxXC5wqKzUtJirne5zNNBfjCv1MRg=;
 b=jpR7PIRBU4eEUtIYEGwPlWW6sWScules6WHwecnGVz0rd5LuSHo4oKTU+xEYkXkpmw
 VN1heWTH0l7bO3dSZgmVpv2uG/rlI6rU+WPmVEsOMz+Lbwn/y6yyHMfj3QjF9u8wFiha
 PTBF5nOK7Rc/nVcvPMiea7t4R3+SmBzbUHWqiwTA03gleVerP3iZCVg765Xkg7PUdRG0
 CgNAR/EMtJ1EEvChdttlHs/w9NMMT319EI4WJ4h3kG72e+Ly49xSzpY61bN34Hi/npO0
 c5Izw04xDPQuq06b4FJBLPyNjmoUjx3t7+UeTwRhq9xnQ8aS8mJQTxHLbrL3s1tybe/M
 vPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698981499; x=1699586299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kEJDi666XlkLe9PxXC5wqKzUtJirne5zNNBfjCv1MRg=;
 b=aFwAr3fFRVAnkhaVEg1k4oxP9DoZ7TggIMvjGxjmnsfadk5kM9IruycuM3JeWn0fSy
 t+bKaNYWLeNJT7F0jhfIKZ3Q4AqLu6/2MLVWc+KmoyySTcYoruCuXfEW/wro269qnRWL
 o/k0Yo0kBD75+aWPFzouNGXJLajviDW2A0q7zmbc48/nbR8Egktu+xMqr3PhRnleo7+L
 UD+nQz536GdbcVZqmClAuv9DABOjBiVt+00rrBlx9fHGNr46Rv6EEYMNy4KpFHMAowNl
 USTuIJv75EvlzIL8IckmfS+7AjMiUh+MgpzUKPV5Oas3+qd2tYqYOkm3jGjuLGXRByb6
 Cxtw==
X-Gm-Message-State: AOJu0Yw8IgTvidC1DI8c/kAAbw/lJXG9h6tqVmkDFVASQJZ/E4oKKKfX
 SIXXS0/ZmX50wQPl5sFnH2gSCTSmn5Qzu3D2xPhm6g==
X-Received: by 2002:a17:90a:348d:b0:27d:1334:d266 with SMTP id
 p13-20020a17090a348d00b0027d1334d266mr15296304pjb.27.1698981499024; 
 Thu, 02 Nov 2023 20:18:19 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a17090aca9100b0027cf4c554dasm499971pjt.11.2023.11.02.20.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 20:18:18 -0700 (PDT)
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
Subject: [PATCH v7 13/13] hw/riscv/virt-acpi-build.c: Add PLIC in MADT
Date: Fri,  3 Nov 2023 08:46:49 +0530
Message-Id: <20231103031649.2769834-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
References: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102f.google.com
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
X-TUID: hV5drnmKUKjv

Add PLIC structures for each socket in the MADT when system is
configured with PLIC as the external interrupt controller.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
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

