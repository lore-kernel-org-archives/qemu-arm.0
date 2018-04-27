Received: by 10.28.4.212 with SMTP id 203csp167018wme;
        Thu, 26 Apr 2018 17:27:18 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpV6PYP0CdnpQ8oKfkkjVF4ARCllN18/kMCLSmnnwp1WHPszzs6DhxfdIwSQyehIEBFE+Mj
X-Received: by 2002:aed:2f64:: with SMTP id l91-v6mr195920qtd.216.1524788838571;
        Thu, 26 Apr 2018 17:27:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524788838; cv=none;
        d=google.com; s=arc-20160816;
        b=FOAAjLwM3+nZzlh8gcssljFUksStmhE2KXtYHzmaZ5krygpdqjvrpjwy+Nt1jwR8wX
         ISGf8BxL8y+VWNV/Z4lWHsPY+9imLvQSYmnR2j/+ek3yqeGVugIwQz4N4kDvJA0FNtkC
         hgaQUW3bXmHQN2jsQnTVD8h9LO9rbnSgAXqX7oDxmhAozGtfZ+1tdtF8ueDB+vzPLVVO
         dzh664B46kgQupq8u1Sl4bYeko1+AJ3QXrGIaYsGqoxMY8oXyxfsIE4RlfCp34lTEqLN
         UdzlZ55CsysL9YrDZFr9UQlxV24pdeTPdCbshMoSFf5nNGKddvYrR0rBf8hA6od1KODI
         pDSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=QeahTyooBey/fkgn97QY2/OE+3ePjf1njf4Fk85eWiw=;
        b=RRLoc8Xr+oFUm2S7mNBwF9Keu1brOcIf5jxjYX6WCZHifaoRjSlhsVuf4cRR+oWA13
         jliGmcNCxXuV8tAQx6N2NP2HzaSAFg9dghlcJDXPS5O1qWKQAdkFE7NxTERYj9HKykqS
         UJJQHg1KxVeBH2r3RuDPC6Y3o582TCTGqfZfo8WxmOawxmy76zH3unEmLoudOhVh9hJT
         sW5WxUa05e62ehPnUXGWCiY623rV1igr6IgdBVTmeNogT+0XUT08zKyEsf/0otcnESSP
         ntWtslw0crfPvgzHmCrEgvfdwrZuMjjiWK9gb2y/wPlD5Ypomj2kqABxRe2r5eWjdbKc
         T+2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JzZqxuLi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l66si89401qke.363.2018.04.26.17.27.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 17:27:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JzZqxuLi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBrEL-0001yB-SI
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 20:27:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fBrE8-0001x3-1q
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:27:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fBrE7-0004PC-06
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:27:04 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:38626)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fBrE6-0004Ok-Q1
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:27:02 -0400
Received: by mail-pg0-x241.google.com with SMTP id n9-v6so150086pgq.5
	for <qemu-arm@nongnu.org>; Thu, 26 Apr 2018 17:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QeahTyooBey/fkgn97QY2/OE+3ePjf1njf4Fk85eWiw=;
	b=JzZqxuLi/7pCvfLu0/pxK4n6ij5hONN+PdFuDOKxercO3aCGlNO8neonEuT/cuAs4T
	N2kT3A7Zyi5QIWgp+sJWRot3d3+dKURCgnDYUOmti3dw38oPnMhgiK8Wc+UutIv46Qv2
	hQA3askTbYqJo3+5WyKZycLBsgrq9CmiYtklw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QeahTyooBey/fkgn97QY2/OE+3ePjf1njf4Fk85eWiw=;
	b=S2oXCkmzq9G5KPvzvJliymza9WChM5lKeoi9YQYwQoNVpZ2smthx82oJRflBsvMQQF
	HostWgIEBBtt9IY9mtPavbTyFF8WOmZ23iR4b7cH2kcm7Ff6H58W8rG5oepdc5jG1vlQ
	vPStvKYr+JjP7oRkmIcKQPq0+88YTEEbWEFkiIL627y3QjoO6gX2VDK4DZtbPQPiwc6I
	tn/fYo135vYleqkBmCsUKxrv5vleqVIKIP0Lrrn2Y4drBS8O7CwWzCYDw7l28xAryrLV
	xzh/gysyRsEPl221Vd4UGiKvZhujcjMWImaA5NFVH37zb5r1R2tz2QB8Py36wQAzBxEu
	Z0oQ==
X-Gm-Message-State: ALQs6tAXNoZrAZS6xFi7WqpSH9pvGcs3Dt5CNbQOlr/JV+LzkesFfizI
	iCh74z4vix3GaAXxdiiUqM750Q==
X-Received: by 2002:a65:438b:: with SMTP id
	m11-v6mr160802pgp.153.1524788821930; 
	Thu, 26 Apr 2018 17:27:01 -0700 (PDT)
Received: from cloudburst.twiddle.net.com
	([2605:e000:112b:41da:c94c:5ee7:de92:7d78])
	by smtp.gmail.com with ESMTPSA id g76sm86338pfj.102.2018.04.26.17.27.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Apr 2018 17:27:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 26 Apr 2018 14:26:43 -1000
Message-Id: <20180427002651.28356-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180427002651.28356-1-richard.henderson@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH 1/9] tcg: Introduce helpers for integer min/max
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
X-TUID: peXjNjZzzZ0m

These operations are re-invented by several targets so far.
Several supported hosts have insns for these, so place the
expanders out-of-line for a future introduction of tcg opcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.h | 16 ++++++++++++++++
 tcg/tcg-op.c | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
index 75bb55aeac..540337e605 100644
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

