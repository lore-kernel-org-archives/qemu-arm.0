Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1272623lfk;
        Sun, 17 Apr 2022 11:05:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAT3hZ/O/tHQroUQjhMSgGnQfthiv8q9pRT+k61rnWAhk30S/oESa6h/3E0+hzyJCz1Rey
X-Received: by 2002:a05:620a:40ca:b0:69c:59d7:9d06 with SMTP id g10-20020a05620a40ca00b0069c59d79d06mr4840362qko.0.1650218758234;
        Sun, 17 Apr 2022 11:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650218758; cv=none;
        d=google.com; s=arc-20160816;
        b=WQW1HdsGbxbrhX9QL6fcg0OvkpzTAgBi8jk0I7ab/PgjiOAiyKOjhog2v8Rg4a3doQ
         Wf2kAFT1beT9zYEhjG5bN6aJoopq9nIZARsqNfjjtQlyu7+yNb5Ipl+NNdDiU8V5tWBn
         kPrB8pnn+bIjsRIoRSVi3KFaOcLMHj03xMx6qnSfXTYLeNoi7DPkTCC7GX7H0wZcpctt
         NUFKJ9A4A479XTYL/7ISgQcnebZbsgW+GPxfFZvsppHq/5quLaTUXrvKFn/3bZOaLdfz
         N33ajeeBbcjQ2qBg0DCIuHPmmM6Qw93iJKQKpM0h+oJylVK8oRAECTpY95ltfjryshXA
         +2+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=d/uFztF2R9mSbyAkaIbJngefgd7536mac94QZAXGuz0=;
        b=VPbb5p4JSwouoPsJXkyXqJtEcCbjhp7F10mPIsQFuqqnGIBSDkrCSskAELKB4y4jBG
         nWSrdybU8eSTaRrsPILDB5EM8vkLyNRxrb0nB6XimpOLsme34SiLJg7HS82k+sebJ2S1
         l/XlvNENV6ZXwbbPWoNx/DloXpZv1l8aEO+xPifxm033yrmQeWQmV014jnW7MNS1lEHB
         oWO5fzxh7+eNwBPj1lSBWzY6AVJn24VNbTnjWBx2l0vKrdoK35v8qe0gVuj2lNUJVinh
         D0FwwVus211o2asQAs+74b0gwwGLUmcG1Y9fbxx6fU6tzVsKvf/jwvzMx5NrMCDISOmk
         9jtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xERJDA75;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5-20020ac84605000000b002ed141ff24csi2237083qtn.778.2022.04.17.11.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:05:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xERJDA75;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9HZ-0000GO-Od
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xC-0000vm-M1
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:54 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:52964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x9-0003Lw-F3
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:54 -0400
Received: by mail-pj1-x1032.google.com with SMTP id 2so11331371pjw.2
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d/uFztF2R9mSbyAkaIbJngefgd7536mac94QZAXGuz0=;
 b=xERJDA756fJ3VZkY5DZkGuGfp2LDg5vlQUqtlbbT/YyGE7Ky5H+Fmti4vuYBqtjigR
 IlNYHtVb1RsKUiu9N7tJPEoVWShwHhzYpSeafu0xvjnbtxcWpbLbFaLPI8fs1o0tx9T1
 wUchWRcG8jgg04mDn9L4IiZiZ0QFoLAYPaQv7Kq5Y7F8Y1nVU4Coxi1fGQXx08Amn7Dd
 eAYowdbgp6bZ6TZ0kVnj4BqtKh5Isf/y1iMg09uOvrzbBw/QN/Pb5OCcg5xbomuiYc4K
 az+TLK9dH0dqzy6r+g/9NKz91HWqqOUUFIl9docFXkuOvJele0Ovs8MLcgX05qVLh6Hg
 asnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d/uFztF2R9mSbyAkaIbJngefgd7536mac94QZAXGuz0=;
 b=2nCDJ+vEM4GPufb+KcMMlDrIVCD5YhLKToV5lqjg3YO/iA0DC3I1l/CooPK7VBP/lY
 85ijYSvWcBi9BXFbYMEOJ54f9DL7hAGhdkcwkSfRVa9DfBazF08tt0Mmc5J1tt0v0h7v
 ZJKSJ5DNcoxVOxcnnkv1La65vE7zPAMrQfm0uW8rqaIpKU30iRmhI9sNHp71wSqhtm8Q
 WUswukSRcWyCZWStkNNd7qwDCJ0rPXq9La5N05WQNveVEHg0jenc/P9GktwIuNb+yJ9N
 0pOAdtHXVrTC+lzAepyYg7yAOlK+dFCsO0l5KRUGIaJiTdv5XZM4D3w4+0oK5Lk5OE1h
 3nPg==
X-Gm-Message-State: AOAM532Qn6gSsvKSqI0F/BYz9nLx8anVwYxqzsB6CGt6oJRke+FpUP04
 Jg88pa3uDAP5eAJfEf1k7q8sHg==
X-Received: by 2002:a17:90a:b307:b0:1bd:37f3:f0fc with SMTP id
 d7-20020a17090ab30700b001bd37f3f0fcmr14460341pjr.132.1650217489722; 
 Sun, 17 Apr 2022 10:44:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/60] target/arm: Use tcg_constant_i32 in translate.h
Date: Sun, 17 Apr 2022 10:43:49 -0700
Message-Id: <20220417174426.711829-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FhdpvCs6fRpT

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 050d80f6f9..6f0ebdc88e 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -332,16 +332,9 @@ static inline void gen_ss_advance(DisasContext *s)
 static inline void gen_exception(int excp, uint32_t syndrome,
                                  uint32_t target_el)
 {
-    TCGv_i32 tcg_excp = tcg_const_i32(excp);
-    TCGv_i32 tcg_syn = tcg_const_i32(syndrome);
-    TCGv_i32 tcg_el = tcg_const_i32(target_el);
-
-    gen_helper_exception_with_syndrome(cpu_env, tcg_excp,
-                                       tcg_syn, tcg_el);
-
-    tcg_temp_free_i32(tcg_el);
-    tcg_temp_free_i32(tcg_syn);
-    tcg_temp_free_i32(tcg_excp);
+    gen_helper_exception_with_syndrome(cpu_env, tcg_constant_i32(excp),
+                                       tcg_constant_i32(syndrome),
+                                       tcg_constant_i32(target_el));
 }
 
 /* Generate an architectural singlestep exception */
-- 
2.25.1

