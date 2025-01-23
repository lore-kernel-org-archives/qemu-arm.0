Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp485256njk;
        Thu, 23 Jan 2025 15:45:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUOQ1yLbCcatNNPTvjWPYXtQ7SPqEfP7+wj/s4Qsp6TcH0Oj3YTaoT+Hb+bPeV9lTH0fYvJulpYM4Pb1Q==@linaro.org
X-Received: by 2002:a7b:c3d8:0:b0:436:17e4:ad4c with SMTP id 5b1f17b1804b1-438a0d3c71fmr196921685e9.6.1737675913996;
        Thu, 23 Jan 2025 15:45:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675913; cv=none;
        d=google.com; s=arc-20240605;
        b=gn1EnJRGrH/3cWAM88HXMoSQAfWeQaxXSwr4DOpY6wBFw2kxVhgqhKrQw+HVrp/95u
         4CoCu0XWLIyXy5GZp12WsPLa5PLXQXPqg1iY5NAY3Tkwx70Io1mc7lqRGLUnZ6eLR++I
         dn6DU3vUiE8wgKKZvVGNIuDvbEkNEuOfoQm9gpnVhtpiMF3KUJ7kqzV+6l9oZp6UsApp
         2zg73/eJHZJf/VUyoD6QEs6gbp2ekvgZwHCnUJuLtioFSwLh5PAlUZQPk6jDyQUQoXcD
         A/94q9xnOrwLnqPTmpfeAWclWi9G/WKDT1FxdSWjfcUn2t9GT0Vw7XJbToBEx4a2Jabu
         rQbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9nZeRXAiaA5TpZm6lq5Kgnlq642/zMUBUZPLj6lypP8=;
        fh=2vhX+0vI6Eq9KMGfDWQj43seN8DBNG1FsYsLLSlkkU4=;
        b=icieGCKhKrwruorOmHr0YpVtDZWTjZexfo0Yn/Bvbl0u8gNB9DH12uS7IkPGVM2ul6
         DGhVa3cAKpULFpIoweIglq3FweIl1FKpyVDor++301w6wB29rXzudWjoshFNLbPHihBg
         ACgKVWpMrj9vNxQ1JzIDCxl8hf6R6jzb0CASojSdQRoBZRqy3eBfSBAowDOawjMvn5Qw
         v+of1jM3TpfZCbd5sRCIcimVgs0lyFXJoGOqZK2JHrCNPrls4cax9oYAGKTIc9AtoSXw
         ZDJd9Wc4LXcLqMI+CF4OmfMoPstYQKKCGh4qKgMtsiy4gcMGAeddrnxod7Nk6PxDhBSo
         GCGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i9Py/TWu";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438bd6c56edsor1975135e9.10.2025.01.23.15.45.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:45:13 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i9Py/TWu";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675913; x=1738280713; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nZeRXAiaA5TpZm6lq5Kgnlq642/zMUBUZPLj6lypP8=;
        b=i9Py/TWua1pATp2cXrB5xswdCNouP3ZpChmitm5EyoYbezyN5uT8Pms0GQamaAD9cn
         Vf02QYmt1NY4Sq0ub+PsbdbXkXZITo1p3+3HFOmv+n4AxT6b/5JMwvSGDZhwVFhYTbjg
         HQMWROpoGalfdK5bj0Ur9dzT3fn6/Z+WhyjwRPMVaq4tpe7kcE+225jyFFjTknr8tVT8
         BPI7bBYEhbERRbCeJXoyfWjAF0Z/me9h9HWxxoRCgN6XAzwUFXnv+q+tTVlrEBNzzVVG
         wz1sUzENVcF5KfCT5ysIBnj4MaGkUHtCKUnVbKPNqTe6LrTOZfnsoLLvSTh3bJeZwGm6
         RlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675913; x=1738280713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nZeRXAiaA5TpZm6lq5Kgnlq642/zMUBUZPLj6lypP8=;
        b=gyRIjq0UvPk8iM2+UnrH6ZeFK7Atv4ouEaoyWRd+3JoCvi7hyOdjW3F/HDk8EEKvPz
         w9UdVVGRfxipcdTveHZZMSN0ecPY528wQgA07PM55piT1IOMUxAHWFr2uRwqKTn7QNtB
         NSteCrpiU+QP8XJwnFCA72MFDAyTZSV6V2eZ7IzlHv0RaJCENW3E0zvlQMFrcqE5uKWn
         zIfVBc9cgqt8snLcmIdNQ7vEreLzxDodO32/2EnjQOfvOyopRgVdYLPKHGXb7jCTTqPZ
         jKK8NbFa8L5efCC6mOxp0XcuISLIRRVs3AH4wyKd7CRKAPp4t/cutmnV4V2U9UYkUPP4
         HjhA==
X-Forwarded-Encrypted: i=1; AJvYcCVoGQ0hXg75nCywF9VOgjBUwFzsj21ceo2wq00/jzr+cAOqsoGwxWpZPRzQbjy9QGdtJdL9QBMMCMP2MA==@linaro.org
X-Gm-Message-State: AOJu0YzhTSpx5j9m3wL5S9xXwXvD6hUYF9fL9bB9l6PjymXjOj25TT8Z
	tYK7/zcg6BuiM9Abm+FXcpxjWWNU/z23BF8L8n9RxqtJP7Qx04nLxs67x238KvgI4bLN44rk6FL
	8ynmgMw==
X-Gm-Gg: ASbGncvvWJjjqdqIca1BdpgoQV6HxjhNGoO6YBUn8SDRmLewf7o8oOzDF1Rh/Jz/V5e
	vIGagGtxg5sIsbaF2e3cC7Dob3FWyjT9Lg3DkuquF2apBNH9GidMyPAf6mX3j+uJksvSSLJV/x3
	yqn3xUB5xC8wM3JmciGaTOD/LEpprW2Zx6vceEnnpg4xif+LoUXcZMbrLpv00SDkXSrjWdi/zUd
	St2cP6GjQtFhF9HsPdBYh4zkmKV1JZDu5dCP5ZkbSrdMPoL2Cf9JhaPYUmVJeiUm9ozaP7XHk1R
	+hRwqQDghRayMKd5HxnerYWZwosN8kPIoW/dbJPQW/+fRcAwbFwMXbWfq4jyCiaHuQ==
X-Google-Smtp-Source: AGHT+IEDiDQdxrx2jB8os0igTQ7OuBNE672qZpSpts43JKLj6+qBPVdV+5rplNMJaEPLV2MbkLotbw==
X-Received: by 2002:a05:600c:4713:b0:436:9227:915 with SMTP id 5b1f17b1804b1-438913caa3cmr222825345e9.9.1737675913369;
        Thu, 23 Jan 2025 15:45:13 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd54c04bsm6412735e9.27.2025.01.23.15.45.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:45:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/20] accel/tcg: Rename 'hw/core/tcg-cpu-ops.h' -> 'accel/tcg/cpu-ops.h'
Date: Fri, 24 Jan 2025 00:44:04 +0100
Message-ID: <20250123234415.59850-11-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: CLeUyzOZvBLc

TCGCPUOps structure makes more sense in the accelerator context
rather than hardware emulation. Move it under the accel/tcg/ scope.

Mechanical change doing:

 $  sed -i -e 's,hw/core/tcg-cpu-ops.h,accel/tcg/cpu-ops.h,g' \
   $(git grep -l hw/core/tcg-cpu-ops.h)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                                            | 2 +-
 include/{hw/core/tcg-cpu-ops.h => accel/tcg/cpu-ops.h} | 0
 accel/tcg/cpu-exec.c                                   | 4 ++--
 accel/tcg/cputlb.c                                     | 2 +-
 accel/tcg/translate-all.c                              | 2 +-
 accel/tcg/user-exec.c                                  | 2 +-
 accel/tcg/watchpoint.c                                 | 2 +-
 bsd-user/signal.c                                      | 2 +-
 hw/mips/jazz.c                                         | 2 +-
 linux-user/signal.c                                    | 2 +-
 system/physmem.c                                       | 2 +-
 target/alpha/cpu.c                                     | 2 +-
 target/arm/cpu.c                                       | 2 +-
 target/arm/tcg/cpu-v7m.c                               | 2 +-
 target/arm/tcg/cpu32.c                                 | 2 +-
 target/arm/tcg/mte_helper.c                            | 2 +-
 target/arm/tcg/sve_helper.c                            | 2 +-
 target/avr/cpu.c                                       | 2 +-
 target/avr/helper.c                                    | 2 +-
 target/hexagon/cpu.c                                   | 2 +-
 target/hppa/cpu.c                                      | 2 +-
 target/i386/tcg/tcg-cpu.c                              | 2 +-
 target/loongarch/cpu.c                                 | 2 +-
 target/m68k/cpu.c                                      | 2 +-
 target/microblaze/cpu.c                                | 2 +-
 target/mips/cpu.c                                      | 2 +-
 target/openrisc/cpu.c                                  | 2 +-
 target/ppc/cpu_init.c                                  | 2 +-
 target/riscv/tcg/tcg-cpu.c                             | 2 +-
 target/rx/cpu.c                                        | 2 +-
 target/s390x/cpu.c                                     | 2 +-
 target/s390x/tcg/mem_helper.c                          | 2 +-
 target/sh4/cpu.c                                       | 2 +-
 target/sparc/cpu.c                                     | 2 +-
 target/tricore/cpu.c                                   | 2 +-
 target/xtensa/cpu.c                                    | 2 +-
 36 files changed, 36 insertions(+), 36 deletions(-)
 rename include/{hw/core/tcg-cpu-ops.h => accel/tcg/cpu-ops.h} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7be3d8f431a..fa46d077d30 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -175,7 +175,7 @@ F: include/exec/helper-info.c.inc
 F: include/exec/page-protection.h
 F: include/system/cpus.h
 F: include/system/tcg.h
-F: include/hw/core/tcg-cpu-ops.h
+F: include/accel/tcg/cpu-ops.h
 F: host/include/*/host/cpuinfo.h
 F: util/cpuinfo-*.c
 F: include/tcg/
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/accel/tcg/cpu-ops.h
similarity index 100%
rename from include/hw/core/tcg-cpu-ops.h
rename to include/accel/tcg/cpu-ops.h
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index be2ba199d3d..8ee76e14b0d 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -22,7 +22,7 @@
 #include "qapi/error.h"
 #include "qapi/type-helpers.h"
 #include "hw/core/cpu.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "trace.h"
 #include "disas/disas.h"
 #include "exec/cpu-common.h"
@@ -39,7 +39,7 @@
 #include "exec/replay-core.h"
 #include "system/tcg.h"
 #include "exec/helper-proto-common.h"
-#include "tb-jmp-cache.h"
+//#include "tb-jmp-cache.h"
 #include "tb-hash.h"
 #include "tb-context.h"
 #include "tb-internal.h"
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b4ccf0cdcb7..d68401b35c3 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -19,7 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "exec/exec-all.h"
 #include "exec/page-protection.h"
 #include "exec/memory.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index d4189c73860..786e2f6f1a7 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -58,7 +58,7 @@
 #include "system/cpu-timers.h"
 #include "system/tcg.h"
 #include "qapi/error.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "tb-jmp-cache.h"
 #include "tb-hash.h"
 #include "tb-context.h"
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 0561c4f6dc7..c4454100ad7 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -17,7 +17,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "disas/disas.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
diff --git a/accel/tcg/watchpoint.c b/accel/tcg/watchpoint.c
index af57d182d5b..40112b2b2e7 100644
--- a/accel/tcg/watchpoint.c
+++ b/accel/tcg/watchpoint.c
@@ -26,7 +26,7 @@
 #include "tb-internal.h"
 #include "system/tcg.h"
 #include "system/replay.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "hw/core/cpu.h"
 #include "internal-common.h"
 
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index b4e1458237a..088fe775c05 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -28,7 +28,7 @@
 #include "gdbstub/user.h"
 #include "signal-common.h"
 #include "trace.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "host-signal.h"
 
 /* target_siginfo_t must fit in gdbstub's siginfo save area. */
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index c89610639a9..1700c3765de 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -50,7 +50,7 @@
 #include "qemu/error-report.h"
 #include "qemu/help_option.h"
 #ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #endif /* CONFIG_TCG */
 #include "cpu.h"
 
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 087c4d270e4..b9e9b0a6c03 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -21,7 +21,7 @@
 #include "qemu/cutils.h"
 #include "gdbstub/user.h"
 #include "exec/page-protection.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 #include <sys/ucontext.h>
 #include <sys/resource.h>
diff --git a/system/physmem.c b/system/physmem.c
index c76503aea82..8638f8817e6 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -28,7 +28,7 @@
 #include "qemu/lockable.h"
 
 #ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #endif /* CONFIG_TCG */
 
 #include "exec/exec-all.h"
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index e1b898e5755..da21f99a6ac 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -220,7 +220,7 @@ static const struct SysemuCPUOps alpha_sysemu_ops = {
 };
 #endif
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps alpha_tcg_ops = {
     .initialize = alpha_translate_init,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index dc0231233a6..d59433e33fb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -29,7 +29,7 @@
 #include "cpu.h"
 #ifdef CONFIG_TCG
 #include "exec/translation-block.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #endif /* CONFIG_TCG */
 #include "internals.h"
 #include "cpu-features.h"
diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
index 03acdf83e00..29a41fde694 100644
--- a/target/arm/tcg/cpu-v7m.c
+++ b/target/arm/tcg/cpu-v7m.c
@@ -10,7 +10,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "internals.h"
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 2ad21825255..c5913665d12 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -10,7 +10,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "internals.h"
 #include "target/arm/idau.h"
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index f72ce2ae0d4..5d6d8a17ae8 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -31,7 +31,7 @@
 #endif
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
 #include "mte_helper.h"
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index d0865dece35..2268fcd41b0 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -28,7 +28,7 @@
 #include "tcg/tcg.h"
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #ifdef CONFIG_USER_ONLY
 #include "user/page-protection.h"
 #endif
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 8a126ff3222..5a0e21465e5 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -203,7 +203,7 @@ static const struct SysemuCPUOps avr_sysemu_ops = {
     .get_phys_page_debug = avr_cpu_get_phys_page_debug,
 };
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps avr_tcg_ops = {
     .initialize = avr_cpu_tcg_init,
diff --git a/target/avr/helper.c b/target/avr/helper.c
index 345708a1b39..9ea6870e44d 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -22,7 +22,7 @@
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "cpu.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "exec/exec-all.h"
 #include "exec/page-protection.h"
 #include "exec/cpu_ldst.h"
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 0b7fc98f6ce..238e63bcea4 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -321,7 +321,7 @@ static void hexagon_cpu_init(Object *obj)
 {
 }
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps hexagon_tcg_ops = {
     .initialize = hexagon_translate_init,
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index b0bc9d35e4c..f2441d4d7fb 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -235,7 +235,7 @@ static const struct SysemuCPUOps hppa_sysemu_ops = {
 };
 #endif
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps hppa_tcg_ops = {
     .initialize = hppa_translate_init,
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 14ee038079a..f09ee813ac9 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -105,7 +105,7 @@ static bool x86_debug_check_breakpoint(CPUState *cs)
 }
 #endif
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps x86_tcg_ops = {
     .initialize = tcg_x86_init,
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index d611a604704..ecfd6edefbe 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -813,7 +813,7 @@ static void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 }
 
 #ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps loongarch_tcg_ops = {
     .initialize = loongarch_translate_init,
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 41dfdf58045..5eac4a38c62 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -547,7 +547,7 @@ static const struct SysemuCPUOps m68k_sysemu_ops = {
 };
 #endif /* !CONFIG_USER_ONLY */
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps m68k_tcg_ops = {
     .initialize = m68k_tcg_init,
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index f114789abd8..13d194cef88 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -419,7 +419,7 @@ static const struct SysemuCPUOps mb_sysemu_ops = {
 };
 #endif
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps mb_tcg_ops = {
     .initialize = mb_tcg_init,
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 47cd7cfdcef..0b267d2e507 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -544,7 +544,7 @@ static const Property mips_cpu_properties[] = {
 };
 
 #ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 static const TCGCPUOps mips_tcg_ops = {
     .initialize = mips_tcg_init,
     .translate_code = mips_translate_code,
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index b7bab0d7abf..0669ba2fd10 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -232,7 +232,7 @@ static const struct SysemuCPUOps openrisc_sysemu_ops = {
 };
 #endif
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps openrisc_tcg_ops = {
     .initialize = openrisc_translate_init,
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index c05c2dc42dc..ed85448bc7d 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7427,7 +7427,7 @@ static const struct SysemuCPUOps ppc_sysemu_ops = {
 #endif
 
 #ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps ppc_tcg_ops = {
   .initialize = ppc_translate_init,
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 0a137281de1..e40c8e85b26 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -31,7 +31,7 @@
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "hw/core/accel-cpu.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "tcg/tcg.h"
 #ifndef CONFIG_USER_ONLY
 #include "hw/boards.h"
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 8c50c7a1bc8..d237d007023 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -192,7 +192,7 @@ static const struct SysemuCPUOps rx_sysemu_ops = {
 };
 #endif
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps rx_tcg_ops = {
     .initialize = rx_translate_init,
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 97d41c23de7..3bea014f9ee 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -322,7 +322,7 @@ static const Property s390x_cpu_properties[] = {
 #endif
 
 #ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 void cpu_get_tb_cpu_state(CPUS390XState *env, vaddr *pc,
                           uint64_t *cs_base, uint32_t *pflags)
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 32717acb7d1..4ce7aa8127f 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -28,7 +28,7 @@
 #include "exec/exec-all.h"
 #include "exec/page-protection.h"
 #include "exec/cpu_ldst.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
 
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 24a22724c61..e3c2aea1a64 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -247,7 +247,7 @@ static const struct SysemuCPUOps sh4_sysemu_ops = {
 };
 #endif
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps superh_tcg_ops = {
     .initialize = sh4_translate_init,
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index fbd38ec334a..e3b46137178 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -992,7 +992,7 @@ static const struct SysemuCPUOps sparc_sysemu_ops = {
 #endif
 
 #ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps sparc_tcg_ops = {
     .initialize = sparc_tcg_init,
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 95202fadbfd..eb794674c8d 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -168,7 +168,7 @@ static const struct SysemuCPUOps tricore_sysemu_ops = {
     .get_phys_page_debug = tricore_cpu_get_phys_page_debug,
 };
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps tricore_tcg_ops = {
     .initialize = tricore_tcg_init,
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 4eb699d1f45..efbfe73fcfb 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -228,7 +228,7 @@ static const struct SysemuCPUOps xtensa_sysemu_ops = {
 };
 #endif
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps xtensa_tcg_ops = {
     .initialize = xtensa_translate_init,
-- 
2.47.1
