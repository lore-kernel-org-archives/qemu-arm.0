Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A76FF887E
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:27:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIFAZ-00082G-3k; Wed, 29 Apr 2026 20:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFAV-0007s4-RN
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:22:15 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFAU-0006c1-2I
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:22:15 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-82f8b60e54dso225772b3a.2
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508533; x=1778113333; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7QG3SAWZXTLSfeqfkLdTcj+WQldu34LGY3+/Bb5YVXA=;
 b=Fe9lWuytxuIqwnojX2OiNIczR7vhZbb8kM2HCWDpoBAP6qZ9PkycJZUARoNEgrX9J0
 kT82zHsjtfrsivBnADFVUydB2FP/WT4Od2JWFmQfz/QZ2bkwybLKAYJsEmytLhawd//k
 1m1LFVnq7KVRQKztNDYczqXJhF9l7424Puvon1ejjK7l6cMw3J74sx135CtgHKglT0w6
 y2j46epA/GX7XD9ZqyiVS2qjDjVpoU8+GiB4O2Uz6IZW8vew2RL3SLtkycQUj91Z+HWs
 efDuOiQlprXs7/Noan4PRmfzvG5X3X5i4/9D2SWUAN9LO913mhGmBF/UP8+qnNwICg8e
 MNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508533; x=1778113333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7QG3SAWZXTLSfeqfkLdTcj+WQldu34LGY3+/Bb5YVXA=;
 b=KIYwRpwE443asik8zcdTmT01VUSUVfi2A0gYTKsezeliocPasJ2t02DuWg9bXNGa9U
 KrNuCIiMHbk7c2Mc9CiVds9Cd35rBYbbUHRcR8wsKfsSP6ZALWvn2Xn8Mkqk2QMj3mP3
 sFLYL0dpcxS2Up/rbpivv2sAZL/UxD2O3ugRGgmBnRW8PchI66XEpuZ8XrPzP11qF8tA
 6GhhQxMqQWLGvO8s+yabE0Pl7l1hBsTb3SBpPBrfp7GZEm6zcggot6VMxqp7gl8jQI9B
 0CJ+snti3I8cv+LgQh7FnVZ4c7vCsspsnCVbDY+s4f/zLuX4KTZrWh/rbPDJncu1nW8a
 CqHQ==
X-Gm-Message-State: AOJu0Yz+aMAd3Oc/U1u2805jTKMT6D/bxc8QTZ5qe4u2rAcLS6rwmtZP
 r7zGIGbG9lf5EEGAivzcsHhPLWHC9RvKPgOFdrrqjDZftsWgte8UUrm8u91WR5alPw38AZGgoHH
 NQcuQnmQ=
X-Gm-Gg: AeBDiet9kmAsRVgZCNAdGS9TBGRzkq/7+jEjycplxmpvG7DWuZabGyxy6fFezLershs
 fhu8uIa3YwcquTTTQYMRnyQURVxvK3PWkipOCBmEnNWrF7OEPLn2xcWEXBfHgXaj2COYZAdc2c0
 Ci+QVnu68SETxSvttNYqinwJ1WlAFhSFDcqwvvzmP0nBaEhBs0urKLcGq6FxDj1FdM5xZSnnnTc
 RWpPu3KhUWhZFjkOX7WMrSu8HKUG93exulBLsg3cWMGuh5nrRfUTvin7XGI4Gs3zCtT8Rksx27C
 CdJJVHbruPWK+hU1zkwItE2E2d1uxwFZlHQvVKEDWcucyfArZT1oVrWRDGM1Ggf9Co8q/cGVzI5
 tRArKFULJpgYS/k+YPHF9POn2qH5nYZW2xpxo3RHMWQCzrbhl1iEt8vdZjXF3I47YTBxNHy9dtZ
 +snTT36z5Wq02+hoRURUFEQmX3Pv5C9TfIGr06TXnt
X-Received: by 2002:a05:6a00:1a86:b0:82f:623f:e5b3 with SMTP id
 d2e1a72fcca58-834fdbd8f0amr798455b3a.34.1777508532652; 
 Wed, 29 Apr 2026 17:22:12 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:22:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 37/47] target/arm: Enable FEAT_LUT for -cpu max
Date: Thu, 30 Apr 2026 10:20:36 +1000
Message-ID: <20260430002046.59739-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index a377f67b9c..bc866c5a67 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1263,6 +1263,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR2, BC, 1);       /* FEAT_HBC */
     t = FIELD_DP64(t, ID_AA64ISAR2, WFXT, 2);     /* FEAT_WFxT */
     t = FIELD_DP64(t, ID_AA64ISAR2, CSSC, 1);     /* FEAT_CSSC */
+    t = FIELD_DP64(t, ID_AA64ISAR2, LUT, 1);      /* FEAT_LUT */
     t = FIELD_DP64(t, ID_AA64ISAR2, ATS1A, 1);    /* FEAT_ATS1A */
     SET_IDREG(isar, ID_AA64ISAR2, t);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 44c7196d09..cf8771d541 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -101,6 +101,7 @@ the following architecture extensions:
 - FEAT_LSE (Large System Extensions)
 - FEAT_LSE2 (Large System Extensions v2)
 - FEAT_LSE128 (128-bit Atomics)
+- FEAT_LUT (Lookup table instructions with 2-bit and 4-bit indices)
 - FEAT_LVA (Large Virtual Address space)
 - FEAT_MEC (Memory Encryption Contexts)
 
-- 
2.43.0


