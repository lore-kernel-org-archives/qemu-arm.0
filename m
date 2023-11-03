Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp812930eja;
        Thu, 2 Nov 2023 20:18:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGAKyYEsBKJL8IDmpIM5PkMUzwkJlSwfh9Oi5zRceTw4e0X7eunVHRiWSNQ8RfYPCng4hw
X-Received: by 2002:a05:6214:76e:b0:66d:3716:4e11 with SMTP id f14-20020a056214076e00b0066d37164e11mr28065006qvz.38.1698981493061;
        Thu, 02 Nov 2023 20:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698981493; cv=none;
        d=google.com; s=arc-20160816;
        b=dt/+KPz8NRmMhLJlGcAv6P+THdUGeOSoDb49aPx/DSQbg19pv3xIy/5+gp3fI9y4xV
         jws/r5YmGfxEeNJACYmLW6m0G68GAs1Vf6OaA9YpiTuH5/HL3G3DJHAkl+LlBk9CYToi
         HXbdd44YPEtHcFWfJpIT8SeFB+jo1FEOV0oPLjXCjVkPcangiqmvKucDEsZvl9nO/H4R
         V/WDq4QruQNjHhoScjJ+iigfObiFM/brQ+BpSHHdWdEn54S74/H403pwfPjk1IWaGAcl
         Tx0gLwJxIRN8tGh9FTArB40yjpzbgwESN+XdaaEUwK9RROcxKQ6tc9FF5888nvYZWIvk
         8nSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=reRgFIo/a/JVM0UtMkl7xvGhGtgGayY1sEcqgv6Od4Y=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=ksarUJCyhJm3Npm1tZH+S+JDLMG4zt/QL84J+P6OwTU8U7xUgCiah9g7yBb2D+jKct
         gmCOoDq6W6MBvWFsbPVyofy1XmiDAMj5szXFHrMiBajrsszfh7eYz2hFdgP449335rLl
         eIHY+kBrYeodaZAYhPqs4DiU8R/K3iBZEP1BX0iuWDaSDIwbz6Hv0OEnkq/8fQYB9S9l
         Dg7n9tSwdFB69jLZHgI4Hm9op557iRjFPTtn+Rppubi/TlqdwUCAZ3JqJe7lZwAv0w0v
         L4wPiaGdXbJtScLLzvC8hE7ceLSFqqsiDlQhBqexkq+PRbXm8EAfjL78l8INtF0iAztz
         3iag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=ZB0+Znkp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ff3-20020a0562140bc300b0065af67d667esi756053qvb.261.2023.11.02.20.18.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 20:18:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=ZB0+Znkp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qykgk-0007tW-Hj; Thu, 02 Nov 2023 23:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykgi-0007rk-M3
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 23:17:36 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykgZ-0003as-RG
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 23:17:36 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5b97ca78da8so1291612a12.3
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 20:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698981444; x=1699586244; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=reRgFIo/a/JVM0UtMkl7xvGhGtgGayY1sEcqgv6Od4Y=;
 b=ZB0+ZnkpSePT9fSIOpnFMQwOTCCRgbw9YP0AiyWWgBcNU30JoEC1NWaxCd4qxcCuN1
 ePL90U9pnzB73BgYynh0+eRZKT0OQl+zmTsjr0IgL5z5+9TJnTJzDnfIzTWWftVrokHt
 YtImx7qDbNIUeZlziR1p29mrfnM9h5hkDhFfK8ALcWbPztEQ4iA93mfl4lx7WvJJ2uGo
 gigecycgWe5OJ7TItw1hyhH2LbwogLS9D61dVBu9HWAcCeomeZy+lRWxzg6+NOueKkn/
 b+bs1jvRJL5RxqrbZyMp4OyUC0vxZnyw4MSUgNXOwM4JlNfUG0+3w5hL3TcEASwu2j45
 Trww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698981444; x=1699586244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=reRgFIo/a/JVM0UtMkl7xvGhGtgGayY1sEcqgv6Od4Y=;
 b=jr2fTvZpExHp5b+KwLhOepcePvIeLMKOWcqaH6JUNLRaXfFX232ypA2ZJARb+6S/4p
 8NELFA3bkoaBZ1QmPbkCFlOzqA/Tz7Xmov6+3zYp2XP/whNSeAlbqh/pMKkvgIZ5TIcm
 vJy63z1TWjY0IJQGI7loTHaBe3+QmQPHAFltxX6IyX+symsHudTXaLP2LdnJ8brJz4TH
 MwAEO4P63ObpXcsvAoVVnsbULDdI0BcROIoQmaF1+Hq0e8q+VejExoMbu4ySpWhr5F76
 ep0lQf89SG48+87yrCxy5hcntA0vdi6yWp582ApKkODQ7AiSQW4EE+/zcPvNsHtlaf7q
 fHKw==
X-Gm-Message-State: AOJu0Yzk+9J23DaD4AaF2o/zNbyH62lWCA6Pz+PoIlHFiBMRemRSIEjp
 p027BaQYjI/u56maj3u6sKiqE8E8e+XTlmnIotlK3A==
X-Received: by 2002:a05:6a21:3e09:b0:180:f227:57db with SMTP id
 bk9-20020a056a213e0900b00180f22757dbmr9971973pzc.32.1698981444205; 
 Thu, 02 Nov 2023 20:17:24 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a17090aca9100b0027cf4c554dasm499971pjt.11.2023.11.02.20.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 20:17:23 -0700 (PDT)
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
Subject: [PATCH v7 04/13] hw/riscv: virt: Make few IMSIC macros and functions
 public
Date: Fri,  3 Nov 2023 08:46:40 +0530
Message-Id: <20231103031649.2769834-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
References: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x536.google.com
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
X-TUID: oyrfzmaGQoJK

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

