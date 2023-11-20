Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2239430ejb;
        Mon, 20 Nov 2023 07:01:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSFmjaefVjj5X3ANeL1gZdPwFMMA+W8HSEZ+8ru8pg4K+7DUHaabNK3Gbz9YsKCRxe5W7v
X-Received: by 2002:ac8:5dd4:0:b0:41c:e92a:c604 with SMTP id e20-20020ac85dd4000000b0041ce92ac604mr10344766qtx.59.1700492504716;
        Mon, 20 Nov 2023 07:01:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700492504; cv=none;
        d=google.com; s=arc-20160816;
        b=gCpvASKZsyJgMHbqaxArQ6U2kYGGTWOvKjEdXv15LW7LSSO+oSASwVPEWyv/v53SRO
         wxNuJTFOakdgyD9zfcR3dxTqHulZQIAhTDUmZVnu2iDCZ0hE7GzhmR+6NwnX6Z5VfbLh
         5GU6nySpGzfMwO1c12vZjmGeGu31SdFoK+89v8X8T4RjYUXqgVBa/P3YRKN9/05tihxi
         5e5fU1KPBTdPlArLSr4gOdSzk7nvyG6AJe9j30BNIwJpTVaT+7UnlG+aGJBkwxuA9r2f
         YCv9Y18NxtZVZq5em/EDv5+WDErc9VgWi/K+Kien53jIg+hPPqMZCfsN6HuTTXXs+63L
         n49w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=AonQASN02H39ayyy5tLjqfhpjijh85lAG7GVs3CstAI=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=jmtLodLoPLg8ehJRRy3l9muBIg8R5d/PLd7MvXKm/d+AgGkXxVyK+TAm0O3l4A0Z8N
         i7/kkTSwh9hGREsByWs/lfq1dVmUSNwU57Cdx+BVq267I1bv1lf8UrBDwNMnt7CI95hO
         r3bd8Pk0/3k2aWDq9qo4uGkDfyimNvlS+4YmVe6rF3//qd2SNs6DhjSOgZfm/fxFHZiQ
         kfwBKNlkPeqA7Fg5GFu5W2Iy1ewr/2hhAxovNwkm2a81fry6e1bY88lvTRz+qvrkuCBg
         Tp0vGE0vCQA/sbbhF9uI3jPqXZZT6P2Rq1VxW7DwJ9jc9x+9iy9mN7qvzgqVOIVJ4Ae/
         Lhmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f8iVlsAT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9-20020ac85889000000b004134681883esi7728876qta.601.2023.11.20.07.01.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 07:01:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f8iVlsAT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r55mG-00017R-2F; Mon, 20 Nov 2023 10:01:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r55mE-000177-37
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 10:01:31 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r55mA-00050l-Tr
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 10:01:29 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4084095722aso19082475e9.1
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 07:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700492484; x=1701097284; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AonQASN02H39ayyy5tLjqfhpjijh85lAG7GVs3CstAI=;
 b=f8iVlsATKwJcXwoFP7N2FuL78jOrG2XjSJjd5p5P3PRlfiX5+dCbiIm2CgXAh3tMpo
 SYaXELRWrrZuFdHKakP6GVd/1xSqausvSkgxbNQKgObB1ppfhi6pnqh8sfvI8VHp/EHW
 4u0H3eEDmMJ8SLSUCyhZ5UGlHe8hqKep/P+dYvEZiID7osV7AOQveP284rprsvdFiLQa
 guRMxPCqDlpS85uILIwoc4w++ugDR/E3dZ5biLf2huBpvkAmDQ9RcrhWaZjl4E5mzCJU
 oLXkHyNTBgYcP1MIHl0LqKAP5Xl55YWkT+7uD2JckAIkjwRe8LswN/5YzItINm9Lp7fb
 Uatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700492484; x=1701097284;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AonQASN02H39ayyy5tLjqfhpjijh85lAG7GVs3CstAI=;
 b=AvFgUuyDKTXJsin3PPdZfr/ZQ/AXtIY/NS9vPbFPjBXxUdYviOmeDjeNm1J1iIx0Dc
 Pm+q1lQs3JCKYFsiXgq6uXH6AF2SbOQZMAJviF+c0I/XKMFxYMjFktoDHyohWMH0FZyN
 mIJeFClw9nyMyGDrt/+F+WQNwfnJtv5J++0L1ga0bb27KH9P176pVqIu6zQWtJc8bU3H
 kr2NRMha/04y8HihQMhowYpaLgWwhMiXodXvHzLycrEyn54igYRSGgb6hvXiMY+/0l1U
 Gk+MAAyMHGSWLaV0iZUZ5f2BqR3QWaozilbdLUONkYJB5a2mQMGgepKQDokWGMy81Vbf
 FcDw==
X-Gm-Message-State: AOJu0YxzMWDW8EyqQKU4BgDX/J0znEmEN8sp0JqfUZI1eL5PIVSUiqdG
 NTSZXSeu7wQHAviuOZ4jW0N9TYx+WsVgAJNU+yM=
X-Received: by 2002:a5d:5cd1:0:b0:32d:9df1:6f68 with SMTP id
 cg17-20020a5d5cd1000000b0032d9df16f68mr4646025wrb.22.1700492482801; 
 Mon, 20 Nov 2023 07:01:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a5d6404000000b0032fc5f5abafsm11389045wru.96.2023.11.20.07.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 07:01:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH for-8.2] target/arm: Set IL bit for pauth, SVE access,
 BTI trap syndromes
Date: Mon, 20 Nov 2023 15:01:21 +0000
Message-Id: <20231120150121.3458408-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: 1Wbyng6WPGiH

The syndrome register value always has an IL field at bit 25, which
is 0 for a trap on a 16 bit instruction, and 1 for a trap on a 32
bit instruction (or for exceptions which aren't traps on a known
instruction, like PC alignment faults). This means that our
syn_*() functions should always either take an is_16bit argument to
determine whether to set the IL bit, or else unconditionally set it.

We missed setting the IL bit for the syndrome for three kinds of trap:
 * an SVE access exception
 * a pointer authentication check failure
 * a BTI (branch target identification) check failure

All of these traps are AArch64 only, and so the instruction causing
the trap is always 64 bit. This means we can unconditionally set
the IL bit in the syn_*() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-stable@nongnu.org
---
 target/arm/syndrome.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 5d34755508d..95454b5b3bb 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -216,7 +216,7 @@ static inline uint32_t syn_simd_access_trap(int cv, int cond, bool is_16bit)
 
 static inline uint32_t syn_sve_access_trap(void)
 {
-    return EC_SVEACCESSTRAP << ARM_EL_EC_SHIFT;
+    return (EC_SVEACCESSTRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL;
 }
 
 /*
@@ -242,12 +242,12 @@ static inline uint32_t syn_pacfail(bool data, int keynumber)
 
 static inline uint32_t syn_pactrap(void)
 {
-    return EC_PACTRAP << ARM_EL_EC_SHIFT;
+    return (EC_PACTRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL;
 }
 
 static inline uint32_t syn_btitrap(int btype)
 {
-    return (EC_BTITRAP << ARM_EL_EC_SHIFT) | btype;
+    return (EC_BTITRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL | btype;
 }
 
 static inline uint32_t syn_bxjtrap(int cv, int cond, int rm)
-- 
2.34.1

