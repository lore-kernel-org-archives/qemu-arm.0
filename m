Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1863775ejc;
        Mon, 30 Oct 2023 06:22:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFESp6wtyGBHsxiyBzMFs/JDGjSb/9MsGgG3fjRXQED+/4QUZp5ZZqQVHYASJG96ypSwJjM
X-Received: by 2002:ac8:7c50:0:b0:41e:3af0:a4d3 with SMTP id o16-20020ac87c50000000b0041e3af0a4d3mr12372645qtv.32.1698672127852;
        Mon, 30 Oct 2023 06:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698672127; cv=none;
        d=google.com; s=arc-20160816;
        b=fwVRLwiKsYGh+C4Oiw+IEbazpoKtoC+fcOr7FenTAdyFz70La+vIwgb1sBNZrIliYW
         4O5PkUTR4z6QkiRK55wKG+EIcB8ng51YNNq23xDsz+ihB18uW/Mr7hyn4+TgDtDChCJa
         tdiHXMsu3MhLyaIDX2L6+msjB95dlBbPCw4BHlRHqgDSIlG3FiM7CcZHYmVgsxTar+u4
         pSu3y6IGJeCOYeDoSGQFiGzXvfuPqRLrQ9wf1sg9rtTXH6st3hp7FXXpZVMjXxNDuxQ4
         Xmg/yWtgEJFUoCyzetL4Nng6if7cQxj/nRi3XZECe9nj+RW0ZaoOyN9CA5j6+sx4g4fg
         CbEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3MxEnwCcrzZXPmJ6j2nD9uSFRJXenxo4trg/FCDg9Lw=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=KQiainFWXzHB1kauYR1mtsN4xok/D+mOT9NLOAt5T/PuViaNol7xF4ndP5CsGA+AJb
         mg0JG6xZl8i5/g7JY1BkJmWKGpv2vKKvRkXSHCvUNCDezVBbaMNYHD5JfyY42NNLrlmU
         iU2KAJnlK0Zh9wncKSG7jfYhul5oTkelezkA1kil+y3vbfKZYihI+0ZioY+SA4PBnvF3
         GkYttqKmlpXkwi1zHiqEcVJ9ryscN5NTKViLEJCqp8c5RGnt5v6KuCaPuAx7e6pjla4j
         0yN0LKoSENhMe4zJ+eFvbfO1PWJ1BTUKn7ZCShbWjA8eue/JTfIJ/ugz5JjY9lJvZOBX
         2rWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=iQ8rYoxx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9-20020a05622a050900b00419894fe568si5573974qtx.343.2023.10.30.06.22.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 06:22:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=iQ8rYoxx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxSD6-0006lR-1c; Mon, 30 Oct 2023 09:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSD4-0006kb-4B
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 09:21:38 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSD1-0002rp-8x
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 09:21:37 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-564b6276941so3524224a12.3
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 06:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698672092; x=1699276892; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3MxEnwCcrzZXPmJ6j2nD9uSFRJXenxo4trg/FCDg9Lw=;
 b=iQ8rYoxx8JAUnnEqzI2wu6a64DKimwaCWnnmdxpU/invdkfHpAX/eQ0xHEnFn48dDp
 1raZlhHcpqPyBtsT9Wx6PU5Cyiqi+sJGkbhan1VEEKIc3jeDIsVSrhP1eTeKz8CY+RjF
 iVdV3tLuYnsgR7PTNRFwny8ivPhYb1rFWQcxRp+wvuyao4l9ZZrjM/FjUhpQxYPluyGm
 FKQKH9duZO3MXIKyWOOT2dCSfHGrXHp/GmH0uCVd109gpsLmSCjmBlhTvTakKWUKQM1j
 b+0t/RGjP21VouOsAjnu5qvSTzPYXP+e0IeKmTbi3HkLBkYJYAJCg+D2O2Bkyz+TP45d
 uEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698672092; x=1699276892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3MxEnwCcrzZXPmJ6j2nD9uSFRJXenxo4trg/FCDg9Lw=;
 b=GyZqgw9TVG4jD3TjgUhjNb5+oB1qizP0h0uRZRUkOoc1xLF9jNNGcIVB1JMnqGtMhm
 NCkrgtQ0IJmTNEhGnJ+fhePA9rCNB50uA9oMrI1v83biGTysU2AGqk9ijQQeUcZImMO9
 /UKy8xdhfRrbh4noL8BtY1yj+Fg6BXANvz4ADJAvgcX7ABsUbZPDLOa3UcWwoHWrU6Ir
 xxXaNrXdQNm3p35p+KKj2DjX4JsNZIgcpeGrxzbp4AUQf4h00S0DPhKxL1B0TdJOrgCJ
 CbduZJ5QrinelDyDybf8FiiV1lk9Af05munDn90+N10spbgtJJ8KHdISgtpramcNfH2Y
 +oJQ==
X-Gm-Message-State: AOJu0YwPDws0EBxnua5wZj4U2OLt18Kr+TVwvib2O5ZxaKPAYXTCK8eJ
 tb7OLvYS+PLcNX0v5Icyxtv2/rTxMtHedWHUcRozkw==
X-Received: by 2002:a17:90a:28f:b0:280:1d67:16a6 with SMTP id
 w15-20020a17090a028f00b002801d6716a6mr6143828pja.34.1698672092478; 
 Mon, 30 Oct 2023 06:21:32 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 15-20020a17090a000f00b0027ced921e80sm8122412pja.38.2023.10.30.06.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 06:21:32 -0700 (PDT)
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
Subject: [PATCH v5 04/13] hw/riscv: virt: Make few IMSIC macros and functions
 public
Date: Mon, 30 Oct 2023 18:50:49 +0530
Message-Id: <20231030132058.763556-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030132058.763556-1-sunilvl@ventanamicro.com>
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x536.google.com
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
X-TUID: eP6LC1IS85em

Some macros and static function related to IMSIC are defined in virt.c.
They are required in virt-acpi-build.c. So, make them public.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c         | 25 +------------------------
 include/hw/riscv/virt.h | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 1732c42915..085654ab2f 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -38,7 +38,6 @@
 #include "kvm/kvm_riscv.h"
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/riscv_aplic.h"
-#include "hw/intc/riscv_imsic.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
 #include "hw/platform-bus.h"
@@ -54,28 +53,6 @@
 #include "hw/acpi/aml-build.h"
 #include "qapi/qapi-visit-common.h"
 
-/*
- * The virt machine physical address space used by some of the devices
- * namely ACLINT, PLIC, APLIC, and IMSIC depend on number of Sockets,
- * number of CPUs, and number of IMSIC guest files.
- *
- * Various limits defined by VIRT_SOCKETS_MAX_BITS, VIRT_CPUS_MAX_BITS,
- * and VIRT_IRQCHIP_MAX_GUESTS_BITS are tuned for maximum utilization
- * of virt machine physical address space.
- */
-
-#define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT)
-#if VIRT_IMSIC_GROUP_MAX_SIZE < \
-    IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
-#error "Can't accommodate single IMSIC group in address space"
-#endif
-
-#define VIRT_IMSIC_MAX_SIZE            (VIRT_SOCKETS_MAX * \
-                                        VIRT_IMSIC_GROUP_MAX_SIZE)
-#if 0x4000000 < VIRT_IMSIC_MAX_SIZE
-#error "Can't accommodate all IMSIC groups in address space"
-#endif
-
 /* KVM AIA only supports APLIC MSI. APLIC Wired is always emulated by QEMU. */
 static bool virt_use_kvm_aia(RISCVVirtState *s)
 {
@@ -512,7 +489,7 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     g_free(plic_cells);
 }
 
-static uint32_t imsic_num_bits(uint32_t count)
+uint32_t imsic_num_bits(uint32_t count)
 {
     uint32_t ret = 0;
 
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e5c474b26e..5b03575ed3 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -23,6 +23,7 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/sysbus.h"
 #include "hw/block/flash.h"
+#include "hw/intc/riscv_imsic.h"
 
 #define VIRT_CPUS_MAX_BITS             9
 #define VIRT_CPUS_MAX                  (1 << VIRT_CPUS_MAX_BITS)
@@ -127,4 +128,28 @@ enum {
 
 bool virt_is_acpi_enabled(RISCVVirtState *s);
 void virt_acpi_setup(RISCVVirtState *vms);
+uint32_t imsic_num_bits(uint32_t count);
+
+/*
+ * The virt machine physical address space used by some of the devices
+ * namely ACLINT, PLIC, APLIC, and IMSIC depend on number of Sockets,
+ * number of CPUs, and number of IMSIC guest files.
+ *
+ * Various limits defined by VIRT_SOCKETS_MAX_BITS, VIRT_CPUS_MAX_BITS,
+ * and VIRT_IRQCHIP_MAX_GUESTS_BITS are tuned for maximum utilization
+ * of virt machine physical address space.
+ */
+
+#define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT)
+#if VIRT_IMSIC_GROUP_MAX_SIZE < \
+    IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
+#error "Can't accomodate single IMSIC group in address space"
+#endif
+
+#define VIRT_IMSIC_MAX_SIZE            (VIRT_SOCKETS_MAX * \
+                                        VIRT_IMSIC_GROUP_MAX_SIZE)
+#if 0x4000000 < VIRT_IMSIC_MAX_SIZE
+#error "Can't accomodate all IMSIC groups in address space"
+#endif
+
 #endif
-- 
2.39.2

