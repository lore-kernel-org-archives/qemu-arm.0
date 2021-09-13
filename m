Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3520905lfb;
        Mon, 13 Sep 2021 03:09:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZSr9JZH7FOmtRwTQGEmUmV8ZWM9H92mjsakBgiPSrc+dq9qCGaKjz1/DEEClITO4basks
X-Received: by 2002:a05:6902:1204:: with SMTP id s4mr9050108ybu.493.1631527753087;
        Mon, 13 Sep 2021 03:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631527753; cv=none;
        d=google.com; s=arc-20160816;
        b=K2T7iPgKGWZyzAVn5sWQ2IPdsPT7AgIsYEoCDVw1mBYiPJoB58yan3CCDp7JWbnCF/
         Exc0q0Tw8YTrnBqpFXGNT4XvliBP6BAwWB4jUca4YaSd6+KkWQXClRjfB8jBzmPJGshZ
         XVCeJAqtFMTiboJi4EomDbFkxtx9vzpDa5hD3t5jQQ/lu1j0L0GK4DVIxtkueCGg4auG
         yLO6xUxk7mAI412V3WE3acp31r3xCyX8I8Oo9Nx1sAuoBon6F15ynMJauJiDhiDClKiR
         iJnONB2Zr+EGznNAsFqV8BGjpRx/AzswD3gt93L/211uLn3B9JaJG5sSO/q1ze25VfTn
         +uVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=d0zWOUJgsCXe3Z17gWKDqIbTwVvMvDtAMTrMvlaEcgQ=;
        b=anc/2IqBeLS0QgI629jMKWUMsIuu5hS5m7P4VM8kBAnzg29rHgBXjQ11p7twITfKn4
         DarHMAn8yGLEF1VAkTZQw/TTGByYGb7zQrbVG2uxnDN46SMv/hN+/L83weAQsT2IBWxb
         xgdyxSk6yE6Rz0E4hV36ZhkkyspM85lKgzCKKEDTdJicvLt+PSvjqmEKdl5pYAIuQCLj
         33mL1aIUHDNE8T0TWkX3yBxAMc3UgM294vssR6Rjtc7PPxHPubTct2DZWNHxfOjNdPUt
         0b40Y1v2VB5Itc6oV7RALLqY+hs2l3cy9nfyXtjlINgxyASW4vMV/y98++8N/jcIlqwT
         M7rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i3raDPP3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v186si7228808ybb.340.2021.09.13.03.09.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 03:09:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i3raDPP3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPitk-0003Fp-DY
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 06:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPify-0007d5-U3
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 05:54:58 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifr-0001w2-J7
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 05:54:58 -0400
Received: by mail-wr1-x434.google.com with SMTP id q11so13673568wrr.9
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 02:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d0zWOUJgsCXe3Z17gWKDqIbTwVvMvDtAMTrMvlaEcgQ=;
 b=i3raDPP3ROErZO2ZQCAIci5druwMNjWwIYOlvxTVXLZaXk71UVE0TIG9IzB9YuKT0U
 o/x+PuPFAToxqhazA+9KzX0/Crfpy4jzWKLQrpvAIqtrZvDhO6wXYBmg4wFuFauNFPPv
 JuYqhc43dlb+6f76C9wWd3IUA1YJYx84+GN3+JNzNAkK+RYHUzu8OzZrAkE9UYKWB7QJ
 3Z8eMiruLyWqKtXvTDlpinTAdGHc5F5bdfcfIZJFaz38ypsgfUnnKi4y4ib7CF09Cdow
 pVTUR94DKjX71kuWrKhYEG/5RnEiPFQvE4LiGlqn+Q+VVgfyyqUgmE97e/V1EcyZCj5G
 Duug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d0zWOUJgsCXe3Z17gWKDqIbTwVvMvDtAMTrMvlaEcgQ=;
 b=M7sX05BtT0c1H7bmaKGGaA33SGuDBQSPf/zTixiNquhXCMElEw2TIdFO9qWFsFItEr
 jJs42AWMb73NVm8mR752wdPyqfnvR3/xduIJY174ckrypCOPFQQVUmD0JCoj0okaX3xy
 9uuJ9vWRd10jVgfxFpSjCsU71q4HJRwnE8S0OlyTV+mw7vQkCUSstWowYuaebf0t+TIj
 TfN1of5FhDic2aeATu0BSLlRCIHTZZ6pgOHhD2J3T3ZKDH/nXSz77D2MlMYu3+VJ36k7
 V9qSoOa8bRtXrHhSQRQLYOOrlH4mmLg1EaKeRIUkthUfso1AeGPcgFrVnXDR/RdJXw2P
 ffXQ==
X-Gm-Message-State: AOAM531ZUteobIhLNYjDoDby8AH8G0qQzZ9n4GM+PPHPOuU9NyL+ERyX
 /7Gka76ulYTp3llbyir/AtIbH7HX86C/8A==
X-Received: by 2002:a05:6000:188d:: with SMTP id
 a13mr11254674wri.99.1631526890123; 
 Mon, 13 Sep 2021 02:54:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 11/12] target/arm: Optimize MVE VSLI and VSRI
Date: Mon, 13 Sep 2021 10:54:39 +0100
Message-Id: <20210913095440.13462-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913095440.13462-1-peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gUk3irFwdRUw

Optimize the MVE shift-and-insert insns by using TCG
vector ops when possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-mve.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 5d66f70657e..1fd71c9a1ee 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1668,8 +1668,8 @@ DO_2SHIFT_VEC(VSHRI_U, vshli_u, true, do_gvec_shri_u)
 DO_2SHIFT(VRSHRI_S, vrshli_s, true)
 DO_2SHIFT(VRSHRI_U, vrshli_u, true)
 
-DO_2SHIFT(VSRI, vsri, false)
-DO_2SHIFT(VSLI, vsli, false)
+DO_2SHIFT_VEC(VSRI, vsri, false, gen_gvec_sri)
+DO_2SHIFT_VEC(VSLI, vsli, false, gen_gvec_sli)
 
 #define DO_2SHIFT_FP(INSN, FN)                                  \
     static bool trans_##INSN(DisasContext *s, arg_2shift *a)    \
-- 
2.20.1

