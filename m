Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp745483ejc;
        Thu, 24 Aug 2023 07:36:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp4O0KijKggB7LEEE14QQx0M8iGiqhrLrlrK8ppYSCkSbm/PVT6IxZ+Kly0f+/cQqMryEt
X-Received: by 2002:a0c:f18e:0:b0:647:3387:fe37 with SMTP id m14-20020a0cf18e000000b006473387fe37mr18723108qvl.20.1692887810280;
        Thu, 24 Aug 2023 07:36:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692887810; cv=none;
        d=google.com; s=arc-20160816;
        b=QLzM+8mwqoQ8M2qpx9lDsLzdXepmNd2Y2GemkD7aJGOtSeSFatTC/MYCSK55MnIPuL
         LPd2nsQkSZqLT4Z9wBvsVgAsCNNqiMAF14Q/+2sPAszVBn5ON4KM6f3Agit1Fn2JA9Uq
         3HrRAuap5uled1GCpWpODQ4PsD7F6FGAOz/nvASfmhdODB73E2FtTc1m4zE6sBnD05Rw
         iJTNrWFJf8dgDMaIe7O2oti4M2QmJRwVwaPq2zW9wXDb/t6ccc05eerzOdZmOlK6Q/AL
         B+olL5B2JpHqnLhg7VS1L/m5M18yLTnnGficQedNlGObdUReX/x0YaPGKb08N9n46Jhm
         F9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qP3Pkjbm6eW/U4aYn+Kgix5mmDk+c87xv3QAatzmioE=;
        fh=FstQSHJ5xalY0qvCfwQnzF4rG/Wi+NaC2f1qQ65wDU0=;
        b=SaF1LuXC33THqlZYZFFHGtcvXVaSep2Ph0530pH/Yu+0i5t3znVbgjDg7B1LXbY5r4
         I32oKLKMXG3QqIOJNnZfbd3Fs33p0AvXhxTiF4nctK0ePvSUCInnztmnFexc8ge+0R0f
         myW3P/v34QPSX+zGnHXu9frFjihvkWIKY3tmbHx/iBeQ5ku5hJODGrOgkuCs/JasbMqA
         /1w3kyNquj525liE81G4yrvKNpawtq8fzWJeSBXfl5B2tkMiiKYAiSTv9P9ByQsNOfo/
         XVBJY5ZBS7xghfP+Zst9HPWjhFFH6cE+ykLUAflujnhjdbFvWP6un1Y4GG2wr1Hrrmm1
         8VzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=joTW2Ry1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l13-20020a0cac0d000000b0063d576a9a2csi8347152qvb.69.2023.08.24.07.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Aug 2023 07:36:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=joTW2Ry1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qZBMD-00006Q-6R; Thu, 24 Aug 2023 10:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBMA-00005A-Ie
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 10:30:43 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBM4-0000P9-Eh
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 10:30:42 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-26b47df332eso3847613a91.2
 for <qemu-arm@nongnu.org>; Thu, 24 Aug 2023 07:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692887434; x=1693492234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qP3Pkjbm6eW/U4aYn+Kgix5mmDk+c87xv3QAatzmioE=;
 b=joTW2Ry1S5pspxRBqCYoliu/BmX+B9iA7CaGLH33LV2xzgyrq2e00jFz5IlcxvjM2g
 TfS+ATDBWG+IiKMgJ5D5TxExfcxIF1A3yQeDSQwtU2p5uOXl+yALvP/Lyuelas6kaRN5
 yoCuC+7vL2pWjelU7GAp1IxjX/y16OBAMUO+9ZpwipAbtZxZj1nGWALfyUpBJ+0Aly4/
 ZuCmYBPPm/nm2k+ki3HfCG/4LBNC96DXEgaZhNEtxnebxEa8lxUHVxPrSPHtSOVw5EW1
 tC34M9Um85KkNueX1XjI9QQE3dn+Cj3noBmlKqXiVLQrE21LHmMy1IWiWae9nwmNXoNx
 aLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692887434; x=1693492234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qP3Pkjbm6eW/U4aYn+Kgix5mmDk+c87xv3QAatzmioE=;
 b=BwnSxWU5PrpJaOf63RRUBiWwl9lmD5VAkGWOEFu6ZACVd25xzRjv3B3hHVZvWAaXTj
 srUMONz6bYwnSMSpjjcr5LdZ0RpOJAU0Lhl74+fsYbzRaOyfhTB+FmiPjLT3Wg6unFjL
 RcP3dYVIwnNPbkQWPU5Q/D4vqB9qQ4XyFIr6WMdHA2TfFy83kwmIFtNY/doGt8qcxd/v
 H6QLlu7BGjD581sHsvWCUNh0VenRsZ9lu4JKZB3DGYgsJ7ZXy0ZxS1iXChG06+cWOK3s
 RAjn90pt6HA2OkA1+4xnzZZelVyXL0/pf9aZAXevdu4eQ7JiAnTBYRuVj8QC3SmVvQzE
 /+yg==
X-Gm-Message-State: AOJu0YyznMIdeTQ1oufZmwdx51E92tRwX3Jlc6P9K9FPRrb+Ei5pb1bk
 Sw/uxBbC/aN1XOXr3JTImZ/jkUkTsYmiOZZ+oOw=
X-Received: by 2002:a17:90b:23c7:b0:26b:17ef:7365 with SMTP id
 md7-20020a17090b23c700b0026b17ef7365mr10929749pjb.48.1692887434318; 
 Thu, 24 Aug 2023 07:30:34 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.191.205])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a17090a2bc600b00262fc3d911esm1666864pje.28.2023.08.24.07.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 07:30:24 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
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
Subject: [PATCH v2 03/12] hw/riscv: virt: Make few IMSIC macros and functions
 public
Date: Thu, 24 Aug 2023 19:59:33 +0530
Message-Id: <20230824142942.3983650-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
References: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1031.google.com
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
X-TUID: w/yKTPe/xWSZ

Some macros and static function related to IMSIC are defined in virt.c.
They are required in virt-acpi-build.c. So, make them public.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c         | 25 +------------------------
 include/hw/riscv/virt.h | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 388e52a294..7b65a847e2 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -38,7 +38,6 @@
 #include "kvm_riscv.h"
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
-#error "Can't accomodate single IMSIC group in address space"
-#endif
-
-#define VIRT_IMSIC_MAX_SIZE            (VIRT_SOCKETS_MAX * \
-                                        VIRT_IMSIC_GROUP_MAX_SIZE)
-#if 0x4000000 < VIRT_IMSIC_MAX_SIZE
-#error "Can't accomodate all IMSIC groups in address space"
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

