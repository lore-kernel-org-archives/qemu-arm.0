Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp6049026lfy;
        Mon, 3 Aug 2020 06:28:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAjY6vQIu1FXbUFSRFZ+R6aKO1tS25DlKh/c5wR16YJs/6wiPZ7S40O5qiiuhLt+zEP6fY
X-Received: by 2002:a25:b746:: with SMTP id e6mr2621717ybm.282.1596461311261;
        Mon, 03 Aug 2020 06:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596461311; cv=none;
        d=google.com; s=arc-20160816;
        b=YOCJmBt6FZZv+gm2aPWGWu2MNSrdRcfJ45mJeyh9TUL91ouvnf5tvbdf6K0N+YZApy
         lP0XbrUv+ye6YSCV9JCyIPlinOQJXAUUBE2HelF0eLWC9gThKLiE3qjFcMVe0/imoM3q
         PLDU+Binl+QKmxPXG7PynTdTRIyPfdO2D4ZicC2oSQffG6meAFKC8i+EPkasH4P5tLer
         P5v6KNqgpMP2fxiGdOeQ8MC5w1ciRq9j9DmCvmc+sYPT/gl1/9NWpFKUa7d9KapXLw6c
         2zhp4FE9ffwfQ5n7dTC5Slc7PBI3YFYmKuzUtqUeRt4MQNXgBp2w+g01ir9qy2JmOTYr
         6Ycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=AyFACLs1JXpjGZamPbhug492vRl8MO0LxHw3leLeOJY=;
        b=BSr9HAwbOK2G94T6qRZ5WjP0mIAbDE/sdQp+D9lzXKSqD+1WFvifuuuh9/jJSczYuR
         r0jkeimY8xhNVfGCXf5++wUXJ6JNpK0r4iLTa1RfyY14i8ydjA3UjnVF5HKay4rdsME6
         YlgwXFnuwJgF3FGmw5ISVJyMBESuZ+kxAk3/Ows4RKZrsD3fgQVF0ANEnyQN/6U9tCZa
         QfgjTiCCBBRe9zeFPyhqFoJ6h+2QRsyBHczOwdMhj4DKN92/VWOdWaA0tKNWIRHOea/r
         MU91UjeIDx2Lie7npSOUIKYS6GAtgqcuQWESL+oUTgH67vaCj73u8fm/2MsDjsUqUVxW
         LIiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X7aFV4F4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f192si14444016ybb.107.2020.08.03.06.28.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 06:28:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X7aFV4F4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2aVy-0005Z3-Iq
	for alex.bennee@linaro.org; Mon, 03 Aug 2020 09:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2aVp-0005X3-IP
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 09:28:21 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2aVo-0004Re-2I
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 09:28:21 -0400
Received: by mail-wm1-x342.google.com with SMTP id f18so31491wmc.0
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2020 06:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AyFACLs1JXpjGZamPbhug492vRl8MO0LxHw3leLeOJY=;
 b=X7aFV4F42hecCsGW9+iHhpQSqD6Mjv1znBSbF1rrrUrbeqpid8cHtc/TEqca8L+nh2
 MG/7gwmmOFCQTPZY1X0+VIwvfkhTsuOAr5RernW6JBENEVls95NwFoXVqaEAbP1J8WMl
 nTLP2l0L+VjAb3bHiDba3vevzoYugfUue0vwEAx2Z6rWvMqzif9235fG1Geng1mLHjJU
 l6Z+w+eQBbC5l4iJniwlxlG1YEejc825+3IfnfMojxFqChJKKqcEt63xDKs47tE8jbuu
 xP5B+qDVVdsAyNzMbyGCkPcbEYcRZQ/unYkW1h90Cxq+SV65CY7MAD9h2zYIWcZ3gAGm
 Nb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AyFACLs1JXpjGZamPbhug492vRl8MO0LxHw3leLeOJY=;
 b=Aavdjmp1jA2eE3AzFQox92faO1cQD4DyvArMwCCikewZL54GFKIvRTu3iSqCMRaxRy
 GCKbJtt0o8s1E9iXZuW9cJQhHUYT/wcClxgZWzTpclMAFqA5V/z8njzf9pDjVAdG2h6w
 j2csR/LmwRx2C9BRL9aiQFa0kKysvm9Y+0pkDvLWEZVlDOKHj6FUEEl28czMMS+dWcvN
 c0xRMX9ezZO5lmLLN56UpUD2PSpZjthAJx/1mQDtwYwusMAE8dlHpBLsEn/LbzqZk+mK
 XRuBf2v3x9vMITGf4iQcDpu0RmQaQuWtlXyNrSsy+zOe3dFUeL1Dz+VxPv48oez5f/DF
 8mTQ==
X-Gm-Message-State: AOAM533tlx7Ih6/8OMn6M3hMZyWyopfThAoLwV1LVvM4YH4WC9Knwnf3
 7xA5Ok9wXjdU9jXt11086+FeazM6bJaDLA==
X-Received: by 2002:a7b:ce81:: with SMTP id q1mr85393wmj.24.1596461297424;
 Mon, 03 Aug 2020 06:28:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l1sm26508028wrb.12.2020.08.03.06.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 06:28:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm/translate.c: Delete/amend incorrect comments
Date: Mon,  3 Aug 2020 14:28:15 +0100
Message-Id: <20200803132815.3861-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: hdthy06xxLEk

In arm_tr_init_disas_context() we have a FIXME comment that suggests
"cpu_M0 can probably be the same as cpu_V0".  This isn't in fact
possible: cpu_V0 is used as a temporary inside gen_iwmmxt_shift(),
and that function is called in various places where cpu_M0 contains a
live value (i.e.  between gen_op_iwmmxt_movq_M0_wRn() and
gen_op_iwmmxt_movq_wRn_M0() calls).  Remove the comment.

We also have a comment on the declarations of cpu_V0/V1/M0 which
claims they're "for efficiency".  This isn't true with modern TCG, so
replace this comment with one which notes that they're only used with
the iwmmxt decode.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
In an ideal world we would clean up the iwmmxt decode to remove
cpu_V0, cpu_v1 and cpu_M0 entirely -- they're only used as
temporaries, and in a modern coding style we would just create and
dispose of more carefully scoped TCG temps as we needed them.
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 27bf6cd8b51..87235db4640 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -59,8 +59,9 @@
 #define IS_USER(s) (s->user)
 #endif
 
-/* We reuse the same 64-bit temporaries for efficiency.  */
+/* These are TCG temporaries used only by the legacy iwMMXt decoder */
 static TCGv_i64 cpu_V0, cpu_V1, cpu_M0;
+/* These are TCG globals which alias CPUARMState fields */
 static TCGv_i32 cpu_R[16];
 TCGv_i32 cpu_CF, cpu_NF, cpu_VF, cpu_ZF;
 TCGv_i64 cpu_exclusive_addr;
@@ -8552,7 +8553,6 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     cpu_V0 = tcg_temp_new_i64();
     cpu_V1 = tcg_temp_new_i64();
-    /* FIXME: cpu_M0 can probably be the same as cpu_V0.  */
     cpu_M0 = tcg_temp_new_i64();
 }
 
-- 
2.20.1

