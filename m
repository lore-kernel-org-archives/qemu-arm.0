Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp796905ejo;
        Fri, 5 Jan 2024 07:53:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMxDYgEhOQgzsHGp8BxN/VVycoz0wMtsVHB2SuUYG+2ltOarxmPvL4YqoFvTZyElFVLTeg
X-Received: by 2002:ae9:ec0d:0:b0:781:706d:3cc9 with SMTP id h13-20020ae9ec0d000000b00781706d3cc9mr2311864qkg.117.1704470012270;
        Fri, 05 Jan 2024 07:53:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704470012; cv=none;
        d=google.com; s=arc-20160816;
        b=StqYIi5iemdEg+RtfrDOkej04MZKQquf07WUuTuCpFy07mUHGJiOFPC+mrY6VcXrKq
         NvLjcYUZhQ7dOPdx35pXkBwtXxv/DylDV01SOQJKTy66TPOBmIWBFLMUubHR34YYsKzH
         /8Lfmt9FLK6mul87s7mv7r7jKpHwewjvvaEvliY30sL5XjyHb49Gthv6U6iyXL2yfVow
         4lupLS/IZDzDonpVAbObwdzNvfYqyHu1GsX5106+N1n9FBgQ4ohkI6+Z2VSdlGBgQGAD
         QXgDP4QjfuxFqpi3hrXdSwzkFauysCZ0HYKAspwmrIBn3ebX7AO4+JhDXExYfRUeZwnM
         THpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pzBOft/r+pQ28bPRm3cZUcB0Cj6Ii9RnBaNZcpiqy/g=;
        fh=S2hnCKcS0eBIA4Fe9+Xpg4dbdBClN+9NwNcCWKpQPaM=;
        b=s1XuxB9SNHc75yfuICPUtzZWCz+vEpLKhOoenDV76uqmLeYUHtHv0nDh+UH81MPj0F
         7wQXnUWTiOhmp5aUl0isxefuWsaHTP49JMxFX0GWIvl8nbf8mCWLMr6xW6UjLF1+gEQv
         HZYY2FxM5niWNlWm9fgzsKAZ97xN8d/R39fqEGCR7fsRRoHCaPDDuX0Zim5c0vvar3cq
         QxsYG9ceB103fvSzin9EhPxBblup7LrQQXj9VQ4rhhpQOW+O0hU7hmvMRIPhFITN8N3E
         WrAHYbopxifP6GyLctQ/axJ3NubQzxK/Q8jn1GTBOf8S8GPJTriZI83NwBzFlfAYMEKb
         LQ7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DC9QmywZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14-20020a05620a21ce00b0077d7db54d82si1931437qka.427.2024.01.05.07.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:53:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DC9QmywZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmRO-0004vC-Mo; Fri, 05 Jan 2024 10:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQL-000821-DZ
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:47:53 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQG-0004lM-Bt
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:47:51 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40e3712d259so10429035e9.3
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469667; x=1705074467; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pzBOft/r+pQ28bPRm3cZUcB0Cj6Ii9RnBaNZcpiqy/g=;
 b=DC9QmywZGIdHeP4Ut5HMMTGn8IGKL3B7RdqJaFqiUeLPUox1E7Hd/jfol0RnJ1MPet
 aFITvVqau9AxgvptyeESL/Q7BfchVxrLQpkURXUk31PpzwSVRnA2YpfDzc8dolkS/9WR
 t6kp50tdnRfhi3w4EZMJPRoxOnX/bpBo1vnd4hsiosjRAsUwTlBgcjampXHdEgZ0GfiJ
 FZICIvyg3jr4JHJkePp7dqzH9CbCVkFORDXpCNpGiCHHlbHueRBCM+0/VzuKhhSG4ALY
 DkVQSZmpJ1WTJo8LX+mYI7VX+z5lGceL7UeKO2NNQowc1KG6R1ARASFfZW0kP7feZynN
 WYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469667; x=1705074467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pzBOft/r+pQ28bPRm3cZUcB0Cj6Ii9RnBaNZcpiqy/g=;
 b=deXxEYkQvKgKUp6r6+7HMDz/AiuKvcptbOgtUpNazoDz96jnohjV62ZtnqcL1apNzk
 5OK1TtytrZMNPsgHUadD1CSvW0MD7z43YbAlRmS+ZFv4e2Ur/cagGHEOIs/cJvVucpOb
 Jn0tc3Eoeyfc6ykm0bnf9a9HbgHGk8rywnaX6sOecAiDQdTfx0PqZXCz3D/QcrfrgN6L
 oq43RWmlK1ghUVaW4rqINs4QDjrrGucuVwEcVdku9akOMqAhNN4YEudy/VWRaY5QAIlB
 hiFm6oi+U+gkHbYoXlcuXF7jtjeCYu4plYf7BayZzDanWZkerCK9imbwyIl4vo8iHWFX
 czKg==
X-Gm-Message-State: AOJu0YwEpyX8xWINngAnu2Fw3ESNtEcBv7YHn2UmO6zoFLu1rkBeFX3v
 TsDz20omto/0e05PCXi4NWnEk+I+RIlr9g==
X-Received: by 2002:a05:600c:c0b:b0:40e:351d:53fd with SMTP id
 fm11-20020a05600c0c0b00b0040e351d53fdmr848618wmb.239.1704469666949; 
 Fri, 05 Jan 2024 07:47:46 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 v1-20020adfe281000000b003365aa39d30sm1617394wri.11.2024.01.05.07.47.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:47:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 43/71] hw/mips: Inline 'bios.h' definitions
Date: Fri,  5 Jan 2024 16:42:36 +0100
Message-ID: <20240105154307.21385-44-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: aWqzK62C/Uqz

There is no universal BIOS, each machine needs a specific one.

Move the machine-specific definitions to each machine code and
remove this bogus header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20231122184334.18201-1-philmd@linaro.org>
---
 include/hw/mips/bios.h | 14 --------------
 hw/mips/jazz.c         | 10 +++++++++-
 hw/mips/malta.c        |  9 ++++++++-
 hw/mips/mipssim.c      | 10 +++++++++-
 4 files changed, 26 insertions(+), 17 deletions(-)
 delete mode 100644 include/hw/mips/bios.h

diff --git a/include/hw/mips/bios.h b/include/hw/mips/bios.h
deleted file mode 100644
index 44acb6815b..0000000000
--- a/include/hw/mips/bios.h
+++ /dev/null
@@ -1,14 +0,0 @@
-#ifndef HW_MIPS_BIOS_H
-#define HW_MIPS_BIOS_H
-
-#include "qemu/units.h"
-#include "cpu.h"
-
-#define BIOS_SIZE (4 * MiB)
-#if TARGET_BIG_ENDIAN
-#define BIOS_FILENAME "mips_bios.bin"
-#else
-#define BIOS_FILENAME "mipsel_bios.bin"
-#endif
-
-#endif
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index d33a76ad4d..0d2348aa5a 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -36,7 +36,6 @@
 #include "hw/boards.h"
 #include "net/net.h"
 #include "hw/scsi/esp.h"
-#include "hw/mips/bios.h"
 #include "hw/loader.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/timer/i8254.h"
@@ -53,12 +52,19 @@
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 #endif /* CONFIG_TCG */
+#include "cpu.h"
 
 enum jazz_model_e {
     JAZZ_MAGNUM,
     JAZZ_PICA61,
 };
 
+#if TARGET_BIG_ENDIAN
+#define BIOS_FILENAME "mips_bios.bin"
+#else
+#define BIOS_FILENAME "mipsel_bios.bin"
+#endif
+
 static void main_cpu_reset(void *opaque)
 {
     MIPSCPU *cpu = opaque;
@@ -147,6 +153,8 @@ static void mips_jazz_init_net(NICInfo *nd, IOMMUMemoryRegion *rc4030_dma_mr,
     prom[7] = 0xff - checksum;
 }
 
+#define BIOS_SIZE (4 * MiB)
+
 #define MAGNUM_BIOS_SIZE_MAX 0x7e000
 #define MAGNUM_BIOS_SIZE                                                       \
         (BIOS_SIZE < MAGNUM_BIOS_SIZE_MAX ? BIOS_SIZE : MAGNUM_BIOS_SIZE_MAX)
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 049de46a9e..d22bb1edef 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -40,7 +40,6 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
 #include "qemu/log.h"
-#include "hw/mips/bios.h"
 #include "hw/ide/pci.h"
 #include "hw/irq.h"
 #include "hw/loader.h"
@@ -59,6 +58,7 @@
 #include "hw/qdev-clock.h"
 #include "target/mips/internal.h"
 #include "trace.h"
+#include "cpu.h"
 
 #define ENVP_PADDR          0x2000
 #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
@@ -71,6 +71,7 @@
 #define RESET_ADDRESS       0x1fc00000ULL
 
 #define FLASH_SIZE          0x400000
+#define BIOS_SIZE           (4 * MiB)
 
 #define PIIX4_PCI_DEVFN     PCI_DEVFN(10, 0)
 
@@ -91,6 +92,12 @@ typedef struct {
     bool display_inited;
 } MaltaFPGAState;
 
+#if TARGET_BIG_ENDIAN
+#define BIOS_FILENAME "mips_bios.bin"
+#else
+#define BIOS_FILENAME "mipsel_bios.bin"
+#endif
+
 #define TYPE_MIPS_MALTA "mips-malta"
 OBJECT_DECLARE_SIMPLE_TYPE(MaltaState, MIPS_MALTA)
 
diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
index 4f743f37eb..01e323904d 100644
--- a/hw/mips/mipssim.c
+++ b/hw/mips/mipssim.c
@@ -35,7 +35,6 @@
 #include "net/net.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
-#include "hw/mips/bios.h"
 #include "hw/loader.h"
 #include "elf.h"
 #include "hw/sysbus.h"
@@ -43,6 +42,15 @@
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
+#include "cpu.h"
+
+#define BIOS_SIZE (4 * MiB)
+
+#if TARGET_BIG_ENDIAN
+#define BIOS_FILENAME "mips_bios.bin"
+#else
+#define BIOS_FILENAME "mipsel_bios.bin"
+#endif
 
 static struct _loaderparams {
     int ram_size;
-- 
2.41.0

