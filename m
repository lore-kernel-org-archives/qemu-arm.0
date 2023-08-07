Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1516795ejb;
        Mon, 7 Aug 2023 08:06:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/pnFD53VBacak17wfh5sDSxp082jWi4aWeSEQxJPT8orI9GglMrJTcOoQLyMGOqPB9KDo
X-Received: by 2002:ac8:7c45:0:b0:410:c04:cccc with SMTP id o5-20020ac87c45000000b004100c04ccccmr4932455qtv.22.1691420801871;
        Mon, 07 Aug 2023 08:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691420801; cv=none;
        d=google.com; s=arc-20160816;
        b=BGXcjm/BTYXZnUSCOJvXF1D9Dd23YlNMYpsrNjpqpo/DYoCif1reVL+zNfwWzWqsME
         MKsSZHyAvBc24+ruxU9hDFwOv1h4x7kpdFge2cRV2psnNPbsbwEnKOrqL4dT3QQiP4V7
         FHn0jNcvY1FeY8HZNauw+RTMR9kkpTzXUDXGjQrp7epc8WtbtX1LWZAPFv5Zj2GNC0xT
         Cw6TY3lnXNhsy8PggGHCw/O76S3LDWygSYrKhaBg+sTApHwV4uFINX3zXGSlz+cVanDQ
         USFYJexIdivg6AAazzqa1SJr0TcQrFOW1xwPifHAhHM7/BhAEMTxC+TBsSlwfH6AKG2f
         GTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=I/XlbSUuVjxTo5fYM7wDmHC5xUx1Fy/nOofMufEYAZM=;
        fh=Ffq26maSnJyLRrC6ucPzuPXpXNuGP5xKQIzFwARTZVM=;
        b=t/78MtVk6xycvMJ2ktIDWuVdEr3NzaSkx4izvUR65qS8zwrXKa7nZfGzOsoEG4gtbc
         7mWZm0jPuMxMo8aI+/njFDd4orycPMqcnEcACjvI6nHwR4pqrsRBUDQdEAlFucdC8l3c
         9z88LIAFMb28Qjo4YuhnfsnqBYI/gwBPClyNIn5Bb5J3LFTnX5C/Vma+Af3Q5SuDCd0d
         /VDiUQDirISxadS56mvOyVzPg6u297BWvinpJc5C9CqRLHq29I/moOoY4rsxeOMyxAmt
         4GvgT4slYEuAswXyt2HIAcDmg9ZctATxi7Hmb7ItHCteBH/B7/atDK7gG3f5BxFnBzf6
         yJpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GjIe7gGe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020ac85b02000000b00403884d60fasi5179064qtw.505.2023.08.07.08.06.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 08:06:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GjIe7gGe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qT1oQ-0004kc-K1; Mon, 07 Aug 2023 11:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT1oO-0004kC-Tx
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 11:06:24 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT1oM-0008E4-67
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 11:06:24 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fe1e1142caso45969165e9.0
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 08:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691420780; x=1692025580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I/XlbSUuVjxTo5fYM7wDmHC5xUx1Fy/nOofMufEYAZM=;
 b=GjIe7gGerm5jZol7qI3ykm2ooiJrctFLfgZYmhzRgfklW+AlEVRbyFesQ5njAhoduX
 e+UZmELVeg+MEE2aQ4U2Y2O8FM6V3hZo+0QdbDPfsWrZD5uwNaToEe+Eb2r301psCEx5
 tiW+rQoQp3wyso7BrxkNEsZcCYGa5vkIrJLHEtU2/zOYCKuExjTzdt8ebKD91uc96GRK
 4sNgFMx/XRz1yaKD8TJnbZ6eq3DdzRPdHIgmySpKOTwQRNoqEdaYNxD0Ig8Nc+bvKZim
 sC4iE4DcRQk22cK3BU+MgNkkD1N0eNfe70TkZ0KZNr6kQHQY3gT4GQFy+jYxFHi1yGLr
 Bx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691420780; x=1692025580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I/XlbSUuVjxTo5fYM7wDmHC5xUx1Fy/nOofMufEYAZM=;
 b=lovQ3N7/wILD6LkEGFDNo0qjx7qcEJjxnM2nC0ltdPp1qf80/9wohFMrvjvtCrGXWc
 uPPhW3owXR9zz4KakXa1bME9Yd/SPhnhRFz50J8m5//e7UWPTeHaCYRjEEz6AvVKC6AQ
 wvUtWRSUYqC5zmAJrjoQzczN8q3ectcdBlhjjY/d4y9nsV2nOSvrnN07UUvTmGdOn2oW
 IYJ3Cl0cdCl6rfgsOVfRKm8l/GrRWUKYOA2Vu2/yysXYmRkQBfnuzkTXotXvgJVUXhOO
 OWc/5RzYMnJRwImY1hZ2EKCObVzbDQZj5duRwSzmQsM/Bv22zfG7KyK85jhAWNNK9tj8
 dLxw==
X-Gm-Message-State: AOJu0Yw9/hNuF50VhPug8FA1bX3yyInWRXyV/1n+Ppn0y+ogbSB/aC95
 VS2TFm65UKyuG07nM9t3KlBPjx3DJKVBfEhCbLM=
X-Received: by 2002:a7b:cb99:0:b0:3fe:5501:d284 with SMTP id
 m25-20020a7bcb99000000b003fe5501d284mr4110692wmi.11.1691420780171; 
 Mon, 07 Aug 2023 08:06:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 4-20020a05600c248400b003fbb5506e54sm10980442wms.29.2023.08.07.08.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 08:06:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH] target/arm: Catch illegal-exception-return from EL3 with bad
 NSE/NS
Date: Mon,  7 Aug 2023 16:06:18 +0100
Message-Id: <20230807150618.101357-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Oguy5o0nJdE6

The architecture requires (R_TYTWB) that an attempt to return from EL3
when SCR_EL3.{NSE,NS} are {1,0} is an illegal exception return. (This
enforces that the CPU can't ever be executing below EL3 with the
NSE,NS bits indicating an invalid security state.)

We were missing this check; add it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/helper-a64.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 1c9370f07bd..0cf56f6dc44 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -780,6 +780,15 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
         spsr &= ~PSTATE_SS;
     }
 
+    /*
+     * FEAT_RME forbids return from EL3 with an invalid security state.
+     * We don't need an explicit check for FEAT_RME here because we enforce
+     * in scr_write() that you can't set the NSE bit without it.
+     */
+    if (cur_el == 3 && (env->cp15.scr_el3 & (SCR_NS | SCR_NSE)) == SCR_NSE) {
+        goto illegal_return;
+    }
+
     new_el = el_from_spsr(spsr);
     if (new_el == -1) {
         goto illegal_return;
-- 
2.34.1

