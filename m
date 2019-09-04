Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q25sm3344955wmq.27.2019.09.04.04.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 04:21:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 813951FF92;
	Wed,  4 Sep 2019 12:21:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	"Emilio G. Cota" <cota@braap.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v2 5/5] atomic_template: fix indentation in GEN_ATOMIC_HELPER
Date: Wed,  4 Sep 2019 12:21:08 +0100
Message-Id: <20190904112108.2341-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904112108.2341-1-alex.bennee@linaro.org>
References: <20190904112108.2341-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3fSwyZXx4EIJ

From: "Emilio G. Cota" <cota@braap.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/atomic_template.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index df9c8388178..287433d809b 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -149,7 +149,7 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr,
 
 #define GEN_ATOMIC_HELPER(X)                                        \
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
-                 ABI_TYPE val EXTRA_ARGS)                           \
+                        ABI_TYPE val EXTRA_ARGS)                    \
 {                                                                   \
     ATOMIC_MMU_DECLS;                                               \
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;                           \
-- 
2.20.1
