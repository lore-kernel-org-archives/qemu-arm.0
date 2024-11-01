Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp660229njc;
        Fri, 1 Nov 2024 11:56:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8NsWzVjXKFuHkgriwbrc3IZqpDj/72Bbk/4t4CK0PoyGi7td1XOulZX/Dc1woAeMJRpRknv/uBahsfg==@linaro.org
X-Google-Smtp-Source: AGHT+IFNlI++S1acyeIhQxa9WM0uIU8kd43qquIsNPHoFNeFUAQ0RsR2AYjMl77tijL5KVZZQGZH
X-Received: by 2002:a05:622a:287:b0:461:1895:d9a with SMTP id d75a77b69052e-462b86869e4mr58860021cf.14.1730487386744;
        Fri, 01 Nov 2024 11:56:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730487386; cv=none;
        d=google.com; s=arc-20240605;
        b=JD5AP1c3KJ+KVrP7AFlbU/L9sP9slV3SRova6psZ4H7/CTFWddDmePD9WAey1+07b3
         Iw57uMBuGGx5fccbZln0QaFhvxiycD0xypOm4FWhw4UFDoVkisjVeVLnu0WT9SDzpxib
         DYdmRf715vjAINbpDBxmm6G6UjIWPDjMBnvGGau7FYWWxpjl58A/NWtbf6obk40qhJYt
         PtbJj0+8kMYY6gzEIJQQhFnkyInh/RYbIRLTNrgcCtC1hDi43TnJtaEWgHhZHdCVUmI6
         mSZjFI6J7D+jNfejBda5HEMwdos0D/lC2GrN5R4+OtWZDd3SiZxe60jTQXXZUyX7OxzK
         b/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=yDS9zlSiQ+PwoWX9xwv9cdCJ/JL5YOEq5jidXUjNycY=;
        fh=y40LNZs05R3i5IV6fHXzzcWaHqhYI6WuHX9dcMo1lak=;
        b=NDWCrFXHvovlBlXy3vsXg4GghEkzMoMxIrYLg96ofGXYqzLK+FBcsQiunFhfw+5mvD
         asRPBwHVwn6evZge7nPWSlYURAfo+G4js0MMq0Cu1+OW1f876FoA3gV5U8gS3/vOlC/W
         M3ehdXBZvpEXnNPUvd74wHfM/IiMJ/jY8s2MiCXWsgd6Kd46oIWzuBZUdduYlfGuS/Y5
         xaGgbOCTwSh9Wn7FPDvs+ly2SodxyfJyZ6tgodG8WKSHOxNa+8JC0UiQUkH4eudMsuQ4
         Fx2GJpuMIKu7sIfinSDigBxWkmghddOltKnfm598S9n8+QsMt92wNIq8UoFlf5qQJUca
         JZpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kg1dqlL7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad2772c6si53597071cf.685.2024.11.01.11.56.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2024 11:56:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kg1dqlL7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t6woL-0007XP-Q3; Fri, 01 Nov 2024 14:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t6woI-0007Wm-EC
 for qemu-arm@nongnu.org; Fri, 01 Nov 2024 14:55:50 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t6woF-0000ZY-Dw
 for qemu-arm@nongnu.org; Fri, 01 Nov 2024 14:55:50 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d4b0943c7so1319774f8f.1
 for <qemu-arm@nongnu.org>; Fri, 01 Nov 2024 11:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730487345; x=1731092145; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yDS9zlSiQ+PwoWX9xwv9cdCJ/JL5YOEq5jidXUjNycY=;
 b=kg1dqlL7w6b2GbwZUZOGuzBHKHiRlEdtMlCrouqdtJNifvWYG3DoLPL496FG1i6iAR
 QRfA+ANZsPwrRI+8+L5v6WcX+J/RN0ezb3xxn3/h0oWRem7Ih47OSeClM08YRUyl4gjH
 jzZK1kmC1K/3Y3Sj5x0w/a7vN9r7Vzb+Sjc8cW9F89XRS1VGNPNXhu6dNPYW93H5zjyU
 sm6nAOmdpD4WufCz1orao+7lVcgDPWdIMNVHvuDBnrEaNs0yyb1PntkcJIQCCXu7oVyW
 CdCzA/R77nKoU1pZUJxdQ4uodFi25Gm6S+i7PtfA+2FTgABHd5ZsNGodf5C3sfEE9o1/
 zKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730487345; x=1731092145;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yDS9zlSiQ+PwoWX9xwv9cdCJ/JL5YOEq5jidXUjNycY=;
 b=R2XXrqrbRj4jbKt2QAPdgeo6N2478vDyLmuVBl2E1LMD9/vdJnswAmIZlJVlZvEDIA
 u3t9b8qv+fcaFaDrrZE30m/JsQvSlVZuVXXeYh/oXQTWwjwdJfVVyt/+fVhfc6x9VKFr
 vMxxuOxz1jaV+N8anpMGuS0pbVCEtR8ie26DpZM2DBwl4uE7xNPzG/mZdX/dkSYEXpAh
 jljgY2++KDl69YJkq6T01zlyVHkzy4UuSTPXW8ZYm5bJTslIqk+d+0+0jd/qcaMk46ZK
 9fOez/6KkmUprZbtwXR/1eyVxyQC+1gUIvzdRh1kjyOBlmpnXpfi87IzJPONRTUYpxzi
 rRTw==
X-Gm-Message-State: AOJu0Ywr+YgRZXF02qxLPhhAi5wjopW65Ar1HIDaduvwLbx0giBUQXym
 XeCugVjW/xE9NtimyltfknZeIWpLkElEiYDCNnbc8PSKO41tL0dgR4Z9QEKAsTZmXfyzTTGtAyL
 Y
X-Received: by 2002:a05:6000:d85:b0:371:8319:4dbd with SMTP id
 ffacd0b85a97d-38061127842mr16292134f8f.17.1730487345321; 
 Fri, 01 Nov 2024 11:55:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c113e771sm5951292f8f.81.2024.11.01.11.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 11:55:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/arm: Fix SVE SDOT/UDOT/USDOT (4-way, indexed)
Date: Fri,  1 Nov 2024 18:55:44 +0000
Message-Id: <20241101185544.2130972-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: E4eDvi+rxIcm

Our implementation of the indexed version of SVE SDOT/UDOT/USDOT got
the calculation of the inner loop terminator wrong.  Although we
correctly account for the element size when we calculate the
terminator for the first iteration:
   intptr_t segend = MIN(16 / sizeof(TYPED), opr_sz_n);
we don't do that when we move it forward after the first inner loop
completes.  The intention is that we process the vector in 128-bit
segments, which for a 64-bit element size should mean (1, 2), (3, 4),
(5, 6), etc.  This bug meant that we would iterate (1, 2), (3, 4, 5,
6), (7, 8, 9, 10) etc and apply the wrong indexed element to some of
the operations, and also index off the end of the vector.

You don't see this bug if the vector length is small enough that we
don't need to iterate the outer loop, i.e.  if it is only 128 bits,
or if it is the 64-bit special case from AA32/AA64 AdvSIMD.  If the
vector length is 256 bits then we calculate the right results for the
elements in the vector but do index off the end of the vector. Vector
lengths greater than 256 bits see wrong answers. The instructions
that produce 32-bit results behave correctly.

Fix the recalculation of 'segend' for subsequent iterations, and
restore a version of the comment that was lost in the refactor of
commit 7020ffd656a5 that explains why we only need to clamp segend to
opr_sz_n for the first iteration, not the later ones.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2595
Fixes: 7020ffd656a5 ("target/arm: Macroize helper_gvec_{s,u}dot_idx_{b,h}")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/vec_helper.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 22ddb968817..e825d501a22 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -836,6 +836,13 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
 {                                                                         \
     intptr_t i = 0, opr_sz = simd_oprsz(desc);                            \
     intptr_t opr_sz_n = opr_sz / sizeof(TYPED);                           \
+    /*                                                                    \
+     * Special case: opr_sz == 8 from AA64/AA32 advsimd means the         \
+     * first iteration might not be a full 16 byte segment. But           \
+     * for vector lengths beyond that this must be SVE and we know        \
+     * opr_sz is a multiple of 16, so we need not clamp segend            \
+     * to opr_sz_n when we advance it at the end of the loop.             \
+     */                                                                   \
     intptr_t segend = MIN(16 / sizeof(TYPED), opr_sz_n);                  \
     intptr_t index = simd_data(desc);                                     \
     TYPED *d = vd, *a = va;                                               \
@@ -853,7 +860,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
                     n[i * 4 + 2] * m2 +                                   \
                     n[i * 4 + 3] * m3);                                   \
         } while (++i < segend);                                           \
-        segend = i + 4;                                                   \
+        segend = i + (16 / sizeof(TYPED));                                \
     } while (i < opr_sz_n);                                               \
     clear_tail(d, opr_sz, simd_maxsz(desc));                              \
 }
-- 
2.34.1

