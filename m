Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp801032ejb;
        Thu, 19 Oct 2023 14:21:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGloJgmCa8fVF+57Nz4S/o7VgKKq6dCtLSukON/lS1lpXZfldZtdyd47LagJMDryR4zQqyZ
X-Received: by 2002:a05:620a:480e:b0:76f:c24:5450 with SMTP id eb14-20020a05620a480e00b0076f0c245450mr3322097qkb.2.1697750491621;
        Thu, 19 Oct 2023 14:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750491; cv=none;
        d=google.com; s=arc-20160816;
        b=RmQl/98JwdzT3vbGuwElumni4LiDJX0iWJnWIQdAkBJ/PW9b5T67dmf9G9v4cIOGKH
         0/btcmhH0Vdf45D42ybtQepULhavpdlJicVYbtdsm+xlzwdN+pYQJEpdnfZFG611M285
         Hgl3wMxOIMwL76HSCFsZP40X4vwEwErVLLEsizzuLa5mQT8D/aT89VNIebVerhsCZI/G
         n3URD8Td1H648Owi779RjGfYqDarOhtiagAnaN9dbcm7JXWTiJvHmpt71JvzPAmCmvkd
         SuW1M1FPEn2QZaefILgkbI5+UIiWQFQaOLVjW5cfzhbPzWP4wwups6TZZcCEp/GwjmZ7
         15mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hZIQ+KgH54UQHRZkZfXDQzeJv7i8hhcdzA1tyvUGSNc=;
        fh=7CaI8gdpGo7H9DlIj2s0fcRA9RJIC4t0uLXTrrIGJ3o=;
        b=alpIi7lD08MQiHB+A3GS0WmAYDIA01K9AXikbX0RpORXnW7zCWtVlLiXHm8yVTWABO
         c9WsWexKXlbiEIOwPfiyLPVVaLkv2ebmRMav60AWJQiu/LpRQEQZ0ju585QHwYioOtY7
         Zy6NVzR7zXCPWbEYON42bHNyxn3HdWltx8r7kSTEVIcyVz9KJBJgdSScaxvohYY1mNJL
         ysCEkQ+EkL3+R+361o5jn+0SthUbS7LgSLvYw4i+/vTVwtKfk1J3U4IfWDrlTODfFKnb
         T2uKRjiqiYxbFniIzrawy/RCQ+kJ4hJ4Ss8QnWbnMPqtg0R/oZq2BA49ayvBOMvtr5ea
         7dfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rXsaNyQl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21-20020a05620a113500b007788cced177si230441qkk.524.2023.10.19.14.21.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:21:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rXsaNyQl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaQj-0006ZR-Vo; Thu, 19 Oct 2023 17:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaQh-0006Vc-0K
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:19:44 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaQd-000556-Ol
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:19:42 -0400
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c5087d19a6so1824981fa.0
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750377; x=1698355177; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZIQ+KgH54UQHRZkZfXDQzeJv7i8hhcdzA1tyvUGSNc=;
 b=rXsaNyQlE/hzip9zJrtnv0aWBWeb6UAHNirBdHtA4GhOnxqyQ4hPq9ZS3ZK5+KrWlN
 dKMdJj1Edxggnz66tbn1NqJBp8/nVJbiTBlPtHKdGrlta9+Hi0jlEaD+eIGISSXpy25U
 FtHJm4GlHrZWTevhar8jsQvqrDKENW/1kFEx/rjtafFTvm+bIlsACC6kG8Y6fjO22bdZ
 +V16UQXCuGd5Z1DT+egz8R3xByBN3UDbIHZswpH4qn5qEfrM08o0ekIjMv0lGu/g/nU9
 moxlu5EBHDVAE5AMg7/HYDaWF7LfI/XK1rT0PlWJzK8Ha1bgKYhS5mdPdlaHYvYzy6/4
 qb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750377; x=1698355177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hZIQ+KgH54UQHRZkZfXDQzeJv7i8hhcdzA1tyvUGSNc=;
 b=c+1ZLSH6ZBK4ykomJzMfIOrK3huG3IOuUnr5SZl9xVqlNPCrvx/6fPwm/uMXd5W+dU
 8JvvKS0Rct0tY4HdBcoxwA3k8QN9SxoO+uw3UFPeZFQxwHNQKHT1kAUCBQqix3tGMjCL
 8jYLAokgYApqN1t8S6a618TCaDNjkdajCnBysRjTiU6x3BkXd8TeV12eFInNzyr6stWi
 gf2b4tEfWuBeb6WuTsRmykVxd9tFZgNOh9BWcjzCJZRt79NoA0wXLC1+GqE1OgN1jpat
 Gn4W0phfPBJyZcUFFq5zEvWOnKZ5/ZLno1T5f1/JuPlosAwr7bwzLGw69hX8GQIuRDJ2
 O7zg==
X-Gm-Message-State: AOJu0YzTtBBolqARTHplCZyulQaIzOv/2S+6Fh07D02OX8jIQ6bYaFjk
 la5v8+zfBkcbrLXmcfmAQEvikM1+T+le0Utk7/UdLw==
X-Received: by 2002:a05:651c:170b:b0:2c5:2eaa:5398 with SMTP id
 be11-20020a05651c170b00b002c52eaa5398mr92601ljb.25.1697750377370; 
 Thu, 19 Oct 2023 14:19:37 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c158900b0040776008abdsm503991wmf.40.2023.10.19.14.19.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:19:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PULL 12/46] hw/mips: Merge 'hw/mips/cpudevs.h' with
 'target/mips/cpu.h'
Date: Thu, 19 Oct 2023 23:17:37 +0200
Message-ID: <20231019211814.30576-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22e.google.com
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
X-TUID: X/4E4HVJxjcr

"hw/mips/cpudevs.h" contains declarations which are specific
to the MIPS architecture; it doesn't make sense for these to
be called from a non-MIPS architecture. Move the declarations
to "target/mips/cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231009171443.12145-2-philmd@linaro.org>
---
 include/hw/mips/cpudevs.h           | 14 --------------
 target/mips/cpu.h                   |  4 +++-
 hw/mips/cps.c                       |  1 -
 hw/mips/fuloong2e.c                 |  1 -
 hw/mips/jazz.c                      |  1 -
 hw/mips/loongson3_virt.c            |  1 -
 hw/mips/malta.c                     |  1 -
 hw/mips/mips_int.c                  |  1 -
 hw/mips/mipssim.c                   |  1 -
 target/mips/sysemu/cp0_timer.c      |  1 -
 target/mips/tcg/sysemu/tlb_helper.c |  1 -
 11 files changed, 3 insertions(+), 24 deletions(-)
 delete mode 100644 include/hw/mips/cpudevs.h

diff --git a/include/hw/mips/cpudevs.h b/include/hw/mips/cpudevs.h
deleted file mode 100644
index f7c9728fa9..0000000000
--- a/include/hw/mips/cpudevs.h
+++ /dev/null
@@ -1,14 +0,0 @@
-#ifndef HW_MIPS_CPUDEVS_H
-#define HW_MIPS_CPUDEVS_H
-
-#include "target/mips/cpu-qom.h"
-
-/* Definitions for MIPS CPU internal devices.  */
-
-/* mips_int.c */
-void cpu_mips_irq_init_cpu(MIPSCPU *cpu);
-
-/* mips_timer.c */
-void cpu_mips_clock_init(MIPSCPU *cpu);
-
-#endif
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 67f8e8b988..fb44defc93 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1345,8 +1345,10 @@ uint64_t cpu_mips_phys_to_kseg1(void *opaque, uint64_t addr);
 
 #if !defined(CONFIG_USER_ONLY)
 
-/* mips_int.c */
+/* HW declaration specific to the MIPS target */
 void cpu_mips_soft_irq(CPUMIPSState *env, int irq, int level);
+void cpu_mips_irq_init_cpu(MIPSCPU *cpu);
+void cpu_mips_clock_init(MIPSCPU *cpu);
 
 /* mips_itu.c */
 void itc_reconfigure(struct MIPSITUState *tag);
diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 2b5269ebf1..b6612c1762 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -24,7 +24,6 @@
 #include "hw/mips/mips.h"
 #include "hw/qdev-clock.h"
 #include "hw/qdev-properties.h"
-#include "hw/mips/cpudevs.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
 
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index c6109633fe..97b2c8ed8e 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -30,7 +30,6 @@
 #include "hw/block/flash.h"
 #include "hw/mips/mips.h"
 #include "hw/mips/bootloader.h"
-#include "hw/mips/cpudevs.h"
 #include "hw/pci/pci.h"
 #include "hw/loader.h"
 #include "hw/ide/pci.h"
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index c32d2b0b0a..86dfe05ea8 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -26,7 +26,6 @@
 #include "qemu/datadir.h"
 #include "hw/clock.h"
 #include "hw/mips/mips.h"
-#include "hw/mips/cpudevs.h"
 #include "hw/intc/i8259.h"
 #include "hw/dma/i8257.h"
 #include "hw/char/serial.h"
diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index b74b358874..33eae01eca 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -32,7 +32,6 @@
 #include "hw/char/serial.h"
 #include "hw/intc/loongson_liointc.h"
 #include "hw/mips/mips.h"
-#include "hw/mips/cpudevs.h"
 #include "hw/mips/fw_cfg.h"
 #include "hw/mips/loongson3_bootp.h"
 #include "hw/misc/unimp.h"
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 62d04ed113..4fa5b33fd9 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -37,7 +37,6 @@
 #include "hw/block/flash.h"
 #include "hw/mips/mips.h"
 #include "hw/mips/bootloader.h"
-#include "hw/mips/cpudevs.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
 #include "qemu/log.h"
diff --git a/hw/mips/mips_int.c b/hw/mips/mips_int.c
index 73437cd90f..6c32e466a3 100644
--- a/hw/mips/mips_int.c
+++ b/hw/mips/mips_int.c
@@ -23,7 +23,6 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "hw/irq.h"
-#include "hw/mips/cpudevs.h"
 #include "sysemu/kvm.h"
 #include "kvm_mips.h"
 
diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
index 2f951f7fc6..4f743f37eb 100644
--- a/hw/mips/mipssim.c
+++ b/hw/mips/mipssim.c
@@ -30,7 +30,6 @@
 #include "qemu/datadir.h"
 #include "hw/clock.h"
 #include "hw/mips/mips.h"
-#include "hw/mips/cpudevs.h"
 #include "hw/char/serial.h"
 #include "hw/isa/isa.h"
 #include "net/net.h"
diff --git a/target/mips/sysemu/cp0_timer.c b/target/mips/sysemu/cp0_timer.c
index 9d2bcb0dea..62de502caa 100644
--- a/target/mips/sysemu/cp0_timer.c
+++ b/target/mips/sysemu/cp0_timer.c
@@ -22,7 +22,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/irq.h"
-#include "hw/mips/cpudevs.h"
 #include "qemu/timer.h"
 #include "sysemu/kvm.h"
 #include "internal.h"
diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
index 7dbc2e24c4..4ede904800 100644
--- a/target/mips/tcg/sysemu/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -24,7 +24,6 @@
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
-#include "hw/mips/cpudevs.h"
 #include "exec/helper-proto.h"
 
 /* TLB management */
-- 
2.41.0

