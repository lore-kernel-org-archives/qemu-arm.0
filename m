Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3894109wrx;
        Tue, 16 Apr 2019 05:59:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxFA0VclHxcW6wWj+tvYQFLXXKMqxxEvjDO/D4eC+ohOy5oHMr2QaNsyrYAXWl8acjULNxU
X-Received: by 2002:adf:f3ce:: with SMTP id g14mr16766042wrp.129.1555419554163;
        Tue, 16 Apr 2019 05:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555419554; cv=none;
        d=google.com; s=arc-20160816;
        b=ie+eu6j8KMUMVcEuqGRGkmYpv4KSWRx84zNNL0CHWLw0hWMS1e1Q4XRV7jlVBWgUY4
         LXyoz/ujg9i+xUbaYC8GdRr8jVB6dgP8wtvPUnXrSE21vOjidKplkv+UwpsINDDy12kl
         PmziNGm5qc9luaap5nTnLH9wFt0YmjzA4PQzFCYMKkOVLjO5l54FTIZyw4xdR8Ye1VKS
         WfVoWcgzoS5vt/xRhUvJgyW8LTJpcCU+kmtq2DWT0WXKg2tHvFpDKIC40xK+Jd33kt1M
         1S6TidwlKC9vWQoLvVKAntNFxLee+uU3qu1BG194DUGcM+iY+MtY4VrXqMZDpSNB9Xf0
         JFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=xc3UIGC5SvjlHs9DchEFUCKpsleMW6NB4iU50Hc4tGE=;
        b=JBFh+v/Sg4Eent/0+nuZ86WloxlZTgByWmFDkyHp+scU1gxp05ETjyQwR7SsMO3Zhx
         hQXaREpqW7e3dO78h/D05F1ufkP7rogx0/fRkQko5vhXRU2Q0a4UC6yUxw9vOWvA/kgC
         7IhFFfzhK3N+RssiFdJq6BKuY/1g5/HGmjsxn9MgY1a9wUXj212BWFqDZSAzs6Xhk4KM
         OqOcVJhTA9ic4+UxuXOACjPwUO8SxF0GRkS40vHLTcB35wkxpA1LC0fkjCEYr6VNvT4C
         Wfank5cVNbiB11+HnxTWywvV0NgJiqcqXBtrzLdSMqi6g8gjhlEagB3hHxrclg/3WRqD
         MJ5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yPmVw9Vm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 202si13572260wme.62.2019.04.16.05.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 05:59:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yPmVw9Vm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNg9-0005TK-80
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 08:59:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNf2-0004Vs-Sa
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNf1-00017m-3c
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:04 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40111)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNez-00014W-0V
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:02 -0400
Received: by mail-wr1-x444.google.com with SMTP id h4so26942320wre.7
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 05:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=xc3UIGC5SvjlHs9DchEFUCKpsleMW6NB4iU50Hc4tGE=;
	b=yPmVw9Vm2MHaue//8t6SPQ/AQlQsCrh3+Bv5D8HFaaVR9Q1mganklBEN6OVfzObcbR
	erJvWHQzigC05an4Luo9d0uLxauQBDxXae8bZw6LlUsJ6qNXoNTeSk9/tOkpYZv2y4v1
	T1HRBkaA5U27N5fB6MLiC1ZZmMBlLORsIE6tE748XMLXZlsQ2cmlYW3fw8xMyhz6V1Qr
	BXA9YaMGAYn0ofaZf10bRfcYGncJsU5ZkgKUzkfTO7Km9pQppcWQllSZEoq9IWuJNbJj
	8K/g8dj9cdhw76SQyK0KqNw39BuisLx3pwVZzQDvRASaPFNjKBpGKojYL4KRzBTlgY7w
	PeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xc3UIGC5SvjlHs9DchEFUCKpsleMW6NB4iU50Hc4tGE=;
	b=CxgW1JHhCI0J6i6IiYlxkeHcMgGCnGAui7QQRw9rAyYNSXAJ/cXKM9pHlvvbEL0T9T
	WxIqz3o8+t2qD6eC8BJp5gW/FSuFGcqYlgxaeejj7QT0drl6ZrY48zqoPpAc8Pio0szo
	oXAiuJKi2KWNdo7y6fUu1NpARHUOmFw2zTKNy7V4KHyttgCcIkDFVKqmAo2ti83kH3Vx
	jbJPCgrEVehFrt+KHsYQCI2+2E1T6aTACjvpoAGNa2Ll725DSrlNsHv7IK0vuDh1Hsqi
	dW72hZqlEljj+19WxtstbJps4J6+yVWMWXk8cJwwset2Qfd3x9FHH9N45uisPPwUzUPV
	aL0g==
X-Gm-Message-State: APjAAAWhQlUVrEPtxwydCtrFRZDfGBm/9Kujus4xgEyEUXAf3x0cTQPa
	Kq07j6RDWsr9kueNAMxWL+n1NAHohws=
X-Received: by 2002:adf:de07:: with SMTP id b7mr23886402wrm.196.1555419478176; 
	Tue, 16 Apr 2019 05:57:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.57.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:57:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:24 +0100
Message-Id: <20190416125744.27770-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416125744.27770-1-peter.maydell@linaro.org>
References: <20190416125744.27770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 06/26] target/arm: Decode FP instructions for M
 profile
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vua6v0iz4fpD

Correct the decode of the M-profile "coprocessor and
floating-point instructions" space:
 * op0 == 0b11 is always unallocated
 * if the CPU has an FPU then all insns with op1 == 0b101
   are floating point and go to disas_vfp_insn()

For the moment we leave VLLDM and VLSTM as NOPs; in
a later commit we will fill in the proper implementation
for the case where an FPU is present.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index bb539111179..d280b3a9a3a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11727,10 +11727,19 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     case 6: case 7: case 14: case 15:
         /* Coprocessor.  */
         if (arm_dc_feature(s, ARM_FEATURE_M)) {
-            /* We don't currently implement M profile FP support,
-             * so this entire space should give a NOCP fault, with
-             * the exception of the v8M VLLDM and VLSTM insns, which
-             * must be NOPs in Secure state and UNDEF in Nonsecure state.
+            /* 0b111x_11xx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx */
+            if (extract32(insn, 24, 2) == 3) {
+                goto illegal_op; /* op0 = 0b11 : unallocated */
+            }
+
+            /*
+             * Decode VLLDM and VLSTM first: these are nonstandard because:
+             *  * if there is no FPU then these insns must NOP in
+             *    Secure state and UNDEF in Nonsecure state
+             *  * if there is an FPU then these insns do not have
+             *    the usual behaviour that disas_vfp_insn() provides of
+             *    being controlled by CPACR/NSACR enable bits or the
+             *    lazy-stacking logic.
              */
             if (arm_dc_feature(s, ARM_FEATURE_V8) &&
                 (insn & 0xffa00f00) == 0xec200a00) {
@@ -11744,6 +11753,15 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 /* Just NOP since FP support is not implemented */
                 break;
             }
+            if (arm_dc_feature(s, ARM_FEATURE_VFP) &&
+                ((insn >> 8) & 0xe) == 10) {
+                /* FP, and the CPU supports it */
+                if (disas_vfp_insn(s, insn)) {
+                    goto illegal_op;
+                }
+                break;
+            }
+
             /* All other insns: NOCP */
             gen_exception_insn(s, 4, EXCP_NOCP, syn_uncategorized(),
                                default_exception_el(s));
-- 
2.20.1

