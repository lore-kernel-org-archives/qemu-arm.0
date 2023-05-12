Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4842756ejq;
        Fri, 12 May 2023 07:43:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6/gdYO56UyZTx9SCrQ2SFeCrcxAXEeAeJdO+N/lo974FuYiTm+y5uaA8E65OqPIKc5qEqw
X-Received: by 2002:a05:622a:1aa8:b0:3f5:713:adb4 with SMTP id s40-20020a05622a1aa800b003f50713adb4mr43448qtc.18.1683902601260;
        Fri, 12 May 2023 07:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683902601; cv=none;
        d=google.com; s=arc-20160816;
        b=qIaSUAKN5vUlhG/fVT0C4dMVaFF2/XLw84VzHrDKfVerkuC/96FxzM9JHZqqyeGl2h
         U1nU4EcUbS7xnLcG5F5IkaN9a7TkoXeQXNug2VSJ1QnzP9vfNWhSYx4YAProEc6PpWNp
         txg6bYy9y0K7LeXynJW76yBYdWgAhQWlAfgP79e7+SlsR/9FyBItHoWOXnF5jInLEC4y
         1i5XD7qkwFTxsCpzOgs6evmImFiSfF/w2nb6ymojmwxE+2OZrL7CYX/6RpC7zePu24rI
         ubhVJagqs0TKrNHGXxBuBeT/TzdKweWTcJJbQ9d09EVk3Ltj/gFVuE5yElYOjBhNIvA8
         Aw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=revwXBl9aAHbzWWzTWkngt/4BFcUn4Y6B3F5VwQ0pkc=;
        b=jA2kjClo74tL8az2akm24zvJdx2mF2Qs5UN//Jsq88duisjklduPcZJQGASPO0Job4
         kaX8Yu+bideNU9dreFpeWe6m+Nd6cvBB0sW9+XUE/cEXUhEAFa/ctPzHRxdowbQUTYf6
         5PHuHSrHAE0mKxJQoQTpscq5E6S5SO6Y34BoFTexfDJXhQ/4EA64zbP+IiKix/Kn9e4F
         GOkmS9gn5MMyvk9Zlwrop/ZbiR92vrM86blC3jv/cll5Dx0L57S+p6tDaJLDdbdpGk0v
         CRdF0+zVlTDb2jNRxOtRPY/ywLe+O1vs1J9AvNFV0YvY8LRplYVgnzUsx4zC1ppUZd2k
         C6Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AebWqY1u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5-20020a05622a174500b003f390f33ef9si5286545qtk.45.2023.05.12.07.43.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 07:43:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AebWqY1u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxTxX-0006zQ-6v; Fri, 12 May 2023 10:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxW-0006xC-Bk
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:26 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxJ-0004iQ-Ql
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:26 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3078fa679a7so6634539f8f.3
 for <qemu-arm@nongnu.org>; Fri, 12 May 2023 07:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902472; x=1686494472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=revwXBl9aAHbzWWzTWkngt/4BFcUn4Y6B3F5VwQ0pkc=;
 b=AebWqY1uM8EQ5unNUediWojh8XSgR7Q+xa6neZmITkvjsoxr2i8cXx5qfFz9gvSQMi
 Xd6GHZEREsd8n2jOvNBUTFr0UhlGPvXVAeoKBFLRtA2e/jmDqTcgzviSVq60CkrJc4u6
 T6ZtWMrSwHTzFKNAr5ogQ3c64ke+Kq/chIuPD4YVQdBckgaoqzSnN+3pUBQLERSal4BH
 85WReke8FfOrmHs8xZGGUDvIVZnZWXvtXV0iFwHrAjY9Zu+j+5ihMudbF6YcGgqCf38b
 IErwnfrP9mxz73d/vmdUsw5AXR/4kHh5PuRYtR/uM7bE5B/RHQqszHpXpG/VCo/XC2/W
 BoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902472; x=1686494472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=revwXBl9aAHbzWWzTWkngt/4BFcUn4Y6B3F5VwQ0pkc=;
 b=TF6tDnnqLvu+DWBKCapp6/vGZANkSMV+EJ4boOndg7jR8o2ewCqQAmC2eCNElNC93W
 OoRIGUqPck5BOc0wDfM22/uTQlFKkG/cvKDMxshNMmRkiR299XtJQlqaP3AhRR5CfLKO
 aywjU8SzE5b1CUyAaVX6EQKn6TclyXTK8afJRFkxLhQMGIh0OlzxKfZgaWRm9HgQftye
 WBBsZH+wn1+Sax45EIXyq2wqxbs6Zslt8C2gRn+0d5ApwVwPP7M8EFPanYHx6grbTaxh
 uNp1NuD+65gqxQF8TnL/DZ3ewO3miG94YqcZO4yVX8otceCTVtpb7Gp68Hg/5sobvZx/
 RNkQ==
X-Gm-Message-State: AC+VfDzdtI4kSb4YI6oqlCAQ9MTjDCRYzdgEiPwrzd1cf1pFGD7lq86e
 mCDqrQPr8sLWDndJSS5VzMs6Vk54VKRC9B0UZ1E=
X-Received: by 2002:a5d:58f4:0:b0:306:8f5b:1b49 with SMTP id
 f20-20020a5d58f4000000b003068f5b1b49mr18647587wrd.47.1683902472114; 
 Fri, 12 May 2023 07:41:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 08/20] target/arm: Replace bitmask64 with MAKE_64BIT_MASK
Date: Fri, 12 May 2023 15:40:54 +0100
Message-Id: <20230512144106.3608981-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iGIVK650h2R8

From: Richard Henderson <richard.henderson@linaro.org>

Use the bitops.h macro rather than rolling our own here.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 3636eaadce6..ca944344a6b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4288,13 +4288,6 @@ static uint64_t bitfield_replicate(uint64_t mask, unsigned int e)
     return mask;
 }
 
-/* Return a value with the bottom len bits set (where 0 < len <= 64) */
-static inline uint64_t bitmask64(unsigned int length)
-{
-    assert(length > 0 && length <= 64);
-    return ~0ULL >> (64 - length);
-}
-
 /* Simplified variant of pseudocode DecodeBitMasks() for the case where we
  * only require the wmask. Returns false if the imms/immr/immn are a reserved
  * value (ie should cause a guest UNDEF exception), and true if they are
@@ -4350,10 +4343,10 @@ bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
     /* Create the value of one element: s+1 set bits rotated
      * by r within the element (which is e bits wide)...
      */
-    mask = bitmask64(s + 1);
+    mask = MAKE_64BIT_MASK(0, s + 1);
     if (r) {
         mask = (mask >> r) | (mask << (e - r));
-        mask &= bitmask64(e);
+        mask &= MAKE_64BIT_MASK(0, e);
     }
     /* ...then replicate the element over the whole 64 bit value */
     mask = bitfield_replicate(mask, e);
-- 
2.34.1

