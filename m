Received: by 10.28.4.212 with SMTP id 203csp1226126wme;
        Wed, 2 May 2018 15:25:07 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrFn4qTedS8hL3vz5dgHCnp2OtQXZCK2ixVGCw0k8iF3nttCOG/7VI7CB+Zr3KXA0q2VW4m
X-Received: by 2002:ac8:424f:: with SMTP id r15-v6mr16573828qtm.395.1525299907148;
        Wed, 02 May 2018 15:25:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525299907; cv=none;
        d=google.com; s=arc-20160816;
        b=AEa5JkKQU6t6oRLaXxzEGR25RXnFIXLqG+mYBbwZtrrR5rgDINWI3gWq4AE+Zna1Se
         F61oOxRsOjvuJ1apyJWctsQT/v5mcpHSUjyhlfNEcmBeGjpoZkHH5kAijGr8WCqvHdbA
         A28cdbwgtT1rThRxkjXVjgT6fGdkLtvO7QB84tigoU2QeVnDR0JVf++WlY/DKXXz9LoY
         MoihZStTdD9dlF45Dh+FqL54nUbjLcD3wbl7PBPI6ZpFgk7SOtCwF2pIIGaz2IJXfb42
         Mq/qVmrTbxwBhsbBLgTiEnqZPVASDHAPhMAxFaWXBnG9yI2iUHW8+Ad04mh/V8AWsV/3
         tHAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=+NJcK2bxHsiTQWd1zChLZWnGl5un7Pg1c9+Vm3qmlP8=;
        b=1GBf2y+5dkK+VYQsWtTxaEtzMfPvKgIBJDkT5IquCNJyQAfCpYNVuxBzViXM7YtlL8
         jD1qgalA6hWDIKK/DAbowGoSJwcGqICfiAY/AnJGvEKOs98CmQVP09tFca2flbMCV1B/
         hm0BMnx+DEgZ9fLrDJDP1/LTsWJ5TCQPnI6sCkFYLZfTxabZVHQBWweRkBp7y9b7LR0T
         /FujfCHs3EvMz4k2y8ZthUeCSZ2goE3aOOKUhQsWllj1w/tUCAWePZIMu4/aPV4cRHBM
         PQl4nr42QR8FqBxrUlIFbNg11XQUJLINOsy3cUrzwCYrAOYQQIBfW9MHtliEyrjoiHkz
         wT4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=edVsKRIH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o186si1111337qkb.68.2018.05.02.15.25.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 May 2018 15:25:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=edVsKRIH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52844 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fE0BO-00083M-LG
	for alex.bennee@linaro.org; Wed, 02 May 2018 18:25:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fE02k-0000nS-96
	for qemu-arm@nongnu.org; Wed, 02 May 2018 18:16:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fE02i-0007yI-VF
	for qemu-arm@nongnu.org; Wed, 02 May 2018 18:16:10 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:40467)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fE02i-0007xQ-Q7
	for qemu-arm@nongnu.org; Wed, 02 May 2018 18:16:08 -0400
Received: by mail-pf0-x241.google.com with SMTP id f189so12958205pfa.7
	for <qemu-arm@nongnu.org>; Wed, 02 May 2018 15:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+NJcK2bxHsiTQWd1zChLZWnGl5un7Pg1c9+Vm3qmlP8=;
	b=edVsKRIHqE6KZU26kmq98OIAhB0lnubunVMxNkN+pbFB13uCPnSn0QOcusDzb9G0r5
	If2Nv1D8wA66/ztKkHo3+LI4NBTuzJ4Ae8LZBdKtp4pph4jTf93LKn4IyyQwj/SPsbwB
	luG9KUfcZQyIA9PJxyE4lZOMRzDRNebwKFK80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+NJcK2bxHsiTQWd1zChLZWnGl5un7Pg1c9+Vm3qmlP8=;
	b=juStt0mGw7m+4brYoKwvjNcY0yLsuwMOf37MsMd5pBtU/NH3eO0PLYtOZ4rbxu2jdj
	n7I2HVdTLpzpPclWLK0k0tiA88swFucFdGK8UBUjFKc2VrjHDosPsxzLKgw/kHssuL9I
	QDI/5dNhL1uG9Pe28qzPFyCfodvxW2MUlkkbbu0DgAvAgcktY4hggxJUc8PtHSdxe8V5
	NDJL3bAzIqRwyy9WOrOAAbXdxymkTRQqJqh0n/FR6TvQ7YeIeyq15l86BBQMYFS40gSk
	rBEPvlO3gvnLJwRmS+9eGPd/yibE34iFysFLRL/Z3Jn04yuLPwl8LjYnoXOO4IXu1MSn
	Qt9g==
X-Gm-Message-State: ALQs6tAodLhO/D8JaEPddlegGTML8pgFJDMStmbhZlt96U/avqFZ+b3/
	oa8l79zgK1LBx44fYEAk3P9QXg==
X-Received: by 10.98.19.151 with SMTP id 23mr21028182pft.222.1525299367890;
	Wed, 02 May 2018 15:16:07 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	65sm26170145pft.74.2018.05.02.15.16.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 May 2018 15:16:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  2 May 2018 15:15:48 -0700
Message-Id: <20180502221552.3873-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180502221552.3873-1-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v2 10/14] target/arm: Implement FP
 data-processing (3 source) for fp16
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GTE3PnrQxC0i

We missed all of the scalar fp16 fma operations.

Cc: qemu-stable@nongnu.org
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d7a49ef2e4..9322b0d896 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5240,6 +5240,44 @@ static void handle_fp_3src_double(DisasContext *s, bool o0, bool o1,
     tcg_temp_free_i64(tcg_res);
 }
 
+/* Floating-point data-processing (3 source) - half precision */
+static void handle_fp_3src_half(DisasContext *s, bool o0, bool o1,
+                                int rd, int rn, int rm, int ra)
+{
+    TCGv_i32 tcg_op1, tcg_op2, tcg_op3;
+    TCGv_i32 tcg_res = tcg_temp_new_i32();
+    TCGv_ptr fpst = get_fpstatus_ptr(true);
+
+    tcg_op1 = read_fp_hreg(s, rn);
+    tcg_op2 = read_fp_hreg(s, rm);
+    tcg_op3 = read_fp_hreg(s, ra);
+
+    /* These are fused multiply-add, and must be done as one
+     * floating point operation with no rounding between the
+     * multiplication and addition steps.
+     * NB that doing the negations here as separate steps is
+     * correct : an input NaN should come out with its sign bit
+     * flipped if it is a negated-input.
+     */
+    if (o1 == true) {
+        tcg_gen_xori_i32(tcg_op3, tcg_op3, 0x8000);
+    }
+
+    if (o0 != o1) {
+        tcg_gen_xori_i32(tcg_op1, tcg_op1, 0x8000);
+    }
+
+    gen_helper_advsimd_muladdh(tcg_res, tcg_op1, tcg_op2, tcg_op3, fpst);
+
+    write_fp_sreg(s, rd, tcg_res);
+
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i32(tcg_op1);
+    tcg_temp_free_i32(tcg_op2);
+    tcg_temp_free_i32(tcg_op3);
+    tcg_temp_free_i32(tcg_res);
+}
+
 /* Floating point data-processing (3 source)
  *   31  30  29 28       24 23  22  21  20  16  15  14  10 9    5 4    0
  * +---+---+---+-----------+------+----+------+----+------+------+------+
@@ -5269,6 +5307,16 @@ static void disas_fp_3src(DisasContext *s, uint32_t insn)
         }
         handle_fp_3src_double(s, o0, o1, rd, rn, rm, ra);
         break;
+    case 3:
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
+            unallocated_encoding(s);
+            return;
+        }
+        if (!fp_access_check(s)) {
+            return;
+        }
+        handle_fp_3src_half(s, o0, o1, rd, rn, rm, ra);
+        break;
     default:
         unallocated_encoding(s);
     }
-- 
2.14.3

