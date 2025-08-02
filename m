Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8021AC87FD2
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:58:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLl3-0007lF-TB; Sat, 02 Aug 2025 19:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLiB-000135-Ro
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:32:24 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLi9-0005Ao-11
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:32:23 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2ffa1b10918so1988345fac.2
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177540; x=1754782340; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UkNyZZYFhHeil9ygYrAE1UXkAwT1+GtqIOD2Xj8zAVs=;
 b=x0p+trCfWcYmIO4CP4dG9LkdZbI9U7lpxJBe905Xywe9k7ztAVQBNrutuSme5CQ2tj
 miYMa8N/7PD3S8Ll0Piu0fwQLUxGy1QMF6D/E98MSPQR9mgCiBeFk/i6oeZSJUONQI+5
 1gU/6NxGxVb0kI1krl5P0wimyoONZvMDilR6PGi5rX+PUhr4DkGAzs/rjokv8msBA9vI
 YHMLVRV5rmMQhHAP0XyCzBPP1dH9qR91SEToh0y+nhzP2gTaXrDZummytNmBColzfNBZ
 qCYMw2DykH+hZVWoKW2WLcr8bbuxF7rMpJO4umjJHvtbw4HjpFIEYzxezqhP0UG7TEsA
 ljwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177540; x=1754782340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UkNyZZYFhHeil9ygYrAE1UXkAwT1+GtqIOD2Xj8zAVs=;
 b=W1EP3ulalYGMttWmViFKbhoGJlV2F9m/6awPP1JbjEmLGJ9QiMvKEw1qN95mY3oEO8
 jl++qJ6yGgJUKWWhTyy2LjLnP6KpMRTsp8uAN8MLjG+Ze3dsYdmgvyAAERxh0q9g/P0v
 smJKWLpTDLYJKx1Xe1hLXdZA1iRzN7WqGEwFvM3Kei4JLvtI89g5nZQb+ZNLyghwFkb6
 vE5YjxwlPRptVCWU9qeXUwMj0ydTILsXxU8er17RwaBqr4corX3yHlplsRaTCI4SD++h
 hq9sKQqjTCAWc2Ir0aKu4p5Ks8LBTiz7BeRbYW2z0Nz0vDPwp5+bKWIDLwyg1VX9rRTE
 wNsw==
X-Gm-Message-State: AOJu0YwvRMdpaB1P2+8igy/jEuBhbmRR0KhJVIFsTCBGD0iQCfXpk5PL
 YskGjkTCanXFq/SFq6CJNwZ9uXV1eCASVpzH6k8A8qPkZlIGM8Hwwf1Vlx+aXrp6mtbrMaYWGBq
 CBGtjsAk=
X-Gm-Gg: ASbGncs50Ug5QucjPvO+0rZJD0khwYya+bszZFDHPjPZtDt9NhIlg9zd76guffCBX0H
 a/YlLMKSzrVFWIQbQQNB+vuWlTRhNciN8fX6gSREUuRuP8/OTkU4nFc0aPu2WJi1ZV7tg2uusdC
 8ZNU7pj+Tgmn3PEjP48TzK3UIqDs3sSgYSA375yhVCH0Paf0yrjpqvAB63SA1ejQH/71Q+zBgKT
 0BQbcR6tZkRAkml2c8/oT20IjfgIoe8rHRHfFDfdVayCrflwvdDU9/5x/qWMDoqm9/PotA2iUM5
 g9DxaO6ymY2AhnFU+/PiPnHQMwxXQRONF3ieBjyWyIAmIxorBlHreq0I116UoUH113UvlddBS6P
 H+d1m60yRImJO5rQmnQEpDx0UtH4F0DI61j4K+ZFvDXZ1xwtnVHFsBOC9f0EaF1s=
X-Google-Smtp-Source: AGHT+IFaZzmK5IYUTuJNQzaACtC5hO+K31zKKWlBkqoFSys/khbeKudzmVw91FuYj9atNyCYvwbvbw==
X-Received: by 2002:a05:6871:5889:b0:306:c0b8:49f1 with SMTP id
 586e51a60fabf-30b6796f2b8mr2705043fac.19.1754177539760; 
 Sat, 02 Aug 2025 16:32:19 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30b8e3c9b32sm71031fac.24.2025.08.02.16.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:32:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 29/85] target/hppa: Adjust mmu indexes to begin with 0
Date: Sun,  3 Aug 2025 09:28:57 +1000
Message-ID: <20250802232953.413294-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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

This is a logical reversion of 2ad04500543, though
there have been additions to the set of mmu indexes
since then.  The impetus to that original patch,
"9-15 will use shorter assembler instructions when
run on a x86-64 host" is now handled generically.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 11d59d11ca..672ab3750c 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -29,21 +29,21 @@
 #include "qemu/interval-tree.h"
 #include "hw/registerfields.h"
 
-#define MMU_ABS_W_IDX     6
-#define MMU_ABS_IDX       7
-#define MMU_KERNEL_IDX    8
-#define MMU_KERNEL_P_IDX  9
-#define MMU_PL1_IDX       10
-#define MMU_PL1_P_IDX     11
-#define MMU_PL2_IDX       12
-#define MMU_PL2_P_IDX     13
-#define MMU_USER_IDX      14
-#define MMU_USER_P_IDX    15
+#define MMU_KERNEL_IDX    0
+#define MMU_KERNEL_P_IDX  1
+#define MMU_PL1_IDX       2
+#define MMU_PL1_P_IDX     3
+#define MMU_PL2_IDX       4
+#define MMU_PL2_P_IDX     5
+#define MMU_USER_IDX      6
+#define MMU_USER_P_IDX    7
+#define MMU_ABS_IDX       8
+#define MMU_ABS_W_IDX     9
 
-#define MMU_IDX_MMU_DISABLED(MIDX)  ((MIDX) < MMU_KERNEL_IDX)
-#define MMU_IDX_TO_PRIV(MIDX)       (((MIDX) - MMU_KERNEL_IDX) / 2)
-#define MMU_IDX_TO_P(MIDX)          (((MIDX) - MMU_KERNEL_IDX) & 1)
-#define PRIV_P_TO_MMU_IDX(PRIV, P)  ((PRIV) * 2 + !!(P) + MMU_KERNEL_IDX)
+#define MMU_IDX_MMU_DISABLED(MIDX)  ((MIDX) >= MMU_ABS_IDX)
+#define MMU_IDX_TO_PRIV(MIDX)       ((MIDX) / 2)
+#define MMU_IDX_TO_P(MIDX)          ((MIDX) & 1)
+#define PRIV_P_TO_MMU_IDX(PRIV, P)  ((PRIV) * 2 + !!(P))
 
 #define PRIV_KERNEL       0
 #define PRIV_USER         3
-- 
2.43.0


