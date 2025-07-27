Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EF3C87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:09:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwRF-0000Lq-0F; Sun, 27 Jul 2025 04:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPo-0004D5-7B
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:28 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPl-0004tM-7N
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:27 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-b31c84b8052so3968193a12.1
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603644; x=1754208444; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5D3UspdEe2Gt+MgZasHPlZJNZ0zbIXOmWsb4P6ImjX8=;
 b=K/Nj4KIwLSoysZurfKhYhSa49tVgYRYlPYPhzzIeMvnvBBRyvnprB0pItd/Lhxr5gb
 yg0aRKbKmNhGqU5p5L2CWeB49FEJl6gBbtFAM9yXgjZVLvzii7prZhmpepVHQtmW1UuU
 jzgCTDSiAiLyulH0tiwMjIiOPGAfsulwezYUNpp+xhX8ACsPF0f0JN8VDr2kqkjWt+y3
 zJt1jo+TuUBhqarWXOCjtMBMVbq4Rd2iKFFibh9EwRYHgIpSsoxHf7MMbiWrJhx7fFXD
 yjw1JO804pyu+h4OqNeyCGdcl9Lm0B2d1h5opzTeQq1UxujsIeULmyMHbkT/gFJ59Ld6
 LPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603644; x=1754208444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5D3UspdEe2Gt+MgZasHPlZJNZ0zbIXOmWsb4P6ImjX8=;
 b=OJovQEGgkbuSbljrCVh5iUkzy4nKJBfzHxeOabGtXRJxwBmhur/b2fthI/nBrxLwxy
 bmTN9yBcXxSC2a8Xf7aUmLkEt2Vvn2j8F93haLXGUeKxgdWqBVBEZHOzHOv9unYrnztg
 Uyu9EEuxHQVY4i01f/7n6iaD6yUXITiCojxKZh9/Vxb6yiTwT8MyZrf9layxGGvyCdq0
 ByIodOU0eYRVfGNPRwZmXQiIYmf3//QWnU2cQiIYPjBS5Km7xpso4cMJEYtVdsSo6YNu
 KNRKETyRNsrEcu5XIbGaXsw+HbgtX5gmbJJHBSICjCQomrxEMXcJQEYT0FMaBsy1eRb/
 AgHQ==
X-Gm-Message-State: AOJu0Yw2fA6PP1yJnqrSfV8RfxmW9tqLKycHIvTd0aIoHlRJNGv5GFlu
 w0BtR3zmb/WremjhpSIm4Qf4KgENaw7ahZNa6Mr4morpqZl7rJsMtMTmhNDgb6EcYpMzqpyl2ax
 1H51V
X-Gm-Gg: ASbGncu5kJfNRAbw0D3rhPkA+tTgfMH3PgJ2kdIuA7Z2zQdlR/nShJ4+VfZWkokDa5j
 HYHC10jaJgF4SS1LSOdi7gFPM46XCugnzEEHrbJSfIRNPcsJrB0rHHnY2Ov5VgZZEPOaXCB1rhF
 4Wc8DzqNbbwHJh1BlIyQTdfWiMM192KTMpH8lzmXVZvs9aGyRWVFhIYXapdHCji4Y4Fj44g8zas
 eriHEgkB2tWb25l6jKrqsritaa9RMqaklXv6M5CXZUCbvaUen4Y/C6cD00d5O3G3x7Do1qK7Hrc
 HDyWnYFBJvYEK4ivS8McpJpqc0cFwXsdcauvcZiE5m5vFchmkchfGuhEUPwiOMXWmqrZO4rNoXO
 pQJubZJKm0135ZcbzAuWpdY/Pz178T8P6sW8azTgiVymTjavnI650iUy1pWNNCXAkKnJ2t1cNxE
 e/lMXEQeud80af9Y9z2/au
X-Google-Smtp-Source: AGHT+IGyTDU/O5hjh3VufwX2Pxw3M9WK5I9tTZbR5Wv9jWSYX+7gy2Xl8Rqzgu3eutA5ttt1urcAiw==
X-Received: by 2002:a17:903:2b10:b0:234:f1ac:c036 with SMTP id
 d9443c01a7336-23fb31c4de1mr129393425ad.50.1753603643705; 
 Sun, 27 Jul 2025 01:07:23 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 72/82] linux-user/aarch64: Allocate new gcs stack on clone
Date: Sat, 26 Jul 2025 22:02:44 -1000
Message-ID: <20250727080254.83840-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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


