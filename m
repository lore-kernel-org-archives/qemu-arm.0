Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F477FF885D
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:57:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzpa-0008Qv-GR; Sun, 26 Apr 2026 09:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzoW-00066d-7A
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:25 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzoS-0001cR-4n
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:23 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2b23fcf90b2so89130885ad.3
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211176; x=1777815976; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E68MlP8AFu1JnQ5NZvgz4n4HRq16kR6Xd0W1VdqzuFg=;
 b=OTvXIRMbNF4qAD2e6iwjKwz7O/mQha7b919stHmBeosIkmV5Ga8MjEG8NBqqFLOuBN
 3nUrSfRXGFr7YGWdH+ZNrhAdP1M58C5yYG5TWeRiyK6C5SVDc1d/rGsiiVuJZgw9DSjI
 IJinOry+HFYkciZllcbBcZ+vE+OcjtZHDHIuXci2Z0PQgTcTXWzFLCnGJ90n4jwFN41c
 LxvtLLHSBADP7wH5ESjBgqizP1/m1tvdN7hjik8cPaVTmHwOOWTY9rK+XrewClJb2G1j
 kETknHIxJ7IwgnyZPiuovw9JS5gLF94Ucyl96sCp4eodiaW7lcoUo8+pj219jxLRXGEe
 ESQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211176; x=1777815976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=E68MlP8AFu1JnQ5NZvgz4n4HRq16kR6Xd0W1VdqzuFg=;
 b=tTWDFaCgVywgT9d9NA2OijgUiIlvUroyt7DeZiJaOCSQPkVbANGK3wafO0bz3k0iAJ
 LShjnb1Hy1Oywxp+ueXJkz6ZQUKY3WhRDIbRWDWIUQwsvbN8uyEVHMlffPW5tk7dHL7m
 gweOsP+xcbb12Lef97uziXPmeTjo46h5fXTyBHpRATvZVjHFpgNi4YIddTwzfhk5Fz9z
 9ebngDWildOFTUCjT82xRjUxAyoij+2MkVVOBVJuqK7Hua2YfMhST0trjf3H6MpEBX7S
 QQnAyi3YL/g4FCOkNW8/e7+P8mJWUQS7D5sChpnbyBn3wwpR9NcevmQp8e+/vWxHVQKk
 RtSg==
X-Gm-Message-State: AOJu0YwBjEquRzsZcx466qJGr6PTetX5IRsESFFAepnVN1f9NjnPxAsg
 Js8PBYKTtGjvXF2RD+oUNK5Pc/KRGH2xHAP4iSNV9oXPqth6KV7ovPA37oaw6ZBpk+aH+O7j3qF
 lnl8PfHo=
X-Gm-Gg: AeBDieuQrRptkOEa/zmhFOXYwMlPmd8NW45YL4FhaFQ98JNClt+Bmdafd7iei2Wn10w
 rVfZam4HvHemm/L0fX6lmG+i3dxF32qvcm6AFvFKArFVCIfr44/MlSM9rIBlFXf+GAUH2BJM6JW
 Ui3ogSO9dG7UOPVp+Y8mhMNMtGKCm/TG39FJde3srTHN7lPoJJuP6oVf5ko7UzzYXyXzn3L5MZb
 fi3TcR260W2xDCisz3IuSwCSixj4IqUVqyfmFWBR9grgppjHF/l+HdbwyQVk5ZMIuvj4tPSrA9E
 nhFMKZ4LsQivVh400o0vzZawzQb22Q41wlqNWPVIQaqC013j2TUYthIpV+FFcyNXqbQKtttfXyq
 G/Aad2fjO5lCVZpZlupyq65R1gcR5ehrW7ho/bUjL+3qEdg3x57LUdOoYIEAiSpg0Cx9MekCm4x
 RvT3Ttk8XR86fcIjeZg+oXnB3sLQ71eI5y15Tk+svA
X-Received: by 2002:a17:902:e54e:b0:2ae:ce35:2686 with SMTP id
 d9443c01a7336-2b5f9e64c77mr394101345ad.5.1777211176195; 
 Sun, 26 Apr 2026 06:46:16 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:46:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 69/84] fpu: Introduce parts64_round_canonical
Date: Sun, 26 Apr 2026 23:39:46 +1000
Message-ID: <20260426134002.865628-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-parts.h |  7 +++++++
 fpu/softfloat.c               | 19 ++++++++++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/include/fpu/softfloat-parts.h b/include/fpu/softfloat-parts.h
index 9f7ee34d6a..eb76b47934 100644
--- a/include/fpu/softfloat-parts.h
+++ b/include/fpu/softfloat-parts.h
@@ -175,4 +175,11 @@ FloatParts64 parts64_pick_nan(const FloatParts64 *, const FloatParts64 *,
 FloatParts128 parts128_pick_nan(const FloatParts128 *, const FloatParts128 *,
                                 float_status *);
 
+/*
+ * Operations
+ */
+
+void parts64_round_canonical(FloatParts64 *p, float_status *s,
+                             const FloatFmt *fmt);
+
 #endif
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index e42782c656..0c931842c3 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1396,6 +1396,21 @@ float64 float64_round_pack_canonical(FloatParts64 *p, float_status *s)
     return pack_raw64(p, &float64_params);
 }
 
+/*
+ * Round to Fmt while remaining canonicalized.
+ */
+void parts64_round_canonical(FloatParts64 *p, float_status *s,
+                             const FloatFmt *fmt)
+{
+    parts64_uncanon(p, s, fmt, false);
+    /*
+     * We normally expect uncanon to be followed by pack_raw,
+     * so we don't actually crop the bits.  Do so now.
+     */
+    p->frac &= MAKE_64BIT_MASK(0, fmt->frac_size);
+    parts64_canonicalize(p, s, fmt);
+}
+
 static float64 float64r32_pack_raw(FloatParts64 *p)
 {
     /*
@@ -5175,10 +5190,8 @@ static void parts_s390_divide_to_integer(FloatParts64 *a, FloatParts64 *b,
         /* Round remainder to the target format */
         *r = *r_precise;
         status->float_exception_flags = 0;
-        parts64_uncanon(r, status, fmt, false);
+        parts64_round_canonical(r, status, fmt);
         r_flags = status->float_exception_flags;
-        r->frac &= (1ULL << fmt->frac_size) - 1;
-        parts64_canonicalize(r, status, fmt);
 
         /* POp table "Results: DIVIDE TO INTEGER (Part 2 of 2)" */
         if (is_q_smallish) {
-- 
2.43.0


