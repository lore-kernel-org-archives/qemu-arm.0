Received: by 10.28.4.212 with SMTP id 203csp334152wme;
        Fri, 4 May 2018 11:31:11 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo+8RJzHnwAapmY8oFfxx5+smfFkwEhK6DfboP5vrJ4rA5IinNe2bEoLebRISW1pTN1tLaw
X-Received: by 10.55.145.1 with SMTP id t1mr5662127qkd.92.1525458671802;
        Fri, 04 May 2018 11:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525458671; cv=none;
        d=google.com; s=arc-20160816;
        b=e3DYi5UYAKiY4liFHDjPH25gqxbpmJb9PXmLyePELrxpfBVs9ZwQJkRPNgkbhmKUXw
         2ZtV2gy3zIdEhUjtx0TMa+NElKUW5fyJVIEX2hzlcRTW09DICJ3rFWuIDZ9Vrjr81uTH
         tBZzkGnn95n7bAB4QL9nY4jqcLkViGuIAKHg5sal6mgQoN59WFdvuURJQ3e712Co5gev
         jxkFs0X1QxcOjtR045NRj3ZiL9mAnLtHSR5wT2mbEHDQb8+QCxuUg8n0xdwAvmsCUk0h
         cAeL91U3TMawgBgaXANZXTiHACD5Z/Ti1MYk75lOHp0vugSSPKQnMcEQRDC2u6yq6sO2
         rYrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=nb233U1bSWEt1qvuLILy6QuTyZNRED2l7P5Q74E4EVA=;
        b=NlBaD1+Yge4GvJwHd46DjvvMp/Gce67O96/P5ACiiob5zkmbgoJciecdk0HOVh1umo
         PBcuUnP71wSF/R44+LKDBPwlyiq1DJx/bsUwJfl58YEu8LTKjAXLcZds+4/X+Ar4szVZ
         jmVhfgeUZgr6GYVM6NzQMMD9oSAnn3QDnzyrDDm8fDAGy/YPNv8U8xnUwTyMZSU7lyxT
         04i/w8im+erZxJmgn+IiBC49TvSv2Tpt+z7hREwJUi/Ywg+IS4mtkHF8zH6mGo2N0w/h
         G6uiIejuwg1pZMLE9F2GATjQ56iibE5BJ9y5QYd3Kv882KsvMAIviuL6MIqARzhVpjZL
         oAyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PTen3hXF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f15si3860686qkm.26.2018.05.04.11.31.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 11:31:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PTen3hXF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35974 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEfU7-0007U1-8c
	for alex.bennee@linaro.org; Fri, 04 May 2018 14:31:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTQ-0007Sf-K6
	for qemu-devel@nongnu.org; Fri, 04 May 2018 14:30:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTO-00013Z-Pk
	for qemu-devel@nongnu.org; Fri, 04 May 2018 14:30:28 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:33876)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fEfTO-000127-KB
	for qemu-devel@nongnu.org; Fri, 04 May 2018 14:30:26 -0400
Received: by mail-pg0-x244.google.com with SMTP id g20-v6so9292611pgv.1
	for <qemu-devel@nongnu.org>; Fri, 04 May 2018 11:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nb233U1bSWEt1qvuLILy6QuTyZNRED2l7P5Q74E4EVA=;
	b=PTen3hXFDPB6ewhBLGwepyVzdGkJJcXsmwyZyceTI8gnGQSCRWcyFS4yChHAncSJOx
	1ZR9XtyVoNLZwPZAVeMqbP62HmRNIyBnpeAoGfqwLV1i/5aah/PQ62L7Mje9z71kQuNJ
	DTVlMpKqhcmV8pORzQEbZal9DUTHe4nKvfMeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nb233U1bSWEt1qvuLILy6QuTyZNRED2l7P5Q74E4EVA=;
	b=hZpXXffOrwvI1AHx09TWJ6V2Q7Qn6LeRwB0j0fqT7waFexSTGfzUF6si70vz+maF4v
	ukgzp1xQcE4Wgy5BCmhkUD8oq+1HAZ1KQ5XaTlhVdfwLfH0ns3orwzCFhY7FXKGxHB/S
	kagCmTaHw2yvdD5gSJYvz/EY4H8p6gPsvU9Lo29Hq212gBROrPZf0L+PpXERBPiK8kz7
	oyfSU1LoM7IIlbwZp6vSXdl0L2RQ4d5Dz2tU1NC+T8lmf+h0+ujvTtMdvOgBwE5ejBQ5
	Fh3l3a9qfzTaZYG5laPGADGmu822XQIWD7EMqbfowfK9DcISZMhJCRvmE0vgiIMFRpzq
	iubA==
X-Gm-Message-State: ALQs6tBTTKFigR4wCVJOdOgDtGEft3tWmmc9GV5ovxYm2K8SzaijZdE+
	nRbnR7v6HfPQtJDrxoXZIKJg33wd1x8=
X-Received: by 2002:a63:4383:: with SMTP id
	q125-v6mr23640373pga.412.1525458625366; 
	Fri, 04 May 2018 11:30:25 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	r8-v6sm16987413pgn.2.2018.05.04.11.30.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 04 May 2018 11:30:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  4 May 2018 11:30:12 -0700
Message-Id: <20180504183021.19318-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180504183021.19318-1-richard.henderson@linaro.org>
References: <20180504183021.19318-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-devel] [PATCH v2 01/10] tcg: Introduce helpers for integer
 min/max
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
X-TUID: XIjYn+OWu1bG

These operations are re-invented by several targets so far.
Several supported hosts have insns for these, so place the
expanders out-of-line for a future introduction of tcg opcodes.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.h | 16 ++++++++++++++++
 tcg/tcg-op.c | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
index 5d2c91a1b6..0451e2752e 100644
--- a/tcg/tcg-op.h
+++ b/tcg/tcg-op.h
@@ -324,6 +324,10 @@ void tcg_gen_ext8u_i32(TCGv_i32 ret, TCGv_i32 arg);
 void tcg_gen_ext16u_i32(TCGv_i32 ret, TCGv_i32 arg);
 void tcg_gen_bswap16_i32(TCGv_i32 ret, TCGv_i32 arg);
 void tcg_gen_bswap32_i32(TCGv_i32 ret, TCGv_i32 arg);
+void tcg_gen_smin_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
+void tcg_gen_smax_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
+void tcg_gen_umin_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
+void tcg_gen_umax_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
 
 static inline void tcg_gen_discard_i32(TCGv_i32 arg)
 {
@@ -517,6 +521,10 @@ void tcg_gen_ext32u_i64(TCGv_i64 ret, TCGv_i64 arg);
 void tcg_gen_bswap16_i64(TCGv_i64 ret, TCGv_i64 arg);
 void tcg_gen_bswap32_i64(TCGv_i64 ret, TCGv_i64 arg);
 void tcg_gen_bswap64_i64(TCGv_i64 ret, TCGv_i64 arg);
+void tcg_gen_smin_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
+void tcg_gen_smax_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
+void tcg_gen_umin_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
+void tcg_gen_umax_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
 
 #if TCG_TARGET_REG_BITS == 64
 static inline void tcg_gen_discard_i64(TCGv_i64 arg)
@@ -1025,6 +1033,10 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_mulu2_tl tcg_gen_mulu2_i64
 #define tcg_gen_muls2_tl tcg_gen_muls2_i64
 #define tcg_gen_mulsu2_tl tcg_gen_mulsu2_i64
+#define tcg_gen_smin_tl tcg_gen_smin_i64
+#define tcg_gen_umin_tl tcg_gen_umin_i64
+#define tcg_gen_smax_tl tcg_gen_smax_i64
+#define tcg_gen_umax_tl tcg_gen_umax_i64
 #define tcg_gen_atomic_cmpxchg_tl tcg_gen_atomic_cmpxchg_i64
 #define tcg_gen_atomic_xchg_tl tcg_gen_atomic_xchg_i64
 #define tcg_gen_atomic_fetch_add_tl tcg_gen_atomic_fetch_add_i64
@@ -1123,6 +1135,10 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_mulu2_tl tcg_gen_mulu2_i32
 #define tcg_gen_muls2_tl tcg_gen_muls2_i32
 #define tcg_gen_mulsu2_tl tcg_gen_mulsu2_i32
+#define tcg_gen_smin_tl tcg_gen_smin_i32
+#define tcg_gen_umin_tl tcg_gen_umin_i32
+#define tcg_gen_smax_tl tcg_gen_smax_i32
+#define tcg_gen_umax_tl tcg_gen_umax_i32
 #define tcg_gen_atomic_cmpxchg_tl tcg_gen_atomic_cmpxchg_i32
 #define tcg_gen_atomic_xchg_tl tcg_gen_atomic_xchg_i32
 #define tcg_gen_atomic_fetch_add_tl tcg_gen_atomic_fetch_add_i32
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 34b96d68f3..5b82c3be8d 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -1033,6 +1033,26 @@ void tcg_gen_bswap32_i32(TCGv_i32 ret, TCGv_i32 arg)
     }
 }
 
+void tcg_gen_smin_i32(TCGv_i32 ret, TCGv_i32 a, TCGv_i32 b)
+{
+    tcg_gen_movcond_i32(TCG_COND_LT, ret, a, b, a, b);
+}
+
+void tcg_gen_umin_i32(TCGv_i32 ret, TCGv_i32 a, TCGv_i32 b)
+{
+    tcg_gen_movcond_i32(TCG_COND_LTU, ret, a, b, a, b);
+}
+
+void tcg_gen_smax_i32(TCGv_i32 ret, TCGv_i32 a, TCGv_i32 b)
+{
+    tcg_gen_movcond_i32(TCG_COND_LT, ret, a, b, b, a);
+}
+
+void tcg_gen_umax_i32(TCGv_i32 ret, TCGv_i32 a, TCGv_i32 b)
+{
+    tcg_gen_movcond_i32(TCG_COND_LTU, ret, a, b, b, a);
+}
+
 /* 64-bit ops */
 
 #if TCG_TARGET_REG_BITS == 32
@@ -2438,6 +2458,26 @@ void tcg_gen_mulsu2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 arg1, TCGv_i64 arg2)
     tcg_temp_free_i64(t2);
 }
 
+void tcg_gen_smin_i64(TCGv_i64 ret, TCGv_i64 a, TCGv_i64 b)
+{
+    tcg_gen_movcond_i64(TCG_COND_LT, ret, a, b, a, b);
+}
+
+void tcg_gen_umin_i64(TCGv_i64 ret, TCGv_i64 a, TCGv_i64 b)
+{
+    tcg_gen_movcond_i64(TCG_COND_LTU, ret, a, b, a, b);
+}
+
+void tcg_gen_smax_i64(TCGv_i64 ret, TCGv_i64 a, TCGv_i64 b)
+{
+    tcg_gen_movcond_i64(TCG_COND_LT, ret, a, b, b, a);
+}
+
+void tcg_gen_umax_i64(TCGv_i64 ret, TCGv_i64 a, TCGv_i64 b)
+{
+    tcg_gen_movcond_i64(TCG_COND_LTU, ret, a, b, b, a);
+}
+
 /* Size changing operations.  */
 
 void tcg_gen_extrl_i64_i32(TCGv_i32 ret, TCGv_i64 arg)
-- 
2.14.3

