Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1544573ejb;
        Fri, 2 Jun 2023 19:35:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4grNjAxpyk+OKn6ggaSNURMQVIIIC7Ywvq1zK0j6KmcZIKmYZMajTupmLCafTOEfEzj8U7
X-Received: by 2002:ad4:5ae2:0:b0:626:101a:f8 with SMTP id c2-20020ad45ae2000000b00626101a00f8mr515801qvh.25.1685759748604;
        Fri, 02 Jun 2023 19:35:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759748; cv=none;
        d=google.com; s=arc-20160816;
        b=odVdea3PihrYQrnmmoiPS5LNopvIB2Uplk86nf8G3UIabRi1qfJK3s48HKNutTrYOS
         pm9UQVYxLeQW2nbrn5EJtAy1ddPX7Swzs3IdutO0AlJ9GyFivtEPZCGmkh5qPqjdrQVT
         IMEVSG9u5i+VLzcLPPZDpWx3N6xPtZciqrd9kHs6hub0ieA3p9xNi20FWBKF//GThOkh
         WA5DBH9vG75yWan9vzhmlaIR1fh8Eo40SOPTjNdBwMrVhd+sc386KGUzYYLyqgK7WTw5
         Fte1QBzRv41NHuDlno7r6rwmxyxWOICMwlhk7nRTkvfBXCrxazq02t+sudlTHveDD7Zw
         0G+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u69UQkBy31b+t/zyg2gVlBb3lh+xndEyIjHtbKZIvTU=;
        b=Ik4qXrh9k05I22+8PRMrfaoKgZTEeBV98iXTTf+T2UWgGzmESbcBuvr8iZaTHs3wV4
         h/v7/BmEkH+lcLPfre5on9CLzXIil6fgAfKlL09ocftUxK+rHbjfJvh1iwbQYFz047vl
         VkaqhYWayuo8G4zsT1VrtfXG0eUG0v+yVjh/tqgxQKgffvwINr6mohu9nMQ0i3BFLH/j
         Txkjbifqkknqdybw1QvJHzKnI0VzJX5Ldu8lv1q33IbKL5Gm2iSvAtxvoiFyjoSqHOEA
         X3jiUgS/nBe2LKGC2adVygVHG+t73EU5I3S8NBVGnNPDplciXd/kBFEoR2l99WQUI6wz
         gmpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pWvCC9uQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r19-20020ac85c93000000b003f0acbd88f4si1682041qta.470.2023.06.02.19.35.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:35:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pWvCC9uQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5H6h-0000er-75; Fri, 02 Jun 2023 22:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6Q-0000T5-CN
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:34:50 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6G-0004mA-P8
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:34:48 -0400
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-39a50fcc719so2044209b6e.2
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 19:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759679; x=1688351679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u69UQkBy31b+t/zyg2gVlBb3lh+xndEyIjHtbKZIvTU=;
 b=pWvCC9uQQxp9QIFTEsfnyKcJ00EqthHlH/bPANtGH3qmEF+6+kVSTbiHumeWYbky7B
 h1btG8baW59HZuI7EznMBCFaPhx76Zjpe0WBBiUtvr7NRfQ0oTD55o3bdgeS7q9+z/lU
 WnqNqRkFfC+yoOBPmSANLLq4MjxiFA1F9oSCCz3X7pnjObtCZDsUJr4+7/SJQ2CviIqZ
 JCyMEGR9WoIo+xg7SDJlpp3iMQatpPjKd7PBgb1hdYgH0OKs2ZTmNTNiKikD5oJZwoxS
 dT5MJzvzameFTkJATJZVzr//h3V39a1ccvj/vyIKgvfSS7BDJONUMoLQFoCFWfpsKR4E
 LDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759679; x=1688351679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u69UQkBy31b+t/zyg2gVlBb3lh+xndEyIjHtbKZIvTU=;
 b=RG6ot1EFoMIyMNR4wYKldZ99Wcssnx6a0ZIcdpqIf8dSUWbjRO478BQK/voVkOx/+3
 wRK5y6UDfPjMartU8lpYCWrkNj/dNwYjpYuUFTcA3JrMtWeIMBGp2WIEH7WcS6yHMmP/
 njkqLr3yvwl9rBexYJbw6RMj3dtlAM99zA6P1am6hX9FbXtXD8mlrx005z0VWgYJ59se
 LKNTr8C8Ey9Ksa7dCYuFdcSRsCPr5PUaJ/PwenCyBdJH1H6YhON3C0fmcy8GfxL3VMGh
 Cc84/m9VdzdsskTrrt7aGL+yEbxqoxHYzYpeRDEZJIJZfeN/ODu/tIkLrp5pH+rTOh42
 szcQ==
X-Gm-Message-State: AC+VfDyBkqFNNuceDPDD9A1NXKVwQKNrGgBMUm/0RhcR+gv83jkoFr7n
 aIHxlwXIVNAaCD0coauoQc/QOLbB3VuG5hRfurw=
X-Received: by 2002:a05:6808:649:b0:396:63a:a715 with SMTP id
 z9-20020a056808064900b00396063aa715mr1698260oih.56.1685759679191; 
 Fri, 02 Jun 2023 19:34:39 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 13/35] target/ppc: Use aesdec_ISB_ISR
Date: Fri,  2 Jun 2023 19:34:04 -0700
Message-Id: <20230603023426.1064431-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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
X-TUID: rZgLctzMRdrH

This implements the VNCIPHERLAST instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index b49e17685b..444beb1779 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2979,13 +2979,13 @@ void helper_vncipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 
 void helper_vncipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    ppc_avr_t result;
-    int i;
+    AESState *ad = (AESState *)r;
+    AESState *st = (AESState *)a;
+    AESState *rk = (AESState *)b;
+    AESState t;
 
-    VECTOR_FOR_INORDER_I(i, u8) {
-        result.VsrB(i) = b->VsrB(i) ^ (AES_isbox[a->VsrB(AES_ishifts[i])]);
-    }
-    *r = result;
+    aesdec_ISB_ISR(&t, st, true);
+    ad->v = t.v ^ rk->v;
 }
 
 void helper_vshasigmaw(ppc_avr_t *r,  ppc_avr_t *a, uint32_t st_six)
-- 
2.34.1

