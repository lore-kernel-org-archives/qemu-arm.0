Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp475728njc;
        Tue, 20 May 2025 05:53:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:1349:b0:215:f505:b49f with SMTP id adf61e73a8af0-2162189f0e9mr25845406637.14.1747745627153;
        Tue, 20 May 2025 05:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745627; cv=none;
        d=google.com; s=arc-20240605;
        b=E9Jg3nAPEUQA2O0xwSamyaq2MbN9CG02wvtuhLG+jGe5SLHe7JvA1fI8qdrxUqU/q9
         DLdp1z0F0qzs3DhNO97uNKWzoP2QDRd6L0h2AMWtYG7Okeys6O4ssZS4aqT4uimqZ7LT
         Pg4UnqGimsewZWljAz4UXp1hKnjEjNs8oq8gSpgbkPNFuCLqx1SLw+HnhMr4aJFjzF+P
         /OaLf74792gQi8fpdRwROeERe1HN/2xQVreZpDCF7xEgFoyizB/W2I3gTlP7dWUHPxIs
         vnSZ5RnyR5RrtiHF8CkDWpjO7OyZhpidJW8MHnyi+kABxf3+GHFp/7MwpMlFBz2aRZDU
         T7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qVm/z5b/WNdO6MaO5hkoo2oUhPq3LCHlkm5p2hpglKI=;
        fh=VqI+BU/ZieSYOB0JPQWnzc/Wp2haXpxjA790kmcPWbU=;
        b=CRA457ic5mHx/ASGpqG7AritN3uP+epYPA2J5gZT4RN26GAIXRrya18/U5FhkjX0z8
         Cd/Ky6g8Y/9iCFCFX/P+U7Jt/EGN2lrOq4ADYpoiZsxiKqU9ImaT8gsrfQpdMf8bV20o
         8CR+rmoHyOif+0rOQ/+w/aZ/5F58adkmX2mDL2XTW0mEod7/lfXgabD/XZFg6mdEB7jb
         j1McicHgLfR8ljGb2hIN8pnPfk9kCPYdPdZkRggDCNvmT2s0oaPM2OywH2hJkDp1YSHd
         gSl3MwovlSPumKnEg7Y2w+nJmEoWTicrKvmU0Jcmo5kDr1vc7LVJ7T7YCpOgh4MI4gUG
         Y8KA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=mqYBtv0T;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b26eb0c36c7sor5655718a12.7.2025.05.20.05.53.46
        (Google Transport Security);
        Tue, 20 May 2025 05:53:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=mqYBtv0T;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745626; x=1748350426; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVm/z5b/WNdO6MaO5hkoo2oUhPq3LCHlkm5p2hpglKI=;
        b=mqYBtv0TbEBXb+s9Janc5LhyvsiJynOfbAL3iBhmpPbf6bwr2u6qLXweERB2XzZ3FQ
         nZuQlIH7mrGMEhXedGNrzFhhggFxhWMDINs1DMdnPgKAalg1Ke77BKcANtF6vq0p1lr6
         jms/eCSBlkeaHJZyaVwYJfYUtvuUVdrBNOadt5uWEf+joX1CambBlBSQs88f/5MVH6Py
         9tb0YpnSCDOZc1QFbZ8qjKwlQmNS5/xjL9mGn1r/Y3J+Mj19OmG4OtT/Bu8/r0QcdcZ4
         BxiwWVbS6oqJLikzOq5YXxcn9Oje6CjOU6FP/FVtiRHE71oKL+ZuNkxCKyW0QKTp2npo
         sbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745626; x=1748350426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVm/z5b/WNdO6MaO5hkoo2oUhPq3LCHlkm5p2hpglKI=;
        b=W1fG/RMcjrOTdnx2xL3YNBljq6UI3PAwwAyogdcKJJljTKNpNeL+6zs7FUdYVAOXpV
         0JoiUCSDW4hkfO0L1aXOTTYPE95yqB0pdtXwjo/PuqB3rMmIObzUy/f1/zdCW7hvTzBB
         0CSiJyz5JvG0QVMk2x0RBOUQaqMPqm+/xqaPrGHtFGCXuIKz4S0/GIgDxFno0ZFk0OF2
         IYut9EVLN19Sma6GeACjyR8qp7Pi+yebwNTDEWdU2V5B68BfMz49KntObJqVBhXGc2vp
         RlxK/LljSNCR+ALUTpRo+CCOvAQlXfBF9gXy4v5lnIUhX/9ktuHn2BuGfNB1AOZgwhXq
         2IsA==
X-Forwarded-Encrypted: i=1; AJvYcCU//Bf3BJ0MVMSOsKl/2GOhYp9mSOdTCcsqJfnN5+eab8HMXkFm5KvAjbj7St9CtQAl9fBsCOWKnyXIDeHo1c3yWOY=@linaro.org, AJvYcCVwrm3n0ET757qinUOAB6fRFbEctMECA8gv+OvKOax6d1lYmjOsk7U7qKFq3YY5oZzPSjEyhG8=@linaro.org, AJvYcCX7MUm0uHWlXnl66bmvXXhYOhP/H0px+V8sLPI5YJITjlZp1xhn8lczE9f+uZVw6xxptu6krB+/Lb49zzlrDoxwkw==@linaro.org
X-Gm-Message-State: AOJu0YxpxpanADqrE2m4zAkhFrw5t3BNfgyBbdnVPGNkX6jvg+F4KIdC
	K4ukuQGtJ08NNwvBFPQ1lj1ybbMpK0p5k6zsi+emh/r2RAyk8OIFXhrulrUVPocs
X-Gm-Gg: ASbGncv9z7dPWT/5LhjKMG5+gHnBRNgbM0SvEef6A0CGFF1auLVT/qB7eHKPT8M/c7/
	4Z/6tz64Yzsvb6n94GPCn4BbhtSe2aCFKnEB1/XUv1ZBacP8cYKM+c9xUdcDakbS3j/Di2yWS7t
	JG5edrT7z2Ev0zXqiZEUaBYEn3cf3+fAVUeZXd0onnVcwZQFpAIPBjWjpDugxSi5PJjKBwKbd/z
	lbAhGFPLq7ZU1gaMjiqOg7Em9X5FLiqDDLJRLzJgO/XdrvZkzxLwhyV7Xry5hmVgRvRaVtJRczg
	WB9gtp+gaOt8hMZZJCSWaCln//I+bJ5dDj04lGRaavc5Y8axthc=
X-Google-Smtp-Source: AGHT+IEMrdC1V+LESFaMuMDw5tT3hhKjWCJ/qaG6s6FWhGMJ038w54wCgcmH9JUMZKT3Ksn+vd9Iow==
X-Received: by 2002:a17:90b:28c5:b0:2fc:a3b7:108e with SMTP id 98e67ed59e1d1-30e7d4fea80mr26291198a91.4.1747745626401;
        Tue, 20 May 2025 05:53:46 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:53:45 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	WANG Xuerui <git@xen0n.name>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 16/33] tcg/wasm32: Add neg/not/ctpop instructions
Date: Tue, 20 May 2025 21:51:18 +0900
Message-ID: <d8ade887307f6bea4bf392a36c02657204db939f.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Jfsr9xkbFpOd

This commit implements neg, not and ctpop operations using Wasm
instructions.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32/tcg-target.c.inc | 39 +++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index 50d772f3d6..e5de2f69bd 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -200,6 +200,10 @@ static void tcg_wasm_out_op_i64_xor(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x85);
 }
+static void tcg_wasm_out_op_i64_popcnt(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x7b);
+}
 static void tcg_wasm_out_op_i64_add(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x7c);
@@ -570,6 +574,29 @@ static void tcg_wasm_out_nor(
     tcg_wasm_out_op_global_set_r(s, ret);
 }
 
+static void tcg_wasm_out_neg(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_wasm_out_op_global_get_r(s, arg);
+    tcg_wasm_out_op_not(s);
+    tcg_wasm_out_op_i64_const(s, 1);
+    tcg_wasm_out_op_i64_add(s);
+    tcg_wasm_out_op_global_set_r(s, ret);
+}
+
+static void tcg_wasm_out_not(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_wasm_out_op_global_get_r(s, arg);
+    tcg_wasm_out_op_not(s);
+    tcg_wasm_out_op_global_set_r(s, ret);
+}
+
+static void tcg_wasm_out_ctpop(TCGContext *s, TCGReg dest, TCGReg src)
+{
+    tcg_wasm_out_op_global_get_r(s, src);
+    tcg_wasm_out_op_i64_popcnt(s);
+    tcg_wasm_out_op_global_set_r(s, dest);
+}
+
 static void tcg_wasm_out_shl(TCGContext *s, TCGReg ret,
                              TCGReg arg1, TCGReg arg2)
 {
@@ -2056,6 +2083,7 @@ static const TCGOutOpBinary outop_xor = {
 static void tgen_ctpop(TCGContext *s, TCGType type, TCGReg a0, TCGReg a1)
 {
     tcg_out_op_rr(s, INDEX_op_ctpop, a0, a1);
+    tcg_wasm_out_ctpop(s, a0, a1);
 }
 
 static TCGConstraintSetIndex cset_ctpop(TCGType type, unsigned flags)
@@ -2112,9 +2140,15 @@ static const TCGOutOpUnary outop_bswap64 = {
 };
 #endif
 
-static void tgen_neg(TCGContext *s, TCGType type, TCGReg a0, TCGReg a1)
+static void tgen_neg_tci(TCGContext *s, TCGType type, TCGReg a0, TCGReg a1)
 {
     tcg_out_op_rr(s, INDEX_op_neg, a0, a1);
+ }
+
+static void tgen_neg(TCGContext *s, TCGType type, TCGReg a0, TCGReg a1)
+{
+    tgen_neg_tci(s, type, a0, a1);
+    tcg_wasm_out_neg(s, a0, a1);
 }
 
 static const TCGOutOpUnary outop_neg = {
@@ -2125,6 +2159,7 @@ static const TCGOutOpUnary outop_neg = {
 static void tgen_not(TCGContext *s, TCGType type, TCGReg a0, TCGReg a1)
 {
     tcg_out_op_rr(s, INDEX_op_not, a0, a1);
+    tcg_wasm_out_not(s, a0, a1);
 }
 
 static const TCGOutOpUnary outop_not = {
@@ -2157,7 +2192,7 @@ static void tgen_negsetcond(TCGContext *s, TCGType type, TCGCond cond,
                             TCGReg dest, TCGReg arg1, TCGReg arg2)
 {
     tgen_setcond_tci(s, type, cond, dest, arg1, arg2);
-    tgen_neg(s, type, dest, dest);
+    tgen_neg_tci(s, type, dest, dest);
     tcg_wasm_out_negsetcond(s, type, dest, arg1, arg2, cond);
 }
 
-- 
2.43.0
