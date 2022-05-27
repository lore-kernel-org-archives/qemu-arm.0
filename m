Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1264288lfh;
        Fri, 27 May 2022 13:16:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3B3a1KsSBrI9p/Yqn2Eb/tYdgZYE9vDdx0tJifOLLWqam4JPA/uNYw2NXn50o0ClFGCQU
X-Received: by 2002:a05:6214:20c1:b0:464:36dc:126 with SMTP id 1-20020a05621420c100b0046436dc0126mr1196801qve.31.1653682574285;
        Fri, 27 May 2022 13:16:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653682574; cv=none;
        d=google.com; s=arc-20160816;
        b=e0Usg1EN26FKc9JrDaiQTZ1WSiTLJTeqQAEEROYeNCW9BIhRyMlQ/OeYrnoDWEyfEF
         qsB+MQivHMKZjSSWpZNetbIlSxcIunp5+TJFvR9B5aH9XJy9vtfpQNR7sCIZVABHJSXk
         k50J5ymLOLn4DlAH6uRYTEB+rm3YAB3yN1r16pTuR9U0LNN0m4CmQLN09kXCQR92PB2r
         9vuBBFPjEh4Cct7VoZ0p13n8J+eQDG4gUSqfqdW5193DyOqPjZE3PodKb3taU0+cDWPx
         K/YQClr/zY6nCjl+lC7LAV3yUjIjTnSfF3tLNZI9ZoLp4l0QxdpoVXodxJZ35brSQ5Bl
         Z4yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JXs4KxlVAWW8+RgYn/YknaXv8pQTUABwGWD2au3w4Q4=;
        b=EOyMiICgTyScTQJzmWs0iE+FORi8HEF8PtEp/Wrvlw1n9wXI3/fW9iBbey9cMsHLll
         aaINIYnFxAFIlozz4okSUzSeDFapmfeuCc4qXnUTDiwqpAfg3UesNhnmKwGO4WeXib9d
         UFlJ9RuqDenj9VP4K5j18YjVZU6ya9U9eEWH1g9n76zLCa6houbaUYBdah/2ScvzWomk
         7TaPsHQIO/WbjWaTVIaIUgoDcOrTdxs6fZ6XTVhbsV3ZDojg725xhrKH8090DaWupVZm
         alYmmHJneFZMPK2bcovQ8ajCaK7sB4XIZMMhv6jU93xoZoDmX4wOKbyVVyWJHKA1/khf
         Luew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B7eNq6vx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9-20020a05620a430900b006a3fbf330bbsi4200364qko.146.2022.05.27.13.16.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 13:16:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B7eNq6vx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nugNZ-0004CV-GV
	for alex.bennee@linaro.org; Fri, 27 May 2022 16:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefk-00020B-2k
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:54 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:34730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefe-0005KK-OQ
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:51 -0400
Received: by mail-pg1-x52f.google.com with SMTP id g184so4612705pgc.1
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JXs4KxlVAWW8+RgYn/YknaXv8pQTUABwGWD2au3w4Q4=;
 b=B7eNq6vx3uovoWiGkD0BUqqNhK+PcQ/toJlZREiuSduw8TzrI5KirGrZTToIAftV4j
 1gQro3lat4qSTAd+r7w/tkanStuv0dVchqSmHTlI4R1mH/awoYKSfBkTsfIMDdbTrhHq
 oGkHT8JzPutryZnZiLwffECh81FUDp06SUJcnIlTqoKdIwoSRN1m7+kWV2JtBhw71PQv
 XmIv+aez4HSkij++/aIYRDv2A3+nE47S88FaccTz5Grbvp6F7kCzAH+gnYMrDPeAkc22
 s/cweWP7Vso2inkrKYpuPq4UsbPnoZk/4ut2+VmF2rJyg+ZyVCS+1BIeVy+ECeiPfH04
 +RdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JXs4KxlVAWW8+RgYn/YknaXv8pQTUABwGWD2au3w4Q4=;
 b=bc63ld8caUaFjUJsvScdwTqFqn7UTeig2ik4KQ0SAXMrVdSZ7d58Nex6iSVd79xxOR
 X8PpS2aSKjsNTBHlRkkcr+DiF8LL+BZ0W0bcekVBxRBzivG6Zgbha8nxNprBBGElivv7
 aIEKk/IkWwkb73rZMhdFBmDe9SZM9eiqrtmtLLTn2eOrdBi9eh1WlqxfLbGGZkxuAeqm
 pLEuM+wcF0I/Xb08IZZwPt3de4/QnjUoCX8PD3X2T0zl1/c3GHrSJv7BY5+c/xzOg8Ty
 hycG2SzyynbRGj39RAxYnenJD+4eBqLPqI5VLIFdF0C67QuelvAO6dYfaHaA4PatdFnO
 r8iA==
X-Gm-Message-State: AOAM532dhuS2N3AwijxiU9nu6u7mqxyG6gAFG+QyzKkBrwvqjWxIqqOM
 3cKLe1pYfTDRvbq6sX+tRfzR1w==
X-Received: by 2002:a05:6a00:c85:b0:518:b4a7:cce1 with SMTP id
 a5-20020a056a000c8500b00518b4a7cce1mr23319115pfv.66.1653676005357; 
 Fri, 27 May 2022 11:26:45 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 103/114] target/arm: Move null function and sve check into
 do_fp_imm
Date: Fri, 27 May 2022 11:18:56 -0700
Message-Id: <20220527181907.189259-104-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
X-TUID: RxQY8aIvjWl+

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 75854a7c6c..b47d5d7f21 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3911,33 +3911,34 @@ static void do_fp_scalar(DisasContext *s, int zd, int zn, int pg, bool is_fp16,
     tcg_temp_free_ptr(t_zd);
 }
 
-static void do_fp_imm(DisasContext *s, arg_rpri_esz *a, uint64_t imm,
+static bool do_fp_imm(DisasContext *s, arg_rpri_esz *a, uint64_t imm,
                       gen_helper_sve_fp2scalar *fn)
 {
-    do_fp_scalar(s, a->rd, a->rn, a->pg, a->esz == MO_16,
-                 tcg_constant_i64(imm), fn);
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        do_fp_scalar(s, a->rd, a->rn, a->pg, a->esz == MO_16,
+                     tcg_constant_i64(imm), fn);
+    }
+    return true;
 }
 
 #define DO_FP_IMM(NAME, name, const0, const1) \
 static bool trans_##NAME##_zpzi(DisasContext *s, arg_rpri_esz *a)         \
 {                                                                         \
-    static gen_helper_sve_fp2scalar * const fns[3] = {                    \
-        gen_helper_sve_##name##_h,                                        \
+    static gen_helper_sve_fp2scalar * const fns[4] = {                    \
+        NULL, gen_helper_sve_##name##_h,                                  \
         gen_helper_sve_##name##_s,                                        \
         gen_helper_sve_##name##_d                                         \
     };                                                                    \
-    static uint64_t const val[3][2] = {                                   \
+    static uint64_t const val[4][2] = {                                   \
+        { -1, -1 },                                                       \
         { float16_##const0, float16_##const1 },                           \
         { float32_##const0, float32_##const1 },                           \
         { float64_##const0, float64_##const1 },                           \
     };                                                                    \
-    if (a->esz == 0) {                                                    \
-        return false;                                                     \
-    }                                                                     \
-    if (sve_access_check(s)) {                                            \
-        do_fp_imm(s, a, val[a->esz - 1][a->imm], fns[a->esz - 1]);        \
-    }                                                                     \
-    return true;                                                          \
+    return do_fp_imm(s, a, val[a->esz][a->imm], fns[a->esz]);             \
 }
 
 DO_FP_IMM(FADD, fadds, half, one)
-- 
2.34.1

