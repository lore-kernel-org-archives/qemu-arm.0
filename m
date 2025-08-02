Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E2FC87FD3
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:49:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLt7-00067X-Gl; Sat, 02 Aug 2025 19:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLoK-0005xM-Dm
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:39:00 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLoI-0006PT-4S
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:38:43 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-741ae696663so93334a34.0
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177921; x=1754782721; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=52VfTzYDSgjyTkCxi2KMOJnfbsQ5A6/k4xx3za3L80c=;
 b=ZlYkBCKgG8koU5DxEEJdIRXmYBmgJH/ns9lrpFyMkzqgZXpClcQfdO+BVej89tNtoj
 Ckt9oEPXNwgWeES+ztta04CRvqGx+a4LcEvAhpFj+rL5KbIU4QU7dOuzu2VZ2szlnUJT
 4y/u/jcWYhMFFhGiOTPCW63Hb1Ap67AP6fd4PksYdrcchrvRUqX1jIqFSSrCSbmilPBN
 yFtCsmrRblim4MR/Ph/HWj/hc+Pkl6vUvUeHDvFEAIFBpZQq2YTjuyNxR87IEciTT89/
 aDjVCwfkaCR8cKbBPfm2euKdiD+/Tk3E1Ohq45eTs32etVDp2MmYz65RhHahhP7DjFCP
 MVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177921; x=1754782721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=52VfTzYDSgjyTkCxi2KMOJnfbsQ5A6/k4xx3za3L80c=;
 b=pgHfLb9NHN/KftrNHHeh2ntOFkF/sYO/GrZfSZu3JfRkmejuemC6tRImq80HE5Knz/
 ivD3/9UNa1JM6A9yxI8YgcBCExTa+Tuqq6TTGQkQvT5T6XMw/T1KKUidqea4KJis6cw/
 IPzGVWGhUHECWSTU/RiD0nX9y/mQDaxH15LulqoDGwU7ho+7pr0M8ttAlXLP3LrqEjGE
 sL+6oD8U+sJojre1DbXZB57Z5AINJaU1/a7Nmeb3XJDbClCkwWK8pbjPoIYbsr8uv284
 qnWwy11c448S85a724LlW206AfOtu82Muk6KBJH9a2nCpHz4TnW7nAdWHk0HWEQOKBuM
 /4Iw==
X-Gm-Message-State: AOJu0YwzculUAET5SRVZnHWZEI1daczrvodr0gLA1xGHHv9nzQbrUoFq
 /1HW6vLChDNcEFhgqDozPXyF7MbVrBK1Utg+nE8VyGvftYTKA/3VROy+iU9O8iUDMc8USaIsUxA
 tdKdKvtA=
X-Gm-Gg: ASbGncth/4CQUIiYrfqXCQjh8snSEolbP40/c0u4p4liVf+W0VuFH6XoBR/38Hq5RQN
 TFkf7YGlzIoahYbZHtRDIxrrEGf/8qDau0Ez8HAit5eN6UXb2il5cqnkxkm9zahESm2re27DbEu
 vLfW8pEjuMI7ECnUqpm9LoxTPGbzSHvspaWvtQ3VszNeIEgkAj1LLPHZeRM+4aoeBX2viGVynTJ
 Hxd/85Co9XWv1KadJeWAwHaNf6LqOLfPLVpUNiyqo1zzJLGX1u+TTwrhVWLAIYLO+lEPNZH3kfA
 zGWNGz8Lt6j0YPLybzsmhaUB3oOwB8vBRwkm1cYKhEMxcil9Hr0OM1r1Frn2cfeLpanbWE4Wa9b
 0bdAO2Vvy36MRJ30zQ/jNeAwbXPHjvzxkB2HNj6nGyO9LRK7ZdU0U
X-Google-Smtp-Source: AGHT+IHY5Yif+IvfbKW28B3C6m3Kjri8XCaeK9q2Zy1SptcBJ6C3vm8+u6ATT05tOPsOwM7VqUpUyA==
X-Received: by 2002:a05:6830:264c:b0:73e:a0ab:39bd with SMTP id
 46e09a7af769-7419d0e1115mr3008697a34.8.1754177921044; 
 Sat, 02 Aug 2025 16:38:41 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:38:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 72/85] target/arm: Implement EXLOCK check during exception
 return
Date: Sun,  3 Aug 2025 09:29:40 +1000
Message-ID: <20250802232953.413294-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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
 target/arm/tcg/helper-a64.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index f61adf1f80..7ab7ddf7c4 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -694,6 +694,17 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
         goto illegal_return;
     }
 
+    /*
+     * If GetCurrentEXLOCKEN, the exception return path must use GCSPOPCX,
+     * which will set PSTATE.EXLOCK.  We need not explicitly check FEAT_GCS,
+     * because GCSCR_ELx cannot be set without it.
+     */
+    if (new_el == cur_el &&
+        (env->cp15.gcscr_el[cur_el] & GCSCR_EXLOCKEN) &&
+        !(env->pstate & PSTATE_EXLOCK)) {
+        goto illegal_return;
+    }
+
     bql_lock();
     arm_call_pre_el_change_hook(cpu);
     bql_unlock();
-- 
2.43.0


