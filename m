Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n15-20020a05640206cf00b0041655b577f1sm9718271edy.25.2022.03.15.05.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 05:12:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3E0B81FFBB;
	Tue, 15 Mar 2022 12:12:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	sw@weilnetz.de,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH  v1 3/8] target/i386: force maximum rounding precision for fildl[l]
Date: Tue, 15 Mar 2022 12:12:46 +0000
Message-Id: <20220315121251.2280317-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315121251.2280317-1-alex.bennee@linaro.org>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rs8ouY8W51zf

The instruction description says "It is loaded without rounding
errors." which implies we should have the widest rounding mode
possible.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/888
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/fpu_helper.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index cdd8e9f947..ebf5e73df9 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -237,24 +237,37 @@ void helper_fldl_ST0(CPUX86State *env, uint64_t val)
     merge_exception_flags(env, old_flags);
 }
 
+static FloatX80RoundPrec tmp_maximise_precision(float_status *st)
+{
+    FloatX80RoundPrec old = get_floatx80_rounding_precision(st);
+    set_floatx80_rounding_precision(floatx80_precision_x, st);
+    return old;
+}
+
 void helper_fildl_ST0(CPUX86State *env, int32_t val)
 {
     int new_fpstt;
+    FloatX80RoundPrec old = tmp_maximise_precision(&env->fp_status);
 
     new_fpstt = (env->fpstt - 1) & 7;
     env->fpregs[new_fpstt].d = int32_to_floatx80(val, &env->fp_status);
     env->fpstt = new_fpstt;
     env->fptags[new_fpstt] = 0; /* validate stack entry */
+
+    set_floatx80_rounding_precision(old, &env->fp_status);
 }
 
 void helper_fildll_ST0(CPUX86State *env, int64_t val)
 {
     int new_fpstt;
+    FloatX80RoundPrec old = tmp_maximise_precision(&env->fp_status);
 
     new_fpstt = (env->fpstt - 1) & 7;
     env->fpregs[new_fpstt].d = int64_to_floatx80(val, &env->fp_status);
     env->fpstt = new_fpstt;
     env->fptags[new_fpstt] = 0; /* validate stack entry */
+
+    set_floatx80_rounding_precision(old, &env->fp_status);
 }
 
 uint32_t helper_fsts_ST0(CPUX86State *env)
-- 
2.30.2
