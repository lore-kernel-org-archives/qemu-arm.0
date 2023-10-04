Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2514040ejb;
        Wed, 4 Oct 2023 02:07:21 -0700 (PDT)
X-Received: by 2002:adf:f20d:0:b0:31f:e2b9:de1f with SMTP id p13-20020adff20d000000b0031fe2b9de1fmr1543883wro.24.1696410440903;
        Wed, 04 Oct 2023 02:07:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696410440; cv=none;
        d=google.com; s=arc-20160816;
        b=Yx8B019OmHadsdxm5HyvjRKuUWvkZwG7PZIXkehRa5XhRzV+BqQB+SDakginlPEwfq
         Yq7VdXwh+4rr5/D3f4jfbsWAFwYGQVS8ttgyrKGstZOkxDr2kFij8WIMkLwFRWBFVO1o
         poFhMUnrDcyP4BScxUo9D2NGMD7fsWlyvFMwpLEi/auE5jbstIkfT07gvvzZYLRdteRT
         jcW5O3QqBDwssQTNu0FqZdD3XEj6IbBhq9Df+aDS9cJW9x1GOPoB3wJTXTUpSYm4ngAy
         dnRol5B9NkjMjrNNbFfbx3b+EjuDKvT9xgWhGUAxRLCrhk5QkzOC0YkXjWsXBXvpefB/
         8ZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sOgJBUOMii81BIol1zFAI/xxhQ5Wq887ylm0CQGkpK8=;
        fh=B0aUumoyAkvxXp0uS2Qw/KYrL+M9zrM3cIoVA7DW6vY=;
        b=RAXpssQeHsDiEygZ3Hg95/yxD6qO3wUspytVyvLIlMHn2O/AJrWmC6fGEm4m5GYcva
         jjNEc4PDxSq7KlKo5yHtyvWUZg+6YXVGUxtGnBhEqNeyCEU7SKxPio7981S7a6drB1GT
         deTh+Kp6o4Z1vP6q9ljVwKv/e1WjtlTDnlTMnH63NRUJwKEIOxTRu2Jxqc250eOcHLTg
         bfSrvlOC6wZ9RpaeN9cCZli7fRPY9IM2GfDzvQHCGEEfDLSLX34rG9u6gk8wfcgKJyTc
         PFZqLbEVdWZ2kYVzC11nb6LANcltc10lG5vH90rjYJT/VhQogrv789/XmieVXG7SKMP5
         xoEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d/oC+eHB";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s30-20020adfa29e000000b003247f706828sor1284787wra.9.2023.10.04.02.07.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Oct 2023 02:07:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d/oC+eHB";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696410440; x=1697015240; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOgJBUOMii81BIol1zFAI/xxhQ5Wq887ylm0CQGkpK8=;
        b=d/oC+eHBeVy8GTzt1a+t2iCPJR7T2gog/exiodHgb3hFm/BHmlo2ybjkOdqEBHAAeV
         z26sDTBQtTG9Pw0ZLOooRxA28OC7eWauIy9/Yh9QCYV7g61wUExUmPLfIQ1Wz3qQKBpP
         CsZd5yfG7sbCfnFoZ5o7AzxEmgqyfngwECwz2C3rrwqxKbMXBX9LK27aJ8wtVAKCEcvN
         Hr6lsfbn5S9zM27cudyhXA0RELFbx04fp4SB0nwkVocrqNX7MQpokE2xTyY25z/S7kTN
         eq8d7v/Uci//yrT6nYjBN2sOC7QljhhiU9cyEycziPS/qn5TeAcmgs6kkx0H7w+rib/y
         +Bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696410440; x=1697015240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOgJBUOMii81BIol1zFAI/xxhQ5Wq887ylm0CQGkpK8=;
        b=brBTZvWdsPf6BiF3yriAVMxxvw5L8MtmHN2b9z3Qx4SldExiD2yb6dyQHkeYr1FX5e
         BtQ0w9FnumTsxgDjarW/KYu8FhWM8NOi7AUUPtHBX4JPdn/rPmIT7UNB9Hyjuw3blzUP
         ODQVJ7bXza7+cOqLkCboCB68j1JtbFwwwzXhuihF5YkmTzx5JTCDQgkdu2AS/eLw8+MX
         8w+Ve4Q635/10QPM9yi601z025MxuDdbXJZuqVJhK8gB7aCRH1j7e5V+tLMlGPGgCbnS
         XiB33GON38ZaEZojoGicBTs8As0rKRS97HpPYsyDF29CxJsjU5LHpUQGEmnzdTOnelsy
         bKJw==
X-Gm-Message-State: AOJu0YwgEGWEnt/lEXsB9yt7MrylmAUmqL7Vm6DlIw87S/yYyUDvQyqk
	BVh2cYi3NlV9zfzrcwgIVoWOsEs0
X-Google-Smtp-Source: AGHT+IFnXKu/ZtOnkqgv7q6nNBtoDdacLKbH5YvuPEusn4Gc9GBOG9X8LgHe/UkX8BRgHrXr/TsDpQ==
X-Received: by 2002:a5d:4d8c:0:b0:323:36a3:8ca with SMTP id b12-20020a5d4d8c000000b0032336a308camr1501528wru.28.1696410440570;
        Wed, 04 Oct 2023 02:07:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr. [176.173.163.52])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d4dd0000000b00323384e04e8sm3476163wru.111.2023.10.04.02.07.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Oct 2023 02:07:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>
Subject: [PATCH 08/13] semihosting: Rename softmmu_FOO_user() -> uaccess_FOO_user()
Date: Wed,  4 Oct 2023 11:06:23 +0200
Message-ID: <20231004090629.37473-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004090629.37473-1-philmd@linaro.org>
References: <20231004090629.37473-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4INwEP2aLN5y

Add a check in 'softmmu-uaccess.h' that the header is only
include in system emulation, and rename it as 'uaccess.h'.

Rename the API methods:

  - softmmu_[un]lock_user*() -> uaccess_[un]lock_user*()
  - softmmu_strlen_user() -> uaccess_strlen_user().

Update a pair of comments.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 .../{softmmu-uaccess.h => uaccess.h}          | 24 +++++++++++--------
 semihosting/arm-compat-semi.c                 |  4 ++--
 semihosting/config.c                          |  2 +-
 semihosting/guestfd.c                         |  2 +-
 semihosting/syscalls.c                        |  2 +-
 semihosting/uaccess.c                         | 14 +++++------
 stubs/semihost.c                              |  4 ++--
 target/m68k/m68k-semi.c                       |  2 +-
 target/mips/tcg/sysemu/mips-semi.c            |  2 +-
 target/nios2/nios2-semi.c                     |  2 +-
 10 files changed, 31 insertions(+), 27 deletions(-)
 rename include/semihosting/{softmmu-uaccess.h => uaccess.h} (75%)

diff --git a/include/semihosting/softmmu-uaccess.h b/include/semihosting/uaccess.h
similarity index 75%
rename from include/semihosting/softmmu-uaccess.h
rename to include/semihosting/uaccess.h
index 4f08dfc098..3963eafc3e 100644
--- a/include/semihosting/softmmu-uaccess.h
+++ b/include/semihosting/uaccess.h
@@ -7,8 +7,12 @@
  * This code is licensed under the GPL
  */
 
-#ifndef SEMIHOSTING_SOFTMMU_UACCESS_H
-#define SEMIHOSTING_SOFTMMU_UACCESS_H
+#ifndef SEMIHOSTING_UACCESS_H
+#define SEMIHOSTING_UACCESS_H
+
+#ifdef CONFIG_USER_ONLY
+#error Cannot include semihosting/uaccess.h from user emulation
+#endif
 
 #include "cpu.h"
 
@@ -42,18 +46,18 @@
 
 #define put_user_ual(arg, p) put_user_u32(arg, p)
 
-void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
+void *uaccess_lock_user(CPUArchState *env, target_ulong addr,
                         target_ulong len, bool copy);
-#define lock_user(type, p, len, copy) softmmu_lock_user(env, p, len, copy)
+#define lock_user(type, p, len, copy) uaccess_lock_user(env, p, len, copy)
 
-char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr);
-#define lock_user_string(p) softmmu_lock_user_string(env, p)
+char *uaccess_lock_user_string(CPUArchState *env, target_ulong addr);
+#define lock_user_string(p) uaccess_lock_user_string(env, p)
 
-void softmmu_unlock_user(CPUArchState *env, void *p,
+void uaccess_unlock_user(CPUArchState *env, void *p,
                          target_ulong addr, target_ulong len);
-#define unlock_user(s, args, len) softmmu_unlock_user(env, s, args, len)
+#define unlock_user(s, args, len) uaccess_unlock_user(env, s, args, len)
 
-ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr);
-#define target_strlen(p) softmmu_strlen_user(env, p)
+ssize_t uaccess_strlen_user(CPUArchState *env, target_ulong addr);
+#define target_strlen(p) uaccess_strlen_user(env, p)
 
 #endif /* SEMIHOSTING_SOFTMMU_UACCESS_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 564fe17f75..bb43f01265 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -202,13 +202,13 @@ static LayoutInfo common_semi_find_bases(CPUState *cs)
  * The semihosting API has no concept of its errno being thread-safe,
  * as the API design predates SMP CPUs and was intended as a simple
  * real-hardware set of debug functionality. For QEMU, we make the
- * errno be per-thread in linux-user mode; in softmmu it is a simple
+ * errno be per-thread in linux-user mode; in system-mode it is a simple
  * global, and we assume that the guest takes care of avoiding any races.
  */
 #ifndef CONFIG_USER_ONLY
 static target_ulong syscall_err;
 
-#include "semihosting/softmmu-uaccess.h"
+#include "semihosting/uaccess.h"
 #endif
 
 static inline uint32_t get_swi_errno(CPUState *cs)
diff --git a/semihosting/config.c b/semihosting/config.c
index 8ca569735d..61e4016fc5 100644
--- a/semihosting/config.c
+++ b/semihosting/config.c
@@ -12,7 +12,7 @@
  * linux-user targets. However in that use case no configuration of
  * the outputs and command lines is supported.
  *
- * The config module is common to all softmmu targets however as vl.c
+ * The config module is common to all system targets however as vl.c
  * needs to link against the helpers.
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index acb86b50dd..955c2efbd0 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -15,7 +15,7 @@
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 #else
-#include "semihosting/softmmu-uaccess.h"
+#include "semihosting/uaccess.h"
 #include CONFIG_DEVICES
 #endif
 
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index d27574a1e2..4060211d19 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -15,7 +15,7 @@
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 #else
-#include "semihosting/softmmu-uaccess.h"
+#include "semihosting/uaccess.h"
 #endif
 
 
diff --git a/semihosting/uaccess.c b/semihosting/uaccess.c
index 7505eb6d1b..5d889f9263 100644
--- a/semihosting/uaccess.c
+++ b/semihosting/uaccess.c
@@ -9,9 +9,9 @@
 
 #include "qemu/osdep.h"
 #include "exec/exec-all.h"
-#include "semihosting/softmmu-uaccess.h"
+#include "semihosting/uaccess.h"
 
-void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
+void *uaccess_lock_user(CPUArchState *env, target_ulong addr,
                         target_ulong len, bool copy)
 {
     void *p = malloc(len);
@@ -24,7 +24,7 @@ void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
     return p;
 }
 
-ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr)
+ssize_t uaccess_strlen_user(CPUArchState *env, target_ulong addr)
 {
     int mmu_idx = cpu_mmu_index(env, false);
     size_t len = 0;
@@ -72,16 +72,16 @@ ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr)
     }
 }
 
-char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr)
+char *uaccess_lock_user_string(CPUArchState *env, target_ulong addr)
 {
-    ssize_t len = softmmu_strlen_user(env, addr);
+    ssize_t len = uaccess_strlen_user(env, addr);
     if (len < 0) {
         return NULL;
     }
-    return softmmu_lock_user(env, addr, len + 1, true);
+    return uaccess_lock_user(env, addr, len + 1, true);
 }
 
-void softmmu_unlock_user(CPUArchState *env, void *p,
+void uaccess_unlock_user(CPUArchState *env, void *p,
                          target_ulong addr, target_ulong len)
 {
     if (len) {
diff --git a/stubs/semihost.c b/stubs/semihost.c
index aad7a70353..9343d385d7 100644
--- a/stubs/semihost.c
+++ b/stubs/semihost.c
@@ -1,9 +1,9 @@
 /*
- * Semihosting Stubs for SoftMMU
+ * Semihosting Stubs for system emulation
  *
  * Copyright (c) 2019 Linaro Ltd
  *
- * Stubs for SoftMMU targets that don't actually do semihosting.
+ * Stubs for system targets that don't actually do semihosting.
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 80cd8d70db..b4ffb70f8b 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -27,7 +27,7 @@
 #include "gdbstub/syscalls.h"
 #include "gdbstub/helpers.h"
 #include "semihosting/syscalls.h"
-#include "semihosting/softmmu-uaccess.h"
+#include "semihosting/uaccess.h"
 #include "hw/boards.h"
 #include "qemu/log.h"
 
diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index f3735df7b9..cc084eb1a2 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -22,7 +22,7 @@
 #include "qemu/log.h"
 #include "gdbstub/syscalls.h"
 #include "gdbstub/helpers.h"
-#include "semihosting/softmmu-uaccess.h"
+#include "semihosting/uaccess.h"
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
 #include "semihosting/syscalls.h"
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index 9d0241c758..0b84fcb6b6 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -26,7 +26,7 @@
 #include "gdbstub/syscalls.h"
 #include "gdbstub/helpers.h"
 #include "semihosting/syscalls.h"
-#include "semihosting/softmmu-uaccess.h"
+#include "semihosting/uaccess.h"
 #include "qemu/log.h"
 
 #define HOSTED_EXIT  0
-- 
2.41.0
