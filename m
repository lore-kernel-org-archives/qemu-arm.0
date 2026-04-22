Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7C8F9B605
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 10:11:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFUY3-0006zU-4L; Wed, 22 Apr 2026 06:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXs-0006up-FF
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:11:00 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXp-0000n2-O6
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:11:00 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-488ad135063so45769225e9.0
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 03:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776852656; x=1777457456; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pBHHqWCNozXOcmQTxKAtN3Av+2DGbBLMiAYtHB54URk=;
 b=w0H4QA3JjLg/z7XLcQpbxljm4pT0/S3Aji7ZeW9E9JwGZtohNcz1vMcGorj2mJgYrQ
 tjEhBXoFqmWJ9RMWEWZ0cZ5qtM04PWm16k6IFo0PUa2SVASguLPt7w4/aFz6FCrBznAM
 syv1maSWn8jesMNjs720hRE+Ki99opb6sr8jn/2MlS9JSXDdKad93db90DPRZ9YTeru9
 oYcBFZC4QYzINWEhUMCNPKIHgBkm7nD+yGmItZE4GAtAYoGpAsGGaIXRtRCNoREC10sr
 4GcZCf0CUvUUCfOjl8s9rQBQPc9Agc29+Zi67LX5U3CGR0RnxmY8+UVF3TJxvR8X02Tj
 Fovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776852656; x=1777457456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pBHHqWCNozXOcmQTxKAtN3Av+2DGbBLMiAYtHB54URk=;
 b=XahSOo95QlHFaLhVxIJ2N2tbWGVvnNYbTUNd3fFal6XFbNRg9VQfiVQL06WY/YIsMB
 qNjE3hvGbRr8IBPglbVEvJFYv9163uoU8nm7VAJaE1oTgsHbfGh4f/DOzZQo0W5Z3D9D
 5okTNQ98IATrk7zmDtItt/RAKKy2v3Trxqf+QIK7frPY6ZG9uHdZ+7ufzU5cOI9l1AwF
 gzj7Qc5qPNk4GVa6pyFaRvy+nmSPbDViSRa4/pyElirkdGPAn//eO+usNr5P8i9yjF2l
 1D39MLzPVwOfZ/N8gZDN1SNz0BmsAfoCYwqq8ZVUlCEQyKgCwsIG+jnXi6S9N8tBpLMc
 kg7A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Ujk0QQuwyD5CJ5UOE1r9I8PIO+WzRVse0jiv6TDVMg0IYlFWf+KH0OnxoxjugMhOC6CCMdwmWzg==@nongnu.org
X-Gm-Message-State: AOJu0Yw4s9a02gOOuFfGy/xu2f5I45EwbhsZSND7YGOFvOQ2cNSrHhAt
 f3ARbl9oPMQBFw6ZVpXSZsctKINTsR7DzAwQCjoFcl2WJdtmHDpMAaKm7YxY4mlQZwE=
X-Gm-Gg: AeBDieuAi6+NdFIZG3u0lUoFTTwn8yqrXnEZnLWrxsMOkc8XlLGYIZphElH9i6HUYGs
 WM01u5IDX+BUxMX0knlW2hxhCKr1aTnN1DC2640zDD4GEp6qJquGKasT5rCsL6UNAWGx48KHLE2
 puTLCSXaa7RlR9fp3L59zL8yZF04VqbwZ6DUjYaLvpo8m9brdyIncASiU4dDX9EO/plw3zMFeli
 uvV/oxj0bShnDlZ4alcrWMEnsNqK+uvxdvPNZqccaa1QA9JgwVbgXRZaLa+AFMK4TGvgY1VYIa+
 tb2Ol6TF153Uzo5R7Z1eQCN1YjYdfUfAO61TiYyGRvg3uGbp4/z5yGbALGmwECFyiQwci2ZfCHf
 snlWT66AKo4kuEEEd9Ben4XJJqxhsoDU2jBgyFfhcmQ4u/SoHh6w5nRHMQo//soyb5gEr6UWRmx
 1Oj1ueU9wxzVtKOL9Ki7myLX1YdxSotJ83sQ==
X-Received: by 2002:a05:600c:45d3:b0:48a:5821:5ffc with SMTP id
 5b1f17b1804b1-48a58216a4bmr72951945e9.2.1776852655809; 
 Wed, 22 Apr 2026 03:10:55 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cc2cacsm44153425f8f.13.2026.04.22.03.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 03:10:52 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9E97E61063;
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
Subject: [PATCH v2 15/31] target/arm: migrate check_hcr_el2_trap to use
 syndrome helper
Date: Wed, 22 Apr 2026 11:10:26 +0100
Message-ID: <20260422101043.1234229-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422101043.1234229-1-alex.bennee@linaro.org>
References: <20260422101043.1234229-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

It shares the same COPROC_ISS encoding as the other CP traps although
not all the fields are used.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h       | 16 ++++++++++++++++
 target/arm/tcg/vfp_helper.c |  5 +----
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 841fd3292b8..53137394e28 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -251,6 +251,22 @@ FIELD(COPROC_ISS, OP2, 17, 3)
 FIELD(COPROC_ISS, COND, 20, 4)
 FIELD(COPROC_ISS, CV, 24, 1)
 
+static inline uint32_t syn_cp10_rt_trap(int cv, int cond, int opc1,
+                                        int crn, int rt, int isread)
+{
+    uint32_t res = syn_set_ec(0, EC_FPIDTRAP);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, COPROC_ISS, CV, cv);
+    res = FIELD_DP32(res, COPROC_ISS, COND, cond);
+    res = FIELD_DP32(res, COPROC_ISS, OP1, opc1);
+    res = FIELD_DP32(res, COPROC_ISS, CRN, crn);
+    res = FIELD_DP32(res, COPROC_ISS, RT, rt);
+    res = FIELD_DP32(res, COPROC_ISS, ISREAD, isread);
+
+    return res;
+}
+
 static inline uint32_t syn_cp14_rt_trap(int cv, int cond, int opc1, int opc2,
                                         int crn, int crm, int rt, int isread,
                                         bool is_16bit)
diff --git a/target/arm/tcg/vfp_helper.c b/target/arm/tcg/vfp_helper.c
index 45f2eb0930f..e692bc568bd 100644
--- a/target/arm/tcg/vfp_helper.c
+++ b/target/arm/tcg/vfp_helper.c
@@ -1359,10 +1359,7 @@ void HELPER(check_hcr_el2_trap)(CPUARMState *env, uint32_t rt, uint32_t reg)
         g_assert_not_reached();
     }
 
-    syndrome = ((EC_FPIDTRAP << ARM_EL_EC_SHIFT)
-                | ARM_EL_IL
-                | (1 << 24) | (0xe << 20) | (7 << 14)
-                | (reg << 10) | (rt << 5) | 1);
+    syndrome = syn_cp10_rt_trap(1, 0xe, 7, reg, rt, 1);
 
     raise_exception(env, EXCP_HYP_TRAP, syndrome, 2);
 }
-- 
2.47.3


