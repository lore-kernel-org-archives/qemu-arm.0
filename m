Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp597670lfc;
        Tue, 13 Jul 2021 06:41:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcKDFLJXUYTr3rzLqJwroTfVF4p5QYMtg2MAJNIbKoGPiHGeQsTp+RufU7IUK2K8rvCXnw
X-Received: by 2002:a67:2c48:: with SMTP id s69mr6120420vss.46.1626183690301;
        Tue, 13 Jul 2021 06:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626183690; cv=none;
        d=google.com; s=arc-20160816;
        b=Xxs24os5r3KzZwyhCIRAKRw0fG2xrurlbderiuz0RLYvDPliltEGLqTgdHR2SuiZ4t
         F1VIbwBtkavQPG45ktaJRoa91LPTss/Hq9PV83TPG6W1eUo1e62zANEsB51e2atQNs1m
         Q0BIfhfo08D1w0z3eAQfamOv2SYI4feoZIf9jPJE3lFq9Q1D1A7NHIqRlXzG5dX5tq5s
         HznFGOw12Qz02W8ca9BCSyPgu8GZGosQUBh6yY/pDCoYkrntfTFEpujwTpY7jXgqS95v
         D/CAwK4eRybtnxTk54viCjCJHqMf+tercUFiJsrQJgmy+y7J9QdpqfBHwZbm7ctC9HHN
         quhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Bon4R+GO/Kh6lXfctlExnNFuhwRkWgeWXsUtfA3/MIY=;
        b=XzxKgHM/Wc8qOLUDyH+M/sL3IUqyYuVz7f0I8hB+a+AsHb1rYQLTPSvQT8+cMpdpXx
         7aXQG+OxqaCQig7YN4xeMhUc6KVEcJGN1aDjzKFTjKgzYewMoGTB6M0r0snjjKt0qb0P
         l3DKosCqDiNlgj6F38SvbT//b65bsfXjrdmNVjY62kp7tRsj2osVnq6J09TxF8bTBRK3
         oHfLH62oPUgSazzI45E8jG3sA8fdBFqV2cGo+4l4DttAorfdsYz4nWTcDa0oppbbuxTc
         0J9ZZNKcRUN+h2Kl39JAzbLJSJz+2Ds10jKAl9+o2Wa07tOVKwFv+JwUk3wDc2onLGF/
         jCnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IMFRlO/2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h129si17908186vkg.12.2021.07.13.06.41.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 06:41:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IMFRlO/2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3IfB-0006hX-HG
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 09:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbR-0008HX-9R
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:37 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbM-0003bJ-O1
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:36 -0400
Received: by mail-wr1-x430.google.com with SMTP id d2so30571368wrn.0
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 06:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Bon4R+GO/Kh6lXfctlExnNFuhwRkWgeWXsUtfA3/MIY=;
 b=IMFRlO/2qfyAWzfeywhLG8VbndFXEw4ttLF85sFynSGtY5DjuwCw2a1iX44y7udzyH
 mUNO/YHeLf9Sk61jdG9dvaOZXivbzq7bFFuL0pATMJZw0poeiF7Trcc1486K51dSshms
 khqqabq0ykM8VioFckReDqhRhavCAG6USC8n5/fhHIW5/xY1oavQnj84sfcrSnkW7lLm
 T6CQc55/niaISZ8ybmGfxKblBCj60hV3EugtOt1YcyqfAAxYNFZFLsln0brBTJ+G+72P
 qz7JQtidTIr036mZVDrY7g3ZrXN/UEFIax9jdzVHIsSE/0TCUE5moEAnmxMZzorIq+1o
 bTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bon4R+GO/Kh6lXfctlExnNFuhwRkWgeWXsUtfA3/MIY=;
 b=EIvaEoP27PviuhC6Ghf2yjKYZtGdChudKuwUI0cqNjOQnje9NONnZfczTbjQ25v8EK
 2s08hO+Z2aOxzVqzHg/mW/HOH7o2aKuRjX21NIAjps5cmEb5snAMv0efPz0xRJ93/9TX
 8Bi5qJFifAz/dbrt3WBYLXfx0f4EqkKm+rzRY+HoWiKDMbtac7Dy1Cqc4GEWvnK7V+sQ
 sCUwkERnfGEBOen/j3n4rbbyk3QZy/ZhyWsnZzwIZFIvzqi5/w1t2bJBmrMqRM3H2k1w
 TAIkgNKPsWs4GRC8Pz+UPxd9XA66lLF2jXNK1pSQ6PBK3aDfjVygrw6H6tFCHgG3WEcg
 3pnw==
X-Gm-Message-State: AOAM530LMRC6T4BU2vVRWlOQobWHb8Q7eA4zYilqKjJwTnenckgae0dL
 QAVDiAK2dwxmgJFfZG7LEmTVlMoXnH4BSf6k
X-Received: by 2002:adf:f90d:: with SMTP id b13mr5917402wrr.336.1626183451487; 
 Tue, 13 Jul 2021 06:37:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 03/34] target/arm: Fix MVE VSLI by 0 and VSRI by <dt>
Date: Tue, 13 Jul 2021 14:36:55 +0100
Message-Id: <20210713133726.26842-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yzi1gdFb/7rv

In the MVE shift-and-insert insns, we special case VSLI by 0
and VSRI by <dt>, both of which mean "no shift". However we
incorrectly implemented these as "don't update the destination",
which works only if Qd == Qm. When Qd != Qm this kind of
shift must update Qd, honouring the predicate mask.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mve_helper.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index db5d6220854..16a701933b8 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1276,19 +1276,23 @@ DO_2SHIFT_S(vrshli_s, DO_VRSHLS)
                                 void *vm, uint32_t shift)               \
     {                                                                   \
         uint64_t *d = vd, *m = vm;                                      \
-        uint16_t mask;                                                  \
+        uint16_t mask = mve_element_mask(env);                          \
         uint64_t shiftmask;                                             \
         unsigned e;                                                     \
         if (shift == 0 || shift == ESIZE * 8) {                         \
             /*                                                          \
              * Only VSLI can shift by 0; only VSRI can shift by <dt>.   \
              * The generic logic would give the right answer for 0 but  \
-             * fails for <dt>.                                          \
+             * fails for <dt>. In both cases, we must not shift the     \
+             * input but just copy it to the destination, honouring     \
+             * the predicate mask.                                      \
              */                                                         \
+            for (e = 0; e < 16 / 8; e++, mask >>= 8) {                  \
+                mergemask(&d[H8(e)], m[H8(e)], mask);                   \
+            }                                                           \
             goto done;                                                  \
         }                                                               \
         assert(shift < ESIZE * 8);                                      \
-        mask = mve_element_mask(env);                                   \
         /* ESIZE / 2 gives the MO_* value if ESIZE is in [1,2,4] */     \
         shiftmask = dup_const(ESIZE / 2, MASKFN(ESIZE * 8, shift));     \
         for (e = 0; e < 16 / 8; e++, mask >>= 8) {                      \
-- 
2.20.1

