Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFCAC531F9
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 11:17:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wofnd-0001Sa-IH; Tue, 28 Jul 2026 07:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wofnY-0001Qx-6o
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 07:16:36 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wofnW-0005d2-44
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 07:16:35 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4955aa106b1so35647005e9.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 04:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785237393; x=1785842193; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=q3WsPh2NxmXXCCvxcEgCl7mukhp33wShyS/kmhXfLk8=;
 b=hLAUcRrzWUwJqtl9CGLFWSx0fyUWFX9q9/O/+97c5w5fpEMEdT8/YW9hkGYHEEEm2n
 bB6dswnEP3nDxVqRWupdfzsduWg3IzuhygJ7D85qsExRgYCHLVFjft7GXVEL7Tndib+d
 RW3MDYDJtf0F6vh7lfsEr6SvtTiPsiQk3PChl2niruJPInnuzek4yWwVVxtu6G6dyl+4
 N2ijMyoH+LxhacvdoirqGuhO4k7l80ub/hhgfVjooNrsgKQ2lKIc6Htv+2NdiWmvHgoj
 U0RWFin2SsNG2cTytyJDIevX6imR7BRutCEscWN2Es8nU82Tr26Gw+QK4rbUJud6yC0h
 Iukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785237393; x=1785842193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=q3WsPh2NxmXXCCvxcEgCl7mukhp33wShyS/kmhXfLk8=;
 b=fFVyNAEEcfnRjtQluBbnvpQ7j+DKiGvXDm8DEot0M+JJye+XSlaUPOqdV0oGfqgdfd
 YZHEc7j1I6wVNhR9ISZthI1DEXomCh/3TYwAnoCWFsIHY74JFgzP2sW2N1y49zKWSkBb
 jEd2XCxlv6MYzUQ0l0YyVIhB49RSpOh3H5jeCS+1ewsAyuv69AdkuDzuWcS3OWnbbuZ5
 2gPegkBJOGLjVjYZzVN0zt4bXhyhS8VwMq4UpNVBvc7U0I+nmKggZWwh62T/THdoBKnK
 e00I7IBLYK2nuKSVbmvWST0rYt4OwEGN67nAzMVqOlStx054w0kUpS7e49j71AKSHC9P
 lMnA==
X-Gm-Message-State: AOJu0YwwM9g7Ztq686Px+18WEW612Yo3pVlIZCCtBOyDG7M2yQ2E5edz
 BpUaot+7VCgkijQxe2uNoRIAqC6wgYEoGOOwrB+vc1/ydVis6T7BscuL3eiZHcsTPgzUHpxph6f
 +yolP
X-Gm-Gg: AR+sD11irJ0gqlh3oFNoSYzRGREG6vO2HhufojtEwc1S9cgtRZ3PY9LH/0p5uB17sZB
 MGe9HpzDvnEb9BVl9o19pAXCuEwfu2I7qUrbVlJ4m+9mb3SeASdt5JvmzQiUqyYxrbsdXVVrFFw
 crh3m0Uld7xykAR6P6Vof0CDWRv77uUPr0SEhBU1hiGC2RTn1YndE6mz8atx9Nl/qzAB4YAXse0
 wX0JOGNvmakOA/ahS+KX1zbMKPnBFUsMK8z3GdGg21WC7D4xHpkz4+QGWXJMWl0EDJfZG35Y6g0
 X+sRlQgEoyM/M4UsJ2azFcd9ok2bcVZtr1CZX4gWKkqWkDvSSAGWqpM3QAuYGeui0tv2cHRWppI
 jCDrfQxcRKqLnpfGZMgjvlR7ycZ6qJDorWbW01v2D9QVGeNxB8Q0UJB6738jeY2fpkKyo8SDKu1
 VUGKbmc/9yUUGMd88Wd3ycixntWBkGQ6A+LiFa+2/2aZujYVcC7FiI3CPVaymPV3gNzd0BQUI27
 ZoYBF4rrZg=
X-Received: by 2002:a05:600c:37c9:b0:495:5062:17f9 with SMTP id
 5b1f17b1804b1-496c6586ef5mr20756615e9.30.1785237392654; 
 Tue, 28 Jul 2026 04:16:32 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957b5ed646sm284546255e9.0.2026.07.28.04.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 04:16:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for-11.1 1/3] target/arm: Don't NOP the SEV insn on v6K CPUs
Date: Tue, 28 Jul 2026 12:16:27 +0100
Message-ID: <20260728111629.1705308-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728111629.1705308-1-peter.maydell@linaro.org>
References: <20260728111629.1705308-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

When we implememented SEV to do something on A-profile rather than
being a nop, we got the condition slightly wrong, and made it only
effective from v7.  In fact the instruction's Arm encoding has
non-NOP behaviour from ARMv6K.

The effect is that a kernel boot may hang on a v6K CPU like the
ARM11MPCore.

(This wouldn't have been so noticeable if we feature checked the WFE
instruction, and had made the same mistake for the condition on both
instructions.  But we never have done the feature checks that we
ought on WFE, so the mistake on SEV meant that we showed the 11mpcore
guest a WFE that did something and a SEV that was a NOP.)

The v7A Arm ARM is not entirely clear about whether v6K has the Thumb
SEV encoding or not: it says "ARMv7 (executes as NOP in ARMv6T2)",
leaving v6K not stated.  The 11MPCore TRM says it has at least WFI in
both Arm and Thumb, and the v7A Arm ARM uses the same condition text
for WFI, so I make the assumption that WFI, WFE, and SEV all get
their functionality for both Thumb and Arm in v6K.  It's possible
that this differed between v6K CPUs -- the 1176 TRM says it has the
v6K STREXD/STREXH/STREXB etc, but the WFI is the old-style cp15 one.

Keeping the condition check the same for both Thumb and Arm encodings
is the conservative choice: if guests try to execute the Thumb SEV
insn it will be because they want SEV, not because they want a NOP.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4044
Fixes: 60e7ee5bb7cd ("target/arm: implements SEV/SEVL for all modes")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index a1fc0506188..6e52ad082e5 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -3246,12 +3246,19 @@ static bool trans_YIELD(DisasContext *s, arg_YIELD *a)
 static bool trans_SEV(DisasContext *s, arg_SEV *a)
 {
     /*
-     * SEV is a NOP for user-mode emulation. For v6T2 and earlier
-     * non-M-profile cores this encoding is a NOP hint.
+     * SEV is a NOP for user-mode emulation. The instruction is
+     * also a NOP hint on cores that pre-date the architectural
+     * feature that adds it:
+     * - M-profile always has SEV
+     * - for A/R profile, it exists from v6K onward
+     * The v7A Arm ARM is not entirely clear about whether v6K has the
+     * Thumb SEV or not; we make the condition the same, to be
+     * conservative. (If guests try to execute the Thumb SEV insn it
+     * will be because they want SEV, not because they want a NOP.)
      */
 #ifndef CONFIG_USER_ONLY
     if (arm_dc_feature(s, ARM_FEATURE_M) ||
-        arm_dc_feature(s, ARM_FEATURE_V7)) {
+        arm_dc_feature(s, ARM_FEATURE_V6K)) {
         gen_helper_sev(tcg_env);
     }
 #endif
-- 
2.43.0


