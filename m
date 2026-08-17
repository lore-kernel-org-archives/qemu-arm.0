Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7CAC5DF66
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 12:40:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvwc8-0003dx-Lz; Mon, 17 Aug 2026 08:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvwc4-0003br-TW
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 08:38:48 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvwc2-0001EB-Uf
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 08:38:48 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so27142635e9.0
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 05:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786970325; x=1787575125; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pPR73r8fbc097o/ifcA0fRrDVQnEsv2YdDAm1DiZw6o=;
 b=QWnTwGNt714daF8AKFz043iaCXJAai9SPMARmF6ZRsvif2mQ0fKScwFYBUli6FLDVD
 OH6v6ooYKXcWAi1D009W3/l9KIwmBgm3CcGrVqdCwJnEyyCJD+1NZs/bBPXQD0SXjL37
 ON8YSDhBPXp7TN2V4BsufV+7hlYyflEglJ91ISW0mLwHc/rjk4xSgUDpmUhUIqTDILdP
 Pvt93ikvMb3l9QNGHEx6VoQ5tDEdrc35YipOzKQAjtic2WUShwUAI/JtLU/cEhHH5EqQ
 fDHY1hRvyeUbiysxq2L4kf0FKq3gP4Qd7jiwYhgRk2Croqxm6U+flwRnBBGvv1rARrRQ
 C6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786970325; x=1787575125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pPR73r8fbc097o/ifcA0fRrDVQnEsv2YdDAm1DiZw6o=;
 b=BWR8E+DpDUx78c1aCd5FGn75uFirDlKIziSm11KeYgfaBhix4OBeaa30ytoliZ7pvU
 5GyrN5jABQNymxVP1rLhcN+wJmNraEkxQmdhFLQw50N9uoXgWZfkkD6RNndWFobsRwDu
 yL/8EK/224HRg9ctMs/gicUpUg8z7VL2gsLBGf2vY/G8efoUnmp2XGoKR17O5+0tVuhF
 g1I4sRnhvnXhHpZ/LNDlII4M15h+mkS0153X/JU2hDpV/V8ZUESc7Yfp0qeBFOtZiq9z
 t81792srF9W67EbOgKafBTyjnBV+Q2N0q55cdCuRhJ4dm+oVlCEaK4mIzbxhqQG2/Gq2
 Ptuw==
X-Gm-Message-State: AOJu0YxI59LlUFYFJMswVFqsSH7NYKMEAgXBV22S8lnWcQK9HJylbKWi
 yCtELYJDQVwqSU/0R/UQb8h0qhmpt0SeEOJpg1l0P4tk12Uc1lSZWGuRkIXQyLx/kliaN13aPOt
 bCobn
X-Gm-Gg: AR+sD12Ib0sh1C+bRZiZwBHVp5u9iC4lt5maexMLdxl8aIjwFb5/M+kMmFpUuWo8V1H
 IzN+U3LWuVzhV2cQMlhWrGWM5TugqizCITupvSjMttgWLPVcXY6p40YphybFXeN8ZClEh0AvuQV
 VstRzPaU9AQkpr1NHq1YnNbSnU+6W5Qy5fZuOCO4lhJF3BhlEsGMRwOT9UJhmEoeUkvve3m0EjL
 oCUibCK2ieyXEX+ILEF6giA/owFeO2ihdQmklTDizxX+q5KtesLfohT9yE4DZAYnbNllPreKm0g
 mHyHSVfEEfVT5/+PKEIEEGP9KAX+DX5OiOqYwEaskPDPbjMyyKtMxVLNIMc35OQOC2Uikm1JBqN
 OmagQZE2JalBTgyzRd3KldgkX2xCuKeJhhhB0XfIo+mtP+wERXNlW7xtEGLGZTZ40rfI2vEgZeS
 Z6+AYnIKRZ/8fayKQekoB7Cmwlg7vmysF+upt45+UJIx/Syw32TtMMGJhq5Za/rJhRKBSBu3WK6
 80BHRDl25XschOWxW7FqdSie62j0Up0/afy+WaD05CPL4QR78r086glfjp6Z+xHXMnMFw==
X-Received: by 2002:a05:600c:354b:b0:499:841c:2016 with SMTP id
 5b1f17b1804b1-499878d1021mr326769615e9.0.1786970325306; 
 Mon, 17 Aug 2026 05:38:45 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4998780397dsm120415055e9.3.2026.08.17.05.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 05:38:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 3/8] target/arm: Update confusing comment in cpacr_write()
Date: Mon, 17 Aug 2026 13:38:33 +0100
Message-ID: <20260817123838.1578060-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817123838.1578060-1-peter.maydell@linaro.org>
References: <20260817123838.1578060-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

In cpacr_write() a comment says "In ARMv8 most bits of CPACR_EL1 are
RES0", and the mask value is left at 0, implying that we enforce
those RES0 bits.  In fact we only enforce RES0 when ARM_FEATURE_V8 is
not implemented, and for v8 and up we allow the guest to write any
bits.  The addition of architectural features in v8 and v9 has also
resulted in the addition of new bits to CPACR_EL1, so "most bits are
RES0" isn't really true any more.

Update the comment to be a bit clearer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e6d269b09d..91b872dc77 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -554,7 +554,17 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     uint32_t mask = 0;
 
-    /* In ARMv8 most bits of CPACR_EL1 are RES0. */
+    /*
+     * The AArch64 view of CPACR_EL1 has a different layout to the old
+     * AArch32 one. We also need to permit the old AArch32 bits to be
+     * read and written so that an AArch64 EL2 hypervisor can set up
+     * the register for an AArch32 EL1 guest.  So we choose not to
+     * enforce any RAZ/WI or RAO/WI bits for v8 based on feature
+     * presence/absence.
+     *
+     * For v7 the situation is a bit simpler and there we do choose to
+     * enforce RAZ/WI and RAO/WI.
+     */
     if (!arm_feature(env, ARM_FEATURE_V8)) {
         /*
          * ARMv7 defines bits for unimplemented coprocessors as RAZ/WI.
-- 
2.43.0


