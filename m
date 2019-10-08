Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5442378wrm;
        Tue, 8 Oct 2019 10:28:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqygMKsPst5d3is2uoSCPLYg89mjoO5r673kUv6T0aoyMZsLgI8uhg7t2rCbOAW3sR7lyOla
X-Received: by 2002:ae9:f215:: with SMTP id m21mr30557437qkg.47.1570555698520;
        Tue, 08 Oct 2019 10:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570555698; cv=none;
        d=google.com; s=arc-20160816;
        b=NP1t5GQ+BXasNX+++2DzK9IRJ/aAH/VQ70QO/m2aB/9LlzSPkBTT7yFFkC7qz0HtQK
         mOp1taZUqpaY/63L3RBN+Dap9MOS66nfv1OqXn+PS/dYYnJGoUQAcVPYV1EjmKnniftR
         y07C2n+uBuMs9B+cBA+DOuQk8b2papxCmQJmgbPrQIDQ4wMdNXpwnVb7rUnNqbNWi8N/
         zvsQR9sfI54QKNBs9k00o2uLYf0lIDx8/P/xamTGoH8+p7RdV04RI48lCxilv94nEOUu
         Hyoxcninm8H2i8N2iDV9acbLXzm1VU/W7TK0m9VBzvJp4tvTM+neJKQpEvYwP6m/wdIR
         h1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AQvT9vDwvMSeUbPbD+uEtZfbrPLTNxo2MaS4CXHbEVw=;
        b=YK4m4BZjTcff6OgNdKJLfsSlginXNaadvp7aSnDAIW7m08w28oI+Mo6X4WDo2UWNC+
         DTVTIhDT/IhYw+fwzmVM2YmNAd6ZbPCiEMxNRy924eiNeyLabLEoF/Uyqocw19K27TJ9
         DlYvC+wQBQ25anqSJvvEKYPLlnruI5BgdpxfMevDczkubyv2JM0uWBWFujkRNO7VdE/t
         Ce4xcXoTSG8kuIObricHEZ0YKSdNodOScan0o+CGAip29cMBcP59tvGLLsJkg3SsHO+W
         fLJqyO6b/0bkfw+DfFnlKjLD+xEPUySWg/fqeLobfz8XvMY+o2tuFyXZnQi7wwm3pFAE
         s1+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ohhpWqFF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e52si17459961qtk.158.2019.10.08.10.28.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 10:28:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ohhpWqFF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHtHV-0008QV-6F
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 13:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48963)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7a-0006kc-Vg
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:18:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7Z-0002Lx-6a
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:18:02 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44077)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iHt7Y-0002Kw-Uk
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:18:01 -0400
Received: by mail-wr1-x442.google.com with SMTP id z9so20280108wrl.11
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 10:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQvT9vDwvMSeUbPbD+uEtZfbrPLTNxo2MaS4CXHbEVw=;
 b=ohhpWqFFQHiMPwr97FA20nrcPzPIFqpzJQCRvfq+vE/j6/3P2V2Uo3p6Boe6Hx1XqF
 2D7B4fwzZEuaoAF5c4DQl+ZUrPmDVBVHEQlYMXvj9am4n3vDfMRCbmDrBXdm/YLflYR4
 xudVSZ3HCJIl/DubdNsUMZGEpab3rRrxqHH30RUzQ5STZgNnD/m0oQd52sicnkpBk7fn
 rt/NDlxwRBiKa+1jTsy8vEqjIBqzi5Rb6Gpa8zLXcz15RVrzd0x0lud5J4aEXv5mPTEQ
 oUEIis7FsepQWO/cpdU0Fb+9jaSKY27oXX7GDOHPQO44syRoS4kcetQp7FL4B89kcm6G
 mmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AQvT9vDwvMSeUbPbD+uEtZfbrPLTNxo2MaS4CXHbEVw=;
 b=CCvsNnxvo985hvg9qagsta4CUCGrlNu9MAkQqePptH/gEKD5AK8Za1QSkWdJHwuZsK
 eYwpAhR7nSOO5RQ3PPgp+q2YbItM5gknTuod0Jnq1UwVYJMwTssxFJs8tdBwxXRWJe8b
 AbjAJ33f/axne+XknX/a+HpyqIl5T5qfsu9y0OlEawC1ztgKFkm4+08WGem03jp3KRq5
 /gpgm2fDrF4VsD2gDUmrrymCN0ZUyuDpyE/gJSpStfWwuHvV9YJlZj6Yv3eqGgUyJtdf
 Hd6ovdKKWGV95i/z9hK7iT+VFzVPBy6aeE53M+m9FReV01pU5u0dEC926f6OawYxamw0
 E4Vg==
X-Gm-Message-State: APjAAAUBQCe1pTUe8ERcAaXynb40Bli4RQ+2VevV31t26cVnTtyae6Sx
 ti6hAKINM++FhpG4Pi6rl31uX90gkr+FYw==
X-Received: by 2002:a5d:574f:: with SMTP id q15mr16258203wrw.362.1570555079030; 
 Tue, 08 Oct 2019 10:17:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z9sm19135541wrl.35.2019.10.08.10.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 10:17:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 12/21] hw/timer/exynos4210_mct.c: Switch LFRC to
 transaction-based ptimer API
Date: Tue,  8 Oct 2019 18:17:31 +0100
Message-Id: <20191008171740.9679-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008171740.9679-1-peter.maydell@linaro.org>
References: <20191008171740.9679-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YjmfbD37TwzR

Switch the exynos MCT LFRC timers over to the ptimer transaction API.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/exynos4210_mct.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index fcf91c75cc5..82803ef9a02 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -608,6 +608,7 @@ static uint64_t exynos4210_lfrc_get_count(Exynos4210MCTLT *s)
 
 /*
  * Set counter of FRC local timer.
+ * Must be called from within exynos4210_lfrc_tx_begin/commit block.
  */
 static void exynos4210_lfrc_update_count(Exynos4210MCTLT *s)
 {
@@ -620,6 +621,7 @@ static void exynos4210_lfrc_update_count(Exynos4210MCTLT *s)
 
 /*
  * Start local FRC timer
+ * Must be called from within exynos4210_lfrc_tx_begin/commit block.
  */
 static void exynos4210_lfrc_start(Exynos4210MCTLT *s)
 {
@@ -628,12 +630,25 @@ static void exynos4210_lfrc_start(Exynos4210MCTLT *s)
 
 /*
  * Stop local FRC timer
+ * Must be called from within exynos4210_lfrc_tx_begin/commit block.
  */
 static void exynos4210_lfrc_stop(Exynos4210MCTLT *s)
 {
     ptimer_stop(s->ptimer_frc);
 }
 
+/* Start ptimer transaction for local FRC timer */
+static void exynos4210_lfrc_tx_begin(Exynos4210MCTLT *s)
+{
+    ptimer_transaction_begin(s->ptimer_frc);
+}
+
+/* Commit ptimer transaction for local FRC timer */
+static void exynos4210_lfrc_tx_commit(Exynos4210MCTLT *s)
+{
+    ptimer_transaction_commit(s->ptimer_frc);
+}
+
 /*
  * Local timer free running counter tick handler
  */
@@ -981,9 +996,9 @@ static void exynos4210_mct_update_freq(Exynos4210MCTState *s)
 
         /* local timer */
         ptimer_set_freq(s->l_timer[0].tick_timer.ptimer_tick, s->freq);
-        ptimer_set_freq(s->l_timer[0].ptimer_frc, s->freq);
+        tx_ptimer_set_freq(s->l_timer[0].ptimer_frc, s->freq);
         ptimer_set_freq(s->l_timer[1].tick_timer.ptimer_tick, s->freq);
-        ptimer_set_freq(s->l_timer[1].ptimer_frc, s->freq);
+        tx_ptimer_set_freq(s->l_timer[1].ptimer_frc, s->freq);
     }
 }
 
@@ -1012,7 +1027,9 @@ static void exynos4210_mct_reset(DeviceState *d)
         s->l_timer[i].tick_timer.count = 0;
         s->l_timer[i].tick_timer.distance = 0;
         s->l_timer[i].tick_timer.progress = 0;
+        exynos4210_lfrc_tx_begin(&s->l_timer[i]);
         ptimer_stop(s->l_timer[i].ptimer_frc);
+        exynos4210_lfrc_tx_commit(&s->l_timer[i]);
 
         exynos4210_ltick_timer_init(&s->l_timer[i].tick_timer);
     }
@@ -1316,6 +1333,7 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
         }
 
         /* Start or Stop local FRC if TCON changed */
+        exynos4210_lfrc_tx_begin(&s->l_timer[lt_i]);
         if ((value & L_TCON_FRC_START) >
         (s->l_timer[lt_i].reg.tcon & L_TCON_FRC_START)) {
             DPRINTF("local timer[%d] start frc\n", lt_i);
@@ -1326,6 +1344,7 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
             DPRINTF("local timer[%d] stop frc\n", lt_i);
             exynos4210_lfrc_stop(&s->l_timer[lt_i]);
         }
+        exynos4210_lfrc_tx_commit(&s->l_timer[lt_i]);
         break;
 
     case L0_TCNTB: case L1_TCNTB:
@@ -1477,11 +1496,11 @@ static void exynos4210_mct_init(Object *obj)
     /* Local timers */
     for (i = 0; i < 2; i++) {
         bh[0] = qemu_bh_new(exynos4210_ltick_event, &s->l_timer[i]);
-        bh[1] = qemu_bh_new(exynos4210_lfrc_event, &s->l_timer[i]);
         s->l_timer[i].tick_timer.ptimer_tick =
             ptimer_init_with_bh(bh[0], PTIMER_POLICY_DEFAULT);
         s->l_timer[i].ptimer_frc =
-            ptimer_init_with_bh(bh[1], PTIMER_POLICY_DEFAULT);
+            ptimer_init(exynos4210_lfrc_event, &s->l_timer[i],
+                        PTIMER_POLICY_DEFAULT);
         s->l_timer[i].id = i;
     }
 
-- 
2.20.1

