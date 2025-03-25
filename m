Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2396973njc;
        Mon, 24 Mar 2025 21:59:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVRDfusVvEmfOq7aVWk8gweKz63KwMx0RMkQ2+yZ9lN8PGwxLdgd8HetDeqYEz6gNjaum6EBbbbVVaOgw==@linaro.org
X-Received: by 2002:a17:90b:2551:b0:2ee:d193:f3d5 with SMTP id 98e67ed59e1d1-3030fe595c0mr27539762a91.7.1742878768574;
        Mon, 24 Mar 2025 21:59:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878768; cv=none;
        d=google.com; s=arc-20240605;
        b=YHk3hoxVyzqm9HimAbIHVO88yaxOdCtOTij/Clhb2bJO9F+mlL76USbcw3SezvNw3I
         AmC+MfRYVVAr/j8lCWNrIih5GHeMSdOFnZkV6izE7JZbBg5XT7gnmFZh63ml+H9PBQdx
         NlvYBFB2QGZfXjHr7Y7jDUSBvKSRwRB8ZSbd2xHBCrQNIkVEZDlxaTgyXzXm0nF5nOdY
         jNW5mRRUAqxH9PSbMgQ6lMpMF4Gr2jnrDTwCucsWlCbPtQTNx3mCFOEtfhuRMsjTmYZ4
         6q6BfEbcrx8PAdD++IdMpB1168MtneWXzfSO7o0aE22KXvhHHE/6MffItNx289ytCmkb
         Ft0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Org2345gwISbkRqtcCIQg/RHNCRTSRlXvAPbgPEQ0IA=;
        fh=9jG2akrgOjmTqYmoM2QJ/ycLVVcWmnatvIa6ppViBYg=;
        b=dhmNNOstDvuX/T8XmnLApQmAoI+Zrv6wUN3bZWoTCrG9nDOgi2IBweZ3Hg2hJPlol9
         uVlZE7IggZW94E5/XF06msQPeZvHaoNw+BqXj4Zfs+wfDxjHrw9CMdK/gaASzXU8RajR
         rYVKnisCpUkPxmJbRCyUm04tAjnXkF9HHBZ375ZoqOvx1I7rBXHIdI/Z1PI7EAP/Mm/+
         ElousO3yqtITQN0EZqBAyz944LXyHCwJHceWdFQsYzjEwJp+bErNesjiSSRDaBD2zqMR
         DgrzAM0XGMT6AgJVUiZahe/XKuYOKINjzqUoubsa6+Antg8tGnMHo6meE46zBl6rsSvI
         zxgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C4k1OyZ5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3030f779853sor7794807a91.4.2025.03.24.21.59.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C4k1OyZ5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878768; x=1743483568; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Org2345gwISbkRqtcCIQg/RHNCRTSRlXvAPbgPEQ0IA=;
        b=C4k1OyZ5rDpnviQ7F1k8daS2LlP02MmpORcmPND9Rumh/8OdiDiVOdxAqzxBHarzgU
         eGbwKwpYUxKCommVEo+/oG9TfgsmGp4mlZZv9xDTlsxfSwypcz6yar3076trT9xfoe4u
         /Hr1obFVDG5ijQ4KLNhyXkbMUYXakSGl7MLo42cP8fAlJZ4nm8zlyEThTQyuerCtqrC2
         E7MF/HdkkoE2ikbt12Orwvln8NhfMAW8mkLazrVgW4JtkaqBsP/ggBbT/LGc5SlBqN01
         hCRheCDYruXibUD88FtSklutKsub1nJp9V7PxGbHeIBAT7JLJz7MAZc1uExGeCPPMGxx
         VdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878768; x=1743483568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Org2345gwISbkRqtcCIQg/RHNCRTSRlXvAPbgPEQ0IA=;
        b=FZLNRFh8Jd28GAsOPyHjS3R0JHfDdloAxhCwyJ7ifmDqFpi3LMHL3CjABMmE3QkZ/O
         5noslK5Va53OjhSprS6BXA9IuFS8ISBdZk2y12s6IVAKbeDJnvIqDtehbKaja2wCalEv
         Ea11WV1pKowz2C+J9fAjWohMwFZi5iwbHtSjQR/5N11tSWkBHQ4zCiKCVTdNDqUOtP34
         tYdwZeeIOpXzsOv8c2WzAuYrZ8DwVJIWtpXw9Ct9sZbrtLq/XoR3Ayro2Kq/NC3jcGV4
         idkLwlW/aFPhe5LWFhzmmqHSop+iEx0Qx6//Lo7j0TKN/cqJIqC19ZPBxMi2cIu9aNhm
         fbbA==
X-Forwarded-Encrypted: i=1; AJvYcCWbeeMcpHpB7TIDs0zuVM149pyfnhlHq1ziz/DH4+h6yf2hm0tGnjKYeihWUHgdUTNpFQGFcopl3hLQxA==@linaro.org
X-Gm-Message-State: AOJu0YxbbHYO/IY4B6Fg6yq8O8MRfmG50dad4icLj/o/+Hd5Vfnfs21r
	h/y17d708/NlHGY8iwYCG+eHT+vmeAf1wzU6smf7rhidyAAfdP6dJ5Zu1i0+pVhMZA==
X-Gm-Gg: ASbGncsKoK6aMgxchlFfklcLJcWmkDYdlDnBG+t3+qslqdG7ugb/aw6296zZqJ21CbA
	tht+ChNockp8Jr94HhdfoDNTwPOT+HqMxpRzy9IV02OZr9Ahon+4fwvfHOxGPVwoQCTjDB6GvFO
	1r5zbVaVlhiIW1YN0Ai5BeupCQ63joBM4WvF7kO3azh60G1jKQkFWDRwxfDWPo3KRk93y4dgQkW
	JnwBPVrOtvDgYpPdxBjNblovCwL9F6tsRwZa9Fd0PN+f+qdWP2+DCzWpa5UHKAIkpyafr3C+/cE
	rNiFMnerIa3RDZMimT+l1h6JEYDXJyPgvvfFWRkyuKbM
X-Google-Smtp-Source: AGHT+IHabWwVD3wJqLYVJFSCVba25yVxMopHqjmL7IhxQTtf9QY7LAVwfCCLUMQE7U74Hqiw5Bl0hw==
X-Received: by 2002:a17:90b:51cf:b0:2ee:edae:75e with SMTP id 98e67ed59e1d1-3030fe86471mr24805706a91.13.1742878767928;
        Mon, 24 Mar 2025 21:59:27 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:27 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 07/29] exec/cpu-all: remove exec/cpu-interrupt include
Date: Mon, 24 Mar 2025 21:58:52 -0700
Message-Id: <20250325045915.994760-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: BEwJKTdeVTCN

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index 3ee83517dcd..7489ba95648 100644
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
index 51e49e03dec..556eda57e94 100644
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
