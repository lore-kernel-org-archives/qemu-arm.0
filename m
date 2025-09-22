Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8456CAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:57:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lj2-0001ol-Ac; Mon, 22 Sep 2025 14:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfy-00054o-54
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:19 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfP-000514-1U
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:13 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-26e68904f0eso26545365ad.0
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567216; x=1759172016; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TIGC+NB44/a0H+dR2upS+UgyhxrsXnOzX4fio5wssx8=;
 b=tvu/yDoYF2TBp57oodn+wPY9n15R7OcQxirA4vQnad8ALMzsx83U6+eQvE0NhHZks6
 TNZjcZ7Cpn+IN4xHc1C6zFYLbKm9yVfADyvUAPqy9FUBtlsECE2Cf1H/QK4b0PaU4tz6
 1ZLkdGHoBHtdQjPpKtmWcyi1tM3n8zJt6JIPgqnnhuR8LGuDwo8hkeYYONB9+RRfVr79
 sgN6IVlZ0fJeqrxz0JmoAV7uZq2NDtQJ10l5Ctsgkbv8o7uCDDJfOHu6ZVlO6+WWpYn7
 Dc/ThCunk8TwdCduVIKSAXbL0ujLkllhItV51OGkNPQnlPVS+Sy6gVjhqVIwv10P+6a0
 7AEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567216; x=1759172016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TIGC+NB44/a0H+dR2upS+UgyhxrsXnOzX4fio5wssx8=;
 b=BpFix7uLVp1xn4jBg/4IzpPRpPnCjXafrwaFnb8Tbe4ejP/PGhligQIzUyHTfDlba5
 vxX2s0dVedmN7vypdaIHTThuHOvVWMIsNJ1j8kbBfBe0fhdbU1yl8XNcKyS+HGUWY6lu
 STjcJovENXVPsygg6KGI/aVKfeZSuU8NYs29xve5ZVz5GpnKR9npj4OBcsZ/4YVyWpmi
 h3rifzUyk+qkjRe/MN6yllAXMwM0fdz2ThCzoj2yKdeoNcWX67TwH6NbUjc08cwK/zJm
 k49Umaunr3HWzhj4PDE3+1iYeQv9alZ+cgwDumfpOAjk8sokiU7XaJQ/5Tp0XUB98jmr
 XTJA==
X-Gm-Message-State: AOJu0YyI3mOApJT5k15tiNcYjNTpXUDjXJAfakUxAYeN+ELRLjL6wTXy
 m0t3W17as+F28s/SD+/5y5U0N9ws4twAzofYERlZeC10IrscUvMD2y+C9Y1Wz7ACbAk=
X-Gm-Gg: ASbGncvZLp333T0xkYlSN+H7jBxCQo93RPX/XASnx6tbTBfueMBKd48WnaNO0bwz1sn
 mMcdKx6ZiaU8v1Cy9XuiUTs/BL8/cW7zs68MCeY/MHR3WyCAbbnEPDWth1c+casM6K+ER00vDp/
 sxWNSLky+PcJx9x52iw3TMuIPF9x4By6qJNSEkicY7sZUbGObzQfAfGAHjGlDNEU5tbKR/C3pGX
 WTmAZVUKYXfSqbxJQ2jMMsrjLukdy60qByIAwc9cBrctcgew4a3rnN5yogaei+8RWYSkvATw9u8
 r9nNhQfi4f+YUXxWisQG0Zxp1KvNa7GAIs8Am3wnCorHcBkh7KkwjlOL1NR1zLY0zOXg5NzLSey
 cgjR6uopUTtTpLkG6YUteKUSL7AJn
X-Google-Smtp-Source: AGHT+IHnK9rRG6hvlKVoT4mEeGvvAa24s+BGGifTiad+9GXWsQJCxBuEDHsu6NZlq3fMKFBguLMflw==
X-Received: by 2002:a17:903:b48:b0:24c:9a51:9a33 with SMTP id
 d9443c01a7336-269ba455941mr172864705ad.22.1758567215770; 
 Mon, 22 Sep 2025 11:53:35 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 64/76] target/arm: Implement EXLOCK check during exception
 return
Date: Mon, 22 Sep 2025 11:49:12 -0700
Message-ID: <20250922184924.2754205-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
index 08b7db7c46..ba1d775d81 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -675,6 +675,17 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
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


