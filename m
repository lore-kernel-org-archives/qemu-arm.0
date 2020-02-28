Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f207sm3486974wme.9.2020.02.28.11.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 11:24:17 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8D57A1FF8F;
	Fri, 28 Feb 2020 19:24:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v2 2/4] accel/tcg: remove link between guest ram and TCG cache size
Date: Fri, 28 Feb 2020 19:24:13 +0000
Message-Id: <20200228192415.19867-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228192415.19867-1-alex.bennee@linaro.org>
References: <20200228192415.19867-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oGWoCKYDXWXi

Basing the TB cache size on the ram_size was always a little heuristic
and was broken by a1b18df9a4 which caused ram_size not to be fully
realised at the time we initialise the TCG translation cache.

The current DEFAULT_CODE_GEN_BUFFER_SIZE may still be a little small
but follow-up patches will address that.

Fixes: a1b18df9a4
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: Igor Mammedov <imammedo@redhat.com>
---
 accel/tcg/translate-all.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 238b0e575bf..5b66af783b5 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -938,15 +938,7 @@ static inline size_t size_code_gen_buffer(size_t tb_size)
 {
     /* Size the buffer.  */
     if (tb_size == 0) {
-#ifdef USE_STATIC_CODE_GEN_BUFFER
         tb_size = DEFAULT_CODE_GEN_BUFFER_SIZE;
-#else
-        /* ??? Needs adjustments.  */
-        /* ??? If we relax the requirement that CONFIG_USER_ONLY use the
-           static buffer, we could size this on RESERVED_VA, on the text
-           segment size of the executable, or continue to use the default.  */
-        tb_size = (unsigned long)(ram_size / 4);
-#endif
     }
     if (tb_size < MIN_CODE_GEN_BUFFER_SIZE) {
         tb_size = MIN_CODE_GEN_BUFFER_SIZE;
-- 
2.20.1
