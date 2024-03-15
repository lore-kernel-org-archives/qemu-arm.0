Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp989860eju;
        Fri, 15 Mar 2024 06:10:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWz4hcpvuDo3SJQG+7SrDijJPaEI+v2HEZxkQTiozp+nMU8hkotqDvLI2RmwegPFPM4cMOfwmqtiEsJAboFui40eN6EesnI
X-Received: by 2002:a05:651c:154:b0:2d3:e0ec:36c7 with SMTP id c20-20020a05651c015400b002d3e0ec36c7mr3044629ljd.43.1710508242444;
        Fri, 15 Mar 2024 06:10:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508242; cv=none;
        d=google.com; s=arc-20160816;
        b=M0XNhCyR3GdtXVEMiUjat+TvXOsRNe7TxxhWsyk8BNueyb7BMongw170KF9LWROntR
         MO2PStGUFrFf+lbb3xZVn4/DbV3uKGJFnEJq9Bc33MIq+uY6fk8lf5vB6uVinhGrFK6W
         BORUXtk2qOmCR7IURwvag3qlzZXUZ+FsjuAAFJef3i/XZjObGkSQZosrWN036ZRnsWrR
         xGddqghRgGnwmPR/UmvjKp0yqptZ9Acykfnrcup1kkBofqa8AdVP8/cxoF/sZUnTY2xG
         HhHKKsM51ZKTSsa0pZHSsuxCPpBkt+895b4Artpl526c4sd5hjluIDERDev6Os1zZLQH
         TCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=J25HPqsyrmOQ1iioSn9g7nmBc+Xq8CsuJB3WGvQV87Y=;
        fh=/pg+MFNPOp7PpveO/uSti8HL9OXc4TinFqf86Yo64G8=;
        b=XuCC+QZXJRa7Qnl20zyG9By8F14kRh9gQqwgbSpLTVjjRNIFvXwphQqONuEE/jCFYa
         WKhQl8S0C0JUOVAJGYL1ZbkhoBXq/cDgRBNIUPuV56aBbBtv40Utb91t2z3Shv4vrjeG
         4rS9GsDObptDseB9NuJzoxNTGuaAjAFJ2AkCQ9PV5Ne0n+qCUrBub4edBu+lC0D6snCE
         2B/0uJyHNOlWBQ2aR+R0EN7OMLnZVZYl/aPmBhiwWh/sTQbf51AwpL0cfRSgOKHSJdMo
         ECpda9rUY+erKRYdifBYWLPksYeIdke3kPwbZE3v0ZSmTOkQqOw0zzv2+ChnfLCMNQMb
         keiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rNfNAi2p;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k23-20020a2e8897000000b002d41f0aa420sor829480lji.13.2024.03.15.06.10.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:10:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rNfNAi2p;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508242; x=1711113042; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J25HPqsyrmOQ1iioSn9g7nmBc+Xq8CsuJB3WGvQV87Y=;
        b=rNfNAi2pMU4GuH8wTG+l8vBI/zgXtGbFUTQkVyK1t15SDYzL/j+ogPQFY5EubRl93g
         Ik+SoYBHGpNYIwYAyicvBTvMeadzMdGF52rR7/+Y6ZdsMv4VxQoWP1PCE5J60mipXD9e
         Crg6UZzcTjLVPyHrpvJlrnRPdGn4SD/VOykw2n/r7s+5FvYp9Vr0I1WKoAZTxv/hrp24
         EeeHQ8Jzqx2txryEYF/wW66R3xkcZoFA4XfyO7365BsYjr+THpJmCM7/pnZ4inqjCpGV
         JnuDoWGHatiJH5HPuozlHtKoWfrP+mGlL6hYZ5IVc1prNN+SXj6PFwi/c+1+/jdSlfz6
         WQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508242; x=1711113042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J25HPqsyrmOQ1iioSn9g7nmBc+Xq8CsuJB3WGvQV87Y=;
        b=Kv7B8qXo6oJfyyl1WGcCIXZtB2J0Dz5oKUUBC39eHKr5bkwaaYfjcJwvxrdGssju8c
         5D0N8um3MGllsTa6SyE0y8wicCVYoz4nJf9PqCjZfrxt6nKXGMoWUsjaqKbhw8fPo7ns
         iM89sbkZhBkEsrraZm9dCkGe950WEmjmrRJiCJ1rlvqmzEnyRhBD5ATdtElQw/nXRAQU
         JiHtCxAYol1sEkY8aR6ApVBHC2BpdT6Zc2lnD3RNlBvrIikdV8aecuqK9zR4TkAlumfv
         0RjtI4NBS9qZaHLs9msObhwuZiSwocP4tuJ+oUticrsmvSMMHWrNwArL3hADun+igPpp
         Jwwg==
X-Forwarded-Encrypted: i=1; AJvYcCUzdhf1kDpGDD905IVct8ZOlDsuhm1Atzj3bPC50MIDqwveZGSaugQhWBZt+FQJjxFPeRRnCOr/8Ep2iq0LrA4TXir5Czsx
X-Gm-Message-State: AOJu0YyqnabKNneoZTr9whldlTffaZ7j5qICmdKqFgrjsDA3YhxkKD8k
	3OVQG+80v9F5pu2hrQmeT8aoJfFTaXG/gKlpC0wx2ZdYzNrdsLho1YY6THvISW0brw==
X-Google-Smtp-Source: AGHT+IEv3LwWoidfawbI4h9yAjYbFyjy4RfVu/IFC9ezcLGHzfJWoWogtJbH4nZ9k43Uxgvez5OUAA==
X-Received: by 2002:a05:651c:23a:b0:2d3:3b37:db78 with SMTP id z26-20020a05651c023a00b002d33b37db78mr2967826ljn.16.1710508241796;
        Fri, 15 Mar 2024 06:10:41 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id l23-20020a1709065a9700b00a460040a102sm1670235ejq.124.2024.03.15.06.10.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:10:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org,
	Anton Johansson <anjo@rev.ng>,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.1 13/21] system: Introduce cpu_typename_by_arch_bit()
Date: Fri, 15 Mar 2024 14:09:01 +0100
Message-ID: <20240315130910.15750-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NHug4CgKCPcs

Introduce a helper to return the CPU type name given a QemuArchBit.

The TYPE_PPC_CPU target have different 32/64-bit definitions
so we can not include it yet.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
---
 MAINTAINERS                |  1 +
 include/sysemu/arch_init.h |  2 ++
 system/cpu-qom-helpers.c   | 58 ++++++++++++++++++++++++++++++++++++++
 system/meson.build         |  1 +
 4 files changed, 62 insertions(+)
 create mode 100644 system/cpu-qom-helpers.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ed98814398..af27490243 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -148,6 +148,7 @@ M: Richard Henderson <richard.henderson@linaro.org>
 R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: system/cpus.c
+F: system/cpu-qom-helpers.c
 F: system/watchpoint.c
 F: cpu-common.c
 F: cpu-target.c
diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index cf597c40a3..1874f18e67 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -27,6 +27,8 @@ typedef enum QemuArchBit {
     QEMU_ARCH_BIT_LAST          = QEMU_ARCH_BIT_LOONGARCH
 } QemuArchBit;
 
+const char *cpu_typename_by_arch_bit(QemuArchBit arch_bit);
+
 enum QemuArchMask {
     QEMU_ARCH_ALL = -1,
     QEMU_ARCH_ALPHA             = (1 << QEMU_ARCH_BIT_ALPHA),
diff --git a/system/cpu-qom-helpers.c b/system/cpu-qom-helpers.c
new file mode 100644
index 0000000000..0d402ee3a0
--- /dev/null
+++ b/system/cpu-qom-helpers.c
@@ -0,0 +1,58 @@
+/*
+ * Helpers for CPU QOM types
+ *
+ * SPDX-FileCopyrightText: 2024 Linaro Ltd.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/arch_init.h"
+
+#include "target/alpha/cpu-qom.h"
+#include "target/arm/cpu-qom.h"
+#include "target/avr/cpu-qom.h"
+#include "target/cris/cpu-qom.h"
+#include "target/hexagon/cpu-qom.h"
+#include "target/hppa/cpu-qom.h"
+#include "target/i386/cpu-qom.h"
+#include "target/loongarch/cpu-qom.h"
+#include "target/m68k/cpu-qom.h"
+#include "target/microblaze/cpu-qom.h"
+#include "target/mips/cpu-qom.h"
+#include "target/nios2/cpu-qom.h"
+#include "target/openrisc/cpu-qom.h"
+#include "target/riscv/cpu-qom.h"
+#include "target/rx/cpu-qom.h"
+#include "target/s390x/cpu-qom.h"
+#include "target/sparc/cpu-qom.h"
+#include "target/sh4/cpu-qom.h"
+#include "target/tricore/cpu-qom.h"
+#include "target/xtensa/cpu-qom.h"
+
+const char *cpu_typename_by_arch_bit(QemuArchBit arch_bit)
+{
+    static const char *cpu_bit_to_typename[QEMU_ARCH_BIT_LAST + 1] = {
+        [QEMU_ARCH_BIT_ALPHA]       = TYPE_ALPHA_CPU,
+        [QEMU_ARCH_BIT_ARM]         = TYPE_ARM_CPU,
+        [QEMU_ARCH_BIT_CRIS]        = TYPE_CRIS_CPU,
+        [QEMU_ARCH_BIT_I386]        = TYPE_I386_CPU,
+        [QEMU_ARCH_BIT_M68K]        = TYPE_M68K_CPU,
+        [QEMU_ARCH_BIT_MICROBLAZE]  = TYPE_MICROBLAZE_CPU,
+        [QEMU_ARCH_BIT_MIPS]        = TYPE_MIPS_CPU,
+        /* TODO:                      TYPE_PPC_CPU */
+        [QEMU_ARCH_BIT_S390X]       = TYPE_S390_CPU,
+        [QEMU_ARCH_BIT_SH4]         = TYPE_SUPERH_CPU,
+        [QEMU_ARCH_BIT_SPARC]       = TYPE_SPARC_CPU,
+        [QEMU_ARCH_BIT_XTENSA]      = TYPE_XTENSA_CPU,
+        [QEMU_ARCH_BIT_OPENRISC]    = TYPE_OPENRISC_CPU,
+        [QEMU_ARCH_BIT_TRICORE]     = TYPE_TRICORE_CPU,
+        [QEMU_ARCH_BIT_NIOS2]       = TYPE_NIOS2_CPU,
+        [QEMU_ARCH_BIT_HPPA]        = TYPE_HPPA_CPU,
+        [QEMU_ARCH_BIT_RISCV]       = TYPE_RISCV_CPU,
+        [QEMU_ARCH_BIT_RX]          = TYPE_RX_CPU,
+        [QEMU_ARCH_BIT_AVR]         = TYPE_AVR_CPU,
+        [QEMU_ARCH_BIT_HEXAGON]     = TYPE_HEXAGON_CPU,
+        [QEMU_ARCH_BIT_LOONGARCH]   = TYPE_LOONGARCH_CPU,
+    };
+    return cpu_bit_to_typename[arch_bit];
+}
diff --git a/system/meson.build b/system/meson.build
index 25e2117250..c6ee97e3b2 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -10,6 +10,7 @@ system_ss.add(files(
   'balloon.c',
   'bootdevice.c',
   'cpus.c',
+  'cpu-qom-helpers.c',
   'cpu-throttle.c',
   'cpu-timers.c',
   'datadir.c',
-- 
2.41.0
