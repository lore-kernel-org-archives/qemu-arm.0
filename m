Received: by 10.28.71.27 with SMTP id u27csp2072538wma;
        Sat, 17 Feb 2018 10:27:34 -0800 (PST)
X-Google-Smtp-Source: AH8x2261GkP2xYPa5Z3Q4Ft5W1PzI9SVlYtWaqSKW0TYyXQxuvAR4gVQCwTDbhjgzrheNYZ1MrOu
X-Received: by 10.37.194.195 with SMTP id s186mr6957243ybf.205.1518892054277;
        Sat, 17 Feb 2018 10:27:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518892054; cv=none;
        d=google.com; s=arc-20160816;
        b=hxn+fQERUE7p43KC7vb6dq9Hgyl4RxrlqCErhi5TX/N0d5cSZaj6h13mfDLUxQuMGX
         aVHIC3DFdV6573DRodP9YxANW2cnbDuk6ejYJQDnAHTg2gsNIAjJyloLPwz6VcJoKseP
         0A6fjwz+U3jxCVq7zIIhiUmZxxvV2XYgIlH1AHmoP9ejTziQxc7s3LWHlHD7G3Ogbk6I
         jEco/UDjVT4F11BmY2lFXrk1r9MygfcKPwgMd0msYw50jkddWCF4GutDPp7E0DU6/e3U
         XOdxVZrdJ2Ijq5bKcOZfrfvaAHGrVlWGc7p5mhEO3nivwSPnRi3yNIAPLT/RPJ8h5TYh
         irxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=crjT9mdFhV4QIVceZtyE/uLyIPkijbglCCBt+D3M/dI=;
        b=P4Vas7P2OyPobwyiJ4GnlnCFeH0j3JAIhr9k02aV/MQR/NpfuGyMYrL3Qn3kIXy3yM
         c98iePk3ufcmMyeS5f2UwSjJwk4MsAIpIT4XzkdSF/aTLGu7str2Np8qUFiQLsESFA01
         XDvSlifk4r7XdXIWYb8ApO1WPV1sg3mKLqZ4LwEGZEaXBGn+B0ZIEcTrNugHVYItH7WS
         9nNTSZevqlX4Gb45uMOjaXFO+TC7bqY33TC9Q/LE6eatSQtZVT4xrOz/DzA5kaRyTuAg
         YD0EEN35oD9xAGuoPLjLf/wceBKtLmjOvf3znfQPIIIvYERUaJRHxYD9KytVvxU9N/Po
         HrAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=et7eDw+j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m130si827139ywm.121.2018.02.17.10.27.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:27:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=et7eDw+j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48080 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7Cv-0003mD-NU
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:27:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en795-00006v-4j
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en794-0001T7-46
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:35 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:40418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en793-0001Sl-Ph
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:34 -0500
Received: by mail-pl0-x242.google.com with SMTP id g18so3434873plo.7
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=crjT9mdFhV4QIVceZtyE/uLyIPkijbglCCBt+D3M/dI=;
	b=et7eDw+j8BCHiHiM5qQ/tvuBRTE9lvahCck7xOYIWpK5kHrZGzh6Fu09G0YZHn9sSU
	MbphDAAhkkvf7gc6iRiiCzGqsLzn9HYBvVBRcB8CwobVtGVHHblMvTI+RCJv+EZEU979
	O3gd8yFaS1Ks4T4zJY02j5kxY3zXJxlxlGlSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=crjT9mdFhV4QIVceZtyE/uLyIPkijbglCCBt+D3M/dI=;
	b=JU+3ZJ9wNyXY87OMEFDRQI5835olrKHlpMThOlTG/6wqbVXHzVLYFM50th1qE0+PLW
	U0kAweoi7KwCwDKADlaIwYwN+NuILeYrHOAB67XqTIauWHjnjzYoumNlXZWRTzRjJOqE
	WWfCEVEl+I9ifGN69T/pnbiMpcXhevtwfwnNUhCzrnQe923tXrM8wSc6ghZg+8nlMeMP
	GS4pMbXT9ikB5TDw4Dx3TAwPGTPvu+kvuSsI5FrnKO5Ur30nPBCEQ7Ubw/GHvX0VLukL
	FvC2jddv5fThmwtVXNBK0D9G7JcsWUwPWuVqzLQI0Ij1T/YJlkrEhn+G/4+4tTrcosnF
	TfjA==
X-Gm-Message-State: APf1xPBKS9GkYvtbyL5XzxjIqpLNUEqgkfY9JO7zrKJk0AaqIx3KV3eE
	b4AY30twVfoRWVM0JGdCXUtCKfl+jwc=
X-Received: by 2002:a17:902:8304:: with SMTP id
	bd4-v6mr9608299plb.123.1518891812941; 
	Sat, 17 Feb 2018 10:23:32 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.23.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:23:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:20 -0800
Message-Id: <20180217182323.25885-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH v2 04/67] target/arm: Implement SVE Bitwise
 Logical - Unpredicated Group
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
X-TUID: b6VGyI+upphi

These were the instructions that were stubbed out when
introducing the decode skeleton.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 50 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2c9e4733cb..50cf2a1fdd 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -32,6 +32,10 @@
 #include "trace-tcg.h"
 #include "translate-a64.h"
 
+typedef void GVecGen2Fn(unsigned, uint32_t, uint32_t, uint32_t, uint32_t);
+typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
+                        uint32_t, uint32_t, uint32_t);
+
 /*
  * Include the generated decoder.
  */
@@ -42,22 +46,54 @@
  * Implement all of the translator functions referenced by the decoder.
  */
 
-static void trans_AND_zzz(DisasContext *s, arg_AND_zzz *a, uint32_t insn)
+/* Invoke a vector expander on two Zregs.  */
+static void do_vector2_z(DisasContext *s, GVecGen2Fn *gvec_fn,
+                         int esz, int rd, int rn)
 {
-    unsupported_encoding(s, insn);
+    unsigned vsz = vec_full_reg_size(s);
+    gvec_fn(esz, vec_full_reg_offset(s, rd),
+            vec_full_reg_offset(s, rn), vsz, vsz);
 }
 
-static void trans_ORR_zzz(DisasContext *s, arg_ORR_zzz *a, uint32_t insn)
+/* Invoke a vector expander on three Zregs.  */
+static void do_vector3_z(DisasContext *s, GVecGen3Fn *gvec_fn,
+                         int esz, int rd, int rn, int rm)
 {
-    unsupported_encoding(s, insn);
+    unsigned vsz = vec_full_reg_size(s);
+    gvec_fn(esz, vec_full_reg_offset(s, rd), vec_full_reg_offset(s, rn),
+            vec_full_reg_offset(s, rm), vsz, vsz);
 }
 
-static void trans_EOR_zzz(DisasContext *s, arg_EOR_zzz *a, uint32_t insn)
+/* Invoke a vector move on two Zregs.  */
+static void do_mov_z(DisasContext *s, int rd, int rn)
 {
-    unsupported_encoding(s, insn);
+    do_vector2_z(s, tcg_gen_gvec_mov, 0, rd, rn);
+}
+
+/*
+ *** SVE Logical - Unpredicated Group
+ */
+
+static void trans_AND_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_vector3_z(s, tcg_gen_gvec_and, 0, a->rd, a->rn, a->rm);
+}
+
+static void trans_ORR_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    if (a->rn == a->rm) { /* MOV */
+        do_mov_z(s, a->rd, a->rn);
+    } else {
+        do_vector3_z(s, tcg_gen_gvec_or, 0, a->rd, a->rn, a->rm);
+    }
+}
+
+static void trans_EOR_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_vector3_z(s, tcg_gen_gvec_xor, 0, a->rd, a->rn, a->rm);
 }
 
 static void trans_BIC_zzz(DisasContext *s, arg_BIC_zzz *a, uint32_t insn)
 {
-    unsupported_encoding(s, insn);
+    do_vector3_z(s, tcg_gen_gvec_andc, 0, a->rd, a->rn, a->rm);
 }
-- 
2.14.3

