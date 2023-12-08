Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2255789ejb;
        Fri, 8 Dec 2023 03:36:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESN7bLTwnz2N2q3E+A1HI8L0ZHU2vj9NjkyTDZVJ2S2//+xg5mjKBFvCGjEQBgG3i8gEjc
X-Received: by 2002:ac8:7dd5:0:b0:41c:bad9:6045 with SMTP id c21-20020ac87dd5000000b0041cbad96045mr4889991qte.14.1702035417013;
        Fri, 08 Dec 2023 03:36:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702035417; cv=none;
        d=google.com; s=arc-20160816;
        b=Zlnllj3/E8O5g5erVZlqanvMGaRGeTEfajUW0LbQLMluRaj2cYLeQ+2ex5BjtaxALD
         283g0Dm7DdWVt52IXTA3+h0ATHO55zjJbHhl3H/UU81TpkoSEIM+vjIFUNK4LwsApdHx
         2hGhJTY5g4I8NOeREqdn3GgknvKjmbkGqfex9z3k5jXZ2IKrwzXjx/xgAa9vOlYIaB8I
         3v60+B1D9JgKB3esCQepiDqcDgpImlpmypjakHy62WK9V7ezfXy7I7+ZRjIjsW0qn9bD
         6ZrjEuXJZqhQfGiqKtXUER8us7G2s5FQcFTRSttDwh/LA4F8gk8bvV8kTAzCNafBCLTh
         LVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VVurd634A6d7jfTmu56SsLNYdI1euektVunJFK5bAB4=;
        fh=QdevGGL2LydCvB/btUcdJnXEA7h6h6ICE8REXL8PVZU=;
        b=AokZcJTt8/9YwQ2PDUprVhBI74upS8Yghg2vqaOE9VnZ+lFeStvXjRhHhcTkFgnUBi
         egLZgpbqE5EODizn0fEftSXoj70vfdSGQaRPfEDp1acFvmeuasjMlyxj+mPqt5YQs+G2
         leOTZZDbZso6QxypuHuWfFVFcBXAakcQlSYvmSHZLVEN7i2qTTe2XiZnIrRaMxUCXeuJ
         1X4lgIFABgQnRYaw4YvsURMaqOOZDf/W5/YjV6wE5IB9hPxFY2bjChxtYYZCaPs87QIr
         3NB9ECXoskjKBXRkBql8Ut9s97nj8t6nZ1nnlbLarVIkq2LxSF1t1M749fB27ETQ0sNM
         +dFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mETiaTtk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cm9-20020a05622a250900b004254a8e613asi2202300qtb.667.2023.12.08.03.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Dec 2023 03:36:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mETiaTtk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBZ9L-0004JL-Gs; Fri, 08 Dec 2023 06:36:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBZ9J-0004Dh-Oj
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 06:36:05 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBZ9I-0004TE-5q
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 06:36:05 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3333224c7b9so1888699f8f.1
 for <qemu-arm@nongnu.org>; Fri, 08 Dec 2023 03:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702035362; x=1702640162; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VVurd634A6d7jfTmu56SsLNYdI1euektVunJFK5bAB4=;
 b=mETiaTtkWBmuG4oPJMm+dKQt6UqhhzDCzBH/UTajH+ubYJOSDnNHWRkXDJnLCsBhkV
 My1ILds0NK5V4u3n9Gin+Sk/xzsZ/Bib8zf77cYeg4xofFWzf57TtR0hQz3HY2YyHdeq
 uhqkR9vbjy6IM/nP2DsQyMcNlad+HksdKCWllIDVM/0mlKeB/lGDtyX0057jCE2+a/Fs
 iTWINlYhxHW0m2DQilLaOcic+UUt7A5wrkRWNZH3+fGNxkFEomPR5ip/Nxgi7frfI13H
 SNZwruHuzgqkBDA+J3p8M1KJdDqMeCux6RUgwC5RvE2tk0uz9OihyFWmoYYSxpDBVTQF
 dkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702035362; x=1702640162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VVurd634A6d7jfTmu56SsLNYdI1euektVunJFK5bAB4=;
 b=VuaWUW+wZB6gmJTsmewMVkzNRB4EVxrti00P0NPuAflRj2JE+05XI5IkRNhqvfdhq4
 K5TiAj+7klYjWUYDSL7w8Aw4bjN3dUs4QC5M56Ru0MU12/nwEarv/+p5iYzHHazt0S4r
 7TktCUpGCS43dz++PuLoU/JbSaVAEt9hMdprP1xQOlHYBGzZq26+GoyK+XYxIfYP9/j6
 t3FXsAA4c68LRYmWmLbRcsoIJ1HrJKcQd2nXQXPGmn/tFGTgEEGIXYlcfClfQHOlimwY
 eaOUjvp9yGY0XmtR/UwsbBfC1DLDOafV42VGztk+za4mhses9EGg8osF9XotNrShp7py
 0bSQ==
X-Gm-Message-State: AOJu0YyR9p6eumVTZHic/BCC5/j90UqRrpcY6t2h6kD5yrAogPOfgNeo
 1CcYol2kG+fcSAWFp5GOfC++YA==
X-Received: by 2002:adf:fc52:0:b0:333:2fd2:68d3 with SMTP id
 e18-20020adffc52000000b003332fd268d3mr2309689wrs.102.1702035362697; 
 Fri, 08 Dec 2023 03:36:02 -0800 (PST)
Received: from m1x-phil.lan ([176.176.146.181])
 by smtp.gmail.com with ESMTPSA id
 q18-20020adff952000000b0033609b71825sm1357263wrr.35.2023.12.08.03.36.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Dec 2023 03:36:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Fam Zheng <fam@euphon.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 5/6] util/async: Only call icount_notify_exit() if icount
 is enabled
Date: Fri,  8 Dec 2023 12:35:27 +0100
Message-ID: <20231208113529.74067-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208113529.74067-1-philmd@linaro.org>
References: <20231208113529.74067-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: jttlQDcjP0MN

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/icount-common.c |  4 +++-
 stubs/icount.c            |  2 +-
 util/async.c              | 16 +++++++++-------
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/accel/tcg/icount-common.c b/accel/tcg/icount-common.c
index f0f8fc7f1c..a4a747d1dc 100644
--- a/accel/tcg/icount-common.c
+++ b/accel/tcg/icount-common.c
@@ -495,7 +495,9 @@ bool icount_configure(QemuOpts *opts, Error **errp)
 
 void icount_notify_exit(void)
 {
-    if (icount_enabled() && current_cpu) {
+    assert(icount_enabled());
+
+    if (current_cpu) {
         qemu_cpu_kick(current_cpu);
         qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
     }
diff --git a/stubs/icount.c b/stubs/icount.c
index 7055c13725..b060b03a73 100644
--- a/stubs/icount.c
+++ b/stubs/icount.c
@@ -37,7 +37,7 @@ void icount_account_warp_timer(void)
 {
     abort();
 }
-
 void icount_notify_exit(void)
 {
+    abort();
 }
diff --git a/util/async.c b/util/async.c
index 8f90ddc304..9007642c27 100644
--- a/util/async.c
+++ b/util/async.c
@@ -94,13 +94,15 @@ static void aio_bh_enqueue(QEMUBH *bh, unsigned new_flags)
     }
 
     aio_notify(ctx);
-    /*
-     * Workaround for record/replay.
-     * vCPU execution should be suspended when new BH is set.
-     * This is needed to avoid guest timeouts caused
-     * by the long cycles of the execution.
-     */
-    icount_notify_exit();
+    if (unlikely(icount_enabled())) {
+        /*
+         * Workaround for record/replay.
+         * vCPU execution should be suspended when new BH is set.
+         * This is needed to avoid guest timeouts caused
+         * by the long cycles of the execution.
+         */
+        icount_notify_exit();
+    }
 }
 
 /* Only called from aio_bh_poll() and aio_ctx_finalize() */
-- 
2.41.0

