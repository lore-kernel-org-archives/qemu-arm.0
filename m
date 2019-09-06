Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q5sm269955wmq.3.2019.09.06.13.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 13:26:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EB08E1FF91;
	Fri,  6 Sep 2019 21:26:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	"Emilio G. Cota" <cota@braap.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v4 4/4] atomic_template: fix indentation in GEN_ATOMIC_HELPER
Date: Fri,  6 Sep 2019 21:26:35 +0100
Message-Id: <20190906202636.28642-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190906202636.28642-1-alex.bennee@linaro.org>
References: <20190906202636.28642-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: h4qy+FqYDttI

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
