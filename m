Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C14D6100B
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 11:36:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlQJA-0002RW-OU; Thu, 29 Jan 2026 06:35:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlQIn-0002Cf-Sc
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 06:35:12 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlQIj-0007su-LG
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 06:35:09 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48069a48629so9137815e9.0
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 03:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769686503; x=1770291303; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mEeefLwyevAwvJbV1EeJJSkxsmhi2vz8LE44h+RFunE=;
 b=twBwvllTCvqT8H6u+7bRq2mU936RWtG0FfBInH106yHsgl8PXz0uZ5ZrNo6RW+neqP
 YIeTii+Joevj5nxT/+DeojAIwQx4tc08vj1/BCLvQru8VdcNvAkMvKmZLsVilK1M9hHw
 idpGoWBVaNR+wH67kXPVmD5E/bYhKzAGuqG4U4TfSDoGowpJK+i2ceOV2RwHXSi2LZyh
 rUo9Fl9nOASUOE5NwZBZXWdB8U4GHTsPw84MW8HAu4CqKLu2/7OgOhTlK2V0Hh7yfCum
 D2zVpw+eHOU8xvix4UQPBYPVmVCxlhypZ9Wr1c+oEO6oT20CkxZkYadMUz2F1igTFcK/
 ncag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769686503; x=1770291303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mEeefLwyevAwvJbV1EeJJSkxsmhi2vz8LE44h+RFunE=;
 b=U9KnyttB/8kJLjeM0OcSzmz0eFWMdJyXldCUJbFmJ3C3sEAseSPHlgFhkVR2VCU9Kb
 2OhZUEhun3UXQI1a4vwRWaB6Dugdfv8Cz/dVmPeJ6Lw1DMFcFlTFxXodUQnsCJXStSLN
 1FZ9ti04zBwRN57NLT1T7YRhm+ouIxG1N1pJlBQwp82xy7QWe76dJOHRovNdoLW2a817
 4WBFJMRNDH7bQeWH3XqnsLZWkZbiDsOexAivAslI3cL75muJ7UxW5/u4MOPwXBpy5oZO
 wFLWltfHyA3ZHmUw+2dmU2GkYmFjHBB1/J94rJflFUMvsJSXXdPBc5fNTgXIzi61bOEV
 G58w==
X-Gm-Message-State: AOJu0YycLH1SYJ3XtSP8sVxnR0fXoV3w0jy3EKC8hwva5e5c0EuqfpkH
 oYj0kXiVPRKRxLHkYIr9crAeModzCaKMMbum8brQhAB2RFP4BDhTgov+VBJExgqBG0WLDBJn3zn
 dPkd9hPg=
X-Gm-Gg: AZuq6aJNqF1DVe3mvtLKbPxVehqbzMOe1sZopJm4qOH7SY5UidEEBT+tUDVOwlmk/e1
 VM9w0Foq656wgp3S9Ovt0084m19arBfrnlXxxoDSsZBIXqjzzVcco1daN3BmDf7aHISk5iaeCHs
 aEDL4+y6rTg42sna4kN+R3T+D9r3t0cbaEUdqAZadYir1MLfTWJhJC3nNy+YCH6uuoLKvP8EkA9
 qfED4UaKASG0gEu8KerO+/mc74gyLUxHfz3ZI6/Z0mNDR162QR5vcbVW8aykR+9rFieg7nvy9hI
 uW6gsTaZ+gw+BRQXtlOQssFhyHCog0Biuu+oHe0gHv2tWSSwUoqsNDg5eEG+HVUNmRyDR/zDKqL
 9teCVXg4eZx5hx6YA4Ea1nz+e50/76erwKYqXV2GYPypwMcMCYt3eix6MNrmPD4t2Q1CIHuEpOq
 oXNI5nNIeMovrKWsZmxBMlK07pU+HhVA==
X-Received: by 2002:a05:600c:3e85:b0:477:a54a:acba with SMTP id
 5b1f17b1804b1-48069c557a6mr125563085e9.17.1769686502857; 
 Thu, 29 Jan 2026 03:35:02 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c42895sm196311075e9.14.2026.01.29.03.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 03:35:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v2 4/6] target/arm: Handle SME-without-SVE on change of EL
Date: Thu, 29 Jan 2026 11:34:53 +0000
Message-ID: <20260129113455.1283266-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129113455.1283266-1-peter.maydell@linaro.org>
References: <20260129113455.1283266-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

aarch64_sve_change_el() currently assumes that SME implies
SVE, and will return without doing anything if SVE is not
implemented, skipping a possible requirement to change
the vector register state because the SME vector length
has changed. Update it to handle SME also.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 732c3a9eba..655ce73ee1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10127,8 +10127,8 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
     int old_len, new_len;
     bool old_a64, new_a64, sm;
 
-    /* Nothing to do if no SVE.  */
-    if (!cpu_isar_feature(aa64_sve, cpu)) {
+    /* Nothing to do if no SVE or SME.  */
+    if (!cpu_isar_feature(aa64_sve, cpu) && !cpu_isar_feature(aa64_sme, cpu)) {
         return;
     }
 
-- 
2.43.0


