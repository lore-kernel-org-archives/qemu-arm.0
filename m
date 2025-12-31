Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5586CEEB565
	for <qemu-arm@archiver.kernel.org>; Wed, 31 Dec 2025 17:09:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vazhF-0002an-JU; Wed, 31 Dec 2025 12:09:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vazhB-0002Xf-Cm
 for qemu-arm@nongnu.org; Wed, 31 Dec 2025 12:09:14 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vazh5-0000Yr-F0
 for qemu-arm@nongnu.org; Wed, 31 Dec 2025 12:09:11 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so67818515e9.3
 for <qemu-arm@nongnu.org>; Wed, 31 Dec 2025 09:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767200941; x=1767805741; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q9gRGfWHfjtxXAmgTOBvA8NGElHsA6CC6jlKP1KrJHU=;
 b=AIbkHfikit2Tz2jZ7cC0XshiFuKbP1gj8li2ZetagS0b6N5Oxri+9lurnvFyQwNODq
 iBqqk/waKooO+KCXtG/exEqg2Uu7cUpAU6sPY0GFT4vBvOEv7WlAgzoujQj10jt6UdX7
 2S2fOQhJLRZiEYVzRsIJi7HYLMrmz6B0g5oChp/qwUlSlIo7FGBeu8adMHDqOLprvGbt
 99F/YR9yq+zyEvYzg/kU7QmxusEx+n6QJZfufZPrbxNefASxjR5IK84WrRNZ4ZuJesED
 lzWvQHOTFGZgk5dfxvEifc3Rd9nlo8xb6VzA2bz680cGY+s+O2zPcDKauw4erweXyY4R
 Zzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767200941; x=1767805741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q9gRGfWHfjtxXAmgTOBvA8NGElHsA6CC6jlKP1KrJHU=;
 b=nkYov1OfrJoCLgyLC3iGxO52S5avvl4r4LnusLC4SZDwv8jTLMXb/4gMlnzdzCGbYA
 /eSo2hPNh44YEMaRy4P7Jnopiyk9xojjdBXhkHALrtOIS4Y48eJ9Kdy5q2DgDCD3Fvfo
 /5QQ+akdqA+VsGlg2dwYR+yXob7fGKvf545YeoOIJZ8C5VYFPk3T0YpTm78zjbj7J3/q
 Pn4p9OCaIhDJvze0p6HLLuUrgWj28YxKqNz6BM/3bt3X0jd5sNAMKZOjt7O3Qf243aMJ
 hNaVVdizrvs5NjKYqk4qfEkoYgKO/+xwmTpr0J/eBuIkKKMvEBI+zId6/9GZtw0ZfH3x
 5DXw==
X-Gm-Message-State: AOJu0YwlKr5pmZ9rvHEh1gxtttvF3UueD9RT5tncBt8U2Ap1oMqMaKt0
 rYV8+1ghfuciCBZkzT/QG+cIfp1OG4QaFTa7tVNJDAjpTz31gUbVIhWKtaArffMnKaAWoRW+dzK
 GtXEb
X-Gm-Gg: AY/fxX5PG0RRTy6D4ypv3yfoHbP3GoLxbbbgUzEMBQfXKo1Mn6SEV5GF61faBiDvJx2
 696j2mGrwp4IHciTj0S1KvRuBGpz3TJ6vXS9T93WszTXuV68u+OTBTnozDrk78SwZAQkrRL1Ell
 320xUqhCyUxatHKNzKe5E5ZAFcMku3ozluKwWb80ws4fDvL8Q1tq89foesD2vJYLQJD7XIhzn+t
 68UYaISVAZ2Im+yibS8dJUEMhL74MJw2p+7AviHQVTyF59TtgbfjQM+E2TMPqV6GktRHqA2PNfO
 3J3uOvL66D5yMSgdoKQ66vx6KFfPoAKIuVVP5kUA6J5yZiFdFcWNB1aoD0dMiP+xXwh4zEbaa90
 7GDQ9CSEtqiTo/wUDDe3X+P9KMk+bQOoxf51T/DLQoUSIvWUDtWlhvMVR7LEc0txyGSEGyAtA69
 s9hmzYoGyEQlCf9esEpEUchd5xjHjpBrHPlUaOsRcO4u0KU7Yi1kXxxC8dRX1as2mY/HcECEM2E
 ym8XXnVuv3NVqdCPPsB1A3dI1QHwNWH0uZCc6hQmV4Rd7JabWE7fGXF
X-Google-Smtp-Source: AGHT+IECmRubD8LCUNFDp3y5YP+oy96ChnImbpffFYz3jUA9OxD/Tvx3VADR56J43xIUN/Ndw4I98Q==
X-Received: by 2002:a05:600c:350b:b0:471:1774:3003 with SMTP id
 5b1f17b1804b1-47d1958ef07mr395042785e9.29.1767200941115; 
 Wed, 31 Dec 2025 09:09:01 -0800 (PST)
Received: from mnementh.archaic.org.uk
 (f.7.f.1.7.5.e.f.f.f.c.5.d.8.2.4.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:1d0:0:428d:5cff:fe57:1f7f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa64cesm75208990f8f.35.2025.12.31.09.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 09:09:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH 1/4] target/arm: Don't specify ID_PFR1 accessfn twice
Date: Wed, 31 Dec 2025 17:08:55 +0000
Message-ID: <20251231170858.254594-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251231170858.254594-1-peter.maydell@linaro.org>
References: <20251231170858.254594-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

In the definition of ID_PFR1 we have an ifdef block; we specify the
accessfn once in the common part of the ifdef and once in the
not-user-only part, which is redundant but harmless.

The accessfn will always return success in user-only mode (because
we won't trap to EL2), so specify it only in the not-user-only
half of the ifdef, as was probably the intention.

This is only cc'd to stable to avoid a textual conflict with
the following patch, which is a bug fix.

Cc: qemu-stable@nongnu.org
Fixes: 0f150c8499e970bd ("target/arm: Constify ID_PFR1 on user emulation")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 27ebc6f29b..ec82ea6203 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6296,7 +6296,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "ID_PFR1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_NO_RAW,
-              .accessfn = access_aa32_tid3,
 #ifdef CONFIG_USER_ONLY
               .type = ARM_CP_CONST,
               .resetvalue = GET_IDREG(isar, ID_PFR1),
-- 
2.47.3


