Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp638090ejb;
        Fri, 26 Apr 2024 12:45:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVsU1d4/OVXWwcAFECFJMlnHGyqn1pju1PyqLRl3sYRcUsCVbm9xwWf4c57q6iRDu8sSlU02Wu2q2RJtVDp7KeLGr/UXXmt
X-Google-Smtp-Source: AGHT+IHGNBSvAkxnB4nVkNK3uh1NIWD2fI+gv+4u+OK9iLLEeUnWFc9EPYtTr4HwQyNlby65kihD
X-Received: by 2002:a05:6830:56:b0:6ed:b948:2d3b with SMTP id d22-20020a056830005600b006edb9482d3bmr4077405otp.21.1714160759383;
        Fri, 26 Apr 2024 12:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160759; cv=none;
        d=google.com; s=arc-20160816;
        b=TvwWprLRilnd9azhLU9wNeqvDTLdgDo9scWwE+3k4Fz2SdS/a50qxJ8mCruuHaxUfF
         H2EA7pg14kSjoOlYpWkcReiVqhf1OXYuWACAh2aj/l6Crhf8k7oCLjhgCQV1zEan9qdb
         gVyB25z/o/AXHtGNqHx228qEq8kI2VAlx7RCcI47Lsvw1pyv27hUIxnArLaFDe7EPV+u
         nDhZUiLLGzPCAxnOquqBGa6Cp4rra9gWwklQAHsIqip7iOzJnIIx1+EWl5AfOvXg6/8M
         kFHFUBTBqWlHRGkm85g+bNN9TPk/LjptNeWDwpWptgowow1B1NMWDUDp4Wig4C+FfLF9
         Y1qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WYKx5VszY8nnZEUuUG4wRLUF4gkwtzF7xUPTRJGo2+Q=;
        fh=UsvrWiw8iuAIKc6VNCTZEK8fw8WS394Hi7v6I2mixnA=;
        b=iH1aDlE7xG4I8ZjUgrjQQ9DI9H6w61rbBBATHWkYVvtV+vmbWDG3QUhfx98hXtU6lY
         DQ/dytrr2RCBfv89RBNjXQIga4wA9w+9ShVVz2pcoseihSRhpRFKcYeaYwqOJR+DgLOh
         bVKKMlVdfBDrGfW5Y6UBDlmlQYs0AMpUvGrhUWTPIqP6rb+StyZxDmoeOcsQoSm5t/5f
         XyFtB15oK1vQOv1cPC9zdbwW6BT5On2weeMQXTUZV5VlEVUZPj9cxWBvNbuFMbp4+jJQ
         ZRblI6mh4JnagykAj5rVLAIaqPUQnQXVzPbpmox0PfgoXiv5fE0uQuBivoyRh8lAJtlR
         rmGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zU/XCxym";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020a05620a450d00b0078d66631907si23758173qkp.625.2024.04.26.12.45.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:45:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zU/XCxym";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0RV3-0007fn-KR; Fri, 26 Apr 2024 15:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RUz-0007E5-Q0
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:44:46 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RUw-0003uL-Ta
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:44:45 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57225322312so3651752a12.1
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 12:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160681; x=1714765481; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WYKx5VszY8nnZEUuUG4wRLUF4gkwtzF7xUPTRJGo2+Q=;
 b=zU/XCxymT11y+r0fzbWhY8ISvbh1mohOvhMlIIbxtHqGH86x6OqYM+R0xlL4LiEt/W
 wsyK73EchtzqMVNyQmygMnec8X7FRqaTuHqUKbjjHP4YEge5U9aL9pANUyTMJ3iWOHlv
 g6xyNN+wZrxRQFpPyGSRl5YRZJkf3lDfeSLlkJLwHfVButMLrXWyDF+CR3cez/K8QwGJ
 Wsomiuy1EBS/TmSxyX0YJzc+8RCLwpfjJBYlddXzKuiFHXgdcgtm1yi8PIDQtS9/G3M4
 ixsckR7WzKRCs3f+zvMQgX++stBpqB3rIKuSQFpZEOu1if1pLCa+r/1h1pYWv0QGntEt
 jy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160681; x=1714765481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WYKx5VszY8nnZEUuUG4wRLUF4gkwtzF7xUPTRJGo2+Q=;
 b=AZP5hHUh3Ix6jOD9YjbIoWMK7/NIapJNEjNytx0GiOt6e084RRVl86/kWaFl7zIO57
 Yiyl2ucc8v2qGdSRLdrwUz699WT9/UPVzaZ4eSIppNZrUt2vPm+I64qmIDXrSkMvff6M
 5Xtmd7Y9DQPqGG/VRvHmhkgGI4NQ4F3VpevuHsOwINo05CddYqzNYUqmvgNLGr8iDJDW
 DfhuIl94rLpsDcpDhQrnB0bYYs36E+Zg2n0aW2HA6dDDfNO4Vh4mKeHD9vRimHUXeJTw
 yLOSWc9Oq/hU6W4PtRzSXqTgp0gXV+JicVvASdyyDe7rY7uroa4gzmqYFRBMHUM6KPWO
 KX7w==
X-Gm-Message-State: AOJu0YzjN4SB1t5L326iveM0LzFWcxlqtWf4iKMiyZ0tcQqielmleTkp
 ikqNO3xS3h3Y9S/kqbn5wnSUb+mtmbcDszlEokBMTrCBz5dd2KCpJ6eEO4SHKKs=
X-Received: by 2002:a50:cd0e:0:b0:570:5b71:4859 with SMTP id
 z14-20020a50cd0e000000b005705b714859mr2171733edi.41.1714160681245; 
 Fri, 26 Apr 2024 12:44:41 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 l11-20020a50cbcb000000b0057030326144sm10281434edi.47.2024.04.26.12.44.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:44:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 27/38] exec: Move [b]tswapl() declarations to
 'exec/user/tswap-target.h'
Date: Fri, 26 Apr 2024 21:41:47 +0200
Message-ID: <20240426194200.43723-28-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: wDcZqXa61eGV

tswapl() and bswaptls() are target-dependent and only used
by user emulation. Move their definitions to a new header:
"exec/user/tswap-target.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Message-Id: <20231212123401.37493-17-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS                        |  1 +
 bsd-user/freebsd/target_os_elf.h   |  1 +
 bsd-user/freebsd/target_os_stack.h |  1 +
 bsd-user/netbsd/target_os_elf.h    |  1 +
 bsd-user/openbsd/target_os_elf.h   |  1 +
 include/exec/cpu-all.h             |  8 --------
 include/exec/user/abitypes.h       |  1 +
 include/user/tswap-target.h        | 22 ++++++++++++++++++++++
 bsd-user/signal.c                  |  1 +
 bsd-user/strace.c                  |  1 +
 linux-user/elfload.c               |  1 +
 linux-user/i386/signal.c           |  1 +
 linux-user/ppc/signal.c            |  1 +
 13 files changed, 33 insertions(+), 8 deletions(-)
 create mode 100644 include/user/tswap-target.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 96411e6adf..302b6fd00c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3692,6 +3692,7 @@ Overall usermode emulation
 M: Riku Voipio <riku.voipio@iki.fi>
 S: Maintained
 F: accel/tcg/user-exec*.c
+F: include/exec/user/
 F: include/user/
 F: common-user/
 
diff --git a/bsd-user/freebsd/target_os_elf.h b/bsd-user/freebsd/target_os_elf.h
index 9df17d56d8..01124979f7 100644
--- a/bsd-user/freebsd/target_os_elf.h
+++ b/bsd-user/freebsd/target_os_elf.h
@@ -22,6 +22,7 @@
 
 #include "target_arch_elf.h"
 #include "elf.h"
+#include "user/tswap-target.h"
 
 #define bsd_get_ncpu() 1 /* until we pull in bsd-proc.[hc] */
 
diff --git a/bsd-user/freebsd/target_os_stack.h b/bsd-user/freebsd/target_os_stack.h
index d15fc3263f..ac0ef22cd7 100644
--- a/bsd-user/freebsd/target_os_stack.h
+++ b/bsd-user/freebsd/target_os_stack.h
@@ -23,6 +23,7 @@
 #include <sys/param.h>
 #include "target_arch_sigtramp.h"
 #include "qemu/guest-random.h"
+#include "user/tswap-target.h"
 
 /*
  * The initial FreeBSD stack is as follows:
diff --git a/bsd-user/netbsd/target_os_elf.h b/bsd-user/netbsd/target_os_elf.h
index 2f3cb20871..9de0f290c0 100644
--- a/bsd-user/netbsd/target_os_elf.h
+++ b/bsd-user/netbsd/target_os_elf.h
@@ -22,6 +22,7 @@
 
 #include "target_arch_elf.h"
 #include "elf.h"
+#include "user/tswap-target.h"
 
 /* this flag is uneffective under linux too, should be deleted */
 #ifndef MAP_DENYWRITE
diff --git a/bsd-user/openbsd/target_os_elf.h b/bsd-user/openbsd/target_os_elf.h
index 6dca9c5a85..4cf5747dcd 100644
--- a/bsd-user/openbsd/target_os_elf.h
+++ b/bsd-user/openbsd/target_os_elf.h
@@ -22,6 +22,7 @@
 
 #include "target_arch_elf.h"
 #include "elf.h"
+#include "user/tswap-target.h"
 
 /* this flag is uneffective under linux too, should be deleted */
 #ifndef MAP_DENYWRITE
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 7c44ffb3af..78848f018c 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -36,14 +36,6 @@
 #define BSWAP_NEEDED
 #endif
 
-#if TARGET_LONG_SIZE == 4
-#define tswapl(s) tswap32(s)
-#define bswaptls(s) bswap32s(s)
-#else
-#define tswapl(s) tswap64(s)
-#define bswaptls(s) bswap64s(s)
-#endif
-
 /* Target-endianness CPU memory access functions. These fit into the
  * {ld,st}{type}{sign}{size}{endian}_p naming scheme described in bswap.h.
  */
diff --git a/include/exec/user/abitypes.h b/include/exec/user/abitypes.h
index db4a670328..731f345ff5 100644
--- a/include/exec/user/abitypes.h
+++ b/include/exec/user/abitypes.h
@@ -2,6 +2,7 @@
 #define EXEC_USER_ABITYPES_H
 
 #include "cpu.h"
+#include "user/tswap-target.h"
 
 #ifdef TARGET_ABI32
 #define TARGET_ABI_BITS 32
diff --git a/include/user/tswap-target.h b/include/user/tswap-target.h
new file mode 100644
index 0000000000..4719330dbb
--- /dev/null
+++ b/include/user/tswap-target.h
@@ -0,0 +1,22 @@
+/*
+ * target-specific swap() definitions
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+#ifndef USER_TSWAP_H
+#define USER_TSWAP_H
+
+#include "exec/cpu-defs.h"
+#include "exec/tswap.h"
+
+#if TARGET_LONG_SIZE == 4
+#define tswapl(s) tswap32(s)
+#define bswaptls(s) bswap32s(s)
+#else
+#define tswapl(s) tswap64(s)
+#define bswaptls(s) bswap64s(s)
+#endif
+
+#endif
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index e5a773ddde..b2faf1d0dd 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu.h"
+#include "user/tswap-target.h"
 #include "gdbstub/user.h"
 #include "signal-common.h"
 #include "trace.h"
diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index 96499751eb..6dc01d3be7 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -22,6 +22,7 @@
 #include <sys/ioccom.h>
 
 #include "qemu.h"
+#include "user/tswap-target.h"
 
 #include "os-strace.h"  /* OS dependent strace print functions */
 
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index a0999dac15..207455c1ba 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -7,6 +7,7 @@
 #include <sys/shm.h>
 
 #include "qemu.h"
+#include "user/tswap-target.h"
 #include "user-internals.h"
 #include "signal-common.h"
 #include "loader.h"
diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index cfe70fc5cf..990048f42a 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -21,6 +21,7 @@
 #include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
+#include "user/tswap-target.h"
 
 /* from the Linux kernel - /arch/x86/include/uapi/asm/sigcontext.h */
 
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index 652038a53c..a1d8c0bccc 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -21,6 +21,7 @@
 #include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
+#include "user/tswap-target.h"
 #include "vdso-asmoffset.h"
 
 /* See arch/powerpc/include/asm/ucontext.h.  Only used for 32-bit PPC;
-- 
2.41.0

