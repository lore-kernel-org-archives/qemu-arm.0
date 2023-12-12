Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp865493ejo;
        Tue, 12 Dec 2023 04:36:13 -0800 (PST)
X-Received: by 2002:a05:651c:124e:b0:2cc:1d9d:d8e9 with SMTP id h14-20020a05651c124e00b002cc1d9dd8e9mr1419682ljh.70.1702384573597;
        Tue, 12 Dec 2023 04:36:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384573; cv=none;
        d=google.com; s=arc-20160816;
        b=PHypWSgFj/IhZunHChW+0BaPYt8xYUlyv61uH9tD5HiuD/W6GMxcN+VSKwkFck+3qL
         SP7fTuVx5B2uTm0CHAeXXCc+mvZcwPCRiSqkGU92MI0W5s9QLdo9ksLvIxV0PfzQNDic
         x976dowWOw9B5b+unQXptw07134GixeT+/fJqc8WgYlOnnHRPcyyKY9tpvFZWyD+rLmP
         tSOKcCSVIkhwaBcdxfkXnbDc5EZ2CEBJgCKyKBv+tbXMBPrGq1wo4oofiv7ED3FXlLwD
         I/1MluXIWHQYe+tjgsZ2jRWynYp268s8rR3R+qtuRVLDF6O+w2AKWZREzipmi27gwy6v
         QlLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tD7bO+DUD+k+B6E3Kx/bmS2SAE12lsrmdjyahyo0DL0=;
        fh=uKLhH5BJN6BNufdvAUi0ctLuhmiSUl4+/kXiuO2m6Fg=;
        b=GaiXjH7Pex1Dw3yU3sses8csVJ0Q2wE4Hi8M6Y7j8pgE+I1gN9nhzX917y91Galhax
         1i3BTF+doy8ye5wtKm4ep8IunhRUid0YmS1CMBL2QJHn95DdHG+YpOOcsUHWhW4x6YQY
         Ba7R7tSVEm0LNivfnJnI8YlN5SIzVx2UE3m3bwzPgikkXsEO6kiuJD/ul78Wfn2fzrgZ
         J7xIqvOKVnPkyJBqe+g4Q58wHFaOyzyyRDZfW7TEpH7ZKauQARAQdA0XNwdHUx4nqllX
         MA4C6OE/+lfEH8BNCETRzOf993hMwPPl/WkI+pDkLJ88xhD7incOD/WrzaQ1a1PR2VeD
         j8lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NsSsxgnc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x1-20020a50d601000000b0054ce90f3ae2sor2299193edi.6.2023.12.12.04.36.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:36:13 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NsSsxgnc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384573; x=1702989373; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tD7bO+DUD+k+B6E3Kx/bmS2SAE12lsrmdjyahyo0DL0=;
        b=NsSsxgncBDiFZs3ZY5wcL+X0DI17Kh55TuiyJsQYxj/yX/3EAnF8Gd+DRQOFYv6136
         BdoyrVJobNChs1CLGVs/ykHp2WLvp80zy+DtOjWQTbHJ11HXfgLUsUAs/OeMm6kD05M6
         M5DnFcFJJUZWP115MvT2cmNWhUz4JPbxLBKlpXbi+DVKsczePzoqZ5iLacuatWqDwZkG
         NzdXUf7ybGe8E/iy85IGNL6LbXKxPyANbI9a3TmRRZQWtKrMilAZKUuV/iniO/Eev02y
         yXtNGqNtpKo8oHuHzM/oW0LWJ9rnX4WMbCscb86kmvd5j6wFFTEe3oRpjaq8YW9IMfRZ
         E/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384573; x=1702989373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tD7bO+DUD+k+B6E3Kx/bmS2SAE12lsrmdjyahyo0DL0=;
        b=T6P5b6A6/ZszNczsmFT/hzzzGr9BH0qCoi7oP4JsG9xeZvKD+hd67OJkifChl1W7sB
         1ma4e5EX2sa88aPFD+hhuBfqy1PZP8X5ZlGeYuruF88elghymQaVwwpj8cJo21aSsgsV
         hc29Q8uBP2/lBXe15sBRko6IMS7JY4YlVEDHn8XO00JZiApBFskDAJAx1ogPp9F5lfN5
         LjGMF5YaxI8J0L7SRS2ZZ0VoDhWRcuSAMNplmbioz1e8h7A1mtXk12wWw1f1rGwk+3Qb
         l6MfPdyYz2Pb2zN39Gmd4EXs6jGx/A0VfxN1bmFTk9rfKy9EjUn9dcVApqKJcx2NFj1i
         Djwg==
X-Gm-Message-State: AOJu0YxFGfyCiNeHLQCbAAqWtctIxn3LHHNb0v/gPFEkfrHWG8wdKccG
	+6rbbHvNltcZJcfEugFi0LamOx10
X-Google-Smtp-Source: AGHT+IE/qHb9fNxUNnSXjqWADnF4Tee8OxeD9a0SVcwJqjMerPr0gBSFID/RTiz54qADX6SbJz9OHw==
X-Received: by 2002:a50:9f0d:0:b0:551:cb5d:da61 with SMTP id b13-20020a509f0d000000b00551cb5dda61mr164867edf.7.1702384573271;
        Tue, 12 Dec 2023 04:36:13 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id cy25-20020a0564021c9900b00551cf39a97asm127284edb.56.2023.12.12.04.36.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:36:12 -0800 (PST)
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
	Riku Voipio <riku.voipio@iki.fi>
Subject: [PATCH v2 18/23] accel/tcg: Un-inline retaddr helpers to 'user-retaddr.h'
Date: Tue, 12 Dec 2023 13:33:54 +0100
Message-ID: <20231212123401.37493-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BZdcjnFxG+t9

set_helper_retaddr() is only used in accel/tcg/user-exec.c.

clear_helper_retaddr() is only used in accel/tcg/user-exec.c
and accel/tcg/user-exec.c.

No need to expose their definitions to all user-emulation
files including "exec/cpu_ldst.h", move them to a new
"user-retaddr.h" header (restricted to accel/tcg/).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-retaddr.h | 28 ++++++++++++++++++++++++++++
 include/exec/cpu_ldst.h  | 28 ++--------------------------
 accel/tcg/cpu-exec.c     |  3 +++
 accel/tcg/user-exec.c    |  1 +
 4 files changed, 34 insertions(+), 26 deletions(-)
 create mode 100644 accel/tcg/user-retaddr.h

diff --git a/accel/tcg/user-retaddr.h b/accel/tcg/user-retaddr.h
new file mode 100644
index 0000000000..e0f57e1994
--- /dev/null
+++ b/accel/tcg/user-retaddr.h
@@ -0,0 +1,28 @@
+#ifndef ACCEL_TCG_USER_RETADDR_H
+#define ACCEL_TCG_USER_RETADDR_H
+
+#include "qemu/atomic.h"
+
+extern __thread uintptr_t helper_retaddr;
+
+static inline void set_helper_retaddr(uintptr_t ra)
+{
+    helper_retaddr = ra;
+    /*
+     * Ensure that this write is visible to the SIGSEGV handler that
+     * may be invoked due to a subsequent invalid memory operation.
+     */
+    signal_barrier();
+}
+
+static inline void clear_helper_retaddr(void)
+{
+    /*
+     * Ensure that previous memory operations have succeeded before
+     * removing the data visible to the signal handler.
+     */
+    signal_barrier();
+    helper_retaddr = 0;
+}
+
+#endif
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 6061e33ac9..25e7239cc5 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -300,31 +300,7 @@ Int128 cpu_atomic_cmpxchgo_be_mmu(CPUArchState *env, abi_ptr addr,
                                   Int128 cmpv, Int128 newv,
                                   MemOpIdx oi, uintptr_t retaddr);
 
-#if defined(CONFIG_USER_ONLY)
-
-extern __thread uintptr_t helper_retaddr;
-
-static inline void set_helper_retaddr(uintptr_t ra)
-{
-    helper_retaddr = ra;
-    /*
-     * Ensure that this write is visible to the SIGSEGV handler that
-     * may be invoked due to a subsequent invalid memory operation.
-     */
-    signal_barrier();
-}
-
-static inline void clear_helper_retaddr(void)
-{
-    /*
-     * Ensure that previous memory operations have succeeded before
-     * removing the data visible to the signal handler.
-     */
-    signal_barrier();
-    helper_retaddr = 0;
-}
-
-#else
+#if !defined(CONFIG_USER_ONLY)
 
 #include "tcg/oversized-guest.h"
 
@@ -376,7 +352,7 @@ static inline CPUTLBEntry *tlb_entry(CPUState *cpu, uintptr_t mmu_idx,
     return &cpu->neg.tlb.f[mmu_idx].table[tlb_index(cpu, mmu_idx, addr)];
 }
 
-#endif /* defined(CONFIG_USER_ONLY) */
+#endif /* !defined(CONFIG_USER_ONLY) */
 
 #if TARGET_BIG_ENDIAN
 # define cpu_lduw_data        cpu_lduw_be_data
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index c938eb96f8..e591992d0c 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -44,6 +44,9 @@
 #include "tb-context.h"
 #include "internal-common.h"
 #include "internal-target.h"
+#if defined(CONFIG_USER_ONLY)
+#include "user-retaddr.h"
+#endif
 
 /* -icount align implementation. */
 
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 68b252cb8e..2575f0842f 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -31,6 +31,7 @@
 #include "tcg/tcg-ldst.h"
 #include "internal-common.h"
 #include "internal-target.h"
+#include "user-retaddr.h"
 
 __thread uintptr_t helper_retaddr;
 
-- 
2.41.0
