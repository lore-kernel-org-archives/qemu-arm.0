Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282E0C531CC
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 03:12:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wn6K0-0004u3-AG; Thu, 23 Jul 2026 23:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wn6Jw-0004ZK-TM
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 23:11:32 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wn6Jv-0000VE-C6
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 23:11:32 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-84e27035206so1444908b3a.3
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 20:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784862690; x=1785467490; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oFeXnH7MDXgLDPsf0NyTmkQzK0nNZ2yXHfQdFmWjb4I=;
 b=qyhIqvlyvMgxfoYShWvMp93g4JAW/qEImoZlNEmVqIigwC8gm5sNuMvbqDze/coyJq
 oF9MZhaBukBzTrxZPRnwP4RJ99JOII3gujwBu0XVeNAJmOWmA/AWsPz5f35/BAiFlJPQ
 kBLHFOD4jhWq6yhwHSXIPnxs+MIxfK5B7qQl9PiqBgbjDdJQEM7wKiptu1tOmooeuyVq
 04CWVPg1ddhjUGBjw5TGPirINt+sh0jK4UcPl10RE/Jon49Q1THzHRESVWqSTK+Cy9SS
 RaZ/sI6/Z2hHkoY7L9gdzn2YhqVPPguFknOsj9rVYFkNs2mE24fR2wSLeYfYSvmnvntW
 cgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784862690; x=1785467490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oFeXnH7MDXgLDPsf0NyTmkQzK0nNZ2yXHfQdFmWjb4I=;
 b=CSFkX/I7LQL+bs0NzMWUOUhzQpTgGPojvkcsIekBg6niQp8nkUHZ9IVFZjEajUSK2O
 sfHGRXYevphk3uY511Rxk99CEhISj0TfYlwsqRABc4tPyx00/k6WHDXX5n4uTXPOfp4O
 rQ1gaGs/84Ay+pukBQAZLMVDUzCBnmXCTLz5L8nPNSIq761vIchaAY2RV282fHd8bTCj
 TSkUTwMxj6ivAYw4WVRR1zxCbBZqhslkcDgLuwShF0fGG5Is13nYAW1azU2mBW5CsxG3
 Xfy2Z0T4EL+weMgq9MFxRRToN98f8sXAytT4lMsSaWxgFMTfmY0g+fcRbi7zyvmOfb0e
 jn7A==
X-Gm-Message-State: AOJu0YztRE4Rf9oB/VvBu4C5fhSTPrZEzz2zqJvZlcqQzhH1iwD7nSog
 BAb3yZTnUPhhF6XfvlTmxJFY1TZNtQxTyDSlkgnUQ5YcWd5m6Gq2tPpYAMTFFHukzncFxZNeUeS
 jorUA
X-Gm-Gg: AR+sD12s0CnOYUy1uc5e2nVUXV2UNycH2pxOkNyD1zEH0IK/qooy1nHyBMb833+uZP0
 WAcNr9ATOZ7l647NwgPgig6YDNpCqXFNnC9nwlG/uljP34YKY5HM6/1iWo2Oyc12jB2AcmwPSRJ
 grn/KoF4vKr39F85yuPPBC56e9Oo6H46pqW5AoswH8u16WnvUpOUEOanZG8TcoiPm8llQu5Eptw
 7epiIKrX/j9YkBpMkWTO8qyLSZSU2cwTSX412+rsnu/qZWofAEmf/6aYd7ydSJFMVB/Fg6ccOQw
 SRclrIfJajhIgLn2ICdrw375sl1fKdh9IBh7aO0mBDUrrjKlKqJmmNirBJycY7S6lTn+hG5gcG/
 QXbFHjVxAXUPu0Vhc3J9x9Ck/bAuplGS9djGThwTEW6EFDGGH5GPZh5bjVSkgMPegbajvdoMuvr
 uLdQhfuRydIcrWlr5l6O383mJTZ+jbctDJ9A==
X-Received: by 2002:a05:6a20:9183:b0:3c0:9c19:6591 with SMTP id
 adf61e73a8af0-3c44b2c3b52mr7096432637.75.1784862689815; 
 Thu, 23 Jul 2026 20:11:29 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbb8f0d872bsm3617697a12.7.2026.07.23.20.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 20:11:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 6/6] target/arm: Enable FEAT_IDTE3 for -cpu max
Date: Thu, 23 Jul 2026 20:11:23 -0700
Message-ID: <20260724031123.76597-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724031123.76597-1-richard.henderson@linaro.org>
References: <20260724031123.76597-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 2 +-
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index a0d8d0bac8..4d99fc87ee 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1342,7 +1342,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, NV, 2);       /* FEAT_NV2 */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
     t = FIELD_DP64(t, ID_AA64MMFR2, AT, 1);       /* FEAT_LSE2 */
-    t = FIELD_DP64(t, ID_AA64MMFR2, IDS, 1);      /* FEAT_IDST */
+    t = FIELD_DP64(t, ID_AA64MMFR2, IDS, 2);      /* FEAT_IDST, FEAT_IDTE3 */
     t = FIELD_DP64(t, ID_AA64MMFR2, FWB, 1);      /* FEAT_S2FWB */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
     t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2);      /* FEAT_BBM at level 2 */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 9528afbb18..6da07d9951 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -105,6 +105,7 @@ the following architecture extensions:
 - FEAT_HPMN0 (Setting of MDCR_EL2.HPMN to zero)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
 - FEAT_IDST (ID space trap handling)
+- FEAT_IDTE3 (Trapping ID register accesses to EL3)
 - FEAT_IESB (Implicit error synchronization event)
 - FEAT_IVIPT (The IVIPT Extension)
 - FEAT_JSCVT (JavaScript conversion instructions)
-- 
2.43.0


