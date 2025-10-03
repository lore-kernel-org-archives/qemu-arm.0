Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A27CAC5B0
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:22:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jLk-0007mg-Uo; Fri, 03 Oct 2025 13:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jKP-00057k-My
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:12:26 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jJt-0007g0-Kp
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:12:20 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-7800ff158d5so2382212b3a.1
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511497; x=1760116297; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vginp/BWCazHuQzqIb8BXHBvPZrCFhK+/22L3/T0m/s=;
 b=Ot72X9WKFKRpKJihoWqYIB4t0XUSxwdwmI2/70k8ZMCQqKeVh6UExexkKOoq8XvimG
 j7bSNKflBw2ku/hauvKwjJDOnY99EGqqMwQ6Ba0Gi+l5wZ6eABR74g9KB45d6gVtkD6I
 YHbg6KGyjCiUe8OW2pzgOVfTR5yN3lTQX07LVQnKXvCOhKeC1Ext7w5OBF6fKe6jtrIT
 Z8e/odh7aheO5hd6tVKEGPzyUdR1h3we6VPVPI061M0J1M56ndu+85gk8FmOxANImrU3
 UYBVkFtJ/YzvQZ2ujQw7yfjxb4+XbweROp8mjehMp+N38sSqlAN6r8/g2yymfEFst2yt
 ZjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511497; x=1760116297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vginp/BWCazHuQzqIb8BXHBvPZrCFhK+/22L3/T0m/s=;
 b=CxDIE5sOg5eVLQ7T9T/6n69ki4E/lpXBYn0TGPIEArDae2kNZHvKsone1cQ/UVgpFz
 Epcen/RkDjKxbgdnNaBu477vZ2fImvnsYljYK4+1x67bEzt3ZRnCAkEcOvtyKMFTGq10
 1h5/CexZk3Rf9Ll7q7m5gqTsYJQWhNxCh0R9UFOX6dwK6SMsPQ+BYFjzCAJeUtHzI1yF
 YTV3bUwXQaq5+h3HWkXezwIetu3o18ml6Rw3i+h+k86IAS/cvrAHb9sFs2ruGJFh54HL
 GGItVvN+x6nlo7E4jHZdBeRkmgi3gU78tquS/bemORgn7Yg9k7hbICfF/+fTjTwDHd/H
 5ndQ==
X-Gm-Message-State: AOJu0YzHRqjebyXlMdQ4t7zJTDOARajpQcDz8NYKL0sz7eVntuNM+cj8
 8PJZzPPT1Zzb2SjRhnTt/ChRYP+QBS75PPkfYvsn30SZ7sZYyy/bbflqP82LXrZxXHfaxAKlBnd
 FXQ/ea/M=
X-Gm-Gg: ASbGnct+O7VZX7wpW/2j2pR+N5n6qSDDExqQXzYDxcdLQqiZt+W+d2A0bNCbi+JEsaq
 /bbH1sMfeLvng2kRXpIiWQFjMaIzwbR345NPNlbJfA/JrvZx2W5qZ7te+8DdlWiXyB8TpDwRvHJ
 lFJfw9S4Z/PTGHDLz8ihLzRUu2RmnmHpBXoClIMeo5YZXp07+0bTTWW+lEb9ECaIYM68tj8G8Ov
 xnc2/YZd7CLiUBRwazyhk80InkIlb2mlcy8js8fizmqsk1HJwEt1nvNx09D1ij86fV4frgog1j8
 Ek8rb0GA0T6V73rBptyisjHMKnNfhQk7+vPuJWRyGs25o5F+GSdhYwuA9bf/7mQl+44w2f5HC/w
 lhKgT+PKRCi9WfJS7kxE+PGiIu5Lztu/IlijrU3wzYVippWXPEFNwFF9cxYyeq0ZYN6Q=
X-Google-Smtp-Source: AGHT+IEG6FGpOW48MNKQkH8t5RSiOa0v/ft8aHrv4ADtS29Kl+R8gVamgSMhBpMcHiQbl0iWlrU5rw==
X-Received: by 2002:a05:6a00:8c4:b0:781:18dd:31de with SMTP id
 d2e1a72fcca58-78c98a77c8cmr4806661b3a.12.1759511496917; 
 Fri, 03 Oct 2025 10:11:36 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053a51sm5418769b3a.46.2025.10.03.10.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:11:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 40/73] target/arm: Split out access_nv1_with_nvx
Date: Fri,  3 Oct 2025 10:07:27 -0700
Message-ID: <20251003170800.997167-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
 target/arm/helper.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b84cd3fbbd..8ab1b3810e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3423,15 +3423,16 @@ static void mdcr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static CPAccessResult access_nv1_with_nvx(uint64_t hcr_nv)
+{
+    return hcr_nv == (HCR_NV | HCR_NV1) ? CP_ACCESS_TRAP_EL2 : CP_ACCESS_OK;
+}
+
 static CPAccessResult access_nv1(CPUARMState *env, const ARMCPRegInfo *ri,
                                  bool isread)
 {
     if (arm_current_el(env) == 1) {
-        uint64_t hcr_nv = arm_hcr_el2_nvx_eff(env);
-
-        if (hcr_nv == (HCR_NV | HCR_NV1)) {
-            return CP_ACCESS_TRAP_EL2;
-        }
+        return access_nv1_with_nvx(arm_hcr_el2_nvx_eff(env));
     }
     return CP_ACCESS_OK;
 }
-- 
2.43.0


