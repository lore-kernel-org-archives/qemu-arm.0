Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94D2C87FCE
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:17:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwOf-0006bt-QM; Sun, 27 Jul 2025 04:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLy-0005ye-Ut
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:31 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLx-00049P-6N
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:30 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2352400344aso30514245ad.2
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603408; x=1754208208; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5U5uKtt0dYMHATom5laLyD9UNdX3pU9hAWzf847+404=;
 b=P3ys4EJDvFnUmRWC1BuFJ061dOlzMO8jA3ida+AsAlqNPPiJpwMbGmVVLePnss2Fv8
 UprMS8wzq/IGoZ5ObwUFQPnLsFWken0GhIMqFGtBXfQf52vwFRNhXr4sXDpxi4MJSg5V
 pM+LJGpHQzRjMV0bSKzzpFzVzsGCJ4eqD3zlegsWjCXmec2Mnj0mi7ZrkuPyoTXu++Dy
 6pwx/NCAgseLfRBxO7Gb0JQsUyEhbx5DZh7HaGYdAv21lU/svdjEYNMeAbEbwh7gbAyF
 2/7IVVyfH87Xd3AC8RH3xSWBIQmHhetgX0goSLjR36Qq/zjtd0XO2Ydkkxu3+WWSjHO9
 oDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603408; x=1754208208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5U5uKtt0dYMHATom5laLyD9UNdX3pU9hAWzf847+404=;
 b=Qfi7JxQn0InVNbU7WIw40O7NV9lIzGtUHsKrM1kZtwfbaqt767aZuLbg3orat12xIf
 mlSA1owx+ELk10r8AqvdeBY6bjWTeBh0eEA4y8tmz3lXvtOOb70LhIuN1O1/4Ekt81D0
 FW4veGtx69InOKl9BfkZMTHc3wv6vjTSZKj+vcGDTVyxvi7afbB1LStvIYrKx349j4vw
 vEYS/uM4v+lvIsTDc58hmefKIGMj9yS1pxTx5ecXm2beTF216cSrAyTYQaIpH96b7Q4w
 XHQq/eOT2gBDEEQ7rp/Af5XKEJn0C/3cjVIULFf2aI2KL4UfKc3iEHOvIBtnRAJMcGCl
 3apA==
X-Gm-Message-State: AOJu0Yz3n9xkkBEThVYcB0rIr0xuJU3L375dhARTpziV6Ot5DLDK2Gf7
 SrfqSXU1N1rNrvU+mHcplebZ9twnHdFn2aCr+krydSBfGN/7fXf5BGfT3iaJIa5jZYBeQ5enr0c
 /nU2U
X-Gm-Gg: ASbGnctcuFw+sbRpYkHLiHMqHokVVuNDJgBGVE1sXijUMA5wQChh1WZ9klMEHWjGJ3S
 6NAOyZjwrFL3gSLk8RftVQlD4X89VKf2SNFOmbNjDf+yWAdvlx8amxRAtlRuyHflzDPThPYWoxx
 FEZDFzV4xA0zYW6Qvm4dmTVgpIgla+Jr+Gog0WlDYvenXmRdMUgsz9lu5MCnCmj0ntePVaBvki3
 AJYE06lBebc4iGTL/sNE6XG2YM4RAR7cqRWBk2idrF+PxW/wzKTn96hp1JUkPFPFcVMssvUuKj3
 QyRY1zWlMz8jgD4NO64EtqsC9BBfqxDBEeXxG1pk1b1fIOntE74EsbjfUxNLGS2JvVWXOfcWNBC
 4P0hkY4iBtmToDViPFOx6Z00NQmEmjeN+sJqGywgu2h9t73gjTr/npRr8yQ6TLAHL3c272kdvqc
 F9cFszZoMBXg==
X-Google-Smtp-Source: AGHT+IFmwitUmt0qFVTKUsXi7RNSAUSqNuGzvb0P2H6j++ds2E/N1WCiJb9mUPHQDo8IpYV5d/t7Uw==
X-Received: by 2002:a17:903:1c2:b0:234:a139:1210 with SMTP id
 d9443c01a7336-23fb31bdf48mr120549785ad.53.1753603407889; 
 Sun, 27 Jul 2025 01:03:27 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 26/82] target/hppa: Adjust mmu indexes to begin with 0
Date: Sat, 26 Jul 2025 22:01:58 -1000
Message-ID: <20250727080254.83840-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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


