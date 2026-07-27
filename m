Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AEDC531D0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Jul 2026 15:13:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woN1R-0000eK-5F; Mon, 27 Jul 2026 11:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woN1L-0000Zz-Ka
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 11:13:37 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woN1I-0008UR-FF
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 11:13:34 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-49548aebcd8so21368635e9.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 08:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785165210; x=1785770010; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=nh/HgkqH3oSn+5/+1F0xv/JFKbtFg6HbcUBGw27b8+k=;
 b=KYCP0mFWtVCzdiqatZuVSIYlA3Mccx0Avf35TA+LHNdGjCpNjWOQT7Wyg+JqWlvajU
 cojqaAjiK5w8fZpqKWE+Ws4yvb2rFfuSraODasq4y15QMxBgHPibXw6Hhztb0Ir8f/oh
 0HvDKUFpyafVa9Pa8G2QqtIXWB5TAokGKjkRlTnIcP64gSB8JmScGxJJniV+niQWA4b5
 qTiyIiNQ5+GCGgXQvys4nSM0Gu6aaPDKvVvaSr3ACytuuRrDeS6nOAvlzGXyxXwwLEuw
 YzXxSf2ChDb1wk565c+Rr5snpz58sYg2Uy0XhhhQKxtMKsIJVwwHqD5j9T/vBVpxCOa6
 OK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785165210; x=1785770010;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nh/HgkqH3oSn+5/+1F0xv/JFKbtFg6HbcUBGw27b8+k=;
 b=njIEgxtGetFUUzgzbyX+SP28YRCFtqHcHd0mNP6xe6kqW2b+JxeKf2rPpbc+Ke+XdZ
 6gY8nbauSdYtNQHPQJusTqq2YiUSxw8VKoM7ty4cRh3CkAxXpMrhcOuH5RlDwsMYGbmB
 v4bxl7eyJA2QvXNbYU/NW4MmLaJQpSgTvWMtOwy0B0WGyVI+c5XlfIRvBqNd/Tc6oOYe
 nDv/ll2K6nEDPZtq7NH9WLh/6eozeAn7ssZriyZVhyjGTgmNQCl7jKF5PPVZ2QIu4wSR
 GRm4n8p9o+r0jJ88hP64tEwCnidPSoQ06tVmMhywyRszytPqTzJ+AbXYOSbRptvHCGHG
 /mmw==
X-Gm-Message-State: AOJu0Yz4zIfLVOa0K+A9vnidF5YJxnV8e/uuPjzpvZi8Oca5hjU39+wd
 Crk3yfZwO4RdgI29uEJeD/tkd/0si8TED0e22zt5wocoC3iQfuiTdEmy4QsLOFgVszYKI51r6Kc
 JL6d8
X-Gm-Gg: AR+sD12gU9h2qKV1VtGYYwsBGynzZcIbifD45syoso6cPgmjZc1/TLc4ooxpYx/TvTU
 3nEMw+SOualIMTK2ndJkbThwYtZQsm1zGjvc7tkfDtGzZek3Q3niiLEgZGfy6OJdWE/m8Z9IYJe
 r4OM95lteZ4JwVul8LZPK/0K8Ll+NMPbWlrOcVVyuaNBwYtyK+bXJ+Dkry4hgQ4/Umy6Z6R+QVr
 TREKis2hKCICnWo3z8ZM1xBAkm/3rHx1zRQuw8uIgsdjOd3dTurozmNJFIeeHXUqr8CPBiCfMt/
 m3ziuwRChnHRrSYPo6U8+0Qqrpc8u5+3IkuuAWjTQBkynafoLWuhSqicjSMvXTSuDZ7f+E8dF8B
 H/ajNwBqGSwLALF2e33OdCHFt90mmHdXKZLHBtjAeulP9Pg0ws3AEqiyw0kQEmhPGkDpii82tLI
 YtEr98vceqZk9R6eQn8aKw+vJGsE36IaOLAOgGkyPM6Gz7PIkIZj//p0//i70W2rQuWxdyAga55
 LEQCLzw/VShwTd3lt2hfg==
X-Received: by 2002:a05:600c:64c7:b0:495:5172:6620 with SMTP id
 5b1f17b1804b1-496b5723f69mr109561065e9.31.1785165209516; 
 Mon, 27 Jul 2026 08:13:29 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496b49a8547sm223713095e9.14.2026.07.27.08.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 08:13:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] target/arm: Don't NOP the SEV insn on v6K CPUs
Date: Mon, 27 Jul 2026 16:13:25 +0100
Message-ID: <20260727151325.1428686-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
---
Picking this one up because I think we should fix it for 11.1
and Alex is on holiday. The "WFI and WFE should have a feature
check" part we can leave for 11.2.
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


