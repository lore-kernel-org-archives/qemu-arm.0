Received: by 10.28.4.212 with SMTP id 203csp536213wme;
        Fri, 4 May 2018 15:45:36 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZohfucplBV/bUzD/7m+rghGk1QDEmu8hPyavSWMHZl2xVw86A5YRB2RCHnHF0gdpPkY5GME
X-Received: by 2002:a0c:93a8:: with SMTP id f37-v6mr25436140qvf.182.1525473936856;
        Fri, 04 May 2018 15:45:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525473936; cv=none;
        d=google.com; s=arc-20160816;
        b=brCyoonD/Y9O/reosEN+ZCEptD9lIZwI+eYw/PO+wjHwd2LBGcoTXdQlGNlpA8nIIM
         TxtTZNIrULUybRvaRuURGbOxalxsYOT88Z8qUnBc+xbE58iaQnPuIKYIm7/o+QQN1iPe
         cOfl8G4T+dyoLgrEo9ReMVUql9nKqQwv9Ik/nirRxDTLJxWx1xX6urWDmBv3U2BBDpzL
         Edw/l+fiXwJb99U3vNvHtMKebnrwxc1JyqHlliQeC7uE/5SkjLqkay8+62Qa9ajjJtNk
         ixagb8MZYJJAhZO0jHHYTIN4OR5wMxj31nsJVyWlgCf/8HnMHiUQSRF+ZQuYbtXnekPz
         egcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=6z9+zx40B+ooj2v+9U4VTuPYHaQ+bbZH6j/23MH2A4g=;
        b=wFMMAOrCa5KfSDM7Z0Wwtfy6jQ8sEBUUdRe98cFYepEQY+FNbFcB1vgMdRdmp+rLYW
         BjiDCj7lBORA49bOmXfDnGT+l4Cb6DVEk2m5hu/+Kz/IFFLkZ4N7XytPwVUyBdPw5W8+
         13d0aBh4Q7ih17QO+Co0HY86h6hUAgzAmeFistfHz/JOwRjRihbGR9SLCsXaf2ApXchU
         dNVLUUKFk8LwDoF4EbNrpaoWppMGmAI0/Jp6EeKYZohRGBsHNVS73sA7PcB00t2QZ0AP
         V9Au1lZb7tR7rDB8RCPZi8kEwNcRp5CaAzRpfkD//2gbWWkbtlPJOho7chC/qO0hLyiJ
         C/1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TBeoQ2L4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j29-v6si6599747qtc.35.2018.05.04.15.45.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 15:45:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TBeoQ2L4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEjSK-0005f5-Fa
	for alex.bennee@linaro.org; Fri, 04 May 2018 18:45:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEjSD-0005eu-Me
	for qemu-arm@nongnu.org; Fri, 04 May 2018 18:45:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEjS9-0006uE-Pq
	for qemu-arm@nongnu.org; Fri, 04 May 2018 18:45:29 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:36323)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fEjS9-0006tA-JW
	for qemu-arm@nongnu.org; Fri, 04 May 2018 18:45:25 -0400
Received: by mail-pg0-x242.google.com with SMTP id z129-v6so12177355pgz.3
	for <qemu-arm@nongnu.org>; Fri, 04 May 2018 15:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6z9+zx40B+ooj2v+9U4VTuPYHaQ+bbZH6j/23MH2A4g=;
	b=TBeoQ2L4XDJCBIjV8awyWhQ0H26NvpydYjoa7bnhZ9vz2WCHXI6izGmbot6Zf2WumA
	MkvGNRmHWtrojPIL2yeyng4xSV3r1IrINk+f+Uk9qbnKBSdnyETsfxozLOvaobGgKHBI
	iUCccMrjaWhKWxBGuBw5vUg7WZWUm7E0InfTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6z9+zx40B+ooj2v+9U4VTuPYHaQ+bbZH6j/23MH2A4g=;
	b=tgTHJKWjk290yImSeU3tbf5EQIuvdXy3vuo9bwTeQGZH5uavPVWYNzmpvukBkqcSQR
	42NlMGfARqpA9thuNKgNHyAunbTbBysqBLYkeDd7+/9q+0C6JOPEBmaKvzvfJKUX/wWY
	cPIps97yvDIwLgvZazT1IOZKq1LZa2/T5JVVt0tivaL4imItH0rRYp10BbeRjDZ//2ee
	5Abi5XMfYP7nyysOMOaEen7yV6JE8mMuBZ2y/oIKvW+H7U5lNcm/9J35BS/p5LISBz5m
	TAmrYqjlY8+0g81HUQE9KBlJt1uaEGbTSe1mvhdu9tU6l/r7ob7kGvWMGem5F6IFqPGl
	h5XA==
X-Gm-Message-State: ALQs6tDBGujkHK6DX/e653gD6HeyF3jUnWnnF2HHr5FX+KhqBRJu0EpX
	oIl9PuVM3ftXXJrVDu5zOLduYg==
X-Received: by 2002:a63:7543:: with SMTP id
	f3-v6mr19976773pgn.256.1525473923939; 
	Fri, 04 May 2018 15:45:23 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	b5sm33604244pfc.16.2018.05.04.15.45.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 04 May 2018 15:45:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  4 May 2018 15:45:21 -0700
Message-Id: <20180504224521.7801-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180504183021.19318-1-richard.henderson@linaro.org>
References: <20180504183021.19318-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH v3 08/10] target/arm: Fill in disas_ldst_atomic
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
X-TUID: yTKDskIgLkfn

This implements all of the v8.1-Atomics instructions except
for compare-and-swap, which is decoded elsewhere.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Do not zero-extend X[s] via the third parameter to read_cpu_reg.

---
 target/arm/translate-a64.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 6acad791e6..c13858a690 100644
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
+    tcg_rs = read_cpu_reg(s, rs, true);
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

