Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp852468eji;
        Mon, 18 Dec 2023 07:03:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5/hFxEWi1KvLPukN33XhrWkUOZTRFFSm1DdDdlFWm0NvIkfNel7fotjI7h4QMOQudkvGN
X-Received: by 2002:a05:6808:211f:b0:3b9:db67:4de6 with SMTP id r31-20020a056808211f00b003b9db674de6mr21433099oiw.47.1702911831616;
        Mon, 18 Dec 2023 07:03:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702911831; cv=none;
        d=google.com; s=arc-20160816;
        b=JATRoomtX9r+TISTlr6znDiTPNGiZPdBu1d7fN/IUkYPSs5BYi+xbOBzDfKqdrzgqb
         FSx1tGgOrJEPFMTyRIcrKLFEWy/Dt+QaDcoiW03sMlnGxPV4nt+zqUcftFnPRKqyVYDZ
         PbsxN0KxiIS4MIJg+YwNOseGl6MTAruv6hIyypFEBY7BpLemYMjE+5Lhaj2zQNKwxJt9
         kP0mWG8ToECe897Th440+PW+Ma/Cb0D+c8qXvInr3Q/cdEGcqr01dWppUO5sWUBAQsXC
         YAaHVdvKF8Ybdr+bFwFK06a7iOIofwxuMATwAcvmosCqtUwsT3XXAdZNcg7FV6gGTVZu
         WGNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jMG4kiK+xSH+di9in6y2be/evZ0Vb6ZYse7Z2pG5Yg4=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=RRPxFgeVZnTpv1gWa7Y5Afufghmrgud9mOl4rUAPT6zAgKLhzSFmTKFboZt/4pluDw
         O8eYiBlfg5MoF6SyyMjsjy62bml52AZNwA8oqXQqViOJxhStGM3OCO1BhuzDefj4QOuy
         ioOC5VIt+8Oa1AV4doJm4TeEKPixVavI44mk7g3sguGth8CYIq0k6k5iMQRZW9njvAbV
         Dlsh0iBDIZk02ofFAtgLydUK6pGDQxTHxdNG18Lf9xz9LukzYZHx56vbCsa+JVm7cXuy
         thLpdS/jvBwyjuQP1Tl/gPxyEiQ4AZhRxdImJjum54Rn15XfJ3Vz+tEjsW2B6W7tzTzN
         OhWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=jx43cBYi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k19-20020a0561023f1300b004665fba10a9si1631089vsv.764.2023.12.18.07.03.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 07:03:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=jx43cBYi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFF9Z-0001xO-HU; Mon, 18 Dec 2023 10:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9X-0001t8-1k
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:03:31 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9R-0007DA-61
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:03:30 -0500
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-5cda24a77e0so411901a12.2
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 07:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702911803; x=1703516603; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jMG4kiK+xSH+di9in6y2be/evZ0Vb6ZYse7Z2pG5Yg4=;
 b=jx43cBYipohxappiNS4nA/3GpSEgTyFTiDEtKMpyaGKYe4JhPcb+DZUysoZVUXbibB
 RwQo2N5MAGcvMmF7skzTIXJwmlsKwmfm/+JJ7iMijCJ8Eeyv5f/I6mTAhgRdXjfH2boY
 1ncYHZAmmb/hEnK3dn1UdwsXJhtkFBQeN5RIs+9c5izdX/7zt8QuImXlcewajTY88l2G
 kr5MZi/2LLr5DM2Oh43OMaAtSXc4LCMKRNVaYukfHeKFmBhAKnz4e6sNKiFFu1R08GG9
 0UKqL45+5BNAUCaehAeWvkFOWWeutz0pmK/4ckpBnHdMdxS+htuCTA8KvnCvih/2qBRX
 NXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702911803; x=1703516603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jMG4kiK+xSH+di9in6y2be/evZ0Vb6ZYse7Z2pG5Yg4=;
 b=LD6UxuMGOr+UPFXIfImjkfdznvtQ+DC1iWmlnqCR6Y3rfPZNQ8SzKC+tsgOI5ifUK/
 dPYdVeHtdgaslM814ikRmDJLYMWNZvRHfTowWVAyxg7RbKoM/P92ZGAYjNml334LjRSV
 1eM7Pz1vAkU+4Rg6F4N21FbkX7AkF2fAnh2T67rPlVg9I3HFcDm9UzujBFXaYam3F0Fx
 Z+gsaWdNbqQ33u2qegT4FzjGtdQDoIjurorACwx1Z/zw46VRogHDmtrn9V9+PMILvL8Z
 tSpnY1VewPdGTc91TxWmhhLcDnmAudKEtKyxkEa12L+Ma6n1ccuwPeNrYSWgTFPtQimE
 OIRg==
X-Gm-Message-State: AOJu0Yxo5abzegqr0ZaU+9afVcAcC/exX7sr+0Q9VCz2Pe7w9p8UGrat
 T7fqSk5i9aghiNsaIt4WpfJZwmgriopoaJgi0lo=
X-Received: by 2002:a05:6a20:3d1a:b0:18f:97c:8267 with SMTP id
 y26-20020a056a203d1a00b0018f097c8267mr9509171pzi.113.1702911802979; 
 Mon, 18 Dec 2023 07:03:22 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a056a000a0100b006c06779e593sm18975505pfh.16.2023.12.18.07.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:03:22 -0800 (PST)
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
Subject: [PATCH v8 04/13] hw/riscv: virt: Make few IMSIC macros and functions
 public
Date: Mon, 18 Dec 2023 20:32:38 +0530
Message-Id: <20231218150247.466427-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218150247.466427-1-sunilvl@ventanamicro.com>
References: <20231218150247.466427-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 4nRILhQOUg53

Some macros and static function related to IMSIC are defined in virt.c.
They are required in virt-acpi-build.c. So, make them public.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/riscv/virt.c         | 25 +------------------------
 include/hw/riscv/virt.h | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d2eac24156..9e7629c51c 100644
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

