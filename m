Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp208718wme;
        Wed, 16 May 2018 15:41:26 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZooVTwTK4e+ThCh9hM0K7b4ZsnKRsAZn80igMO6NkZLTw4fOujukvaI5CWnafNZuhXSf84q
X-Received: by 2002:aed:2501:: with SMTP id v1-v6mr3167594qtc.66.1526510486415;
        Wed, 16 May 2018 15:41:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526510486; cv=none;
        d=google.com; s=arc-20160816;
        b=PmU1hVf8+3XkTfBjsEB1cBu3iEL+/1iLwBbKI138zpq+aYfn+1jVCraLwL8EFJvs3H
         6pjZ9DTBD/D7qnOpeOR8Lk5iaXOgjjeqmyvRl0SlXAusKNBpgnkCjjcyVgO5hpOvubx/
         6BRV24arcU+UhKiVMHj49JnvaSjPpayVwQZB4OWGYXEMeCSpuE/ktI0CjLxqe0LCM0I9
         T5aJFopIlW5mJhntLUaucEAIbbvRxtBIhSG1FWhL/FOCkss2hKoWmjzi/KKpD5ewUmw/
         dfz+6gUAcx7s7ciU52UKAUJMlz/E0J8JEBKhCD10dSzuB3rqASC8bIN50pZkLRodpS5W
         A0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=7AC5updE5bB1Jshy6R6nMxGYJxwwQEY9qKd1RRimZss=;
        b=0g6zedp/SUdHWBbM4Vf5BhIIRJfjyzbTYJN8B5bqdiMWGMGEtehm48rwf6HSu3UQLj
         N+7Ga1keEzHqhzumsOZM6oXHVVBcTCYlRt1f+5CaJatwrBf7TZK6MS1nQhMU5gmyn9Q+
         IZBbQ2hNRby77cqqo/bb1OZss+I/sLithYYLROI0kbdW+VOzUbUhjuSEIvxnEF/khfR9
         oN2gCoOaz4jK73a0rkPG7sWf7ZtKfweEsD8XDy+G3j0TKhrTe7xfiFk2xL6D2u55WZqB
         DpyLOlSYHkLnU86kEdnxbaO1I6evbjRRzgoX1GmJCK8lqdXG8kjmiKB9Ki+sb2vhi01J
         lSfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OjMGal06;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g16-v6si3539091qtp.109.2018.05.16.15.41.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 15:41:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OjMGal06;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ56r-0007p1-QA
	for alex.bennee@linaro.org; Wed, 16 May 2018 18:41:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wH-0007fI-5p
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wE-0007St-VI
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:29 -0400
Received: from mail-pl0-x22b.google.com ([2607:f8b0:400e:c01::22b]:34891)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJ4wE-0007SA-GX
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:26 -0400
Received: by mail-pl0-x22b.google.com with SMTP id i5-v6so1250971plt.2
	for <qemu-arm@nongnu.org>; Wed, 16 May 2018 15:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7AC5updE5bB1Jshy6R6nMxGYJxwwQEY9qKd1RRimZss=;
	b=OjMGal069Gg8pw/fkouqzNKR03SyapZ936TQllcqya1dAwMFbtkfjalaDyAnpvx4hs
	tHXjS5PCUG5ow5UPhJpKIb638Vf2XF0ZOijnVAuOGg5DQwc8Hwd3R9nMl+WWseRIyuyN
	YERa51wYTaGMM3oN5J7TKVtbeNZeoRpTQ9vgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7AC5updE5bB1Jshy6R6nMxGYJxwwQEY9qKd1RRimZss=;
	b=OX8v2UwPqv7ybbGl/FyPCzyiPYc7RvL5VaHfOOs4Yjpz1OinmqK8GfFLB8kQJZ52MQ
	16pVQ5UQ0qfuXwLCA6pDVO/nVYdRwyxl4np0O85djBy9jVZXUT/bYmpaVHJJ/fMbSLQF
	K5MF12HXFRxz7lBhkI8Cl839f1dtfBGaKaMbcamEdS7yUJidPxSkD2XpTLSA8Hire1Ui
	Si1bk2f5e8I4Qi2dn7nZy91kixjEOibmCar20I4ucMy1uKiHAcwSqXON0HY6QmhPlLPU
	z1zMgzPmoJ138/87rb8wx8Zq7mwe3JwwFSpudbsUrsKboRQpE3nYEJ/1bWsA5LcEJoPz
	9c3w==
X-Gm-Message-State: ALKqPweGeqiPoe/DyzF/l4WTsWnLEsAKPHMerlzFeJI/kv05YsH11kBp
	64BdSnwMZNs8fipH6TBMd13oJQ==
X-Received: by 2002:a17:902:8f93:: with SMTP id
	z19-v6mr2676641plo.166.1526509825543; 
	Wed, 16 May 2018 15:30:25 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm6640418pfc.159.2018.05.16.15.30.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 15:30:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 16 May 2018 15:29:51 -0700
Message-Id: <20180516223007.10256-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516223007.10256-1-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::22b
Subject: [Qemu-arm] [PATCH v3-a 11/27] target/arm: Implement SVE bitwise
 shift by vector (predicated)
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
X-TUID: 2sFFoHMoP9Rw

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 27 +++++++++++++++++++++++++++
 target/arm/sve_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-sve.c |  4 ++++
 target/arm/sve.decode      |  8 ++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index b3c89579af..0cc02ee59e 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -168,6 +168,33 @@ DEF_HELPER_FLAGS_5(sve_udiv_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_udiv_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_asr_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_asr_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_asr_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_asr_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_lsr_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsr_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsr_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsr_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_lsl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(sve_orv_b, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_orv_h, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_orv_s, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b6b9a08965..ece3a81ad3 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -440,6 +440,28 @@ DO_ZPZZ_D(sve_sdiv_zpzz_d, int64_t, DO_DIV)
 DO_ZPZZ(sve_udiv_zpzz_s, uint32_t, H1_4, DO_DIV)
 DO_ZPZZ_D(sve_udiv_zpzz_d, uint64_t, DO_DIV)
 
+/* Note that all bits of the shift are significant
+   and not modulo the element size.  */
+#define DO_ASR(N, M)  (N >> MIN(M, sizeof(N) * 8 - 1))
+#define DO_LSR(N, M)  (M < sizeof(N) * 8 ? N >> M : 0)
+#define DO_LSL(N, M)  (M < sizeof(N) * 8 ? N << M : 0)
+
+DO_ZPZZ(sve_asr_zpzz_b, int8_t, H1, DO_ASR)
+DO_ZPZZ(sve_lsr_zpzz_b, uint8_t, H1_2, DO_LSR)
+DO_ZPZZ(sve_lsl_zpzz_b, uint8_t, H1_4, DO_LSL)
+
+DO_ZPZZ(sve_asr_zpzz_h, int16_t, H1, DO_ASR)
+DO_ZPZZ(sve_lsr_zpzz_h, uint16_t, H1_2, DO_LSR)
+DO_ZPZZ(sve_lsl_zpzz_h, uint16_t, H1_4, DO_LSL)
+
+DO_ZPZZ(sve_asr_zpzz_s, int32_t, H1, DO_ASR)
+DO_ZPZZ(sve_lsr_zpzz_s, uint32_t, H1_2, DO_LSR)
+DO_ZPZZ(sve_lsl_zpzz_s, uint32_t, H1_4, DO_LSL)
+
+DO_ZPZZ_D(sve_asr_zpzz_d, int64_t, DO_ASR)
+DO_ZPZZ_D(sve_lsr_zpzz_d, uint64_t, DO_LSR)
+DO_ZPZZ_D(sve_lsl_zpzz_d, uint64_t, DO_LSL)
+
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
@@ -544,6 +566,9 @@ DO_VPZ_D(sve_uminv_d, uint64_t, uint64_t, -1, DO_MIN)
 #undef DO_ABD
 #undef DO_MUL
 #undef DO_DIV
+#undef DO_ASR
+#undef DO_LSR
+#undef DO_LSL
 
 /* Similar to the ARM LastActiveElement pseudocode function, except the
    result is multiplied by the element size.  This includes the not found
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7607a90a4a..f0400e35d9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -301,6 +301,10 @@ DO_ZPZZ(MUL, mul)
 DO_ZPZZ(SMULH, smulh)
 DO_ZPZZ(UMULH, umulh)
 
+DO_ZPZZ(ASR, asr)
+DO_ZPZZ(LSR, lsr)
+DO_ZPZZ(LSL, lsl)
+
 static bool trans_SDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
 {
     static gen_helper_gvec_4 * const fns[4] = {
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a1791c1d7b..8267963b6b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -149,6 +149,14 @@ LSL_zpzi        00000100 .. 000 011 100 ... .. ... ..... \
 ASRD            00000100 .. 000 100 100 ... .. ... ..... \
                 @rdn_pg_tszimm imm=%tszimm_shr
 
+# SVE bitwise shift by vector (predicated)
+ASR_zpzz        00000100 .. 010 000 100 ... ..... .....   @rdn_pg_rm
+LSR_zpzz        00000100 .. 010 001 100 ... ..... .....   @rdn_pg_rm
+LSL_zpzz        00000100 .. 010 011 100 ... ..... .....   @rdn_pg_rm
+ASR_zpzz        00000100 .. 010 100 100 ... ..... .....   @rdm_pg_rn # ASRR
+LSR_zpzz        00000100 .. 010 101 100 ... ..... .....   @rdm_pg_rn # LSRR
+LSL_zpzz        00000100 .. 010 111 100 ... ..... .....   @rdm_pg_rn # LSLR
+
 ### SVE Logical - Unpredicated Group
 
 # SVE bitwise logical operations (unpredicated)
-- 
2.17.0

