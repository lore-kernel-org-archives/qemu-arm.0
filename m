Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2172542ejy;
        Mon, 3 Jul 2023 03:10:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5aUSWaL6KYWAlO5VcYe2hRdhbeAV2YZaz9LGeTdSNS6DSzf4eklm1K+Ls8m28INXIGYLmb
X-Received: by 2002:ac8:5c56:0:b0:3f4:dec2:76cc with SMTP id j22-20020ac85c56000000b003f4dec276ccmr13569361qtj.49.1688379019509;
        Mon, 03 Jul 2023 03:10:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688379019; cv=none;
        d=google.com; s=arc-20160816;
        b=MVMR52tqoGCEiz0JBUjFAouUipAxemcnMrSTQnWpdnQUqNbHEohL8OejcrEJ5uD44Y
         Hfu869NXbjyATeNVMktMMPVlVO2ApTfAhH3XZKlzA+/X5W4z3KnC2swsiPteVWZN2dWR
         DyAyxtz+pKxZI2LQy6s84aUycWCsHXf2X+F3g5SXE6xI0dllg7syTkB2Nrc6vwLlO/c5
         YVVaHE4Po6z0VPHalRV4jVMiDvhKNf6Sb4hiHruAl5YmMblu/5eRUGHern0EwzsDBFe3
         UCOMUCm8jFXhbsRG2/dZRTbmI/dd3PIM4tHjaZwwlWSJV8wIbLfFICUiuBXgtcbun1bN
         Y3Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5CADGmxGJYg/RjV/FHciOOU7jKKLgdI+xydvPDVf6m0=;
        fh=DiqGMcF5+wJ0/Fe6a4a0YfMDHaiC5n3qovds/BNTPmI=;
        b=l400HCmcStRTyW1YxvfaK0spB7aXYef1y9yD1aeNRse/6RlSYZQ24r8Wv8GkkbJEYh
         DdBEeJofLSiOkCBc6MAw3TVfWgnQewhKy2z20kvh/rX7tREe4MaRV89B5vp+Xd24riRr
         tnQBxjq5ptlqt0+6fv6/zI4v+MZh++7h0oLp9ge1IRw2Vhn7KHjuAsEa6S+bV5mT4Yw6
         Q4RvyAeKZOzMuqkxV50+no1CE0pjCK6QQ0momQsTpcxNIHEfJ1lneEdL7YV50F4ahzk0
         CRw+k1HX5VBxAW8R7eINwcKDccUoEiOGKX2bi78kZWBr5TE8WdIESUCvBhDFCcoXWmPO
         x8TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VvIsKEyq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19-20020ac85b13000000b0040202e92e64si10366777qtw.31.2023.07.03.03.10.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:10:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VvIsKEyq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGGS2-0003Sg-L9; Mon, 03 Jul 2023 06:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRZ-0002xG-HX
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:05 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRI-0005u1-JS
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:05 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-314313f127fso1700692f8f.1
 for <qemu-arm@nongnu.org>; Mon, 03 Jul 2023 03:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378747; x=1690970747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CADGmxGJYg/RjV/FHciOOU7jKKLgdI+xydvPDVf6m0=;
 b=VvIsKEyqLpv7mL5+/kHjPzHS0Rkh1Yfwk40Ta0J9qyXijv8RRccLzrNDmvnwJDpOri
 Qdi+ograIyCToOFco4uxD8loUFju4u+GeNRwMGyc9DbSqqDzg2Wj1kGJ2Xb3rTSztobj
 7mOhs5SdqGETydpBiiMX7PsatWJ7JQNbqiSl51/80WwZiDOlojCFnCcYXt/Z/Qk91DcB
 PxDtj1aHeQMtduLFS5vdVMis/C3e+89hOPvhzmNfyv5sIVvrqxU3GwPefBLfQkXKvl0M
 d/Zqmppj7qDNLTABY8jvy/bKa26EhKaQ7Cq5MiwXmEF0tZsytUtgGY2uLmOt+ua5bK2/
 qenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378747; x=1690970747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5CADGmxGJYg/RjV/FHciOOU7jKKLgdI+xydvPDVf6m0=;
 b=EOTu9dK+dEa8TFxTP4JQ8SC+GPY/27FLpfWEd4M3ZODy8AHTRcukkhbZ7XFZOXPdrF
 mo6oWCXFaEauhyv1D3WTC09f8KwES/ifeRNWYFd4w1nHvoRGPiqLWo/uncQ5kDYu/1Wn
 dgCILM0FbFQaS8UaTPswuHt0ss81FXTH0kx8Ytu56ORemMJbh6339bT3C1upHxE1wUIz
 2PfaxOIX8D8VbTgGcBFvttLPlf3IeUjikCkJ3EHYYhGrtrHeOC0KR7AzZ/F9BZkVp3NT
 OSt3ilG4w2Z3tO3hPDvjVxBnm19hqezI88UZ+cKExQl4tFIB7V+aIwgmDOI2pwQR57VF
 O9Ow==
X-Gm-Message-State: ABy/qLY9HWoHCsmottle+P7p/h2CXVsGBrtkv0fv75uMjrLfxrCugC92
 CBPAbDhsCPgTjKXEsH9lIVK3L4PZMoyx8EyYgIuEgw==
X-Received: by 2002:a5d:63ca:0:b0:314:2594:7b9f with SMTP id
 c10-20020a5d63ca000000b0031425947b9fmr7327835wrw.11.1688378747179; 
 Mon, 03 Jul 2023 03:05:47 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 23/37] target/i386: Use aesdec_ISB_ISR_IMC_AK
Date: Mon,  3 Jul 2023 12:05:06 +0200
Message-Id: <20230703100520.68224-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: F0IH0Wpt7BnR

This implements the AESDEC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 93a4e0cf16..a0e425733f 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2162,16 +2162,12 @@ void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
 
 void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
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
-        d->L(i) = rk.L(i) ^ bswap32(AES_Td0[st.B(AES_ishifts[4 * j + 0])] ^
-                                    AES_Td1[st.B(AES_ishifts[4 * j + 1])] ^
-                                    AES_Td2[st.B(AES_ishifts[4 * j + 2])] ^
-                                    AES_Td3[st.B(AES_ishifts[4 * j + 3])]);
+        aesdec_ISB_ISR_IMC_AK(ad, st, rk, false);
     }
 }
 
-- 
2.34.1

