Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp393851ejc;
        Tue, 23 Jan 2024 07:35:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/KuoPh2qcNEtJP8Sg0/92DM6VnLHVzdcEFYE/+vCzE52Yx4lNooOIsJBgGLGqkUhayCRW
X-Received: by 2002:a05:6830:14:b0:6dd:e778:881a with SMTP id c20-20020a056830001400b006dde778881amr48745otp.70.1706024103750;
        Tue, 23 Jan 2024 07:35:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706024103; cv=none;
        d=google.com; s=arc-20160816;
        b=QCCwUVUq/fX/eEhBKH+Imrwl4m+OPhgW0fgVpTqCtwqmoOOuTs3BFENfwquEZ1hkbK
         OG8flc14/GZhAaG+STsyoet2TuU0AGfRjXY9sP+IMwZXL2hL9x7EPXAg4kbPVYGEdUwK
         EanLvl8N+VrIpjXu28cIl3tdGL2PpMdnpax4vKFQslFyOe5K1M+lWvNXQzufIvHBZMsv
         AGpQ6t97e1zmgcbZX7FdGVeI9qML7KWeygi6ft9rkGVxH7HrfNjPdvIXldM2P4CMAFLf
         rfzrsM8MzcQX0W0g2L/ANM7qmycrzw+w1IK3eT9gfmImjdzTmVapPUdMBDbQRZ03Jhmn
         j3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=WserJn90ElmaLFKu56K8+uISef20eii9M5Mz4+TMvho=;
        fh=y40LNZs05R3i5IV6fHXzzcWaHqhYI6WuHX9dcMo1lak=;
        b=TLRuzaV/AfnLKVjqjfKFbcg/BqindNxcwKAWPPTbuywwMjToEPSLudwtkt0fOZ3KS0
         v0fazBvmLu6LawNKPDnZkZrrCITUW0QRIkBFD7/VAqtpWlgiwyTpZ11k+SuYZAQ5q5oZ
         h28xT0Eo9XuUfTzjDXSrPVlBR8/Jmxt0C3guLCAUpEnYMyug1a4/XAjso5PSU6rvvZWy
         TXVTUOjVht8HaYaBbZAHlspfYxbW1RG/5MCnc3j9KAWCQdlmL7ijR/DF07QQU4OvZKaR
         5q9oZSSQ6YMEr+r146hXvI+h2CkXjLaCJW+fdXV3c8IeqQ+aTLKKO1TSsRlv8l7W2FdC
         KU3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qY2FlyLk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8-20020ac85c48000000b00429f4a60ee4si8328655qtj.20.2024.01.23.07.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 07:35:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qY2FlyLk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSInC-0004RM-3f; Tue, 23 Jan 2024 10:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rSIn9-0004Jb-UP
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 10:34:24 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rSIn7-0006du-VN
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 10:34:23 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e8d3b29f2so53156125e9.1
 for <qemu-arm@nongnu.org>; Tue, 23 Jan 2024 07:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706024058; x=1706628858; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WserJn90ElmaLFKu56K8+uISef20eii9M5Mz4+TMvho=;
 b=qY2FlyLkZk80wBcCUV+dwD8aPMknPtp+1ktRyPQ/fer+R4qx34saGu2JFWFukPDpNe
 Nj8IEKM9DuwUvuZWCJ2FAhnuSl1CW9eUDVhUns4WMcmMqIokatmTcFgr0lAf3I2aqejb
 vW7Pc2HStswp1D6Gcz88jgGb6CdPBxDPySWPMY3f0iRHngjGakrjp+Wd3mRB3RRAQ4Y9
 CuUZ2VjZDABe5ugc6kpKjRe3V6wyDnEKR6ZogVB02p8Mu495wHVjIUjG9IqszIlVnbtV
 zJlzwyaH0McR0Yvurklgjxw/f/I65b5g0ASOhuYNb2XRvsHFMkEH3c9BdA0oxx+4LX1f
 46zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706024058; x=1706628858;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WserJn90ElmaLFKu56K8+uISef20eii9M5Mz4+TMvho=;
 b=mBxXG2u2JLBCEHG77xwrNfec1+IjAKH4X0VNRFyDkj1QHHYofi5HNGXsQGTvkUCvyY
 lCdiTLmrOvFpsinnh7bk3h6YBNDTygnn++jyPuEPHc+E0myMl503KK2lqK0hbrfMGTwn
 4cKmXk10xnuYnhlU+UdNFLswu09zCQISmrwYzBzuAVymG+44QQmpvAO/2ljLtEQuEHsO
 w98GJrxfovBhQnoDD+J0zUh5LeSley7xnIMlItI9/RXC6c8xXWosa8qQsFwFVZm4EU+j
 +O2FlNp45mf521Kf892H11/vaOKbvjZSYYk5EkW/yyZKFc7VMaoLhlRFusrKE5ZheZfY
 I4yw==
X-Gm-Message-State: AOJu0Yxcseh7XQsAIm2x5+sGYV+nEo7qFSZVV5Oljwy9dxbyzA3VOeyL
 ZpdI76lxcXS/Ol9O9e0d9TK24/o4DwTCGM6edbeOP6KvIA9F/F69Oc+ohbrQpU3HifRH8LW64DB
 B
X-Received: by 2002:a05:600c:4393:b0:40e:526b:d5f5 with SMTP id
 e19-20020a05600c439300b0040e526bd5f5mr167632wmn.247.1706024058481; 
 Tue, 23 Jan 2024 07:34:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a05600c4e8d00b0040eb6ce137asm2577783wmq.39.2024.01.23.07.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 07:34:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/arm: Fix A64 scalar SQSHRN and SQRSHRN
Date: Tue, 23 Jan 2024 15:34:16 +0000
Message-Id: <20240123153416.877308-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nmC4q2/VvjG6

In commit 1b7bc9b5c8bf374dd we changed handle_vec_simd_sqshrn() so
that instead of starting with a 0 value and depositing in each new
element from the narrowing operation, it instead started with the raw
result of the narrowing operation of the first element.

This is fine in the vector case, because the deposit operations for
the second and subsequent elements will always overwrite any higher
bits that might have been in the first element's result value in
tcg_rd.  However in the scalar case we only go through this loop
once.  The effect is that for a signed narrowing operation, if the
result is negative then we will now return a value where the bits
above the first element are incorrectly 1 (because the narrowfn
returns a sign-extended result, not one that is truncated to the
element size).

Fix this by using an extract operation to get exactly the correct
bits of the output of the narrowfn for element 1, instead of a
plain move.

Cc: qemu-stable@nongnu.org
Fixes: 1b7bc9b5c8bf374dd3 ("target/arm: Avoid tcg_const_ptr in handle_vec_simd_sqshrn")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2089
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 27335e85407..340265beb05 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8343,7 +8343,7 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
         narrowfn(tcg_rd_narrowed, tcg_env, tcg_rd);
         tcg_gen_extu_i32_i64(tcg_rd, tcg_rd_narrowed);
         if (i == 0) {
-            tcg_gen_mov_i64(tcg_final, tcg_rd);
+            tcg_gen_extract_i64(tcg_final, tcg_rd, 0, esize);
         } else {
             tcg_gen_deposit_i64(tcg_final, tcg_final, tcg_rd, esize * i, esize);
         }
-- 
2.34.1

