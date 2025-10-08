Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F2BCCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:02:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cEp-0002Qq-BG; Wed, 08 Oct 2025 18:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cDI-0001Kt-EY
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:56 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCX-0007Q1-Cu
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:47 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-77f605f22easo262232b3a.2
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960797; x=1760565597; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FvGI0BB4BkgReDRlpJ0vAJBgFtwv/7JiHcnBRC6GEYg=;
 b=pUhb5OyMxaQygNxsjjlKcHB4KhdjfKsPN4vcBfvrpqtSDXZ4e0qNiRnRdzonN/gQGw
 a/AXuf6hEKeQM/fpf1KOx14gTSGvUDGv45I5QaBvXGEZCaSa387q5xkAu6nWmUBlkneQ
 b4pqlWaQTGuisY2bCLMwwzD7tUYp2+QMh6QjQAR0wppwK67k7kDcDpywp7LhqEIivsHO
 eQ7CTnm/3hFsdVDKt1jPlonpKzMJea5N0wkw9snLYais2wgjnLxd0nVKljV2WerD1axk
 CKCV0v13ONjJr2ld0m+uz1CBmcDzesDUR0tUPZsWVwWV/dNUVmvy+TSsM7IYSGt0TYHk
 r2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960797; x=1760565597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FvGI0BB4BkgReDRlpJ0vAJBgFtwv/7JiHcnBRC6GEYg=;
 b=cQYYgXiipge4diLCfxiXpgrCRUQoWGDgSmh8LZCNfAv3RD4ZUw/bz9iayOfyYZwRic
 sMYxqtJgt32nl5P6+nXRyj0YqIXmG5/Byvfe6gt5CmESMsfL19EL9YREwtjJkydDwVf9
 s+BjIPSFJ+zZAeYoZrZp6Xu2ChjuD7S9zQ2Rd6jEc3C29Tob3rCBiM7eamIFLRlYy0gR
 oT+QYF4XTXfAIGk1Pv7ptIOeq0QqEvjBw5n1DXOSaKEjY8vklVwnz0yx38Z4vtQ9xaDn
 J374zVIXEtc8QMUjHQEb34X5dRoN57rU5N+TzU0d08gh0gSohW5yyaOQTbeTJSE49Nfy
 vPNg==
X-Gm-Message-State: AOJu0YwaoHyU135l5yMUDZ3VnoChK4l+F+GC2hhEY8GXggICe0oHTDT+
 QMUfi6848gMxjfIBBQ8/SUFs/TJchjfjsU4DJLazX29kGIOCYVUUg63vMNrLAO8pusA=
X-Gm-Gg: ASbGncsBUu2WblTcZNiwfNGg6vZMADxXnbkng/Sv6yJX7rgF0Y8J4UOk9mtG1fr3JNt
 CUX72qAx8eku9hpdYSSPj7KYy8rNqYPTJvMt8a+VyhSKZyzMSavArlThgr69+60sLZ0INY9O62v
 qr01C7fNFvGbVkDDx2+ZhuUXuBwO6JZhVOKf1KX78vzpgvUoQv1jAxIPi4qJIJ7ZNsX9erFMOyt
 AXOXBtvzbIbCFtAmZbYHkFK488bNTTmnThfejChMy7YkM8ryNBMqVHkRwWlUrjGSOTdyCAEePj6
 P/741hy6Hi6gp9h5e5bwd+GzxNFRGO3iL7Cu6gp1EbSCFretMI7lmO7+EMW/9EZOea1zhxtSQsB
 GHqMmYcK8mIi+Dmri9VxIqs9mn3aodhk8AO57x94SjqNKaPHMa+P+9qq0
X-Google-Smtp-Source: AGHT+IEAc4GvzAL0dv6Msuxwa3X4zbXmrRXsmweaAEN2LppmiCVAAL0iVf0LqYNHR2xRWG/nrI84Bg==
X-Received: by 2002:a05:6a00:464e:b0:780:fff4:f7db with SMTP id
 d2e1a72fcca58-793874402c2mr5837938b3a.15.1759960796805; 
 Wed, 08 Oct 2025 14:59:56 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-794e1fc9db6sm740724b3a.66.2025.10.08.14.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:59:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 64/73] linux-user/aarch64: Allocate new gcs stack on clone
Date: Wed,  8 Oct 2025 14:56:04 -0700
Message-ID: <20251008215613.300150-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
index 56695de680..dffe6c2016 100644
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


