Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w10sm3496524wrv.90.2019.04.30.09.58.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2019 09:58:32 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1B1311FF9C;
	Tue, 30 Apr 2019 17:52:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	mark.cave-ayland@ilande.co.uk,
	cota@braap.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v5 12/15] cputlb: Do unaligned store recursion to outermost function
Date: Tue, 30 Apr 2019 17:52:31 +0100
Message-Id: <20190430165234.32272-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430165234.32272-1-alex.bennee@linaro.org>
References: <20190430165234.32272-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GDPpHmXmCLLp

From: Richard Henderson <richard.henderson@linaro.org>

This is less tricky than for loads, because we always fall
back to single byte stores to implement unaligned stores.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cputlb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e4d0c94301..a083324768 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1413,9 +1413,9 @@ tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
  * Store Helpers
  */
 
-static void store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
-                         TCGMemOpIdx oi, uintptr_t retaddr, size_t size,
-                         bool big_endian)
+static inline void __attribute__((always_inline))
+store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
+             TCGMemOpIdx oi, uintptr_t retaddr, size_t size, bool big_endian)
 {
     uintptr_t mmu_idx = get_mmuidx(oi);
     uintptr_t index = tlb_index(env, mmu_idx, addr);
@@ -1514,7 +1514,7 @@ static void store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
                 /* Little-endian extract.  */
                 val8 = val >> (i * 8);
             }
-            store_helper(env, addr + i, val8, oi, retaddr, 1, big_endian);
+            helper_ret_stb_mmu(env, addr + i, val8, oi, retaddr);
         }
         return;
     }
-- 
2.20.1
