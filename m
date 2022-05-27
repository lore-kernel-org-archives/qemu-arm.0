Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1213735lfh;
        Fri, 27 May 2022 11:37:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwW3fPpogO6Jsa4BOdeVL7TE8PHcsA3JI2tEazw97CQtvhoDwjaO/a2Xgt0KgebVB5cO7J
X-Received: by 2002:a05:622a:6184:b0:2f1:e213:9c7 with SMTP id hh4-20020a05622a618400b002f1e21309c7mr34535507qtb.467.1653676632675;
        Fri, 27 May 2022 11:37:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653676632; cv=none;
        d=google.com; s=arc-20160816;
        b=iRp6VMZXhQlsMUnrxy7pqqJ0vB46e1x8k8pSAx9J3UbGpZSxQRqOOcLjqmj2kZMa5W
         wbN/C8DHR9d1WrugJTZKShwuham0KSJfmxtNHvadeujhfa9MnlMOH3LANb1aY3gzVet9
         3G4wc5rJyDRFwFLhFm9qMm3RHlOf93+3Q1Gs32eL9dvVNtuH8R7sT9yj8rgw//mA9RuG
         fhEtMw/GEeg9RW0VADWrPI0OthniU6JpWSQbO/Arfw5ePonmzUf6WEGnbuKm+PbktdG9
         d7cgGGOCkYKUA1QNf3BATkSGaXdCy0ejoyiQb5GxedZQX4p88BATmX0hl2WPbVwlYCpP
         ObuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SNjPspaVjmF/Q6dYljY5Ro4UYIofrJ0cK2s2o/saVww=;
        b=Uz1CuppfTT4mpNfn/2BcuZT6j80riOCLKtcca2TuMSBxale/eiUN0fHUsXHEmiCJER
         JdHcSTvDIH+rsrAeJGrIu3eEi4Pu0TVngG0ihNmndJpG4v+OPtlCm/Ns3jKu+SpM06HU
         AWflsP5zjydZzsvE9Q0PHad6bPqfjwcNZ2CT7SD7SXmiFhbFDiLfwEvqiI+HJ8GmBtJE
         tmqKXWF9ZUxPtSkIP5JA2+ujUr09vUHwdcn2mLzGvMBRTfdznY2/qDeB22ApjpI6zcOm
         G59YC/+7ODtvwz3PgQATcztzkLLlaZNJLnL08quqi4R+JWjWppR9mfXMFZ27zNbyz+tD
         xMAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cfc6pY8u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9-20020a05620a280900b006a00ad9ef6dsi3941373qkp.148.2022.05.27.11.37.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:37:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cfc6pY8u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nuepk-0007Fs-5O
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYq-0007ll-56
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:44 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:44662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYm-0003g6-5M
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:43 -0400
Received: by mail-pf1-x429.google.com with SMTP id x143so4955858pfc.11
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SNjPspaVjmF/Q6dYljY5Ro4UYIofrJ0cK2s2o/saVww=;
 b=cfc6pY8ucbUvNBdOuTTJaH8u9sIahCaJKieYJLhh34CxQMbD/HDR65WXLduBSlXHa4
 IOfkaFN40C8LXKSsmBdA4POxcf5WW/edcfUE9WvDkAsGov0Zg3bdUUKYQtWiW4cNEGgJ
 xkvPFuUm+WZM5DCJZLZutLUQycNHXon3JM1LFnGK/ngbMtdE8Oj0wadAbQvxOOF3JSLe
 r0zEC9OEAVdl0iUkRj7O2MpHZhxetQkOWODc8/O7R1H2IFpG+SodEM1GrswPHujF4Lpm
 d7D5T7KyUWdM/RXl3hEFOESUEYYUjFoo787kDT6Kgqk0jR8YJJIAIwmNj5gts9OOYm9T
 iAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SNjPspaVjmF/Q6dYljY5Ro4UYIofrJ0cK2s2o/saVww=;
 b=N3MJgRh0U7+YdGLFb02AJDfkv6IOW8F9/jTZ2LOR2kYgi++/ifdS5GiQEf1oAqUzme
 MgxEf0blgXujcnb8fjIyUwdgDBrIut9/aqiVwObGGmvjoOpY1VSyiMZBoge5FBWoMAtQ
 3SGAS2NOKpmqh0/iBDxUGtzEtIkN5xLXm/cooIyFwKqt83JsNA9q60ups9mKMpplYe+y
 9LFt8QyCo8bpENYOf+4cho0gnK8DtxxVC6TyyZcuW48ayoL+5GugZLTOXPuSp4sEay2u
 6x7XA/iwFq87vnKncQQcAjhBBnelE/ozCBtNf9LS6DfBrYtF1qihSqsxrzlcptZXJPNp
 4LNQ==
X-Gm-Message-State: AOAM532WnfbwFr2/420AVhvUmNBH5Btj78qw2RA0EVoiAxSHB+604gbI
 WF1cFIj4Be0PZwRQeNo9fgYAr69oOLyTPw==
X-Received: by 2002:a63:2107:0:b0:3fb:ac79:50ed with SMTP id
 h7-20020a632107000000b003fbac7950edmr3483186pgh.105.1653675578851; 
 Fri, 27 May 2022 11:19:38 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 032/114] target/arm: More use of gen_gvec_fn_arg_zzz
Date: Fri, 27 May 2022 11:17:45 -0700
Message-Id: <20220527181907.189259-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W+05dzqgxZGb

Two uses of gen_gvec_fn_zzz can pass on arg_rrr_esz instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1b3afcc24c..2dbf296128 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6425,7 +6425,7 @@ static bool trans_MUL_zzz(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return gen_gvec_fn_zzz(s, tcg_gen_gvec_mul, a->esz, a->rd, a->rn, a->rm);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_mul, a);
 }
 
 static gen_helper_gvec_3 * const smulh_zzz_fns[4] = {
@@ -6946,7 +6946,7 @@ static bool do_sve2_fn_zzz(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *fn)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return gen_gvec_fn_zzz(s, fn, a->esz, a->rd, a->rn, a->rm);
+    return gen_gvec_fn_arg_zzz(s, fn, a);
 }
 
 static bool trans_SABA(DisasContext *s, arg_rrr_esz *a)
-- 
2.34.1

