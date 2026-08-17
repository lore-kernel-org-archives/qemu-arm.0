Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F27AC5DF7D
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 12:39:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvwc4-0003c2-Vz; Mon, 17 Aug 2026 08:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvwc3-0003aC-NR
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 08:38:47 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvwc0-0001Dq-Uv
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 08:38:47 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4954df200ddso23421625e9.0
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786970323; x=1787575123; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7nyxP8W5LjRSPbBSNMAxPKnH8NiTOVebwIwRWOdohFA=;
 b=U5O4UmboaWm57HmhJLGfa3bkAzX61iqcce2QMnV/OgE1V/mvYlVsh304IHLgMiBV4S
 +4m30U4fG7VEewPQCk1O3saoQUhl1R9SHZfieHiDPlfiTqF5neDEHLuREEXSn/rIL5I3
 CBGiPJl4SavGMXuVl9yCCcp03A6k0WB6srBbhHNTydXNJmlxFEHhdZr+rJXo6/MQ4LSG
 etZQBcX8r7cZ/avhDxMqelc4rrgtjlR9u3YcYtCzpig4siKsybwSJFOc2Y0ONK3+2mCy
 mXB899DbJmbd+M5RsVM6aQu8ehPeH03zNGnOjR5MjKL3VCar6jPSGiKIe/HN3pYot/hy
 OF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786970323; x=1787575123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7nyxP8W5LjRSPbBSNMAxPKnH8NiTOVebwIwRWOdohFA=;
 b=R6QaQ+A7rVMJGi0hQ8/hl1z0JmtaD5dTCVAcpZFBtoLALREfqMRJD5d3fYUUa0pktB
 02ItfCZddwM/jYq4Q8UhFBNz5T6OmBZxEz6SwINj/A2y9RMlK5Nl4YASqbA4JRlpCAIS
 A9e1yXOXZNCEDTXAHYqDEDx91MvTFVUJjnKnJ0yo7LKTKv3thBzPwJPsKL1OAxvmh1GC
 gFi9Tco70pzYAebMJPk6Qz7MW67/YOnDATwN8W3f62n4zQ1w0Vmo/KyFS4oV9+0u2nk2
 /51bbvVlv55XVCMyommywgzhLzxHk5Q1Iij83msRR2JZGpxyyBhLIUAmG8bwfN3p6xs/
 S15w==
X-Gm-Message-State: AOJu0YxGtv8++xh7n2fcKGYMoz0d0INvs/4QnrF1Lt3D7zuPdVYHeaB0
 k2QQrCmmTDytcY6kUE4hqQmMAHVWoMvdwnnO7qMSKDWPbChOA8Xa1xbvY82Wg0sektcU5uw/QDA
 a32Xi
X-Gm-Gg: AR+sD10uDeAmQSbxTnJEIuBFSVMw5chA4t0LfE8x+3CqX6Me5GTJ5HZJ38WWru8bqYy
 jQgUGXtHVn1Cfpu0NtqMg8YqPifECLvPf/zgdiKJikQxzl57v6H7pcdOIuf1DjyH6LefcDjWlLf
 V1LfxHUhYL8cytLW2PYCifNBD6Ef3gJMjrTW3U8pHZy8cmGWcckI8xg31HoO5ABqAvGafK2rlQz
 0befYTWiQieBrBM5YmLKZLf/n9t75N8Yx4n7ziHDCD8einREzMxPJY/6mA0nFGLYvG71ffFJrfN
 sAAm3XGbknE4Xxd6hYZNjIuRf5QQD79zxACKRSA6kY2KtkBwxLB6zbAyPivOeFIuA/zbqk4s2Lv
 cjZj9JuUB+4IItEMwFhojmGRXsoAw3cDYfaswyKm9YIlqCI3cw04akD4Pw2FswC0goolHka5RZK
 m2SsJW7vM6biP4Mzc80ZJ7V1dD8+88nFN1TthleTsCSTH1yZC2+xVXszpsnZnRG1lX8+rZxgx0a
 moDEHncgihktMewaDv2cSXKr9Z0Wc7DJ570QabP5QODbC3UaNQFnkTwTeqM9wfJhxArjw==
X-Received: by 2002:a05:600c:1395:b0:499:872b:abd4 with SMTP id
 5b1f17b1804b1-4998797684cmr344877825e9.6.1786970323416; 
 Mon, 17 Aug 2026 05:38:43 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4998780397dsm120415055e9.3.2026.08.17.05.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 05:38:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 2/8] target/arm: Handle NSACR.NSASEDIS in HCPTR accesses
Date: Mon, 17 Aug 2026 13:38:32 +0100
Message-ID: <20260817123838.1578060-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817123838.1578060-1-peter.maydell@linaro.org>
References: <20260817123838.1578060-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

In cptr_el2_read() and cptr_el2_write()  we have code that implements the
"HCPTR.{TCP10,TCP11} behave as RAO/WI from NonSecure when NSACR.cp10 is
0" behaviour.  There is a similar requirement for HCPTR.TASE: if
NSACR.NSASEDIS is 1 then CPACR.ASEDIS behaves as RAO/WI in NS.

This doesn't matter to us yet because we don't currently implement
ASEDIS or NSASEDIS. But we're about to do that, so add the handling
to cptr_el2_read() and cptr_el2_write().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c33de9c5d4..e6d269b09d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4117,11 +4117,18 @@ static void cptr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
     /*
      * For A-profile AArch32 EL3, if NSACR.CP10
      * is 0 then HCPTR.{TCP11,TCP10} ignore writes and read as 1.
+     * Similarly, if NSACR.NSASEDIS is 1 then HCPTR.TASE behaves as RAO/WI.
      */
     if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
-        !arm_is_secure(env) && !FIELD_EX32(env->cp15.nsacr, NSACR, CP10)) {
-        uint64_t mask = R_HCPTR_TCP11_MASK | R_HCPTR_TCP10_MASK;
-        value = (value & ~mask) | (env->cp15.cptr_el[2] & mask);
+        !arm_is_secure(env)) {
+        if (!FIELD_EX32(env->cp15.nsacr, NSACR, CP10)) {
+            uint64_t mask = R_HCPTR_TCP11_MASK | R_HCPTR_TCP10_MASK;
+            value = (value & ~mask) | (env->cp15.cptr_el[2] & mask);
+        }
+        if (FIELD_EX32(env->cp15.nsacr, NSACR, NSASEDIS)) {
+            uint64_t mask = R_HCPTR_TASE_MASK;
+            value = (value & ~mask) | (env->cp15.cptr_el[2] & mask);
+        }
     }
     env->cp15.cptr_el[2] = value;
 }
@@ -4131,12 +4138,18 @@ static uint64_t cptr_el2_read(CPUARMState *env, const ARMCPRegInfo *ri)
     /*
      * For A-profile AArch32 EL3, if NSACR.CP10
      * is 0 then HCPTR.{TCP11,TCP10} ignore writes and read as 1.
+     * Similarly, if NSACR.NSASEDIS is 1 then HCPTR.TASE behaves as RAO/WI.
      */
     uint64_t value = env->cp15.cptr_el[2];
 
     if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
-        !arm_is_secure(env) && !FIELD_EX32(env->cp15.nsacr, NSACR, CP10)) {
-        value |= R_HCPTR_TCP11_MASK | R_HCPTR_TCP10_MASK;
+        !arm_is_secure(env)) {
+        if (!FIELD_EX32(env->cp15.nsacr, NSACR, CP10)) {
+            value |= R_HCPTR_TCP11_MASK | R_HCPTR_TCP10_MASK;
+        }
+        if (!FIELD_EX32(env->cp15.nsacr, NSACR, NSASEDIS)) {
+            value |= R_HCPTR_TASE_MASK;
+        }
     }
     return value;
 }
-- 
2.43.0


