Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2156476njc;
        Mon, 22 Jul 2024 14:46:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXab+WciQKAAhSbxY+cQqD0InVIVFRBsZ5nxM9tJEy8TwdJ91EmdW1Wo4es4MzcK2lyeFeuQMVH99IJPda9kElkMf05pwb1
X-Google-Smtp-Source: AGHT+IHOwlIFXGnfpzJmAYVyP2ZuU7zr+3pS/jn+hjWF+SGHNNkK9sWgX3jEjvjIxXQ45LXawC2T
X-Received: by 2002:a05:622a:1188:b0:447:d7d8:1150 with SMTP id d75a77b69052e-44fc557b2c5mr14756451cf.41.1721684817661;
        Mon, 22 Jul 2024 14:46:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721684817; cv=none;
        d=google.com; s=arc-20160816;
        b=il0FUg0lrPu1Fh/m6CKpG0cOGNfY2rnyEg1/8F8s1PFFvDMG3G+iXAuveXM9WsZGf7
         RYdxGhgXyw/RDpT5w3yKSjdo71xVfy26pOhvdmeUUjTgoCaQHNfvITVH0LyR7R7aDOp4
         KlhxEju93q6CrGApz3cGvhKEwfWAN6lHk7yJ+meVzpzAlQB4Yz9i6MruQGvOvRfQ3sIW
         fm/D/20IxxsKakr+TkJSOB6RRqY2NxO4RLlGNBWuHgvqYW1b4xmRfFy1NZPtFpC9tOJY
         QW2krWhvB9VLFfc/p+dtguie+rrOx6lg3np9ig3BMHgT6wqJQsdZbUSYHyg42C896pYT
         GlFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aHdwiFgOy2Fjg9UYOTxrcvwQ73WzjeLsq+08Td07FKw=;
        fh=VizMbBXo3zTCIbP61wDhuWt2TpVZIrc7zks/FXTTPmA=;
        b=yAgdvO+1tKZG9j7IDMOe4BjLs474mGkBiAgtmdnQ86yj47B5MSaRIzgoiXizHR1And
         HjHodNMIrfBE7eyNuBEnnsQxjtWH7ClnyIkn1NAPguczKQ2Ro0f3vSnmTQFXXvmX8NKz
         crcIb0YNGNJo80KSg6e0y9cpU8VfWEa7VF1gRnSepyDuQwLi2Xo1Z1YJ8U2K5oYI3aju
         QtO/F3DW4wnyeIzaP08Z4jPDUVOa0gLkyOwXBMun0X/karHYTF4sXRrbwyQqxmikPCXP
         /3oNLnrQb1Ve+/qG68wQ6XDKxKM1SkD6mKIqT4dYKlh7858owSZFLWKFH0VXrzYhOoLS
         kZIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=KPevLR8K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9ce041e5si89636161cf.610.2024.07.22.14.46.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 14:46:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=KPevLR8K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW0qU-0006yZ-6c; Mon, 22 Jul 2024 17:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sW0q3-00059d-0Z
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 17:44:59 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sW0q0-0004Lv-6P
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 17:44:58 -0400
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-8036ce66134so187984739f.3
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 14:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721684695; x=1722289495;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aHdwiFgOy2Fjg9UYOTxrcvwQ73WzjeLsq+08Td07FKw=;
 b=KPevLR8Kw4G164GOnNtCGX1RWEy1dsq8PUT327Xyx6s4tFHQlpVPFH4XIIPX/heX24
 WXLvuyk3IeLSPwcedL/yUWVZIoH8daWF48nGYuisqLpxZbaIrzcvUIOs29ZYSafonNmy
 TttxDCChL0dOgwzoLi1Gkyggtnus+6nZmOaeqX8UK24Ar/K0MCylm+YfOqGkcA7omcP9
 0c1cSK/3zhDhVYXivvajBb+4mlsS+SEcfE0DThdsHk9jd043ulIljrVZzr0gBh/T2Cb0
 PhD36ghsItzQazl22gT3/GJHKQsjqd5wZ8C3Mj+9l4J9TOxWVyD515wvo677PnOJ7+I5
 8LeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721684695; x=1722289495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aHdwiFgOy2Fjg9UYOTxrcvwQ73WzjeLsq+08Td07FKw=;
 b=g+CbnKmajFEVAU3lieS7Y4fJhkNMLKlawdnFIQ5SbEFhja3KJyJ5+RYcTDdLpQsRRZ
 NmSvxcO//16Jmf0J9KEIHWc02BZKlNYVTYgr/P/rhjRV6vG+Iq6xEwpBYEyBslqjkG1G
 1XaV7bwjpbhgXPSwnW+L6LZimR5mm4omO8Iteh1MqOaGmP4uCKWji447b1YL34LNVfLw
 FD/yxmfv0Ochntc3fbRb2l9/aDVgdVycOBfmtf3efb0S5XF2ncvZ5PorElAxFdzjnKrO
 8zF+BpiPpSKN0cIGfyv8ktgF7N83nf9jK/KWzYpNDkJMyvWwqwpP9ryTmuYzXtTcjkkC
 pFHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQgWB9WJTucIVlqr0ovgZDI9Eb8YLC1dCp9XqYBBzXWPdIqrcmVH+6j+Zy+H8HARJOhoaJdbfX5LCGoPJUK+xuiEUl
X-Gm-Message-State: AOJu0YzVFA3TZ6SoodUQNJXXzWmO14YCvaq15jv/PLVy0fmA34VtFRCb
 sALM4PVW9CDgJ8rGpd5xTsF2s/DRaCV1EYGJWQqyy6umhxz31PPfI4/Cz5kV+HI=
X-Received: by 2002:a05:6602:3fc1:b0:807:82c2:5247 with SMTP id
 ca18e2360f4ac-81ea3573c05mr132581439f.6.1721684694897; 
 Mon, 22 Jul 2024 14:44:54 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c2343d2ff3sm1816830173.128.2024.07.22.14.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 14:44:54 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH 11/14] bsd-user: Sync fork_start/fork_end with linux-user
Date: Mon, 22 Jul 2024 15:43:10 -0600
Message-ID: <20240722214313.89503-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240722214313.89503-1-imp@bsdimp.com>
References: <20240722214313.89503-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: b1YvsZq05ENP

From: Jessica Clarke <jrtc27@jrtc27.com>

This reorders some of the calls, deduplicates code between branches and,
most importantly, fixes a double end_exclusive call in the parent that
will cause exclusive_context_count to go negative.

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
Pull-Request: https://github.com/qemu-bsd-user/qemu-bsd-user/pull/52
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 82e94a03160..6d81452e51a 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -35,6 +35,7 @@
 #include "qemu/path.h"
 #include "qemu/help_option.h"
 #include "qemu/module.h"
+#include "qemu/plugin.h"
 #include "exec/exec-all.h"
 #include "user/guest-base.h"
 #include "tcg/startup.h"
@@ -103,8 +104,9 @@ unsigned long target_sgrowsiz = TARGET_SGROWSIZ; /* amount to grow stack */
 void fork_start(void)
 {
     start_exclusive();
-    cpu_list_lock();
     mmap_fork_start();
+    cpu_list_lock();
+    qemu_plugin_user_prefork_lock();
     gdbserver_fork_start();
 }
 
@@ -112,31 +114,29 @@ void fork_end(pid_t pid)
 {
     bool child = pid == 0;
 
+    qemu_plugin_user_postfork(child);
+    mmap_fork_end(child);
     if (child) {
         CPUState *cpu, *next_cpu;
-        /*
-         * Child processes created by fork() only have a single thread.  Discard
-         * information about the parent threads.
-         */
+        /* Child processes created by fork() only have a single thread.
+           Discard information about the parent threads.  */
         CPU_FOREACH_SAFE(cpu, next_cpu) {
             if (cpu != thread_cpu) {
                 QTAILQ_REMOVE_RCU(&cpus_queue, cpu, node);
             }
         }
-        mmap_fork_end(child);
-        /*
-         * qemu_init_cpu_list() takes care of reinitializing the exclusive
-         * state, so we don't need to end_exclusive() here.
-         */
         qemu_init_cpu_list();
         get_task_state(thread_cpu)->ts_tid = qemu_get_thread_id();
-        gdbserver_fork_end(thread_cpu, pid);
     } else {
-        mmap_fork_end(child);
         cpu_list_unlock();
-        gdbserver_fork_end(thread_cpu, pid);
-        end_exclusive();
     }
+    gdbserver_fork_end(thread_cpu, pid);
+    /*
+     * qemu_init_cpu_list() reinitialized the child exclusive state, but we
+     * also need to keep current_cpu consistent, so call end_exclusive() for
+     * both child and parent.
+     */
+    end_exclusive();
 }
 
 void cpu_loop(CPUArchState *env)
-- 
2.45.1

