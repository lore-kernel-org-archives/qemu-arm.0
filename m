Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1280408lfm;
        Wed, 17 Jun 2020 22:02:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIEvb0z8Idopkw7amhKtlLmoqM+etN3IEwhJjcGa8ID36owlOCFNTDpvJMb5gRbKyeevUW
X-Received: by 2002:a25:ec3:: with SMTP id 186mr3940127ybo.475.1592456574619;
        Wed, 17 Jun 2020 22:02:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456574; cv=none;
        d=google.com; s=arc-20160816;
        b=b7GBMXx8Z42v01337w79d2wVMLDgtlDvcjrK7zMcIg212q/b6lfPzc7gUNdlP2O6dI
         /RHwZ1lXUvqJu4SlUhRRphL2YKhk+lShkmntrRd2FQzhZYzQBIc3d2yU7HiUUMCwZe+b
         zBJrOpHbrx/8ty/XguXxV8xUAc65XIK1P3Ll/2quZLDLcX3sYXIB+vOOxobt8SPNNCYH
         6Zk+kK+9iDE9LW/EvMDoSp5tuYsz8yRH7ABFqpRcWaMVhzkrgcHTFsZHPm7Z5R/8UvoO
         3uXYiuGe4gM0pJ3w7zS8uHcgIrJWvFhA4ZQYfRaSfcgxFD3zCIjWUI52IA0tWPRqlOQt
         fC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=r/0zj88/Wst2sdxIqtIz7rZkhsw+ny4uIFSRbTFtrQs=;
        b=vvuA/c6GaRi6IbjlhtvVB0ktqqLa8c7XJVdaERiWpqmK42EZ3lQyEyShAMMdb0S1zT
         ytQPGnGgqOqLIyK4rzEUc1tFGGVKzA3WWBK39OYpGCO3UKJo+av3YNkeUHVqJaEyolsB
         l0XPP09jVblKFL0ktMgklcZRaOnekp9AJ9S6qCp1b0CFq3FB+anDws8oVQgScGH+eVcu
         keiBhNjCpLu8cISDHVOKkArPYA+QfFbet2lHUC89Cq1zLez5vBVDXGK42j+97iSQt6D0
         z3Yxi6kltvnFNv6fWxj43b+q3JhCGLuWHvpwtpMkAdtu+oBALy5cVL+5woh8oov+2S+D
         gfog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=btE3D09H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16si1449674yba.199.2020.06.17.22.02.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:02:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=btE3D09H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmhR-0000BH-V4
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCv-0003Oz-IK
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:31:21 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:41042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCt-0003Kf-Un
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:31:21 -0400
Received: by mail-pl1-x644.google.com with SMTP id y17so1904606plb.8
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 21:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r/0zj88/Wst2sdxIqtIz7rZkhsw+ny4uIFSRbTFtrQs=;
 b=btE3D09HNv1BcEvY70Dl/rfpMv+FBxRZmYK37toQYtnr3+xxHTYnoqqTTRnpvx+e/0
 HCs4DCriWD5LGjvvP18lWhLCXOOX0254lq4mN1ef9zs8zbD/YTHsp0NhO4LvimYHrxs9
 okGXP5z1QmWlG19yRzpRc77GkPmx0rLHkfarOeFbQZF9j44s06UBwzwwHqcDzidRmrJC
 n8eA5md84i6TPprwqiKNwd/GtWJJvFOjyuVPjcL2/uTHuy0nLQWVNcUsHX5JF9jDMioM
 I2DXLbJmzaEl2JkWgCBZBSEuOL/GYMyNpUEiUNEQNVx9oU6bDvooXx0gXKnbHPUvGlm9
 grSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/0zj88/Wst2sdxIqtIz7rZkhsw+ny4uIFSRbTFtrQs=;
 b=pjfsJ5WP033oOg7aWyRHn65dak6g6ZRT9Q6mUWqANkN/otrNDbeBbsm15HXHbDy5H2
 mVXScFP4NilWcbbULqDXStIr5HgwFRu8wZkyL3U2BDAAacCcOCIXwo6+SFA+s/Jrovs8
 18LMkjbipFVtrczSCENV/D7GCjsl+8+lWdGD7i1l+GHwSs+qCUjf9tJ54IGkhTHngWDA
 6XCKfcFJphwYmHQuABapSmW+ubdHMAkQbJchH7qPrnE0fcfQOsn7dj87NrNLTznkeVxX
 cVlrfi/m7sKE5vOT41hACNNSFe75BP0lSoZ0iy0vBfLQF7zKZcv6EIW2j4/1zRDNvS/F
 7H9A==
X-Gm-Message-State: AOAM533BBmYsUYNXoFDquWb5wfcsmfIGhYkWwWvStAZkXZyfL/OPAepZ
 odpz7aQAFGrnO0DS9McdCStdGU6NZFI=
X-Received: by 2002:a17:902:8a98:: with SMTP id
 p24mr2134219plo.90.1592454678183; 
 Wed, 17 Jun 2020 21:31:18 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o1sm974337pjf.17.2020.06.17.21.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:31:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 065/100] target/arm: Fix sve_zip_p vs odd vector lengths
Date: Wed, 17 Jun 2020 21:26:09 -0700
Message-Id: <20200618042644.1685561-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, qemu-arm@nongnu.org,
 steplong@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fa/LOMgD6b6M

Wrote too much with low-half zip (zip1) with vl % 512 != 0.

Adjust all of the x + (y << s) to x | (y << s) as a style fix.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index f0601bf25b..dc23a9b3e0 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2903,6 +2903,7 @@ void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
     intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
     int esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
     intptr_t high = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1);
+    int esize = 1 << esz;
     uint64_t *d = vd;
     intptr_t i;
 
@@ -2915,33 +2916,35 @@ void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
         mm = extract64(mm, high * half, half);
         nn = expand_bits(nn, esz);
         mm = expand_bits(mm, esz);
-        d[0] = nn + (mm << (1 << esz));
+        d[0] = nn | (mm << esize);
     } else {
-        ARMPredicateReg tmp_n, tmp_m;
+        ARMPredicateReg tmp;
 
         /* We produce output faster than we consume input.
            Therefore we must be mindful of possible overlap.  */
-        if ((vn - vd) < (uintptr_t)oprsz) {
-            vn = memcpy(&tmp_n, vn, oprsz);
-        }
-        if ((vm - vd) < (uintptr_t)oprsz) {
-            vm = memcpy(&tmp_m, vm, oprsz);
+        if (vd == vn) {
+            vn = memcpy(&tmp, vn, oprsz);
+            if (vd == vm) {
+                vm = vn;
+            }
+        } else if (vd == vm) {
+            vm = memcpy(&tmp, vm, oprsz);
         }
         if (high) {
             high = oprsz >> 1;
         }
 
-        if ((high & 3) == 0) {
+        if ((oprsz & 7) == 0) {
             uint32_t *n = vn, *m = vm;
             high >>= 2;
 
-            for (i = 0; i < DIV_ROUND_UP(oprsz, 8); i++) {
+            for (i = 0; i < oprsz / 8; i++) {
                 uint64_t nn = n[H4(high + i)];
                 uint64_t mm = m[H4(high + i)];
 
                 nn = expand_bits(nn, esz);
                 mm = expand_bits(mm, esz);
-                d[i] = nn + (mm << (1 << esz));
+                d[i] = nn | (mm << esize);
             }
         } else {
             uint8_t *n = vn, *m = vm;
@@ -2953,7 +2956,7 @@ void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 
                 nn = expand_bits(nn, esz);
                 mm = expand_bits(mm, esz);
-                d16[H2(i)] = nn + (mm << (1 << esz));
+                d16[H2(i)] = nn | (mm << esize);
             }
         }
     }
-- 
2.25.1

