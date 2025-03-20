Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1278926njc;
        Thu, 20 Mar 2025 15:30:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXpcQccab3tjrrA/Y+qHj0Ty39ye7JWpS3heip8pcEg/s5srxt/y1PSWOzFVyaK8qQHoCtPxp8wjSoXpw==@linaro.org
X-Received: by 2002:a17:902:e952:b0:220:c164:6ee1 with SMTP id d9443c01a7336-22780e038camr20432515ad.32.1742509821877;
        Thu, 20 Mar 2025 15:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509821; cv=none;
        d=google.com; s=arc-20240605;
        b=NYXvTjJVsQCdNdCZOMhZkE/IE0PnXGp+FRJaaRN2hg18Z0xhR7UHXA7qNOszrG4BIe
         ZbCvzMnkK7v2S3sTV2Duhp3q7675jEkY4MC4cAXv3flgOVkzJRuOE85YU05ATyxVs6NG
         zPccJQ9yb4BKO/vQUDIiMXCtB+1rsNhwAU1MfWUC7fJ97gbYUyR73oQdJej1CsGV+2Bl
         b7JeE+SsWvhv/oI67C7i3PduFAS0zxixKiuygR2uDLOioglUKFHUDoOuqoV1f/NACew9
         LSLUKXoXv/K4bf4/nRFky4IpyGLnZCduOlhmCe8hOMqYCWF9EfcszEcRBz4eGYF/T9ee
         QTRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FPSV8pXHfXTpBnRWJFMj+e6uOugRYRsikKNSvPefqio=;
        fh=XY+kkCs1kD3nEvcNa8Xu3mkU7dTguyIBbLH/7rmBgpM=;
        b=URamxUDMF560My58gJbRnwhAjz4EjGxC8BHeoTMY4cQjeuejJdmWyoCD2XKe/5wyhU
         epRTUMI6s+nBmPCtUXrRa29Vu/K7DYIS/A7B3hECY3TekBbKAgXmYltmxt8UrWMommAQ
         9eccstaoO2UKadnpG+6sCAeJ3OWJoXaHsNp0ZTPEEbg9KdlVbx6QOEYLpzcf49ZyGd6c
         TK0FRrDqgtxP7v2X5lx5fwCl4tahdydFCs7bBNtrKiSpz2GBdAtBsjvqWboDkhGx6amA
         dn0R7yjM0H6V6ue51emB5jKaTeNVLQxBDte/xm+6SJZ2KeoIVzR2nCJFyf6fF9J8V7J1
         gEIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nHsA+Fo7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227811dd39dsor4763705ad.15.2025.03.20.15.30.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nHsA+Fo7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509821; x=1743114621; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPSV8pXHfXTpBnRWJFMj+e6uOugRYRsikKNSvPefqio=;
        b=nHsA+Fo7njqSPhREbfxdvpA8d4/T+84qMPwVi4HtZsZJMhM6lH9XklprRaw8ezkSH0
         a2U99CzxABLO+uQEqpmgQN4oBfvqZ4RaJzfh2nlGduaCdBr3SLAksdYn1Rk1MaPgcCdH
         YFHrSs50LgCg48S1zWLa3kYdp2qXZ8apmtS+BMVCRrzFqn6/Fts4D6TFV48nbb74OvCb
         tlYTGjnZ5J+SWeHIqIfdKTXkqBPpekEbKZwx5L8sIRelTCfRpJ5PR+0bcHhdjSmIWylm
         W8hCiAkvicNvQOu7zkb1C/kxwSZHi2Qtog/mNnQZRbDP/2qgyZREbd2GiaiI8f+W+Fks
         XJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509821; x=1743114621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPSV8pXHfXTpBnRWJFMj+e6uOugRYRsikKNSvPefqio=;
        b=T3cjPcwgUgjGoVoTG1wyo8VTXdbcC1v6unQfeEPKEFUO3U1/UHVOsNGY+7nnSU9i8M
         WSdHGnOc0tT8YTBhr/CYU5tt3LPYxKMwogqK5429rv9EDOjrc7cdW5UWtTQ2sqUvQpEX
         a7x5qkbLV72Z8xpHx5Lv2v9PI3HeFcLbXfRzHPgbXhD2Ln1xMbZ/54sLJ2wCdteEiN7n
         NEegF4Dnem7tROGFILIqy/wFoIDO5YVWrbojLEkrf6FhGqTjU/JQxSuuVGjByny4ixJS
         Blc5prlca8wYUmTA+2CACXYhGGdukwBb/VlS1yrmFAI30s1sqwev9xxkBW4suHyXBNij
         2GoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUASkUWFT5iFyulZ+itUKPVTrdkd4nWhJ30BXGeUCpyk+O8p9nuYlebGdV5QPKI+q/gnnjKn237UQ9xcg==@linaro.org
X-Gm-Message-State: AOJu0Yyas1Qogib9a5TdHPvFGpvG5QUJOW4/+g/BKxcxkILWKp1fGSbG
	liXeXv+FuihQvwaDt62I/0ExmNuTfJ3vZdrtB+N03aOowq8ZI6kUmvoQRxZdd1NrKQ==
X-Gm-Gg: ASbGncuAHh2+1MqI058a0kZ1lb0uhsad4Uf7IdqqoDiNZ4gOEzHmdSbMM3ro7t71bZl
	Zgc5/Masno28UwVsIwI601PXmfch4cQKjyZsEHff61CevhfrkXVdBl35mY5u+SfwGMNPfkMHe0u
	Ti3EdwYJ83T2yw8rEqB/EbTGbupUCpfqbchJr4yA0nQkO7wCPOwjXVc1M2RWIv+4C2557MrWUeU
	UfJ/kSNyNk/Kl3kTcUPK5aS6oCntXzXP7Yi/gvQAzFE6vCyFOOFabrnVYLiczrUzAFQhdhPz4rM
	sEJPc3KEn/Fcr4fbOC/CK74YcU3psLOUICT4y6e6pM8H
X-Google-Smtp-Source: AGHT+IHkWL+0yCmhSmOWVd5YOOM/8V2mO2P5lhavaeImcSParSP/CyztOzEEXx2kMrrPCLtgd8HPRQ==
X-Received: by 2002:a17:902:f54a:b0:21f:35fd:1b6c with SMTP id d9443c01a7336-22780e19646mr14633415ad.45.1742509821411;
        Thu, 20 Mar 2025 15:30:21 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:21 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 08/30] exec/cpu-all: remove exec/cpu-interrupt include
Date: Thu, 20 Mar 2025 15:29:40 -0700
Message-Id: <20250320223002.2915728-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hM26y6bVCUEA

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h  | 1 -
 target/alpha/cpu.h      | 1 +
 target/arm/cpu.h        | 1 +
 target/avr/cpu.h        | 1 +
 target/hppa/cpu.h       | 1 +
 target/i386/cpu.h       | 1 +
 target/loongarch/cpu.h  | 1 +
 target/m68k/cpu.h       | 1 +
 target/microblaze/cpu.h | 1 +
 target/mips/cpu.h       | 1 +
 target/openrisc/cpu.h   | 1 +
 target/ppc/cpu.h        | 1 +
 target/riscv/cpu.h      | 1 +
 target/rx/cpu.h         | 1 +
 target/s390x/cpu.h      | 1 +
 target/sh4/cpu.h        | 1 +
 target/sparc/cpu.h      | 1 +
 target/xtensa/cpu.h     | 1 +
 accel/tcg/cpu-exec.c    | 1 +
 hw/alpha/typhoon.c      | 1 +
 hw/m68k/next-cube.c     | 1 +
 hw/ppc/ppc.c            | 1 +
 hw/xtensa/pic_cpu.c     | 1 +
 23 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 1539574a22a..e5d852fbe2c 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -20,7 +20,6 @@
 #define CPU_ALL_H
 
 #include "exec/cpu-common.h"
-#include "exec/cpu-interrupt.h"
 #include "hw/core/cpu.h"
 
 /* page related stuff */
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 80562adfb5c..42788a6a0bc 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -22,6 +22,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "exec/cpu-interrupt.h"
 #include "qemu/cpu-float.h"
 
 #define ICACHE_LINE_SIZE 32
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a8177c6c2e8..958a921490e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -25,6 +25,7 @@
 #include "hw/registerfields.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "exec/cpu-interrupt.h"
 #include "exec/gdbstub.h"
 #include "exec/page-protection.h"
 #include "qapi/qapi-types-common.h"
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 06f5ae4d1b1..714c6821e2f 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -23,6 +23,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "exec/cpu-interrupt.h"
 
 #ifdef CONFIG_USER_ONLY
 #error "AVR 8-bit does not support user mode"
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index bb997d07516..986dc655fc1 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -22,6 +22,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "exec/cpu-interrupt.h"
 #include "system/memory.h"
 #include "qemu/cpu-float.h"
 #include "qemu/interval-tree.h"
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 76f24446a55..64706bd6e5d 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -24,6 +24,7 @@
 #include "cpu-qom.h"
 #include "kvm/hyperv-proto.h"
 #include "exec/cpu-defs.h"
+#include "exec/cpu-interrupt.h"
 #include "exec/memop.h"
 #include "hw/i386/topology.h"
 #include "qapi/qapi-types-common.h"
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 1916716547a..1dba8ac6a7c 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -10,6 +10,7 @@
 
 #include "qemu/int128.h"
 #include "exec/cpu-defs.h"
+#include "exec/cpu-interrupt.h"
 #include "fpu/softfloat-types.h"
 #include "hw/registerfields.h"
 #include "qemu/timer.h"
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index ddb0f29f4a3..451644a05a3 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -22,6 +22,7 @@
 #define M68K_CPU_H
 
 #include "exec/cpu-defs.h"
+#include "exec/cpu-interrupt.h"
 #include "qemu/cpu-float.h"
 #include "cpu-qom.h"
 
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index e44ddd53078..d29681abed4 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -23,6 +23,7 @@
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "qemu/cpu-float.h"
+#include "exec/cpu-interrupt.h"
 
 typedef struct CPUArchState CPUMBState;
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 9ef72a95d71..29362498ec4 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -3,6 +3,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "exec/cpu-interrupt.h"
 #ifndef CONFIG_USER_ONLY
 #include "system/memory.h"
 #endif
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index b97d2ffdd26..c153823b629 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -22,6 +22,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "exec/cpu-interrupt.h"
 #include "fpu/softfloat-types.h"
 
 /**
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index efab54a0683..dd339907f1f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -23,6 +23,7 @@
 #include "qemu/int128.h"
 #include "qemu/cpu-float.h"
 #include "exec/cpu-defs.h"
+#include "exec/cpu-interrupt.h"
 #include "cpu-qom.h"
 #include "qom/object.h"
 #include "hw/registerfields.h"
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7de19b41836..df37198897c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -24,6 +24,7 @@
 #include "hw/registerfields.h"
 #include "hw/qdev-properties.h"
 #include "exec/cpu-defs.h"
+#include "exec/cpu-interrupt.h"
 #include "exec/gdbstub.h"
 #include "qemu/cpu-float.h"
 #include "qom/object.h"
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 349d61c4e40..5f2fcb66563 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -24,6 +24,7 @@
 #include "cpu-qom.h"
 
 #include "exec/cpu-defs.h"
+#include "exec/cpu-interrupt.h"
 #include "qemu/cpu-float.h"
 
 #ifdef CONFIG_USER_ONLY
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 5b7992deda6..0a32ad4c613 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -28,6 +28,7 @@
 #include "cpu-qom.h"
 #include "cpu_models.h"
 #include "exec/cpu-defs.h"
+#include "exec/cpu-interrupt.h"
 #include "qemu/cpu-float.h"
 #include "qapi/qapi-types-machine-common.h"
 
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index d536d5d7154..18557d8c386 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -22,6 +22,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "exec/cpu-interrupt.h"
 #include "qemu/cpu-float.h"
 
 /* CPU Subtypes */
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 462bcb6c0e6..923836f47c8 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -4,6 +4,7 @@
 #include "qemu/bswap.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "exec/cpu-interrupt.h"
 #include "qemu/cpu-float.h"
 
 #if !defined(TARGET_SPARC64)
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 8d70bfc0cd4..66846314786 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -31,6 +31,7 @@
 #include "cpu-qom.h"
 #include "qemu/cpu-float.h"
 #include "exec/cpu-defs.h"
+#include "exec/cpu-interrupt.h"
 #include "hw/clock.h"
 #include "xtensa-isa.h"
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 034c2ded6b1..207416e0212 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -26,6 +26,7 @@
 #include "trace.h"
 #include "disas/disas.h"
 #include "exec/cpu-common.h"
+#include "exec/cpu-interrupt.h"
 #include "exec/page-protection.h"
 #include "exec/mmap-lock.h"
 #include "exec/translation-block.h"
diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index e8711ae16a3..9718e1a579c 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -9,6 +9,7 @@
 #include "qemu/osdep.h"
 #include "qemu/module.h"
 #include "qemu/units.h"
+#include "exec/cpu-interrupt.h"
 #include "qapi/error.h"
 #include "hw/pci/pci_host.h"
 #include "cpu.h"
diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index 0570e4a76f1..4ae5668331b 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -12,6 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "exec/hwaddr.h"
+#include "exec/cpu-interrupt.h"
 #include "system/system.h"
 #include "system/qtest.h"
 #include "hw/irq.h"
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 3a80931538f..43d0d0e7553 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -27,6 +27,7 @@
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/ppc_e500.h"
 #include "qemu/timer.h"
+#include "exec/cpu-interrupt.h"
 #include "system/cpus.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
diff --git a/hw/xtensa/pic_cpu.c b/hw/xtensa/pic_cpu.c
index 8cef88c61bc..e3885316106 100644
--- a/hw/xtensa/pic_cpu.c
+++ b/hw/xtensa/pic_cpu.c
@@ -27,6 +27,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "exec/cpu-interrupt.h"
 #include "hw/irq.h"
 #include "qemu/log.h"
 #include "qemu/timer.h"
-- 
2.39.5
