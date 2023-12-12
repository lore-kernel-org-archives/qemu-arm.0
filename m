Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp865355ejo;
        Tue, 12 Dec 2023 04:35:59 -0800 (PST)
X-Received: by 2002:a17:907:968b:b0:a04:5464:f0bf with SMTP id hd11-20020a170907968b00b00a045464f0bfmr4206247ejc.63.1702384559433;
        Tue, 12 Dec 2023 04:35:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384559; cv=none;
        d=google.com; s=arc-20160816;
        b=BO2rdreLCsb/J/gyjRYZHMekTAYLmcUp/moViEHom35dJT/DcGyHjE0/YdJQ0N7D5z
         k2Y3O8mRs3tugrYAcKDbJSsuFdbMLDElTWkFjdQXip9MsQDgUEJZiVuuVtUzuQkGtR+5
         S4vvPVde5F8A1T0uo+wNR5i0L+8TO888FyO45WpczUi5hCk4KViBffe18e/sTfoEr61P
         n90GoDLi1SCT8zVlXN8zXm34cx4nb7UmBYaL/PluQ/Jbks4r2aBbwdSGMhAVvWjBQKAy
         mm4mVyPOtQQqcRB+67r3Z0yB/hgSm/IMJVl/ErvufSi9Bc/l8EGyHHnSfrU/ZXrss/T0
         AeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xslJUC3cunhRFccFUTnzrLeqNr8O79apnk92wLCDXQw=;
        fh=jUXvrctdLNvPTPf8EqilWtRTPbB+utYg2FT0iF33S44=;
        b=zMxiUCoueUNAGZ0bVs+dN1FxEHFKbuje3qtXc44liv1GpHK9OxxoXe33HflrORUCkF
         m9y+ShtCjhu9ag3UTamdH5ahDgnQV41e5PzD8YzQ9ocf/5Jl4jxkcBPrYjTNUIsrZ9s6
         WG3vwEMVGOKGDoGDSE9Q5Rrihv0QH30C9azaqY6EGDrHJoGbUb5K4SBidag084PtN123
         8U9YR408EUH+wo9/a+LUC99K63yhx+eMAb4gfJgYVUUMRjZqLvzs7Av4Ttb13JdUyGA5
         oyvUT3gRlvGsWhQgruIH8zAV6FZ2B/KlFs9xXGYQfq+7esds8oF5yDBrLJwqm3aqOiVE
         odhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VRTn4FVo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ml23-20020a170906cc1700b00a114c906b38sor2320949ejb.17.2023.12.12.04.35.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:35:59 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VRTn4FVo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384559; x=1702989359; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xslJUC3cunhRFccFUTnzrLeqNr8O79apnk92wLCDXQw=;
        b=VRTn4FVoNQBKQaBVlxDJEs6WZYJfhR44KU1pXbCV7QT/FFzGZLfFJWOR5U5TDB4L/I
         RFQEa9iWU7eSHMrdiIxt32KGZjJHqRy3dk7GQXuzD5LbkpefiYMGhgSFO/6QpX4bVXXp
         1cUmoKjJoQazQP/SpvuG604pSdCFnA/o4S4EfyZuQx7ghew4TaSyBRlWNAghXy1StG1m
         paIMh8YAo3gga/fWsrWQBpCb16nxu7t98wh9WiOygwH7cxxmB/OHSQ9BtsR8dMwBeVCC
         piElyR8i+L2BiNdy0EeSYIS6AKk5wjVNsnQTeZB9RIU5vaapxvR+qyQ4Ure2jGonFoZ/
         NILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384559; x=1702989359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xslJUC3cunhRFccFUTnzrLeqNr8O79apnk92wLCDXQw=;
        b=w1oZKQLrar4aRaloyNiI2udi2targm3GbO7NOok/nPKlvxjLcckd7PYXeTtJAxYtOi
         IZR+cFnC+RR8tNosD6TsvTDwjBYaLIzsgZ6JlW8Hyt1I8mUbB6VbOzEby3Eox8QnUsUb
         sUN0xOVvSI5ugomnpHGwmeFqyUF9IQ1QIhkDFmmHK0pt/v/DcnRc3Xo6/5na0IDxbMBF
         0ngVgywZ50d9yDHfJ9QWOGVpyeUweqDgo+kLfaZfSWBOcl5PwmHhR6Zi8vHKF229CHEq
         nwiMVUrdl2zbj1e2PhY7cnQgC1zJLXwY6snVG9PVuGsbu+u2S9FRwog9PaTfsoUPaGDb
         esvw==
X-Gm-Message-State: AOJu0YwtMvrYnkIIx6HVAx14Y4yOgiLeBZVM9GkNqSQLDekhaJFJKmzH
	OuB7aLZ8M+ZeBapU3YmeI/POQ3rUXG1K8xkyMQ2oHjfa
X-Google-Smtp-Source: AGHT+IGamzso69xnPwzGKjHX41GnloqCiUmwOG28jEND09G11dW0vVNtrhqK56fjX2WhuNEhH2u0bA==
X-Received: by 2002:a17:906:35cb:b0:a1d:c75c:3d3a with SMTP id p11-20020a17090635cb00b00a1dc75c3d3amr3374408ejb.29.1702384559159;
        Tue, 12 Dec 2023 04:35:59 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id ts4-20020a170907c5c400b00a1cc1be1158sm6202405ejc.165.2023.12.12.04.35.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:35:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-riscv@nongnu.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Kyle Evans <kevans@freebsd.org>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 16/23] exec: Move [b]tswapl() declarations to 'exec/user/tswap-target.h'
Date: Tue, 12 Dec 2023 13:33:52 +0100
Message-ID: <20231212123401.37493-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Mnf/09d4Y8Jq

tswapl() and bswaptls() are target-dependent and only used
by user emulation. Move their definitions to a new header:
"exec/user/tswap-target.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 bsd-user/freebsd/target_os_elf.h   |  1 +
 bsd-user/freebsd/target_os_stack.h |  1 +
 bsd-user/netbsd/target_os_elf.h    |  1 +
 bsd-user/openbsd/target_os_elf.h   |  1 +
 include/exec/cpu-all.h             |  8 --------
 include/exec/user/abitypes.h       |  1 +
 include/exec/user/tswap-target.h   | 22 ++++++++++++++++++++++
 bsd-user/signal.c                  |  1 +
 bsd-user/strace.c                  |  1 +
 linux-user/elfload.c               |  1 +
 linux-user/i386/signal.c           |  1 +
 linux-user/ppc/signal.c            |  1 +
 12 files changed, 32 insertions(+), 8 deletions(-)
 create mode 100644 include/exec/user/tswap-target.h

diff --git a/bsd-user/freebsd/target_os_elf.h b/bsd-user/freebsd/target_os_elf.h
index 9df17d56d8..27d8ce036c 100644
--- a/bsd-user/freebsd/target_os_elf.h
+++ b/bsd-user/freebsd/target_os_elf.h
@@ -22,6 +22,7 @@
 
 #include "target_arch_elf.h"
 #include "elf.h"
+#include "exec/user/tswap-target.h"
 
 #define bsd_get_ncpu() 1 /* until we pull in bsd-proc.[hc] */
 
diff --git a/bsd-user/freebsd/target_os_stack.h b/bsd-user/freebsd/target_os_stack.h
index d15fc3263f..6125208182 100644
--- a/bsd-user/freebsd/target_os_stack.h
+++ b/bsd-user/freebsd/target_os_stack.h
@@ -23,6 +23,7 @@
 #include <sys/param.h>
 #include "target_arch_sigtramp.h"
 #include "qemu/guest-random.h"
+#include "exec/user/tswap-target.h"
 
 /*
  * The initial FreeBSD stack is as follows:
diff --git a/bsd-user/netbsd/target_os_elf.h b/bsd-user/netbsd/target_os_elf.h
index 2f3cb20871..23b422bfce 100644
--- a/bsd-user/netbsd/target_os_elf.h
+++ b/bsd-user/netbsd/target_os_elf.h
@@ -22,6 +22,7 @@
 
 #include "target_arch_elf.h"
 #include "elf.h"
+#include "exec/user/tswap-target.h"
 
 /* this flag is uneffective under linux too, should be deleted */
 #ifndef MAP_DENYWRITE
diff --git a/bsd-user/openbsd/target_os_elf.h b/bsd-user/openbsd/target_os_elf.h
index 6dca9c5a85..fc1dfa2e49 100644
--- a/bsd-user/openbsd/target_os_elf.h
+++ b/bsd-user/openbsd/target_os_elf.h
@@ -22,6 +22,7 @@
 
 #include "target_arch_elf.h"
 #include "elf.h"
+#include "exec/user/tswap-target.h"
 
 /* this flag is uneffective under linux too, should be deleted */
 #ifndef MAP_DENYWRITE
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index b042d94892..95af418920 100644
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
index 6178453d94..ed10d5fe7e 100644
--- a/include/exec/user/abitypes.h
+++ b/include/exec/user/abitypes.h
@@ -2,6 +2,7 @@
 #define EXEC_USER_ABITYPES_H
 
 #include "cpu.h"
+#include "exec/user/tswap-target.h"
 
 #ifdef TARGET_ABI32
 #define TARGET_ABI_BITS 32
diff --git a/include/exec/user/tswap-target.h b/include/exec/user/tswap-target.h
new file mode 100644
index 0000000000..ff302436fe
--- /dev/null
+++ b/include/exec/user/tswap-target.h
@@ -0,0 +1,22 @@
+/*
+ * target-specific swap() definitions
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+#ifndef EXEC_USER_TSWAP_H
+#define EXEC_USER_TSWAP_H
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
index ca31470772..7b2d25230a 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu.h"
+#include "exec/user/tswap-target.h"
 #include "gdbstub/user.h"
 #include "signal-common.h"
 #include "trace.h"
diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index 96499751eb..a1b738e63c 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -22,6 +22,7 @@
 #include <sys/ioccom.h>
 
 #include "qemu.h"
+#include "exec/user/tswap-target.h"
 
 #include "os-strace.h"  /* OS dependent strace print functions */
 
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index cf9e74468b..debea5c355 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -6,6 +6,7 @@
 #include <sys/shm.h>
 
 #include "qemu.h"
+#include "exec/user/tswap-target.h"
 #include "user-internals.h"
 #include "signal-common.h"
 #include "loader.h"
diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index bc5d45302e..eea1fa68c9 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -21,6 +21,7 @@
 #include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
+#include "exec/user/tswap-target.h"
 
 /* from the Linux kernel - /arch/x86/include/uapi/asm/sigcontext.h */
 
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index 7e7302823b..988b59a916 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -21,6 +21,7 @@
 #include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
+#include "exec/user/tswap-target.h"
 #include "vdso-asmoffset.h"
 
 /* See arch/powerpc/include/asm/ucontext.h.  Only used for 32-bit PPC;
-- 
2.41.0
