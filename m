Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1260409lfh;
        Fri, 27 May 2022 13:08:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHI+RzAfYgIXeW9aGdvW1h+6GUYzihfBEiYEjm4STUxjYd+jKgZISWAVVAXRFiTby1iGAr
X-Received: by 2002:a05:6214:f2a:b0:462:3225:3d9 with SMTP id iw10-20020a0562140f2a00b00462322503d9mr24516473qvb.15.1653682112881;
        Fri, 27 May 2022 13:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653682112; cv=none;
        d=google.com; s=arc-20160816;
        b=mOWZSLl7RnCnqt+KstN7GLJJcE8ZS8C8doT3D/+EMurZZw0smT/kS9KXFWQO0/N7r2
         hBYd/492qp5AKvWYST2hLEjlJwM6EiN/Qr/ufzvIelKzyfU/e2pZ9nMvnmunnFRzEuhM
         Jc2oxUymdU8gRJhV6WvUebd7jkG7JW4DVFiPTewlQIQbXOAwXg6enU/50g7ssrUPRlMO
         FZeJN6dc/jG0o+q4NYyyGsI+SLY3vACA/K3+rUG15gu7zaILu1ase2BUHCQjgGoFJyL/
         KonrmV3H181xGD+Dic7d+X1SY+NKwD97849/TUE6omdC+f0vX2SqcOg+EGDe++MoxTuL
         K60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7IF0KEO8ABSzXPCF0h34SS7UeFXG1MXnszmURm6kdYk=;
        b=E/dcEvmuwG6xvjZQZDVbF2AoBvC6TyqCOQT6DQmLOouuyy1CA8jDS9HUo4QL9qdUn+
         1U91GuqAjeDsz5wV9/kuzgBuUo0bJLCUVwLLOTnOb2m3o7xuzCX3M34QsNp7iJWrye37
         8phYw3dHgA+ryffX6j+pq/8sdABt88QG/LJLq/WWmuAolEXcnqMMQHA7Kq5ZBmjePzkY
         5EIjcY+hlhNp8vMoRK+t1BfpFgIqxcbBHiifRj5GLuPvL2Opttx7J26Vn1cLGcKWRD3q
         0Eg3ZhutXMu9wI3zEnChbz5xfSTxqpio+H3Guwlp/c2GzZgFDw4Ueu6scU3oTBTGOjrV
         7dEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CiQXnTd6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020a05620a284c00b0069e8a40fffesi3787090qkp.11.2022.05.27.13.08.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 13:08:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CiQXnTd6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nugG8-00005G-Aw
	for alex.bennee@linaro.org; Fri, 27 May 2022 16:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefn-00021u-Qb
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:55 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:33477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefh-0005P1-CO
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:54 -0400
Received: by mail-pf1-x432.google.com with SMTP id 202so5034088pfu.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7IF0KEO8ABSzXPCF0h34SS7UeFXG1MXnszmURm6kdYk=;
 b=CiQXnTd6A0jT7cZPkk8rZyX+houTU/8lBxjT59RxUI4zk3e+CN6wMUMH34arXimNKQ
 PNFZ1DD6xN0Nfo8l2EdNsKIWwJANy6vbnWev+YFxEw0VbbvaOWhv6YyGlhsXhZss/w9Q
 KLqHQMwuZQpHgpFsdPBaf1zlgQ+iXc7tEh09jF2lT7Fywo8D4/jAJef4PzkGVmUyot1I
 Ic36rgeg4Yc4BURlsc9mQlB9WcPyLI2ESSFteUkN1XGRdAIa3KxnSZ1dnhrziq4tm6CH
 syTgZAMjasWFZkTz/Ip0BwcxhmLZV53FRsZrqXCubJWMU7qg7F+D4msaYZ4rFksMsq5z
 yFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7IF0KEO8ABSzXPCF0h34SS7UeFXG1MXnszmURm6kdYk=;
 b=hidGDUzYO8bPujzB2OWqePZ/itsASi/rOK6LG8IRyD5HYTJEWerceIltksmyTYAMQT
 J7fFVgTOxsg5QieLRWOy/pPxCjT30H4xEBPeF9D4yEvCRPbK63f1pUt+nwzQ/ln1fZTy
 AWKXo5G0hyx9SniicirEHFhSrxeVfgs7UtJDvYxyUoD2AGys7prC5k/yVwNtJ+lyYl7h
 KqbfuNRqPU0ktL+8ERlm6HWJqFITXBuASCz08wxpJK6tIjAendJ3ciwLu4+dQY7TrSfI
 DTz2vtpej/UiCFRHrsxwviNQJL4I96ezisdSYGFb0AonrKafNawvLyfpMhtUPIQ3Nb4v
 t0zg==
X-Gm-Message-State: AOAM531XX1+wJCiskDknefYvgh9mF646fA0Ro7jzKjqstvLiBfgihlmO
 koN1d3biq6wGZ4HE9PTAl1V/hk+81rmriA==
X-Received: by 2002:aa7:8141:0:b0:518:425b:760e with SMTP id
 d1-20020aa78141000000b00518425b760emr42595887pfn.27.1653676007410; 
 Fri, 27 May 2022 11:26:47 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 105/114] target/arm: Use TRANS_FEAT for DO_FPCMP
Date: Fri, 27 May 2022 11:18:58 -0700
Message-Id: <20220527181907.189259-106-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: kzHzoEa2azVC

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e2ae387d62..886cf539a5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3970,14 +3970,11 @@ static bool do_fp_cmp(DisasContext *s, arg_rprr_esz *a,
 }
 
 #define DO_FPCMP(NAME, name) \
-static bool trans_##NAME##_ppzz(DisasContext *s, arg_rprr_esz *a)     \
-{                                                                     \
-    static gen_helper_gvec_4_ptr * const fns[4] = {                   \
+    static gen_helper_gvec_4_ptr * const name##_fns[4] = {            \
         NULL, gen_helper_sve_##name##_h,                              \
         gen_helper_sve_##name##_s, gen_helper_sve_##name##_d          \
     };                                                                \
-    return do_fp_cmp(s, a, fns[a->esz]);                              \
-}
+    TRANS_FEAT(NAME##_ppzz, aa64_sve, do_fp_cmp, a, name##_fns[a->esz])
 
 DO_FPCMP(FCMGE, fcmge)
 DO_FPCMP(FCMGT, fcmgt)
-- 
2.34.1

