Received: by 10.25.208.194 with SMTP id h185csp855000lfg;
        Fri, 22 Apr 2016 09:09:30 -0700 (PDT)
X-Received: by 10.25.125.212 with SMTP id y203mr9333694lfc.91.1461341357657;
        Fri, 22 Apr 2016 09:09:17 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from mail-lf0-x22c.google.com (mail-lf0-x22c.google.com. [2a00:1450:4010:c07::22c])
        by mx.google.com with ESMTPS id ky5si5149872lbc.106.2016.04.22.09.09.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Apr 2016 09:09:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c07::22c as permitted sender) client-ip=2a00:1450:4010:c07::22c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c07::22c as permitted sender) smtp.mailfrom=sergey.fedorov@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-lf0-x22c.google.com with SMTP id c126so82162815lfb.2
        for <alex.bennee@linaro.org>; Fri, 22 Apr 2016 09:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=M1k9luzcZneGtKCf+zbkD3kgZYx2P+IxsJK4JYas0kk=;
        b=QkmbG+YcthauviuD71Nt3VNMRf8XiImHq3j9qihbrvj7xVZOa/QeKlla/zbuJJkvAU
         /mH5+DzmdNk1UDuz2OzILQXctPjcGJUbmY7YjeOP7jTSWqqjb+qILxsf8fnGOwq7bN5d
         ry4oEU80rFiLolD3Gf9VSK7kp+mBrwU2S2hts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=M1k9luzcZneGtKCf+zbkD3kgZYx2P+IxsJK4JYas0kk=;
        b=CGbGIbBaBbDMjZTVCCoWw2mJUJmFNGMnPQE0Q3FwZJWxhjQbgSQtHMBCdH7azVQfl2
         eQVuh4ZorceDleUdN3yJVvB9aSAHDvSGwNNwYrukb/TryBihUEKRx8dR2ZDeOj4ftjxI
         zXQz4hIjksvQ5cb9v6QujLJZlDvoe2qjnhlNiq+4a+ox17hlbDMvPjAfbmavJ1hIznwa
         Up38KjTxb5Fw+Xm4CrypFG9wlKC/ok5MlkLKotD7pPFKcjOVAmzmVEmiqi94pojvZOyG
         yMzRVAtg41SjpaUpSfZb7bsnRy0frK1OOPute6F9iJKIVpStw7jDZ4u/lVmvmawNIipm
         GGxw==
X-Gm-Message-State: AOPr4FWSAG97Thby87h60Ag5McDWw/VvYapoT8h+8XlApzqHr3nZKLLK7SvVpTeJdGD/5IIxyeg=
X-Received: by 10.25.21.39 with SMTP id l39mr3885434lfi.106.1461341357495;
        Fri, 22 Apr 2016 09:09:17 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from sergey-laptop.Dlink (broadband-46-188-121-115.2com.net. [46.188.121.115])
        by smtp.gmail.com with ESMTPSA id hw7sm1645709lbb.40.2016.04.22.09.09.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 09:09:16 -0700 (PDT)
From: Sergey Fedorov <sergey.fedorov@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Sergey Fedorov <sergey.fedorov@linaro.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 07/11] tcg/arm: Make direct jump patching thread-safe
Date: Fri, 22 Apr 2016 19:08:49 +0300
Message-Id: <1461341333-19646-8-git-send-email-sergey.fedorov@linaro.org>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461341333-19646-1-git-send-email-sergey.fedorov@linaro.org>
References: <1461341333-19646-1-git-send-email-sergey.fedorov@linaro.org>
X-TUID: 185XZrywL/je

From: Sergey Fedorov <serge.fdrv@gmail.com>

Ensure direct jump patching in ARM is atomic by using
atomic_read()/atomic_set() for code patching.

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
---

Changes in v 2:
 * Add tcg_debug_assert() to check offset
 * Use deposit32() for insturction patching

 include/exec/exec-all.h  | 25 ++-----------------------
 tcg/arm/tcg-target.inc.c | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e18cc24e50f0..6a054ee720a8 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -327,29 +327,8 @@ static inline void tb_set_jmp_target1(uintptr_t jmp_addr, uintptr_t addr)
 void aarch64_tb_set_jmp_target(uintptr_t jmp_addr, uintptr_t addr);
 #define tb_set_jmp_target1 aarch64_tb_set_jmp_target
 #elif defined(__arm__)
-static inline void tb_set_jmp_target1(uintptr_t jmp_addr, uintptr_t addr)
-{
-#if !QEMU_GNUC_PREREQ(4, 1)
-    register unsigned long _beg __asm ("a1");
-    register unsigned long _end __asm ("a2");
-    register unsigned long _flg __asm ("a3");
-#endif
-
-    /* we could use a ldr pc, [pc, #-4] kind of branch and avoid the flush */
-    *(uint32_t *)jmp_addr =
-        (*(uint32_t *)jmp_addr & ~0xffffff)
-        | (((addr - (jmp_addr + 8)) >> 2) & 0xffffff);
-
-#if QEMU_GNUC_PREREQ(4, 1)
-    __builtin___clear_cache((char *) jmp_addr, (char *) jmp_addr + 4);
-#else
-    /* flush icache */
-    _beg = jmp_addr;
-    _end = jmp_addr + 4;
-    _flg = 0;
-    __asm __volatile__ ("swi 0x9f0002" : : "r" (_beg), "r" (_end), "r" (_flg));
-#endif
-}
+void arm_tb_set_jmp_target(uintptr_t jmp_addr, uintptr_t addr);
+#define tb_set_jmp_target1 arm_tb_set_jmp_target
 #elif defined(__sparc__) || defined(__mips__)
 void tb_set_jmp_target1(uintptr_t jmp_addr, uintptr_t addr);
 #else
diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
index 3edf6a6f971c..2750610a54f1 100644
--- a/tcg/arm/tcg-target.inc.c
+++ b/tcg/arm/tcg-target.inc.c
@@ -121,6 +121,14 @@ static inline void reloc_pc24(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
     *code_ptr = (*code_ptr & ~0xffffff) | (offset & 0xffffff);
 }
 
+static inline void reloc_pc24_atomic(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+{
+    ptrdiff_t offset = (tcg_ptr_byte_diff(target, code_ptr) - 8) >> 2;
+    tcg_insn_unit insn = atomic_read(code_ptr);
+    tcg_debug_assert(offset == sextract32(offset, 0, 24));
+    atomic_set(code_ptr, deposit32(insn, 0, 24, offset));
+}
+
 static void patch_reloc(tcg_insn_unit *code_ptr, int type,
                         intptr_t value, intptr_t addend)
 {
@@ -1038,6 +1046,16 @@ static void tcg_out_call(TCGContext *s, tcg_insn_unit *addr)
     }
 }
 
+void arm_tb_set_jmp_target(uintptr_t jmp_addr, uintptr_t addr)
+{
+    tcg_insn_unit *code_ptr = (tcg_insn_unit *)jmp_addr;
+    tcg_insn_unit *target = (tcg_insn_unit *)addr;
+
+    /* we could use a ldr pc, [pc, #-4] kind of branch and avoid the flush */
+    reloc_pc24_atomic(code_ptr, target);
+    flush_icache_range(jmp_addr, jmp_addr + 4);
+}
+
 static inline void tcg_out_goto_label(TCGContext *s, int cond, TCGLabel *l)
 {
     if (l->has_value) {
-- 
2.8.1
