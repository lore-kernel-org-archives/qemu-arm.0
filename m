Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086EEF9EDC5
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 12:55:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFX56-0006AR-PA; Wed, 22 Apr 2026 08:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4n-00062H-Vj
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:10 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4l-0005Wc-1t
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:09 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so67791335e9.2
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 05:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862386; x=1777467186; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qLD556mwBZN0FOjv6jT/HPan7Y0S6BW5g1K/GkaPB6k=;
 b=igYVC1UnAeREQlFKgMkH8vv7v6oFKSl0IfrPmHFs2R9/bSFXWqWO8Y6uibCKNIVuJB
 BJikTwkXLyMBCROhchzYqgdxrqPXBi/EQzdKys3KEPlIo5ZLsRhCawLJs4Jx747vU0KQ
 vF+kf5rPJpw39rnTx+v3A3gvTHtn1dmZ+7KderIxjlvKVhyj0p2Vb5Ht0YIh91a51M4Q
 lHVsV7hk7VN2cd4RxpP2RlE1RiF9DDjTgnLLqC44r7A80LGmVSc0VBJrQJesygVjigt9
 IiPqp/FSSIvttKzUDpd1orJyOu1euRGtORj/wZR29avplP4z1DOphrojBtQkjFOjobvt
 aK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862386; x=1777467186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qLD556mwBZN0FOjv6jT/HPan7Y0S6BW5g1K/GkaPB6k=;
 b=XLdvaIUr1w6W08Ha4atf0aHIwoem4mtJ3lyTgIHQxBx6yLa+rEMZiGYxVByhHzeuBv
 6XWLfJ9cqyRWL8ujsYnb4oLvLvuQy/A/VRp8rQFPE5eIZNNuuaCwyUQA83WXLXFTEiYK
 9Vcvos9JMeARstQLUK7rfAJHyKz7YX3VAx/dzORhZ30ZsDx8I5lStrlEmgUNwjv/XDXh
 TjZNwv0gE4SEOxHbVU/CBucwyB3YmAqNw7AaeYKq0YWjSd80fGM3VvrhQ7kZszg3JotC
 hLn/13HDQppYvQay7iohRiGmlJ6xFfd4NS7rOyK/IXr/9WvJKL2RjYzwAXKMTHM4Gypf
 aMzw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+jULW6Emk+bdHpr8w9tNWq85AuaR+SIGPAqQUszKgVzGCYGv+VsyZRLvFSDHctIs9fxC7OHB/anA==@nongnu.org
X-Gm-Message-State: AOJu0Yz60aOjKsasUedsGvNUC9k+0KhCZ/O9nmysJnYAeZksE9wHrqLw
 ZoT98AqagpsH+MkIyavbsUaeBoL6er5Eq9M7Uw+zUN60/beTWKdwi4V+epqF80jTZAU=
X-Gm-Gg: AeBDietzgmCzMrK9oPe4R/LZq9AfIr4YoEv4QyznHDYqSjvTIkW50Db/XCAiFz4a6tI
 PTjh2+EmQ/S54crX+GSAGAF/5ETTRW6jquGqJjF2qtDOmsfwQYBFi56i3t3UV6w7QCgEYvRjTVp
 9q3nFQdXtsf0EZHhJoSkntTvaHeqG14KPfhl/npw1iIHk992dmoahrW6HV+o91+STJ2+OZt6+GP
 Z0lvkrGuuf+vTEiYmoQZ6gzRjVQq2C80Weg0OCsq6SLCdgdZNWdG84sONlMbwOD1CojiWyBqiAE
 tShQCn9xHfwHCqTpbevNqwWBB/LbHXS5C9ajE/+3/y7wHxqvZKlnXwkQVBkOwAUo+9EIfBc5l/Z
 yHVr2kyTgKv4qz4Hww9O1p9N5kIqh3e9VNRKMUvNdPIlu9crre7cAP82b1xN4RgCAcfabhGHQpU
 G4IMKT/q+47+QaA3dvqabL7rR8A0T8hIVj1w==
X-Received: by 2002:a05:600c:c0d5:b0:488:c683:be89 with SMTP id
 5b1f17b1804b1-488fb74dffemr247493325e9.9.1776862385550; 
 Wed, 22 Apr 2026 05:53:05 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a051dsm137846115e9.18.2026.04.22.05.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 05:53:02 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 019D060F3D;
 Wed, 22 Apr 2026 13:52:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 13/32] target/arm: migrate gcs syndromes to registerfields
Date: Wed, 22 Apr 2026 13:52:30 +0100
Message-ID: <20260422125250.1303100-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

Tweak arg names to make it clear raddr is the data address register
number.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - rename ra->raddr to document things.
---
 target/arm/syndrome.h | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 65d0de63a83..7ff8c30e2bb 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -690,21 +690,48 @@ static inline uint32_t syn_pcalignment(void)
     return res;
 }
 
+/*
+ * ISS encoding for a GCS exception
+ *
+ * Field validity depends on EXTYPE
+ */
+FIELD(GCS_ISS, IT, 0, 5)
+FIELD(GCS_ISS, RN, 5, 5) /* only for non EXLOCK exceptions */
+FIELD(GCS_ISS, RADDR, 10, 5) /* only for GCSSTR/GCSSTTR traps */
+FIELD(GCS_ISS, EXTYPE, 20, 4)
+
 static inline uint32_t syn_gcs_data_check(GCSInstructionType it, int rn)
 {
-    return ((EC_GCS << ARM_EL_EC_SHIFT) | ARM_EL_IL |
-            (GCS_ET_DataCheck << 20) | (rn << 5) | it);
+    uint32_t res = syn_set_ec(0, EC_GCS);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, GCS_ISS, EXTYPE, GCS_ET_DataCheck);
+    res = FIELD_DP32(res, GCS_ISS, RN, rn);
+    res = FIELD_DP32(res, GCS_ISS, IT, it);
+
+    return res;
 }
 
 static inline uint32_t syn_gcs_exlock(void)
 {
-    return (EC_GCS << ARM_EL_EC_SHIFT) | ARM_EL_IL | (GCS_ET_EXLOCK << 20);
+    uint32_t res = syn_set_ec(0, EC_GCS);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, GCS_ISS, EXTYPE, GCS_ET_EXLOCK);
+
+    return res;
 }
 
-static inline uint32_t syn_gcs_gcsstr(int ra, int rn)
+static inline uint32_t syn_gcs_gcsstr(int raddr, int rn)
 {
-    return ((EC_GCS << ARM_EL_EC_SHIFT) | ARM_EL_IL |
-            (GCS_ET_GCSSTR_GCSSTTR << 20) | (ra << 10) | (rn << 5));
+    uint32_t res = syn_set_ec(0, EC_GCS);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, GCS_ISS, EXTYPE, GCS_ET_GCSSTR_GCSSTTR);
+    res = FIELD_DP32(res, GCS_ISS, RADDR, raddr);
+    res = FIELD_DP32(res, GCS_ISS, RN, rn);
+
+    return res;
 }
 
 static inline uint32_t syn_serror(uint32_t extra)
-- 
2.47.3


