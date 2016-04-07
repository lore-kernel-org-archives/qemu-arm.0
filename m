Received: by 10.25.208.211 with SMTP id h202csp584471lfg;
        Thu, 7 Apr 2016 08:55:17 -0700 (PDT)
X-Received: by 10.25.131.147 with SMTP id f141mr1759305lfd.12.1460044505818;
        Thu, 07 Apr 2016 08:55:05 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from mail-lb0-x22b.google.com (mail-lb0-x22b.google.com. [2a00:1450:4010:c04::22b])
        by mx.google.com with ESMTPS id g25si4471405lfi.117.2016.04.07.08.55.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Apr 2016 08:55:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c04::22b as permitted sender) client-ip=2a00:1450:4010:c04::22b;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c04::22b as permitted sender) smtp.mailfrom=sergey.fedorov@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-lb0-x22b.google.com with SMTP id u8so52774310lbk.0
        for <alex.bennee@linaro.org>; Thu, 07 Apr 2016 08:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=M5TzR9ATsB/TaK3cTqPV3EJi+kijAYRCriy5dm4veUU=;
        b=BkScvnm8w+6p2pJvVxyijVvjJDklkzrprX3KKr5t9SsDhjsH/GythmCQ9xqIEPsPPN
         S7P3lq2XCxuMe8tFtrya/u8L8+2TcBdoUint/89l5idqqErjDu70k1V1W1PJS5JgLE91
         4TLNoMic1F2u1OBXWpvnSUhYsq0rQpfisHXOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=M5TzR9ATsB/TaK3cTqPV3EJi+kijAYRCriy5dm4veUU=;
        b=WtAhMoLOACtwbiDE2lTTbHShsESqQnbG/ExnbUHeprZS38jSTw9ImwVoaBFW3ABV1a
         sKrfuDTO4Wlf/ruYy4HfilJ2QciUQqISAqlXuOhDQps18oi5cLdtXjS8UXjstL5jaRqR
         7eUBk7geOpl1BASpvJ7XHQpE+8zDnPBjXVMH+MhXqlpMq7puZh/Wu8O2W9eOTLt6lBWp
         +amW67xedMMUoyWCY4djhoiL/yGlQTupdasSaNp49UgQ/4qHgUenycuh1qAJp7s8iTCC
         ukX7rxcqr5e0UlU1qhTlfMJzXglCP7kf6ccZPJ1VZaF22cowljPw+1eGNuy7iGsuSsjc
         bz5Q==
X-Gm-Message-State: AD7BkJLyhfhViM6JHlhnlUFzTPU0J2mcoBmeTmrdTDNOOarrob3GZpvEsQgFb3O6QZJqJ4wNrhk=
X-Received: by 10.112.181.196 with SMTP id dy4mr1715175lbc.42.1460044505662;
        Thu, 07 Apr 2016 08:55:05 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from localhost.localdomain ([195.91.132.170])
        by smtp.gmail.com with ESMTPSA id p195sm1316255lfd.11.2016.04.07.08.55.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 07 Apr 2016 08:55:04 -0700 (PDT)
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
Subject: [PATCH 07/11] tcg/arm: Make direct jump patching thread-safe
Date: Thu,  7 Apr 2016 18:53:49 +0300
Message-Id: <1460044433-19282-8-git-send-email-sergey.fedorov@linaro.org>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1460044433-19282-1-git-send-email-sergey.fedorov@linaro.org>
References: <1460044433-19282-1-git-send-email-sergey.fedorov@linaro.org>
X-TUID: G/HY+ICoK6wC

From: Sergey Fedorov <serge.fdrv@gmail.com>

Ensure direct jump patching in ARM is atomic by using
atomic_read()/atomic_set() for code patching.

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
---
 include/exec/exec-all.h  | 25 ++-----------------------
 tcg/arm/tcg-target.inc.c | 17 +++++++++++++++++
 2 files changed, 19 insertions(+), 23 deletions(-)

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
index 3edf6a6f971c..5c69de20bc69 100644
--- a/tcg/arm/tcg-target.inc.c
+++ b/tcg/arm/tcg-target.inc.c
@@ -121,6 +121,13 @@ static inline void reloc_pc24(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
     *code_ptr = (*code_ptr & ~0xffffff) | (offset & 0xffffff);
 }
 
+static inline void reloc_pc24_atomic(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+{
+    ptrdiff_t offset = (tcg_ptr_byte_diff(target, code_ptr) - 8) >> 2;
+    tcg_insn_unit insn = atomic_read(code_ptr);
+    atomic_set(code_ptr, (insn & ~0xffffff) | (offset & 0xffffff));
+}
+
 static void patch_reloc(tcg_insn_unit *code_ptr, int type,
                         intptr_t value, intptr_t addend)
 {
@@ -1038,6 +1045,16 @@ static void tcg_out_call(TCGContext *s, tcg_insn_unit *addr)
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
