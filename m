Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2255594ejb;
        Fri, 8 Dec 2023 03:36:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOknHswldwyCXW4oRGUNCS2KDexpk0DreHOHvnGzsi1ddL2nbvw0IUWuWzeWpUgPM4yp8p
X-Received: by 2002:a0d:db0e:0:b0:5d7:1941:ac1 with SMTP id d14-20020a0ddb0e000000b005d719410ac1mr3851939ywe.92.1702035387731;
        Fri, 08 Dec 2023 03:36:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702035387; cv=none;
        d=google.com; s=arc-20160816;
        b=qfoFvbw8jzjEUiUZySGnwAuHNj/I5NGdg6VNAskQ7hACtCOKnPCVnIBH9Zo7ArASvH
         CA7Eq6IQoaUEhcaKNOvPEeQJCfzijAnfVGyIZppMhbMvSBat8rKCEh209DJlJ0O0Y+sc
         BL/G5u49UuaODoutj9G8HZQeJ3pRdrnDAIxahoitGa3bgIqwp4pyie5Fn9XuwlFPQiKo
         r+RPJjeCTwbpITJAFZB3NH9nQP+w6cDpWI1rvrRQmmxD+Pdj9plU7+i9CfdwaVtUmtYQ
         B1A0QEblc/9MRJOXVW20qaoLE9MM0ulYT7Jqpf3jz7g1gvfC+hbuqWcWJXPW/o+Fb0Nq
         ISjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QIk3tQ6ySkCzXvhu4fvVzI666gbM4pnzLPnY/8QAtQ8=;
        fh=QdevGGL2LydCvB/btUcdJnXEA7h6h6ICE8REXL8PVZU=;
        b=pAgYlGyx5bCq/FCU6RR2RZ/rfSt6DrtZpu8dcuXmAFh00ge70hgl0HKwtI+XsbkJ1M
         LNA9d/cOkmRVQDJtTJE7WPXcLge/i1HMnDTTDzBaHNfOT1jS8M2hUG10yoRzDA5AEcUR
         +RzOjv9CPV0b/VHrfH2EW6kSMbkoDi1Vcl62wB482BFkYz2hTjGFrYuoq3FN82W5mhgR
         i3RQoEpqeHmP0t6vTAGxo4xp3yJXD30gnFUlRasGtsEZTh5wM5/PJ48oz7FWnN1Tq2gk
         kRckOItzozY0l719oMcs43ZEA7RwqZp+ItAfrTWlW5d5zXaS73hJL+4pJNJ4yWvO6ibw
         NXcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AP4J7T0M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8-20020ad457c8000000b0067a51b9bd6csi1968574qvx.108.2023.12.08.03.36.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Dec 2023 03:36:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AP4J7T0M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBZ9S-0004al-4G; Fri, 08 Dec 2023 06:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBZ9P-0004YI-U3
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 06:36:11 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBZ9O-0004hU-4N
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 06:36:11 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40c2a444311so18305165e9.2
 for <qemu-arm@nongnu.org>; Fri, 08 Dec 2023 03:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702035368; x=1702640168; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QIk3tQ6ySkCzXvhu4fvVzI666gbM4pnzLPnY/8QAtQ8=;
 b=AP4J7T0Mw7X/AahUirC0GLGYq1AuMfv0cQcLcCnoD8VUfsL161OjVEezJxCyyq8WS4
 3xEnMsrSsOBEbg2Zxnt8/lo3yz3wmCdilaXLnM7JGHyMz9j5LAyw+OJnb+RXs6MTMOCt
 nNID7ngH0TrZj1ldWXA9oDvhoom75osvTwlo7r6lXUKhJKYfrlr9aDILqArBFNMr0Ad8
 32joTRKlGWJmXn1CoX1TlEw1as3v6Ph+6fUNNh06mSonnpk24FjOqNPIyqkqkoUZY89d
 32F2Z1ZkW6aMRVwFLJJtrFdhTeNvz0IWXfSjT8Bjye+KcGHcbhqusIYL9pjtT9WJ3ch9
 2MeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702035368; x=1702640168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QIk3tQ6ySkCzXvhu4fvVzI666gbM4pnzLPnY/8QAtQ8=;
 b=k2+G+6J8+x3iyZSAw9Y6KEw0i6q2YzdeAd3g1sQL/LueU5X31YWoQBA9ifohV+Kvw8
 oPwrJGGfk5NIVNOFFFbAk/tGizZtK13M6bfGaXMcP312002FkTyVtn8FEg/piCblw8XI
 6lF2psj1JGyzTmgWT2HaM7I5au/mQno4I9Vtmc1p7m6Zn60BEty3gDfeLAJ0JRYtB1Po
 a9l2VNcUaTSktd+pXq8KJBNjF0yiodUWz8LbyM6zb52B2gYmNi2AKRZ15NeQ+Sw4VtXZ
 u1t9dvYzRUprC5P73qn1tHQpYMwztMY72e8gZ8K1O51hz5IQDyKGl9Pp9AhY9h3PzWR4
 vtrQ==
X-Gm-Message-State: AOJu0YwMEqV6Mhc0lnyIhpgcbgaKjWRv4ZI7aWyariCEB4yuvExtPTt7
 Grn3MSmxrnPgvyqP6kHXu5XLpA==
X-Received: by 2002:a7b:ce0e:0:b0:40c:2205:e5ff with SMTP id
 m14-20020a7bce0e000000b0040c2205e5ffmr960841wmc.297.1702035368514; 
 Fri, 08 Dec 2023 03:36:08 -0800 (PST)
Received: from m1x-phil.lan ([176.176.146.181])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a05600c46c900b0040b347d90d0sm4877337wmo.12.2023.12.08.03.36.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Dec 2023 03:36:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Fam Zheng <fam@euphon.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 6/6] sysemu/replay: Restrict icount to system emulation
Date: Fri,  8 Dec 2023 12:35:28 +0100
Message-ID: <20231208113529.74067-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208113529.74067-1-philmd@linaro.org>
References: <20231208113529.74067-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: +GdVfkftNu3/

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/cpu-timers.h |  2 +-
 include/sysemu/replay.h     | 11 ++++++++---
 stubs/icount.c              | 19 -------------------
 3 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/include/sysemu/cpu-timers.h b/include/sysemu/cpu-timers.h
index 3f05f29b10..d86738a378 100644
--- a/include/sysemu/cpu-timers.h
+++ b/include/sysemu/cpu-timers.h
@@ -30,7 +30,7 @@ typedef enum {
     ICOUNT_ADAPTATIVE,
 } ICountMode;
 
-#ifdef CONFIG_TCG
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 extern ICountMode use_icount;
 #define icount_enabled() (use_icount)
 #else
diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
index 08aae5869f..8102fa54f0 100644
--- a/include/sysemu/replay.h
+++ b/include/sysemu/replay.h
@@ -1,6 +1,3 @@
-#ifndef SYSEMU_REPLAY_H
-#define SYSEMU_REPLAY_H
-
 /*
  * QEMU replay (system interface)
  *
@@ -11,6 +8,12 @@
  * See the COPYING file in the top-level directory.
  *
  */
+#ifndef SYSEMU_REPLAY_H
+#define SYSEMU_REPLAY_H
+
+#ifdef CONFIG_USER_ONLY
+#error Cannot include this header from user emulation
+#endif
 
 #include "exec/replay-core.h"
 #include "qapi/qapi-types-misc.h"
@@ -79,12 +82,14 @@ int64_t replay_save_clock(ReplayClockKind kind, int64_t clock,
 int64_t replay_read_clock(ReplayClockKind kind, int64_t raw_icount);
 /*! Saves or reads the clock depending on the current replay mode. */
 #define REPLAY_CLOCK(clock, value)                                      \
+    !icount_enabled() ? (value) :                                       \
     (replay_mode == REPLAY_MODE_PLAY                                    \
         ? replay_read_clock((clock), icount_get_raw())                  \
         : replay_mode == REPLAY_MODE_RECORD                             \
             ? replay_save_clock((clock), (value), icount_get_raw())     \
             : (value))
 #define REPLAY_CLOCK_LOCKED(clock, value)                               \
+    !icount_enabled() ? (value) :                                       \
     (replay_mode == REPLAY_MODE_PLAY                                    \
         ? replay_read_clock((clock), icount_get_raw_locked())           \
         : replay_mode == REPLAY_MODE_RECORD                             \
diff --git a/stubs/icount.c b/stubs/icount.c
index b060b03a73..9a29084ecc 100644
--- a/stubs/icount.c
+++ b/stubs/icount.c
@@ -5,30 +5,11 @@
 
 ICountMode use_icount = ICOUNT_DISABLED;
 
-void icount_update(CPUState *cpu)
-{
-    abort();
-}
 int64_t icount_get_raw(void)
 {
     abort();
     return 0;
 }
-int64_t icount_get(void)
-{
-    abort();
-    return 0;
-}
-int64_t icount_to_ns(int64_t icount)
-{
-    abort();
-    return 0;
-}
-int64_t icount_round(int64_t count)
-{
-    abort();
-    return 0;
-}
 void icount_start_warp_timer(void)
 {
     abort();
-- 
2.41.0

