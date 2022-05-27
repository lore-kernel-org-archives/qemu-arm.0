Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1232626lfh;
        Fri, 27 May 2022 12:11:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxp9NIpxdYh9hdKQ+48AFhfgjWx2u0nuo6jumSlVIWfE6w+wwdF8phuKsUZozjiQr8nv0/
X-Received: by 2002:ac8:7d0e:0:b0:2fb:fc3:bf07 with SMTP id g14-20020ac87d0e000000b002fb0fc3bf07mr12008262qtb.382.1653678709733;
        Fri, 27 May 2022 12:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653678709; cv=none;
        d=google.com; s=arc-20160816;
        b=QYMsPQFGAx5WR0fnTYQnWdCtrNanIpPvHhy8LKZX/tCwP3aHSsnJMpsxunC6ZWLyLg
         tKo/ac/UGvX8KJT1iADqwUjmtSvQASj/PDwtkBqjhRFf4UbHcRGg9UmbYh8osrgGcQoL
         UJaY4PHlseJRjRspXRtQ0d7RaG7rmlM9kzDUQFsrfQ7b7c0cBZFsOrNIjNGgkoPeFW6f
         sHvJ+1ljaq+xeqQGaBDnK7vmJnFyrbARStiZIto+wS4cET5OuGEsKd/+5dsnW7Td7H66
         2FWQU/kE+KszHPyyWveqS/b9nLfmMgLI9YbJJoEfcHjWh2XXHOWK+wP6drrj5kgeofGI
         lbHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dvMJbfFzK/OVwVCkNWdnLpNcVizUtQdOBWHSbpDC9Us=;
        b=PZKgXdB9srEZ7BJDfuWP+pUOSZKVCXmUqolbd/sQjvq5zNiASwiFPELhHeZnyWDhUn
         6KEOtDuC5zh+fQGx53YWX0zyZ1XxzdHwi55xYSgpMnAg0uCzOY/zqbk0fDe9qfBTui1r
         9H5ar2GUZgOCjzOqoMkFBdSBiUDu/7uqBje7Z/s5bcmv3w7LYdrEPxjRqU5p3TriK7uu
         tvGiydC4VEi7frSO7+u/AWvYxUBGMF+u8dRm1oWN6CW5WAFhkCFMKa+zmtR8IDhrnTSc
         cLf0xcEHvsmIuvipeQ1RcXBLb1gYKz040OCyBpQBomkDeeEAQbMc1Gp/gRLMFhAR1yx/
         rX1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LnnJidRK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 27-20020a05620a06db00b006a02844c378si2891814qky.292.2022.05.27.12.11.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:11:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LnnJidRK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufNF-0003iA-8N
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec3-0003J2-6W
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:04 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueby-0004Li-10
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:02 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 q92-20020a17090a17e500b001e0817e77f6so7779709pja.5
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dvMJbfFzK/OVwVCkNWdnLpNcVizUtQdOBWHSbpDC9Us=;
 b=LnnJidRKiOJbMUsVfKhoqFLVqoHPA2byRRsNiWU2sWskUc9QCwBVHsJhAnuyuBhejL
 DtIxZZKMD0PhPJgGwsGPkGJc3VulGAqQSVckIfXHunVBuzozWVv+cVjJhonHGLxdtVVy
 hkKtTS1xAMwo1t+rUkT71kymUhuWri+P7p+jDp21LWpikBMFUkca9llqck+hohuy3zn1
 QXcHUl3hVTyCZJvawg/VwBS8Fvvb0ryJe/4Gfg/8TvsqG3rc9kBesSW7dc20LM1BcISU
 dyH8AD34Tz4WlixhRaVOrLV0yRn5EauVWEViuvrlizOX+h8c+h2JehBL6u3daqFR28/I
 q3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dvMJbfFzK/OVwVCkNWdnLpNcVizUtQdOBWHSbpDC9Us=;
 b=W0Aj0Hrf1DucDhu94CG99gZKW0jlVpVQYmfw1tDgkBg+KybvaMHuoM3N0p9paf8MdD
 Q8kr0Ppo4fp5cx01N8qNUL1d+1a+P+UbYP65M9Bde/qV5VUbZj48zvOP42JVvYVwbxXC
 q+dsFQFGkPHQhsPc/dbBeGLGG8iGB+QZiw/NW4A2nkMtlsc0VwnTvpdJVW0OGQEcRZ2n
 hayWwbHxGBBN5ZMN341hXq9As8IYtUcnD+SscV+izAPwI/JwfZWyr5P7QDyIaQZt1yca
 taRuF03tIite5w7Xy/PknDlJoU1YS/Cxl2MWh+3qMAI+C+9cH+BHhYtFMfQAgITVQwgx
 EVmw==
X-Gm-Message-State: AOAM531IWyy91qLgh5fwehYVLJUoMbXZU6eJSDaMdnbGH10FKqW4uvN6
 x4WAdMrqZlYFGu79L2ky4mwxWbGKz6vuVA==
X-Received: by 2002:a17:90b:3ec7:b0:1dc:b008:3cd3 with SMTP id
 rm7-20020a17090b3ec700b001dcb0083cd3mr9691461pjb.226.1653675774206; 
 Fri, 27 May 2022 11:22:54 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 049/114] target/arm: Use TRANS_FEAT for do_index
Date: Fri, 27 May 2022 11:18:02 -0700
Message-Id: <20220527181907.189259-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SGOmPvdRpF5i

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 35 ++++++++---------------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 44c2342923..dac29749ce 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1126,33 +1126,14 @@ static bool do_index(DisasContext *s, int esz, int rd,
     return true;
 }
 
-static bool trans_INDEX_ii(DisasContext *s, arg_INDEX_ii *a)
-{
-    TCGv_i64 start = tcg_constant_i64(a->imm1);
-    TCGv_i64 incr = tcg_constant_i64(a->imm2);
-    return do_index(s, a->esz, a->rd, start, incr);
-}
-
-static bool trans_INDEX_ir(DisasContext *s, arg_INDEX_ir *a)
-{
-    TCGv_i64 start = tcg_constant_i64(a->imm);
-    TCGv_i64 incr = cpu_reg(s, a->rm);
-    return do_index(s, a->esz, a->rd, start, incr);
-}
-
-static bool trans_INDEX_ri(DisasContext *s, arg_INDEX_ri *a)
-{
-    TCGv_i64 start = cpu_reg(s, a->rn);
-    TCGv_i64 incr = tcg_constant_i64(a->imm);
-    return do_index(s, a->esz, a->rd, start, incr);
-}
-
-static bool trans_INDEX_rr(DisasContext *s, arg_INDEX_rr *a)
-{
-    TCGv_i64 start = cpu_reg(s, a->rn);
-    TCGv_i64 incr = cpu_reg(s, a->rm);
-    return do_index(s, a->esz, a->rd, start, incr);
-}
+TRANS_FEAT(INDEX_ii, aa64_sve, do_index, a->esz, a->rd,
+           tcg_constant_i64(a->imm1), tcg_constant_i64(a->imm2))
+TRANS_FEAT(INDEX_ir, aa64_sve, do_index, a->esz, a->rd,
+           tcg_constant_i64(a->imm), cpu_reg(s, a->rm))
+TRANS_FEAT(INDEX_ri, aa64_sve, do_index, a->esz, a->rd,
+           cpu_reg(s, a->rn), tcg_constant_i64(a->imm))
+TRANS_FEAT(INDEX_rr, aa64_sve, do_index, a->esz, a->rd,
+           cpu_reg(s, a->rn), cpu_reg(s, a->rm))
 
 /*
  *** SVE Stack Allocation Group
-- 
2.34.1

