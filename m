Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp854565eji;
        Mon, 18 Dec 2023 07:06:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsYSt59NntL23a5HHT4/FBg0rcTsVdP5Hq7tg9QHe+TbjMxyc7RCAQSsJvslo1M5N1OGcc
X-Received: by 2002:a05:6102:954:b0:464:4086:65c6 with SMTP id a20-20020a056102095400b00464408665c6mr6240860vsi.31.1702911963640;
        Mon, 18 Dec 2023 07:06:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702911963; cv=none;
        d=google.com; s=arc-20160816;
        b=zLXvKRSpWp4QLDUIsFaPSYQCgBNCplQ+X5RHvAfMgTspwqXCqqbuI+aSQzXvsS6lCF
         ryNHr3mDwI+MDKNElQ+wIvZ/tLeP1drHoTdy6M8a1tRE4DngiPNSt0uid/KVWUWdunni
         6jajzwpLKFAWE6B34ozGMwc4ojhEX+z5/vBlbTp11X80Z2dgU31q3ZK114OCU3g0PlVh
         d5rdIe+85BO3fTTZg4ZJVVTlVbU6bs8LB8MqXMKnEDp1Z/YUC7Dzox4Dh6nq4wq/xPIF
         awsyutLd0whOwVJRoqgFHyTnqy7EzFBPfhs829tYbLicBNO1bnpvq77ZQOgFPskZHtvF
         OMNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kEJDi666XlkLe9PxXC5wqKzUtJirne5zNNBfjCv1MRg=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=Qk+2aYOuJMmJoWpO6ZrXCseXg9kCyQLD2eDU0Ce1JJFywsBrVRcLN18Rnt9AKJlU1K
         l413VsYXUvuc4mlfpP3kxVTMbc/j8d//E9ZPdXayaXOdk/hKxC9EKiKYZlDGnxaSb+rL
         EoJ7jm9o/uUgEFTd0ofSS3TebMV//Zow2FMD0np2Uw6iAuwuNnZeb/f2rFOTTPKH389D
         pW/uqWjamAViA4QNxPnoK8DQEFxOA9QzPWNjr6a94n6ZVhBAKlkVHMcKPPbi7VP8fW7F
         3BctnfyrnDNRQnNznmWC9PhU1YeApO7aT680sNf07d4tubGEJow7gftdOuOqmAWUTW7g
         ye4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Yw9cVLqO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b16-20020a05610222f000b004669f8ad526si141702vsh.739.2023.12.18.07.06.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 07:06:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Yw9cVLqO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rFFAi-0005L7-3q; Mon, 18 Dec 2023 10:04:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFFAN-0004gI-FA
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 10:04:23 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFFAL-0007MI-MB
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 10:04:23 -0500
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6d728c75240so1120012b3a.1
 for <qemu-devel@nongnu.org>; Mon, 18 Dec 2023 07:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702911860; x=1703516660; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kEJDi666XlkLe9PxXC5wqKzUtJirne5zNNBfjCv1MRg=;
 b=Yw9cVLqOM29+C7gLL9mdlz1gS6xMzSH9ub/LIH8oKpFx44Bpdu0z4PFzXhL9bCUBpf
 fGHrmKn8qBahc+jkK3cbZUB4O2hW1uPZR3TxGpEPBLyo3dotCmXrXDzw5qMXldNjF1kx
 zLCsArbSPnjWN6h+aACAfY2u4MGcRaX5nzmqk4Y+ZNz+qvjsEx/9ksvkclGLF7DXHj0c
 oXIADUH7XHq7goEd4tkM/OGTiVBCbO9bOy/pgDwCVN/rdV0Pxwbz9K0jIUZogwrgu1Q+
 AQjRfzfsBhfM1TqfmxXbtmwhy6JAyEs+QjdSe52Gfes/cjnRb5iftIpJI9XuJZAIVzEG
 xvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702911860; x=1703516660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kEJDi666XlkLe9PxXC5wqKzUtJirne5zNNBfjCv1MRg=;
 b=vTExyIUfMscRxh7YKkMvOB7IVHW5CyfjOoc4y/XhECHANHfUV8LTbVRX88QqW9PRBE
 4Qrg35qVf/axyWBshQ8fE+zRo0pNeTIiuqxyTTq55X4o3PKzOHFsv/D+8DqnHbzpMcHx
 z/wzliL3g8zzdZpQQ5B9Ny5xbp+4kG6u7OVvvCL20vyDdnYY8NS1qgAjpOQxA+6HCgMa
 iYTYA1n1i3P+DvYF9Ptsqx1SnlevYHh47v+Rh8MA03FFP17BrJK/8Thp6WDlG9JXf4Q7
 BlStdZ/MIZRvCaEkseQSb1r4Gre3VlU5CxBrtVZ3wRHzczxwuyeNzwT/0JfwWxzYcjPj
 3/iw==
X-Gm-Message-State: AOJu0YztqXnSIYspsgNoAIeN7UNsV0ZMq1VmOcjRU5QKj+VHBYK4U5MG
 Rp1+oWy7RHgo7oVRCPh665gyOA==
X-Received: by 2002:a62:b410:0:b0:6d0:d46f:8f8f with SMTP id
 h16-20020a62b410000000b006d0d46f8f8fmr9509670pfn.2.1702911860366; 
 Mon, 18 Dec 2023 07:04:20 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a056a000a0100b006c06779e593sm18975505pfh.16.2023.12.18.07.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:04:19 -0800 (PST)
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
Subject: [PATCH v8 13/13] hw/riscv/virt-acpi-build.c: Add PLIC in MADT
Date: Mon, 18 Dec 2023 20:32:47 +0530
Message-Id: <20231218150247.466427-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218150247.466427-1-sunilvl@ventanamicro.com>
References: <20231218150247.466427-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x432.google.com
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
X-TUID: egZNn8h8pVLM

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

