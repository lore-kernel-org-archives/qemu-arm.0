Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2681CA100F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 19:06:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lbr-0004qP-5i; Mon, 22 Sep 2025 14:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbo-0004ov-KZ
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:56 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbi-00049V-QL
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:56 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-77f38a9de0bso1270389b3a.0
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758566989; x=1759171789; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UkNyZZYFhHeil9ygYrAE1UXkAwT1+GtqIOD2Xj8zAVs=;
 b=pEmx/1CjQrYB4tRZErGu10iyJd4tBiy3gAVsrdp4fHK3d+TL7Rk6DPAyh2aHdgtlMj
 BLl2o/jp/nOGgkqGMx6ax3jjwDTJzZi7VRW7kFOZrQONQLJWF/7BeMpyVVDC6nDuJqGQ
 uApR9NWYVJ5fnkUd+kG7L0d8gnX5pkxT1DHt45m1Efn+ZhwaC2S6bBq38AUznkMHiU7L
 pXJnK4HldLwaUNtSjJc72m7oazfBvPJcGnOIT70gE7b0fAbxDZj4SQo+U+TeiozSZUH8
 ID/UvaJJ1LTf1AlYFSRLeg1Uszx6sn1sret8+q1W0li6V9rVyZBOvxtlQI8gqvWUa7PR
 gsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758566989; x=1759171789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UkNyZZYFhHeil9ygYrAE1UXkAwT1+GtqIOD2Xj8zAVs=;
 b=PPwgSfq3Fc6t7D13jaKu8WfFIghf43h9NAwePVb3EmVDRwndI/QrYXHdYZFDZxRUck
 7OgIzKK6b8VCqKdNhbj+EIPB4mqmPjeUOq7rmwVo+ahDRtleEZUy7o5q7ZquVlut+WVd
 fTSxHladeofDFdqgJdKhKT6Ul3JIAqaoG9z/8tOu1KVcuFNIYrylz/V8909hhEMGFXMn
 yOgkBfvzJ04bApmuZJ91/YZHoUmVRvP0dNBdt6hEC5uk1DHKKf1IOdBsanKmveADJFV4
 qw3javNbQb27CYngTI+yDMaZr/o2YkZuq1zGWfQuB+QtFz8rR6SeXVtDA/lsGpZqouGF
 9vCA==
X-Gm-Message-State: AOJu0YyWS+iqd4tG5VMMrOWs2ktiOv9q+YbJTw9FtNrO+berNBCO0UgD
 zXM1Oy6keANMJkopGaeKlC3YD5pW65WJRjuNF6fX7nmjj9iN2Y0ShYNj/fQ18GfUf4I=
X-Gm-Gg: ASbGncsIDhHvIeWVXMLVW8JmFlNKYYY8u1H8Ub2MirigfCjxxDa1/vtbfLKfL6gI2Yx
 lQkAkeZ1a4972CKgiPj9Xs5qaVOUJkg9SuA92sA4iy7x0azp2PhCLqLHlTwvU3c/u7A7Dy+NmrV
 hmjSLFQdR+Qm0hvNJbt4J7B9Ts5KFb5d0vGia4lg+fGI8odXknY/r78rX6+dSystT92h8p41/0F
 +IUyhs4VLKb7eIO8Idiwlj8euN4lCIZkhyLCaOIhleafd4Rkts3WUUwIuFClIjBVTx3GFKDRQmK
 Yb/s8Jt9Od8SdPCbGks4yi6h03bvv7VCDe1vXRxql3nQIrD2eIkaT3jWRewuP6PQuT0//abii9N
 QQ6tmIMZhup8RszY982LECwipuCLBat7jgFIghIs=
X-Google-Smtp-Source: AGHT+IFm1jQ14e/HafETcVxEpydEO9fijrVrhiivcFC1bIWbis5xgLtS+4+gXCP+oREyGCPRTMJXLg==
X-Received: by 2002:a05:6a20:12c3:b0:2c5:d3c6:6a59 with SMTP id
 adf61e73a8af0-2cfe89915d1mr131708637.29.1758566988969; 
 Mon, 22 Sep 2025 11:49:48 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:49:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 16/76] target/hppa: Adjust mmu indexes to begin with 0
Date: Mon, 22 Sep 2025 11:48:24 -0700
Message-ID: <20250922184924.2754205-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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


