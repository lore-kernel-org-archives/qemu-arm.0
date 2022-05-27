Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1262235lfh;
        Fri, 27 May 2022 13:11:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQ12M0iJN4aNK3kBpF2GB+KnNaqL/HJulftEeceU5EHdZaazTCF6+p6Z4b5CFlOmVmLQsN
X-Received: by 2002:a05:6214:1d0a:b0:462:2155:95ef with SMTP id e10-20020a0562141d0a00b00462215595efmr27468014qvd.83.1653682306429;
        Fri, 27 May 2022 13:11:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653682306; cv=none;
        d=google.com; s=arc-20160816;
        b=O3XRUrNVy1ncvPWyo1FJ1/M1/zcVRCfgd6xXr4oONpMnUjmngaxWd66CBx8y8aN5ye
         Uo7rREzm0c0lxzQfUx4dZQ2nj8mpCsfk+b5Mg0SpnwwqgoT+6u8rQ8Ul+HitPyrC3YU4
         yzNRQOKi6dpMXMJLQZ3xHkKEo8PMbl0CmoPT1zazUgezkzDNT+eXyHa5mH4q6Iz6ZsBA
         5uIeEWjGy8DuE81DLlgcfVmLqVvbdzBvtTkuwy4TteoW4UkiVCMQDcEw/uoo9+WV2LKs
         OLcUxpeETpvNyXGuBGDZ09w0dI7yu9Uwl8mZ9fV3ZgdxpwOz3l+GB52NHCDwdaOuEX5U
         PA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9Qx3xfNnFRj3mRZ+xrWUd8t9kdyC1v10woKkh4xhoEg=;
        b=AmGaxy3Z9s6BX92xckxqPGhOvT6xnH7oWGVs3qP52pAMAYzvdwzT61W8OBAJj2FEiF
         LUj3ryfMtXHe6n4QXsNKqtn/4PyXwH67XvmAXO1JtXmLsbQz8w64vzTIpqfzYGYCdc82
         g7J7cMQUw4aT2VJtFyOqkC7dZynNYBkbj2aNyus1w6HQYPsbRNuHPNp6ILdEIIKjc7u9
         KyYoBIyt4BONDYRnECZTLs52l5IkDKCj+7tr9fZMWxXe1kncF7ViDA0LyyJ8p0qcrjGP
         qpnLiY3etKUMg1DI16lwZ83aKjVA+N0s4b3t9YRiOrJFezabFSYBqZ2KHJ2QGp/OtDWL
         gcnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aW9ryXWl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020a05622a038b00b002fa8c574729si3407634qtx.746.2022.05.27.13.11.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 13:11:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aW9ryXWl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nugJE-00059t-U0
	for alex.bennee@linaro.org; Fri, 27 May 2022 16:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefh-0001x9-Mo
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:50 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:39715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefb-0005Nl-Mc
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:48 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y1so4994181pfr.6
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Qx3xfNnFRj3mRZ+xrWUd8t9kdyC1v10woKkh4xhoEg=;
 b=aW9ryXWl4r2bQca72xS4LysZn+gIyM+qsBrOapSKfvCsEZDCoPS8rKAgiujgZtBXXE
 c3RmwwM7JmvvshQ1BTBj48dcuTv3zzTZXrOgcEGlTXKQSnK9I9JA0jffyaHhNUTfv9Ok
 wDluYSTqfCLssy2+Srt3e3HBZ4191n+VYhPJlR2lfmXlGx+YJHEpZNjXgUmLWPcFQWBP
 dAFiQaiZaTtwkFSGqQ9Y7tvg4/mxP3CVeZ0Pafy5Qfv53uIsZ57Skx7jJQMMzoN0mZDF
 qtj0/HP/QD1ZBQdzAn8YgmPdxu02hSaYWugBqGEhb7o0OEK69nsBbQaZlzQJaR6b8h9g
 qJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Qx3xfNnFRj3mRZ+xrWUd8t9kdyC1v10woKkh4xhoEg=;
 b=jdGvbDr7+bpSsZiabfEk6sewddzhmtzwUvfgQAox5gBzD5aKUNcok8ajnDGqSWs/n+
 G0+fyEAp5QhvN8w6rJMvySrmYIzfZaWHPMCPgXVz8A7xgPmLeCTY/PlR5HZNeNMqlpha
 zCeT/naKxdrXat+KzsF7WcQG+MRqqp/WkOaYMbUOFnRUqNADqiJaUuVzn1OjB0JtZs9t
 8mUGtVEquS06cwg/KVvjErqAQwz6IiZB2N34OZ0jW+0j+pW9lbTPXPibDeP/ZEXpZm91
 6iPme+Domv26hkiZB5Rs4vQMCw4LZEye62dRxH8Tw5rW7F8AlpVxUXHRTdb9qKg3qHEr
 f2+w==
X-Gm-Message-State: AOAM5303J8MFpTubh+I/nSSagU4i6H16RUO0wV4j4E/lCv1ANAftIFrd
 njKCXJqXJ6YDQsfgTq/7CLqQvFpVaMFHpg==
X-Received: by 2002:aa7:939a:0:b0:518:9843:86cb with SMTP id
 t26-20020aa7939a000000b00518984386cbmr28253566pfe.37.1653676002398; 
 Fri, 27 May 2022 11:26:42 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 100/114] target/arm: Use TRANS_FEAT for FCADD
Date: Fri, 27 May 2022 11:18:53 -0700
Message-Id: <20220527181907.189259-101-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
X-TUID: gP9+kVm8DR/y

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 30 +++++++-----------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1108494919..e323b2d6d5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3966,29 +3966,13 @@ DO_FPCMP(FACGT, facgt)
 
 #undef DO_FPCMP
 
-static bool trans_FCADD(DisasContext *s, arg_FCADD *a)
-{
-    static gen_helper_gvec_4_ptr * const fns[3] = {
-        gen_helper_sve_fcadd_h,
-        gen_helper_sve_fcadd_s,
-        gen_helper_sve_fcadd_d
-    };
-
-    if (a->esz == 0) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           pred_full_reg_offset(s, a->pg),
-                           status, vsz, vsz, a->rot, fns[a->esz - 1]);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
-}
+static gen_helper_gvec_4_ptr * const fcadd_fns[] = {
+    NULL,                   gen_helper_sve_fcadd_h,
+    gen_helper_sve_fcadd_s, gen_helper_sve_fcadd_d,
+};
+TRANS_FEAT(FCADD, aa64_sve, gen_gvec_fpst_zzzp, fcadd_fns[a->esz],
+           a->rd, a->rn, a->rm, a->pg, a->rot,
+           a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
 static bool do_fmla(DisasContext *s, arg_rprrr_esz *a,
                     gen_helper_gvec_5_ptr *fn)
-- 
2.34.1

