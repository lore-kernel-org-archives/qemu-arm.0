Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397056njc;
        Mon, 24 Mar 2025 21:59:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUoSwo67LETajS4GuvKx03HTc/z/D+3Fo/SCysfrtzfxoFfBEFWBGY5sZ6T7eC+R2BSwgqdBAaZJqbQaw==@linaro.org
X-Received: by 2002:a05:6a20:2d24:b0:1f5:80a3:b006 with SMTP id adf61e73a8af0-1fe42f58220mr26194826637.21.1742878775737;
        Mon, 24 Mar 2025 21:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878775; cv=none;
        d=google.com; s=arc-20240605;
        b=FDdhTlS40xZAmLb3HLar5BB7F9gibpeaey+S34sEx6unZQoYS+k8TLu1+yWOEYs/HP
         4vVOF1eygZin4/RZK1PoUrgLU70uO2WiAgjcUMjTWTCbVXPVWfWloptICJO4T5VjyHeK
         vtXLdqiSU5foxqodcrgDK9/y42HOluO3M6rMJQtV4zvlAlA66djcEiNAruHrZIG7qqwS
         FWtfo4W2RaFfq85cA6f0fFKeqq61lpdYYgCz2OhTLrqWRzVbZEp2mMMZa+EKZkDhU/Xs
         kReMHkv20sLI1lQonKMBtuMZMqxZXNsHe+LWHPhe1hsSLonwDRZ/+nlVKggOFbyoxWT3
         BxlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=da9qCgJ+S1UaM0j+OYD82icAp+J1ucJQQo9Biij6cxI=;
        fh=svHgrvaT+2KLJ913jrijrliabLU1o4rXzWgwiBRuvTs=;
        b=ko+WeDU9xG/rdp1EONaDU6TRoAoLYf6/MKWfNi56RH4C3GWPpkOXfRUpp7mypz45YZ
         TrxQhVL2gLKmFPSaO6LXvyoBIFVL27JRA8BpRcAYR7aTuSIFb4cYHjuu89Mmdba084gz
         VLSMrLA6HhFnyULGNeaOvhKUZG+4lw1ZAe9ArhAQOupSzSL+7AYHJ7r8d42u6f/Dxl6W
         vhiGcjGmBbjgodIQPxZTFQHV3rK0l3eE+3A7c+lfwqB8mHtqgDNjT0tfsorKA9SgsQW2
         dQY2d2MNYtgppHdj9Khz1hxbsD0/8XZoTwIAaDZz9SLohX9tqrKorQ52fTCJ7EdEiole
         y3sQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pjU9T4gF;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a2a5d004sor4388065a12.7.2025.03.24.21.59.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pjU9T4gF;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878775; x=1743483575; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=da9qCgJ+S1UaM0j+OYD82icAp+J1ucJQQo9Biij6cxI=;
        b=pjU9T4gF4uWM1RdSfNNBL0hXvRiOv5RazNrOyJxHLO7Zcu2toL1WFr9zeI/46orHa3
         2n/6QQmF3Yi2sd6m1FOR9jzvv8Ft5R3HZRMOpjqRAIbZQNx8z49HBkndr++tevG8dAYF
         iJu2YXs36/YlMvWkDqEq1rUSAM/SmN9bHEMBeDCgYqZNQKYmK5D9OTQP+3blQ29saCY+
         AjNUmVdPM1uBPOJEBm5zSah5hEpWWDNGC9TbmpmemPq98oBOOeWuMwPT3xE2ruuy3wGg
         HNo+ESdtyBPDJ6uHyGnIu+KxVqvxeDrG3St5AA2Q9GxZA43DzQsRkY9CnTfBm9WV5ku3
         FlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878775; x=1743483575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=da9qCgJ+S1UaM0j+OYD82icAp+J1ucJQQo9Biij6cxI=;
        b=pXYx0/0wQIfqzHulZqnY7oZUPdePqZZ1cGNxS2kct/UXXS/MAJCBV0x9/nENT72FwT
         YLj1uSziCfrWHuHrtkMbGWF3efXCTzqX1Fb2QoBy20OBbO+8HLHoEn2ZKVGTloHyJt45
         88qw00YXZa4UstWpJBTmEG+hYe6fwIOqrocGT3I0wdUL9U5KZ4/fII/CiYMeg6j8ytN/
         psxq+yQ1UKo+aEKBb1ylY1MW9YggJehfoxSd8rJR1lnLdguIEq1RI1c1/6vpz4THXn3/
         nQvoP/qytUSwgwTn7okhGaFE5EjPWpYwCBMkhpzBarYq7cPaswS++ZTE3WIgbCN+Atbi
         3AMg==
X-Forwarded-Encrypted: i=1; AJvYcCVGG/tZhL/E4WlDBAFvCvlsE/j531TfnNyHeowHAnQBkN277LHvLCKZVyGOTqYDzPADR+YSPyMXumw6cA==@linaro.org
X-Gm-Message-State: AOJu0Yy7HtiW7Li49yn7dD9zanHDBxoDXMvWECVohXmGIeiPYAvS/zeX
	0+d843BW2HV9SfP6LYfZxs+dMWfKeqk9ciQNYhL2Ly5phtREtUN3VlrmrE7FNb7kog==
X-Gm-Gg: ASbGncth9JEJz1TqFC51RZb6Yoy4xtL2Qc93xGqoXK+p9OnSWaA3ikh7ic7s4j03Ff0
	1yw2z4eu7VeNADQcQS3ffo27Yrq5lTMQif4aQNa5stX7gLwlyQcsIn2+Qyf67JUxLnyJGDLL6nP
	90eX8bB+jrTaETnU9zPyYF6+Jefh4s7NQVeXkUMvAgsSAU/ZjwrSj2vjjZfINCsSMSPbhCB4WAZ
	0efDSnSHqMCtzQShVsI2f9NyODN/QCSD33CfyQVOmhfhB6YmCf9uBQijjBQ3YuTPGWAt+SX42xA
	RqH+OMZPeQUQVoXGpV/vyT7LQSEXim74Rxb3LBmwmcr7
X-Google-Smtp-Source: AGHT+IEgjGxzJS/SsixkRPa7V7unRDt/oD82QlFwQaCLK26d+wtOW0DzMMqVormswycOEINYKmOvCQ==
X-Received: by 2002:a17:90b:4b8e:b0:2f9:c139:b61f with SMTP id 98e67ed59e1d1-3030fe8bdf1mr32282657a91.14.1742878775136;
        Mon, 24 Mar 2025 21:59:35 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:34 -0700 (PDT)
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
Subject: [PATCH v3 14/29] exec/cpu-all: transfer exec/cpu-common include to cpu.h headers
Date: Mon, 24 Mar 2025 21:58:59 -0700
Message-Id: <20250325045915.994760-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: E9HPgqWoBccF

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h  | 2 --
 include/exec/cpu_ldst.h | 1 +
 target/alpha/cpu.h      | 1 +
 target/arm/cpu.h        | 1 +
 target/avr/cpu.h        | 1 +
 target/hexagon/cpu.h    | 1 +
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
 target/tricore/cpu.h    | 1 +
 target/xtensa/cpu.h     | 1 +
 cpu-target.c            | 1 +
 22 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index da8f5dd10c5..b488e6b7c0b 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -19,6 +19,4 @@
 #ifndef CPU_ALL_H
 #define CPU_ALL_H
 
-#include "exec/cpu-common.h"
-
 #endif /* CPU_ALL_H */
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 82e67eff682..313100fcda1 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -66,6 +66,7 @@
 #error Can only include this header with TCG
 #endif
 
+#include "exec/cpu-common.h"
 #include "exec/cpu-ldst-common.h"
 #include "exec/cpu-mmu-index.h"
 #include "exec/abi_ptr.h"
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 42788a6a0bc..fb1d63527ef 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -21,6 +21,7 @@
 #define ALPHA_CPU_H
 
 #include "cpu-qom.h"
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 #include "qemu/cpu-float.h"
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 958a921490e..ee92476814c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -24,6 +24,7 @@
 #include "qemu/cpu-float.h"
 #include "hw/registerfields.h"
 #include "cpu-qom.h"
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 #include "exec/gdbstub.h"
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 714c6821e2f..f56462912b9 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -22,6 +22,7 @@
 #define QEMU_AVR_CPU_H
 
 #include "cpu-qom.h"
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 
diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index f78c8f9c2a0..e4fc35b112d 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -21,6 +21,7 @@
 #include "fpu/softfloat-types.h"
 
 #include "cpu-qom.h"
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "hex_regs.h"
 #include "mmvec/mmvec.h"
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 986dc655fc1..5b6cd2ae7fe 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -21,6 +21,7 @@
 #define HPPA_CPU_H
 
 #include "cpu-qom.h"
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 #include "system/memory.h"
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 64706bd6e5d..38ec99ee29c 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -23,6 +23,7 @@
 #include "system/tcg.h"
 #include "cpu-qom.h"
 #include "kvm/hyperv-proto.h"
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 #include "exec/memop.h"
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 1dba8ac6a7c..167989ca7fe 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -9,6 +9,7 @@
 #define LOONGARCH_CPU_H
 
 #include "qemu/int128.h"
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 #include "fpu/softfloat-types.h"
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 451644a05a3..5347fbe3975 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -21,6 +21,7 @@
 #ifndef M68K_CPU_H
 #define M68K_CPU_H
 
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 #include "qemu/cpu-float.h"
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index d29681abed4..90d820b90c7 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -21,6 +21,7 @@
 #define MICROBLAZE_CPU_H
 
 #include "cpu-qom.h"
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "qemu/cpu-float.h"
 #include "exec/cpu-interrupt.h"
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 29362498ec4..79f8041ced4 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -2,6 +2,7 @@
 #define MIPS_CPU_H
 
 #include "cpu-qom.h"
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 #ifndef CONFIG_USER_ONLY
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index c153823b629..f16a070ef6c 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -21,6 +21,7 @@
 #define OPENRISC_CPU_H
 
 #include "cpu-qom.h"
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 #include "fpu/softfloat-types.h"
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 7489ba95648..aa5df47bdaf 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -22,6 +22,7 @@
 
 #include "qemu/int128.h"
 #include "qemu/cpu-float.h"
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 #include "cpu-qom.h"
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 556eda57e94..14a6779b4c1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -23,6 +23,7 @@
 #include "hw/core/cpu.h"
 #include "hw/registerfields.h"
 #include "hw/qdev-properties.h"
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 #include "exec/gdbstub.h"
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 5f2fcb66563..e2ec78835e4 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -23,6 +23,7 @@
 #include "hw/registerfields.h"
 #include "cpu-qom.h"
 
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 #include "qemu/cpu-float.h"
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 0a32ad4c613..83d01d5c4e1 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -27,6 +27,7 @@
 
 #include "cpu-qom.h"
 #include "cpu_models.h"
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 #include "qemu/cpu-float.h"
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 18557d8c386..7581f5eecb7 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -21,6 +21,7 @@
 #define SH4_CPU_H
 
 #include "cpu-qom.h"
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 #include "qemu/cpu-float.h"
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 923836f47c8..5dc5dc49475 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -3,6 +3,7 @@
 
 #include "qemu/bswap.h"
 #include "cpu-qom.h"
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 #include "qemu/cpu-float.h"
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index cf9dbc6df8e..abb9cba136d 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -22,6 +22,7 @@
 
 #include "cpu-qom.h"
 #include "hw/registerfields.h"
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "qemu/cpu-float.h"
 #include "tricore-defs.h"
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 66846314786..c5d2042de14 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -30,6 +30,7 @@
 
 #include "cpu-qom.h"
 #include "qemu/cpu-float.h"
+#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 #include "hw/clock.h"
diff --git a/cpu-target.c b/cpu-target.c
index 587f24b34e5..52de33d50b0 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -23,6 +23,7 @@
 #include "qemu/qemu-print.h"
 #include "system/accel-ops.h"
 #include "system/cpus.h"
+#include "exec/cpu-common.h"
 #include "exec/tswap.h"
 #include "exec/replay-core.h"
 #include "exec/log.h"
-- 
2.39.5
