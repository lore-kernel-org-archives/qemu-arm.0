Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp514569ejb;
        Thu, 19 Oct 2023 06:29:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwxVvAyji2DGqZT7FJVrqQ6xfhjTaOSmZhAy/86PDR7Q91fTDPTTGg4DgaD1AUChLlJ2jM
X-Received: by 2002:a05:620a:2786:b0:76d:2725:f36f with SMTP id g6-20020a05620a278600b0076d2725f36fmr1940877qkp.71.1697722158251;
        Thu, 19 Oct 2023 06:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697722158; cv=none;
        d=google.com; s=arc-20160816;
        b=T1iwlDmj+CooI7aFZjwSft7YJWvRB5r7ma0Tk555nOXlxhMBdHHVD23VU3q1yH7AGG
         GZv7Axo92qthb6Xyu7bbX4i2wYE6bNVHdPMGUVfUQ9y1f7bw/gY0L3+toqpVfajmWy6D
         iYcGSohO1gW44Tuz3rVTEORyBiDu9IB2pJ4BH+REw8g66EKCfC3T/mDAKsGppID/AgVZ
         0jQZ2UX7q9XrF3YRCfyfBSF1iOhp4iJoG6cN+Ava03aha86+lzagYBcQFWYEO0XeEsZc
         tpNNuM2jgqjhXG+SbHTAxRLQyOb5J5VW7sXzQto8m8SxFM1EGwn2kd19dPIen/FMIjLg
         qnGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Lbv6Sk5ZH5uzAfxjjvuVIe3nvy5tqV6Y7A+14bnftbI=;
        fh=qS7HOACB/fnzOG4UkP/DQwrsj+RVK26yEZmW8KA6D/k=;
        b=jJvj5QrxORiUx3mwU7zalEiHZHwT9l/sKp1lo8I9sMTCIa9lGiDsVIHkmy26fho4iv
         H7R5uPVTy3IZwp0jEPmaeHXDqV6hdxNu62scfs+mOIom11CjWossvGZx9MGD8DcLr/os
         NDAE4oHY71Tg5nZXKrMkEHWVNqzyEEJ33Xkq8XblOOJN4ZvJhRjJ+MLRputbZSqiko90
         Dl30Kw8DnEufUJ//WImNssMEbwyc4DWkp3kTLuj1EEYT1jIcXJykUFFbGet2xIxiyVj2
         fc5jiXrt2Haoq1XzD5duZG20f83MoKUVD2/Pt7ptFV01hEq/pOPkzR9Lnhpk8ib0nP4c
         KRlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=pPKqVVCC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13-20020a05620a424d00b00767f226bc82si1559588qko.315.2023.10.19.06.29.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=pPKqVVCC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtT58-0006Pu-Nh; Thu, 19 Oct 2023 09:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qtT50-0005UO-Nx
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:28:50 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qtT4z-0007Be-2Z
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:28:50 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-57babef76deso4395610eaf.0
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 06:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697722128; x=1698326928; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lbv6Sk5ZH5uzAfxjjvuVIe3nvy5tqV6Y7A+14bnftbI=;
 b=pPKqVVCC+YyooDYgUGcjkpa1M7lm9YLcrHOQ80KrDe9kggIEaHEj7pM9QssrYvUMMu
 sEUwA7cRT9B7fmZUc0FFbYaL0watM0+pvYC04Elmu9IAaPsebUQeQ6p1RL6xXUPyd50I
 JZewWN7uzXrvUbLER3XBYT98CAn+uQ8C1Zm7mWlMLyUgMfDmAgAvBKbf/AHPbfBobr0V
 okJexOTSIWCZRMsMhP57jU7MyLvyduTl4oW+reXZhaHip4Q7oMzYTTwy94b55nJzut3i
 tREOQ0OITdDpcCP5/fsemfaeEdnpPYYorNo5y8USkYAtkhKIs0pJERQnKXV4hux6W57k
 9RMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697722128; x=1698326928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lbv6Sk5ZH5uzAfxjjvuVIe3nvy5tqV6Y7A+14bnftbI=;
 b=mYYM4r9ESQ8DQmqsclnhYze4WBVTiPWl+N1BXjvtV5GuVHda5fIr2jgHM9XxUCKmDx
 KxT2E0JrH7ciF5bBF8DifAd+KeeZnNPcjz4kYuSHt8exPbioxw3RZ/ExireXOg8jGXsV
 O98gxJ6H5IqjGMS28ajGfpQQ8ld6HH7X9WWZN74A2Fqjutg0gWlhDBcJQRCaZtHsWGfx
 bRzZl76P2BOwevhbks6HcHPpijfmHshrVUy9Ypnw2XN/7yWmfJh9OalYXx0zgJm5ufKv
 tEjUrtqIJ5jte8UsRCKrQFWzEH5h9+9h7mK1dAGsM/P5YhpTNBONJfitVviP4GdWE0xu
 8pkA==
X-Gm-Message-State: AOJu0Yypn56RVegoYIjtK6hFPmwk4iNhlDDYD46ekV9/i2I1gBBQZ5R/
 EVpKgQ/n5e86TDQVmvAfYndYHA==
X-Received: by 2002:a05:6358:9f85:b0:139:9fc3:eade with SMTP id
 fy5-20020a0563589f8500b001399fc3eademr2030306rwb.29.1697722127863; 
 Thu, 19 Oct 2023 06:28:47 -0700 (PDT)
Received: from sunil-laptop.dc1.ventanamicro.com
 ([2409:4071:6e8b:3a98:dd76:4e82:7da6:44ab])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a056a00228b00b0068feb378b89sm5273113pfe.171.2023.10.19.06.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 06:28:47 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v3 12/12] hw/riscv/virt-acpi-build.c: Add PLIC in MADT
Date: Thu, 19 Oct 2023 18:56:48 +0530
Message-Id: <20231019132648.23703-13-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231019132648.23703-1-sunilvl@ventanamicro.com>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oo1-xc34.google.com
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
X-TUID: 8Y1sAqQ9gBZW

Add PLIC structures for each socket in the MADT when system is configured
with PLIC as the external interrupt controller.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 2f1cc92f75..d1761ddddf 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -85,6 +85,12 @@ static void riscv_acpi_madt_add_rintc(uint32_t uid,
                                       arch_ids->cpus[uid].props.node_id,
                                       local_cpu_id),
                                   4);
+    } else if (aia_type == VIRT_AIA_TYPE_NONE) {
+        build_append_int_noprefix(entry,
+                                  ACPI_BUILD_INTC_ID(
+                                      arch_ids->cpus[uid].props.node_id,
+                                      2 * local_cpu_id + 1),
+                                  4);
     } else {
         build_append_int_noprefix(entry, 0, 4);
     }
@@ -513,6 +519,29 @@ static void build_madt(GArray *table_data,
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
+            build_append_int_noprefix(table_data, 0, 2);     /* Max priority */
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
2.34.1

