Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1545729ejb;
        Fri, 2 Jun 2023 19:39:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ57RGaekyM/7Z9IvQSzdaoaVN3DQCPh7k4veQOj3yZN3jl83Y/L7siJeZnVJRk7pX3zHfTH
X-Received: by 2002:a05:620a:4688:b0:75b:23a1:3660 with SMTP id bq8-20020a05620a468800b0075b23a13660mr16775948qkb.33.1685759952980;
        Fri, 02 Jun 2023 19:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759952; cv=none;
        d=google.com; s=arc-20160816;
        b=eMbWg8s4RvljK9o4xhu+nLankrrHt1f/j2jk+3Tk1bh6BBbH+tReS/YTWosvI6akiG
         XjN51DP4g7kiwh7P7X1IwJykKDtRGLvrYXu6XxqJW4+GMbmwN7s+2WesYlXpNmnSL9PF
         8BJ9CXE/wyu+gcI7CMBOjJkAVB29Q4HSGmxeYId/IjiEZrk47plp1BOV5EcCPTrws33a
         p3PfCP5piZ86ANuAIWRZs7btH3pGpw5EXFg/7MYtFuJr157IzuX9C57YRR1o3et+r3uw
         PI7Kz9ouIeGSgZ1bhSdL8MRk1GAlOnn752UMb3JbWitcTI91bISkmqD7p0nTQ7t6mrth
         Wvdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bOy/7D0V1nmDJKV8o/vdRKDOk9tiJCT68kr08p43Sdw=;
        b=BCfLZ8iBPJ28qRWWLc2sWxJD8WOxs5qC8Wo6wx61j0emX9522f/CAAP6phRelIOhYc
         MFAl6o5XlQC4kFcPYbJ/HkV3VYiDnF3ni+cG2z1BpIN/YAVeoDtClguVYyi3OVh7kawa
         NO2yK8LJJ8xfXF/enuQmpzg5MqcB8SV04TfRtXrESuvXxtPJm0dE+WXn1LfObsrqsWP0
         b3N9BWgwVaSzHwunDZj0wuSwBmCrKiyQh/NGIkVrrXQGX537YGiO7I6urv38XN+ewCJI
         uvkqV2KO2rembaR7u8D0aC0xjPrzSRPLjl9fXxFn6eaVQiih5Yh5NkYrUXdvfwKlSo3o
         H+Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="li2am/BJ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8-20020a05620a030800b0075cc7d20d3bsi1617931qkm.663.2023.06.02.19.39.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:39:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="li2am/BJ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q5H6i-0000eF-A4; Fri, 02 Jun 2023 22:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6J-0000N7-Lx
 for qemu-devel@nongnu.org; Fri, 02 Jun 2023 22:34:43 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6C-0004jh-30
 for qemu-devel@nongnu.org; Fri, 02 Jun 2023 22:34:43 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-55554ab909cso1963382eaf.2
 for <qemu-devel@nongnu.org>; Fri, 02 Jun 2023 19:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759674; x=1688351674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bOy/7D0V1nmDJKV8o/vdRKDOk9tiJCT68kr08p43Sdw=;
 b=li2am/BJj+JZ0uuZCArtt3g71WyZK8tFfJvww2JvF0VlvmhwjFx2eE+9Mu2JuGVAKa
 4jOWht5+1j5Ggo1d7tlGjNe6c4YeCrspx2PktjCQwRhhqMjrRIG6ezgpww+HZTbxvbhM
 7cwAanA3EclRTUDwexpTZhSWGV6eCK6m6OyhUtKqOTQ3MQOUd2KxRe75TNzJrsf6KGV5
 hyRJ6PYL1++vPB+oA5qB2SMUPknxWG6ehxOuAJkW26etfu8BcplO4ah8HqRsmhURUVCh
 Atkqn1NZTuaoj5Khxn0G9P4qPA+222IIHvmTI3Kb7kPp+0Ful1LNxgEeIwXHUAW6oWzS
 n5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759674; x=1688351674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bOy/7D0V1nmDJKV8o/vdRKDOk9tiJCT68kr08p43Sdw=;
 b=i+4ejfeP5glq+vh1Mw1zA/K6lx9Z+qe8uhF0JcRv3pGLb9EaqymXvSOngZDYEN+mdI
 6zby0KYOpdWwcinruCS/Hvx+DUp1rExWAnmcwTcwGauVXgm8S9ur5t3edbb3R6US5Q4m
 uzwvNZCA9fv4djlhZ4rsIDOjyIfsGqrd8pt29Lc5cfBAFBERHSXDS0RC7+FwftjoeMTV
 LfOvxWZoMFL/eGxoqhAmfUVrNURVE26d4gmD/3H//tLa0sXJwqhT9juHqHhLMj5sUI2w
 wTYbz5NxK2DJ71HmPid1mthoIX62fES7ZaYC+1K8iDgKm7BNLbm+gXlJBbOfVkYRbnHp
 9Dww==
X-Gm-Message-State: AC+VfDxwQFRfeFKTzcV4pgbThKRjX3jzLbxpfHSOx+ht2esqC2wdWNqD
 k+izt+RERbi/A+0PDf9uz0CalKDDyb0MXBA24no=
X-Received: by 2002:a05:6358:9103:b0:125:9f49:b1b9 with SMTP id
 q3-20020a056358910300b001259f49b1b9mr11044333rwq.12.1685759674092; 
 Fri, 02 Jun 2023 19:34:34 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 07/35] target/arm: Use aesenc_SB_SR
Date: Fri,  2 Jun 2023 19:33:58 -0700
Message-Id: <20230603023426.1064431-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc32.google.com
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
X-TUID: /CSbPjd5y7lT

This implements the AESE instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/crypto_helper.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index 75882d9ea3..5cebc88f5f 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -15,6 +15,7 @@
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 #include "crypto/sm4.h"
 #include "vec_internal.h"
 
@@ -70,7 +71,22 @@ void HELPER(crypto_aese)(void *vd, void *vn, void *vm, uint32_t desc)
     intptr_t i, opr_sz = simd_oprsz(desc);
 
     for (i = 0; i < opr_sz; i += 16) {
-        do_crypto_aese(vd + i, vn + i, vm + i, AES_sbox, AES_shifts);
+        AESState *ad = (AESState *)(vd + i);
+        AESState *st = (AESState *)(vn + i);
+        AESState *rk = (AESState *)(vm + i);
+        AESState t;
+
+        /* Our uint64_t are in the wrong order for big-endian. */
+        if (HOST_BIG_ENDIAN) {
+            t.d[0] = st->d[1] ^ rk->d[1];
+            t.d[1] = st->d[0] ^ rk->d[0];
+            aesenc_SB_SR(&t, &t, false);
+            ad->d[0] = t.d[1];
+            ad->d[1] = t.d[0];
+        } else {
+            t.v = st->v ^ rk->v;
+            aesenc_SB_SR(ad, &t, false);
+        }
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
-- 
2.34.1

