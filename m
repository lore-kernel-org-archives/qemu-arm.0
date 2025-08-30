Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489D7CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:06:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNw8-00004u-DR; Sat, 30 Aug 2025 11:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEMd-0006BF-91
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:42:59 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEMb-0004Hk-MK
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:42:59 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-772301f8a4cso1456115b3a.3
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532576; x=1757137376; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UkNyZZYFhHeil9ygYrAE1UXkAwT1+GtqIOD2Xj8zAVs=;
 b=WsbjmprgGrkoCelFX8oC/vknaHb8eO/IgMvlsTi/qX6TBQ6jFB74Qpqb/Z8f7B33s7
 YmBFupwhvpx4T3qxS7AJR5KAzXNygKgI3w3qBu0vl/LuugGu2sNE8p9NwyW+lauwHck+
 FX0tkNMV/vZRdbTKoDHzr+D+yYr2YPAnMrAeyeRGd5yzLIR53esZf7oJ1PBrflvgkh+E
 ZKYSFj4fUJV2/lmdSe8444VhUStMUuyn0R/E2149szk6E6q0rBSW9gX4Z2vKDs9hyIMO
 tD/9gyGf11tScQ9LLzQ0fJ2TyOXsa4+XPgxIt8HWFbnAFbiLhA20dzVIThcRaDXClY1h
 F5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532576; x=1757137376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UkNyZZYFhHeil9ygYrAE1UXkAwT1+GtqIOD2Xj8zAVs=;
 b=aWjg9MvRNkqVomkft3wHCxz14RK/R65/aA8oiKzWBSmPEYoQiBkkqWH65HG7ekoOxt
 rEBfyJzvlJTVE4g/Jsyid07O8FAjV27zS6FPc6VRt8Jtlmk7stxxtgv5R/7JNTGlvgZ6
 C57CQmuDqyiL4YVEcI2h/6x4q6icEcKNYrEjF2eqDy9C9OVBDpifK9KMaghahIahDN8C
 smcLat7HB7Wwr2EGs13OTxXTR7STt+k0/pJIx+a7LkSyO8f6DbWRS046i84Nd6K0FmGC
 MAPgzdzJwRVWWa7qCzHBVuXtPMBvklT9i5OYKYRKY4LWmuplpF/TAQ8+EmhjSLywgt03
 +VKQ==
X-Gm-Message-State: AOJu0Yw8oA939OXv93Lp9Sqnq1DbXEaK0xdnsqLAYkg0zrm2ZFjs3WOd
 sg7mK2LWtiY0cRJfZFW/P9PKdZtaddqq9mDHbQhplitPdcJ/biqODTt2nCp6Z9TOCOM=
X-Gm-Gg: ASbGncuc/eVClUtEQ+JhP6kgsBsmYrT783Uge7urASZk9hyH/50QR5eH8H7hcVnuP0Q
 zXjD6OzD/0WvMODKXlSftfBSDbZF+jY4vn5cP7vYAc/7gLgEQSRBTuoXnXxV94X4oGUaILAhBYU
 d9YOnSYLcOWXt52ie8PIEQIRmBkebCf++i2hpWp8rEi3MTRXivzhN8u21MgKae74741+BpN1yWM
 WOn8hDiE67MbdQsmBIHCI3/39uBnNl0kZdvG6p0c63jHIsbO/Y5RnUHObFi0Hh5pCuz256L29EZ
 5p0JNvNwNjh5lRLu/hCVVMU7qDW0NS/uCuXbyK4K3qkAh6ofruKGTeJoYhmuhDRNhKAenkjJVQS
 7Srd4bu+TDVZvDHGCf+WWBu/3qkca9fJhdmu6EcQ81nBhjE89gFV7Lnw2LfGo
X-Google-Smtp-Source: AGHT+IFzxue6JbcKB8sgCKVLlK9hKQJsP7SG7EoF4WWMVt8d4nId999/AlrPhoN4TmK1BXTfgQaNtw==
X-Received: by 2002:a05:6a20:9191:b0:243:9824:26f0 with SMTP id
 adf61e73a8af0-243d6f3b97cmr1820264637.46.1756532575815; 
 Fri, 29 Aug 2025 22:42:55 -0700 (PDT)
Received: from stoup.. (122-150-204-48.dyn.ip.vocus.au. [122.150.204.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm2435905a12.6.2025.08.29.22.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:42:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 29/84] target/hppa: Adjust mmu indexes to begin with 0
Date: Sat, 30 Aug 2025 15:40:33 +1000
Message-ID: <20250830054128.448363-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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


