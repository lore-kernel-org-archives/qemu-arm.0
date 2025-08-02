Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF38DC87FD3
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 00:03:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLjw-0005tu-Nw; Sat, 02 Aug 2025 19:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLiE-00018a-KP
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:32:27 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLiD-0005Bt-3o
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:32:26 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-6199e7dea23so315240eaf.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177544; x=1754782344; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jHDom8RqSvFBhHj/9Q/rXAoVV+sGpC/X8GRYrjCGKNI=;
 b=T79WVbvjSXh/SjbwdAiVUeSldUv9m4NG40O3SOuzsaD1Gu34MpMR8dQRALBt7R0r5e
 mpPFOQm4eG0cmNFXaBel8NWytpIYBUMEHkKhg6q3NN62te+Zydg4DEkno3aXSjQyABf+
 NGIzTFNOBLeZ7P9ci0hW6tzll8n+mnd0uEzr9++YrSePkkvt1/1k+Q9IitURrSUNQYDM
 9K2R7/G6r1hPIelw7qNwvxITIY6WFSU+4awe78ftGSZAsKFOS4obCC3Aly2j7KqhFGa7
 gM1ULP8ctm8xrgf0CZZC4gKv6Z9u2HwbF0pxEXJwoLdrGT370tmIn9mncsIVxDSuzqzw
 8CEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177544; x=1754782344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jHDom8RqSvFBhHj/9Q/rXAoVV+sGpC/X8GRYrjCGKNI=;
 b=e2Pti3mFG7ZsjB276IIi47BSbyI2kt2oXShFjpN1ZrmEihGP4UMl9WXbcGGWw4X9UP
 h91OVwh/LPqLHj4MMjWvFnJxeR/38z26lVAXm0xKKIMIqeQ1Z/hxSlKCg+C0bGxhT3Nm
 CbR3o0LoIe2HXpsuUs2oykhh3WKD5L5ZqBv0VAaYxexjpm+Cj9nQ0TW59nrmHcmgjHQy
 R1A9Mcdyx97Sa/TtZhpR/cmfYwD08nUvamiyxYjfcvFvbpmwclYi7+523aNZGzo9vi5R
 KFGx0xLonOTxttoj6IkMqQQKRyI9HISkt5bMficrHzp7YltNcUEdbn+MYN4BK+LkhTos
 /O7w==
X-Gm-Message-State: AOJu0YxxTdXDP6d7ERoTG6OaZd7dX0yjK4bgoPkP0bgZdMo18CgaruEy
 FS4/3s4hwPLR0qz9mwdVSljCW7G3a4wKafENwQDTNNkO/Ju82QT1wIKWaTsPA4IIQAhCW1fCsvO
 25wCzAac=
X-Gm-Gg: ASbGncsJa9VMYxfuFHm6k1O6RaEOjjX1ZuOsUAa+CBxlNdBn+e6WDRhdREl0qGPyo9p
 0LHEeYkprzsG0HpaHdmoA8tPvBWhDHyNcy3s5bWKmMWCuD8WESuCw8sNkopO8InX+JNPMw8m1z6
 QOIkeb9blujrcqGy/8csVKw7WJu02iMx5zIp3nrxW57O4jeNbIKAns/6EBfZWQmdYxDhjWCBgxK
 h2q3O1cWe3bM5PKdQDXYAikmEJj60sMlbikjF9JaXxjJEsOf/2F033Az5E2bMjHZD8kukdWGHkv
 q1rfMLTNBJWYBut0VREOBIaQA6CB8O8W2Uqa2REVW4GcudSuiHykuqoFsY1VxoBqQucxwv1124B
 VTSpAKh+Pf6d/z/Gv7SdYww2pi5KXDU/nnAe/v6vZLxrCCf3CHm6C
X-Google-Smtp-Source: AGHT+IG6NWPotY80eQ3XZ5CSOfebqtBbgd0mWrQ1Oh+Mcabdpqtc8IW9VQ9VTzpJULz3LNRCVcIYQA==
X-Received: by 2002:a05:6871:2318:b0:2ef:98fc:6f59 with SMTP id
 586e51a60fabf-30b67bc7100mr3265862fac.35.1754177543907; 
 Sat, 02 Aug 2025 16:32:23 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30b8e3c9b32sm71031fac.24.2025.08.02.16.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:32:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 30/85] include/exec/memopidx: Adjust for 32 mmu indexes
Date: Sun,  3 Aug 2025 09:28:58 +1000
Message-ID: <20250802232953.413294-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc29.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memopidx.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/exec/memopidx.h b/include/exec/memopidx.h
index eb7f1591a3..66d9c58b3a 100644
--- a/include/exec/memopidx.h
+++ b/include/exec/memopidx.h
@@ -25,9 +25,10 @@ typedef uint32_t MemOpIdx;
 static inline MemOpIdx make_memop_idx(MemOp op, unsigned idx)
 {
 #ifdef CONFIG_DEBUG_TCG
-    assert(idx <= 15);
+    assert(idx <= 31);
+    assert(clz32(op) >= 5);
 #endif
-    return (op << 4) | idx;
+    return (op << 5) | idx;
 }
 
 /**
@@ -38,7 +39,7 @@ static inline MemOpIdx make_memop_idx(MemOp op, unsigned idx)
  */
 static inline MemOp get_memop(MemOpIdx oi)
 {
-    return oi >> 4;
+    return oi >> 5;
 }
 
 /**
@@ -49,7 +50,7 @@ static inline MemOp get_memop(MemOpIdx oi)
  */
 static inline unsigned get_mmuidx(MemOpIdx oi)
 {
-    return oi & 15;
+    return oi & 31;
 }
 
 #endif
-- 
2.43.0


