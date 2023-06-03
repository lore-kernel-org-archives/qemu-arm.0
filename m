Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1544927ejb;
        Fri, 2 Jun 2023 19:36:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6UuwkvKvTAa2biU8cs/Sje/TUQpBQb4UgLKzjxuVwZga9TDHkNIrDaSGY13L8WPVJsk6Ma
X-Received: by 2002:a05:6214:528f:b0:5ef:46a9:15d2 with SMTP id kj15-20020a056214528f00b005ef46a915d2mr548865qvb.7.1685759810650;
        Fri, 02 Jun 2023 19:36:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759810; cv=none;
        d=google.com; s=arc-20160816;
        b=qIZvkn2hhtJl1hlMd50QlUVGXK/8dtvRaXuo4UAUqTl3KzDFloCUJJMhTgZ7i5JuCi
         V8qo7nBKTqRJLRvOZbQDOvKlX0eJfV3UVGLdLY16rlNjKX+DnoXZzKnpwJ7sCjW4SJex
         67C3rLWLuo+FrnLWpUSfGayI1YAUSA3sSiVjal5GswzMQbTAnP+qDEzF12N0/S+z04jt
         PdM42jwwCWeVzI2eppOPOpaxIIN02T7C7ozB5a9fBwHP/WkMEdGBt48CHC99/RrRk14w
         /Kby8klhzgYQb8bsdMUHsIQudb0LQK+GCW5jgpKwhuX8J/zzdr7Wxr+gI3BcKa5ihY/U
         j8wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xQJo2C3OKYrLdgG+Avv/itkRaFPUqHtuD2xcYh5Lh3Y=;
        b=Ois1Jfpz5IC7Z2yLLlQiTLGQ9/CS8FjEPWxf4mcyz1n2sSt8YKqlyWsUxIuDIpqJh6
         IuhoTKD+Iiy4SkyHbAkBPyUw/4JArWXk+Q7Ym+G33jESh0KohhJ2JF5uOJT0nHnQSbZN
         0xMtXDRC9OvPjldw/x2PULlx9IN7NrMMgWBbDKFpYr3IOKRebGhdJdKSD139h6HedxsV
         +2BPDRjufJb88ZwkOEIatO1JvOxF4Luuh+pwmJnRuLj0lTLRE+4uzinNrpCvWaecKxIb
         3ybObpIvYKKxRdhF/wGEUcwGv30cAqGwq3s383lg4Y6iWrs7tQjishY0GjAghmxG0OVT
         aiJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OdXJUkKl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s34-20020a05622a1aa200b003f86397ddb5si107459qtc.90.2023.06.02.19.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:36:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OdXJUkKl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5H7b-0002AB-Bg; Fri, 02 Jun 2023 22:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6b-0000aN-M2
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:35:02 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6Q-0004rg-2B
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:35:01 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6af6ec3df42so2708922a34.2
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 19:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759687; x=1688351687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xQJo2C3OKYrLdgG+Avv/itkRaFPUqHtuD2xcYh5Lh3Y=;
 b=OdXJUkKlmbPfOIMb4syHFC9vqCA+CKjZqxnq3kv6h4Z5znXuxTl126Ci6RAxADj7Ew
 vkAKmgkAx1asIQSc+sWpnSJyrguLuzoq2M2P8MjPCjz9mzUCQuE1MUs7ULJbf6eRNyBv
 lmfBmvYwzRUA2pcuWHXY0k0H28CqCA/HZJlt3r9C+ncfxRVgnmgu6igPSiaO+lbfnVJU
 QuN4Dlls9KZWNvu01cbpxJa+IG8xPXYQjTsJIMkn93y43HCNqLp0WjKAl1Y0tT0hOWvt
 vF74OPKA+qKn3L/9M8cp7BU+6H69Db6DO73cKKyLeA2yKjqtfLIV4Kwn9mPWht73ysu4
 ciog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759687; x=1688351687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQJo2C3OKYrLdgG+Avv/itkRaFPUqHtuD2xcYh5Lh3Y=;
 b=BbPl52yDfnjWvvtimpWucKbWb/AxByBTZf7UHwWyrGyun09dw8WPYUXzQy08fpKmx5
 ab7zPJzLmpmi4DgburVc6amDuuw6lAzrw9MfssAVMC3kr/Qd+NjeeLJqxHMjkzn6ePI3
 l4xvkKbJWm8IRsXpKgv+CCXvtWdX/e72uyQE4ela4XGeTGJ2eoUrw1yopHt86DbVDO0Y
 +7gFagn2CRwdzxe5rtxj0ZHCa5BcEUIjcAzyIdL7dUZ4FaL3jBrwVAdQ+heSCDQ95E7o
 ZAcQVX60BC26iLCVeDkLTabeVRV3zksf5t7gx3KSro+EtgdSH4giaNekbZSUAl5f43Fd
 nsCw==
X-Gm-Message-State: AC+VfDwF+7xGb4crrY8h4cnBpWW3UjJiYVBAnBQSeqbJVQ56+NHfFGo8
 mQET2FaLuVOBhCnn4JtFnZLLUA==
X-Received: by 2002:a05:6358:4315:b0:123:3ea3:2bd2 with SMTP id
 r21-20020a056358431500b001233ea32bd2mr11882291rwc.32.1685759687666; 
 Fri, 02 Jun 2023 19:34:47 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 22/35] target/i386: Use aesenc_SB_SR_MC_AK
Date: Fri,  2 Jun 2023 19:34:13 -0700
Message-Id: <20230603023426.1064431-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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
X-TUID: QVkfSsxoE2SA

This implements the AESENC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 0187651140..c7a2c586f4 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2190,16 +2190,12 @@ void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 
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

