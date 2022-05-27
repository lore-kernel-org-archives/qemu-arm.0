Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1254342lfh;
        Fri, 27 May 2022 12:56:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwYOTGPtQ9OSIX3gRZ8HFkyYQz6poI3hP3AnayF5NSAkT0/xIu1PdBr7WLGDmlbW1TdyzG
X-Received: by 2002:a05:620a:4723:b0:6a5:8d56:cad9 with SMTP id bs35-20020a05620a472300b006a58d56cad9mr11909810qkb.134.1653681406553;
        Fri, 27 May 2022 12:56:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653681406; cv=none;
        d=google.com; s=arc-20160816;
        b=L+rQ3JB5uXSC0hOQj94bK1U5iurHiYHM1jG+FZ3zOhdWRabNlfTfMG+5DRfVMhr9VU
         WfAZc8nqOfYOWXl1XJSlB0kW/uQ+soReqRQohgUibLw+xX7nYge8g6u8Oy9czXR5kflE
         fUpEyRTN/43fQ57XQm5us8J3q3yynUycbYo+MWF+7t9CPgSzdFb/bmxTZVrUScWgqSWm
         acxdRoH1vP1s5POQauyOlOx4uk51WFlfxJ70N1MbcSt/25+ngQWqI/LNjG1xTeq1d6Bg
         XMVO5CBufK9qhKfXfKQ1mnpu+ZTY9+EudqiUCqsd/YvVrQ34xif7c/xikAsFYJis2a/W
         TXhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=moRuPu35tTQvlASaPQhZUHJWwZHkrQYA17JeQIDLO7g=;
        b=nudflX1UZEFm99VjswfcMfPMCyYjzuMZzdelXD40cdz9HMXx9klN4Dvew6cE490yX6
         3Kzt5ZbWnyMFjRhkGQecRRF/QdKiD3NZ18rAVryMSaXNY5he2VrmNuNfrYHJPFRafAg2
         zj+KVNRYidoJtUAdGnEufjpolqN2D1S05a7qI0dZjEsi6k89WHZzgahAAGGD9xiEz+MV
         nwulRryAATQCUD3zVNsQsRYQps9u0+d3Epuu6la9fy7dpt6m+1SEsawkxMr227ReAqYc
         gUR7QR9mPCSvlY0KpN4HZcZOC9SevfHGmil73uq6UwWqoySFeO0CJqkBKvrfPm6Qav7P
         97Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HYBhyjVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp8-20020a05620a458800b006a58351234fsi3974737qkb.151.2022.05.27.12.56.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:56:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HYBhyjVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nug4k-0007Hz-21
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefd-0001tX-R3
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:47 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefY-0005Js-Ix
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:44 -0400
Received: by mail-pg1-x530.google.com with SMTP id v15so4566168pgk.11
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=moRuPu35tTQvlASaPQhZUHJWwZHkrQYA17JeQIDLO7g=;
 b=HYBhyjVJHNMY04ovI3R6Ik6RrHznPx7l1G3UT3KkxaVkx0OmfAVnTHbE+zKqr+eACs
 03o2HTQehDHmmAwmSaH/nCIHMF3k3a38LzMpOagDhpsBovQq3R0TSJSNkimgPuF9avNR
 3SGpUH0jleCj02mXRwXit0NudomgFX0j0//x08bkbvEibSw0CZilwFhBHzS13H5um9LO
 X+GjCLPNQCD2V5Ee/H6boIW1/h1m5Jp1qP8Oof70dSwfW6pf3c7D+38jttzQU3zDGGOM
 6654k7ViOJBXs0n1Y4FOBBGOJpJj+wWrgOvtXUswN16lkMAazUCTBmzSNyAhWKpAThYE
 LsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=moRuPu35tTQvlASaPQhZUHJWwZHkrQYA17JeQIDLO7g=;
 b=bWCBIpZ00DU9RDPwLkUf1c6WkkZqq5tg27dCVXczScSR3iSox9RULNEtkeYTGbp/BS
 2K41vrBxnVsO3ptBRH8BOvJj2lD8fnduoCzqXhPwZbMBiuhV/fWDMFt6rZ+q7+ZFDSf9
 7izr0rkij5rJq+bY09rArNe7MRA7KBRWEQTR8dMqga7bI+7JOwRcoR6rVBtmRbtqRlZH
 zyoKUll8ve/NXGf2QtUl38gb1DKz9zfsQ7r44nz9WmbcLoYMhdZde55ql9UfTqmdvJ7n
 3ODleLe8d1AYemzy6U/lG+5XkHTsmDQ1BJlCcfVeXgXgPRTrd6W+1XZo3202HzBwvI61
 rgJg==
X-Gm-Message-State: AOAM531teaO9LVFzSS+SusmlPwPdVDoyAe7ndjyx4+NnEPjPdSAIMzFd
 oCSEDlvJquoOGWTHZnwp19J8xW/Tp/yzfw==
X-Received: by 2002:aa7:888c:0:b0:505:7832:98fc with SMTP id
 z12-20020aa7888c000000b00505783298fcmr44729234pfe.0.1653675999815; 
 Fri, 27 May 2022 11:26:39 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 097/114] target/arm: Use TRANS_FEAT for do_ppz_fp
Date: Fri, 27 May 2022 11:18:50 -0700
Message-Id: <20220527181907.189259-98-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
X-TUID: p44B6Y6D3z9P

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 41 ++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2f96f52293..2ee48186ba 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3696,35 +3696,32 @@ TRANS_FEAT(FRSQRTE, aa64_sve, gen_gvec_fpst_arg_zz, frsqrte_fns[a->esz], a, 0)
  *** SVE Floating Point Compare with Zero Group
  */
 
-static void do_ppz_fp(DisasContext *s, arg_rpr_esz *a,
+static bool do_ppz_fp(DisasContext *s, arg_rpr_esz *a,
                       gen_helper_gvec_3_ptr *fn)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status =
+            fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 
-    tcg_gen_gvec_3_ptr(pred_full_reg_offset(s, a->rd),
-                       vec_full_reg_offset(s, a->rn),
-                       pred_full_reg_offset(s, a->pg),
-                       status, vsz, vsz, 0, fn);
-    tcg_temp_free_ptr(status);
+        tcg_gen_gvec_3_ptr(pred_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           pred_full_reg_offset(s, a->pg),
+                           status, vsz, vsz, 0, fn);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
 }
 
 #define DO_PPZ(NAME, name) \
-static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a)         \
-{                                                                 \
-    static gen_helper_gvec_3_ptr * const fns[3] = {               \
-        gen_helper_sve_##name##_h,                                \
-        gen_helper_sve_##name##_s,                                \
-        gen_helper_sve_##name##_d,                                \
+    static gen_helper_gvec_3_ptr * const name##_fns[] = {         \
+        NULL,                      gen_helper_sve_##name##_h,     \
+        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d,     \
     };                                                            \
-    if (a->esz == 0) {                                            \
-        return false;                                             \
-    }                                                             \
-    if (sve_access_check(s)) {                                    \
-        do_ppz_fp(s, a, fns[a->esz - 1]);                         \
-    }                                                             \
-    return true;                                                  \
-}
+    TRANS_FEAT(NAME, aa64_sve, do_ppz_fp, a, name##_fns[a->esz])
 
 DO_PPZ(FCMGE_ppz0, fcmge0)
 DO_PPZ(FCMGT_ppz0, fcmgt0)
-- 
2.34.1

