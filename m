Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4400918ejc;
        Mon, 27 Feb 2023 00:18:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8V0inu2lXdnW2JqRi1rDi0bWsqLK7s6fDEu8bf1BM9rmh5m6/ZF9UeFoaZhkFm7lewqUZc
X-Received: by 2002:ad4:5966:0:b0:572:636d:626a with SMTP id eq6-20020ad45966000000b00572636d626amr13600562qvb.25.1677485915852;
        Mon, 27 Feb 2023 00:18:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677485915; cv=none;
        d=google.com; s=arc-20160816;
        b=uvoamG+dMxbWMon3kScSo9PrR7/kNWkmY0VCCJ0UjDNsYhGdpodp2bEZRjjWWA+676
         HThY/8oAK4hVcxYL1EmHT8jusLOpodHeMPISkVSSc6AE5BQwy4SNJ8VEtqNFE/WZKAdM
         drJZJ6cU4LMrecNWlqMoFYcrbNcTHiwMJChUMWYJuiSpoGdIfKymNA+4/Ge2+Omogmhv
         cuEBsSUbaCPufYpk2Tp5MonDDB7toyuEo37p1eJYjuZnd1XtEr62W14dH0oR/jpGGXQP
         elykMkOUBMikPIlrHyVYNCRmKWWs6k0gXoBpmuFZQ85D7IeBj+HkLZFLu3Ib5ua+Ji1b
         9zyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=G0WkLijhWCE0+Z/H5Y1BqFs6QzftCoo9iI0aU6IJMxw=;
        b=HQnDbJBPMxK2d8iKaG9qa8uipO+CtNz/Hc6GyyRv2izJibDofrIgvFaif47r3NZMAK
         8zv5TkXHy8TrIKiUmx9PK9+wfEzGoKnCP3+WotNQ04FLfxS081VRr3t4Uwa35BdGxXo1
         xSqMW57QVXkf1xP2/lgsJBcuYhp4OAtYENw24tjGxLSGNtZEsO3LdvMtzCmQ2v1IscsG
         W5dxd/Q2U8UVlJWZCqKZELUrsGn+dS+lI3l5YNKTw+UHyko7sHAuOCo0dKQw2/0G0DGg
         MMpTpKDBo62uRiIBqjH/8gJXtAOIfbNUn3d2W1Yt8za6WvVz+Yr5uvLr9cp2NJEfOY7o
         wkhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qTLINJSM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8-20020a0cf388000000b0056eb364bd43si6313365qvk.429.2023.02.27.00.18.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 00:18:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qTLINJSM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWOG-0008AO-Pk; Mon, 27 Feb 2023 00:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWN4-0003Re-Hk
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:22 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWN1-0007Kh-HW
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:21 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 gi3-20020a17090b110300b0023762f642dcso5046025pjb.4
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G0WkLijhWCE0+Z/H5Y1BqFs6QzftCoo9iI0aU6IJMxw=;
 b=qTLINJSMwcZZs9C4/WJG0zmh82SMhiY0ddaX7junmta3NiQCD8f3b1pA1wfV+fNn3E
 35frLUBGbrxCVAiRROv5B1CBaA9kkJXZx7l31R8KLrMunmao3MW5/ty1njnXiCacDPDK
 oAEEy1XppUpv154kHIxRtXdu44Qdik5A266WG7AU+rjaXGUAlmyouH+MU4QqFHdwj8z6
 /dxFmFBOJtJaPG5pa05VRaAFQ0FiCQmrPtJO9I5GHfzwIPD/rWIunrVwp6k8Puhqrwjn
 W/0bbzRZAjS8hB5UxSt+XLdxMTINBO+x4pa/8JNGGSKLviIWGOiUJ2n/udU9TuCNyKzs
 A6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G0WkLijhWCE0+Z/H5Y1BqFs6QzftCoo9iI0aU6IJMxw=;
 b=Fh7eWgV5XvQNcn/tfRAF8jGuE3QkbRDwxA1gR35mX1Vu+tvG0Lp50uKgYZOwEvdIRd
 HRNCr/Ls3FFBvAejvSc24ihTx3BMDYIlF+eCv35P8Sr8gtchZDNA8ziel2Z1aRpjLG/X
 ioSxQUSOPvx7u2mRAfrK2DWs0VzGvZ3ocpLPdLcV6TMv7yIG/u/52aL1fALWY36841ck
 RQiEP1X3tIW2FcNu1TG+W771WUpmPMfz26lkaGdyWO7nmJ2XDNwDRP/eNk3J9u1mPUUS
 VmisDW4GQ80eg/IfzVaojBpnH2lvafj1kRSn/tc6JwxvZ+aH6eMk3S7nq64JApYyHxqY
 qS2w==
X-Gm-Message-State: AO0yUKX/EJ/GV8fSk6TijFAjj8RZZIwz22H2ajOWm0MFhCMQ8y7BS2uK
 BMWyI4EZIJOLVaTKqlw6WK4KWIdYx9ZGOHb8/mE=
X-Received: by 2002:a17:902:ec90:b0:19a:e762:a1af with SMTP id
 x16-20020a170902ec9000b0019ae762a1afmr7575732plg.33.1677476898459; 
 Sun, 26 Feb 2023 21:48:18 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 58/70] target/tricore: Use min/max for saturate
Date: Sun, 26 Feb 2023 19:42:21 -1000
Message-Id: <20230227054233.390271-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: b3VNB6p/4JO5

Use tcg_constant_i32 for the bounds.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 19cf4b6cc7..d5129f22f5 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -2442,21 +2442,13 @@ gen_msubsui_64(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
 
 static void gen_saturate(TCGv ret, TCGv arg, int32_t up, int32_t low)
 {
-    TCGv sat_neg = tcg_const_i32(low);
-    TCGv temp = tcg_const_i32(up);
-
-    /* sat_neg = (arg < low ) ? low : arg; */
-    tcg_gen_movcond_tl(TCG_COND_LT, sat_neg, arg, sat_neg, sat_neg, arg);
-
-    /* ret = (sat_neg > up ) ? up  : sat_neg; */
-    tcg_gen_movcond_tl(TCG_COND_GT, ret, sat_neg, temp, temp, sat_neg);
+    tcg_gen_smax_tl(ret, arg, tcg_constant_i32(low));
+    tcg_gen_smin_tl(ret, ret, tcg_constant_i32(up));
 }
 
 static void gen_saturate_u(TCGv ret, TCGv arg, int32_t up)
 {
-    TCGv temp = tcg_const_i32(up);
-    /* sat_neg = (arg > up ) ? up : arg; */
-    tcg_gen_movcond_tl(TCG_COND_GTU, ret, arg, temp, temp, arg);
+    tcg_gen_umin_tl(ret, ret, tcg_constant_i32(up));
 }
 
 static void gen_shi(TCGv ret, TCGv r1, int32_t shift_count)
-- 
2.34.1

