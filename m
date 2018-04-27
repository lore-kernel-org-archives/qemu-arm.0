Received: by 10.28.4.212 with SMTP id 203csp171199wme;
        Thu, 26 Apr 2018 17:33:55 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrAmt6vdQxqWVVyQN55tXcGUVWSSGxZYUB4AY5SEuxVQZyC9B1WRHEhEVRAbEGHPn7e4jKa
X-Received: by 10.55.73.76 with SMTP id w73mr169903qka.139.1524789235219;
        Thu, 26 Apr 2018 17:33:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524789235; cv=none;
        d=google.com; s=arc-20160816;
        b=hp6IDnxetjyj0du9i158UeXlABmp00sD7uxe6cO4j2ZcFueN0HrlzRAk5xe98uYdso
         jTPLBB5j4QM3Y9dUBpaHGWDPeuJy62sDNI17A6Qq9ot0rTTNDo88Qdt7ZmjLetOB9iN3
         Z7BiIdicbwKZJrB+gj+J1FIxla+0f0I6azGGrEXxfubDgBcGEOP59mn92UXfPtES41MF
         cbf5Rd1vp/Qh6c3pThsT1nMTVKv7Np19zenUutzbGpdPg2d8GWuumtU21I9D6GLz2Kdb
         7wxQJPy+DT5lGpM6OneNbDmKDUHkUmYXalveYUYdUBzncX6gt9nGrxnSJKul7e8/BLM/
         5EVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=PEHUreWTV/acmi7x+XdpvFcJ/L5D2uAinn5jMrYd4EU=;
        b=sHNq0KEmxw1JH1QAPImn7RB9nSVJkh13LtHp6ZrIanpu+2bdCThZWCjqKh+r38w6sX
         wub6nAUSwIUffxHQIJiwbpD7zUkYLLdEiaiI8PYoITPwPc3Wbn0mYZBWZ4cbSI04uRHi
         8btMCDdAwuFXMKZ2tjYhcW4NS0HaqN4oqCsQ6NtNMdMQunI7rhG6c5hreCQ+X+oO03mB
         +C79v8ryQE6Iepj39A/MN1FKVGAaB0hvTVrZgOpH+E/JS/msxWQMnDfQYoE/UbucXpbE
         26v28DVT05Xgw1iCS5O0RwQR+NGOwT/LCVze+qAzJvw0O4Yq4vpaTFDl4fxKVhqUhq/Z
         scig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FLNN+sJd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m197si116698qke.211.2018.04.26.17.33.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 17:33:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FLNN+sJd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBrKk-0007Yz-Gw
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 20:33:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fBrEI-00029c-UV
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:27:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fBrEH-0004bc-T9
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:27:14 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:39572)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fBrEH-0004aU-NN
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:27:13 -0400
Received: by mail-pg0-x243.google.com with SMTP id b9-v6so147092pgf.6
	for <qemu-arm@nongnu.org>; Thu, 26 Apr 2018 17:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PEHUreWTV/acmi7x+XdpvFcJ/L5D2uAinn5jMrYd4EU=;
	b=FLNN+sJdxxxdiPxv4H2aykvYSnSE7lg3m1ZrqWCuaCpW3lLc/haGpA701JMWTiJ3Q2
	DzfXRHFPxkIJZLoxZwyRAGmkOJWC2PV7ob0rK8jL0YqGCq/a9rZzpuaUJ2/ISTNSxlez
	RFdKjCW9LwzXJwoO3VtIvWk3ZGfhkKH+BUnMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PEHUreWTV/acmi7x+XdpvFcJ/L5D2uAinn5jMrYd4EU=;
	b=MHdpHmHDyvHPMqKIad5OqQA1v3tzzXgFhqdQUAEXXDax9qbs7PY+Qqb7EqFLPeOxfW
	dpLHDwjdiU7FTukXZzhdFrSWN/nAK0TqEr8M6HkkQFVIut8h3W6kAgW2GN8g+p7jG9xY
	GQnOXRnPLqqgJ5UJvLmOUqbOqRfuwlPxCHUTguhDNM/KmGluJ0BhxDNC7/AqfcN9vLM0
	2ndYTQwsEhBuX7x6zHT8FllFz/J8oPRgl0Wxc0D9SDarUNaSZ2wRt9wqFWmwEkarCkkr
	JeKAF4nLKp/XP6tbNknVm4998lJccNqdKBw4bD1KPfi+Wnq5QLf28k6sRisIqzNKi9TS
	Q5ew==
X-Gm-Message-State: ALQs6tDCZGWEkIiXURWuuP1icj9ND2l4okTUGjMox5dbnsEykXOhhyoe
	bu8pqrXyfPl58BsIf0/EdSpP2eXFjvE=
X-Received: by 2002:a65:4648:: with SMTP id k8-v6mr169735pgr.47.1524788832880; 
	Thu, 26 Apr 2018 17:27:12 -0700 (PDT)
Received: from cloudburst.twiddle.net.com
	([2605:e000:112b:41da:c94c:5ee7:de92:7d78])
	by smtp.gmail.com with ESMTPSA id g76sm86338pfj.102.2018.04.26.17.27.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Apr 2018 17:27:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 26 Apr 2018 14:26:49 -1000
Message-Id: <20180427002651.28356-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180427002651.28356-1-richard.henderson@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH 7/9] target/arm: Fill in disas_ldst_atomic
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GWwJ791P9Ach

This implements all of the v8.1-Atomics instructions except
for compare-and-swap, which is decoded elsewhere.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 0706c8c394..6ed7627d79 100644
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

