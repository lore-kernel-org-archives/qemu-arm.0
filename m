Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp475588njc;
        Tue, 20 May 2025 05:53:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:ae1c:b0:742:b3a6:db10 with SMTP id d2e1a72fcca58-742b3a6dc2bmr17307864b3a.18.1747745610127;
        Tue, 20 May 2025 05:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745610; cv=none;
        d=google.com; s=arc-20240605;
        b=AE7cNu5d1/+GIpWKaz7jbtpp1fOZM8b5Uf1/cMEAwTlW9dp0li0wOmz28bZjqzqd+B
         MKgsHDXnrTFVycYsgK1DQKmzTpOGnkU368lJPNp1FeDYB7PQ5E8m1jaybmWU8jS5rMvb
         sqLeLgl6LpkzEvh5kY/A+5RGeZ0peQhLzGrXHo79lEcScqE6PP/yHLSpU5iT0y/th1/o
         bMjR/wzR03HLXfFcmHwtma+/ZcZXiqLVZdUdns0HIyqUNvs4Or+/wtZ0Ii+VDLS3g5bf
         k43osedlr5C+JEDVhEk+AO3p1zjoqFXPw5RN1tGRBs2PoSdI66KLnUUM7uQluHV90DkW
         hdhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rhT21ZbeuAH6PwlwaEXlZP3fAXk3Eqmf4zwdAMPd7KE=;
        fh=Fe6Y+Rg+aqsKr81cucX+XuvnR6DSpYVk2N090RWDpHw=;
        b=YX3Q5SfSa8IaXHvcR/qFjfKKPB9Z5FslTiibyrbyiWj6dhdrQdJ+N5BBI8oWywdsdq
         1ZT9IkoIGSbQWiVQQ0Q4U+3p5HpmRpJqetJWACUSXHat+za9I+hNC+1aVVhNA5C8F+Na
         juJx51N7N5qA1+15MU7+F4Z9MBezeFaDItQTZHp02lVWCyeYSVcQrx9ueSkw7+ZA2vK7
         9ctW+/EV4hbCqCV8+XmahQYUpwAsRxwi+QPhhEsIFuJS7qbwgPUwA0Auee+oOHQDeN0c
         nbyqeNandFzlWiD85gVXCKpCc0+opRDLa2sbfs/W2tRoORf7nnSjWPWXY1ZZ6RNL6jbt
         1W2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=B97TZmck;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-742a9879629sor6007958b3a.8.2025.05.20.05.53.29
        (Google Transport Security);
        Tue, 20 May 2025 05:53:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=B97TZmck;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745609; x=1748350409; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhT21ZbeuAH6PwlwaEXlZP3fAXk3Eqmf4zwdAMPd7KE=;
        b=B97TZmck3j7LqKrFr+L5/6hgC+quXB4Es63z+01FTfxJnieRmcvmkQuIyEt4wtJoh7
         ZjBbZ1o2kN8f3Ky2kg9wW4OA7IKNRFXzarvH1HjbhRY36KRn+WCojb+IbvVsjqdN4e3Z
         sZAEC3JpSCbUFg2xBIyuLoMxJF4APCV8Txtk0w7/FhzJytAl9XnUGknEwVwdfmxn17XP
         gbWjpQWZFnIMCkYMgp9cUKMQoy4gCtoGUtlfeqwLhyhwdNBjThlmw4D/Rv7ubn0c2FMv
         zd+mBGkhrlEIpfFxPvScDmwNI+djFVwQRTwUW4mwDPg+Ohncr4QQIoD7WSM7cZeQ9173
         Cl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745609; x=1748350409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhT21ZbeuAH6PwlwaEXlZP3fAXk3Eqmf4zwdAMPd7KE=;
        b=uzn6dn+jluZcy4nap70rxFgLkBjuNJszr+cnZyfdnBoDemK3/tpBsPTjDw0gIubW3B
         ME/P6/uCHjjBw8PCmxHHvU6c+5oP5UyO+kQaR0AI8E+hctlDCHC0gcCYaQh/NtYjPQhw
         gg5jfLEUX/CzgTZLCr9F4uk+vEMVbkEkHSd18w6blOIzF1cewPnDtHXErbL6sQuLvAX0
         d7M1lgn7gynuZmAZsgPmcdglGBsWDiQVIUL0Zj8dxeOgspfEED4udBGmimdM/cLh4/OP
         Bx31dwuWrEjUkJARWYOLe0aZ/dUlQD5jRlWzbH6HTuZWooLx4bS1Z1vMD9GBvlfM6Fdy
         jSUg==
X-Forwarded-Encrypted: i=1; AJvYcCWfZiBWlywQZQ6IjpVaMcAGNJXLuqO7TIQgOG0AmW5CBjy6Sn6AOm8p5aY1FAhAzyQgIAd2xzI=@linaro.org, AJvYcCXIeiZL28qFnO1hVDpj1AnnOX/8mRbpIXvoX1OlcbGssulZikIaJuW7rmyZ9uClFdBH1v5rTSvfa1ci7Z74ZADhbrM=@linaro.org, AJvYcCXvAJAEZcb05BUh8JQ3skrsKMkmYjDscDlO/5QRgHRHfeDxuLb2XCZeEN/QRPwZx1O8+mmoy9ETT6VBKW7ezAVfWQ==@linaro.org
X-Gm-Message-State: AOJu0YxYoinKn7cLCoWWQeX7cT2GrBIUlGx34B3gPLuK8YwPTbCEMSNz
	XVeXdVeKFWuiflYIlsEr17WVFFl6NzZXvJmdGK49R7+yLzSRw/VTtIxs
X-Gm-Gg: ASbGnctci/50CeDDkhDfQcMMCEmTDdllMB2gZ07A1vHXteOWLOjq/8t5TtLDUmF1/g/
	I9tcNd8+VF3gTAtR8FYQacBC5UmsilKXP3MnsW7ZK/3ZHHZumZgrNvPZ/GqVqALtp0YbYJ3Yzdp
	3q0GSq//eumNFfu1629npC9QYnLsHvwuZ6j3Nc/GmC890vhZc28r3bBcrUV1u55Ml0KpSPYTs1L
	vGx4oO7mV7rz7vhHaCdLkNFQT31wJMPxbLkkEx/MAyfDw/qfxVUL8FtYn3wDLQw5p0mt0QGrQy+
	XfJPoeDTu6SBrUo3v9BG9ZzPUyZ90OPDLfFniCONP/TKujnECnA=
X-Google-Smtp-Source: AGHT+IELYgC8rXzpzxpWLznRI/A+e/6gacRu3KFNEtrvOk6g5j42KY2JurSbdVRhmlxiD4imG3/sXg==
X-Received: by 2002:a17:90b:35cc:b0:30e:54be:37e7 with SMTP id 98e67ed59e1d1-30e7d5b7521mr27787860a91.24.1747745609377;
        Tue, 20 May 2025 05:53:29 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:53:28 -0700 (PDT)
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
Subject: [PATCH 13/33] tcg/wasm32: Add bswap instructions
Date: Tue, 20 May 2025 21:51:15 +0900
Message-ID: <b7368a9d3908e494261b838113e5ea479e24e73c.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FuzsGoaORQxr

This commit implements the bswap operation using Wasm instructions.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32/tcg-target.c.inc | 136 ++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index dff79a9854..1a6069e288 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -118,6 +118,11 @@ static const uint8_t tcg_target_reg_index[TCG_TARGET_NB_REGS] = {
     15, /* TCG_REG_R15 */
 };
 
+/* Temporary local variables */
+#define TMP32_LOCAL_0_IDX 1
+#define TMP32_LOCAL_1_IDX 2
+#define TMP64_LOCAL_0_IDX 3
+
 #define BUF_SIZE 1024
 typedef struct LinkedBuf {
     struct LinkedBuf *next;
@@ -219,6 +224,10 @@ static void tcg_wasm_out_op_i64_shr_u(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x88);
 }
+static void tcg_wasm_out_op_i64_rotr(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x8a);
+}
 static void tcg_wasm_out_op_i32_wrap_i64(TCGContext *s)
 {
     tcg_wasm_out8(s, 0xa7);
@@ -255,6 +264,18 @@ static void tcg_wasm_out_op_i32_shl(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x74);
 }
+static void tcg_wasm_out_op_i32_shr_s(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x75);
+}
+static void tcg_wasm_out_op_i32_shr_u(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x76);
+}
+static void tcg_wasm_out_op_i32_rotr(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x78);
+}
 
 static void tcg_wasm_out_op_if_ret_i64(TCGContext *s)
 {
@@ -295,6 +316,14 @@ static void tcg_wasm_out_op_global_get_r_i32(TCGContext *s, TCGReg r0)
     tcg_wasm_out_op_global_get(s, tcg_target_reg_index[r0]);
     tcg_wasm_out_op_i32_wrap_i64(s);
 }
+static void tcg_wasm_out_op_local_get(TCGContext *s, uint8_t i)
+{
+    tcg_wasm_out_op_var(s, 0x20, i);
+}
+static void tcg_wasm_out_op_local_set(TCGContext *s, uint8_t i)
+{
+    tcg_wasm_out_op_var(s, 0x21, i);
+}
 
 #define tcg_wasm_out_i64_calc(op)                                       \
     static void tcg_wasm_out_i64_calc_##op(                             \
@@ -692,6 +721,110 @@ static void tcg_wasm_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_wasm_out_op_global_set_r(s, rd);
 }
 
+static void tcg_wasm_out_bswap64(
+    TCGContext *s, TCGReg dest, TCGReg src)
+{
+    tcg_wasm_out_op_global_get_r(s, src);
+    tcg_wasm_out_op_i64_const(s, 32);
+    tcg_wasm_out_op_i64_rotr(s);
+    tcg_wasm_out_op_local_set(s, TMP64_LOCAL_0_IDX);
+
+    tcg_wasm_out_op_local_get(s, TMP64_LOCAL_0_IDX);
+    tcg_wasm_out_op_i64_const(s, 0xff000000ff000000);
+    tcg_wasm_out_op_i64_and(s);
+    tcg_wasm_out_op_i64_const(s, 24);
+    tcg_wasm_out_op_i64_shr_u(s);
+
+    tcg_wasm_out_op_local_get(s, TMP64_LOCAL_0_IDX);
+    tcg_wasm_out_op_i64_const(s, 0x00ff000000ff0000);
+    tcg_wasm_out_op_i64_and(s);
+    tcg_wasm_out_op_i64_const(s, 8);
+    tcg_wasm_out_op_i64_shr_u(s);
+
+    tcg_wasm_out_op_i64_or(s);
+
+    tcg_wasm_out_op_local_get(s, TMP64_LOCAL_0_IDX);
+    tcg_wasm_out_op_i64_const(s, 0x0000ff000000ff00);
+    tcg_wasm_out_op_i64_and(s);
+    tcg_wasm_out_op_i64_const(s, 8);
+    tcg_wasm_out_op_i64_shl(s);
+
+    tcg_wasm_out_op_local_get(s, TMP64_LOCAL_0_IDX);
+    tcg_wasm_out_op_i64_const(s, 0x000000ff000000ff);
+    tcg_wasm_out_op_i64_and(s);
+    tcg_wasm_out_op_i64_const(s, 24);
+    tcg_wasm_out_op_i64_shl(s);
+
+    tcg_wasm_out_op_i64_or(s);
+
+    tcg_wasm_out_op_i64_or(s);
+    tcg_wasm_out_op_global_set_r(s, dest);
+}
+
+static void tcg_wasm_out_bswap32(
+    TCGContext *s, TCGReg dest, TCGReg src, int flags)
+{
+    tcg_wasm_out_op_global_get_r(s, src);
+    tcg_wasm_out_op_i32_wrap_i64(s);
+    tcg_wasm_out_op_local_set(s, TMP32_LOCAL_0_IDX);
+
+    tcg_wasm_out_op_local_get(s, TMP32_LOCAL_0_IDX);
+    tcg_wasm_out_op_i32_const(s, 16);
+    tcg_wasm_out_op_i32_rotr(s);
+    tcg_wasm_out_op_local_set(s, TMP32_LOCAL_0_IDX);
+
+    tcg_wasm_out_op_local_get(s, TMP32_LOCAL_0_IDX);
+    tcg_wasm_out_op_i32_const(s, 0xff00ff00);
+    tcg_wasm_out_op_i32_and(s);
+    tcg_wasm_out_op_i32_const(s, 8);
+    tcg_wasm_out_op_i32_shr_u(s);
+
+    tcg_wasm_out_op_local_get(s, TMP32_LOCAL_0_IDX);
+    tcg_wasm_out_op_i32_const(s, 0x00ff00ff);
+    tcg_wasm_out_op_i32_and(s);
+    tcg_wasm_out_op_i32_const(s, 8);
+    tcg_wasm_out_op_i32_shl(s);
+
+    tcg_wasm_out_op_i32_or(s);
+    if (flags & TCG_BSWAP_OS) {
+        tcg_wasm_out_op_i64_extend_i32_s(s);
+    } else {
+        tcg_wasm_out_op_i64_extend_i32_u(s);
+    }
+    tcg_wasm_out_op_global_set_r(s, dest);
+}
+
+static void tcg_wasm_out_bswap16(
+    TCGContext *s, TCGReg dest, TCGReg src, int flags)
+{
+    tcg_wasm_out_op_global_get_r(s, src);
+    tcg_wasm_out_op_i32_wrap_i64(s);
+    tcg_wasm_out_op_local_set(s, TMP32_LOCAL_0_IDX);
+
+    tcg_wasm_out_op_local_get(s, TMP32_LOCAL_0_IDX);
+    tcg_wasm_out_op_i32_const(s, 8);
+    tcg_wasm_out_op_i32_rotr(s);
+    tcg_wasm_out_op_local_set(s, TMP32_LOCAL_0_IDX);
+
+    tcg_wasm_out_op_local_get(s, TMP32_LOCAL_0_IDX);
+    tcg_wasm_out_op_i32_const(s, 0x000000ff);
+    tcg_wasm_out_op_i32_and(s);
+
+    tcg_wasm_out_op_local_get(s, TMP32_LOCAL_0_IDX);
+    tcg_wasm_out_op_i32_const(s, 0xff000000);
+    tcg_wasm_out_op_i32_and(s);
+    tcg_wasm_out_op_i32_const(s, 16);
+    if (flags & TCG_BSWAP_OS) {
+        tcg_wasm_out_op_i32_shr_s(s);
+    } else {
+        tcg_wasm_out_op_i32_shr_u(s);
+    }
+
+    tcg_wasm_out_op_i32_or(s);
+    tcg_wasm_out_op_i64_extend_i32_u(s);
+    tcg_wasm_out_op_global_set_r(s, dest);
+}
+
 static void tcg_wasm_out_ld(
     TCGContext *s, TCGType type, TCGReg val, TCGReg base, intptr_t offset)
 {
@@ -1768,6 +1901,7 @@ static void tgen_bswap16(TCGContext *s, TCGType type,
     if (flags & TCG_BSWAP_OS) {
         tcg_tci_out_sextract(s, TCG_TYPE_REG, a0, a0, 0, 16);
     }
+    tcg_wasm_out_bswap16(s, a0, a1, flags);
 }
 
 static const TCGOutOpBswap outop_bswap16 = {
@@ -1782,6 +1916,7 @@ static void tgen_bswap32(TCGContext *s, TCGType type,
     if (flags & TCG_BSWAP_OS) {
         tcg_tci_out_sextract(s, TCG_TYPE_REG, a0, a0, 0, 32);
     }
+    tcg_wasm_out_bswap32(s, a0, a1, flags);
 }
 
 static const TCGOutOpBswap outop_bswap32 = {
@@ -1793,6 +1928,7 @@ static const TCGOutOpBswap outop_bswap32 = {
 static void tgen_bswap64(TCGContext *s, TCGType type, TCGReg a0, TCGReg a1)
 {
     tcg_out_op_rr(s, INDEX_op_bswap64, a0, a1);
+    tcg_wasm_out_bswap64(s, a0, a1);
 }
 
 static const TCGOutOpUnary outop_bswap64 = {
-- 
2.43.0
