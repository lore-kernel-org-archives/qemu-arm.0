Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1544877ejb;
        Fri, 2 Jun 2023 19:36:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4MAbEGD8tMhRx6lMqIWu09u6zvJCcYIiPfXPqHCQA2TT5XJPE+pcHCPtnT1xfoDEd9mixv
X-Received: by 2002:a05:620a:c4d:b0:75b:23a0:e7e5 with SMTP id u13-20020a05620a0c4d00b0075b23a0e7e5mr14305658qki.70.1685759802251;
        Fri, 02 Jun 2023 19:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759802; cv=none;
        d=google.com; s=arc-20160816;
        b=uLC20HVxWxQi6xhWVR4h6UnDLO6XAE7t+ptsVUzPyOBaWXgnRYzB38jqOWozwiTZOk
         m547aqdMEoA9Kr0leW4lYpp31p8Mkr1gPm9c7lEuMha45Twu5USiOQT5BRovZ2m1epQg
         K8/l7mMZPayyX4Ggpfq4G4pBSWY3lpNy/I1YczI6bqn4tIHEsxO4f8TqI/LmmILYPG/N
         2wWf/0BpbBMzXFMK1a4JBW0Fv/grBfAaTU9Sw5lYBYSJVaLRGsZDyiqbJRj+M9WBgDEp
         JXOYS+UJUvwPNZLZSqqymdJvVx6XAn9mo+ltTpNOtdaWO+PZSIH/K25sGDlhT3fNaduN
         uRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8ad1hEuB2NS1Bh4h8rcRJdaP7SG2+aNgQWOiVbHdswo=;
        b=xxUsgHAqfDXAAf6F7a8qQ50QpEFAOYQkPY77NYDEN9HKXKMn7ExLNr2nzfCCo7bm8b
         RKW4m+WDRDepDTD+L0Nz3mrmHLV9RMVqngyj/iWZTyrmv0PD734yXSJIj5qs/o4usW+K
         NOmLa5xlO4+cSdLSvdQ/V5TNr19/3bJG3l3RUU5VC+3hLIIhIAvduyKV3kKcEBEkCmTF
         dcJRdITFFBb/kIqXJUjCGdY6be4iqOaGBZvd/n0lOp0yWM7T8B0hxurFbM0jcnE/k/we
         U7jsY38GQHwKtBY9/DBxQ95O5wOi1X6UBQlG57Ear+9SdPp6SmJkq+/GMc+wKCs6O620
         9cIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mi3qZA1R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22-20020a05620a12b600b0075b022d19d4si1554282qki.629.2023.06.02.19.36.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:36:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mi3qZA1R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q5H7c-0002I5-R7; Fri, 02 Jun 2023 22:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6q-0000gp-F8
 for qemu-devel@nongnu.org; Fri, 02 Jun 2023 22:35:18 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6S-0004uA-OE
 for qemu-devel@nongnu.org; Fri, 02 Jun 2023 22:35:13 -0400
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-39a50fcc719so2044287b6e.2
 for <qemu-devel@nongnu.org>; Fri, 02 Jun 2023 19:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759691; x=1688351691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ad1hEuB2NS1Bh4h8rcRJdaP7SG2+aNgQWOiVbHdswo=;
 b=mi3qZA1RBOv1nNuNU1fAUDLAx2E9RqCzeuZJy/sa4SU+TNE2xUyY2ktXs19qNqnryC
 aMpT9VftJURQGgG8/eYBCuJRcuOI0lhpzNrba7bFAS+z919DWltjVQ5WJ4HEt3Jvf50G
 pzSLpu8Nsr+gUM5dtZ93ZpCrGxebgJuUVNF2duYFuSoPq3SmYbCQmiPEtrSL+Y64XjSQ
 hnWsOGLIBZQSxeVz3TBhwKFSnPo0Y6hI6LYiIsDG2f2ExRtFu7xDDB9EhIGl21P/ZeQw
 J7tgjP5pDqEqPVT1H4lVlPQQj6y12Xla5mo09B8IBEtiNAOB8VK6nMMaqC3KvYPSwW/g
 AX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759691; x=1688351691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ad1hEuB2NS1Bh4h8rcRJdaP7SG2+aNgQWOiVbHdswo=;
 b=FEkB4OMwlqQZxL62A0WoBbJH2Na57yhE264Pn9QmaVwUAsZNNUVRQB+DspPYe6YInX
 8K5GSSCSCbR8r6mfEW3HkQzQ9eTqvcGrjXk88gSekzcgwPiQG8513NmFcwNVbYj11tVr
 bmtwrF/a7Hub/EeoIYLLvv7/ho1CsZlc3EI2yKfusEgVvVlXdlesq5qRfFkChc0s5+sL
 JbAyHHnW6S/AcjOixwC8KIGigemnzZDLJVbjOxXVmUzL+lps60/d00aCyuZ3oO1WDTi/
 WjdE/lRuNoOaZxzGgE97ylmQzgVDkLklogpPBI79OFA3f98b9PlxaFb04EVJl14L1O8h
 KpSw==
X-Gm-Message-State: AC+VfDwW7/bGo2qs5HZr1E6QfMcdG+7UQzLY+kTiDAMb2C3spO3+1+0z
 lQSydSkUR1BzySYS1DpUPpjblWQd0uyeT3axpvw=
X-Received: by 2002:aca:1703:0:b0:398:4588:ff22 with SMTP id
 j3-20020aca1703000000b003984588ff22mr1887358oii.43.1685759691664; 
 Fri, 02 Jun 2023 19:34:51 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 26/35] target/i386: Use aesdec_ISB_ISR_IMC_AK
Date: Fri,  2 Jun 2023 19:34:17 -0700
Message-Id: <20230603023426.1064431-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: VvKI5vpGuQ9Z

This implements the AESDEC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index c7a2c586f4..e666bd5068 100644
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

