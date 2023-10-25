Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2999744ejb;
        Wed, 25 Oct 2023 13:09:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+t+IKbV2qYkaaMXEG+uIjutmhA4g3QRM7z0U1ZLnuVwDC5bY1Dd1Y3VKDNKlrLT9yH+3P
X-Received: by 2002:a05:600c:3112:b0:401:bdf9:c336 with SMTP id g18-20020a05600c311200b00401bdf9c336mr13656378wmo.27.1698264589335;
        Wed, 25 Oct 2023 13:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698264589; cv=none;
        d=google.com; s=arc-20160816;
        b=fpm9pDu3+c96Qz0skWfv5ikwUMlumKZMfQ3rk36vLJ2+CWinURHF54FV1QR5vhVYmt
         yZRDCaAdRMHI/Kak5DHtSzn/yJiDKYmpKRWSXL2EnFKq7FIQKIrYwOQJm69SVKt6O/T8
         QYJXXXv8A+vum4cOMX2fmpBLttaEBCWN1jKF4RnlXuhpnMP8DwnUoieg3SRTpLSEalsW
         bsK/ZBm4DP7YvQmFadmyUra1Q2DK2P74JKqe+iT+nN5MlwR/Gk5NGz7yoGDqblcuXhr/
         gi/mD8ZUc+lLgsf1VYiS8oCg9ZHnEeexg9svw6slq61S4qGIRXdYddcFm0OQhYh37HJd
         H0JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3MxEnwCcrzZXPmJ6j2nD9uSFRJXenxo4trg/FCDg9Lw=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=P3qZiMu22Lvopom4EW9RXJC6hdhIbHEGs16uCVOj4Sg5BUTtxNrCGlQp+uAoRAw98m
         pC6tRn4lwlw2SvfwvU5XcRAD4Vwa4RD6TRH6g0ax1wKq+qRIeG8b26vqi2vKi3pagkVj
         /o0+jWrIssVmNhd3tnPyTFN9LB8H6u2ctBaVWWRFsuuSYoC8tFbfdGQXxaMQxaLm2s0o
         sD/Z2FYxRaSx9bq7YRhe99UVrdsFCQpWWS7alWTiGRXwjdAL4SWn55NuU5ODaBFUuUmO
         s1+NCHfZktiU1WnwwdErKbh9tNNjAwMGf23GqNACoaAr7t2f9hld8DMmYIw0IP7qyfgU
         9e9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=O1juFMM7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21-20020a7bc4d5000000b004050d0cc95bsi460821wmk.168.2023.10.25.13.09.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 13:09:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=O1juFMM7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvkAU-0007NA-Oh; Wed, 25 Oct 2023 16:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAQ-0007JV-NU
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 16:07:50 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAP-0003SF-3F
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 16:07:50 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6bb4abb8100so116729b3a.2
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 13:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698264467; x=1698869267; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3MxEnwCcrzZXPmJ6j2nD9uSFRJXenxo4trg/FCDg9Lw=;
 b=O1juFMM72URwvVsQG+NcVcc9o61Cy1Dke1/9xpH1++vmEsCqZqdij7FrHDyKuazG9N
 iOskPqLwmSqy8D70llYNMIQLk8OPxsxpxZdWSndxZ/ZN9O8bs83mh2rEIeG/rIr+0D2n
 Yg3Qy8ygIv9hTw/3et+ik0CUJJYdgqlQlkz6myRxKDps4KMUe+/LSyL/eeS2iUjDY0ge
 pTZX9XC4Kd3azNFwyTAjuGEfjGWYJ/ql7uBiYuhs9AQl8lROCAEMoyN/Hj66wQ6BqPUT
 bPbqWiYehyZxJKgUF8MFsVP+e3kGCffjUjPW70kvP6ir2nt/wUPqA/96eoTosv4vIqLt
 G4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698264467; x=1698869267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3MxEnwCcrzZXPmJ6j2nD9uSFRJXenxo4trg/FCDg9Lw=;
 b=wPaQadlStTVLwXMIvFpbhG3B6HWOAc/5MxN+zqMjYsqhnkUSSzp/Ecc0NfUEF4ZHJn
 liM6aVMooCmp1hah9fHZ6LXu95C3At1n6GlqD891/gtJlhYITFjiuyPlJ6QJhhiy0PrT
 DsHrhP7GxkNuebd2fKFaO9uNxMbAEOJTyMJTtLIe+JMRSP4/i+XFyZ6Z36qtzF0rpBYm
 bqKO7ettkSSBRRPJswAf7fZZVWc+8jhNKbe+Gu++WghtA5+3iQvDVsg8WIp1mmI3bR9V
 Ug/fDmzlOfd8W4fMU/IQtXXmgrNU7VWbBWGgeyq7qfE6YQp2KX1jCxjQpPoE8hN6UjB/
 zx4g==
X-Gm-Message-State: AOJu0YwpYwRlvNnyITpvvu4rEb/MEFAZ6ZpVwk/VYb8M4LWLnea2HmEJ
 om/OTbt23URHHdmh87wWgtbtcIuHKA+IuwaCLIUWCQ==
X-Received: by 2002:a05:6a00:1ad4:b0:68f:cc47:fcc8 with SMTP id
 f20-20020a056a001ad400b0068fcc47fcc8mr14508502pfv.14.1698264467440; 
 Wed, 25 Oct 2023 13:07:47 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa79681000000b0068fe7c4148fsm9696768pfk.57.2023.10.25.13.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 13:07:47 -0700 (PDT)
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
Subject: [PATCH v4 04/13] hw/riscv: virt: Make few IMSIC macros and functions
 public
Date: Thu, 26 Oct 2023 01:37:04 +0530
Message-Id: <20231025200713.580814-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025200713.580814-1-sunilvl@ventanamicro.com>
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: HG9WlOhTEmQM

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

