Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1236331lfh;
        Fri, 27 May 2022 12:18:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdHxlhhuUQqof5AJImbgcMxyDURkW3tWKn/QaGTt0yoJjmTC7t5q6aaFprImCGzlifrtJ1
X-Received: by 2002:a37:aacf:0:b0:6a3:3c4b:45b6 with SMTP id t198-20020a37aacf000000b006a33c4b45b6mr28446098qke.354.1653679124145;
        Fri, 27 May 2022 12:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653679124; cv=none;
        d=google.com; s=arc-20160816;
        b=EOPjRABaqajRm8fK9ReaMCts9omKhHJXNDLtoFYGdFSYEQhXJ8pkOn+N1AQRAyYgAS
         Ua6r6d3h5YMndqWzwb/ZokKgzXtYrkDOrP+4UMYZDtcMAfARFJ59w4ZPQKSIvCB2zXCN
         rzrzpUEdHnALsvSYbAaz/ofj/PU0dAWZ6vIzg6gwAIuXuoRoOxI90Hhi1/svm2oRj6Cu
         6ynbfDA2FwPnvV0jcwc2ij5ma3Q1E8MnioaWBctttLBxwbg496M6PgRRMixaqZJNxtzZ
         VL07mneqnti8CWaTbg2MAMIIJzz93ea4gaV2BuJxmXSs2v40eV8CX70wcJDTcUP8lm3y
         L2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9pCmztrl1RZLprqKEM6lfLJzEMIvsaZMd2/ZOki/8Os=;
        b=SWi+/iSUiOKIECjZAPmndjNKNGNPV5ALBhKsUgtCacPXUHemGLBkAp71H9xp5fRUcg
         GXsgvE8QMhP5U1zYxL/YnJDjW184c7kdaYOIqT/fXNJ0a+EzzrLFbPebMCuKP3HA7D3U
         VTbBwKrRnS1ndnD9p3rDO0FrjU/gG5ntTJ6OF7bdWbH0wKCHNhEZ8sCAxz+GSMBcSc/R
         H2eCvWVlpUEQ6eC9+2yTozjBrXYqb13PEMcETbpM3oSnBo9mSttftxwP0mVtrzzA5UIk
         GLjcI6A+xUlDt6InLMmKuacMODCtCZkf7mtE4m/iaR7amtXgxEC29vWh+xsJ2SmgdWEm
         Y7wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CTfy7ghJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a05621420a400b0045acf80fed3si3062564qvd.106.2022.05.27.12.18.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:18:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CTfy7ghJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufTv-0007PC-B9
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec3-0003J1-5Q
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:04 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueby-0004LO-0u
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:02 -0400
Received: by mail-pj1-x1033.google.com with SMTP id z11so5276760pjc.3
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9pCmztrl1RZLprqKEM6lfLJzEMIvsaZMd2/ZOki/8Os=;
 b=CTfy7ghJUFyi07ULzalbz5Hd4sfiH1efKbz4+3CnefUaJ2d9QDe294LjVYbiQFguIo
 ZQQWLuWXqfybOXjIejKM4fCIQolKO3wjUKIRIUWHwF5P2tcDBwCJOoz+twsmOUG9kjdb
 /jnjmTVjkBotN/9WY2CD69E3Lt+JH5fgwv1utMwbG+mVyE6sT1pIn5QNkXqt0pmWom6p
 HDnL79Shk5wtIve9qjT+ZTlct+WFD+CaLnMdaj3QXPf9/8+fxe6kg8Il1FcV9lPUqsjU
 rQw5l5QdpnUds9qvKL0GYdKNQXg5uOPvuRZruJ7s3lgFqVBgiY1lU7aH6/b+FHd4/90v
 8YzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9pCmztrl1RZLprqKEM6lfLJzEMIvsaZMd2/ZOki/8Os=;
 b=wd/AGYR4Aori7G19or5mBljzs04xzk9kyzunqVayscVZ/BM9/jCSHepevoltAwvMG+
 gNCV8NR7y284g3Zi5p58qtMa3SZpO+ItNpPNisgEPgnxsaqhjnoTHpmnf7B8SehvL1HS
 xtYmF32SvjxPGVgJnKitI2/nwlXHp4l0qxSb/7CGl2fIhmOwC6an5LgihxD+tJKWuK58
 Vg4b1bsrPtGxrF3Rqb6B38csM/b8iOUUzLTUvmlCoNyOIrL9UH66buMgFFZ/jSuLrbCh
 olPiX1dDn/RUYBaC40zNlxW143Eke6dzLY3/3VR80vYdBsn/4XoS2CbHuWuw5R76sEa9
 2b4A==
X-Gm-Message-State: AOAM532eWTlLEnEpHOyxHbA2s84kEOTVM4VT3nE0B0rPR4GyeS9ukwvk
 euq8BBcQ46GDIqWe7lXWBr9dWtd3dj06VA==
X-Received: by 2002:a17:90b:1b08:b0:1e2:9cdf:c66a with SMTP id
 nu8-20020a17090b1b0800b001e29cdfc66amr30766pjb.39.1653675772504; 
 Fri, 27 May 2022 11:22:52 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 047/114] target/arm: Use TRANS_FEAT for do_zpzzz_ool
Date: Fri, 27 May 2022 11:18:00 -0700
Message-Id: <20220527181907.189259-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: JA4aEi9/xypN

Remove the DO_ZPZZZ macro, as it had just the two uses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 98f9cfa86c..52bbd1a4fa 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1071,20 +1071,17 @@ static bool do_zpzzz_ool(DisasContext *s, arg_rprrr_esz *a,
     return true;
 }
 
-#define DO_ZPZZZ(NAME, name) \
-static bool trans_##NAME(DisasContext *s, arg_rprrr_esz *a)          \
-{                                                                    \
-    static gen_helper_gvec_5 * const fns[4] = {                      \
-        gen_helper_sve_##name##_b, gen_helper_sve_##name##_h,        \
-        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d,        \
-    };                                                               \
-    return do_zpzzz_ool(s, a, fns[a->esz]);                          \
-}
+static gen_helper_gvec_5 * const mla_fns[4] = {
+    gen_helper_sve_mla_b, gen_helper_sve_mla_h,
+    gen_helper_sve_mla_s, gen_helper_sve_mla_d,
+};
+TRANS_FEAT(MLA, aa64_sve, do_zpzzz_ool, a, mla_fns[a->esz])
 
-DO_ZPZZZ(MLA, mla)
-DO_ZPZZZ(MLS, mls)
-
-#undef DO_ZPZZZ
+static gen_helper_gvec_5 * const mls_fns[4] = {
+    gen_helper_sve_mls_b, gen_helper_sve_mls_h,
+    gen_helper_sve_mls_s, gen_helper_sve_mls_d,
+};
+TRANS_FEAT(MLS, aa64_sve, do_zpzzz_ool, a, mls_fns[a->esz])
 
 /*
  *** SVE Index Generation Group
-- 
2.34.1

