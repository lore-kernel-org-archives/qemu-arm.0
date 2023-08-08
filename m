Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1877160ejb;
        Mon, 7 Aug 2023 20:13:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcVJua1L7lW/lugbxsRQbPugC1wCbOcOSjEVTs9V5jkomCvsJzH4XF8KlFPyyVyzj6edf3
X-Received: by 2002:a05:620a:2218:b0:76c:e661:4492 with SMTP id m24-20020a05620a221800b0076ce6614492mr9395305qkh.38.1691464422314;
        Mon, 07 Aug 2023 20:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691464422; cv=none;
        d=google.com; s=arc-20160816;
        b=qmb/ayhpO4fsUeW9jYuo0MfXZcw3KJVZH3EJwNCMsMa15V5+fNbU93cjsoor8Hy6Vc
         CTqGsIcIVBh2CsDWM6E2hWNxqtQKeg+XD4DILY9VPRSv6IxpZgnrpzXDIrAIsTT7sySf
         25SXKqS6n9uRl4NfF7qBemHcEiyZp6iAE+SIlDe/h+cPKsxQltMNal8z8wraeltOy3xG
         10VwGmor3L/LXNpBMOMJPpH4X+AtaOJtvZ2LtOdm+LyDzcqL6pkJ5L8YFEcxLm6jHDSN
         rclM14v/nQGvMLLSs2ehvl4KR5OHrIWG3duxOyfK62MvAFI+/By2X3YHWHqQDz3YD7GR
         qXmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xGq6ojlO3QPTHf7EEiR5KaCrsEAyjZrCLlJyqE12lWg=;
        fh=hqs26moy805PsHbwd88lUczy2QdlfF59ojSMxj/DeWg=;
        b=lebaAFHhl2OEvzkUobUCx1Qd3clASMIAZLTw7MSjc+T/eIHPV+hkF3b2nMYik07Bsl
         Rlbq2WWXdvVwqG/6Hz9HJ6xBthk3cyGsUGXH4OPUV2apeAtPCGWv68TrsWo4a7E+CHCH
         ctE2XQUvAgTXO9ucXGheOqmnVRAvipmOQCrFa4ypHo8TwWA4m6yu4mEK8z/l94ih1KOD
         HEZxDbJbzItCa1+qkVQQHJaL8Qc324JTltf7zxIequbcgonL8F6n8L0Jezv/cto2oPs+
         0QrBbCRLxw/8NYk9k+bQs/tqAwSRhll/jKqRtX6A/DLB/2vLQ/XcxpWgZesSNiIPA/Cu
         ndNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s4pAehY6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8-20020a0ce0c8000000b006377ab7c9edsi5403089qvk.508.2023.08.07.20.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 20:13:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s4pAehY6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qTD8U-00006s-NI; Mon, 07 Aug 2023 23:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8S-0008US-8T
 for qemu-devel@nongnu.org; Mon, 07 Aug 2023 23:11:52 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8N-00007u-KT
 for qemu-devel@nongnu.org; Mon, 07 Aug 2023 23:11:51 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-686f090310dso5201148b3a.0
 for <qemu-devel@nongnu.org>; Mon, 07 Aug 2023 20:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464306; x=1692069106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xGq6ojlO3QPTHf7EEiR5KaCrsEAyjZrCLlJyqE12lWg=;
 b=s4pAehY61hMkKZnfSH4ztqXCuVZAHCKCm21f/15x/Ko43yox7QAr5yoOxoFjIYZh94
 m+qwIvG/2Lbi+NnWRxqEjTeLDcTQ3ZXUn19lH5un1rH8Ai0fn0PMr65OPQyhpJHc2GAN
 hZlrOtRrgSBjWdFvL8SLAxD3AKteI6ZLiLnVxyymCPTEN2GOYDD2R4DAwETQKaoDIfV1
 HTP2lvwqPFiUSwsmdxwV7xG9KZerZAeQ+Dk68tNlpgQHUj7MVITlptJGUu2XTSCSrYtr
 JVkkBJVjHOXpjHt3uzuo/OkVm8/bWPEr35z5tuPXU3AeXThH1/4RrNM3h5+vR/TmS9Mw
 scCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464306; x=1692069106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xGq6ojlO3QPTHf7EEiR5KaCrsEAyjZrCLlJyqE12lWg=;
 b=Aw0ytOZbvWNeUqPczi4IVCdZZZmpvoRunURr9AbPqw7oEbLCJjTwJbefwIfzr3Q3Tn
 jbAmU68ZENQDeH17CoLQKhpgBPh01X0JLX4dZDOYvg/47N+MmEMlYTzsoY7VrBytKwh3
 flHF73x/xWFprJQci/zjwhUG/z5+ti8bF2omSY9LUmH0xoFo7cpkMgqWGoQhw8Tpf/V6
 qF/58FwdkQ2XMeBoVsybZ02XP1FkgAiAHZMkQ9HEHq3LtcGgmcotUkT2Pv70RwD879aM
 IUCIJ8R0GeOa956YRbmj8XK+V+ijIkznjCb3saecF/o6rNLCLOR3pc10Kp4Xk0/4kj+a
 WHIg==
X-Gm-Message-State: AOJu0Yx3r93utZ8ZTrAqRmXtr6zlpAjsjqSkAeswv5XWa1WZ9WNL8Djz
 rVUqIIpLO0EdCKpZ+xTLXZM3hfhMOSHZwKda2VY=
X-Received: by 2002:a05:6a00:1acc:b0:668:6445:8931 with SMTP id
 f12-20020a056a001acc00b0066864458931mr8514102pfv.29.1691464306436; 
 Mon, 07 Aug 2023 20:11:46 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 02/24] tcg: Use tcg_gen_negsetcond_*
Date: Mon,  7 Aug 2023 20:11:21 -0700
Message-Id: <20230808031143.50925-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: n3uxmqC1R31m

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op-gvec.c | 6 ++----
 tcg/tcg-op.c      | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index a062239804..e260a07c61 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -3692,8 +3692,7 @@ static void expand_cmp_i32(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     for (i = 0; i < oprsz; i += 4) {
         tcg_gen_ld_i32(t0, cpu_env, aofs + i);
         tcg_gen_ld_i32(t1, cpu_env, bofs + i);
-        tcg_gen_setcond_i32(cond, t0, t0, t1);
-        tcg_gen_neg_i32(t0, t0);
+        tcg_gen_negsetcond_i32(cond, t0, t0, t1);
         tcg_gen_st_i32(t0, cpu_env, dofs + i);
     }
     tcg_temp_free_i32(t1);
@@ -3710,8 +3709,7 @@ static void expand_cmp_i64(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     for (i = 0; i < oprsz; i += 8) {
         tcg_gen_ld_i64(t0, cpu_env, aofs + i);
         tcg_gen_ld_i64(t1, cpu_env, bofs + i);
-        tcg_gen_setcond_i64(cond, t0, t0, t1);
-        tcg_gen_neg_i64(t0, t0);
+        tcg_gen_negsetcond_i64(cond, t0, t0, t1);
         tcg_gen_st_i64(t0, cpu_env, dofs + i);
     }
     tcg_temp_free_i64(t1);
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 76d2377669..b4f1f24cab 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -863,8 +863,7 @@ void tcg_gen_movcond_i32(TCGCond cond, TCGv_i32 ret, TCGv_i32 c1,
     } else {
         TCGv_i32 t0 = tcg_temp_ebb_new_i32();
         TCGv_i32 t1 = tcg_temp_ebb_new_i32();
-        tcg_gen_setcond_i32(cond, t0, c1, c2);
-        tcg_gen_neg_i32(t0, t0);
+        tcg_gen_negsetcond_i32(cond, t0, c1, c2);
         tcg_gen_and_i32(t1, v1, t0);
         tcg_gen_andc_i32(ret, v2, t0);
         tcg_gen_or_i32(ret, ret, t1);
@@ -2563,8 +2562,7 @@ void tcg_gen_movcond_i64(TCGCond cond, TCGv_i64 ret, TCGv_i64 c1,
     } else {
         TCGv_i64 t0 = tcg_temp_ebb_new_i64();
         TCGv_i64 t1 = tcg_temp_ebb_new_i64();
-        tcg_gen_setcond_i64(cond, t0, c1, c2);
-        tcg_gen_neg_i64(t0, t0);
+        tcg_gen_negsetcond_i64(cond, t0, c1, c2);
         tcg_gen_and_i64(t1, v1, t0);
         tcg_gen_andc_i64(ret, v2, t0);
         tcg_gen_or_i64(ret, ret, t1);
-- 
2.34.1

