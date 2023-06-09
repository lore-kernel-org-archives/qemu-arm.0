Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp103545ejb;
        Thu, 8 Jun 2023 19:25:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7KbGNZm8pkaVkbENTZP50G9U0iUvPmq6kp9jM1Zdd0j7L4sG+H/mj37PzFt5pMuDvz02v9
X-Received: by 2002:a05:6214:21ae:b0:621:231d:8a37 with SMTP id t14-20020a05621421ae00b00621231d8a37mr417590qvc.15.1686277531340;
        Thu, 08 Jun 2023 19:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277531; cv=none;
        d=google.com; s=arc-20160816;
        b=ooClJ5jRvW7RkbFqAQzLQeJGygWzz7Mtr0rTLAIIvCkqoMe47YAhpJJSKOG7Szdjhf
         PzMKowct8n+Jv15L7aX4BRkssEgvA3R5kH7WglFtt8XlSmr3m7c0eVqONPgC+y3nk5//
         m7gkS8DzEuJC/PeLoAiGtbSgf7pNzBoSO+Gc5jk1n2tGXdkV1Bi09JK28/2xQillv2VL
         wTK90l2dADk08m75gbgtsC4cSdEo774S5mNP6eek0G/IsMZ39udEdFhpV9GdrMjRfZgn
         k+cFK62kY8uNkEDsDXTEds3o/OjtqWOdGh4mNgkJD+0MmPLEdCXyJwN/mNIUKxqUkXYD
         Yu/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xtPI4aq2jyFLtOkSRUNw1Edg2O5XrlHB9lkxc+y7YR8=;
        b=KGejnuTKuoGMaZKlcY7qaJGyUq2eE2EQtnsqxOzm50OsiPDft7GtDqHPgvq6wlW76x
         D1ge72QjauQsVzuAiucuOVU0TwJb4x94XbHeqOR6IXtnyzU5ZwK79cA0z84mQVS8v+2e
         1QqQ3rDt38TFJanhzLi9eHRGVH/aSHj+QLr8k+2oNhND10dZTjmTkqgL8Ue8KJeSAqj3
         e2S+V7oFfYy4mRrFg+/P3EkQxgWj5sGp3oQr6aZ32tz9DdkpAdlr7iC3CXkghzxU1jh0
         ZdUZv3vfQsqgpDxr+rJVhkQIUV6ynm4F3C63RY1Hi1Qv9aybLn6nGDjNz63+nQ5IkqWk
         vVsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k3oyLNnH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hf7-20020a0562140e8700b0061685abbccesi1701568qvb.361.2023.06.08.19.25.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:25:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k3oyLNnH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7RnY-0002az-Jo; Thu, 08 Jun 2023 22:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnV-0002Ze-NK
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 22:24:18 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnP-0005ZJ-33
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 22:24:17 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-64d18d772bdso1318343b3a.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jun 2023 19:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277449; x=1688869449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xtPI4aq2jyFLtOkSRUNw1Edg2O5XrlHB9lkxc+y7YR8=;
 b=k3oyLNnHSLFITjqaFD+WjQp4W2cV4L1DXSSMI1PxyPdw7hM4oJoVHBmUztnIo6HJhj
 Ed4jzMvWPInSdibF3AOC7m4M18C6jjGIws9Za0Y73CtsGPzDbo13jh1faChQCBk3f/K/
 plW8XYN8lOcgjEcaUptLiAhGOTjyaN3jO+kRoIIh1hHXxo61gHxebDh5JYW9MM48YFKl
 jvVfHG9KWL0QjNo6VYSlEjq0P+i5LOlcvDzczOwi27ZQgLRYSgOYt9pBXeGNbcOotHXk
 L6kOD7+xmM+M/JRaLR+AYQD/+1RhqCt7O6QoRp1iOLBcvraC+H2BV3m9Ano0p8rx1SrG
 LFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277449; x=1688869449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xtPI4aq2jyFLtOkSRUNw1Edg2O5XrlHB9lkxc+y7YR8=;
 b=UMqDDg45wWb/gY5K/h0FqfevLlHQykfXlp1xQjgEUwe/4UOH6FRANaGYkIN2J7sss/
 Y+vfTx+8FyBnaeGeHB9r8uVBHjH4xnOKZA6aqU4DdY3vgSmHh7AJltrhAX6TCwtsJgMe
 pwtoKCRC4ktc2Nv/e6S6ibTNl4AJ+kfGydysZIHXBO/3hxj6xP9TYl+8gzB/ItE+Z5f/
 OoMn0PjNlYH8pQAerCGotSeS7AmJdIN6WPahWD5ORKM1ar2a/YgMQRUKGMVzGotd8yKQ
 Kop8u/g/pnnDAIdivxtMK1Mo/klxpAqKXkaRzrW5JKXgcH2JwWZKLlxB8rsmzp4V5fSL
 HLNw==
X-Gm-Message-State: AC+VfDwFCEylyS+TTSrUJPBEMTDHbgbSOVmGZsc8waZwDStqiE8r9aAZ
 RJ57gjuozcZL+D9kbf9GlD19zbO4d4ZnojvuFvs=
X-Received: by 2002:a05:6a00:1a87:b0:65b:a187:d433 with SMTP id
 e7-20020a056a001a8700b0065ba187d433mr48792pfv.6.1686277449662; 
 Thu, 08 Jun 2023 19:24:09 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 07/38] target/i386: Use aesenc_SB_SR_AK
Date: Thu,  8 Jun 2023 19:23:30 -0700
Message-Id: <20230609022401.684157-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Dgx3xII/2VDH

This implements the AESENCLAST instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index fb63af7afa..63fdecbe03 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -19,6 +19,7 @@
  */
 
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 
 #if SHIFT == 0
 #define Reg MMXReg
@@ -2202,12 +2203,12 @@ void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 
 void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    int i;
-    Reg st = *v;
-    Reg rk = *s;
+    for (int i = 0; i < SHIFT; i++) {
+        AESState *ad = (AESState *)&d->ZMM_X(i);
+        AESState *st = (AESState *)&v->ZMM_X(i);
+        AESState *rk = (AESState *)&s->ZMM_X(i);
 
-    for (i = 0; i < 8 << SHIFT; i++) {
-        d->B(i) = rk.B(i) ^ (AES_sbox[st.B(AES_shifts[i & 15] + (i & ~15))]);
+        aesenc_SB_SR_AK(ad, st, rk, false);
     }
 }
 
-- 
2.34.1

