Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3FAF9B605
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 10:12:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFUXy-0006yc-FK; Wed, 22 Apr 2026 06:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXn-0006rG-PL
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:56 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXl-0000kV-Hm
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:55 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488ad135063so45768555e9.0
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 03:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776852651; x=1777457451; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e8D+Vwc6j20F82XkTXJvqmESw0OfURlyV19jvdfWNbI=;
 b=HrCAWMlCbWuVQpRYzU/+rAUxUHuaROzF0YzQ12QbSD++Py7GAZ/oqlVKZakrDnIRe2
 3fCTORkYQF0lsjrS3fnwdegDRnx9tM3WkDU1FAhENtSH+Yh8rChS8SAhX7p/CVUl7LH4
 zN6lw00T7GEMxaHbFeqvlagoAK8FBtJYVuEmtrJ9vg7/bpRliqAkHlo/ewPe2BuGL9A3
 +JygGPD8ujtOj0wxZHKBZVhLzKzai6NiK7Q+rPpIJ9WOMOrn7g+fgzEIQtByi2I1CsW+
 66QQHBFJmEkEB4EjEhLPnVDn/dJdf5/k4UHQfWuyoitG+JFJGdRfBBzJvJZLMsI88auH
 rMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776852651; x=1777457451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e8D+Vwc6j20F82XkTXJvqmESw0OfURlyV19jvdfWNbI=;
 b=MjloCeqp1OWWbghZvfYxwb6vZw1yTCwBSOVbSCFcTLmHIajpjbMr4wwCgXFe+NTRYv
 YuKjUPcTWeJL34gB2X5OJJhk8muKtCSqExXwKs0UCJ960OAHaj7JRjBVWE0S3o4b30Aj
 fsYX7dzeX+i7yRv3qObFOVWBxvW6qSzOOjjz4ocp2R1tvlcbdn0k3FiWHy874t1uGaV5
 YNPc9fGnnXHxa9gIWMeYUeFc8n7mubiloKwLrJS/WukKiuNfS5+aAAu6xEfKLc/OOnvc
 aGwWbkPdSSJ2lRNnRvmQJYUATQxk/P57fmzVU9eydXgGYC8JZpnatM9PnzRzXqkNv4R7
 o74A==
X-Forwarded-Encrypted: i=1;
 AFNElJ94Eh5kMY0Zh3GjiI2L+YaN+I9o2+P68iTQryxdern6gLi9uL+7QXSsOrEkRkxZemO5PLi53N+HBQ==@nongnu.org
X-Gm-Message-State: AOJu0YzznahSBY+fUAhgQbyFheIKFEiBUOGyhGSWln15yhp7vDGR5y3p
 YLTKyTzM53kKV7zz7GNEGlHDWE7T94i3MjHFy3rE7/fL06e9CFiWPjgFHN/V4luvFQI=
X-Gm-Gg: AeBDiet116OiPxSc0xtQ216e1VkPhPD5l/Lc/bD2+cdI964iarQ+WkHgz1SFQrCbxII
 rgY1ubg6bsWbYlZPD0HuyOYYnY5M/BSZn13m5695O2M+bcxrAfZpWnwPzNBkO3hkxcw/vzWE3DA
 ndK9AhJnjTEfahzOCalcmJ4ijb0BGeooG1XUGa6J/yZu2j3fo1fJnjEquNvoQoCCPvGtTFUwwuI
 t7/phk6iyrSagaRp4kuWdgsNbGQ8cSF3zSxpJfAn8EPWWfUtgnU7ChqR0i+5UmvUkiiwrk7zZlc
 y0gGjl8FthPyN19rDUuDxPKx0slR/XIY0MZ1Awlq1CV99Ss6Jc0WuvtCxZJJWb3ZEutk76SiWCW
 57UpkxmPlIqlSTMrq85aESOKdtIme03i34XTsEj5WoF9je4EEZTJbq42nOC9kNo9T/Ta+IIAxnD
 MvqGYGejeXH7+QqIHA8VXrUAsbVwULS/TBnQ==
X-Received: by 2002:a05:600c:4e4f:b0:488:ab37:b442 with SMTP id
 5b1f17b1804b1-488fb793c6bmr321958055e9.28.1776852651521; 
 Wed, 22 Apr 2026 03:10:51 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a55dc9f58sm265433565e9.6.2026.04.22.03.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 03:10:48 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 148DB60E72;
 Wed, 22 Apr 2026 11:10:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 08/31] target/arm: migrate BXJ trap syndromes to
 registerfields
Date: Wed, 22 Apr 2026 11:10:19 +0100
Message-ID: <20260422101043.1234229-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422101043.1234229-1-alex.bennee@linaro.org>
References: <20260422101043.1234229-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

This is an Armv7 specific syndrome for chips with Jazelle
functionality.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 52a6745cb23..6fcf0ac7572 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -440,10 +440,26 @@ static inline uint32_t syn_btitrap(int btype)
     return res;
 }
 
+/*
+ * ISS encoding for trapped BXJ execution
+ *
+ * This is an Armv7 encoding.
+ */
+FIELD(BXJ_ISS, RM, 0, 4)
+/* bits 4:19 are Reserved, UNK/SBZP */
+FIELD(BXJ_ISS, COND, 20, 4)
+FIELD(BXJ_ISS, CV, 24, 1)
+
 static inline uint32_t syn_bxjtrap(int cv, int cond, int rm)
 {
-    return (EC_BXJTRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL |
-        (cv << 24) | (cond << 20) | rm;
+    uint32_t res = syn_set_ec(0, EC_BXJTRAP);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, BXJ_ISS, CV, cv);
+    res = FIELD_DP32(res, BXJ_ISS, COND, cond);
+    res = FIELD_DP32(res, BXJ_ISS, RM, rm);
+
+    return res;
 }
 
 static inline uint32_t syn_gpc(int s2ptw, int ind, int gpcsc, int vncr,
-- 
2.47.3


