Received: by 10.223.159.74 with SMTP id f10csp2941136wrg;
        Mon, 18 Dec 2017 09:53:44 -0800 (PST)
X-Google-Smtp-Source: ACJfBot9yM94qi838igcNu+riiFYBWES5fRenJ9/MldISvNdEvftSzBfD0JzuQcLMDC0lmRIpPUm
X-Received: by 10.37.97.12 with SMTP id v12mr467383ybb.463.1513619624760;
        Mon, 18 Dec 2017 09:53:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513619624; cv=none;
        d=google.com; s=arc-20160816;
        b=knNmEL2W54NwvYbfbldhwVJo9ESUTFbZL5gpLv0+CwH8eaOVGxxMFxkdgY5PnpeZwd
         2afzb+hURiEXw4wVrRmq96WXbSP5ZB9AsmabfUoid+rzQX8mwsRZCgW+EbLf4jRM1PSi
         YwBqnY7L7YQNfqvpC9TF17t2+O0dZZTIFjms7vyHGqdq69fUkFJaKHVNONaPUXi01dtX
         jctqXuPl2EU4UX4A7/jnFPAQkCcvdH2GMyCvXx+c6gdYWEeKz+geWjNk1OeSu6Jj2ZkR
         lXkj3Pbmv2oVNipWtRubHWRVafDFQ/DZakLPyD8+SB4vv1KUEqrJpV3td1kBSrMZITp1
         M/ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=GbLmNQ7xuX7XFvqzi98fqbMwaMefB+kCgTWymv093lc=;
        b=ueVuG4PsXlsc1kOedepWVDbhu06Rycj1LT3/8ybQC2fEeE7TIjK1cwYsRxduG+3zs5
         O+NfgNcVt0HVf74q1h408FqTHIvMhQTgsdkuZfBVFjeQPj4xy+GbRiJGys2P0O0IWiLe
         CAan7QSSyi6i59Ry44obHWfngFGKdsDaHAl5F2gn4dvKAzxK8Nc1/L+RULTOBhvuGwED
         XY0T6hnVi/WPqxLshFUK6LZQ7+jVOilM8tb4oVlSXSD5BZa7K4v/26YTpQag/LUEw12t
         c69kbeyQ307OsCZOd/y1dGy0Nr/l7ws/2+sczlggqIUTCj2Zs9cNUOp8W4fHQ5EVOGNg
         P+UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=buhBeDFJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9si2525042ywc.186.2017.12.18.09.53.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 09:53:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=buhBeDFJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59404 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzbk-0006h5-4F
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 12:53:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzFK-0002d3-M1
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:30:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzFF-0004dX-HG
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:30:34 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:34032)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzFF-0004cI-0n
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:30:29 -0500
Received: by mail-pg0-x244.google.com with SMTP id j4so9424518pgp.1
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GbLmNQ7xuX7XFvqzi98fqbMwaMefB+kCgTWymv093lc=;
	b=buhBeDFJeXf/rV8yQh0Ow5vuyPieh7NZpcMxnzyT22+tq506aqNrCBQh+DI26/aZm0
	wWXrtmz8chsXzfDrPh/g/EXaN9Qi6ap/z1C4oBBCtcy3YlB1R326vOR6/w0QbEdOopLG
	4Jmkk1tUpbpm95CcE5X6Mky6JaH9Ajg5GnFOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GbLmNQ7xuX7XFvqzi98fqbMwaMefB+kCgTWymv093lc=;
	b=tYM5Va86+UaNus2/IrDm42+buHcXajAix0PdNxFgsCy7nqJrvVC3vEWg84VYzo7LQo
	D9abWX4y78jCLQndVsy8qAqSxRTIP+NyZA5g8lZpg0VHcK8G/fujkt1XCgIrGlLLHeET
	UOcnB10EYRglHcD/YZUSPAtu/YK0WqJaeJcY8bvFZ79uAkaV52kX+XWlg89gDI/IWtjA
	vfPf8Jw/8Bq1E4tl8QplB48qPXm5RhoRxMprIKETqSqD2vIwlP/lkcoCHqQyUWyhdDVh
	sZQAdA1DXUmBT0PgecHTxyvMKDiJHP29IonZxw2CMQX5jmpAfavD6JWhWED6oTneSUKn
	XyOw==
X-Gm-Message-State: AKGB3mL+OLUL9iNxXGlKg3weD2tGFxg8AlGTWq2VP/ytQ9XJPY861t17
	R/sZ6SOWYSgFvUVb5oWhv0C1EA==
X-Received: by 10.101.82.65 with SMTP id q1mr386312pgp.55.1513618227876;
	Mon, 18 Dec 2017 09:30:27 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	h69sm26553411pfe.107.2017.12.18.09.30.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:30:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:30:15 -0800
Message-Id: <20171218173022.18418-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218173022.18418-1-richard.henderson@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH 2/9] target/arm: Use pointers in crypto helpers
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xn+uxly6kEyp

Rather than passing regnos to the helpers, pass pointers to the
vector registers directly.  This eliminates the need to pass in
the environment pointer and reduces the number of places that
directly access env->vfp.regs[].

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  18 ++---
 target/arm/crypto_helper.c | 184 +++++++++++++++++----------------------------
 target/arm/translate-a64.c |  68 +++++++++--------
 target/arm/translate.c     |  68 +++++++++--------
 4 files changed, 154 insertions(+), 184 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 5b6333347d..f9dd7432c1 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -539,17 +539,17 @@ DEF_HELPER_3(neon_qzip8, void, env, i32, i32)
 DEF_HELPER_3(neon_qzip16, void, env, i32, i32)
 DEF_HELPER_3(neon_qzip32, void, env, i32, i32)
 
-DEF_HELPER_4(crypto_aese, void, env, i32, i32, i32)
-DEF_HELPER_4(crypto_aesmc, void, env, i32, i32, i32)
+DEF_HELPER_FLAGS_3(crypto_aese, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(crypto_aesmc, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
-DEF_HELPER_5(crypto_sha1_3reg, void, env, i32, i32, i32, i32)
-DEF_HELPER_3(crypto_sha1h, void, env, i32, i32)
-DEF_HELPER_3(crypto_sha1su1, void, env, i32, i32)
+DEF_HELPER_FLAGS_4(crypto_sha1_3reg, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_2(crypto_sha1h, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(crypto_sha1su1, TCG_CALL_NO_RWG, void, ptr, ptr)
 
-DEF_HELPER_4(crypto_sha256h, void, env, i32, i32, i32)
-DEF_HELPER_4(crypto_sha256h2, void, env, i32, i32, i32)
-DEF_HELPER_3(crypto_sha256su0, void, env, i32, i32)
-DEF_HELPER_4(crypto_sha256su1, void, env, i32, i32, i32)
+DEF_HELPER_FLAGS_3(crypto_sha256h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_3(crypto_sha256h2, TCG_CALL_NO_RWG, void, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_2(crypto_sha256su0, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_3(crypto_sha256su1, TCG_CALL_NO_RWG, void, ptr, ptr, ptr)
 
 DEF_HELPER_FLAGS_3(crc32, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
diff --git a/target/arm/crypto_helper.c b/target/arm/crypto_helper.c
index 3b6df3f41a..9ca0bdead7 100644
--- a/target/arm/crypto_helper.c
+++ b/target/arm/crypto_helper.c
@@ -30,20 +30,14 @@ union CRYPTO_STATE {
 #define CR_ST_WORD(state, i)   (state.words[i])
 #endif
 
-void HELPER(crypto_aese)(CPUARMState *env, uint32_t rd, uint32_t rm,
-                         uint32_t decrypt)
+void HELPER(crypto_aese)(void *vd, void *vm, uint32_t decrypt)
 {
     static uint8_t const * const sbox[2] = { AES_sbox, AES_isbox };
     static uint8_t const * const shift[2] = { AES_shifts, AES_ishifts };
-
-    union CRYPTO_STATE rk = { .l = {
-        float64_val(env->vfp.regs[rm]),
-        float64_val(env->vfp.regs[rm + 1])
-    } };
-    union CRYPTO_STATE st = { .l = {
-        float64_val(env->vfp.regs[rd]),
-        float64_val(env->vfp.regs[rd + 1])
-    } };
+    uint64_t *rd = vd;
+    uint64_t *rm = vm;
+    union CRYPTO_STATE rk = { .l = { rm[0], rm[1] } };
+    union CRYPTO_STATE st = { .l = { rd[0], rd[1] } };
     int i;
 
     assert(decrypt < 2);
@@ -57,12 +51,11 @@ void HELPER(crypto_aese)(CPUARMState *env, uint32_t rd, uint32_t rm,
         CR_ST_BYTE(st, i) = sbox[decrypt][CR_ST_BYTE(rk, shift[decrypt][i])];
     }
 
-    env->vfp.regs[rd] = make_float64(st.l[0]);
-    env->vfp.regs[rd + 1] = make_float64(st.l[1]);
+    rd[0] = st.l[0];
+    rd[1] = st.l[1];
 }
 
-void HELPER(crypto_aesmc)(CPUARMState *env, uint32_t rd, uint32_t rm,
-                          uint32_t decrypt)
+void HELPER(crypto_aesmc)(void *vd, void *vm, uint32_t decrypt)
 {
     static uint32_t const mc[][256] = { {
         /* MixColumns lookup table */
@@ -197,10 +190,10 @@ void HELPER(crypto_aesmc)(CPUARMState *env, uint32_t rd, uint32_t rm,
         0x92b479a7, 0x99b970a9, 0x84ae6bbb, 0x8fa362b5,
         0xbe805d9f, 0xb58d5491, 0xa89a4f83, 0xa397468d,
     } };
-    union CRYPTO_STATE st = { .l = {
-        float64_val(env->vfp.regs[rm]),
-        float64_val(env->vfp.regs[rm + 1])
-    } };
+
+    uint64_t *rd = vd;
+    uint64_t *rm = vm;
+    union CRYPTO_STATE st = { .l = { rm[0], rm[1] } };
     int i;
 
     assert(decrypt < 2);
@@ -213,8 +206,8 @@ void HELPER(crypto_aesmc)(CPUARMState *env, uint32_t rd, uint32_t rm,
             rol32(mc[decrypt][CR_ST_BYTE(st, i + 3)], 24);
     }
 
-    env->vfp.regs[rd] = make_float64(st.l[0]);
-    env->vfp.regs[rd + 1] = make_float64(st.l[1]);
+    rd[0] = st.l[0];
+    rd[1] = st.l[1];
 }
 
 /*
@@ -236,21 +229,14 @@ static uint32_t maj(uint32_t x, uint32_t y, uint32_t z)
     return (x & y) | ((x | y) & z);
 }
 
-void HELPER(crypto_sha1_3reg)(CPUARMState *env, uint32_t rd, uint32_t rn,
-                              uint32_t rm, uint32_t op)
+void HELPER(crypto_sha1_3reg)(void *vd, void *vn, void *vm, uint32_t op)
 {
-    union CRYPTO_STATE d = { .l = {
-        float64_val(env->vfp.regs[rd]),
-        float64_val(env->vfp.regs[rd + 1])
-    } };
-    union CRYPTO_STATE n = { .l = {
-        float64_val(env->vfp.regs[rn]),
-        float64_val(env->vfp.regs[rn + 1])
-    } };
-    union CRYPTO_STATE m = { .l = {
-        float64_val(env->vfp.regs[rm]),
-        float64_val(env->vfp.regs[rm + 1])
-    } };
+    uint64_t *rd = vd;
+    uint64_t *rn = vn;
+    uint64_t *rm = vm;
+    union CRYPTO_STATE d = { .l = { rd[0], rd[1] } };
+    union CRYPTO_STATE n = { .l = { rn[0], rn[1] } };
+    union CRYPTO_STATE m = { .l = { rm[0], rm[1] } };
 
     if (op == 3) { /* sha1su0 */
         d.l[0] ^= d.l[1] ^ m.l[0];
@@ -284,42 +270,37 @@ void HELPER(crypto_sha1_3reg)(CPUARMState *env, uint32_t rd, uint32_t rn,
             CR_ST_WORD(d, 0) = t;
         }
     }
-    env->vfp.regs[rd] = make_float64(d.l[0]);
-    env->vfp.regs[rd + 1] = make_float64(d.l[1]);
+    rd[0] = d.l[0];
+    rd[1] = d.l[1];
 }
 
-void HELPER(crypto_sha1h)(CPUARMState *env, uint32_t rd, uint32_t rm)
+void HELPER(crypto_sha1h)(void *vd, void *vm)
 {
-    union CRYPTO_STATE m = { .l = {
-        float64_val(env->vfp.regs[rm]),
-        float64_val(env->vfp.regs[rm + 1])
-    } };
+    uint64_t *rd = vd;
+    uint64_t *rm = vm;
+    union CRYPTO_STATE m = { .l = { rm[0], rm[1] } };
 
     CR_ST_WORD(m, 0) = ror32(CR_ST_WORD(m, 0), 2);
     CR_ST_WORD(m, 1) = CR_ST_WORD(m, 2) = CR_ST_WORD(m, 3) = 0;
 
-    env->vfp.regs[rd] = make_float64(m.l[0]);
-    env->vfp.regs[rd + 1] = make_float64(m.l[1]);
+    rd[0] = m.l[0];
+    rd[1] = m.l[1];
 }
 
-void HELPER(crypto_sha1su1)(CPUARMState *env, uint32_t rd, uint32_t rm)
+void HELPER(crypto_sha1su1)(void *vd, void *vm)
 {
-    union CRYPTO_STATE d = { .l = {
-        float64_val(env->vfp.regs[rd]),
-        float64_val(env->vfp.regs[rd + 1])
-    } };
-    union CRYPTO_STATE m = { .l = {
-        float64_val(env->vfp.regs[rm]),
-        float64_val(env->vfp.regs[rm + 1])
-    } };
+    uint64_t *rd = vd;
+    uint64_t *rm = vm;
+    union CRYPTO_STATE d = { .l = { rd[0], rd[1] } };
+    union CRYPTO_STATE m = { .l = { rm[0], rm[1] } };
 
     CR_ST_WORD(d, 0) = rol32(CR_ST_WORD(d, 0) ^ CR_ST_WORD(m, 1), 1);
     CR_ST_WORD(d, 1) = rol32(CR_ST_WORD(d, 1) ^ CR_ST_WORD(m, 2), 1);
     CR_ST_WORD(d, 2) = rol32(CR_ST_WORD(d, 2) ^ CR_ST_WORD(m, 3), 1);
     CR_ST_WORD(d, 3) = rol32(CR_ST_WORD(d, 3) ^ CR_ST_WORD(d, 0), 1);
 
-    env->vfp.regs[rd] = make_float64(d.l[0]);
-    env->vfp.regs[rd + 1] = make_float64(d.l[1]);
+    rd[0] = d.l[0];
+    rd[1] = d.l[1];
 }
 
 /*
@@ -347,21 +328,14 @@ static uint32_t s1(uint32_t x)
     return ror32(x, 17) ^ ror32(x, 19) ^ (x >> 10);
 }
 
-void HELPER(crypto_sha256h)(CPUARMState *env, uint32_t rd, uint32_t rn,
-                            uint32_t rm)
+void HELPER(crypto_sha256h)(void *vd, void *vn, void *vm)
 {
-    union CRYPTO_STATE d = { .l = {
-        float64_val(env->vfp.regs[rd]),
-        float64_val(env->vfp.regs[rd + 1])
-    } };
-    union CRYPTO_STATE n = { .l = {
-        float64_val(env->vfp.regs[rn]),
-        float64_val(env->vfp.regs[rn + 1])
-    } };
-    union CRYPTO_STATE m = { .l = {
-        float64_val(env->vfp.regs[rm]),
-        float64_val(env->vfp.regs[rm + 1])
-    } };
+    uint64_t *rd = vd;
+    uint64_t *rn = vn;
+    uint64_t *rm = vm;
+    union CRYPTO_STATE d = { .l = { rd[0], rd[1] } };
+    union CRYPTO_STATE n = { .l = { rn[0], rn[1] } };
+    union CRYPTO_STATE m = { .l = { rm[0], rm[1] } };
     int i;
 
     for (i = 0; i < 4; i++) {
@@ -383,25 +357,18 @@ void HELPER(crypto_sha256h)(CPUARMState *env, uint32_t rd, uint32_t rn,
         CR_ST_WORD(d, 0) = t;
     }
 
-    env->vfp.regs[rd] = make_float64(d.l[0]);
-    env->vfp.regs[rd + 1] = make_float64(d.l[1]);
+    rd[0] = d.l[0];
+    rd[1] = d.l[1];
 }
 
-void HELPER(crypto_sha256h2)(CPUARMState *env, uint32_t rd, uint32_t rn,
-                             uint32_t rm)
+void HELPER(crypto_sha256h2)(void *vd, void *vn, void *vm)
 {
-    union CRYPTO_STATE d = { .l = {
-        float64_val(env->vfp.regs[rd]),
-        float64_val(env->vfp.regs[rd + 1])
-    } };
-    union CRYPTO_STATE n = { .l = {
-        float64_val(env->vfp.regs[rn]),
-        float64_val(env->vfp.regs[rn + 1])
-    } };
-    union CRYPTO_STATE m = { .l = {
-        float64_val(env->vfp.regs[rm]),
-        float64_val(env->vfp.regs[rm + 1])
-    } };
+    uint64_t *rd = vd;
+    uint64_t *rn = vn;
+    uint64_t *rm = vm;
+    union CRYPTO_STATE d = { .l = { rd[0], rd[1] } };
+    union CRYPTO_STATE n = { .l = { rn[0], rn[1] } };
+    union CRYPTO_STATE m = { .l = { rm[0], rm[1] } };
     int i;
 
     for (i = 0; i < 4; i++) {
@@ -415,51 +382,40 @@ void HELPER(crypto_sha256h2)(CPUARMState *env, uint32_t rd, uint32_t rn,
         CR_ST_WORD(d, 0) = CR_ST_WORD(n, 3 - i) + t;
     }
 
-    env->vfp.regs[rd] = make_float64(d.l[0]);
-    env->vfp.regs[rd + 1] = make_float64(d.l[1]);
+    rd[0] = d.l[0];
+    rd[1] = d.l[1];
 }
 
-void HELPER(crypto_sha256su0)(CPUARMState *env, uint32_t rd, uint32_t rm)
+void HELPER(crypto_sha256su0)(void *vd, void *vm)
 {
-    union CRYPTO_STATE d = { .l = {
-        float64_val(env->vfp.regs[rd]),
-        float64_val(env->vfp.regs[rd + 1])
-    } };
-    union CRYPTO_STATE m = { .l = {
-        float64_val(env->vfp.regs[rm]),
-        float64_val(env->vfp.regs[rm + 1])
-    } };
+    uint64_t *rd = vd;
+    uint64_t *rm = vm;
+    union CRYPTO_STATE d = { .l = { rd[0], rd[1] } };
+    union CRYPTO_STATE m = { .l = { rm[0], rm[1] } };
 
     CR_ST_WORD(d, 0) += s0(CR_ST_WORD(d, 1));
     CR_ST_WORD(d, 1) += s0(CR_ST_WORD(d, 2));
     CR_ST_WORD(d, 2) += s0(CR_ST_WORD(d, 3));
     CR_ST_WORD(d, 3) += s0(CR_ST_WORD(m, 0));
 
-    env->vfp.regs[rd] = make_float64(d.l[0]);
-    env->vfp.regs[rd + 1] = make_float64(d.l[1]);
+    rd[0] = d.l[0];
+    rd[1] = d.l[1];
 }
 
-void HELPER(crypto_sha256su1)(CPUARMState *env, uint32_t rd, uint32_t rn,
-                              uint32_t rm)
+void HELPER(crypto_sha256su1)(void *vd, void *vn, void *vm)
 {
-    union CRYPTO_STATE d = { .l = {
-        float64_val(env->vfp.regs[rd]),
-        float64_val(env->vfp.regs[rd + 1])
-    } };
-    union CRYPTO_STATE n = { .l = {
-        float64_val(env->vfp.regs[rn]),
-        float64_val(env->vfp.regs[rn + 1])
-    } };
-    union CRYPTO_STATE m = { .l = {
-        float64_val(env->vfp.regs[rm]),
-        float64_val(env->vfp.regs[rm + 1])
-    } };
+    uint64_t *rd = vd;
+    uint64_t *rn = vn;
+    uint64_t *rm = vm;
+    union CRYPTO_STATE d = { .l = { rd[0], rd[1] } };
+    union CRYPTO_STATE n = { .l = { rn[0], rn[1] } };
+    union CRYPTO_STATE m = { .l = { rm[0], rm[1] } };
 
     CR_ST_WORD(d, 0) += s1(CR_ST_WORD(m, 2)) + CR_ST_WORD(n, 1);
     CR_ST_WORD(d, 1) += s1(CR_ST_WORD(m, 3)) + CR_ST_WORD(n, 2);
     CR_ST_WORD(d, 2) += s1(CR_ST_WORD(d, 0)) + CR_ST_WORD(n, 3);
     CR_ST_WORD(d, 3) += s1(CR_ST_WORD(d, 1)) + CR_ST_WORD(m, 0);
 
-    env->vfp.regs[rd] = make_float64(d.l[0]);
-    env->vfp.regs[rd + 1] = make_float64(d.l[1]);
+    rd[0] = d.l[0];
+    rd[1] = d.l[1];
 }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 79fede35c1..d246e8f6b5 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -81,8 +81,9 @@ typedef void NeonGenWidenFn(TCGv_i64, TCGv_i32);
 typedef void NeonGenTwoSingleOPFn(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_ptr);
 typedef void NeonGenTwoDoubleOPFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_ptr);
 typedef void NeonGenOneOpFn(TCGv_i64, TCGv_i64);
-typedef void CryptoTwoOpEnvFn(TCGv_ptr, TCGv_i32, TCGv_i32);
-typedef void CryptoThreeOpEnvFn(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32);
+typedef void CryptoTwoOpFn(TCGv_ptr, TCGv_ptr);
+typedef void CryptoThreeOpIntFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
+typedef void CryptoThreeOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 
 /* Note that the gvec expanders operate on offsets + sizes.  */
 typedef void GVecGen2Fn(unsigned, uint32_t, uint32_t, uint32_t, uint32_t);
@@ -556,6 +557,14 @@ static inline int vec_full_reg_size(DisasContext *s)
     return 128 / 8;
 }
 
+/* Return a newly allocated pointer to the vector register.  */
+static TCGv_ptr vec_full_reg_ptr(DisasContext *s, int regno)
+{
+    TCGv_ptr ret = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(ret, cpu_env, vec_full_reg_offset(s, regno));
+    return ret;
+}
+
 /* Return the offset into CPUARMState of a slice (from
  * the least significant end) of FP register Qn (ie
  * Dn, Sn, Hn or Bn).
@@ -12455,8 +12464,9 @@ static void disas_crypto_aes(DisasContext *s, uint32_t insn)
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
     int decrypt;
-    TCGv_i32 tcg_rd_regno, tcg_rn_regno, tcg_decrypt;
-    CryptoThreeOpEnvFn *genfn;
+    TCGv_ptr tcg_rd_ptr, tcg_rn_ptr;
+    TCGv_i32 tcg_decrypt;
+    CryptoThreeOpIntFn *genfn;
 
     if (!arm_dc_feature(s, ARM_FEATURE_V8_AES)
         || size != 0) {
@@ -12490,18 +12500,14 @@ static void disas_crypto_aes(DisasContext *s, uint32_t insn)
         return;
     }
 
-    /* Note that we convert the Vx register indexes into the
-     * index within the vfp.regs[] array, so we can share the
-     * helper with the AArch32 instructions.
-     */
-    tcg_rd_regno = tcg_const_i32(rd << 1);
-    tcg_rn_regno = tcg_const_i32(rn << 1);
+    tcg_rd_ptr = vec_full_reg_ptr(s, rd);
+    tcg_rn_ptr = vec_full_reg_ptr(s, rn);
     tcg_decrypt = tcg_const_i32(decrypt);
 
-    genfn(cpu_env, tcg_rd_regno, tcg_rn_regno, tcg_decrypt);
+    genfn(tcg_rd_ptr, tcg_rn_ptr, tcg_decrypt);
 
-    tcg_temp_free_i32(tcg_rd_regno);
-    tcg_temp_free_i32(tcg_rn_regno);
+    tcg_temp_free_ptr(tcg_rd_ptr);
+    tcg_temp_free_ptr(tcg_rn_ptr);
     tcg_temp_free_i32(tcg_decrypt);
 }
 
@@ -12518,8 +12524,8 @@ static void disas_crypto_three_reg_sha(DisasContext *s, uint32_t insn)
     int rm = extract32(insn, 16, 5);
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
-    CryptoThreeOpEnvFn *genfn;
-    TCGv_i32 tcg_rd_regno, tcg_rn_regno, tcg_rm_regno;
+    CryptoThreeOpFn *genfn;
+    TCGv_ptr tcg_rd_ptr, tcg_rn_ptr, tcg_rm_ptr;
     int feature = ARM_FEATURE_V8_SHA256;
 
     if (size != 0) {
@@ -12558,23 +12564,23 @@ static void disas_crypto_three_reg_sha(DisasContext *s, uint32_t insn)
         return;
     }
 
-    tcg_rd_regno = tcg_const_i32(rd << 1);
-    tcg_rn_regno = tcg_const_i32(rn << 1);
-    tcg_rm_regno = tcg_const_i32(rm << 1);
+    tcg_rd_ptr = vec_full_reg_ptr(s, rd);
+    tcg_rn_ptr = vec_full_reg_ptr(s, rn);
+    tcg_rm_ptr = vec_full_reg_ptr(s, rm);
 
     if (genfn) {
-        genfn(cpu_env, tcg_rd_regno, tcg_rn_regno, tcg_rm_regno);
+        genfn(tcg_rd_ptr, tcg_rn_ptr, tcg_rm_ptr);
     } else {
         TCGv_i32 tcg_opcode = tcg_const_i32(opcode);
 
-        gen_helper_crypto_sha1_3reg(cpu_env, tcg_rd_regno,
-                                    tcg_rn_regno, tcg_rm_regno, tcg_opcode);
+        gen_helper_crypto_sha1_3reg(tcg_rd_ptr, tcg_rn_ptr,
+                                    tcg_rm_ptr, tcg_opcode);
         tcg_temp_free_i32(tcg_opcode);
     }
 
-    tcg_temp_free_i32(tcg_rd_regno);
-    tcg_temp_free_i32(tcg_rn_regno);
-    tcg_temp_free_i32(tcg_rm_regno);
+    tcg_temp_free_ptr(tcg_rd_ptr);
+    tcg_temp_free_ptr(tcg_rn_ptr);
+    tcg_temp_free_ptr(tcg_rm_ptr);
 }
 
 /* Crypto two-reg SHA
@@ -12589,9 +12595,9 @@ static void disas_crypto_two_reg_sha(DisasContext *s, uint32_t insn)
     int opcode = extract32(insn, 12, 5);
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
-    CryptoTwoOpEnvFn *genfn;
+    CryptoTwoOpFn *genfn;
     int feature;
-    TCGv_i32 tcg_rd_regno, tcg_rn_regno;
+    TCGv_ptr tcg_rd_ptr, tcg_rn_ptr;
 
     if (size != 0) {
         unallocated_encoding(s);
@@ -12625,13 +12631,13 @@ static void disas_crypto_two_reg_sha(DisasContext *s, uint32_t insn)
         return;
     }
 
-    tcg_rd_regno = tcg_const_i32(rd << 1);
-    tcg_rn_regno = tcg_const_i32(rn << 1);
+    tcg_rd_ptr = vec_full_reg_ptr(s, rd);
+    tcg_rn_ptr = vec_full_reg_ptr(s, rn);
 
-    genfn(cpu_env, tcg_rd_regno, tcg_rn_regno);
+    genfn(tcg_rd_ptr, tcg_rn_ptr);
 
-    tcg_temp_free_i32(tcg_rd_regno);
-    tcg_temp_free_i32(tcg_rn_regno);
+    tcg_temp_free_ptr(tcg_rd_ptr);
+    tcg_temp_free_ptr(tcg_rn_ptr);
 }
 
 /* C3.6 Data processing - SIMD, inc Crypto
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 490e120b0b..0c35c39069 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1560,6 +1560,13 @@ static inline void neon_store_reg64(TCGv_i64 var, int reg)
     tcg_gen_st_i64(var, cpu_env, vfp_reg_offset(1, reg));
 }
 
+static TCGv_ptr vfp_reg_ptr(bool dp, int reg)
+{
+    TCGv_ptr ret = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(ret, cpu_env, vfp_reg_offset(dp, reg));
+    return ret;
+}
+
 #define tcg_gen_ld_f32 tcg_gen_ld_i32
 #define tcg_gen_ld_f64 tcg_gen_ld_i64
 #define tcg_gen_st_f32 tcg_gen_st_i32
@@ -5614,6 +5621,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
     int u;
     uint32_t imm, mask;
     TCGv_i32 tmp, tmp2, tmp3, tmp4, tmp5;
+    TCGv_ptr ptr1, ptr2, ptr3;
     TCGv_i64 tmp64;
 
     /* FIXME: this access check should not take precedence over UNDEF
@@ -5660,34 +5668,34 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 if (!arm_dc_feature(s, ARM_FEATURE_V8_SHA1)) {
                     return 1;
                 }
-                tmp = tcg_const_i32(rd);
-                tmp2 = tcg_const_i32(rn);
-                tmp3 = tcg_const_i32(rm);
+                ptr1 = vfp_reg_ptr(true, rd);
+                ptr2 = vfp_reg_ptr(true, rn);
+                ptr3 = vfp_reg_ptr(true, rm);
                 tmp4 = tcg_const_i32(size);
-                gen_helper_crypto_sha1_3reg(cpu_env, tmp, tmp2, tmp3, tmp4);
+                gen_helper_crypto_sha1_3reg(ptr1, ptr2, ptr3, tmp4);
                 tcg_temp_free_i32(tmp4);
             } else { /* SHA-256 */
                 if (!arm_dc_feature(s, ARM_FEATURE_V8_SHA256) || size == 3) {
                     return 1;
                 }
-                tmp = tcg_const_i32(rd);
-                tmp2 = tcg_const_i32(rn);
-                tmp3 = tcg_const_i32(rm);
+                ptr1 = vfp_reg_ptr(true, rd);
+                ptr2 = vfp_reg_ptr(true, rn);
+                ptr3 = vfp_reg_ptr(true, rm);
                 switch (size) {
                 case 0:
-                    gen_helper_crypto_sha256h(cpu_env, tmp, tmp2, tmp3);
+                    gen_helper_crypto_sha256h(ptr1, ptr2, ptr3);
                     break;
                 case 1:
-                    gen_helper_crypto_sha256h2(cpu_env, tmp, tmp2, tmp3);
+                    gen_helper_crypto_sha256h2(ptr1, ptr2, ptr3);
                     break;
                 case 2:
-                    gen_helper_crypto_sha256su1(cpu_env, tmp, tmp2, tmp3);
+                    gen_helper_crypto_sha256su1(ptr1, ptr2, ptr3);
                     break;
                 }
             }
-            tcg_temp_free_i32(tmp);
-            tcg_temp_free_i32(tmp2);
-            tcg_temp_free_i32(tmp3);
+            tcg_temp_free_ptr(ptr1);
+            tcg_temp_free_ptr(ptr2);
+            tcg_temp_free_ptr(ptr3);
             return 0;
 
         case NEON_3R_VPADD_VQRDMLAH:
@@ -7238,8 +7246,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                         || ((rm | rd) & 1)) {
                         return 1;
                     }
-                    tmp = tcg_const_i32(rd);
-                    tmp2 = tcg_const_i32(rm);
+                    ptr1 = vfp_reg_ptr(true, rd);
+                    ptr2 = vfp_reg_ptr(true, rm);
 
                      /* Bit 6 is the lowest opcode bit; it distinguishes between
                       * encryption (AESE/AESMC) and decryption (AESD/AESIMC)
@@ -7247,12 +7255,12 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     tmp3 = tcg_const_i32(extract32(insn, 6, 1));
 
                     if (op == NEON_2RM_AESE) {
-                        gen_helper_crypto_aese(cpu_env, tmp, tmp2, tmp3);
+                        gen_helper_crypto_aese(ptr1, ptr2, tmp3);
                     } else {
-                        gen_helper_crypto_aesmc(cpu_env, tmp, tmp2, tmp3);
+                        gen_helper_crypto_aesmc(ptr1, ptr2, tmp3);
                     }
-                    tcg_temp_free_i32(tmp);
-                    tcg_temp_free_i32(tmp2);
+                    tcg_temp_free_ptr(ptr1);
+                    tcg_temp_free_ptr(ptr2);
                     tcg_temp_free_i32(tmp3);
                     break;
                 case NEON_2RM_SHA1H:
@@ -7260,13 +7268,13 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                         || ((rm | rd) & 1)) {
                         return 1;
                     }
-                    tmp = tcg_const_i32(rd);
-                    tmp2 = tcg_const_i32(rm);
+                    ptr1 = vfp_reg_ptr(true, rd);
+                    ptr2 = vfp_reg_ptr(true, rm);
 
-                    gen_helper_crypto_sha1h(cpu_env, tmp, tmp2);
+                    gen_helper_crypto_sha1h(ptr1, ptr2);
 
-                    tcg_temp_free_i32(tmp);
-                    tcg_temp_free_i32(tmp2);
+                    tcg_temp_free_ptr(ptr1);
+                    tcg_temp_free_ptr(ptr2);
                     break;
                 case NEON_2RM_SHA1SU1:
                     if ((rm | rd) & 1) {
@@ -7280,15 +7288,15 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     } else if (!arm_dc_feature(s, ARM_FEATURE_V8_SHA1)) {
                         return 1;
                     }
-                    tmp = tcg_const_i32(rd);
-                    tmp2 = tcg_const_i32(rm);
+                    ptr1 = vfp_reg_ptr(true, rd);
+                    ptr2 = vfp_reg_ptr(true, rm);
                     if (q) {
-                        gen_helper_crypto_sha256su0(cpu_env, tmp, tmp2);
+                        gen_helper_crypto_sha256su0(ptr1, ptr2);
                     } else {
-                        gen_helper_crypto_sha1su1(cpu_env, tmp, tmp2);
+                        gen_helper_crypto_sha1su1(ptr1, ptr2);
                     }
-                    tcg_temp_free_i32(tmp);
-                    tcg_temp_free_i32(tmp2);
+                    tcg_temp_free_ptr(ptr1);
+                    tcg_temp_free_ptr(ptr2);
                     break;
                 default:
                 elementwise:
-- 
2.14.3

