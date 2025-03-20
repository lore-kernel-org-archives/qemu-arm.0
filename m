Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1278989njc;
        Thu, 20 Mar 2025 15:30:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCjcaIXLtk1IobpIbqd3W0rUmaaHWn4H5YJ+e25yR5psAys9M+BwIKsWyz71mkiSn3ClMwRWFNRQLO1Q==@linaro.org
X-Received: by 2002:a17:902:d48c:b0:223:6657:5008 with SMTP id d9443c01a7336-22780d83a42mr17038515ad.24.1742509828081;
        Thu, 20 Mar 2025 15:30:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509828; cv=none;
        d=google.com; s=arc-20240605;
        b=T9hTBDxX9EBicCi8ePKe/UOq4D7TollnzYidB6QjI1MlgfcdVHSAGfL1WDYw++oPsD
         g2qjsECUeJeJzdnHC2tjrjmM+T4Vu5vb4HIUZyIOmUDtoOea3DoU6BDruQP8Um9NTes4
         Hnkiy65R+gAADWix1EcECwNtyQvlIXHC7EeLBnCWmJuf/aF9xkjEd6tPAuh9FZJmCf6T
         qfRjE9mA68VbWIUmyc9rBuv/zdVhp3aF8idOeJSQN6NfX7V8ue7YP6NHJv7lR8W4ZsYm
         Wd+fyGSNGYtfpdBFMTx+Ztza3VDtiOJ0ruMT2P13JHvP00xaSSD0lOZG2ogt6QjpW7v4
         h0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ue3wMIxDRm9plhH20mUZGft0jOAkf9QSBx1Uwd6s7+c=;
        fh=WTFNJjPJiZzYYFUrG61mIXM0j/XCtopDn6Y6lIJvVLg=;
        b=ShLO/cFECDD5BmYmwx9hQ06DuVGuhxQoVlY+DopFHz586SJFSA+scQ8XnGemaP4dws
         zxspV6lUq40icRtgmTzIMtKgrXN81g+zcWDwYKcVc6DnntjxHRcNkSureNjSDiXPMwex
         CmRCS1+Xr6vgZB/9rLug+Exfxcm4jMYfI0fO+amUvHM8LFyL+EEejDH8xsPThtGcFBPZ
         JoEviE/g7gTLqL3llpNZGyc0aMNnWvBA2eu7hkbULsw9GwvLth0ZtTria8nRO5tcYXBF
         ylTvnDZm0fpgUpAd6II9zmG7QEtm1AXL3dSxdBgN+QfDCVmljE4+t0Bj+iY7sFe8D91E
         kD/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MavXBmD0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f330fesor3155085ad.10.2025.03.20.15.30.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MavXBmD0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509827; x=1743114627; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ue3wMIxDRm9plhH20mUZGft0jOAkf9QSBx1Uwd6s7+c=;
        b=MavXBmD0SdCty/gCxfQ2iHgCE22BeOrzi17Bu/FBviyy47uBuDq+XXxawfm2eWByAh
         XPYk/kH7/AVyYBV2ViZ32tVs2TzaoDg/O0c0+aRRKht1N8YtuFZvyo2AgQGQCHR7xw3+
         cs9/m6GAwCcW7xWtyBEN6xrwcZzNNgLXjQp1qWeKUYmSgnDfbRk5ZsgombD84uR2JqWj
         es8HJtYP+9YOCBdj/1iaH9cgWs8Pt3Kiy4w0laSuM/DuymO1DuyXyCx3Yw883PVCOc2h
         +SbwmuZJDusV3ZCMPYH1iBAzx7MVBIXrLxbUoPOtPiBIL9D6LKOkzZ4TgeRnvg5UbdEU
         YQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509827; x=1743114627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ue3wMIxDRm9plhH20mUZGft0jOAkf9QSBx1Uwd6s7+c=;
        b=tefzF1rldzntNTt+JrPv7mDBDOvAH52ilVJ+0Ok6uDw260KmXvJdSMWRCjmCH6hfT9
         vsGSiloS+hIOycU0eK22QDm8T5uwdPWE02i/vmnOSoWG4cBDMV9xxt5tdN49E4A2ist0
         nJAgQm11c6QTJD79h+K9+u/ivDF4ufst+RbCwieTozcIwlNbGoBjkOgUrK5msxPs5U+J
         /r0FXf76OFOgTZPkc8sMmz0Q+4p919WOZe01NB+bL6Oz0grUGekxhF3xSOVIWalHd51e
         cs6Whi7ANLNnqzd2ICy39hi/+soEhZ1K2BRCyKK5j/Ai0DYG4wj3TR/lOVq2+q4U+KV8
         r1rQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1n+cDmU/Sv4QXyxKruhyR8jOUQzi9g9QfCSBqJh4ttofuROjAuLL1TxSl6q0PkJZrhv1VeAPi3j3gBA==@linaro.org
X-Gm-Message-State: AOJu0YzHjhD2BV6TrRQILxadEIq8SoKSHAjEJPYNUCLPfSR4n/sFhRxi
	cmCz+tbOHkUzD2KjOgybtR1tz3PhgMCKtJr1rEJLP5EUTRYqCm2cSwuMiOGVHswDDw==
X-Gm-Gg: ASbGnct2f7srRzbqYxfypoWvpuA+AXT4kLuQVuTxj1bXdRj8jLN03eY7ayAn/DP5s/V
	tAYeNswZ9Et+8IVo/8Oj9hFsb9/p78YO7DJTjkIkAvmnQQYUuz2uuGgO358zsnoBcPnwED2mxpC
	VmK1FWNIFKAECLjTGdYCknB5mzq4HR0GhFx4Qp2s7xXPfM5zVYs4uK2/SdqYraqm/Xw+gPkpp0U
	rYf/cI3W1yL6CnVItrbQrUBsa7fY763af7pnKjAhw9N/ZAWUYv8uyr2p2yVS6jx7ij8hOT2q02E
	ayqEe9VtYZeNWxAkgyRfSRt8aASmVBGLwvj0S8NcIQlj
X-Google-Smtp-Source: AGHT+IGbr7eJUBWi5cLi1feYMh8IML173g1e+43Vd3AZzYyfFYPqUOI0pk8pEl7jV3DBBp7qfgr7ow==
X-Received: by 2002:a17:902:ce82:b0:224:abb:92c with SMTP id d9443c01a7336-22780e35eeamr11909485ad.50.1742509827607;
        Thu, 20 Mar 2025 15:30:27 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:27 -0700 (PDT)
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
Subject: [PATCH v2 15/30] exec/cpu-all: transfer exec/cpu-common include to cpu.h headers
Date: Thu, 20 Mar 2025 15:29:47 -0700
Message-Id: <20250320223002.2915728-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0iw7CUYqVvTn

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
index dd339907f1f..c6d52204d71 100644
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
index df37198897c..da0d35a19f6 100644
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
