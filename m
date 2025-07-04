Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1338753dyc;
        Fri, 4 Jul 2025 09:56:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1XRyUHMDCD5/nnf80ANN4cWhYiJRqoGLZEnQI+nK7fOcBMxRWdv0xB6swYjPPB/hCnqdGt7hJgnTYlw==@linaro.org
X-Google-Smtp-Source: AGHT+IHJXs9gbCHQX8X42XDJWeUcwzk8Wf6F9e1NUPCFW8NMtXTgqx65SGB1+4Hje/AYCS5LE93/
X-Received: by 2002:a05:620a:6190:b0:7d4:4139:e906 with SMTP id af79cd13be357-7d5dccf4ad0mr505885885a.30.1751648211171;
        Fri, 04 Jul 2025 09:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751648211; cv=none;
        d=google.com; s=arc-20240605;
        b=aP0ukR/YCdW3w7NYfKypuKI4ajUtO1BH9WHWJF/v5J9d86F7oXrJOpL053ov7T0RcF
         urjpkV8Pc8G6ZGoRk/rhTTbENsuneP1xpJkXXuXRbieG2fQ2V2aCSaomvdiP0fJZXYO+
         kl5cQJNhWGY4bDN9KTjg4PqZNZqesG6sB/iiZQN8iRZAI+SUcU2zvl69Fhp/Zbh83FEK
         w4E1GR4E9DYzpdv7PL2MWZ7VcrXkApzgkee8ro38PIF8OZQOPpiYnZX3Ab84FEmHC7yT
         ezgihFUYg5gsahBcniKoJ34CKwW4y0V1fuAX95csARDGKbkpU8hixuZwODFexwZjHWZZ
         ls/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=3ad8SnT1cTuIC4lkjk0LMOdTFwc31GHfx2RXFXWvncE=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=T2CJi50Qd1tyN2ByuLn6s9CMnkmCB7bIC7So3PpHEMB5pWtLyEH0Es/ajW9mX1C4FJ
         lwz9pTEBFkAQqi7qzUjUoBQSsxSIgU48nCgdKVNEHr+t3pane0+7be2NZqnOmrFe6kdL
         IqLF8dhDtDXByN4ldFGD4IY9aDir58sbyEbIu048uGA3EO3e5SxTkdPC3dWCCbdqVFZk
         TxuU2FLy8YZ4qLg7j9MuzXmdiYO1Mh6TnkFWOnc6PGWlp2va+jsPIZdbn3i/UVO8lU5k
         Bqeh2Eca2ZEnFgOAKPY7rx4ogjbWrFbyoWhQnFelvq+u7ElB+r2SHxXH39kcMM10M+Te
         /VuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XBIxAfos;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-702c4d49b75si22522016d6.214.2025.07.04.09.56.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 09:56:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XBIxAfos;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXjiN-0006Yq-Hp; Fri, 04 Jul 2025 12:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXjiL-0006Yb-Su
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 12:56:41 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXjiK-0000Ey-51
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 12:56:41 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so948417f8f.2
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 09:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751648198; x=1752252998; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=3ad8SnT1cTuIC4lkjk0LMOdTFwc31GHfx2RXFXWvncE=;
 b=XBIxAfosq4oVUCK6wTvw7IMh6iD0IqXKeT0VuL4QYD8UxKJWIZMxiHmff8jL3ncdpH
 NvUxxy2s9FN6tt5ouvPfS/wsi+h+bQiETkhKQfsMknQ31rx1J0T20fjir6xdB+YjqOdh
 QRJKsda7jTTdUPNKAv9BBlIfRSsLVb4cr20d2nWCpfvJHzs/2Z5lrQnfcTDJD4ZR/vSZ
 27D+kPwHfJdYNOsb/f1XBjLQ7ZzzSZtAKsdWnpCBTlRxkoRRbr6Z6BLDPBvJo0TtXiuT
 HgVoq0fFmJsIGc6Yz8kFNDWdMp507W3h8mSmnB5apxp6CL85u7VsN+XmtJFF28nQ05yY
 Juhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751648198; x=1752252998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3ad8SnT1cTuIC4lkjk0LMOdTFwc31GHfx2RXFXWvncE=;
 b=QxiuQS6tRiNOOt5YqlI+Bb4weiH8xqf8lJdlHYlBdSXRRyGDZga1FfE4/yiBX3DNEo
 +cZXaKxWMkGI6RB56KXk8sNKfC+Jh7ogZHFh+gHeVq1g3jDjsmhvtcmB3scRG8YZ3Kd9
 PM7vNH/Bvk9h6xgwPjDES7OVWweEHsqbXSk5Ui51O7g6+x2o8OntK1t577hPNFFtVEsM
 wFvW0Y0gz48Cyp7+ltjVfIynnBb3jvO3QqawR/yZG5d16ubKDRlNZ+9Cd84Zee6MUHeb
 WA5oMlxlYv9n9LmWjHjimuA2+5hnKQhCt7j6JSQywgWPft7ted2fjQIKd3tw7FbMZoKn
 bZEA==
X-Gm-Message-State: AOJu0Yy2zUKA96pDBAe0SAvCj90/+/ex8Unhm/22e0V1ytpRrn6d224O
 LYzYH2oZcE2oShEd9clKtsW9HKdmq9V4UH8z4n7vtD1xLRaUkOooSxFVMs0LfHUH/56ckJTxVyk
 Bo/VC
X-Gm-Gg: ASbGncun8G+37Htvhz6ihip+pNEK9/khD9TbQxUG3cIN6PSdezcYEyASyCa0Innf/R+
 hz23vpNzMeNmq6eY3o3EpPiRwo1T4tUXjMOt3FZ37pl0NXE5TUkyB/uYZwbNwV5Qe+IqQKiggmd
 TqHVAq2Kcjb5471FWb3hfWnOSgDahYGNWvg0m0cyfXoWfF518WkgFkl63Zed8fE2gjSIgxUcmNe
 5fq1+Clwy1m2aLPix4cqDPp/1mcvNDy6KUwrpEFb4rMfOA10AS895S/poF+Ng6+8ZegkgQ44ZIY
 dCVZu5NFkS7R1REVfw/Yt2Cfnh5QE2ZFuxkkra6YxpBiv09mFHc19q/Z3ac3Bwz4m7iV
X-Received: by 2002:a5d:64cc:0:b0:3a4:e6e6:a026 with SMTP id
 ffacd0b85a97d-3b49703162fmr2471625f8f.28.1751648198248; 
 Fri, 04 Jul 2025 09:56:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47030ba54sm2884168f8f.8.2025.07.04.09.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 09:56:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Don't enforce NSE,NS check for EL3->EL3 returns
Date: Fri,  4 Jul 2025 17:56:36 +0100
Message-ID: <20250704165636.261888-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WDadYpLswMRQ

In the Arm ARM, rule R_TYTWB that defines illegal exception return cases
includes the case:
 If FEAT_RME is implemented, then if SCR_EL3.{NSE, NS} is {1, 0}, an
 exception return from EL3 to a lower Exception level

Our implementation of this check fails to check that the
return is to a lower exception level, so it will incorrectly fire on
EL3->EL3 exception returns.

Fix the check condition. This requires us to move it further
down in the function to a point where we know the new_el value.

Fixes: 35aa6715ddcd9 ("target/arm: Catch illegal-exception-return from EL3 with bad NSE/NS")
Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3016
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/helper-a64.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 4f618ae390e..cb02cee51b2 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -656,15 +656,6 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
         spsr &= ~PSTATE_SS;
     }
 
-    /*
-     * FEAT_RME forbids return from EL3 with an invalid security state.
-     * We don't need an explicit check for FEAT_RME here because we enforce
-     * in scr_write() that you can't set the NSE bit without it.
-     */
-    if (cur_el == 3 && (env->cp15.scr_el3 & (SCR_NS | SCR_NSE)) == SCR_NSE) {
-        goto illegal_return;
-    }
-
     new_el = el_from_spsr(spsr);
     if (new_el == -1) {
         goto illegal_return;
@@ -676,6 +667,17 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
         goto illegal_return;
     }
 
+    /*
+     * FEAT_RME forbids return from EL3 to a lower exception level
+     * with an invalid security state.
+     * We don't need an explicit check for FEAT_RME here because we enforce
+     * in scr_write() that you can't set the NSE bit without it.
+     */
+    if (cur_el == 3 && new_el < 3 &&
+        (env->cp15.scr_el3 & (SCR_NS | SCR_NSE)) == SCR_NSE) {
+        goto illegal_return;
+    }
+
     if (new_el != 0 && arm_el_is_aa64(env, new_el) != return_to_aa64) {
         /* Return to an EL which is configured for a different register width */
         goto illegal_return;
-- 
2.43.0

