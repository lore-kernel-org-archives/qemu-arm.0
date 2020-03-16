Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y200sm447043wmc.20.2020.03.16.10.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 10:22:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4EA8E1FF9C;
	Mon, 16 Mar 2020 17:21:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH  v1 13/28] target/i386: use gdb_get_reg helpers
Date: Mon, 16 Mar 2020 17:21:40 +0000
Message-Id: <20200316172155.971-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316172155.971-1-alex.bennee@linaro.org>
References: <20200316172155.971-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GfY7rDwKa9T0

This is cleaner than poking memory directly and will make later
clean-ups easier.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v7
  - remove stray space
  - fixup the floatx80 set/get routines
---
 target/i386/gdbstub.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
index 572ead641ca..e4d8cb66c00 100644
--- a/target/i386/gdbstub.c
+++ b/target/i386/gdbstub.c
@@ -98,26 +98,22 @@ int x86_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
                 return gdb_get_reg64(mem_buf,
                                      env->regs[gpr_map[n]] & 0xffffffffUL);
             } else {
-                memset(mem_buf, 0, sizeof(target_ulong));
-                return sizeof(target_ulong);
+                return gdb_get_regl(mem_buf, 0);
             }
         } else {
             return gdb_get_reg32(mem_buf, env->regs[gpr_map32[n]]);
         }
     } else if (n >= IDX_FP_REGS && n < IDX_FP_REGS + 8) {
-#ifdef USE_X86LDOUBLE
-        /* FIXME: byteswap float values - after fixing fpregs layout. */
-        memcpy(mem_buf, &env->fpregs[n - IDX_FP_REGS], 10);
-#else
-        memset(mem_buf, 0, 10);
-#endif
-        return 10;
+        floatx80 *fp = (floatx80 *) &env->fpregs[n - IDX_FP_REGS];
+        int len = gdb_get_reg64(mem_buf, cpu_to_le64(fp->low));
+        len += gdb_get_reg16(mem_buf + len, cpu_to_le16(fp->high));
+        return len;
     } else if (n >= IDX_XMM_REGS && n < IDX_XMM_REGS + CPU_NB_REGS) {
         n -= IDX_XMM_REGS;
         if (n < CPU_NB_REGS32 || TARGET_LONG_BITS == 64) {
-            stq_p(mem_buf, env->xmm_regs[n].ZMM_Q(0));
-            stq_p(mem_buf + 8, env->xmm_regs[n].ZMM_Q(1));
-            return 16;
+            return gdb_get_reg128(mem_buf,
+                                  env->xmm_regs[n].ZMM_Q(0),
+                                  env->xmm_regs[n].ZMM_Q(1));
         }
     } else {
         switch (n) {
@@ -290,10 +286,9 @@ int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
             return 4;
         }
     } else if (n >= IDX_FP_REGS && n < IDX_FP_REGS + 8) {
-#ifdef USE_X86LDOUBLE
-        /* FIXME: byteswap float values - after fixing fpregs layout. */
-        memcpy(&env->fpregs[n - IDX_FP_REGS], mem_buf, 10);
-#endif
+        floatx80 *fp = (floatx80 *) &env->fpregs[n - IDX_FP_REGS];
+        fp->low = le64_to_cpu(* (uint64_t *) mem_buf);
+        fp->high = le16_to_cpu(* (uint16_t *) (mem_buf + 8));
         return 10;
     } else if (n >= IDX_XMM_REGS && n < IDX_XMM_REGS + CPU_NB_REGS) {
         n -= IDX_XMM_REGS;
-- 
2.20.1
