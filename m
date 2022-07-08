Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp396051lft;
        Fri, 8 Jul 2022 09:59:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vxL7iLYYkFciBholAIe3O3GPrgIq5Fg8spdkbwtSG8EflCU09FYslgNjRGzZIVA1XXFh15
X-Received: by 2002:a05:622a:1cc:b0:31d:35a4:3967 with SMTP id t12-20020a05622a01cc00b0031d35a43967mr3975357qtw.504.1657299583393;
        Fri, 08 Jul 2022 09:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657299583; cv=none;
        d=google.com; s=arc-20160816;
        b=d4nbYnwqVYu/z1bgg2/FyWO7ASZQTPC9wMtAHTH2mGEwvx9pD3XQS4S/m365O65fHP
         vuhM31Sn+Y48fHaeJWzt2eCADT0WxY0x6l6qxd+JDwMq3iCPfpbvs/tdR3PvdMfurXam
         7TBun5VSmHzTVeEIjlqdk9J2vRBMur/qghPegojK6e2ofsBoHV0ki9csgRCGo9/uqS/a
         FW/V/bZt1SgfQN++PzEjDlQZLUR2V6ih5gIAD63lSgk65swgVQkCxbuvJJ/ZHH1jPxN6
         fzJOOiYyUpLL5YzSymdE1RFGJzbA0mc3fWVNtEO8qbEJ05kqjMxfInZGiLaxJ8xo7fph
         7GDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tDlq7Gwmx8RjkvitHJnXFST75wSJBtl/6C34V4BWgAA=;
        b=svogjyrhOQgVj5tU6ioCqVnomP0nmSu/SzOyUS/rbG1UD0rlXqXMcClS13X/Ks4TBq
         ffm4S7t1L7vHOu8iMBfy1vtA5fazYojFMPOtFbgn3ExdQZJ3Y+MdLXUMsc9a7PTB4ulv
         5RdL7cAjRFQfZn7vpMYudx65PbgCxtu59/0jJ7HMCIJ2LXmBdCF1ougZnpYa33wr7Z97
         J5arr2woYnfvft8QobEq4YhVuV6DIzdhc/qdaGV4ic/erZh5G9h274KJ655ucPtRnuc1
         IVsac5Kt7Z4rX0Nwm2yN+A8Wvlmaj2YIuH49pme9MhFdvswSZSitf2/D7M1voiknFOVD
         pKgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G7+mIjoX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x30-20020a05620a0b5e00b006b26cea9278si13222981qkg.89.2022.07.08.09.59.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 09:59:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G7+mIjoX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9rKQ-0000SP-RU
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 12:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDc-00072F-Rt
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:48:37 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:50780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDb-0002WB-12
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:48:36 -0400
Received: by mail-pj1-x1032.google.com with SMTP id a15so11637704pjs.0
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDlq7Gwmx8RjkvitHJnXFST75wSJBtl/6C34V4BWgAA=;
 b=G7+mIjoXub1NheYWmd06XLVXHaJz5wicH2cKKE3fyO49E2kltVlkfxZSk44pgDXa/u
 RFRwnmnPq2KB32DgvCx1bi4urniouKay2rqJCv77Kd/ILWff16d3subaDknaMjJM6o8q
 byJD6mrSIw1ZgXT4QsBG52TgIlqCHLWzmVOuaj4sYA0cod6/eh3h0CIh0JZRsX59q5jP
 oB5e7HPXjkk+vqnfs/hjmeZX7I4lnYkCyJJlGE5obU8HC4Gd6y4BTRJcENLqM1UHH+Oy
 hCkB5jgfCDXXMBxTiijzjecy66CdCguugfWL4jzxta5qgeUR9NZLnObMj2NJN/WMjblf
 ydQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tDlq7Gwmx8RjkvitHJnXFST75wSJBtl/6C34V4BWgAA=;
 b=3CM8GeJOuv397BRpedRrG68KativMp1b4DcztOy4IWkDEVJnBvuwxBQhp3KuhLR8h0
 fd6cw9nHMf+LgWmBq17GEQ1tGLHsid235QzPGPLU5wmVH0DpXCRFeTNIAiAl0gWKcAQJ
 6n9dSYE2b95+A+ynwcpzv45Cdlylf9gkDbYmnbeiv+mEDwbl3yVaqlPnhPCR6ZOqSniR
 az7N3+GPOXn4+i4obWSvuJrXTHqrZ1rPpyVckL34Z+6a4r3dbv+qNOSJcm8pTWokchrV
 Zo8/7sDrvJQMKlVbtDPaVJSP38Dw+bXHeg7nfY6DjHLmkb+GJgNILTfETf/pHwGEsVYS
 YbXw==
X-Gm-Message-State: AJIora+F1blniHg1RfTAL1+a3VQXFdFQIyqqg8KgAHxuihq2xk1zU7Q2
 LzNNBvJZnzWvcP3yGKCJFn1ilxOoCC4NrGlI
X-Received: by 2002:a17:902:d707:b0:16b:e35e:abd4 with SMTP id
 w7-20020a170902d70700b0016be35eabd4mr4275451ply.111.1657295314262; 
 Fri, 08 Jul 2022 08:48:34 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:48:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 29/29] aarch64: Trivial SME test
Date: Fri,  8 Jul 2022 21:17:00 +0530
Message-Id: <20220708154700.18682-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 15q2MvBhAZsU

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 test_sme_aarch64.s | 55 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 test_sme_aarch64.s

diff --git a/test_sme_aarch64.s b/test_sme_aarch64.s
new file mode 100644
index 0000000..a5ef909
--- /dev/null
+++ b/test_sme_aarch64.s
@@ -0,0 +1,55 @@
+	.arch_extension sme
+
+	mov	w0, #0
+	mov	w1, #0
+	mov	w2, #0
+	mov	w3, #0
+	mov	w4, #0
+	mov	w5, #0
+	mov	w6, #0
+	mov	w7, #0
+	mov	w8, #0
+	mov	w9, #0
+	mov	w10, #0
+	mov	w11, #0
+	mov	w12, #0
+	mov	w13, #0
+	mov	w14, #0
+	mov	w15, #0
+	mov	w16, #0
+	mov	w17, #0
+	mov	w18, #0
+	mov	w19, #0
+	mov	w20, #0
+	mov	w21, #0
+	mov	w22, #0
+	mov	w23, #0
+	mov	w24, #0
+	mov	w25, #0
+	mov	w26, #0
+	mov	w27, #0
+	mov	w28, #0
+	mov	w29, #0
+	mov	w30, #0
+
+	smstart
+
+	ptrue	p0.b
+	rdsvl	x12, #1
+
+0:	subs	w12, w12, #1
+	lsl	w13, w12, #4
+	index	z0.b, w13, #1
+	mova	za0h.b[w12, #0], p0/m, z0.b
+	b.ne	0b
+
+	.inst 0x00005af0		/* compare */
+
+	rdsvl	x12, #1
+0:	subs	w12, w12, #1
+	lsl	w13, w12, #4
+	index	z0.b, w13, #1
+	mova	za0v.b[w12, #0], p0/m, z0.b
+	b.ne	0b
+
+	.inst 0x00005af1		/* exit */
-- 
2.34.1

