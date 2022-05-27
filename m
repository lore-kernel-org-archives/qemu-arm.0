Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1235761lfh;
        Fri, 27 May 2022 12:17:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzEwPkpIcFRuCvC3IkDky8rH9oeOsGm9LeJO/2IPqBjzd90EYuguA2LHugjnIeo7mASVsf
X-Received: by 2002:a05:620a:903:b0:6a5:8399:f1dc with SMTP id v3-20020a05620a090300b006a58399f1dcmr12581647qkv.170.1653679046415;
        Fri, 27 May 2022 12:17:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653679046; cv=none;
        d=google.com; s=arc-20160816;
        b=ejT54uAwr/rcnMRwn6nUcD5JUGgXRR5XkUY050hRNp7B3aBmxWGbpuSVD9a04wYTe5
         ofItUKIheObebTKvHObqQiSbVBpbAsWdudrfPMfPs8SZrFbYEQ1u0is2DAAB7Z1+pi/G
         t3iJ2w2qg0IFD1Wl5CtWfb89afqBECaJuy4PEYlLLtQKnb2P7QdVgEl0VqjvioljBPHw
         gOOK2mWf6awwtPw09qFXVsV8PJTlaBlNqy2AbwseU0HCRD8sYIF8sR17J1rO/SJ5WZmI
         IFnk59+46gBiI/LzHOvm0+AZOy+G1NoAFRJJeXoqRBlmNqFfMjhaXf5p8x2gtrksDY/P
         wzRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qg4jOWuyGW8gIwmtO3xBqQIVz/6oC7t9pIznMyeg9C0=;
        b=RpWQLnjtmRtg4bFDt8fSR90+FXriwT6YrQeFowFLIX0mMMbMdV5WzasO8MTiHsE7t+
         g7xsDFj9ca5XH+jQoLu+MCKn12CPdEPzxHEM7y6PH0wrHXRz2HzGn4Jov/IZnjB8ZfDP
         LHCkWQmJ2pJxav0TMJJ5L5fowiAuS0keoYT0IHN2/bjzg7jmJzAJdanq++6VcQEclqQh
         7r79GJ3w1+4i5KY0Q56t+mR+l0IyqylGVX3hszZbeHkXrueb5H7kWvafgW0MlpFSoiE6
         8GsEIdJngDLtk7DI0iLDrytQlrecUqYYpu+K90cVi70z/F8H+LKLlObIx60d4kx7FPrv
         IJnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HpTmF0G+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp9-20020a05620a458900b0069e7a0f15d1si3620687qkb.29.2022.05.27.12.17.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:17:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HpTmF0G+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufSf-0005Fi-TY
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecT-0003lm-Jl
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:29 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:56094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecK-0004V7-NT
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:29 -0400
Received: by mail-pj1-x102a.google.com with SMTP id n10so5266795pjh.5
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qg4jOWuyGW8gIwmtO3xBqQIVz/6oC7t9pIznMyeg9C0=;
 b=HpTmF0G+AczJGNffqHzzx0Lu+WAwJUDv6tqtmG8AaeEOQlZR6Ui1+taboyeSG9MIDv
 E0C3ZkCWkM8TAqZdDrEjDJpMzF+/i/a8M4Wxn07IST8RgRrqFL9mPvbNp9dDksy6NMyu
 izaMpL5DEXm4nEpWVzcSTbQondNBda2kQ0kksvB2dCiKsftBAcmH65UwJoWWgg5LVmAG
 kF6dClBfxqjyOcO+nto9MuY49PLFWOUv0OAfKzA0Ih2VC84Z9hE2vNV3m6VyI6NLhWO9
 tV2I9F5lhO0shFiaDQ43e+WwSVK/HKzIkT18YhCZS60VtGD99Pg23F5rrJXCQuJdNQDY
 BtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qg4jOWuyGW8gIwmtO3xBqQIVz/6oC7t9pIznMyeg9C0=;
 b=JgyzrgbhDGwRVEi08ceQu7qfOOysxHvSOTkwM28KgEM6zAcHX8GXCrMdCr6l48kk4+
 I6wJv6dZKMEuV7YJ8tcjhvUdf/w6eziiSmChadm/7A+xWLYQOcBKAcucWyom/fS0k6U9
 qvxMnPvfPgDblvmVWlYldOBIdB62QHoXy+3UuEByNuE56ptBgp2OtygAZLpernQdHS4j
 ywCN75UHid4SJXyrjzkMqS7JaQ98fMEu5P3rF1UoFEqTWQxnrziSXrHilyVfukAB57WV
 jcrqcWrBMvfM8pl9nATIqSYXjvHoIggU4YO4SSVc8Bo1anKlvc+sNfr8PxCbNjwmxzKH
 hMmA==
X-Gm-Message-State: AOAM530nSpSPX8I9X8ku33ZG7C3XPYv/jpU0kpEn817wTFaIrH1dP7CQ
 qKl/xS4JnM12r9b1NAoUxvbY+2b06nWUDg==
X-Received: by 2002:a17:90a:149:b0:1df:3da1:3549 with SMTP id
 z9-20020a17090a014900b001df3da13549mr9669771pje.90.1653675798217; 
 Fri, 27 May 2022 11:23:18 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 076/114] target/arm: Use TRANS_FEAT for do_zzi_ool
Date: Fri, 27 May 2022 11:18:29 -0700
Message-Id: <20220527181907.189259-77-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jg79+ZB/U4pV

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e6434589f4..b8bd1047b0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3330,14 +3330,11 @@ static bool do_zzi_ool(DisasContext *s, arg_rri_esz *a, gen_helper_gvec_2i *fn)
 }
 
 #define DO_ZZI(NAME, name) \
-static bool trans_##NAME##_zzi(DisasContext *s, arg_rri_esz *a)         \
-{                                                                       \
-    static gen_helper_gvec_2i * const fns[4] = {                        \
+    static gen_helper_gvec_2i * const name##i_fns[4] = {                \
         gen_helper_sve_##name##i_b, gen_helper_sve_##name##i_h,         \
         gen_helper_sve_##name##i_s, gen_helper_sve_##name##i_d,         \
     };                                                                  \
-    return do_zzi_ool(s, a, fns[a->esz]);                               \
-}
+    TRANS_FEAT(NAME##_zzi, aa64_sve, do_zzi_ool, a, name##i_fns[a->esz])
 
 DO_ZZI(SMAX, smax)
 DO_ZZI(UMAX, umax)
-- 
2.34.1

