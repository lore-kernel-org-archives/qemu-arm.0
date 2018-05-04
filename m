Received: by 10.28.4.212 with SMTP id 203csp337369wme;
        Fri, 4 May 2018 11:35:09 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrmk+e5Hwl5cbqDXQEWNl4ksELi60obO/4+YkNZAaRoqxDqS/NoxoTHcoBexEVPJCcEbUd7
X-Received: by 10.55.201.151 with SMTP id m23mr22965869qkl.372.1525458908930;
        Fri, 04 May 2018 11:35:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525458908; cv=none;
        d=google.com; s=arc-20160816;
        b=YoABH/fg66Hmq3XIeam86XFE1frvmMewvD+6K1zj9r2hLzKa/EkVuQaYq6OxzQklNN
         A3r2FqCEBSVrua/iI+6vkS0hXgYwwvyPRZ19Eliyj0P/NpXd53bwWq0+RYjnDoykTHkh
         1y7LN+Rks3lE5+TzUCuCct6kAld4cC0wCHLk9qovwLZGbQa1ZVBVqvKW6tD4MLNWN730
         wfX2aLgx61XudvJvjGJVkPfSzFOsHt/5vtZVi/Rtsu2cNzJLFNGe2Lrl39sMyLHDRU3O
         J9+iygx08sla4UzZ7stqc/Vi+UYufn1Nxq/GvTyCDqrrkIJnyFhDmVjINjp3k70hKJm/
         6RQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ThPvhn6D+UVVPyfam//ZDBRKSjR9Wis18Q00SIwCn4E=;
        b=AstKgm0U+iS28fQN7hrwRcJNPpAippaW+GNVOOpoC+JeeDYxIGcFDyYhihknk2fO3R
         PF46V4QwRbtBcBviXb1nBMQKM1DezUgMqHj8peeMyt04UfFrkOncn4fDIwkhpcLBJcQe
         w0UPVG7fJzq5w1TxB/OWNzeC5sNn5c4V0Qw3w0/jZj70A5T3itLq8VsrGzFQCdk3ES8y
         LEu8YuEkJRGJ0+ehLlmRmZ4cWBP906I8qWSYGiTkKCJIe4yrk0caMlkajivuHZxv5TvE
         xS7B9j/tl5Y4k2AjOs6Rk4Zm7bhCpOHifjbsHUQx4fkKWbj3wgN4FI+crC6ITFs2qAQW
         Icrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X9KfoqKq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i51-v6si10283588qta.358.2018.05.04.11.35.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 11:35:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X9KfoqKq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35996 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEfXw-0002dM-Et
	for alex.bennee@linaro.org; Fri, 04 May 2018 14:35:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTZ-0007b3-Cz
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTX-0001DA-QE
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:37 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:34097)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fEfTX-0001CZ-Kc
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:35 -0400
Received: by mail-pf0-x241.google.com with SMTP id a14so18092108pfi.1
	for <qemu-arm@nongnu.org>; Fri, 04 May 2018 11:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ThPvhn6D+UVVPyfam//ZDBRKSjR9Wis18Q00SIwCn4E=;
	b=X9KfoqKqpbum7f63Qqa7Y6q2RS+TNVn2kvWZljpyJvM+1KDguuQbSwdZ/hpL2rymMD
	hVkq3afSZKgWMuTCX1MObOInefrq0F8QZgw0dKqiKavmQdXZ17ac+8OBKC0DYS+sBvsP
	a8NVHveBbovW5hyLqBYVif7HxOz++r24B8QzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ThPvhn6D+UVVPyfam//ZDBRKSjR9Wis18Q00SIwCn4E=;
	b=R4tP27GozkSPL4YfjelHIyNawG/fAWnmxdJDgz0gOyiECwG+t49IyZebdEsyWCA6EC
	2L6e2kKiHFD/PVMVxeLZDHNH7XcAi+V1fj8IeYcJ3LSSL9Eu5oe9wiYSUxZF35sOGJpW
	XtyEU2wbDXFkzgdaS+4a32wQ58mwSd8n+mBuelfg4mfPt59e5FG9tKA7HW7TuKTe3pIR
	KoBXOWpEQCk3uZf6Z4dVcAWIg0rvaV40SYDhiO9YBkr91jxBej0BY+zk6Wr3MKGE3Ccs
	YoVUYvrNNxWPXK7shUlF4BE1uQuhcEweL924OpppwP3ZUZgFZ/6zUVIjQPvgFdKRoTGQ
	Qz3Q==
X-Gm-Message-State: ALQs6tAlqyatHYc1+4jZBf+nnWnfgE+pKrqLZULuX0h9wNwwONnBgee2
	C6Kt3gZClIpHrYuAdYV+FVtoHg==
X-Received: by 2002:a17:902:a60d:: with SMTP id
	u13-v6mr10205339plq.40.1525458634738; 
	Fri, 04 May 2018 11:30:34 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	r8-v6sm16987413pgn.2.2018.05.04.11.30.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 04 May 2018 11:30:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  4 May 2018 11:30:19 -0700
Message-Id: <20180504183021.19318-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180504183021.19318-1-richard.henderson@linaro.org>
References: <20180504183021.19318-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v2 08/10] target/arm: Fill in disas_ldst_atomic
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
X-TUID: SMx6rGOkigPA

This implements all of the v8.1-Atomics instructions except
for compare-and-swap, which is decoded elsewhere.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 6acad791e6..5af6028089 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -84,6 +84,7 @@ typedef void NeonGenOneOpFn(TCGv_i64, TCGv_i64);
 typedef void CryptoTwoOpFn(TCGv_ptr, TCGv_ptr);
 typedef void CryptoThreeOpIntFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void CryptoThreeOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
+typedef void AtomicThreeOpFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGArg, TCGMemOp);
 
 /* Note that the gvec expanders operate on offsets + sizes.  */
 typedef void GVecGen2Fn(unsigned, uint32_t, uint32_t, uint32_t, uint32_t);
@@ -2772,6 +2773,8 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     int rn = extract32(insn, 5, 5);
     int o3_opc = extract32(insn, 12, 4);
     int feature = ARM_FEATURE_V8_ATOMICS;
+    TCGv_i64 tcg_rn, tcg_rs;
+    AtomicThreeOpFn *fn;
 
     if (is_vector) {
         unallocated_encoding(s);
@@ -2779,14 +2782,32 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     }
     switch (o3_opc) {
     case 000: /* LDADD */
+        fn = tcg_gen_atomic_fetch_add_i64;
+        break;
     case 001: /* LDCLR */
+        fn = tcg_gen_atomic_fetch_and_i64;
+        break;
     case 002: /* LDEOR */
+        fn = tcg_gen_atomic_fetch_xor_i64;
+        break;
     case 003: /* LDSET */
+        fn = tcg_gen_atomic_fetch_or_i64;
+        break;
     case 004: /* LDSMAX */
+        fn = tcg_gen_atomic_fetch_smax_i64;
+        break;
     case 005: /* LDSMIN */
+        fn = tcg_gen_atomic_fetch_smin_i64;
+        break;
     case 006: /* LDUMAX */
+        fn = tcg_gen_atomic_fetch_umax_i64;
+        break;
     case 007: /* LDUMIN */
+        fn = tcg_gen_atomic_fetch_umin_i64;
+        break;
     case 010: /* SWP */
+        fn = tcg_gen_atomic_xchg_i64;
+        break;
     default:
         unallocated_encoding(s);
         return;
@@ -2796,8 +2817,21 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
         return;
     }
 
-    (void)rs;
-    (void)rn;
+    if (rn == 31) {
+        gen_check_sp_alignment(s);
+    }
+    tcg_rn = cpu_reg_sp(s, rn);
+    tcg_rs = read_cpu_reg(s, rs, false);
+
+    if (o3_opc == 1) { /* LDCLR */
+        tcg_gen_not_i64(tcg_rs, tcg_rs);
+    }
+
+    /* The tcg atomic primitives are all full barriers.  Therefore we
+     * can ignore the Acquire and Release bits of this instruction.
+     */
+    fn(cpu_reg(s, rt), tcg_rn, tcg_rs, get_mem_index(s),
+       s->be_data | size | MO_ALIGN);
 }
 
 /* Load/store register (all forms) */
-- 
2.14.3

