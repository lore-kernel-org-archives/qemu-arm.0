Received: by 10.223.159.74 with SMTP id f10csp2940877wrg;
        Mon, 18 Dec 2017 09:53:31 -0800 (PST)
X-Google-Smtp-Source: ACJfBotzfdg0G5zdHxzKeQe91c+IQf8lPBC0gM9zuF3gPQJamIs2jgmsEVyL6xAI3VCiPHp2unIT
X-Received: by 10.129.47.16 with SMTP id v16mr462805ywv.320.1513619611568;
        Mon, 18 Dec 2017 09:53:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513619611; cv=none;
        d=google.com; s=arc-20160816;
        b=0H1XhPwELf3p6WlB89S9jFbKFvT3UQDgJMhK0SktArddCMIUHE1XQXH9LnCFSCtezm
         0KWHzdzQmRKj6fDYmZs86gRXvZR9P984B0FAw7XjIDLm83K/yedRieWFlOQM1s/VaG/j
         VPMAkFyVum9MPO20VPTuF2904FxUgHeW4hVRH3129WA1rNPzu06k6ykVvJaV9UUk1vpM
         v+edk7uymkfyJygXPfrYl/HOp5YGEOMZ+G8XleDzkKGu/5hm5amZuK3CT39b4TAPU/Kr
         N7f90wDIQZ5M2rfMj7BB4E1VlRWozjghFzSYVHUtvxyRRzv608CnjG0VIOpYvVQtB/N4
         riVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Z9slflrqdu44S5FcR6VciGdSdyJ4Puo4CACj/wvVVL4=;
        b=J57cPOZ149Cga5cG/hbILz48zGEmY8MdPCSe5LuiUvLlhynw8OpHInICLIvPhBjKQa
         H5ErttjCNiCO2EUdSqFx51tFUN3Ns4l18dMh6AI7l4rTwLA9jgIY2d0+tXTyYAZTYiva
         PcqHRSMhEILUhCw9P+cU/8BFSPIDuP9kqO0LUIGsEtmS4DMq+DchCi+TJ0PSVihNNDob
         IQBO2eoXsaQeZwmI/RKaxvrmHy2YjdSJFzMq+/LqGVW+tedbiuQbyVtEonQ222WWrcQP
         BAqbMsWkOaN6l5n6GoKndOYLjQTzWKB3Zv9d4Dz/YfohJb62lGIcN5YKB+pkAT+yB6/6
         JfhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PdTTqyIK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h64si126743ybb.618.2017.12.18.09.53.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 09:53:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PdTTqyIK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzbW-0006Ur-Sy
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 12:53:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzFK-0002ca-5Q
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:30:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzFH-0004fS-2n
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:30:34 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:34030)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzFG-0004e5-LP
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:30:30 -0500
Received: by mail-pg0-x241.google.com with SMTP id j4so9424554pgp.1
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Z9slflrqdu44S5FcR6VciGdSdyJ4Puo4CACj/wvVVL4=;
	b=PdTTqyIKwqMAuAUK/Wfs9zaEfyrBaBeIGCzX7m1W4O1kp0DhHY1DQV2SmUy8z9GdVz
	XrRQ0UoygvvOgb7A2JXmLHN/g1zCfmPIm7wqX6ZejR+AISMRFmO93El5ilDN8OA2rzTy
	dikyoVMen7TQO3DOlwD2+rYwZ0freosWNSoEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Z9slflrqdu44S5FcR6VciGdSdyJ4Puo4CACj/wvVVL4=;
	b=eUqU2O7/QoVpKDd2ACBUtmkbL0278GqJ+cuR2uahEmbrASI52qF5QwgVvdGPAjfSi7
	I/SxrCO10Lj6RSPt+mNOYO74GsTqtSnZ/7OHS7vakFH9C0wJ18a6uerL5+eJViVGS5tq
	YyYQYfpP9JAOreV8APg7dJ0j7kzNnl3Bv45bcgYHY2XhzF2a+vn52BM0708B4iK4Ir/s
	tWTOzMTxqf6/PsjLgERBs6H0kELrVEeoG0W9fS57Oazbdxwgw/HjoNGzsieRLHd6K0IB
	NClTIuHv2qmP0dWm09boW1OYNPD2POkntJjxt54Ti31dPSATJLPXgzqLBq4JNcBbXRDp
	ZYNA==
X-Gm-Message-State: AKGB3mLS1Hmfc3Fgrb1exEMeyc5ggH6YRcalblbbOqaK532p5hNHDJLs
	UcMCwGfyuPxA4a/VDkqX2k/mhw==
X-Received: by 10.101.68.129 with SMTP id l1mr383764pgq.53.1513618229507;
	Mon, 18 Dec 2017 09:30:29 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	h69sm26553411pfe.107.2017.12.18.09.30.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:30:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:30:16 -0800
Message-Id: <20171218173022.18418-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218173022.18418-1-richard.henderson@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH 3/9] target/arm: Use pointers in neon zip/uzp
 helpers
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
X-TUID: IRZk0weJSLfe

Rather than passing regnos to the helpers, pass pointers to the
vector registers directly.  This eliminates the need to pass in
the environment pointer and reduces the number of places that
directly access env->vfp.regs[].

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h      |  20 +++---
 target/arm/neon_helper.c | 162 +++++++++++++++++++++++++----------------------
 target/arm/translate.c   |  42 ++++++------
 3 files changed, 120 insertions(+), 104 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index f9dd7432c1..d39ca11cbd 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -528,16 +528,16 @@ DEF_HELPER_3(iwmmxt_muladdsl, i64, i64, i32, i32)
 DEF_HELPER_3(iwmmxt_muladdsw, i64, i64, i32, i32)
 DEF_HELPER_3(iwmmxt_muladdswl, i64, i64, i32, i32)
 
-DEF_HELPER_3(neon_unzip8, void, env, i32, i32)
-DEF_HELPER_3(neon_unzip16, void, env, i32, i32)
-DEF_HELPER_3(neon_qunzip8, void, env, i32, i32)
-DEF_HELPER_3(neon_qunzip16, void, env, i32, i32)
-DEF_HELPER_3(neon_qunzip32, void, env, i32, i32)
-DEF_HELPER_3(neon_zip8, void, env, i32, i32)
-DEF_HELPER_3(neon_zip16, void, env, i32, i32)
-DEF_HELPER_3(neon_qzip8, void, env, i32, i32)
-DEF_HELPER_3(neon_qzip16, void, env, i32, i32)
-DEF_HELPER_3(neon_qzip32, void, env, i32, i32)
+DEF_HELPER_FLAGS_2(neon_unzip8, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_unzip16, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_qunzip8, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_qunzip16, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_qunzip32, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_zip8, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_zip16, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_qzip8, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_qzip16, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_qzip32, TCG_CALL_NO_RWG, void, ptr, ptr)
 
 DEF_HELPER_FLAGS_3(crypto_aese, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(crypto_aesmc, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
diff --git a/target/arm/neon_helper.c b/target/arm/neon_helper.c
index ebdf7c9b10..689491cad3 100644
--- a/target/arm/neon_helper.c
+++ b/target/arm/neon_helper.c
@@ -2027,12 +2027,12 @@ uint64_t HELPER(neon_acgt_f64)(uint64_t a, uint64_t b, void *fpstp)
 
 #define ELEM(V, N, SIZE) (((V) >> ((N) * (SIZE))) & ((1ull << (SIZE)) - 1))
 
-void HELPER(neon_qunzip8)(CPUARMState *env, uint32_t rd, uint32_t rm)
+void HELPER(neon_qunzip8)(void *vd, void *vm)
 {
-    uint64_t zm0 = float64_val(env->vfp.regs[rm]);
-    uint64_t zm1 = float64_val(env->vfp.regs[rm + 1]);
-    uint64_t zd0 = float64_val(env->vfp.regs[rd]);
-    uint64_t zd1 = float64_val(env->vfp.regs[rd + 1]);
+    uint64_t *rd = vd, *rm = vm;
+    uint64_t zd0 = rd[0], zd1 = rd[1];
+    uint64_t zm0 = rm[0], zm1 = rm[1];
+
     uint64_t d0 = ELEM(zd0, 0, 8) | (ELEM(zd0, 2, 8) << 8)
         | (ELEM(zd0, 4, 8) << 16) | (ELEM(zd0, 6, 8) << 24)
         | (ELEM(zd1, 0, 8) << 32) | (ELEM(zd1, 2, 8) << 40)
@@ -2049,18 +2049,19 @@ void HELPER(neon_qunzip8)(CPUARMState *env, uint32_t rd, uint32_t rm)
         | (ELEM(zm0, 5, 8) << 16) | (ELEM(zm0, 7, 8) << 24)
         | (ELEM(zm1, 1, 8) << 32) | (ELEM(zm1, 3, 8) << 40)
         | (ELEM(zm1, 5, 8) << 48) | (ELEM(zm1, 7, 8) << 56);
-    env->vfp.regs[rm] = make_float64(m0);
-    env->vfp.regs[rm + 1] = make_float64(m1);
-    env->vfp.regs[rd] = make_float64(d0);
-    env->vfp.regs[rd + 1] = make_float64(d1);
+
+    rm[0] = m0;
+    rm[1] = m1;
+    rd[0] = d0;
+    rd[1] = d1;
 }
 
-void HELPER(neon_qunzip16)(CPUARMState *env, uint32_t rd, uint32_t rm)
+void HELPER(neon_qunzip16)(void *vd, void *vm)
 {
-    uint64_t zm0 = float64_val(env->vfp.regs[rm]);
-    uint64_t zm1 = float64_val(env->vfp.regs[rm + 1]);
-    uint64_t zd0 = float64_val(env->vfp.regs[rd]);
-    uint64_t zd1 = float64_val(env->vfp.regs[rd + 1]);
+    uint64_t *rd = vd, *rm = vm;
+    uint64_t zd0 = rd[0], zd1 = rd[1];
+    uint64_t zm0 = rm[0], zm1 = rm[1];
+
     uint64_t d0 = ELEM(zd0, 0, 16) | (ELEM(zd0, 2, 16) << 16)
         | (ELEM(zd1, 0, 16) << 32) | (ELEM(zd1, 2, 16) << 48);
     uint64_t d1 = ELEM(zm0, 0, 16) | (ELEM(zm0, 2, 16) << 16)
@@ -2069,32 +2070,35 @@ void HELPER(neon_qunzip16)(CPUARMState *env, uint32_t rd, uint32_t rm)
         | (ELEM(zd1, 1, 16) << 32) | (ELEM(zd1, 3, 16) << 48);
     uint64_t m1 = ELEM(zm0, 1, 16) | (ELEM(zm0, 3, 16) << 16)
         | (ELEM(zm1, 1, 16) << 32) | (ELEM(zm1, 3, 16) << 48);
-    env->vfp.regs[rm] = make_float64(m0);
-    env->vfp.regs[rm + 1] = make_float64(m1);
-    env->vfp.regs[rd] = make_float64(d0);
-    env->vfp.regs[rd + 1] = make_float64(d1);
+
+    rm[0] = m0;
+    rm[1] = m1;
+    rd[0] = d0;
+    rd[1] = d1;
 }
 
-void HELPER(neon_qunzip32)(CPUARMState *env, uint32_t rd, uint32_t rm)
+void HELPER(neon_qunzip32)(void *vd, void *vm)
 {
-    uint64_t zm0 = float64_val(env->vfp.regs[rm]);
-    uint64_t zm1 = float64_val(env->vfp.regs[rm + 1]);
-    uint64_t zd0 = float64_val(env->vfp.regs[rd]);
-    uint64_t zd1 = float64_val(env->vfp.regs[rd + 1]);
+    uint64_t *rd = vd, *rm = vm;
+    uint64_t zd0 = rd[0], zd1 = rd[1];
+    uint64_t zm0 = rm[0], zm1 = rm[1];
+
     uint64_t d0 = ELEM(zd0, 0, 32) | (ELEM(zd1, 0, 32) << 32);
     uint64_t d1 = ELEM(zm0, 0, 32) | (ELEM(zm1, 0, 32) << 32);
     uint64_t m0 = ELEM(zd0, 1, 32) | (ELEM(zd1, 1, 32) << 32);
     uint64_t m1 = ELEM(zm0, 1, 32) | (ELEM(zm1, 1, 32) << 32);
-    env->vfp.regs[rm] = make_float64(m0);
-    env->vfp.regs[rm + 1] = make_float64(m1);
-    env->vfp.regs[rd] = make_float64(d0);
-    env->vfp.regs[rd + 1] = make_float64(d1);
+
+    rm[0] = m0;
+    rm[1] = m1;
+    rd[0] = d0;
+    rd[1] = d1;
 }
 
-void HELPER(neon_unzip8)(CPUARMState *env, uint32_t rd, uint32_t rm)
+void HELPER(neon_unzip8)(void *vd, void *vm)
 {
-    uint64_t zm = float64_val(env->vfp.regs[rm]);
-    uint64_t zd = float64_val(env->vfp.regs[rd]);
+    uint64_t *rd = vd, *rm = vm;
+    uint64_t zd = rd[0], zm = rm[0];
+
     uint64_t d0 = ELEM(zd, 0, 8) | (ELEM(zd, 2, 8) << 8)
         | (ELEM(zd, 4, 8) << 16) | (ELEM(zd, 6, 8) << 24)
         | (ELEM(zm, 0, 8) << 32) | (ELEM(zm, 2, 8) << 40)
@@ -2103,28 +2107,31 @@ void HELPER(neon_unzip8)(CPUARMState *env, uint32_t rd, uint32_t rm)
         | (ELEM(zd, 5, 8) << 16) | (ELEM(zd, 7, 8) << 24)
         | (ELEM(zm, 1, 8) << 32) | (ELEM(zm, 3, 8) << 40)
         | (ELEM(zm, 5, 8) << 48) | (ELEM(zm, 7, 8) << 56);
-    env->vfp.regs[rm] = make_float64(m0);
-    env->vfp.regs[rd] = make_float64(d0);
+
+    rm[0] = m0;
+    rd[0] = d0;
 }
 
-void HELPER(neon_unzip16)(CPUARMState *env, uint32_t rd, uint32_t rm)
+void HELPER(neon_unzip16)(void *vd, void *vm)
 {
-    uint64_t zm = float64_val(env->vfp.regs[rm]);
-    uint64_t zd = float64_val(env->vfp.regs[rd]);
+    uint64_t *rd = vd, *rm = vm;
+    uint64_t zd = rd[0], zm = rm[0];
+
     uint64_t d0 = ELEM(zd, 0, 16) | (ELEM(zd, 2, 16) << 16)
         | (ELEM(zm, 0, 16) << 32) | (ELEM(zm, 2, 16) << 48);
     uint64_t m0 = ELEM(zd, 1, 16) | (ELEM(zd, 3, 16) << 16)
         | (ELEM(zm, 1, 16) << 32) | (ELEM(zm, 3, 16) << 48);
-    env->vfp.regs[rm] = make_float64(m0);
-    env->vfp.regs[rd] = make_float64(d0);
+
+    rm[0] = m0;
+    rd[0] = d0;
 }
 
-void HELPER(neon_qzip8)(CPUARMState *env, uint32_t rd, uint32_t rm)
+void HELPER(neon_qzip8)(void *vd, void *vm)
 {
-    uint64_t zm0 = float64_val(env->vfp.regs[rm]);
-    uint64_t zm1 = float64_val(env->vfp.regs[rm + 1]);
-    uint64_t zd0 = float64_val(env->vfp.regs[rd]);
-    uint64_t zd1 = float64_val(env->vfp.regs[rd + 1]);
+    uint64_t *rd = vd, *rm = vm;
+    uint64_t zd0 = rd[0], zd1 = rd[1];
+    uint64_t zm0 = rm[0], zm1 = rm[1];
+
     uint64_t d0 = ELEM(zd0, 0, 8) | (ELEM(zm0, 0, 8) << 8)
         | (ELEM(zd0, 1, 8) << 16) | (ELEM(zm0, 1, 8) << 24)
         | (ELEM(zd0, 2, 8) << 32) | (ELEM(zm0, 2, 8) << 40)
@@ -2141,18 +2148,19 @@ void HELPER(neon_qzip8)(CPUARMState *env, uint32_t rd, uint32_t rm)
         | (ELEM(zd1, 5, 8) << 16) | (ELEM(zm1, 5, 8) << 24)
         | (ELEM(zd1, 6, 8) << 32) | (ELEM(zm1, 6, 8) << 40)
         | (ELEM(zd1, 7, 8) << 48) | (ELEM(zm1, 7, 8) << 56);
-    env->vfp.regs[rm] = make_float64(m0);
-    env->vfp.regs[rm + 1] = make_float64(m1);
-    env->vfp.regs[rd] = make_float64(d0);
-    env->vfp.regs[rd + 1] = make_float64(d1);
+
+    rm[0] = m0;
+    rm[1] = m1;
+    rd[0] = d0;
+    rd[1] = d1;
 }
 
-void HELPER(neon_qzip16)(CPUARMState *env, uint32_t rd, uint32_t rm)
+void HELPER(neon_qzip16)(void *vd, void *vm)
 {
-    uint64_t zm0 = float64_val(env->vfp.regs[rm]);
-    uint64_t zm1 = float64_val(env->vfp.regs[rm + 1]);
-    uint64_t zd0 = float64_val(env->vfp.regs[rd]);
-    uint64_t zd1 = float64_val(env->vfp.regs[rd + 1]);
+    uint64_t *rd = vd, *rm = vm;
+    uint64_t zd0 = rd[0], zd1 = rd[1];
+    uint64_t zm0 = rm[0], zm1 = rm[1];
+
     uint64_t d0 = ELEM(zd0, 0, 16) | (ELEM(zm0, 0, 16) << 16)
         | (ELEM(zd0, 1, 16) << 32) | (ELEM(zm0, 1, 16) << 48);
     uint64_t d1 = ELEM(zd0, 2, 16) | (ELEM(zm0, 2, 16) << 16)
@@ -2161,32 +2169,35 @@ void HELPER(neon_qzip16)(CPUARMState *env, uint32_t rd, uint32_t rm)
         | (ELEM(zd1, 1, 16) << 32) | (ELEM(zm1, 1, 16) << 48);
     uint64_t m1 = ELEM(zd1, 2, 16) | (ELEM(zm1, 2, 16) << 16)
         | (ELEM(zd1, 3, 16) << 32) | (ELEM(zm1, 3, 16) << 48);
-    env->vfp.regs[rm] = make_float64(m0);
-    env->vfp.regs[rm + 1] = make_float64(m1);
-    env->vfp.regs[rd] = make_float64(d0);
-    env->vfp.regs[rd + 1] = make_float64(d1);
+
+    rm[0] = m0;
+    rm[1] = m1;
+    rd[0] = d0;
+    rd[1] = d1;
 }
 
-void HELPER(neon_qzip32)(CPUARMState *env, uint32_t rd, uint32_t rm)
+void HELPER(neon_qzip32)(void *vd, void *vm)
 {
-    uint64_t zm0 = float64_val(env->vfp.regs[rm]);
-    uint64_t zm1 = float64_val(env->vfp.regs[rm + 1]);
-    uint64_t zd0 = float64_val(env->vfp.regs[rd]);
-    uint64_t zd1 = float64_val(env->vfp.regs[rd + 1]);
+    uint64_t *rd = vd, *rm = vm;
+    uint64_t zd0 = rd[0], zd1 = rd[1];
+    uint64_t zm0 = rm[0], zm1 = rm[1];
+
     uint64_t d0 = ELEM(zd0, 0, 32) | (ELEM(zm0, 0, 32) << 32);
     uint64_t d1 = ELEM(zd0, 1, 32) | (ELEM(zm0, 1, 32) << 32);
     uint64_t m0 = ELEM(zd1, 0, 32) | (ELEM(zm1, 0, 32) << 32);
     uint64_t m1 = ELEM(zd1, 1, 32) | (ELEM(zm1, 1, 32) << 32);
-    env->vfp.regs[rm] = make_float64(m0);
-    env->vfp.regs[rm + 1] = make_float64(m1);
-    env->vfp.regs[rd] = make_float64(d0);
-    env->vfp.regs[rd + 1] = make_float64(d1);
+
+    rm[0] = m0;
+    rm[1] = m1;
+    rd[0] = d0;
+    rd[1] = d1;
 }
 
-void HELPER(neon_zip8)(CPUARMState *env, uint32_t rd, uint32_t rm)
+void HELPER(neon_zip8)(void *vd, void *vm)
 {
-    uint64_t zm = float64_val(env->vfp.regs[rm]);
-    uint64_t zd = float64_val(env->vfp.regs[rd]);
+    uint64_t *rd = vd, *rm = vm;
+    uint64_t zd = rd[0], zm = rm[0];
+
     uint64_t d0 = ELEM(zd, 0, 8) | (ELEM(zm, 0, 8) << 8)
         | (ELEM(zd, 1, 8) << 16) | (ELEM(zm, 1, 8) << 24)
         | (ELEM(zd, 2, 8) << 32) | (ELEM(zm, 2, 8) << 40)
@@ -2195,20 +2206,23 @@ void HELPER(neon_zip8)(CPUARMState *env, uint32_t rd, uint32_t rm)
         | (ELEM(zd, 5, 8) << 16) | (ELEM(zm, 5, 8) << 24)
         | (ELEM(zd, 6, 8) << 32) | (ELEM(zm, 6, 8) << 40)
         | (ELEM(zd, 7, 8) << 48) | (ELEM(zm, 7, 8) << 56);
-    env->vfp.regs[rm] = make_float64(m0);
-    env->vfp.regs[rd] = make_float64(d0);
+
+    rm[0] = m0;
+    rd[0] = d0;
 }
 
-void HELPER(neon_zip16)(CPUARMState *env, uint32_t rd, uint32_t rm)
+void HELPER(neon_zip16)(void *vd, void *vm)
 {
-    uint64_t zm = float64_val(env->vfp.regs[rm]);
-    uint64_t zd = float64_val(env->vfp.regs[rd]);
+    uint64_t *rd = vd, *rm = vm;
+    uint64_t zd = rd[0], zm = rm[0];
+
     uint64_t d0 = ELEM(zd, 0, 16) | (ELEM(zm, 0, 16) << 16)
         | (ELEM(zd, 1, 16) << 32) | (ELEM(zm, 1, 16) << 48);
     uint64_t m0 = ELEM(zd, 2, 16) | (ELEM(zm, 2, 16) << 16)
         | (ELEM(zd, 3, 16) << 32) | (ELEM(zm, 3, 16) << 48);
-    env->vfp.regs[rm] = make_float64(m0);
-    env->vfp.regs[rd] = make_float64(d0);
+
+    rm[0] = m0;
+    rd[0] = d0;
 }
 
 /* Helper function for 64 bit polynomial multiply case:
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0c35c39069..68e928640f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4688,22 +4688,23 @@ static inline TCGv_i32 neon_get_scalar(int size, int reg)
 
 static int gen_neon_unzip(int rd, int rm, int size, int q)
 {
-    TCGv_i32 tmp, tmp2;
+    TCGv_ptr pd, pm;
+    
     if (!q && size == 2) {
         return 1;
     }
-    tmp = tcg_const_i32(rd);
-    tmp2 = tcg_const_i32(rm);
+    pd = vfp_reg_ptr(true, rd);
+    pm = vfp_reg_ptr(true, rm);
     if (q) {
         switch (size) {
         case 0:
-            gen_helper_neon_qunzip8(cpu_env, tmp, tmp2);
+            gen_helper_neon_qunzip8(pd, pm);
             break;
         case 1:
-            gen_helper_neon_qunzip16(cpu_env, tmp, tmp2);
+            gen_helper_neon_qunzip16(pd, pm);
             break;
         case 2:
-            gen_helper_neon_qunzip32(cpu_env, tmp, tmp2);
+            gen_helper_neon_qunzip32(pd, pm);
             break;
         default:
             abort();
@@ -4711,38 +4712,39 @@ static int gen_neon_unzip(int rd, int rm, int size, int q)
     } else {
         switch (size) {
         case 0:
-            gen_helper_neon_unzip8(cpu_env, tmp, tmp2);
+            gen_helper_neon_unzip8(pd, pm);
             break;
         case 1:
-            gen_helper_neon_unzip16(cpu_env, tmp, tmp2);
+            gen_helper_neon_unzip16(pd, pm);
             break;
         default:
             abort();
         }
     }
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(tmp2);
+    tcg_temp_free_ptr(pd);
+    tcg_temp_free_ptr(pm);
     return 0;
 }
 
 static int gen_neon_zip(int rd, int rm, int size, int q)
 {
-    TCGv_i32 tmp, tmp2;
+    TCGv_ptr pd, pm;
+
     if (!q && size == 2) {
         return 1;
     }
-    tmp = tcg_const_i32(rd);
-    tmp2 = tcg_const_i32(rm);
+    pd = vfp_reg_ptr(true, rd);
+    pm = vfp_reg_ptr(true, rm);
     if (q) {
         switch (size) {
         case 0:
-            gen_helper_neon_qzip8(cpu_env, tmp, tmp2);
+            gen_helper_neon_qzip8(pd, pm);
             break;
         case 1:
-            gen_helper_neon_qzip16(cpu_env, tmp, tmp2);
+            gen_helper_neon_qzip16(pd, pm);
             break;
         case 2:
-            gen_helper_neon_qzip32(cpu_env, tmp, tmp2);
+            gen_helper_neon_qzip32(pd, pm);
             break;
         default:
             abort();
@@ -4750,17 +4752,17 @@ static int gen_neon_zip(int rd, int rm, int size, int q)
     } else {
         switch (size) {
         case 0:
-            gen_helper_neon_zip8(cpu_env, tmp, tmp2);
+            gen_helper_neon_zip8(pd, pm);
             break;
         case 1:
-            gen_helper_neon_zip16(cpu_env, tmp, tmp2);
+            gen_helper_neon_zip16(pd, pm);
             break;
         default:
             abort();
         }
     }
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(tmp2);
+    tcg_temp_free_ptr(pd);
+    tcg_temp_free_ptr(pm);
     return 0;
 }
 
-- 
2.14.3

