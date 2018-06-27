Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5770118wrq;
        Tue, 26 Jun 2018 21:34:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpduQ/tw8tjppylQknwJyUiLEo9gUFewDtAloKV2S0hbQi3QUoGRr4s/nOSEWMPxTOKEAIL9
X-Received: by 2002:a37:91c3:: with SMTP id t186-v6mr3974878qkd.37.1530074069984;
        Tue, 26 Jun 2018 21:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530074069; cv=none;
        d=google.com; s=arc-20160816;
        b=UiDXGPz7VKsuFgyAtySDq+MhYZDLB/zDqEIX8Obc4Xxy7RKJfX8QhKjinPx1WT6DMq
         1gIc9SoANsJwmPXSmXT/nWaa+/ZbybNiQ6VYGciPuPXozasGrEvYhXFPWfYTndumQZXp
         GRxKjoR+c8ZwJqlokuvuRKtIWiL1YBUE2vBrDm2HHvmcGnL6DfZcDFwjUD/kk4bqq4h3
         UKQUGErpOSwnaC70k9VIuuzG+zbObwZDH35AgESHUHc/oqo4a+O96A4Zd4U4ocG3EMia
         INl+WUHdYGfN5TPYI1cSbCCQEiQ6Ayr86gYM8o9kWeocwhmp8/qu3Pm2ybN0nZkNrwJH
         2a/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=1PmEgwZlFp9xc2QDjoVForQzcOsUldcvf0BP0dIYBDg=;
        b=uQnk7vxxxCcTuLENWpATJbpx43yIHyJKu7oeRHwKzL995gN7cDHm8AYzYwy3pFNX5L
         rU+nUo2+IR2i1XPJ6OALwZ/x5+8jvf5FuPUpBV2Ad1Mm4ukxqG2GtPuffUI06GlPe8CA
         /8lFiRxmdeDM/VX0der3yw3BwgiCbDth2z3+lOnPHX2aT+Iqc8xS7Cd0LcAXvYu7xmzm
         gNRDcYjgHNoFs+YRzBspYdFyHj1pI8J18yqREtrxCGw+QZ3o3+uWwwOuF7OP/efhbtMm
         jE+IepZ7mcXiTqCZ2M2td3ZA1g486k+2EWhkG0kLu0951yUxSofVCAKe5hpbhVhmMkax
         aSWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xih5B190;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t6-v6si1556979qtc.298.2018.06.26.21.34.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:34:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xih5B190;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2A1-000494-CM
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:34:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29D-00043T-Km
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:33:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29B-0008VV-4N
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:33:39 -0400
Received: from mail-pf0-x234.google.com ([2607:f8b0:400e:c00::234]:41882)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29A-0008U9-SO
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:33:37 -0400
Received: by mail-pf0-x234.google.com with SMTP id a11-v6so384373pff.8
	for <qemu-devel@nongnu.org>; Tue, 26 Jun 2018 21:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1PmEgwZlFp9xc2QDjoVForQzcOsUldcvf0BP0dIYBDg=;
	b=Xih5B1904RpiA+W3+qBMs2TofChGjvBKbCgin1ecabqgtt/V6Vm3Urv3QzxC6R4EuR
	1y+B5RIF28j7iuM5i6d8cXZau/FRCu/oX8zxvui++6Ze+NL0flr/lyZwoV0BjVExYnhL
	D8bpdUhe6pSYhknNSQwE1vdtlA3zgTdtx+wTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1PmEgwZlFp9xc2QDjoVForQzcOsUldcvf0BP0dIYBDg=;
	b=irjVnxXwOK0YFOaErdnXJprUR0TxjyFEkQg7IEF0yT8I/g/pOHjKJyOXb1U+R9DZnn
	DsGVJapcgD5bgrKDm2qzvAA67w2gQZ2vEG+ha16Nj+bogWHZ3pbz2OuGlMMJ+peR8E4h
	L+wfJNonl93VSaCBPS4vpGiu76adCx3GdK74R6fE36dhPInNxMn8yd2pASY+hsGkvxV+
	IbEaiPinhrfIm7eVEtS9SjTeNDCDR48j2p/LiqJXf/r7NSwikhjmOh+P8jSLHgjLm8d6
	FwtGRgD5fHr+ctzCSy0QU2jN1YwJ8PtJEp21TQkMKb95R4HgW5g3x53/Y1963RiCw4CS
	SJpA==
X-Gm-Message-State: APt69E06eSwSKY1rFpkQy0tIOjsS8brx8+naTeOss6pGoFwP+uqK1nvw
	v7FqkxUWlKeHPQU6XJ9llCnFaI0vs4Y=
X-Received: by 2002:a63:6501:: with SMTP id
	z1-v6mr3746667pgb.452.1530074015511; 
	Tue, 26 Jun 2018 21:33:35 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.33.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:33:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:32:56 -0700
Message-Id: <20180627043328.11531-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::234
Subject: [Qemu-devel] [PATCH v6 03/35] target/arm: Implement SVE Memory
 Contiguous Store Group
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tedZ57/rEdLg

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  29 +++++
 target/arm/sve_helper.c    | 211 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  65 ++++++++++++
 target/arm/sve.decode      |  38 +++++++
 4 files changed, 343 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 7338abbbcf..b768128951 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -794,3 +794,32 @@ DEF_HELPER_FLAGS_4(sve_ldnf1sdu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ldnf1sds_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 
 DEF_HELPER_FLAGS_4(sve_ldnf1dd_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_st1bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st2bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st3bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st4bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_st1hh_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st2hh_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st3hh_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st4hh_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_st1ss_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st2ss_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st3ss_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st4ss_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_st1dd_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st2dd_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st3dd_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st4dd_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_st1bh_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st1bs_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st1bd_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_st1hs_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st1hd_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_st1sd_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 0d22a57a22..bd874e6fa2 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3120,3 +3120,214 @@ DO_LDNF1(sds_r)
 DO_LDNF1(dd_r)
 
 #undef DO_LDNF1
+
+/*
+ * Store contiguous data, protected by a governing predicate.
+ */
+#define DO_ST1(NAME, FN, TYPEE, TYPEM, H)                  \
+void HELPER(NAME)(CPUARMState *env, void *vg,              \
+                  target_ulong addr, uint32_t desc)        \
+{                                                          \
+    intptr_t i, oprsz = simd_oprsz(desc);                  \
+    intptr_t ra = GETPC();                                 \
+    unsigned rd = simd_data(desc);                         \
+    void *vd = &env->vfp.zregs[rd];                        \
+    for (i = 0; i < oprsz; ) {                             \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));    \
+        do {                                               \
+            if (pg & 1) {                                  \
+                TYPEM m = *(TYPEE *)(vd + H(i));           \
+                FN(env, addr, m, ra);                      \
+            }                                              \
+            i += sizeof(TYPEE), pg >>= sizeof(TYPEE);      \
+            addr += sizeof(TYPEM);                         \
+        } while (i & 15);                                  \
+    }                                                      \
+}
+
+#define DO_ST1_D(NAME, FN, TYPEM)                          \
+void HELPER(NAME)(CPUARMState *env, void *vg,              \
+                  target_ulong addr, uint32_t desc)        \
+{                                                          \
+    intptr_t i, oprsz = simd_oprsz(desc) / 8;              \
+    intptr_t ra = GETPC();                                 \
+    unsigned rd = simd_data(desc);                         \
+    uint64_t *d = &env->vfp.zregs[rd].d[0];                \
+    uint8_t *pg = vg;                                      \
+    for (i = 0; i < oprsz; i += 1) {                       \
+        if (pg[H1(i)] & 1) {                               \
+            FN(env, addr, d[i], ra);                       \
+        }                                                  \
+        addr += sizeof(TYPEM);                             \
+    }                                                      \
+}
+
+#define DO_ST2(NAME, FN, TYPEE, TYPEM, H)                  \
+void HELPER(NAME)(CPUARMState *env, void *vg,              \
+                  target_ulong addr, uint32_t desc)        \
+{                                                          \
+    intptr_t i, oprsz = simd_oprsz(desc);                  \
+    intptr_t ra = GETPC();                                 \
+    unsigned rd = simd_data(desc);                         \
+    void *d1 = &env->vfp.zregs[rd];                        \
+    void *d2 = &env->vfp.zregs[(rd + 1) & 31];             \
+    for (i = 0; i < oprsz; ) {                             \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));    \
+        do {                                               \
+            if (pg & 1) {                                  \
+                TYPEM m1 = *(TYPEE *)(d1 + H(i));          \
+                TYPEM m2 = *(TYPEE *)(d2 + H(i));          \
+                FN(env, addr, m1, ra);                     \
+                FN(env, addr + sizeof(TYPEM), m2, ra);     \
+            }                                              \
+            i += sizeof(TYPEE), pg >>= sizeof(TYPEE);      \
+            addr += 2 * sizeof(TYPEM);                     \
+        } while (i & 15);                                  \
+    }                                                      \
+}
+
+#define DO_ST3(NAME, FN, TYPEE, TYPEM, H)                  \
+void HELPER(NAME)(CPUARMState *env, void *vg,              \
+                  target_ulong addr, uint32_t desc)        \
+{                                                          \
+    intptr_t i, oprsz = simd_oprsz(desc);                  \
+    intptr_t ra = GETPC();                                 \
+    unsigned rd = simd_data(desc);                         \
+    void *d1 = &env->vfp.zregs[rd];                        \
+    void *d2 = &env->vfp.zregs[(rd + 1) & 31];             \
+    void *d3 = &env->vfp.zregs[(rd + 2) & 31];             \
+    for (i = 0; i < oprsz; ) {                             \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));    \
+        do {                                               \
+            if (pg & 1) {                                  \
+                TYPEM m1 = *(TYPEE *)(d1 + H(i));          \
+                TYPEM m2 = *(TYPEE *)(d2 + H(i));          \
+                TYPEM m3 = *(TYPEE *)(d3 + H(i));          \
+                FN(env, addr, m1, ra);                     \
+                FN(env, addr + sizeof(TYPEM), m2, ra);     \
+                FN(env, addr + 2 * sizeof(TYPEM), m3, ra); \
+            }                                              \
+            i += sizeof(TYPEE), pg >>= sizeof(TYPEE);      \
+            addr += 3 * sizeof(TYPEM);                     \
+        } while (i & 15);                                  \
+    }                                                      \
+}
+
+#define DO_ST4(NAME, FN, TYPEE, TYPEM, H)                  \
+void HELPER(NAME)(CPUARMState *env, void *vg,              \
+                  target_ulong addr, uint32_t desc)        \
+{                                                          \
+    intptr_t i, oprsz = simd_oprsz(desc);                  \
+    intptr_t ra = GETPC();                                 \
+    unsigned rd = simd_data(desc);                         \
+    void *d1 = &env->vfp.zregs[rd];                        \
+    void *d2 = &env->vfp.zregs[(rd + 1) & 31];             \
+    void *d3 = &env->vfp.zregs[(rd + 2) & 31];             \
+    void *d4 = &env->vfp.zregs[(rd + 3) & 31];             \
+    for (i = 0; i < oprsz; ) {                             \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));    \
+        do {                                               \
+            if (pg & 1) {                                  \
+                TYPEM m1 = *(TYPEE *)(d1 + H(i));          \
+                TYPEM m2 = *(TYPEE *)(d2 + H(i));          \
+                TYPEM m3 = *(TYPEE *)(d3 + H(i));          \
+                TYPEM m4 = *(TYPEE *)(d4 + H(i));          \
+                FN(env, addr, m1, ra);                     \
+                FN(env, addr + sizeof(TYPEM), m2, ra);     \
+                FN(env, addr + 2 * sizeof(TYPEM), m3, ra); \
+                FN(env, addr + 3 * sizeof(TYPEM), m4, ra); \
+            }                                              \
+            i += sizeof(TYPEE), pg >>= sizeof(TYPEE);      \
+            addr += 4 * sizeof(TYPEM);                     \
+        } while (i & 15);                                  \
+    }                                                      \
+}
+
+DO_ST1(sve_st1bh_r, cpu_stb_data_ra, uint16_t, uint8_t, H1_2)
+DO_ST1(sve_st1bs_r, cpu_stb_data_ra, uint32_t, uint8_t, H1_4)
+DO_ST1_D(sve_st1bd_r, cpu_stb_data_ra, uint8_t)
+
+DO_ST1(sve_st1hs_r, cpu_stw_data_ra, uint32_t, uint16_t, H1_4)
+DO_ST1_D(sve_st1hd_r, cpu_stw_data_ra, uint16_t)
+
+DO_ST1_D(sve_st1sd_r, cpu_stl_data_ra, uint32_t)
+
+DO_ST1(sve_st1bb_r, cpu_stb_data_ra, uint8_t, uint8_t, H1)
+DO_ST2(sve_st2bb_r, cpu_stb_data_ra, uint8_t, uint8_t, H1)
+DO_ST3(sve_st3bb_r, cpu_stb_data_ra, uint8_t, uint8_t, H1)
+DO_ST4(sve_st4bb_r, cpu_stb_data_ra, uint8_t, uint8_t, H1)
+
+DO_ST1(sve_st1hh_r, cpu_stw_data_ra, uint16_t, uint16_t, H1_2)
+DO_ST2(sve_st2hh_r, cpu_stw_data_ra, uint16_t, uint16_t, H1_2)
+DO_ST3(sve_st3hh_r, cpu_stw_data_ra, uint16_t, uint16_t, H1_2)
+DO_ST4(sve_st4hh_r, cpu_stw_data_ra, uint16_t, uint16_t, H1_2)
+
+DO_ST1(sve_st1ss_r, cpu_stl_data_ra, uint32_t, uint32_t, H1_4)
+DO_ST2(sve_st2ss_r, cpu_stl_data_ra, uint32_t, uint32_t, H1_4)
+DO_ST3(sve_st3ss_r, cpu_stl_data_ra, uint32_t, uint32_t, H1_4)
+DO_ST4(sve_st4ss_r, cpu_stl_data_ra, uint32_t, uint32_t, H1_4)
+
+DO_ST1_D(sve_st1dd_r, cpu_stq_data_ra, uint64_t)
+
+void HELPER(sve_st2dd_r)(CPUARMState *env, void *vg,
+                         target_ulong addr, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc) / 8;
+    intptr_t ra = GETPC();
+    unsigned rd = simd_data(desc);
+    uint64_t *d1 = &env->vfp.zregs[rd].d[0];
+    uint64_t *d2 = &env->vfp.zregs[(rd + 1) & 31].d[0];
+    uint8_t *pg = vg;
+
+    for (i = 0; i < oprsz; i += 1) {
+        if (pg[H1(i)] & 1) {
+            cpu_stq_data_ra(env, addr, d1[i], ra);
+            cpu_stq_data_ra(env, addr + 8, d2[i], ra);
+        }
+        addr += 2 * 8;
+    }
+}
+
+void HELPER(sve_st3dd_r)(CPUARMState *env, void *vg,
+                         target_ulong addr, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc) / 8;
+    intptr_t ra = GETPC();
+    unsigned rd = simd_data(desc);
+    uint64_t *d1 = &env->vfp.zregs[rd].d[0];
+    uint64_t *d2 = &env->vfp.zregs[(rd + 1) & 31].d[0];
+    uint64_t *d3 = &env->vfp.zregs[(rd + 2) & 31].d[0];
+    uint8_t *pg = vg;
+
+    for (i = 0; i < oprsz; i += 1) {
+        if (pg[H1(i)] & 1) {
+            cpu_stq_data_ra(env, addr, d1[i], ra);
+            cpu_stq_data_ra(env, addr + 8, d2[i], ra);
+            cpu_stq_data_ra(env, addr + 16, d3[i], ra);
+        }
+        addr += 3 * 8;
+    }
+}
+
+void HELPER(sve_st4dd_r)(CPUARMState *env, void *vg,
+                         target_ulong addr, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc) / 8;
+    intptr_t ra = GETPC();
+    unsigned rd = simd_data(desc);
+    uint64_t *d1 = &env->vfp.zregs[rd].d[0];
+    uint64_t *d2 = &env->vfp.zregs[(rd + 1) & 31].d[0];
+    uint64_t *d3 = &env->vfp.zregs[(rd + 2) & 31].d[0];
+    uint64_t *d4 = &env->vfp.zregs[(rd + 3) & 31].d[0];
+    uint8_t *pg = vg;
+
+    for (i = 0; i < oprsz; i += 1) {
+        if (pg[H1(i)] & 1) {
+            cpu_stq_data_ra(env, addr, d1[i], ra);
+            cpu_stq_data_ra(env, addr + 8, d2[i], ra);
+            cpu_stq_data_ra(env, addr + 16, d3[i], ra);
+            cpu_stq_data_ra(env, addr + 24, d4[i], ra);
+        }
+        addr += 4 * 8;
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 09f77b5405..b25fe96b77 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3716,3 +3716,68 @@ static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a, uint32_t insn)
     }
     return true;
 }
+
+static void do_st_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
+                      int msz, int esz, int nreg)
+{
+    static gen_helper_gvec_mem * const fn_single[4][4] = {
+        { gen_helper_sve_st1bb_r, gen_helper_sve_st1bh_r,
+          gen_helper_sve_st1bs_r, gen_helper_sve_st1bd_r },
+        { NULL,                   gen_helper_sve_st1hh_r,
+          gen_helper_sve_st1hs_r, gen_helper_sve_st1hd_r },
+        { NULL, NULL,
+          gen_helper_sve_st1ss_r, gen_helper_sve_st1sd_r },
+        { NULL, NULL, NULL, gen_helper_sve_st1dd_r },
+    };
+    static gen_helper_gvec_mem * const fn_multiple[3][4] = {
+        { gen_helper_sve_st2bb_r, gen_helper_sve_st2hh_r,
+          gen_helper_sve_st2ss_r, gen_helper_sve_st2dd_r },
+        { gen_helper_sve_st3bb_r, gen_helper_sve_st3hh_r,
+          gen_helper_sve_st3ss_r, gen_helper_sve_st3dd_r },
+        { gen_helper_sve_st4bb_r, gen_helper_sve_st4hh_r,
+          gen_helper_sve_st4ss_r, gen_helper_sve_st4dd_r },
+    };
+    gen_helper_gvec_mem *fn;
+
+    if (nreg == 0) {
+        /* ST1 */
+        fn = fn_single[msz][esz];
+    } else {
+        /* ST2, ST3, ST4 -- msz == esz, enforced by encoding */
+        assert(msz == esz);
+        fn = fn_multiple[nreg - 1][msz];
+    }
+    assert(fn != NULL);
+    do_mem_zpa(s, zt, pg, addr, fn);
+}
+
+static bool trans_ST_zprr(DisasContext *s, arg_rprr_store *a, uint32_t insn)
+{
+    if (a->rm == 31 || a->msz > a->esz) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        TCGv_i64 addr = new_tmp_a64(s);
+        tcg_gen_muli_i64(addr, cpu_reg(s, a->rm), (a->nreg + 1) << a->msz);
+        tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
+        do_st_zpa(s, a->rd, a->pg, addr, a->msz, a->esz, a->nreg);
+    }
+    return true;
+}
+
+static bool trans_ST_zpri(DisasContext *s, arg_rpri_store *a, uint32_t insn)
+{
+    if (a->msz > a->esz) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        int vsz = vec_full_reg_size(s);
+        int elements = vsz >> a->esz;
+        TCGv_i64 addr = new_tmp_a64(s);
+
+        tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn),
+                         (a->imm * elements * (a->nreg + 1)) << a->msz);
+        do_st_zpa(s, a->rd, a->pg, addr, a->msz, a->esz, a->nreg);
+    }
+    return true;
+}
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index afbed57de1..6e159faaec 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -27,6 +27,7 @@
 %imm7_22_16     22:2 16:5
 %imm8_16_10     16:5 10:3
 %imm9_16_10     16:s6 10:3
+%size_23        23:2
 
 # A combination of tsz:imm3 -- extract esize.
 %tszimm_esz     22:2 5:5 !function=tszimm_esz
@@ -76,6 +77,8 @@
 &incdec2_pred   rd rn pg esz d u
 &rprr_load      rd pg rn rm dtype nreg
 &rpri_load      rd pg rn imm dtype nreg
+&rprr_store     rd pg rn rm msz esz nreg
+&rpri_store     rd pg rn imm msz esz nreg
 
 ###########################################################################
 # Named instruction formats.  These are generally used to
@@ -184,6 +187,12 @@
 @rpri_load_msz  ....... .... . imm:s4 ... pg:3 rn:5 rd:5 \
                 &rpri_load dtype=%msz_dtype
 
+# Stores; user must fill in ESZ, MSZ, NREG as needed.
+@rprr_store         ....... ..    ..     rm:5 ... pg:3 rn:5 rd:5    &rprr_store
+@rpri_store_msz     ....... msz:2 .. . imm:s4 ... pg:3 rn:5 rd:5    &rpri_store
+@rprr_store_esz_n0  ....... ..    esz:2  rm:5 ... pg:3 rn:5 rd:5 \
+                    &rprr_store nreg=0
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -705,3 +714,32 @@ LD_zprr         1010010 .. nreg:2 ..... 110 ... ..... .....     @rprr_load_msz
 # SVE load multiple structures (scalar plus immediate)
 # LD2B, LD2H, LD2W, LD2D; etc.
 LD_zpri         1010010 .. nreg:2 0.... 111 ... ..... .....     @rpri_load_msz
+
+### SVE Memory Store Group
+
+# SVE contiguous store (scalar plus immediate)
+# ST1B, ST1H, ST1W, ST1D; require msz <= esz
+ST_zpri         1110010 .. esz:2  0.... 111 ... ..... ..... \
+                @rpri_store_msz nreg=0
+
+# SVE contiguous store (scalar plus scalar)
+# ST1B, ST1H, ST1W, ST1D; require msz <= esz
+# Enumerate msz lest we conflict with STR_zri.
+ST_zprr         1110010 00 ..     ..... 010 ... ..... ..... \
+                @rprr_store_esz_n0 msz=0
+ST_zprr         1110010 01 ..     ..... 010 ... ..... ..... \
+                @rprr_store_esz_n0 msz=1
+ST_zprr         1110010 10 ..     ..... 010 ... ..... ..... \
+                @rprr_store_esz_n0 msz=2
+ST_zprr         1110010 11 11     ..... 010 ... ..... ..... \
+                @rprr_store msz=3 esz=3 nreg=0
+
+# SVE contiguous non-temporal store (scalar plus immediate)  (nreg == 0)
+# SVE store multiple structures (scalar plus immediate)      (nreg != 0)
+ST_zpri         1110010 .. nreg:2 1.... 111 ... ..... ..... \
+                @rpri_store_msz esz=%size_23
+
+# SVE contiguous non-temporal store (scalar plus scalar)     (nreg == 0)
+# SVE store multiple structures (scalar plus scalar)         (nreg != 0)
+ST_zprr         1110010 msz:2 nreg:2 ..... 011 ... ..... ..... \
+                @rprr_store esz=%size_23
-- 
2.17.1

