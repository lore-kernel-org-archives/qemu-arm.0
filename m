Received: by 10.223.159.74 with SMTP id f10csp3003341wrg;
        Mon, 18 Dec 2017 10:58:20 -0800 (PST)
X-Google-Smtp-Source: ACJfBosz1kEWPc44yDzlppsjucJPXZ0R9Jkp+XTZJ89/O7ElO7Qo2XvaW57pYwD8SqCWar5fBkIS
X-Received: by 10.37.162.105 with SMTP id b96mr662076ybi.56.1513623500107;
        Mon, 18 Dec 2017 10:58:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513623500; cv=none;
        d=google.com; s=arc-20160816;
        b=SZBO548thnXFdirGMxcf2i1sSf1rMbqG0VbBuIqtM2XO4gaMzB6K7ANSSnSpD4GURu
         TYSoTxogUsINyS4lRb7eSRv1P/PkOuYjtbFx8GbHP0HBB3gTI3GcWwbPdBYbXScaP4kN
         BVxxdhUnp5QbS0b9pvxiEE0xYz+2UY8BUAp6VXgieAPEj0DfvcylzZbkUm8vhPajKZiy
         n5WYRk+R5KGYRcjSgDs9FTr1lk/OoKNxBNcW3QBcvCkdInx5ynEQoJ42bPy+RSWHm6QP
         8AdkpsJ7SrRHTdB+Sj4tNtzkDDqU8kHvDSf+0d9OYt1CMKfzytrHC96Coh+3yfKZshbc
         p9CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Hy9sfhMkBpSM5NImxVV6CJzkqzQztXElQhyddscya8E=;
        b=JMWuAloXks8T+GbOuTMVF9lSqdQdjWOmRpXuEL1Bt1rKw5caNfmCv3LqxPm8GnV+8t
         zs4HLnR+Tp231EAzg/AEKd5u0t76mXSRx4p+3c/988BhAnoM23uMjGoKcm4BgtRdCKOf
         7IkxHpqfIsZ197NnxLtcjecK6bik5uClZ+7/NEgxrRXOfVptvDCbAsLmnEIhhOMUkUo6
         3o5Sh+L1durT6NitAzT25ENnhsc+0FkAlxbr4adCSMbQXqZiRjqFvAg55mT5gwF5uB9I
         HEdeAx6eMCVqPahLDaexPy+VG551byrdvbn1VtkaZagex/PtIO1Y1knVABB7O5JfSB2c
         cAGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=js5CcSy/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n20si2592354ybh.741.2017.12.18.10.58.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 10:58:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=js5CcSy/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54976 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eR0cF-00009d-G9
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 13:58:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUm-0008WD-8H
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUj-0002LY-MY
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:32 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:40363)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzUj-0002KF-H1
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:29 -0500
Received: by mail-pl0-x242.google.com with SMTP id 62so3801534pld.7
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Hy9sfhMkBpSM5NImxVV6CJzkqzQztXElQhyddscya8E=;
	b=js5CcSy/+ldsVuSGma86YoKPXqco6HnLHfqma6ID6qBym4j1UumxmNZaGd1+jsYO8L
	ya30embRUCOFxxpeOU6NJQj5/L/xhzwjv4Mm9ejP4khGSu+QUPWo/V7aDDVKEnjlef4N
	dU5apt02G1VB4r02hH2Fs9fO+TyKGMkgssiZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Hy9sfhMkBpSM5NImxVV6CJzkqzQztXElQhyddscya8E=;
	b=Av8iXJ4mB2BM68+YNuz9gF1MrITAXiXL6gj3u/4Ve1EnpZHKracMEU3bzLJAH4xGJI
	5UCrBBOlTAAdnximAN0hOKYfEKxJmVC6BslEhZbGzbGxhkuMvqyoznKeKvKqBllePwk6
	eIJ/mCQkuf8abMxUepibm9Z/ngmzVW7qBRR+K60GSbn6JtDWt/s9+K8BRwsATX09+J4s
	iU34/F9xyXK492xXaNPIZFuP/TWiKZs7Xdk6uW8DdEklgZYyIHlUHgamAKWZu/bqCUrB
	NCIBcFRD/OqIj43OXdDIU9XN2EhQ+r6gA8SWjrDAOU02SfGfIfYxW45OKZERCD+Ah2T+
	hdJg==
X-Gm-Message-State: AKGB3mLuMho7F2qmlZgVFQYTY7cXTT3u0Cd5sc8/ANPwDEGLvOZVjfVm
	g9W3zrvGB+OkrJEXIxakGnLBYA==
X-Received: by 10.84.129.7 with SMTP id 7mr512016plb.104.1513619188594;
	Mon, 18 Dec 2017 09:46:28 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	t84sm26209657pfe.160.2017.12.18.09.46.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:46:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:45:51 -0800
Message-Id: <20171218174552.18871-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218174552.18871-1-richard.henderson@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH 22/23] target/arm: Implement SVE floating-point
 trig select coefficient
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
X-TUID: 0zN6KzH+HT+U

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  4 ++++
 target/arm/sve_helper.c    | 42 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 19 +++++++++++++++++++
 target/arm/sve.def         |  3 +++
 4 files changed, 68 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index c72ae3390f..ccf5405d63 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -383,6 +383,10 @@ DEF_HELPER_FLAGS_3(sve_fexpa_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_fexpa_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_fexpa_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_ftssel_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_ftssel_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_ftssel_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pred, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pred, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pred, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 936a6ec648..5341f6d0e5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1104,6 +1104,48 @@ void HELPER(sve_fexpa_d)(void *vd, void *vn, uint32_t desc)
     }
 }
 
+void HELPER(sve_ftssel_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 2;
+    uint16_t *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i += 1) {
+        uint16_t nn = n[i];
+        uint16_t mm = m[i];
+        if (mm & 1) {
+            nn = float16_one;
+        }
+        d[i] = nn ^ (mm & 2) << 14;
+    }
+}
+
+void HELPER(sve_ftssel_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 4;
+    uint32_t *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i += 1) {
+        uint32_t nn = n[i];
+        uint32_t mm = m[i];
+        if (mm & 1) {
+            nn = float32_one;
+        }
+        d[i] = nn ^ (mm & 2) << 30;
+    }
+}
+
+void HELPER(sve_ftssel_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i += 1) {
+        uint64_t nn = n[i];
+        uint64_t mm = m[i];
+        if (mm & 1) {
+            nn = float64_one;
+        }
+        d[i] = nn ^ (mm & 2) << 62;
+    }
+}
+
 void HELPER(sve_ldr)(CPUARMState *env, void *d, target_ulong addr, uint32_t len)
 {
     intptr_t i, len_align = QEMU_ALIGN_DOWN(len, 8);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b671462611..a6c31e0e9c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -757,6 +757,25 @@ void trans_FEXPA(DisasContext *s, arg_rr_esz *a, uint32_t insn)
                        vsz, vsz, 0, fns[a->esz]);
 }
 
+void trans_FTSSEL(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        NULL,
+        gen_helper_sve_ftssel_h,
+        gen_helper_sve_ftssel_s,
+        gen_helper_sve_ftssel_d,
+    };
+    unsigned vsz = size_for_gvec(vec_full_reg_size(s));
+    if (a->esz == 0) {
+        unallocated_encoding(s);
+        return;
+    }
+    tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       vec_full_reg_offset(s, a->rm),
+                       vsz, vsz, 0, fns[a->esz]);
+}
+
 static uint64_t pred_esz_mask[4] = {
     0xffffffffffffffffull, 0x5555555555555555ull,
     0x1111111111111111ull, 0x0101010101010101ull
diff --git a/target/arm/sve.def b/target/arm/sve.def
index c0fc8b7665..df2730eb73 100644
--- a/target/arm/sve.def
+++ b/target/arm/sve.def
@@ -272,6 +272,9 @@ ADR_p64			00000100 11 1 ..... 1010 .. ..... .....		@rd_rn_msz_rm
 # SVE floating-point exponential accelerator
 FEXPA			00000100 .. 1 00000 101110 ..... .....		@rd_rn_esz # Note size != 0
 
+# SVE floating-point trig select coefficient
+FTSSEL			00000100 .. 1 ..... 101100 ..... .....		@rd_rn_rm_esz # Note size != 0
+
 ### SVE Predicate Generation Group
 
 # SVE initialize predicate (PTRUE, PTRUES)
-- 
2.14.3

