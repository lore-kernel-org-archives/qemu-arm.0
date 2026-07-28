Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB800C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 11:16:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wofng-0001UD-8J; Tue, 28 Jul 2026 07:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wofnb-0001Rz-5v
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 07:16:41 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wofnY-0005dR-1T
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 07:16:38 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4956242332dso32666525e9.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 04:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785237394; x=1785842194; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zHPb7VuAgcCWs/t++2jn3b0chMOiJkrQ0SLa31OCmCQ=;
 b=tiPWBj/GzcwROEkC2l/pzzFNOH1OmpaEIS4Tu4jNUS/sh8fnRXMCL/9s83fvptMPiG
 jwvIq4iPtrvJEp0tVrxYxVKLtbOiSWCBTyNOpLSlR1MD0OO3lnF7e050Iew1G8h8gOaJ
 WowN4AUnqafbwy264bHcogxskP6f0x9pVuQYmkxCN+so2vtip4CsYhgXxPE4flA9rz82
 QG3Gc42Rua6VfTH/dM0iFQDjkCRR0zQmVusxWKpD1oE8VRuSYP18vFFRrI7/zINQJgY6
 y4y84tZPjDv5bNp7Qt/DYBSWD4A5aLXwosFhRmmNwbD+mfRzxvmd5cd8NSVtkzwvH85W
 qCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785237394; x=1785842194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zHPb7VuAgcCWs/t++2jn3b0chMOiJkrQ0SLa31OCmCQ=;
 b=JbSvqWXae68kjdhJSWq0r9mhq2CdazeFXWOzufDzec3i6QUe/bkfVeq9bvuvU1e4Wu
 UCWH7DfUNXfvJooFSEYszM0wU/VI2yQ9eMCUSa7uQ9KFqm9gv3aZ//i+viuv6UEesqfr
 UN42c/QdbESIfRPKuW15elqq5w1IOuYyNORc8yKiwmq1BttRPHdarZZSaWFN8MKLSMXx
 GQgamwBwltG82rRcqUi7XaBh/j+OoTRgqvwI4MxXPVnj5HqH4+9eJ3PXFC9dam2o742h
 +r7FaoHh9XC9wBZhqbQtMQU/BTNcxuddzL3gHiJo3kfO8EnfDqi7wcKcyyJj4woX+m3B
 Ovfw==
X-Gm-Message-State: AOJu0YzQJKheWE4VibHlaQzYWc848dvWPavAM1PtYTLxIjluuQ8bo9bK
 znPV1dpTwVV2dHqg6ZePRBLuixTiD44eoQ+DhAs4Ezss90grGEnQTVpA0oDZAUAUfQFoXB1YFaP
 i63Dw
X-Gm-Gg: AR+sD104psMTLsxtr8u9dxSNU/TWOVBXn6fzYy85hHol/LUyRucXpyYEv7m4aXVhr5x
 YRIqcb+qPyIwD6v+vR+8oJV+pLfKWONVwpPvwp7uBfuIz2FiJWqmYy3EDvf8W2LKQF2q9H74j0H
 NQW5nwc1YAc19Dp1G4G/JLxFGB+EmDxUREsu04vfgLt5GIUSb0z4JXgcyv9gZIBWThr/xKnGxwU
 r96FZ2wObT0bFQKjYclKr/rCrjUPFnNeUIuVrHmbQRq2ZwZInIkTmyXjAlruCzmh94wzy50vMpy
 xd7sgatNPVt/MCFgpD9wWtA200erGmxaMWnes0tLy7Nz2apDmjwCoaAa28HzjXPgBgOsGw0GzuS
 K9VletVKGPLct2hvY/DKKtTAyfgx3W0+0i1ulLQY1pveU8jbyaUsaoMBWZhOFQOS4U31vqEhAQ9
 X89+rXQJW7ZpPRaLOoUyzb9mb2/N9yq7EPz50qGRuatqK04QVVfEbPX/muG6aReFFjS1qqiBngr
 WGNYSl7Q6a0seMbbh13LQ==
X-Received: by 2002:a05:600c:4452:b0:493:c453:6002 with SMTP id
 5b1f17b1804b1-496c65c8abemr18671625e9.35.1785237394572; 
 Tue, 28 Jul 2026 04:16:34 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957b5ed646sm284546255e9.0.2026.07.28.04.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 04:16:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for-11.1 2/3] target/arm: Make YIELD,
 WFI and WFE be NOPs on pre-v6K
Date: Tue, 28 Jul 2026 12:16:28 +0100
Message-ID: <20260728111629.1705308-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728111629.1705308-1-peter.maydell@linaro.org>
References: <20260728111629.1705308-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The YIELD, WFI and WFE instructions are in the NOP hint space, and
were only defined to actual non-NOP instructions starting in the v6K
architecture; they are also present for all M-profile architecture
versions.

We never did check the architecture version before making these
instructions have their special behaviour.  Mostly this has not been
a problem because a guest won't execute one of these insns unless it
is prepared for it to have its usual effect, and because we
implemented SEV and WFE as NOPs anyway.

Now we have implemented SEV and WFE to be more than just NOPs, it's
important that we have the same condition on the SEV as the WFE, so
that we either NOP both or else implement both.  A guest probably
won't try to use SEV/WFE on CPUs that don't implement them, but it is
valid for it to do that and rely on them both being NOPs (and so a
WFE-loop falls back to a pure busy-wait loop).

Add the "only if M profile or v6K or better" check to YIELD, WFE and
WFI.  This means that all the insns in the NOP-hint space for A32,
T32 and T16 have a correct feature check.

Fixes: 60e7ee5bb7cd ("target/arm: implements SEV/SEVL for all modes")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 6e52ad082e5..055f3c5b403 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -3235,10 +3235,14 @@ static bool trans_YIELD(DisasContext *s, arg_YIELD *a)
      * the next round-robin scheduled vCPU gets a crack.  When running in
      * MTTCG we don't generate jumps to the helper as it won't affect the
      * scheduling of other vCPUs.
+     * This is a NOP hint on older architectures.
      */
-    if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
-        gen_update_pc(s, curr_insn_len(s));
-        s->base.is_jmp = DISAS_YIELD;
+    if (arm_dc_feature(s, ARM_FEATURE_M) ||
+        arm_dc_feature(s, ARM_FEATURE_V6K)) {
+        if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
+            gen_update_pc(s, curr_insn_len(s));
+            s->base.is_jmp = DISAS_YIELD;
+        }
     }
     return true;
 }
@@ -3280,17 +3284,30 @@ static bool trans_SEVL(DisasContext *s, arg_SEV *a)
 
 static bool trans_WFE(DisasContext *s, arg_WFE *a)
 {
-    /* For WFE, halt the vCPU until an event. */
-    gen_update_pc(s, curr_insn_len(s));
-    s->base.is_jmp = DISAS_WFE;
+    /*
+     * For WFE, halt the vCPU until an event. This is a NOP
+     * hint on older architectures, with the same conditions
+     * as SEV.
+     */
+    if (arm_dc_feature(s, ARM_FEATURE_M) ||
+        arm_dc_feature(s, ARM_FEATURE_V6K)) {
+        gen_update_pc(s, curr_insn_len(s));
+        s->base.is_jmp = DISAS_WFE;
+    }
     return true;
 }
 
 static bool trans_WFI(DisasContext *s, arg_WFI *a)
 {
-    /* For WFI, halt the vCPU until an IRQ. */
-    gen_update_pc(s, curr_insn_len(s));
-    s->base.is_jmp = DISAS_WFI;
+    /*
+     * For WFI, halt the vCPU until an IRQ. This is a NOP
+     * hint on older architectures.
+     */
+    if (arm_dc_feature(s, ARM_FEATURE_M) ||
+        arm_dc_feature(s, ARM_FEATURE_V6K)) {
+        gen_update_pc(s, curr_insn_len(s));
+        s->base.is_jmp = DISAS_WFI;
+    }
     return true;
 }
 
-- 
2.43.0


