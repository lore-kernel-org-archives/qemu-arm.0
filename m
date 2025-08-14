Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDE2CA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:24:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXep-0004Yd-IN; Thu, 14 Aug 2025 09:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXe2-0003Uf-7O
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:05:28 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXdn-0005aU-KT
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:05:25 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-76e2e8aff06so852720b3a.1
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176709; x=1755781509; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RrRDTwGDphkvvBtsV/mK2pHDoMT9L4tWZDtSjWVgm+E=;
 b=QrWjLqGKssKjyHuHMs+aasxkpAEzCqUOY397aWNnLD7GCUSgJKRjzd/OdBQBe43stk
 vKa9YT5Tlv6F8vS+As24YV8H5d9gN5tGe60D9/ngK6i8HF5HO+IfADksT7+g0uC0+Ji4
 aWXGA4YKt/QqZNZSgMqMHT6xCy7kCwv5VoLJm/vOG34nonygUqUxUEisBFUCjgqOmhDU
 503P1ZbZgb2jNqMRoefacvgezRW6dFPLmv2+WeDLqoOzMuefOGJQ+Wbz9/BhCfyO4ksO
 /PhZRzs070vInyNDC7qmzDAN6H+jXGkmADxXq6/CVSfbXoSlAKHKG9wEhIVca5UxYEWP
 w0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176709; x=1755781509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RrRDTwGDphkvvBtsV/mK2pHDoMT9L4tWZDtSjWVgm+E=;
 b=a2mnd+vmeJt6ZwrU7czPhzLe4EgYENqnfJgXATJht7/daPJBllmLNdFhmmu7e13YHT
 PW3UEMgs5Sr2HgvQ+NNRXYJ/M4Nz9A6fJW9V3C1c1ZNMsdI9mmG6k+D1cFMM9iUmbn9F
 KB2InqBqk4KCxVVFCJYftpBFTzOKcmrw0OTp19HlWFIsUajzLWqZFuQg1rRqU4vts6pE
 dvxSepZpiGVK9f+EoUklf6USpgUbxaxS0zY+7XXpoXw2cit9C2wHh94Vi/x8hpzhWcuz
 0qkfDLEautWTQbwe+ist7qhpGuxAWBvvvBrJtWuiIhz3m3UtGnP3auYxqiquo3s/81Nj
 c+1w==
X-Gm-Message-State: AOJu0YzXI3LSpL+J+1MF+loBXqj39QoKDr8qLQ0rdeqU+3rhlRc1FIK1
 jXH+OT2ktSAnAwOadV/pXHuw6AU5iIiDxj9sV2FkFoxytjuRJkIWrqWQr0IPlr6HT0g2i0VEG2B
 /2S5liUQ=
X-Gm-Gg: ASbGnctdsJ+spbBvTZc6CYXa9yuzJVLO5/UmatQPrz+poKNzAKvDPsDn0lNFvBSkj5I
 7KFW/Mkdl6v1knDJ/C0n2iryiJhxS+HXO6oRl2RKBABpbT8I+Vzs4qgmQtDXMkvtosOEV02KAFY
 fbKKDecmrvK/jUIcXFum0dgSQwq6aAKurPiUUxMTVqE+6X3kDqxj4wWoKb0w6zZCFE5nNVw58Of
 dr0bPYEMxHTDxcA43VfbQAXV5aw6MfIiXPLiZhRUOcy7B7KYinbPsWBaZgbBBrExEVMHhRrTWRj
 5eUOz8/Rc9lrr58tREsxQRLgN4WtCTvkp+fEcZyMLQI6S7KVIUdc4ZwJdoCeh793lGtIN8xynKL
 Kr7Fgo9YXf85QM8pFbTnFrYfu7o6yTHv7A/lQITmWd6aajJI=
X-Google-Smtp-Source: AGHT+IGpWmGFa/TWxWsDhF7kHJ2I5r7JNiuOH56iHK8+K3kpJYcGceT5x2yhXsfaxDjC3aNXXdLyMA==
X-Received: by 2002:a05:6a00:244d:b0:76b:6288:e2e7 with SMTP id
 d2e1a72fcca58-76e2fd8dd88mr4424527b3a.20.1755176708438; 
 Thu, 14 Aug 2025 06:05:08 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:05:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 75/85] linux-user/aarch64: Allocate new gcs stack on clone
Date: Thu, 14 Aug 2025 22:57:42 +1000
Message-ID: <20250814125752.164107-76-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
index 2f1e881046..91210775ed 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6652,6 +6652,21 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
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
 
@@ -6676,6 +6691,11 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
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


