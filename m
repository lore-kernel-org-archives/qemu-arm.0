Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2172428ejy;
        Mon, 3 Jul 2023 03:10:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH8aE0Dn6fXiL4fPW7IkfkWo+RcLWsGH3UGwM2zTX+Wq9IUaTenE9vtdLJ8bnhw97LfplOq
X-Received: by 2002:ac8:5710:0:b0:402:d96c:c840 with SMTP id 16-20020ac85710000000b00402d96cc840mr10889139qtw.18.1688379003954;
        Mon, 03 Jul 2023 03:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688379003; cv=none;
        d=google.com; s=arc-20160816;
        b=FPgJSYv0dUjpo/gTZz2jDMPJ7rLYMmP01Sxq+YyZyEcjw5L/QGxggljJaOrSSnYW4X
         ThO/IpoMikLAo81yyoMjKQQH4uHcKMRdL1yexuOH8g5LLNi7IuMW/eBcNXnlEGryc/2q
         ZVgBva5enDNQt5sQcwEhmi6C8oD+P+RECF5H4g37VyFlnhUac2h5bD4BptJKimohbMWF
         XpEyf44QBWLiTzFxM/CDZ2pqM7iZ8UqEL42vDZ6GyNKHA1t1w11YJxYQQA/vtCDNJVQp
         G2GKfs7w2IALDl5OAxFg5UKI5/cVIpHe0TaP6Fk9nQ9qw5kgFl6nNaN4wil09NDZB+MJ
         1XJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+os3nHQ/ZmARewYX8s5fRYkcgS0NtfZNFjYHPGkpaM4=;
        fh=DiqGMcF5+wJ0/Fe6a4a0YfMDHaiC5n3qovds/BNTPmI=;
        b=RBPE0jojQxGzNCLa9uST8sAR6V+Oo7JbHwrPd1jgq16+O7LUye4W+o5NULLyIf2KC/
         vvFuAKNENPNBeVTy4/AciDdO8rrdmjRI1qAZlVCqBxKiv+q34caF741mmEO/PkmQKAo3
         2zbMWU5RUWboHfzxaEj7NCjCJVwvjbjmSDT/4bJEytuIujJtGKiwS3sWQx2N5+yxmpc6
         FuEn/mNnBnTS/PD3De0x84M4DDIMBUHfgpRdcJWEEB/eGA+iKnYtVM5wVgpot26D31VH
         LpV71RyCvqeIv2RIfVO7KGuzaxw8uiQ9dxRtnWikenlO0U91Cp0SGU02q1r/WEEAO56U
         abZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X5TrsKfA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8-20020ac85dc8000000b003fb9c79ac0csi9570690qtx.63.2023.07.03.03.10.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:10:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X5TrsKfA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGGS2-0003RA-GF; Mon, 03 Jul 2023 06:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRZ-0002x9-F5
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:05 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRH-0005tX-SS
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:05 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57ddso15581125e9.1
 for <qemu-arm@nongnu.org>; Mon, 03 Jul 2023 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378746; x=1690970746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+os3nHQ/ZmARewYX8s5fRYkcgS0NtfZNFjYHPGkpaM4=;
 b=X5TrsKfAhQX/kK1CsQ/ipdzc+4Nj/S5XX4YJ45qsbLFxdaK9RAoC+QjOOK3flb3hrj
 MKhWK7LSXOlky1g+ytCR4o9OJdPGZaI8BuoJffTrWhpBojgxmhc+pFA/XZO73EDZ4CRl
 gWgutKsdYSJP9oUN8QstNcmAfiFS9NMyQM4hghNmU3pNglAQZCJ0T05oe69+S88Zm7hD
 +jaMZRrOOHl05q91EUSJNv1gfHqdUHrow3MrrOEMD65cvmctQKvckyjIdbqMu7RR3wzp
 WzlerCFCKLjy9gcmPWFmapv5Sl2toL9nRzREUZkofCQQMgi7+4li0wx+DQKMMWwlZSdp
 C/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378746; x=1690970746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+os3nHQ/ZmARewYX8s5fRYkcgS0NtfZNFjYHPGkpaM4=;
 b=CBbdoQ87puJxTrJVehAzCNAvbnrhLxLudzghrwJidrC2RlKcBoQlDzEosp3g44CfqX
 6gqvRIly8f/tu5Ve7qMmU7ZjXuNMrtsMjj22XlM304Wf76jAn5aCvCoEO4jz6bywZQUm
 cDoK+1Cf2iZMsZFypBjUiFepWIUVaUA2zl+4jAyaLOGKFwr4w61gNbWJ2AQQSjbiCjh0
 P0f0ngzaewi6PFvLJr5tiARoeU7YJ40JT73+SRo7wEf8jX9u0BElvAGwj1eJQRICLede
 lcRCg4V1eR71NCSyJEp3j1MJWwzs8qm8vV7QezEheSPxs0T+PZDNAmcUrYpGT4iLcDl9
 JB0g==
X-Gm-Message-State: AC+VfDx3NRYBnkD4Fzqj2dZAUOTVLpzwXEtQFRQ0o9I/dz6wtM45nNNN
 K8zwHHwZWyYO+P9tbVtFxzoN3Q==
X-Received: by 2002:a05:600c:2253:b0:3fb:a5b3:4f02 with SMTP id
 a19-20020a05600c225300b003fba5b34f02mr7464716wmm.36.1688378746218; 
 Mon, 03 Jul 2023 03:05:46 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 22/37] target/i386: Use aesenc_SB_SR_MC_AK
Date: Mon,  3 Jul 2023 12:05:05 +0200
Message-Id: <20230703100520.68224-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tx9aZqmO2UxD

This implements the AESENC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 893913ebf8..93a4e0cf16 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2188,16 +2188,12 @@ void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 
 void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    int i;
-    Reg st = *v;
-    Reg rk = *s;
+    for (int i = 0; i < SHIFT; i++) {
+        AESState *ad = (AESState *)&d->ZMM_X(i);
+        AESState *st = (AESState *)&v->ZMM_X(i);
+        AESState *rk = (AESState *)&s->ZMM_X(i);
 
-    for (i = 0 ; i < 2 << SHIFT ; i++) {
-        int j = i & 3;
-        d->L(i) = rk.L(i) ^ bswap32(AES_Te0[st.B(AES_shifts[4 * j + 0])] ^
-                                    AES_Te1[st.B(AES_shifts[4 * j + 1])] ^
-                                    AES_Te2[st.B(AES_shifts[4 * j + 2])] ^
-                                    AES_Te3[st.B(AES_shifts[4 * j + 3])]);
+        aesenc_SB_SR_MC_AK(ad, st, rk, false);
     }
 }
 
-- 
2.34.1

