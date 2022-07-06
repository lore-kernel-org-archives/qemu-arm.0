Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4567901lft;
        Wed, 6 Jul 2022 02:27:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vGh+k0rLUJJh+RxF2TOzykd+A4LQkB+Pob9pjl6/2mmwxfhSLZdHHTsgocPrgyaP5UNMsa
X-Received: by 2002:a81:1586:0:b0:31c:80cd:a035 with SMTP id 128-20020a811586000000b0031c80cda035mr24463885ywv.332.1657099645239;
        Wed, 06 Jul 2022 02:27:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657099645; cv=none;
        d=google.com; s=arc-20160816;
        b=nOakbVCaDtVhBrl0Wi2E4oeuMQbB2tMsgvc7rTGhPYZzqseJpaXQEZ+Qg2XDhJfPPO
         AaLxHu+YxKZLy2V7VN6MSutoIhuNIJu6V173D3+j0npIzz5jqjjWx43OUgSGVrk9dSb9
         VS21/ykKr2OAgaVAOqdN7K9oK+yRhitMgotIbhYbmbTCN/xvQiuCnta59ftI2s6k1uTM
         gbk5pgNuz+xHzgGVXXqDCcnUiwb6eZSGfwJ6CNOHLWruqiBxRXNWJ8Uie7PgxEGRlO2L
         qVTAyY0/NvnAF8fyPJBFLdM0BEH1dx1cuTq0NkCRwV6/35cN4UHN27uiKfo52Czvdrio
         FWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Pfb4nqNRQyJu+x99bnAw+yE0S7aPMHgZg/2pDMgRZBo=;
        b=rYT0QP3XmGL/IrzncFJWOZN/TyT8RzcnXtqb/hADTz9CIlx9i+Kij9vnC6SORpQwoL
         b/VJHXTQE0slQ+nVxS5mv8rjiknUthkmjt1tk/seREjnE0GTXZycMm52FpXU0Cm950WG
         D083cmdWt3drTQGw89GFS2agQj63waKL5sweXMnmRhDS8I8kgN5Tda9ueFXaLpaLiGYH
         PtmNhbWYaKi/jNlhQiA4js6Vinb2kM825qA0l+6Pd2Ze4orthjuyd428ITByNa5QTANL
         HYQJQO86a4nDbKHzdjjZ/I+sUiIjVic9io4tiOKFQBnGKfZAPD9OY07EdzC3BEXT8dFX
         PclQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YVfis2tL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020a056902124d00b0066c8df21be9si61613486ybu.557.2022.07.06.02.27.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 02:27:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YVfis2tL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o91Jc-0006gx-Kz
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 05:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Ly-0006fn-Ok
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:47 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:41825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Lw-0000lx-43
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:45 -0400
Received: by mail-pf1-x435.google.com with SMTP id l124so3355696pfl.8
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pfb4nqNRQyJu+x99bnAw+yE0S7aPMHgZg/2pDMgRZBo=;
 b=YVfis2tL6P38QmeZKjMMr3YOtGQlLYhAb46d5OKOxX+M5so3sj+IYWUrp+PNXgH3rb
 RVg7EhTzkFVjgKeRvpa2AtpHtCM5d04XnqwDB49OEpO7RINf7uMP3TLn/tFdUZSYItlx
 WcZ0xAS3vCPONwgvNGXrfHzsIbjD35eoZq3cIbtvzS7ttfztRkc1iYzLc9Jdp7KQZmsB
 6s0AFp/aB+BtqDs/nd0QG6bd/l708M1skuOP5u1GPJ+HYFQ8INm2ZLubVOMSuuPBLPNV
 HH+/QIRqiUTEeGPQSni7qCFYl8fggtn4D7ekmm7VXkFYiv+5mvV3U3bZdA8BTjeWaoSq
 MB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pfb4nqNRQyJu+x99bnAw+yE0S7aPMHgZg/2pDMgRZBo=;
 b=R4U5GeWw6BBz6RcG4cI4ttVa3JufZV3aC2bp3prXr9R1/uvSG9XkQfGRrKY9TqmjA/
 5Y9qykD8MRiNsn6Q6lqPkWF3HzES4Hp1rkwuhubz6KRuYMVl41nTY9eOJq5Ls2eUd184
 u67r2fWxDXx+TCg/bm3Q9df+KRmqeHU6cflhIsSNm283MLEEemNTrmBlOqYqb/47ZhT6
 znxc6/IqdJnIXHZMfSCTo78ESvaDl9FpRu3A2/6rb85QIZJXZijQg0BZmyUKFAG3V9o5
 +dyusOON8bopRhWQZpxSkiuKPJ60K5qoygWCgTarUaPl88+Pr5HKoDlLPx8sAxPaE/dG
 ZuCw==
X-Gm-Message-State: AJIora9FO4WvxlKvLhCsYttGqatZpMLsn1iGsdgbOwff1aux9QG0tHOz
 +c0SBTmf9tRBaxHFt8o5QaFVgg==
X-Received: by 2002:a63:293:0:b0:412:4f02:950f with SMTP id
 141-20020a630293000000b004124f02950fmr11939919pgc.187.1657095942767; 
 Wed, 06 Jul 2022 01:25:42 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 31/45] target/arm: Reset streaming sve state on exception
 boundaries
Date: Wed,  6 Jul 2022 13:53:57 +0530
Message-Id: <20220706082411.1664825-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-TUID: r8P9CLfyUQpG

We can handle both exception entry and exception return by
hooking into aarch64_sve_change_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 67f8ca98f2..11f70725e5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11753,6 +11753,19 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
         return;
     }
 
+    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
+    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
+
+    /*
+     * Both AArch64.TakeException and AArch64.ExceptionReturn
+     * invoke ResetSVEState when taking an exception from, or
+     * returning to, AArch32 state when PSTATE.SM is enabled.
+     */
+    if (old_a64 != new_a64 && FIELD_EX64(env->svcr, SVCR, SM)) {
+        arm_reset_sve_state(env);
+        return;
+    }
+
     /*
      * DDI0584A.d sec 3.2: "If SVE instructions are disabled or trapped
      * at ELx, or not available because the EL is in AArch32 state, then
@@ -11765,10 +11778,8 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      * we already have the correct register contents when encountering the
      * vq0->vq0 transition between EL0->EL1.
      */
-    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
     old_len = (old_a64 && !sve_exception_el(env, old_el)
                ? sve_vqm1_for_el(env, old_el) : 0);
-    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
     new_len = (new_a64 && !sve_exception_el(env, new_el)
                ? sve_vqm1_for_el(env, new_el) : 0);
 
-- 
2.34.1

