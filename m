Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABF0CA0EE6
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:23:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXYd-0002Vy-Gz; Thu, 14 Aug 2025 08:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXYX-0002N5-P8
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:59:46 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXYS-0004Of-99
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:59:45 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-32326e05b3eso712078a91.2
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 05:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176375; x=1755781175; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UkNyZZYFhHeil9ygYrAE1UXkAwT1+GtqIOD2Xj8zAVs=;
 b=fIGz5x0vwJL7x1qrsVTbKMi4nhNND2CkaP43gdrCzKowXxXGXno1TP/AGo6/7a4z5U
 i9bqcF+csbeLEQzi3G5sBW2C7CjiXITXsD/HW09+I4WnHhFjbL+JT0wU9GtL4x/SORvG
 +WZTSKf4UvK+RqpmUowIACR6Eh6NiaGuMyU8vDMdXg9DG8OiIAcg1Ln+Ldacx8OxNYmW
 og4q1Cq+Y5/n2hsfsr48H/f/q/3Vki3hfOOUeIynd+FAW3bRTIgK94PL4Z2y4qFeLXSQ
 1aqSiq1s+TRtge9VLT4yf9Ko8qD325y42ZFuRQcqA8YwI9vv2Z3Qfb+b8qw2UcWxiddM
 ELnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176375; x=1755781175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UkNyZZYFhHeil9ygYrAE1UXkAwT1+GtqIOD2Xj8zAVs=;
 b=cMfIynLegIMq0K7T8AFqPUVi5IFo1bJOAzjHh30aWkavLVA0L6oyKXLiQca7qIAIU3
 vBmonGTsH+dQ6o5zFbXDkI73utRd2kb5vjNDI9grAMxLKCgasP1FxNxAh2TTeaDMXSVD
 4QJm7mMaWcwbKNhQ0JTVOGGvV3QELxO8IxyNeA5SsCghd2Lt17M+mjXsycULaowl+6SK
 cYQVIaBIp1k23Wpn0pPw8pHdUOhpV/lm0pFgD6geLLPyTFdLz2pBaJgI5JGyfxhv0Qyx
 S/gHl7p03D0Cz5gbAmus0EDeJVe5x//a3xG6hpmi1bCZyork116aWjK6PcRWlAul+PeA
 MG9Q==
X-Gm-Message-State: AOJu0YxVx4KN/WOA3yieVlcP4AJDQLgxv9n5vA2RL6myjvNAjDjpNGMs
 3PDFdV3oXXX4yApBSxqfLF2a+4zFKzlp14jkjhIAdVcbkfLYbJirb+TXVu1O+kxET/zWiBobiXH
 HvfSX+ok=
X-Gm-Gg: ASbGncvNIXHniq2irPH1Eer5VOoc8KrTkp8oCSWTDyp2/Kk5gMI5PE5m3a3xLWGQf3W
 bxIoIO8wgDwjGzxe+H7rePOgMdDZg5HxfKzLa9llvEyEYy6+kz6pDeJyQipQxiVpLtulI76KI00
 nVyZUBwFX5WrGj9siOCZ9q7+Azx0LHAu5maqAEArRrKR+it64vgHo14p2LGIjBK0C7l0Vi6cEx/
 tSvVy8F5nVt4bb2drnoAlW0+FBwLawg89HV5svqs/xm5qA+QaU5BhxjXfp+xqQHHaKNLdhM3/PG
 COqjVO0K3QDR+WmLUDrbGT3/eb6bhIDdQ8FObN/zu4IDwSwYVC9Dem9I0DuTVYsX3C6qW92YpBi
 pqhXWBIfTkRq2klfCbvnVrt08F/Qmz4l7Ni8Y6XMwzN4XyNOBAfujiMBj7w==
X-Google-Smtp-Source: AGHT+IFz/etwsmckVxbDZJDwvEZMxWQ3BURMk1QYcQ6O9jYPl1e3MgJcOCrqFTVKHMHeVp6GgzkaSA==
X-Received: by 2002:a17:90b:5107:b0:321:9366:5865 with SMTP id
 98e67ed59e1d1-32327aa63bemr5106483a91.33.1755176375579; 
 Thu, 14 Aug 2025 05:59:35 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3233100c994sm1766256a91.21.2025.08.14.05.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 05:59:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 29/85] target/hppa: Adjust mmu indexes to begin with 0
Date: Thu, 14 Aug 2025 22:56:56 +1000
Message-ID: <20250814125752.164107-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


