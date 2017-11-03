Received: by 10.223.150.237 with SMTP id u100csp244266wrb;
        Fri, 3 Nov 2017 13:27:32 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Qv4mXuWW4IZ/2uuPNFfTXiHUTM9l5iZGcQZ9XgRHu2Dkzfd1sLdk1Q3KfppbmAHoJzhtRT
X-Received: by 10.37.92.2 with SMTP id q2mr5151599ybb.260.1509740852818;
        Fri, 03 Nov 2017 13:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509740852; cv=none;
        d=google.com; s=arc-20160816;
        b=CYVJIinjzPm0q8UXqWZ/WjuJkuTvIXRs9WaHPWIC6hsn8Bji/vOTErMKEGJkg/vecS
         8qDXuhI3kJz7N3u0ZEx3oNEty9sylaR31Z5m/C+HaP30j0fMzwdUyMPp5semnpvFLyTF
         J4MSmmG3RUZjWvP6bqaJWGAo+oFoxr4RhKrGO+MxMLhAuDt5Hh/yXeE8L9C3ZuyL7UNE
         1jrGLL+iM+5r6exQTaEwXAZiXCAJiSfwxAXw+r5ASk+w+yv+Gd023RqwqvHp1H2zdRn7
         28ITjBQLyeGM4OAChf6Bul77PKEq4D5cfptOegTlTR+eeToaoyLjPSAIi1za4CEtc7U/
         g1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=SPsRyjReZHCcXVB1V/l3dS4ev5jCij5vjneEhr/EUWs=;
        b=Xd71XVNwUC8U0Td8faBxU7l4rfvHm9fDu0A2jfQQ6tAMgEsVUc4a2JzzjSxr38vOfg
         aCIj7eSljiCuuAt56L3OBC0nRNkyw1UX6fLZq4A8L4V6E7FRItXtotKXVBKQOTeTWjQc
         FZP/TpkToTazdUUpRH/HsAEX7wcVLuIIOoJm6DoDopdKlTm8mKBbKShKvVV2NaiTC3CA
         NciitoxquY1n6LLM8qfrOwxGhEkBU4yTO6vf6/AKLLxxbgI+5g9pjs8XsxBO7RWnL0yQ
         KVi8QsgRucmXEL52Jg/OVT446B408TnvqVgr7JVLPUI3snhrdwuOB7V/mXh4Pe7iIRkw
         cb8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l14si1500599ybm.757.2017.11.03.13.27.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Nov 2017 13:27:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38339 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAiYu-00025G-3x
	for alex.bennee@linaro.org; Fri, 03 Nov 2017 16:27:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eAiYF-0001Yt-Bc
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 16:26:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eAiYD-0000dX-W7
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 16:26:51 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:55657)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eAiY8-0000WJ-KF; Fri, 03 Nov 2017 16:26:44 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue003 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 0MflE8-1dnXM72wUu-00NA1Z; Fri, 03 Nov 2017 21:26:28 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Fri,  3 Nov 2017 21:26:22 +0100
Message-Id: <20171103202624.5956-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171103202624.5956-1-laurent@vivier.eu>
References: <20171103202624.5956-1-laurent@vivier.eu>
X-Provags-ID: V03:K0:tXCMgKZdZEId52KYrmNKJ3P4gEbzOFfLi03UtFlurG32p8+khyu
	zbN4NZpVvsRuQw2tzZ4a44qRvc1+o7m5RFMOnLt0Pv2VteIkW0LyFXMaGAn/fMJViI2euOS
	17ruPhegcL1xfDxAAEL4OIVDnzgKUy9tG9rS9NdLR2KI5vik/M/TeZcy5vKNlB5hX98si4M
	xEv9n8N5AJX3yeaex4FQQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:HJY8xxFoM5s=:tm9CRsoeDJvrEIn9gphEA8
	lzZMn4Pz6grfxDo/C2kCaJnlfP9rFAbVPwaE/SHj9nhr1biHH2cfLbECfLoiHNixWN/CBDctY
	3nloGsIGCJXAYWM1tLUtwTahpDDCpZOvjdlyw0XTRvITkesOhJ8WPR6ubnMdOM1AerxwV1ve3
	H6zzup0thJLFgPaSa3EzjmPnH0AqN2wQxLIwUtHAeun4sdx7pu40XFVh2gyCVVt5xfQlZwKPD
	7taWyBZHqNqRFPAW4kcgZDNlwCZEZfwA1i/p/QN+o3wAzCAfjt1J8faUNA+SYPgchcHzuWJUt
	soX5D8MEB8hfDz0R/QB+9TyaBR3BYYzytI2nPALGLfCK6QHYwqb9dbxzs6iXyV09gFaY1DOUt
	ZaiAt680RSV+Zk+AKete5BDdywe1Vq4W1Y3yOMidx6L3DCNE8dNefww5Fq/maesPktl0EJvND
	xVll6lcDRFT2jevF717B5P3bAWTiTE3ibgDttIaoo2UbhM3NePaeKiDubn7MXaqoFmPs/e1rS
	5tf4RGov+XVbQ6OcdvZH9li2XWgqUwUafhEwv3RP6d2tfYy7QkY7NuhRcGupNjo02KwtkuKs6
	o3v1toGIWZbZBHXQer/UNIrplQ9WSCW04cV0EGl+aV7aGHz2j9kLAmRqjIWBpo4oNWOZjO+9N
	2MtdSdM3C+rW627b5nofdGySj0w+DhjRSI4zNHa6vVuKa8LwlK8LTiDBRPO7u1lQy6xlS/H/+
	jo8z9uxHj7NuROHohOov+PzKK9PfP6QMe7mg/A==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.130
Subject: [Qemu-arm] [PATCH 2/4] openrisc: fix float32 and float64 helper
 definitions
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
	Stafford Horne <shorne@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +plyya1zUsBA

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/openrisc/fpu_helper.c | 52 ++++++++++++++++++++++----------------------
 target/openrisc/helper.h     | 20 ++++++++---------
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/target/openrisc/fpu_helper.c b/target/openrisc/fpu_helper.c
index 1375cea948..f84f8bf26a 100644
--- a/target/openrisc/fpu_helper.c
+++ b/target/openrisc/fpu_helper.c
@@ -66,9 +66,9 @@ static inline void update_fpcsr(OpenRISCCPU *cpu)
     }
 }
 
-uint64_t HELPER(itofd)(CPUOpenRISCState *env, uint64_t val)
+float64 HELPER(itofd)(CPUOpenRISCState *env, uint64_t val)
 {
-    uint64_t itofd;
+    float64 itofd;
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);
 
     set_float_exception_flags(0, &cpu->env.fp_status);
@@ -78,9 +78,9 @@ uint64_t HELPER(itofd)(CPUOpenRISCState *env, uint64_t val)
     return itofd;
 }
 
-uint32_t HELPER(itofs)(CPUOpenRISCState *env, uint32_t val)
+float32 HELPER(itofs)(CPUOpenRISCState *env, uint32_t val)
 {
-    uint32_t itofs;
+    float32 itofs;
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);
 
     set_float_exception_flags(0, &cpu->env.fp_status);
@@ -90,7 +90,7 @@ uint32_t HELPER(itofs)(CPUOpenRISCState *env, uint32_t val)
     return itofs;
 }
 
-uint64_t HELPER(ftoid)(CPUOpenRISCState *env, uint64_t val)
+uint64_t HELPER(ftoid)(CPUOpenRISCState *env, float32 val)
 {
     uint64_t ftoid;
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);
@@ -102,7 +102,7 @@ uint64_t HELPER(ftoid)(CPUOpenRISCState *env, uint64_t val)
     return ftoid;
 }
 
-uint32_t HELPER(ftois)(CPUOpenRISCState *env, uint32_t val)
+uint32_t HELPER(ftois)(CPUOpenRISCState *env, float32 val)
 {
     uint32_t ftois;
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);
@@ -117,10 +117,10 @@ uint32_t HELPER(ftois)(CPUOpenRISCState *env, uint32_t val)
 #define FLOAT_OP(name, p) void helper_float_##_##p(void)
 
 #define FLOAT_CALC(name)                                                  \
-uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
-                                     uint64_t fdt0, uint64_t fdt1)        \
+float64 helper_float_ ## name ## _d(CPUOpenRISCState *env,                \
+                                    float64 fdt0, float64 fdt1)          \
 {                                                                         \
-    uint64_t result;                                                      \
+    float64 result;                                                       \
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
     set_float_exception_flags(0, &cpu->env.fp_status);                    \
     result = float64_ ## name(fdt0, fdt1, &cpu->env.fp_status);           \
@@ -128,10 +128,10 @@ uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
     return result;                                                        \
 }                                                                         \
                                                                           \
-uint32_t helper_float_ ## name ## _s(CPUOpenRISCState *env,               \
-                                     uint32_t fdt0, uint32_t fdt1)        \
+float32 helper_float_ ## name ## _s(CPUOpenRISCState *env,                \
+                                    float32 fdt0, float32 fdt1)           \
 {                                                                         \
-    uint32_t result;                                                      \
+    float32 result;                                                       \
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
     set_float_exception_flags(0, &cpu->env.fp_status);                    \
     result = float32_ ## name(fdt0, fdt1, &cpu->env.fp_status);           \
@@ -147,11 +147,11 @@ FLOAT_CALC(rem)
 #undef FLOAT_CALC
 
 
-uint64_t helper_float_madd_d(CPUOpenRISCState *env, uint64_t a,
-                             uint64_t b, uint64_t c)
+float64 helper_float_madd_d(CPUOpenRISCState *env, float64 a,
+                             float64 b, float64 c)
 {
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);
-    uint64_t result;
+    float64 result;
     set_float_exception_flags(0, &cpu->env.fp_status);
     /* Note that or1ksim doesn't use merged operation.  */
     result = float64_mul(b, c, &cpu->env.fp_status);
@@ -160,11 +160,11 @@ uint64_t helper_float_madd_d(CPUOpenRISCState *env, uint64_t a,
     return result;
 }
 
-uint32_t helper_float_madd_s(CPUOpenRISCState *env, uint32_t a,
-                             uint32_t b, uint32_t c)
+float32 helper_float_madd_s(CPUOpenRISCState *env, float32 a,
+                             float32 b, float32 c)
 {
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);
-    uint32_t result;
+    float32 result;
     set_float_exception_flags(0, &cpu->env.fp_status);
     /* Note that or1ksim doesn't use merged operation.  */
     result = float32_mul(b, c, &cpu->env.fp_status);
@@ -176,7 +176,7 @@ uint32_t helper_float_madd_s(CPUOpenRISCState *env, uint32_t a,
 
 #define FLOAT_CMP(name)                                                   \
 uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
-                                     uint64_t fdt0, uint64_t fdt1)        \
+                                    float64 fdt0, float64 fdt1)           \
 {                                                                         \
     int res;                                                              \
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
@@ -187,7 +187,7 @@ uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
 }                                                                         \
                                                                           \
 uint32_t helper_float_ ## name ## _s(CPUOpenRISCState *env,               \
-                                             uint32_t fdt0, uint32_t fdt1)\
+                                    float32 fdt0, float32 fdt1)           \
 {                                                                         \
     int res;                                                              \
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
@@ -205,7 +205,7 @@ FLOAT_CMP(lt)
 
 #define FLOAT_CMPNE(name)                                                 \
 uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
-                                     uint64_t fdt0, uint64_t fdt1)        \
+                                     float64 fdt0, float64 fdt1)          \
 {                                                                         \
     int res;                                                              \
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
@@ -216,7 +216,7 @@ uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
 }                                                                         \
                                                                           \
 uint32_t helper_float_ ## name ## _s(CPUOpenRISCState *env,               \
-                                     uint32_t fdt0, uint32_t fdt1)        \
+                                     float32 fdt0, float32 fdt1)          \
 {                                                                         \
     int res;                                                              \
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
@@ -231,7 +231,7 @@ FLOAT_CMPNE(ne)
 
 #define FLOAT_CMPGT(name)                                                 \
 uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
-                                     uint64_t fdt0, uint64_t fdt1)        \
+                                     float64 fdt0, float64 fdt1)          \
 {                                                                         \
     int res;                                                              \
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
@@ -242,7 +242,7 @@ uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
 }                                                                         \
                                                                           \
 uint32_t helper_float_ ## name ## _s(CPUOpenRISCState *env,               \
-                                     uint32_t fdt0, uint32_t fdt1)        \
+                                     float32 fdt0, float32 fdt1)          \
 {                                                                         \
     int res;                                                              \
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
@@ -256,7 +256,7 @@ FLOAT_CMPGT(gt)
 
 #define FLOAT_CMPGE(name)                                                 \
 uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
-                                     uint64_t fdt0, uint64_t fdt1)        \
+                                     float64 fdt0, float64 fdt1)          \
 {                                                                         \
     int res;                                                              \
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
@@ -267,7 +267,7 @@ uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
 }                                                                         \
                                                                           \
 uint32_t helper_float_ ## name ## _s(CPUOpenRISCState *env,               \
-                                     uint32_t fdt0, uint32_t fdt1)        \
+                                     float32 fdt0, float32 fdt1)          \
 {                                                                         \
     int res;                                                              \
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
diff --git a/target/openrisc/helper.h b/target/openrisc/helper.h
index 4fd1a6bb8e..081606527b 100644
--- a/target/openrisc/helper.h
+++ b/target/openrisc/helper.h
@@ -24,17 +24,17 @@ DEF_HELPER_FLAGS_1(ove_ov, TCG_CALL_NO_WG, void, env)
 DEF_HELPER_FLAGS_1(ove_cyov, TCG_CALL_NO_WG, void, env)
 
 /* float */
-DEF_HELPER_FLAGS_2(itofd, TCG_CALL_NO_WG, i64, env, i64)
-DEF_HELPER_FLAGS_2(itofs, TCG_CALL_NO_WG, i32, env, i32)
-DEF_HELPER_FLAGS_2(ftoid, TCG_CALL_NO_WG, i64, env, i64)
-DEF_HELPER_FLAGS_2(ftois, TCG_CALL_NO_WG, i32, env, i32)
+DEF_HELPER_FLAGS_2(itofd, TCG_CALL_NO_WG, f64, env, i64)
+DEF_HELPER_FLAGS_2(itofs, TCG_CALL_NO_WG, f32, env, i32)
+DEF_HELPER_FLAGS_2(ftoid, TCG_CALL_NO_WG, i64, env, f32)
+DEF_HELPER_FLAGS_2(ftois, TCG_CALL_NO_WG, i32, env, f32)
 
-DEF_HELPER_FLAGS_4(float_madd_s, TCG_CALL_NO_WG, i32, env, i32, i32, i32)
-DEF_HELPER_FLAGS_4(float_madd_d, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_4(float_madd_s, TCG_CALL_NO_WG, f32, env, f32, f32, f32)
+DEF_HELPER_FLAGS_4(float_madd_d, TCG_CALL_NO_WG, f64, env, f64, f64, f64)
 
 #define FOP_CALC(op)                                            \
-DEF_HELPER_FLAGS_3(float_ ## op ## _s, TCG_CALL_NO_WG, i32, env, i32, i32) \
-DEF_HELPER_FLAGS_3(float_ ## op ## _d, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(float_ ## op ## _s, TCG_CALL_NO_WG, f32, env, f32, f32) \
+DEF_HELPER_FLAGS_3(float_ ## op ## _d, TCG_CALL_NO_WG, f64, env, f64, f64)
 FOP_CALC(add)
 FOP_CALC(sub)
 FOP_CALC(mul)
@@ -43,8 +43,8 @@ FOP_CALC(rem)
 #undef FOP_CALC
 
 #define FOP_CMP(op)                                              \
-DEF_HELPER_FLAGS_3(float_ ## op ## _s, TCG_CALL_NO_WG, i32, env, i32, i32) \
-DEF_HELPER_FLAGS_3(float_ ## op ## _d, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(float_ ## op ## _s, TCG_CALL_NO_WG, i32, env, f32, f32) \
+DEF_HELPER_FLAGS_3(float_ ## op ## _d, TCG_CALL_NO_WG, i64, env, f64, f64)
 FOP_CMP(eq)
 FOP_CMP(lt)
 FOP_CMP(le)
-- 
2.13.6

