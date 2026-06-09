Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1519CD8CAA
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 14:01:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWx04-0001Ma-UZ; Tue, 09 Jun 2026 10:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wWx03-0001Lj-La
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 10:00:15 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wWx01-0004J9-NO
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 10:00:15 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-490b4e1ade7so60319535e9.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 07:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781013612; x=1781618412; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o3gUjQjBoekYqn+srYTogM34/xvRm3EGkvpL7+jZkX4=;
 b=f7mdZF61Y/VwAvc8EnadWX9MspJPHvhfGD8KiOxskSrdsGmW70d5tzUl33gSZXmRfp
 blvjl3aWjVDNljulT4fQMxcjUwF092ryVna8MHyQDrc98uHWkal6qdEf6+ASjP/g/QLa
 cI1YpDBCLA7NHUwSkG4OaveRhabsZ/2VmxuSVzMKcbtLLVcg1Nnj/xiDLGWLv2n+D3eO
 8P3mo1OUWrT0gH9Rat3HpgSKe5FywQMidmZdvL12TUxZLXVT8UgHWWgxG2fxMEtaHfCf
 59VBZ2q80CWDOUdv8r5Z5DbbhrwmjPH1V/pALZ5DLvbVjf2zS/Ak7/I02v+xBaoET1rR
 9Egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781013612; x=1781618412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o3gUjQjBoekYqn+srYTogM34/xvRm3EGkvpL7+jZkX4=;
 b=fIpKeaQX90+OC/tRE7JHzdpYID5/7m1OlTCm1GktV3jy3RXYC232UYgnoM1x+dSHmQ
 OMXTL/ZWh2RVbu8ag7PSKvbmwCeJIZjhmyh0OfMWo1P9c/kjdTpX2/ZtoSPYd+tokgUQ
 MLS/q0QuQALMlga8tFzZZ/j5Fdy5O6kEZeODZchX4Q5/QVDeZTfdMGSLDlPVIlTcPwbi
 Nc1lmxEA605cTbgAMJ26mFoVfjsHAxfD6oz/CPUZyL8huXR/itWRZku6X6VCz2+GfPPS
 Ll+PwlMNzHclzEHFBUEZJfFI9t1TG/+MJRP6c5yCB53yONni5p5GIrnGlb7eTU5w+eiK
 6Plw==
X-Gm-Message-State: AOJu0YyqsNCChiSZsp36iSTfFsjcjpBLvwAzq5cKyj5ZcC4CmAwZ/oKF
 K0eWW+eNl3HvPhkKG92PydAr1s/uy0yd4GVS6YrRoN0q7hHrE6zjlHNgoWyXKcHPmIigPtol3Ug
 Zx9+h
X-Gm-Gg: Acq92OH+bTQM4gAc95nayp6x96+42FFjmxM9QVplE0/rA+1nN/LO0+da1HHRA+3fi5g
 h2TsTJS/w5diJUyUxcDZBIzCJjIPS1yrGU+Fff+wQiISkqzkN1pUzUiUF95YdqvUxZGRyPcXeD1
 hmNZHqWZuxgaYTqRprUlJNfE15L6mTb6BmjnuLiQcsNUEX8ALz9nHNrJdsm0PsH6Tkq/FbAOPUp
 JWivzy7USfpo9bkOZQQ7D1M6+pymK40n/lBJY6lEc6znmtvkug/sPNz8hnJ9L7NZ0VmrHkhuZeV
 UPt2al99NI+PZvsp5dgz76gWuJvW3SKtSmgqD28Vyc5Vup1moqpENOokDKv7C/1gDYicK1ZrjX4
 BKsf4q9eXNssBjwzmYsLC+EoGEDa7N/suPdrtRU4cauhNIT2a7mUQ9UvyPP3z9OU88Hb1wGNIBq
 5nQbOUAiJeAu9zHgJroQZSJoL2xxVNu9cx4w==
X-Received: by 2002:a05:600c:530d:b0:490:b92f:ef5b with SMTP id
 5b1f17b1804b1-490c25d4cfcmr366951955e9.13.1781013611758; 
 Tue, 09 Jun 2026 07:00:11 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3b5b06sm440121585e9.3.2026.06.09.07.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 07:00:09 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CF6AF5FC9A;
 Tue, 09 Jun 2026 15:00:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 4/5] target/arm: trigger timer recalc on HCR:(E2H|TGE) changes
Date: Tue,  9 Jun 2026 15:00:07 +0100
Message-ID: <20260609140008.3206970-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609140008.3206970-1-alex.bennee@linaro.org>
References: <20260609140008.3206970-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

Toggling the HCR state affects the offset calculated in
gt_phys_raw_cnt_offset so we should trigger a re-calculation on its
change.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 22f5117ee54..4e7d1178fb8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3799,6 +3799,11 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         (HCR_VM | HCR_PTW | HCR_DC | HCR_DCT | HCR_FWB | HCR_NV | HCR_NV1)) {
         tlb_flush(CPU(cpu));
     }
+#ifndef CONFIG_USER_ONLY
+    if ((env->cp15.hcr_el2 ^ value) & (HCR_E2H | HCR_TGE)) {
+        gt_recalc_timer(cpu, GTIMER_PHYS);
+    }
+#endif
     env->cp15.hcr_el2 = value;
 
     /*
-- 
2.47.3


