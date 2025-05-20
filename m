Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp475472njc;
        Tue, 20 May 2025 05:53:18 -0700 (PDT)
X-Received: by 2002:a17:90b:2b45:b0:2ff:52e1:c49f with SMTP id 98e67ed59e1d1-30e8322595fmr22360507a91.26.1747745598716;
        Tue, 20 May 2025 05:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745598; cv=none;
        d=google.com; s=arc-20240605;
        b=QgeOqbx9s6WweXBMsQApnHLr4vpbS1lMhw6S3dK0ujwXcUg5yrP8j1od0yah3EaniP
         Q3WSkfI9JCmSMv5X9Fa0QiFVgpdORsCveAm4UnB80rGglXIWgyM88kpSydtkiQsrzqzp
         /rUIZnqz/gpc4S4SeA36n6chLs25VhJUxj63k9XnGcv/qT8AhbrMI3taObEhlISwv2yy
         eVXOro87kcdskTCHiJrWnz0Q6MOWV7lKNj+4/DxuopG7AlCg/JPsKr0sFeXY2JLpmSfZ
         nTjyQuAVPLji1wk8eyI9BAHHrgbQTUQFERa1ZDwa2qLrWKs1Sb9IEJoBITv9jN4Qk4qr
         N+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NlI3ADKsZrHAbqgaoSffPjMOx8QCa6ijCQD0G6eY21w=;
        fh=JH81sfcXeVGFo89VtY1erxnTj5IwlSv1uxRmQDX2LcU=;
        b=FAjRN6XfN8KB5CoRcO+N+vc3Nmd14pjWirh8Eg9Y0UbeGAxUl9E3+K7HmjOp7TXxmU
         46n72+tFK9tBpBpLkyA48wjM1WaBhx6ICNj+x495nG25UAd6atg/KQDXX0OdoWZRh1A4
         DYE0raJV1BPBFIJPo2h6wCg91P6ep6f8cqA6B9WNd/ap9S706CufjwAqXqdDDyW0/rR3
         hMoVtk9Iasd3OHfZxSzLSYznWtGfvOtjWxkDbNwnCP5S/BzSd1OIqj1HAbz16JYChQcE
         eG0ujzwqCHhagJdpmtUb/NywNjXPwDe1im0FTGGCpQjkdQE4dDXCdmuFD2sP+hGHMal9
         zZXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FoztqwR8;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e7d55c5a5sor9218494a91.3.2025.05.20.05.53.18
        (Google Transport Security);
        Tue, 20 May 2025 05:53:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FoztqwR8;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745598; x=1748350398; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlI3ADKsZrHAbqgaoSffPjMOx8QCa6ijCQD0G6eY21w=;
        b=FoztqwR8kYcMo9/B9ArRh/7lx6jZ5ZAjuPcCGW844vM5BunUz+18wz+9ikngW2TAiL
         XkcN5rnHCAb2C7JHHeT2cnMRPc/cv/mSIYeSUGCMakc6JPIxbkd5IA6kHg32vncS1rsM
         jRlquroNWkW8tE8LF1xM2wlFCG1+qca186BhnWOmopylcFf+mu5p66AreSl1uzPC3QYm
         Y/3jd9OjFsC9LnpdUjkA7K7xKMMP8m+pE1x/HpetUgU+OCkNnn11jILoUdx3gd4hvgij
         V+XgeBF0mjMINR0PtyKNoDGZ0cv95GVKHrHJ4/QXW1qOdxkMe8wxDw2/BnaB/9fD7mWL
         4pbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745598; x=1748350398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NlI3ADKsZrHAbqgaoSffPjMOx8QCa6ijCQD0G6eY21w=;
        b=ZyoX16WLaj792fhX3pJs+pfDP1G9hZRINosZ/ZOWHEb44wB4wr+OFA3ZPaltx3eJYR
         vqhEcZkZIJoBE4KmxmdBNZ3phgihUz/7dqgvK47D2dlONYffhCONu75ZU8RJQ5lsIRDP
         B1dXXI69kh1wPL7d1H+Xpqu1gXjumUJ2vyYtSX3GFFaGwp7XDhH5vQi2AMw0fXSC/e4s
         3QC3uzfvcb5O+8hXt6SQdQagq4d4ZxJ7vnXoFWaiKyCQG76nf9+VWlzeJudTq9MQmYT/
         FkRi1wakzRazWmi++YJCAUTzBREA7cHh9jvlgeasYnNqagjI0i+VquH5lYIAbr3pbrnd
         vVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR395Ly0H9TUxOnPSs+kxKyMeWciwnerolWID1P0/C0MP25y3p+WT3jGGwOyQFni9viIFKRo7L4CJJemNlKpxw3w==@linaro.org, AJvYcCWhanzqTvi6QKvL31k54qmXlGI4FzowHVViziE0U56EUJqOeG3TBoqcwprrnwZIQlBC5s8VL7RUfhkkLeNAR7ohM5I=@linaro.org, AJvYcCXh+hXR+gLz0QjTHYNjVidgP32+FsHrD7zhiAG1oclL97haIm7yJdC0ZYN1NI6qOxUPNLMxOGM=@linaro.org
X-Gm-Message-State: AOJu0YyilDZMqVUuCB3a481g2Erdr4HlF2X7dAqzERbUp4MWFjc86v7g
	LiVyyPSe444Dl57R2PZ4lBWeeKaMg0yy2ymjLwohBkwI4Gk+OEsIaC/a
X-Gm-Gg: ASbGncs49ISsvS0idhdr8+nSjdOG6jZKk5xo+kAFLmMg42mgRWiJB6oP30yET8IQCpq
	2892+Jek9pkeXxTnJd4HNHgR87kr3etb2arRGh+wyDO+V452ddA3fyenycJKaXP0fqW2q7A+vEv
	pGQqSWpQydpxguvuAKWtU/HtaQILqNWUMSO1D/LS7QQuvbhrk4ij7J4YyzXkBrh4GbkSaQ80KsG
	HMfJWyUJlnXp8LunJxDsQjNQdctaV2UjI0wVubMTWV1iQdmF7B84OkFMkBJznE/twWt2XpT7J3U
	tqCIZ21VZ2myklT5IwO9lvoN8UyP1Ew2g+14akb0SZfaybirKhApJh7Ao2eerQ==
X-Google-Smtp-Source: AGHT+IHCRPMEIPAOztUBdUPNL63cIBCPrltzc/+WoGIQ2txQn80tKWzqSX2p8oCJQMC86V6TS7yRxg==
X-Received: by 2002:a17:90b:5603:b0:2ee:9b2c:3253 with SMTP id 98e67ed59e1d1-30e8323cd14mr22649462a91.30.1747745597888;
        Tue, 20 May 2025 05:53:17 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:53:17 -0700 (PDT)
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
Subject: [PATCH 11/33] tcg/wasm32: Add mov/movi instructions
Date: Tue, 20 May 2025 21:51:13 +0900
Message-ID: <6e482a0b2d32d06f7877f1f310a0e7a81e85f88f.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 6w7mFfplk/LH

This commit implements mov/movi instructions. The tcg_out_mov[i] functions
are used by several other functions and are intended to emit TCI code. So
they have been renamed to tcg_tci_out_mov[i].

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32/tcg-target.c.inc | 85 ++++++++++++++++++++++++++-----------
 1 file changed, 60 insertions(+), 25 deletions(-)

diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index 9b024b03b9..90a5705442 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -779,6 +779,28 @@ static void tcg_wasm_out_st16(TCGContext *s, TCGReg val,
     tcg_wasm_out_op_i64_store16(s, 0, offset);
 }
 
+static void tcg_wasm_out_mov(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_wasm_out_op_global_get_r(s, arg);
+    tcg_wasm_out_op_global_set_r(s, ret);
+}
+
+static void tcg_wasm_out_movi(TCGContext *s, TCGType type,
+                              TCGReg ret, tcg_target_long arg)
+{
+   switch (type) {
+   case TCG_TYPE_I32:
+       tcg_wasm_out_op_i64_const(s, (int32_t)arg);
+       break;
+   case TCG_TYPE_I64:
+       tcg_wasm_out_op_i64_const(s, arg);
+       break;
+   default:
+       g_assert_not_reached();
+   }
+   tcg_wasm_out_op_global_set_r(s, ret);
+}
+
 static bool patch_reloc(tcg_insn_unit *code_ptr_i, int type,
                         intptr_t value, intptr_t addend)
 {
@@ -990,6 +1012,33 @@ static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
     tcg_out32(s, insn);
 }
 
+static void tcg_tci_out_movi(TCGContext *s, TCGType type,
+                         TCGReg ret, tcg_target_long arg)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+#if TCG_TARGET_REG_BITS == 64
+        arg = (int32_t)arg;
+        /* fall through */
+    case TCG_TYPE_I64:
+#endif
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (arg == sextract32(arg, 0, 20)) {
+        tcg_out_op_ri(s, INDEX_op_tci_movi, ret, arg);
+    } else {
+        tcg_insn_unit_tci insn = 0;
+
+        new_pool_label(s, arg, 20, s->code_ptr, 0);
+        insn = deposit32(insn, 0, 8, INDEX_op_tci_movl);
+        insn = deposit32(insn, 8, 4, ret);
+        tcg_out32(s, insn);
+    }
+}
+
 static void tcg_tci_out_extract(TCGContext *s, TCGType type, TCGReg rd,
                                 TCGReg rs, unsigned pos, unsigned len)
 {
@@ -1001,7 +1050,7 @@ static void tcg_out_ldst(TCGContext *s, TCGOpcode op, TCGReg val,
 {
     stack_bounds_check(base, offset);
     if (offset != sextract32(offset, 0, 16)) {
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP, offset);
+        tcg_tci_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP, offset);
         tcg_out_op_rrr(s, INDEX_op_add, TCG_REG_TMP, TCG_REG_TMP, base);
         base = TCG_REG_TMP;
         offset = 0;
@@ -1021,37 +1070,23 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
     tcg_wasm_out_ld(s, type, val, base, offset);
 }
 
-static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
+static void tcg_tci_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
     tcg_out_op_rr(s, INDEX_op_mov, ret, arg);
+}
+
+static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
+{
+    tcg_tci_out_mov(s, type, ret, arg);
+    tcg_wasm_out_mov(s, ret, arg);
     return true;
 }
 
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg)
 {
-    switch (type) {
-    case TCG_TYPE_I32:
-#if TCG_TARGET_REG_BITS == 64
-        arg = (int32_t)arg;
-        /* fall through */
-    case TCG_TYPE_I64:
-#endif
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    if (arg == sextract32(arg, 0, 20)) {
-        tcg_out_op_ri(s, INDEX_op_tci_movi, ret, arg);
-    } else {
-        tcg_insn_unit insn = 0;
-
-        new_pool_label(s, arg, 20, s->code_ptr, 0);
-        insn = deposit32(insn, 0, 8, INDEX_op_tci_movl);
-        insn = deposit32(insn, 8, 4, ret);
-        tcg_out32(s, insn);
-    }
+    tcg_tci_out_movi(s, type, ret, arg);
+    tcg_wasm_out_movi(s, type, ret, arg);
 }
 
 static void tcg_out_extract(TCGContext *s, TCGType type, TCGReg rd,
@@ -1133,7 +1168,7 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
 static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rs)
 {
     tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
-    tcg_out_mov(s, TCG_TYPE_I32, rd, rs);
+    tcg_tci_out_mov(s, TCG_TYPE_I32, rd, rs);
 }
 
 static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
-- 
2.43.0
