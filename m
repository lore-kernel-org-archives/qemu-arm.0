Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07F9CAC5B0
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:44:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jOh-0002eW-6t; Fri, 03 Oct 2025 13:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jLi-0007kl-PF
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:43 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jKD-0007rt-QH
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:42 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-780fc3b181aso1513917b3a.2
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511519; x=1760116319; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=au1p9jkMiR0m3GZ+HsfbdQGnbjgw04MZ6jMgdZAjlwQ=;
 b=LG9EUIW5SUgT4onGBkwXas4CBo/1rYPYuuvUU0nqXGuq6Abjv4T7WA/EpTn0AUCAAU
 DqGPUI9gX2kZzsq5MsJjjNqRDTxr26WdYDvsewtLTXmdyfyxhVFVAtE+WulZQ8NyATUH
 us8WWS5BN47GBqslh9kMZNQBlhwBCq/jjaNR3xUZdpRB3j94aqbbcDbRz97lyLmq/7zq
 Kr1qsjffliPrsVIsWBnTeo2VmZUZM9Jd3W8R/vf3FAK6eEafgJv5mqWT/t/ZFPJYXVLj
 qssawx4KvYk0uDi59p9TRDFdEJEqEaaEcIsFIBf3dxfTfokomqC9FGf46duLeDKtpm3d
 mzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511519; x=1760116319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=au1p9jkMiR0m3GZ+HsfbdQGnbjgw04MZ6jMgdZAjlwQ=;
 b=fROcuyXKB+Arlvz0XFR/2XkLjBep12KVepE0vySZrKFu8TsNQhNXmK8j/GVO00wnYj
 VoAPfudze8tqe4PTriLHHj/JQuMtj9/iiWeJIz1ETBljqEnxqoRttdpmcEICciUz7Cmp
 zJyT6EhtpJMdYeHegYROJ9LljsqEM3oC6yu+lkoGcNB0XHOM9ZsbvlxNGm2OkT6qdth8
 2rS0ODDJRiY/u3/40TIM3hVSJXLCnjG0j6oSrhIhMLVvAwusW1JoZMXy6qMItwX318yw
 NyTk2zsyMKIVSSsv/kxSRx2OgqAMtrwMyNBSfJ4UxoYevBS3oIUIzq2qBtwanwGX26LU
 xyEw==
X-Gm-Message-State: AOJu0YyCcev7qCtPrauRmmqFfrj5gclZiPi+Vtjc12a1lVBp9koKjvrY
 c+JS809BcvQ3CuT+5JJHtyqmHySTAJHDUyl4ykEAE9ph2/VaWgiDkA+o0yIB/tEcmJYoIq0tREx
 fsHEaQJE=
X-Gm-Gg: ASbGncvHoLDGkf9b962V044smHv1yLNof8J/l3G42UlcwrXf+U4Pm++BSL8ouC2916P
 TrAfv8oW5KP3fCEswNLgLKJTlaTyePYPg/QzjtYpzJcDDU9XyTpxlzm5dEdoe++MiXg7pe2fpQ8
 85aYG+NT/4kdE9yj9/ME0qmOwhbVVap1zvui9xxV43ZLxKzvm2lEPz/emnOeMUwJz0M7rjPoW8i
 zMHKPoNAkgQncO36jG9jW4gD7AIXuMBtSDZycOW4a7vXxL8zFYlWyDousE/z9K+EuJIH0lmDST4
 a/wlyo9IHA20zdFR/EEAZLeFvyAevGjje04OrcCD091Eeolfk00uF9EvLk70rk1qucUCzDiZU0c
 VphHKM/e1xVkmwkhtpb+FK8KGhl5juKC95XraDa6KtdAfw3+8Txj+iFTG
X-Google-Smtp-Source: AGHT+IHuE/Ke8gIoJ9jHuEvxZaBYVkfOVN9IkRtsLYQp7QJIlLP+dRFKC69EXteBLPi8DyiA2YS5SQ==
X-Received: by 2002:a05:6a21:329c:b0:309:48d8:cf23 with SMTP id
 adf61e73a8af0-32b6210920fmr5188828637.52.1759511519465; 
 Fri, 03 Oct 2025 10:11:59 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053a51sm5418769b3a.46.2025.10.03.10.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:11:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 64/73] linux-user/aarch64: Allocate new gcs stack on clone
Date: Fri,  3 Oct 2025 10:07:51 -0700
Message-ID: <20251003170800.997167-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Allocate the new stack early, so that error reporting need
not clean up other objects.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 455965991c..b09ea4b0ff 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6686,6 +6686,21 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
         ts = g_new0(TaskState, 1);
         init_task_state(ts);
 
+#ifdef TARGET_AARCH64
+        /*
+         * If GCS is enabled in the parent thread, it is also enabled
+         * in the child thread, but with a newly allocated stack.
+         */
+        abi_long new_gcspr = 0;
+        if (env->cp15.gcscr_el[0] & GCSCR_PCRSEL) {
+            new_gcspr = gcs_new_stack(ts);
+            if (new_gcspr == -1) {
+                g_free(ts);
+                return -TARGET_ENOMEM;
+            }
+        }
+#endif
+
         /* Grab a mutex so that thread setup appears atomic.  */
         pthread_mutex_lock(&clone_lock);
 
@@ -6707,6 +6722,11 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
         ts->info = parent_ts->info;
         ts->signal_mask = parent_ts->signal_mask;
 
+#ifdef TARGET_AARCH64
+        ts->gcs_el0_locked = parent_ts->gcs_el0_locked;
+        new_env->cp15.gcspr_el[0] = new_gcspr;
+#endif
+
         if (flags & CLONE_CHILD_CLEARTID) {
             ts->child_tidptr = child_tidptr;
         }
-- 
2.43.0


