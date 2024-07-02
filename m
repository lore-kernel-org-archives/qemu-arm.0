Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp2261896njm;
        Tue, 2 Jul 2024 16:42:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW/dJVDyHPjAijM1IqknhE07KExtTRlQw/0TKTpiNclSa1H6A1Li1V+vCveQZChi5WA0TyBh1w8r0hhS8KjHe23xFojiMLX
X-Google-Smtp-Source: AGHT+IHpuJE22yKlm08K3mQmrCCcGfy3Xwo7hsOmeasCUo5sSL/T3k182rRPNkSjw2aagOOkG3Jk
X-Received: by 2002:a25:e30b:0:b0:de4:6ef8:2778 with SMTP id 3f1490d57ef6-e036eb6ebe7mr9345009276.29.1719963744203;
        Tue, 02 Jul 2024 16:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719963744; cv=none;
        d=google.com; s=arc-20160816;
        b=pArBdiuAdeInx8Q6zV3QT/d0o5/PbmtNe4nuOXenBQwMmP48vo/uz5D9xYHWBH3Nf9
         bbNH7qEeP9QFt+tVcedjD0FAgpSQHn50FLxCpTpbn4AWrEWmGjsKfLRL/rom1ueqHXxv
         ymYwhsJeaqDPbSJNsgUn03xTrgDb6qvCnWFQ4VzB8cTBu+85iK6iIbMWNUsuGe/bwIji
         hkDLI2N4jtV/5NHU9Nl7vfBY0NAm8dJVxnJ6c2IZJ453/pEutnOP3o24ht/Q+LaAalgE
         cTN7UdYEWXNvTktAJqQMH1wvzktlqk9yBRxksPbY1p1j/Py9PTEkLGTxHfYOJcWG5Ka8
         NuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=C86LL5Jjwnhff3U2J7Sfodi1QBdh0ARwqCfrj06rmAw=;
        fh=Fz3OM3AGXo6S/XDNq12jK+U+cl8IKdGchX/2GB3YVy0=;
        b=FJGonMsjzGKvYssH1QEmz4jPgMDsiNb3kiotPHm0ny1hZQ3gqeyfn18Wp4KK2uj++B
         D3l/3Ri7aENYUaliILamVupJbB9XxTC54krZnMaxX+NkgmJiH09wLNzqCwFHfvkeKL1+
         f4+ycqm7MLfuWWJfAj+Ci9TjVwyUaLCrJPhLpTOBSzVPQeiHZCXmhvOoQU+cxdnAcgTj
         TkmQjWNLd57F/2zp95+zulF5eVbVMkFDi9UCq63p+fw2DHb5TyV1Fq/qaihJejWGD49Z
         mZoTGIWa2bBvyhXWlm947Tk4Ym5fjgYPZE/ULETonvsmDCD0p0TB/bnK0dioASGFennr
         Z6lA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YC+fdWrH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e36c6d8si115092916d6.189.2024.07.02.16.42.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 16:42:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YC+fdWrH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOn8V-0007mb-Pn; Tue, 02 Jul 2024 19:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sOn8O-0007lH-LX
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 19:42:05 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sOn8L-0006NH-9l
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 19:42:04 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1fa0f143b85so34232665ad.3
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2024 16:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719963720; x=1720568520; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C86LL5Jjwnhff3U2J7Sfodi1QBdh0ARwqCfrj06rmAw=;
 b=YC+fdWrHeqfKXDFSvjD7hHFs9c6tj3WG4Ys/PZzSFFfS98M5wiVkUxsmJe/KeuzdFS
 NfZyQgnHpoGzhffqoTD+3DXVebR8ZJ0RIEsUbGYw75KvnbikNyz8Wstu8N3XxToIQ/S/
 jygS2e8CBBeid9hJQDQHeE4fWKL5F9Yv86elXF/UYENCAkjPCcGgx6RmPjWSV5C9XT7m
 463XHtQtvu/aOvjkh3JXJQDhffPAuBkITMJAunEeAo83kO3ca+FjcMC+E0xFTQ2+aYuZ
 pYcE/NcX14FrnCViFMPMq5eTxZRnUkc5/fuUoYAoFY2hnRBganWlm2w1K/+OiyEYWTWL
 7cZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719963720; x=1720568520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C86LL5Jjwnhff3U2J7Sfodi1QBdh0ARwqCfrj06rmAw=;
 b=J+6Lp1RFQfo7c0aqy1NShq0amwU2jbZ5WqsNR9rv0tXbeTzLxLnyGOr3A5J9JTVmiL
 sW5IQWuNbh+i4Xhg3cVFtGT2BN2fJdyF9iz+vBqZ5ZoeZoCCaCD9BeL6oVrc4lnLouh1
 UA9y2g/DmbHJZcQSVn3c9CExvvkQqspfbt0Rfqv3ieRM/8q9kmC2Z1TmYDZDqOxnV5+v
 tdqIXMM5tNKrz3jsEMbhA/CxC/eNDbj0Ri4raAaLRwU0J8msEqXqc/g6lv+85PqTAF7s
 wJC5cpmGijjWyEUuqynz8o9Zkm0/iP3h0coGo+4nhVYqC+SGWQYCIPN8axhZOWd7rB3p
 iK8g==
X-Gm-Message-State: AOJu0YwZumPckancrVYlRvsxuqlq//EhllFPX9o5IVh2YHkEEw8rQv5d
 MmY2GTeSlw+XPIf7qN3tG6ybMQCzDi8oxBqgVMi8w5mL3+8F7kJYY5NpLebqQJU=
X-Received: by 2002:a17:902:f682:b0:1f9:ddea:451d with SMTP id
 d9443c01a7336-1fadbc73712mr58478065ad.3.1719963719711; 
 Tue, 02 Jul 2024 16:41:59 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac15993c5sm90403755ad.244.2024.07.02.16.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 16:41:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, iii@linux.ibm.com,
 david@redhat.com, balaton@eik.bme.hu
Subject: [PATCH 2/2] target/arm: Use memset_ra, memmove_ra in helper-a64.c
Date: Tue,  2 Jul 2024 16:41:55 -0700
Message-Id: <20240702234155.2106399-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240702234155.2106399-1-richard.henderson@linaro.org>
References: <20240702234155.2106399-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TUnyetMISW8G

Without this, qemu user will not unwind from the SIGSEGV
properly and die with

  qemu-aarch64: QEMU internal SIGSEGV {code=ACCERR, addr=0x7d1b36ec2000}
  Segmentation fault

Fill in the test case for ppc and s390x, which also use memset
from within a helper (but don't currently crash fwiw).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-a64.c        | 10 ++--
 tests/tcg/multiarch/memset-fault.c | 77 ++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+), 5 deletions(-)
 create mode 100644 tests/tcg/multiarch/memset-fault.c

diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 0ea8668ab4..666bdb7c1a 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -971,7 +971,7 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
     }
 #endif
 
-    memset(mem, 0, blocklen);
+    memset_ra(mem, 0, blocklen, GETPC());
 }
 
 void HELPER(unaligned_access)(CPUARMState *env, uint64_t addr,
@@ -1120,7 +1120,7 @@ static uint64_t set_step(CPUARMState *env, uint64_t toaddr,
     }
 #endif
     /* Easy case: just memset the host memory */
-    memset(mem, data, setsize);
+    memset_ra(mem, data, setsize, ra);
     return setsize;
 }
 
@@ -1163,7 +1163,7 @@ static uint64_t set_step_tags(CPUARMState *env, uint64_t toaddr,
     }
 #endif
     /* Easy case: just memset the host memory */
-    memset(mem, data, setsize);
+    memset_ra(mem, data, setsize, ra);
     mte_mops_set_tags(env, toaddr, setsize, *mtedesc);
     return setsize;
 }
@@ -1497,7 +1497,7 @@ static uint64_t copy_step(CPUARMState *env, uint64_t toaddr, uint64_t fromaddr,
     }
 #endif
     /* Easy case: just memmove the host memory */
-    memmove(wmem, rmem, copysize);
+    memmove_ra(wmem, rmem, copysize, ra);
     return copysize;
 }
 
@@ -1572,7 +1572,7 @@ static uint64_t copy_step_rev(CPUARMState *env, uint64_t toaddr,
      * Easy case: just memmove the host memory. Note that wmem and
      * rmem here point to the *last* byte to copy.
      */
-    memmove(wmem - (copysize - 1), rmem - (copysize - 1), copysize);
+    memmove_ra(wmem - (copysize - 1), rmem - (copysize - 1), copysize, ra);
     return copysize;
 }
 
diff --git a/tests/tcg/multiarch/memset-fault.c b/tests/tcg/multiarch/memset-fault.c
new file mode 100644
index 0000000000..0e8258a88f
--- /dev/null
+++ b/tests/tcg/multiarch/memset-fault.c
@@ -0,0 +1,77 @@
+#include <stdlib.h>
+#include <signal.h>
+#include <unistd.h>
+#include <sys/mman.h>
+#include <assert.h>
+
+#if defined(__powerpc64__)
+/* Needed for PT_* constants */
+#include <asm/ptrace.h>
+#endif
+
+static void *ptr;
+static void *pc;
+
+static void test(void)
+{
+#ifdef __aarch64__
+    void *t;
+    asm("adr %0,1f; str %0,%1; 1: dc zva,%2"
+        : "=&r"(t), "=m"(pc) : "r"(ptr));
+#elif defined(__powerpc64__)
+    void *t;
+    asm("bl 0f; 0: mflr %0; addi %0,%0,1f-0b; std %0,%1; 1: dcbz 0,%2"
+        : "=&r"(t), "=m"(pc) : "r"(ptr) : "lr");
+#elif defined(__s390x__)
+    void *t;
+    asm("larl %0,1f; stg %0,%1; 1: xc 0(256,%2),0(%2)"
+        : "=&r"(t), "=m"(pc) : "r"(ptr));
+#else
+    *(int *)ptr = 0;
+#endif
+}
+
+static void *host_signal_pc(ucontext_t *uc)
+{
+#ifdef __aarch64__
+    return (void *)uc->uc_mcontext.pc;
+#elif defined(__powerpc64__)
+    return (void *)uc->uc_mcontext.gp_regs[PT_NIP];
+#elif defined(__s390x__)
+    return (void *)uc->uc_mcontext.psw.addr;
+#else
+    return NULL;
+#endif
+}
+
+static void sigsegv(int sig, siginfo_t *info, void *uc)
+{
+    assert(info->si_addr == ptr);
+    assert(host_signal_pc(uc) == pc);
+    exit(0);
+}
+
+int main(void)
+{
+    static const struct sigaction sa = {
+        .sa_flags = SA_SIGINFO,
+        .sa_sigaction = sigsegv
+    };
+    size_t size;
+    int r;
+
+    size = getpagesize();
+    ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
+               MAP_ANON | MAP_PRIVATE, -1, 0);
+    assert(ptr != MAP_FAILED);
+
+    test();
+
+    r = sigaction(SIGSEGV, &sa, NULL);
+    assert(r == 0);
+    r = mprotect(ptr, size, PROT_NONE);
+    assert(r == 0);
+
+    test();
+    abort();
+}
-- 
2.34.1

