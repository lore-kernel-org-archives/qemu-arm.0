Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1953378ejd;
        Thu, 18 Apr 2024 12:28:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlGg/hIyvavFHfnzRFu5p/JKURxmMWUlyivikaFRp0DdsIAc/9tCpUzN81sw6PxjwVHk2Gu6Z3yd0wSsg3Cl0cm/1pXeko
X-Received: by 2002:a17:906:f148:b0:a55:5e89:a158 with SMTP id gw8-20020a170906f14800b00a555e89a158mr43185ejb.68.1713468495395;
        Thu, 18 Apr 2024 12:28:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468495; cv=none;
        d=google.com; s=arc-20160816;
        b=sjOqR/Oi1/SeY0gg1CD2FQ162hFB3SE4BfRdHow8Gr5SmOLmkuvsCxe2Vod7gaG/OU
         Tgo9L+nKIC6IasCC3JiKN/uc7e1rpj7huiX6VJ2qI/M4Pd/yuyH5kdttIP/GSdbULqxz
         3bhbTBmPfJLupgrTUEqk4DtR35+hTkM+EIhjtjBDqLm1MwtjQBNP1JSn9+LEwdtmsJoX
         bh2bfCyzX6vWyMlHzLG9kAuQSp7K3TR/x4XJZHM31IDsGUNfk4gUpPYejCE5uiuJ/UaP
         1sv/Ax1z7UEXv6hTouuR5BOeuqs6wbcvpEX0gpN11V4CJEssGens1XKyjq0rscMi7hPL
         WAnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZdGtqepmHp/hs0/Z1yrPy9JbSuxwne+2qc6kJd/9zb0=;
        fh=FbfVsC1JKiHs/oRg1VQPV/KmfwNZP9yCosd3jzvQg3c=;
        b=C3SmxFjKHpBXUoiP9p6CsqvzETDtakovIS4Rl1rwUDxjOKsGkoE6YpzdYrgfo4Z5DR
         L5MQMjNqsQVvaK/hUVpwYEIQQpMcuZK0B3aXscETRK7pj18RHQZzJ9yFL0CU3rqWbakN
         bSSsvOkV0b6xYmf2U6bORLnJhQQwCJN7iAYfevIyeljlW/2gQ20Q6R3Pken3sAq+iBZM
         iK+fRCFBfuuV0vSPtamWAizlAx8H9NWrGaw/LNPt8zX/e60TG+ZTm3+hcTCMADYOx34C
         rp0l7V7t6CMfaFw08a0+jrdLBj23lIyLDhXAGvbOXq4JORbUmu34xmTPI4Z2PY7DY6wx
         Fs1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AfjdAjvB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ci9-20020a170906c34900b00a5212cc66efsor587718ejb.9.2024.04.18.12.28.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:28:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AfjdAjvB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468495; x=1714073295; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdGtqepmHp/hs0/Z1yrPy9JbSuxwne+2qc6kJd/9zb0=;
        b=AfjdAjvBRH2BtARepAmq25YcLM29CoERTqb/tRbukm65adtsTRuXa1ljESJSqf1CI2
         dOeB9TrHqFSmHtmg4Yv2TPP4veNXD5YrBPuFekCnLO3X0WnoObqtc8O/cFdnLorh26XT
         mjaeLK4lHQKnBBPRkYlxLuRbJ9t51gDtCJ43U7wL3Gh449YSDlACmCQi7wpctPvgDzgp
         B2Rotn5bqyxApPjuWPnbit5zh+4Uk524gaqjXFAmQ9JRXtbprU+yytNsiU24OgVXpQie
         MDSNxx5LrYfNNP9KKK5JEDvzxwV2NHC370g/LVrrDdi5xdTulFBd4x2VunQn45jGK5Hd
         xq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468495; x=1714073295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdGtqepmHp/hs0/Z1yrPy9JbSuxwne+2qc6kJd/9zb0=;
        b=sAzbPLbR5LLDHBMISh8vBWWP76+37P6a22LdBiiOfBxH4DCHQ17iZWyZCCMbfquXFq
         z4er57K4Djak3EnHL5Oepxi/fwtCR+bGSn/GqhmAd0haIX+N4A0ig3QbhgfrI2EdcgG3
         h8eeI5M3wlT4xvyhjsVvO4fnsEl0MlolBiRsZVf/qn71VHvQyjFCu4nQgKYMpD68LOiZ
         yyfJEe8I/Fgm06jvvGknP9L2jRlp5mQdqn8t+Qlu4GcMpeJYddHg0h8fIFBiNkUT9aGj
         Q4da2cbmKxsz/7F4ehCcYZxmOR2Sl0BLwzksJ+MTWh0GH8YGCL6r2hN8mdYZ48Rjahk7
         VBxg==
X-Forwarded-Encrypted: i=1; AJvYcCU64fqO7F8jJaDNW+v/HrP6XJXhk5ETC18a1859gkE2Np/oVvlEWv7emYy50LO28i6d+NsgX0Jiv3d7ZgqeDGhqyL5iwwSa
X-Gm-Message-State: AOJu0Yxxa3aCuMvWihboF7xPsEcVCb8CUTVQ1WmWtdWetdKOWoAFWJgB
	/kxpWJYLEIXgJb8l602G/mNeTBbKWtQnpQhe/Rab52crM6POLGXbrGxQ/y3+XfGqhw==
X-Google-Smtp-Source: AGHT+IFOIY5gAThTWZwjM0+HF7s5tNrh3iGimgDUj1yFPdFdyFFdGwZS1SuNu7kuksfDMB5GlMY4Wg==
X-Received: by 2002:a17:906:f0d9:b0:a51:b666:b372 with SMTP id dk25-20020a170906f0d900b00a51b666b372mr61046ejb.27.1713468495043;
        Thu, 18 Apr 2024 12:28:15 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id jp4-20020a170906f74400b00a4734125fd2sm1265134ejb.31.2024.04.18.12.28.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:28:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Tyrone Ting <kfting@nuvoton.com>,
	Hao Wu <wuhaotsh@google.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH 22/24] exec: Remove 'exec/tswap.h' from 'exec/cpu-all.h'
Date: Thu, 18 Apr 2024 21:25:21 +0200
Message-ID: <20240418192525.97451-23-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: tohXkr3BDAIJ

"exec/cpu-all.h" doesn't require "exec/tswap.h". Remove it,
including it in the sources when required.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xtensa/bootparam.h       | 1 +
 include/exec/cpu-all.h      | 1 -
 accel/tcg/translator.c      | 1 +
 hw/arm/boot.c               | 1 +
 hw/arm/npcm7xx.c            | 1 +
 hw/mips/fuloong2e.c         | 1 +
 hw/mips/malta.c             | 1 +
 hw/ppc/sam460ex.c           | 1 +
 hw/ppc/spapr.c              | 1 +
 hw/ppc/virtex_ml507.c       | 1 +
 hw/sh4/r2d.c                | 1 +
 target/arm/gdbstub.c        | 1 +
 target/xtensa/xtensa-semi.c | 1 +
 13 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/xtensa/bootparam.h b/hw/xtensa/bootparam.h
index f57ff850bc..e1d47b503c 100644
--- a/hw/xtensa/bootparam.h
+++ b/hw/xtensa/bootparam.h
@@ -1,6 +1,7 @@
 #ifndef HW_XTENSA_BOOTPARAM_H
 #define HW_XTENSA_BOOTPARAM_H
 
+#include "exec/tswap.h"
 #include "exec/cpu-common.h"
 
 #define BP_TAG_COMMAND_LINE     0x1001  /* command line (0-terminated string)*/
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 554b937ddb..cfbf51822c 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -21,7 +21,6 @@
 
 #include "exec/cpu-common.h"
 #include "exec/memory.h"
-#include "exec/tswap.h"
 #include "hw/core/cpu.h"
 
 /* some important defines:
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 6832e55135..85950377d9 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -12,6 +12,7 @@
 #include "qemu/error-report.h"
 #include "exec/exec-all.h"
 #include "exec/translator.h"
+#include "exec/tswap.h"
 #include "exec/cpu_ldst.h"
 #include "exec/plugin-gen.h"
 #include "tcg/tcg-op-common.h"
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 84ea6a807a..93945a1a15 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -22,6 +22,7 @@
 #include "sysemu/reset.h"
 #include "hw/loader.h"
 #include "elf.h"
+#include "exec/tswap.h"
 #include "sysemu/device_tree.h"
 #include "qemu/config-file.h"
 #include "qemu/option.h"
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index cc68b5d8f1..1ef303415b 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -27,6 +27,7 @@
 #include "qemu/units.h"
 #include "sysemu/sysemu.h"
 #include "target/arm/cpu-qom.h"
+#include "exec/tswap.h"
 
 /*
  * This covers the whole MMIO space. We'll use this to catch any MMIO accesses
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index a45aac368c..1d0613a76f 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -40,6 +40,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
 #include "qemu/error-report.h"
+#include "exec/tswap.h"
 
 #define ENVP_PADDR              0x2000
 #define ENVP_VADDR              cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index af74008c82..3dca0f100c 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -56,6 +56,7 @@
 #include "semihosting/semihost.h"
 #include "hw/mips/cps.h"
 #include "hw/qdev-clock.h"
+#include "exec/tswap.h"
 #include "target/mips/internal.h"
 #include "trace.h"
 #include "cpu.h"
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index d42b677898..abc02f0817 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -24,6 +24,7 @@
 #include "hw/loader.h"
 #include "elf.h"
 #include "exec/memory.h"
+#include "exec/tswap.h"
 #include "ppc440.h"
 #include "hw/pci-host/ppc4xx.h"
 #include "hw/block/flash.h"
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e9bc97fee0..b4b1f43983 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -74,6 +74,7 @@
 #include "hw/virtio/virtio-scsi.h"
 #include "hw/virtio/vhost-scsi-common.h"
 
+#include "exec/tswap.h"
 #include "exec/ram_addr.h"
 #include "hw/usb.h"
 #include "qemu/config-file.h"
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index d02f330650..fd23afebf5 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -38,6 +38,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/option.h"
+#include "exec/tswap.h"
 
 #include "hw/intc/ppc-uic.h"
 #include "hw/ppc/ppc.h"
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index e5ac6751bd..5f4420f534 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -43,6 +43,7 @@
 #include "hw/loader.h"
 #include "hw/usb.h"
 #include "hw/block/flash.h"
+#include "exec/tswap.h"
 
 #define FLASH_BASE 0x00000000
 #define FLASH_SIZE (16 * MiB)
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index a3bb73cfa7..f2b001afdd 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/gdbstub.h"
+#include "exec/tswap.h"
 #include "gdbstub/helpers.h"
 #include "sysemu/tcg.h"
 #include "internals.h"
diff --git a/target/xtensa/xtensa-semi.c b/target/xtensa/xtensa-semi.c
index fa21b7e11f..dbc42d1587 100644
--- a/target/xtensa/xtensa-semi.c
+++ b/target/xtensa/xtensa-semi.c
@@ -29,6 +29,7 @@
 #include "cpu.h"
 #include "chardev/char-fe.h"
 #include "exec/helper-proto.h"
+#include "exec/tswap.h"
 #include "semihosting/semihost.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
-- 
2.41.0
