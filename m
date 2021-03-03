Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5706480lfg;
        Wed, 3 Mar 2021 13:48:40 -0800 (PST)
X-Received: by 2002:a5d:42cb:: with SMTP id t11mr768288wrr.280.1614808119943;
        Wed, 03 Mar 2021 13:48:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808119; cv=none;
        d=google.com; s=arc-20160816;
        b=Ge+7g9ja4N6vEgaUxsgVp3fU0wXUTe/GFlTiYUfBuBc1vMMG6GmDukSjfzYmOgSWYx
         E1d84rrjRuVJSpAxgSvxLr86p++T0s24NeiRqdOFXP3zjPfWN94HUHH9wvhSYOVMpAFO
         8dNrVxq4FdnsmDnlvbhLaNUiQj/HQ+HXic7uIlC/4bs18l0//MfeCDbR/nYyW18nvxyC
         mJNjt5kFYdCWnWTi0Zz0iga5up+F8iyYoTKCeEDDBHJkWc//4mQvL5CPmVpB510UVuEg
         Y/UT/ug2F4v5QkNaHXpOe4O8yj+0+d8nHCGHT89THd5GSbUqSpeZiMlfaKpy69JRDpzQ
         n4Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=aEJL6g+NIWgG6nrnpPTxwq6YXIgTFSiy1D/Ixw2Gpp0=;
        b=JRVBICCyjEtat1oLJZzrkBI+hsxBbbXjPznQhG56+KCax3/nwjStqg8j6wuqdm7qWX
         7sMz29CGrFZhiHIdUt5LO8Q9+xKkWjrnPpbo04DVQEM/tOAoWwFKSvzVkHR0QxQkxe68
         QJSp5rlGYzYvcbcLUhYD7jQ8hFtCDzzeQISDNw+OJt3VUk7oKvcP2Ebxd+ah/xWzjBCo
         0SyUHeGzVK8oKX6ama96yAwacdn1sjMK4iV11TY5bbJEqhnyjO6SwOtMnqlnfDnk7d3g
         SCnNK3AKKnmzMRHI+0Qh8SqNqg0k6Dv7qJUtW/mHAMbqnc4n7sko9yNw4A6qjDE621Ri
         VIDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VtVa1soK;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 31sor4256654wrl.38.2021.03.03.13.48.39
        (Google Transport Security);
        Wed, 03 Mar 2021 13:48:39 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VtVa1soK;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aEJL6g+NIWgG6nrnpPTxwq6YXIgTFSiy1D/Ixw2Gpp0=;
        b=VtVa1soKCzbURK8nE5oQZKPFDK+8E3SfmmPY58ibezRQVl1D55GwJckHQZTet2K+OK
         XiFcdPJud9Or1oCbJz+q7QiliU7g0LozA4VDrfVaycagTbY5uVgLkT3PyPF0262JMnh1
         /o0N0JJlj8Ay/j8pRrL933RfiX0k91jY1wDKUzQNUBIObe5yJfB3sRboQx/USByrRNFB
         982/qxIucm0hHqvaLwQPcRis+AgtDeq3N7v227IPJjXR/kJ6hdzZkOCRydu31PUidBSE
         ewPHdbxGKb/pUt3uSKrJnV4s9KoBNSmVC+FEp6IctFWy4dQj5XUmAxan8RCVR2CEnBAe
         g+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=aEJL6g+NIWgG6nrnpPTxwq6YXIgTFSiy1D/Ixw2Gpp0=;
        b=XqLwKuVOZ29/5IIYR5QzpBN4kvrRMNwTPD34TZ71RXBiAamVpDXWzqWzMjw84WIjOI
         wpF//dsGrqcZENFUGD1mXgZfN61n4I18pvU2tpxgaZv0IyQyopCzMTtzNCQgMDbgsz8E
         fkI+bcokMOywAsllHHcsvlmuIlB0W5MftoVL9+DUz7cWYaINrOWfQ6JMxBri7P9SsERx
         EKT4u+3JLkR00Q+cIbsgmkEtS/eOd9ywWogauJziRHwsTJIapGy7XQJaRUA4o6nHdoJJ
         ukpvqhCv2wiDizJVZfXNtMt5aWzIYeC/grznytWT4NlYvwDlTA0C/Ivy734y+Dj9XrON
         jXvg==
X-Gm-Message-State: AOAM5328UkFR2oDBnTj7DiNoyPGp6G7RK6PE+AzvFI0tbu5lOSA5LYDv
	6wEJ03a8N7k6G+su0D1ixLM=
X-Google-Smtp-Source: ABdhPJwsgWrcAs3BNinoRi/a2rFUVJ5363ya/G70w8elT2tkZJJkg/cnXwS/3HmJ/X7i1Da+5A7/cQ==
X-Received: by 2002:adf:b1c9:: with SMTP id r9mr703839wra.51.1614808119701;
        Wed, 03 Mar 2021 13:48:39 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id 18sm6721360wmj.21.2021.03.03.13.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:48:39 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Sarah Harris <S.E.Harris@kent.ac.uk>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Taylor Simpson <tsimpson@quicinc.com>,
	Michael Walle <michael@walle.cc>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Anthony Green <green@moxielogic.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v4 16/28] cpu: Restrict "hw/core/sysemu-cpu-ops.h" to target/cpu.c
Date: Wed,  3 Mar 2021 22:46:56 +0100
Message-Id: <20210303214708.1727801-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hQldQvm2TQJq

Somehow similar to commit 78271684719 ("cpu: tcg_ops: move to
tcg-cpu-ops.h, keep a pointer in CPUClass"):

We cannot in principle make the SysEmu Operations field definitions
conditional on CONFIG_SOFTMMU in code that is included by both
common_ss and specific_ss modules.

Therefore, what we can do safely to restrict the SysEmu fields to
system emulation builds, is to move all sysemu operations into a
separate header file, which is only included by system-specific code.

This leaves just a NULL pointer in the cpu.h for the user-mode builds.

Inspired-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h   | 3 ++-
 target/alpha/cpu.h      | 3 +++
 target/arm/cpu.h        | 3 +++
 target/avr/cpu.h        | 1 +
 target/cris/cpu.h       | 3 +++
 target/hexagon/cpu.h    | 3 +++
 target/hppa/cpu.h       | 3 +++
 target/i386/cpu.h       | 3 +++
 target/lm32/cpu.h       | 3 +++
 target/m68k/cpu.h       | 3 +++
 target/microblaze/cpu.h | 1 +
 target/mips/cpu.h       | 3 +++
 target/moxie/cpu.h      | 3 +++
 target/nios2/cpu.h      | 1 +
 target/openrisc/cpu.h   | 3 +++
 target/ppc/cpu.h        | 3 +++
 target/riscv/cpu.h      | 3 +++
 target/rx/cpu.h         | 1 +
 target/s390x/cpu.h      | 3 +++
 target/sh4/cpu.h        | 3 +++
 target/sparc/cpu.h      | 3 +++
 target/tilegx/cpu.h     | 3 +++
 target/tricore/cpu.h    | 3 +++
 target/unicore32/cpu.h  | 3 +++
 target/xtensa/cpu.h     | 3 +++
 cpu.c                   | 1 +
 hw/core/cpu.c           | 1 +
 27 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 960846d2b64..fe4206b540f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -80,7 +80,8 @@ struct TCGCPUOps;
 /* see accel-cpu.h */
 struct AccelCPUClass;
 
-#include "hw/core/sysemu-cpu-ops.h"
+/* see sysemu-cpu-ops.h */
+struct SysemuCPUOps;
 
 /**
  * CPUClass:
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 82df108967b..f1218a27706 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -22,6 +22,9 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 /* Alpha processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index efa1618c4d5..265d00d55dd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -25,6 +25,9 @@
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "qapi/qapi-types-common.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 /* ARM processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index d148e8c75a4..e0419649fa7 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -23,6 +23,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 #ifdef CONFIG_USER_ONLY
 #error "AVR 8-bit does not support user mode"
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index d3b64929096..4450f2268ea 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -23,6 +23,9 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 #define EXCP_NMI        1
 #define EXCP_GURU       2
diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index e04eac591c8..2a878e77f08 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -26,6 +26,9 @@ typedef struct CPUHexagonState CPUHexagonState;
 #include "qemu-common.h"
 #include "exec/cpu-defs.h"
 #include "hex_regs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 #define NUM_PREGS 4
 #define TOTAL_PER_THREAD_REGS 64
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 61178fa6a2a..94d2d4701c4 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -23,6 +23,9 @@
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "exec/memory.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 /* PA-RISC 1.x processors have a strong memory model.  */
 /* ??? While we do not yet implement PA-RISC 2.0, those processors have
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index b4b136cd0d1..06965f11100 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -25,6 +25,9 @@
 #include "kvm/hyperv-proto.h"
 #include "exec/cpu-defs.h"
 #include "qapi/qapi-types-common.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 /* The x86 has a strong memory model with some store-after-load re-ordering */
 #define TCG_GUEST_DEFAULT_MO      (TCG_MO_ALL & ~TCG_MO_ST_LD)
diff --git a/target/lm32/cpu.h b/target/lm32/cpu.h
index ea7c01ca8b0..034183dad30 100644
--- a/target/lm32/cpu.h
+++ b/target/lm32/cpu.h
@@ -22,6 +22,9 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 typedef struct CPULM32State CPULM32State;
 
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 7c3feeaf8a6..4b0a19bdf44 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -23,6 +23,9 @@
 
 #include "exec/cpu-defs.h"
 #include "cpu-qom.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 #define OS_BYTE     0
 #define OS_WORD     1
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index e4bba8a7551..3f5c2e048e5 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -26,6 +26,7 @@
 
 typedef struct CPUMBState CPUMBState;
 #if !defined(CONFIG_USER_ONLY)
+#include "hw/core/sysemu-cpu-ops.h"
 #include "mmu.h"
 #endif
 
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 075c24abdad..923ab71f8d7 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -6,6 +6,9 @@
 #include "fpu/softfloat-types.h"
 #include "hw/clock.h"
 #include "mips-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 #define TCG_GUEST_DEFAULT_MO (0)
 
diff --git a/target/moxie/cpu.h b/target/moxie/cpu.h
index bd6ab66084d..7a0a5e95d01 100644
--- a/target/moxie/cpu.h
+++ b/target/moxie/cpu.h
@@ -22,6 +22,9 @@
 
 #include "exec/cpu-defs.h"
 #include "qom/object.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 #define MOXIE_EX_DIV0        0
 #define MOXIE_EX_BAD         1
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 2ab82fdc713..1b88b027063 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -27,6 +27,7 @@
 
 typedef struct CPUNios2State CPUNios2State;
 #if !defined(CONFIG_USER_ONLY)
+#include "hw/core/sysemu-cpu-ops.h"
 #include "mmu.h"
 #endif
 
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 82cbaeb4f84..2a6f9f48547 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -23,6 +23,9 @@
 #include "exec/cpu-defs.h"
 #include "hw/core/cpu.h"
 #include "qom/object.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 /* cpu_openrisc_map_address_* in CPUOpenRISCTLBContext need this decl.  */
 struct OpenRISCCPU;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e73416da68d..f889c28e548 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -24,6 +24,9 @@
 #include "exec/cpu-defs.h"
 #include "cpu-qom.h"
 #include "qom/object.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 #define TCG_GUEST_DEFAULT_MO 0
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 02758ae0eb4..254eefaf824 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -25,6 +25,9 @@
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat-types.h"
 #include "qom/object.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 #define TCG_GUEST_DEFAULT_MO 0
 
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 0b4b998c7be..d9b7b63716a 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -25,6 +25,7 @@
 #include "cpu-qom.h"
 
 #include "exec/cpu-defs.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 /* PSW define */
 REG32(PSW, 0)
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 60d434d5edd..2ca6a4f559f 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -28,6 +28,9 @@
 #include "cpu-qom.h"
 #include "cpu_models.h"
 #include "exec/cpu-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 #define ELF_MACHINE_UNAME "S390X"
 
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 714e3b56413..07ed2f3e206 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -22,6 +22,9 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 /* CPU Subtypes */
 #define SH_CPU_SH7750  (1 << 0)
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 4b2290650be..237ffc4fe66 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -4,6 +4,9 @@
 #include "qemu/bswap.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 #if !defined(TARGET_SPARC64)
 #define TARGET_DPREGS 16
diff --git a/target/tilegx/cpu.h b/target/tilegx/cpu.h
index 7d8e44d12e4..54bdbf0ca1e 100644
--- a/target/tilegx/cpu.h
+++ b/target/tilegx/cpu.h
@@ -22,6 +22,9 @@
 
 #include "exec/cpu-defs.h"
 #include "qom/object.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 /* TILE-Gx common register alias */
 #define TILEGX_R_RE    0   /*  0 register, for function/syscall return value */
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index b82349d1b10..cb0b989953e 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -23,6 +23,9 @@
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "tricore-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 struct tricore_boot_info;
 
diff --git a/target/unicore32/cpu.h b/target/unicore32/cpu.h
index 7a32e086ed3..de475d0fc2e 100644
--- a/target/unicore32/cpu.h
+++ b/target/unicore32/cpu.h
@@ -14,6 +14,9 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 typedef struct CPUUniCore32State {
     /* Regs for current mode.  */
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 3bd4f691c1a..ea4ee5338f3 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -31,6 +31,9 @@
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "xtensa-isa.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 /* Xtensa processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)
diff --git a/cpu.c b/cpu.c
index 64e17537e21..29dafee581f 100644
--- a/cpu.c
+++ b/cpu.c
@@ -29,6 +29,7 @@
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 #else
+#include "hw/core/sysemu-cpu-ops.h"
 #include "exec/address-spaces.h"
 #endif
 #include "sysemu/tcg.h"
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 7a8487d468f..da7543be514 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -35,6 +35,7 @@
 #include "trace/trace-root.h"
 #include "qemu/plugin.h"
 #include "sysemu/hw_accel.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 CPUState *cpu_by_arch_id(int64_t id)
 {
-- 
2.26.2
