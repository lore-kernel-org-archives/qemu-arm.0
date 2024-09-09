Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp984816njb;
        Mon, 9 Sep 2024 09:26:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYdJJ4rbI47xI7QRRfa3UtzBO5emfK9T7yEcTtOA27B8N8/3W+0LB+hDOvId+lt35NUvqItfxNj5Yt9w==@linaro.org
X-Google-Smtp-Source: AGHT+IF0gK2dIUWe2MM9tkVCsjpNhBcqL9Ytfz/trvYBBw1qwcXh33bUqDLRL4giGyQ7qbHeqSnb
X-Received: by 2002:a05:6214:448c:b0:6c3:6455:85df with SMTP id 6a1803df08f44-6c532b2cd17mr154206926d6.44.1725899171379;
        Mon, 09 Sep 2024 09:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725899171; cv=none;
        d=google.com; s=arc-20240605;
        b=igPJMJa8pX+Y0kWfFVLnz5saqnLw/5C9GUCkWj97ZnmyLCm/5izQ9faM+JO4SGGyDn
         ma2oSOGMX6N/Z/eYJo6QP0VGMyxGE/mfrFlEdhqvs94nVrYKaDaFVHG8VZYTferFzNTh
         x7TIp345abgl2u3/aixt9BWMhGqzRWBipJ5VNlkbmusLRVddCrvpn0IK83J0vx87Ak85
         49wPk9sB0Uzr1XtV5WnqkKQElxVCI0YVa9ZrI1hIJdg24qiMDfSxvgKXrF1M3oaLHYc1
         X4uMAiDm+B/4k4apBIg+EpzUM1wdjDhXmNdy21vn1DOtWm3EkCMBoO/kUH5Pfr+Rp3/9
         3q0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Pgs2JNZ4S/gh2gLi/4fYZOmaEAbxAmjogm4YgNJtH7U=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=jPMkWEG9B2mNF8c2kT5Peut16rYqY/EVTh3A+48XbbzkRNCPGk88XVEsBokKjnw4cS
         xuvU2zHATuZ06yX6eEhfJQ2YqRKnjFdfk/AFxMutHPhrBkF5i7gZ8UNwyw9SPDfsdsht
         lOgUPOAyr0OU1P6mBzcZvlr601PfkbYbJpEklV1h0Wl5kd8vUkWe/WHTdCQx/BewXwhi
         0Vb4NUoo7HEaGqulEYnz1f2GcP5JF3g2ugBKGy5qjv2ibfZZ7WrN9wQWyHHPUPOLB6zY
         iSm0N0z54X2Z7RQ/+TXGVwjYTwJcbGXGbLT0PX78Fjc8HQEtX0bbAgtRbHbglrzSkGMg
         W0AQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=myJsrxkg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c534330661si58419236d6.54.2024.09.09.09.26.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 09:26:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=myJsrxkg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1snhAC-0002LE-2l; Mon, 09 Sep 2024 12:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhA9-0002B3-Mi
 for qemu-devel@nongnu.org; Mon, 09 Sep 2024 12:22:49 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhA6-0007gM-An
 for qemu-devel@nongnu.org; Mon, 09 Sep 2024 12:22:49 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1fc47abc040so39234325ad.0
 for <qemu-devel@nongnu.org>; Mon, 09 Sep 2024 09:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725898965; x=1726503765; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pgs2JNZ4S/gh2gLi/4fYZOmaEAbxAmjogm4YgNJtH7U=;
 b=myJsrxkgrITSrVdTGraNo/zRP6Wzdk1GYEOLeTW26JTIx20X4/fU4SWcdCubb6oxOK
 8LwwOIIIoob/yJMb6Cv6Q9FzV3HX5wEcKrcEkt3NfSJIF7OsWzi8xXLocnRkompr58oF
 y6JWm/4/ZZHhf5XbZwMznkRlqEWUQaH+YFtAoLGSDWr5ZT/e+y2GFHQZDvb3oT/WU5bi
 wYgVxT4eeKwaRTK41WhZc8A4UqPFo2A98UOZ/thUAFAI8twE92xJZiG8EppAalfBOR5S
 A/KsgkZGe7uwMGGBlJriigQLXf6SZSPx+87x2TAW9uioj4+o/1LOBs/gNkCW5ZwOrZV6
 8JUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725898965; x=1726503765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pgs2JNZ4S/gh2gLi/4fYZOmaEAbxAmjogm4YgNJtH7U=;
 b=wGCpwnFUDLcjYpyyFJBx/jkCrXaeoEUIH6zX2bL7RdyqPBA1WDkZBD7S7YiagZkmgQ
 ufnwq/Q7A/76NaeA7z6Zcen200tSddWlS7W9qF+JRw4iq72QNYGOtLBaDEClQ0vLOLd2
 sGVTK7hCur3oxAiJfQ8dqPhu3x22pXqYK+85Oe0ry3Q00SE07SeB0jdDLSwIz21LEWPW
 KvVBmTqxLsbrf00qQDkeEIKf0KpKtkaFVqR+JXJURWTNFpAd935DN3cOS5b4OCcJiGf/
 sF74A57mbAZPda8jB1QMIkZM2PLQ6ChOaEmO5KsRKiUKoudSl34SisU8ls9ppoK7IImZ
 nWsQ==
X-Gm-Message-State: AOJu0Ywu2xbaihN3LOvXi2eQdgdEgLNkUautici87dKVeVJXhe45zcIF
 defnkgqoxg6dcmDaPQbNDJRLFrdqdT6F7/ikIyRjtaQe/T7lkSo660qr+h0gy9CvbxdNJHdzU1j
 K
X-Received: by 2002:a17:902:f644:b0:205:937f:3ac6 with SMTP id
 d9443c01a7336-2070c07471dmr115287605ad.1.1725898964766; 
 Mon, 09 Sep 2024 09:22:44 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20710f35d79sm35753305ad.288.2024.09.09.09.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:22:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 03/29] target/arm: Use cmpsel in gen_ushl_vec
Date: Mon,  9 Sep 2024 09:22:13 -0700
Message-ID: <20240909162240.647173-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162240.647173-1-richard.henderson@linaro.org>
References: <20240909162240.647173-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LF9q677HWeaL

Instead of cmp+and or cmp+andc, use cmpsel.  This will
be better for hosts that use predicate registers for cmp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/gengvec.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 726a1383ae..3edbf3a262 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -1041,7 +1041,7 @@ static void gen_ushl_vec(unsigned vece, TCGv_vec dst,
     TCGv_vec rval = tcg_temp_new_vec_matching(dst);
     TCGv_vec lsh = tcg_temp_new_vec_matching(dst);
     TCGv_vec rsh = tcg_temp_new_vec_matching(dst);
-    TCGv_vec max;
+    TCGv_vec max, zero;
 
     tcg_gen_neg_vec(vece, rsh, shift);
     if (vece == MO_8) {
@@ -1061,23 +1061,20 @@ static void gen_ushl_vec(unsigned vece, TCGv_vec dst,
     tcg_gen_shrv_vec(vece, rval, src, rsh);
 
     /*
-     * The choice of LT (signed) and GEU (unsigned) are biased toward
+     * The choice of GE (signed) and GEU (unsigned) are biased toward
      * the instructions of the x86_64 host.  For MO_8, the whole byte
      * is significant so we must use an unsigned compare; otherwise we
      * have already masked to a byte and so a signed compare works.
      * Other tcg hosts have a full set of comparisons and do not care.
      */
+    zero = tcg_constant_vec_matching(dst, vece, 0);
     max = tcg_constant_vec_matching(dst, vece, 8 << vece);
     if (vece == MO_8) {
-        tcg_gen_cmp_vec(TCG_COND_GEU, vece, lsh, lsh, max);
-        tcg_gen_cmp_vec(TCG_COND_GEU, vece, rsh, rsh, max);
-        tcg_gen_andc_vec(vece, lval, lval, lsh);
-        tcg_gen_andc_vec(vece, rval, rval, rsh);
+        tcg_gen_cmpsel_vec(TCG_COND_GEU, vece, lval, lsh, max, zero, lval);
+        tcg_gen_cmpsel_vec(TCG_COND_GEU, vece, rval, rsh, max, zero, rval);
     } else {
-        tcg_gen_cmp_vec(TCG_COND_LT, vece, lsh, lsh, max);
-        tcg_gen_cmp_vec(TCG_COND_LT, vece, rsh, rsh, max);
-        tcg_gen_and_vec(vece, lval, lval, lsh);
-        tcg_gen_and_vec(vece, rval, rval, rsh);
+        tcg_gen_cmpsel_vec(TCG_COND_GE, vece, lval, lsh, max, zero, lval);
+        tcg_gen_cmpsel_vec(TCG_COND_GE, vece, rval, rsh, max, zero, rval);
     }
     tcg_gen_or_vec(vece, dst, lval, rval);
 }
@@ -1087,7 +1084,7 @@ void gen_gvec_ushl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
 {
     static const TCGOpcode vecop_list[] = {
         INDEX_op_neg_vec, INDEX_op_shlv_vec,
-        INDEX_op_shrv_vec, INDEX_op_cmp_vec, 0
+        INDEX_op_shrv_vec, INDEX_op_cmpsel_vec, 0
     };
     static const GVecGen3 ops[4] = {
         { .fniv = gen_ushl_vec,
-- 
2.43.0

