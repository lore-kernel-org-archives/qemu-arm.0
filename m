Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5537827lfc;
        Thu, 29 Jul 2021 04:16:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzG0iN7SFu2k+mqT7Mtabk9TG39vH+hI1nAK1Ng5J4fkx4PrCfqhD6mwwwO6+zZ+nnRFZFd
X-Received: by 2002:a1f:600c:: with SMTP id u12mr358101vkb.4.1627557395512;
        Thu, 29 Jul 2021 04:16:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627557395; cv=none;
        d=google.com; s=arc-20160816;
        b=DN2QGfIhPwZG648GnI5G1CBvb3XbAAjdcZGQBh/v+vIuDqYWMgjePr8bepNlOgLEFc
         0ZVG3rCtRbVRTYCUbRE9eot40i/wCec8Ed9dDRmBjVAYGlKSbCrTMwHAsI56Cyv1CBL/
         5f5iFmNPJ4Nkdz3H+ebAzGTfm1IvcP3/uqGb01PrTg3sYCpQrNfnQMt+ik/2sx/rJmhb
         UrrWTrw83KjFhTzemSrh98UUSRiIKrpsFMGhWa5+vT3wEZXIJeofwIHF5SmBqEGu4D2z
         qRcSwflRLDZM7lKgleqzjM0C2r3TmgKf0qx6Brod83kDVvFdTWjslKqdeQarx72RlWNG
         /ohA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qmYdn/b+7uslGkmiRTc9E6zb61LbVOfXICGmdFgy+bQ=;
        b=xsEsIfSp2DiQUnklhF8q5X0d/nLMCTjsqAUSOKMBR7fujSyrR/YHAzDJwbcbDoxi9U
         7T2WqAYvP/EglKBjyWjrLlt8VapPCWsPhRhcmT9NCH6u03wxUgw7KLhIOMH5CsvKhqUB
         xI/pQn5OcyjJijEqORpAvavrwNjzBB8cz6REbDU7xtuWWg3RgnwDttVKW12qNaURJVV+
         k+fI3LvTMRmxjQk0bxL+SE1JgyJ9SZTP6MODnYOuzSK+qZxnfQykTBIV8EsGchBGYLU6
         kkrrhnKV2kQL7GZJYMw6ikFygYNJxsFyAdWi8KQUwYUCFgAPxgT3MfCVq0zLBnahoBBw
         5+6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kiwvbyvn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w126si1399395vkh.89.2021.07.29.04.16.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:16:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kiwvbyvn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m941i-0000ix-Pl
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940k-0000Ra-Ql
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:37 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940a-00012b-68
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:34 -0400
Received: by mail-wr1-x42e.google.com with SMTP id h14so6422954wrx.10
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qmYdn/b+7uslGkmiRTc9E6zb61LbVOfXICGmdFgy+bQ=;
 b=KiwvbyvnDCKLQ8U1e4tmBErUZ9PzM20Q0BvEHUH28UfyxKXBmxOdRcoC5PTRkoQwNh
 iDK2GRKFeIh7mlXu/+BiaWXTXUNxofZWVqbctvz7iGrx1nEAlOZcc8crEWKn8tj6pmEe
 LpfmJ6FGFv8VW6WlXJUSMAQHJJcyUMO8x4TSBq/keE05KLOfpYKoF04UFrAUQVu3xrb6
 V1WvVVtdSikmAIicqHSs8XqrpvKqtISo1y77SvmvSJp2oyIiBE5rlz4WN0Ahxf/IELt0
 JJvJuWEr8ORdQqH8EbosJyYpBzzOGQfWWQfOVz1P7lxUsTvDukphGE2H2R76eh/xr7mv
 Dh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qmYdn/b+7uslGkmiRTc9E6zb61LbVOfXICGmdFgy+bQ=;
 b=tUu4kP/T7yWkIaJHwqsSTj9byrlGp4g12hgpPkqY9lF8VnUccXXLLdPHF0ulRQOY4t
 At6glf6iHSH6ur/LGGD8+RHdVLl39q1GnIhKpolX/JyI5VuQAwp5sXDdciyV7jSBePQa
 MEjuO/Y9pIRLBq2xTJWxCmxIscd2YEDQtmLMgfMzw+g7otXu/6ZMd4aGsgwqQoJU/R1W
 6kqIFxW7wQgkff5XWgxfh8OtvHfukJRmWAigJmm1LJgkqYT8rEo8ZklHHcT6/UEWE7pk
 af/SY25uaqRZ5PMnREZwq7wUR5oabzdqWNUoPE/A+dfc3DSnUaAujAADIx+h2ORdpqFP
 ga0w==
X-Gm-Message-State: AOAM532exowDi5JInviea9EncnpaltOCQqyqkZJHW2rFBBjmxzE9w9JP
 3drvXX0M/OIy0j+ZE2TINW2/5agE1v6Kzg==
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr4291482wrv.77.1627557322794;
 Thu, 29 Jul 2021 04:15:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 10/53] target/arm: Fix VPT advance when ECI is non-zero
Date: Thu, 29 Jul 2021 12:14:29 +0100
Message-Id: <20210729111512.16541-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lmg2/uM3C2H6

We were not paying attention to the ECI state when advancing the VPT
state.  Architecturally, VPT state advance happens for every beat
(see the pseudocode VPTAdvance()), so on every beat the 4 bits of
VPR.P0 corresponding to the current beat are inverted if required,
and at the end of beats 1 and 3 the VPR MASK fields are updated.
This means that if the ECI state says we should not be executing all
4 beats then we need to skip some of the updating of the VPR that we
currently do in mve_advance_vpt().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mve_helper.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index ffff280726d..bc89ce94d5a 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -110,6 +110,8 @@ static void mve_advance_vpt(CPUARMState *env)
     /* Advance the VPT and ECI state if necessary */
     uint32_t vpr = env->v7m.vpr;
     unsigned mask01, mask23;
+    uint16_t inv_mask;
+    uint16_t eci_mask = mve_eci_mask(env);
 
     if ((env->condexec_bits & 0xf) == 0) {
         env->condexec_bits = (env->condexec_bits == (ECI_A0A1A2B0 << 4)) ?
@@ -121,17 +123,25 @@ static void mve_advance_vpt(CPUARMState *env)
         return;
     }
 
+    /* Invert P0 bits if needed, but only for beats we actually executed */
     mask01 = FIELD_EX32(vpr, V7M_VPR, MASK01);
     mask23 = FIELD_EX32(vpr, V7M_VPR, MASK23);
-    if (mask01 > 8) {
-        /* high bit set, but not 0b1000: invert the relevant half of P0 */
-        vpr ^= 0xff;
+    /* Start by assuming we invert all bits corresponding to executed beats */
+    inv_mask = eci_mask;
+    if (mask01 <= 8) {
+        /* MASK01 says don't invert low half of P0 */
+        inv_mask &= ~0xff;
     }
-    if (mask23 > 8) {
-        /* high bit set, but not 0b1000: invert the relevant half of P0 */
-        vpr ^= 0xff00;
+    if (mask23 <= 8) {
+        /* MASK23 says don't invert high half of P0 */
+        inv_mask &= ~0xff00;
     }
-    vpr = FIELD_DP32(vpr, V7M_VPR, MASK01, mask01 << 1);
+    vpr ^= inv_mask;
+    /* Only update MASK01 if beat 1 executed */
+    if (eci_mask & 0xf0) {
+        vpr = FIELD_DP32(vpr, V7M_VPR, MASK01, mask01 << 1);
+    }
+    /* Beat 3 always executes, so update MASK23 */
     vpr = FIELD_DP32(vpr, V7M_VPR, MASK23, mask23 << 1);
     env->v7m.vpr = vpr;
 }
-- 
2.20.1

