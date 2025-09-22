Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301EBCA100F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 19:11:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lbt-0004uB-M3; Mon, 22 Sep 2025 14:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbp-0004pu-RG
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:57 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbk-0004A8-QH
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:57 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-77f207d0891so1613432b3a.1
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758566991; x=1759171791; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jHDom8RqSvFBhHj/9Q/rXAoVV+sGpC/X8GRYrjCGKNI=;
 b=jxjgyxTrxi4ch6+y574d+D88YSrJ10r2OJ5Nzd0PGlAi9bMVnNnYRwlMhNWdkAwric
 MbXxUw5HK2eBZswLI00V8gxTk+bfnn03PDUkavqo4maZ7kdAarmSbHD2aNq3xsB8aYTA
 QfuD2ubE0gYputbqXYOdZ7uouzuXsQkLCGMhWFFv4DKSIlDOQmiSuLtzTr7HMF0soyVT
 DDNt8goewOeZ+EB1dY+I7rNIfLiytdub+fxeSSdW8HcNe3ZbIvqLIl1WZtygwZswvu5u
 000BrU70VfeEO8NQKvbMizBd2hjrPiBp4UT/KJ+SmK3xs24Qggc1EPx2MAj57Qg6BK4V
 xwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758566991; x=1759171791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jHDom8RqSvFBhHj/9Q/rXAoVV+sGpC/X8GRYrjCGKNI=;
 b=dmsg8clO6lvbZzPCbunHcs7JnTb7CESnsUDb64L5e3c6CU/4ecrnmpLbskepCiNo+5
 9NliGmeGrNBQYmE65PlQmF9I2E1qcLQgO9cDCzlasQQxEmw9Dcbs5vLsdV4VQge6fHyR
 oL21Mn8mJ/OA0Zw2wmT8m6YoH9hnOwOtlYm5tN48YlXDYX0VQGW4kxO5KbAF6IU6Hp/I
 or2U0dTK81A16mysuFZAyTg36/IsCwqGgt+emdj3z5aiHJXdnuUJyydZ4MWmVW8QLkfy
 z23rxzdBBrM5kMiWofgN18AUTEbOSEMoKj7sHKM/4r1XgonfYqhqjsYNPwzxeUvQqRXl
 rRog==
X-Gm-Message-State: AOJu0Yx50g7sh/KZx7b6Zzf8XAM2g7CRBeDBNb6p4pLCoOLHM04j9Xdc
 j1wbcUMEKhOtQwWXhllVp9zZXbWl1rOkrW6oq9WJoNd+vNxBfiD4zsRiS/tfCJTUj0s=
X-Gm-Gg: ASbGncvdVsh/ATaSfVk9lmrJyVfYkZ4N4uXYqYbx6f5goG+/tU1/vLJQ8dun6IZ1IiU
 fqiMGki/OPzWzvEfMVDf2nAIwS3SpCGUu0gtFDlVT86JyZPskouw7dQJ8xjpMF77UmzVv8qgrZ0
 XjiV5FE9QUQA2/TYoL88cS9Cn040DldBgOY/Asl4szkrLsJ6Htq8mssN+atKxWfgncUDUaidtaQ
 5dMdrosOqj2cwjpiZfSy9SKvcGnvYihh5AJRLf2PFusgXkz8sbRi4NirOS71Np/S+YpmL0MfcV4
 B7mzbf+f3xBalbRmrryV+d+Q44PHMA5Y4eI86UQRRJpSEVPZj0DVMqSC6GIUpaVskhGtzF+olAM
 qBSphmoRoncHNQWXQLNI9iHe5Ko+L
X-Google-Smtp-Source: AGHT+IELIj2e2AE/JlVor0L3U7eO0NDK4nbbxGLgfDon/xopz74lgCyuM74OCjNG/KHQNt70PFmhNw==
X-Received: by 2002:a05:6a00:330f:b0:77e:74d8:c6e5 with SMTP id
 d2e1a72fcca58-77e74d8dda0mr14025097b3a.15.1758566990678; 
 Mon, 22 Sep 2025 11:49:50 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:49:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 17/76] include/exec/memopidx: Adjust for 32 mmu indexes
Date: Mon, 22 Sep 2025 11:48:25 -0700
Message-ID: <20250922184924.2754205-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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


