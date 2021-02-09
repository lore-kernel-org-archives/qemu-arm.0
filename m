Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp354910lfc;
        Tue, 9 Feb 2021 05:23:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFGOsNoor9Jr+lvztA+mpvm2ZWSLPxcwuqSua6z7qgaMxJf2Mo3WRz/evYqDxjr0Zd0VVy
X-Received: by 2002:a25:6110:: with SMTP id v16mr8458172ybb.435.1612876990107;
        Tue, 09 Feb 2021 05:23:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612876990; cv=none;
        d=google.com; s=arc-20160816;
        b=qZfC29w22SGl2bx4xkcAPi9sQFM3JKgb+DVd+Drd1iuNl3xzV/JSHaC+DpF1bm+vpY
         67bcm+RVqBvw18jrP9x6Jhm7xRx/lXftmZdRVVXnOg2mzurcGzcBX3tYd6LKqlkYbxqT
         4K4BABLpOnPFhAdPiB9lJ0I0Kghh82YEW0HPwkxAQm9og/OK4IJOy/OFWyPPamphhgAR
         34tA8uYvhzTYnlpSD288Tv9fAOXDyLAxlNHCfehiEDP2zKFehMC2LO6NJ4KauXxsqq5P
         oz0NwHyxu+IlGXsbZRhWUIiXJLaqJuXg9wf31hms7sG3eJyZiqPE5UOUBmo6j5/l3Ubi
         YKUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Rxyrp77KmAHOUvHPnjORQdoPirQElENHA7YXjs2ljS4=;
        b=C64Nx6UU7O4mKn7CC0RxFGL6j+XV9YblKvtvbEH3MEPwUQpC/4ssLeiAjiFLVFHdr3
         i48fcrGplJXvLyCqtNMQFWHZ08HGA8lN/ZJljz+aejDl6fArwgiYVZO+S0P08Z+sqo/u
         frRAOzrOhGbrG83P0CcHkAqi6lhJQjeTcTzYf77ENJKT7QlwRynguLguLdr6gXtBplL7
         OecKcM854ajmOEwxaL85Rl2QcGfXazmAUjukiBXqqkunsqpy5mNjpGvDCSzLdMhopLml
         tOhxbT01EjDB4wZH/HJ6bP0QzJrDYnZXSNCuw2O6dDHOLWCOc8oNmy4/EBY5CQ/kAVxc
         Dnrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ITaT59/2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si19671899ybm.220.2021.02.09.05.23.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Feb 2021 05:23:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ITaT59/2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9Syz-0003iy-Ga
	for alex.bennee@linaro.org; Tue, 09 Feb 2021 08:23:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Swt-0002ua-Qi
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:20:59 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Swj-0000kw-Cc
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:20:59 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l12so21740745wry.2
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 05:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rxyrp77KmAHOUvHPnjORQdoPirQElENHA7YXjs2ljS4=;
 b=ITaT59/2Agi28mJA6dajnkYezkweLT7DZBvipjA0e7HR2jgTChVcL1ruovowKjK9FM
 ir3iyPy0Ipwg0/KDLnE+2vH0lcqGPhMxzA7mISAMMwTn++03zahxcGcA6RzGrEVMOuUs
 FhkcnZSgMm/YFjYiCJI9HS42SWaF0nPpLvcojt3qstmCp1y6n7HKrqAg63KCycWy9Jnj
 anOO09XWlKhGK/eMPvl8eOGe0EptGjtmw6/5LNLv4IqBXWCUrySmjPmF5BDqNC+wbjU4
 kodHZr0pcr0ZVmqQyAn3n5D0bDgzf+5Mv6R/ppElDsOr7uu4P8ulPfc9hX/1O4qkTRzI
 CssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rxyrp77KmAHOUvHPnjORQdoPirQElENHA7YXjs2ljS4=;
 b=lPIBzFUmtMVL1E+uys6mcka2gMK0FnQOgcVkfZbaREX1dBOJ7fjO/iqXGaE5JA4zLr
 QSzBE5ky23PFWD331gnG/W79aA/3PvCwWpoQL9Exkh3K9Rd+vjb5AX4Ch4ovEX3SVB2V
 byXAuLUa3jf5SrPfy3wfYKxctMihoJdi3TVYqlvjvrvyfKOeO6wYeKFLPp7CTEYqKChP
 oBg21LVc9+3arwhZT9VW5CwIUu3hA9CropERqu3G9/rcYnRjUyoEC48e+VegOkB9WRoe
 rdg+mVPkvgIymHt/nsL9/oftl7XJiw3uGfzqpryoFMw/vhEDkBoHtISw9jk6jEmGxVgJ
 rJAA==
X-Gm-Message-State: AOAM532QKB5hGfevUtSRZ81Rz6q2lrmfzof1BlM5pGKzX7DMkV2asjEw
 5Q6EHMRhmoDVR1vR6nttucMrDw==
X-Received: by 2002:adf:f647:: with SMTP id x7mr24739995wrp.160.1612876846608; 
 Tue, 09 Feb 2021 05:20:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm34752472wrh.16.2021.02.09.05.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 05:20:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] clock: Add clock_ns_to_ticks() function
Date: Tue,  9 Feb 2021 13:20:39 +0000
Message-Id: <20210209132040.5091-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209132040.5091-1-peter.maydell@linaro.org>
References: <20210209132040.5091-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kT/0cSchmEUV

Add a clock_ns_to_ticks() function which does the opposite of
clock_ticks_to_ns(): given a duration in nanoseconds, it returns the
number of clock ticks that would happen in that time.  This is useful
for devices that have a free running counter register whose value can
be calculated when it is read.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I have made the overflow behaviour here be "wrap", with justification
as per the comment; but I'm not 100% set on this.
---
 docs/devel/clocks.rst | 12 ++++++++++++
 include/hw/clock.h    | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index f0391e76b4f..956bd147ea0 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -360,6 +360,18 @@ rather than simply passing it to a QEMUTimer function like
 ``timer_mod_ns()`` then you should be careful to avoid overflow
 in those calculations, of course.)
 
+Obtaining tick counts
+---------------------
+
+For calculations where you need to know the number of ticks in
+a given duration, use ``clock_ns_to_ticks()``. This function handles
+possible non-whole-number-of-nanoseconds periods and avoids
+potential rounding errors. It will return '0' if the clock is stopped
+(i.e. it has period zero). If the inputs imply a tick count that
+overflows a 64-bit value (a very long duration for a clock with a
+very short period) the output value is truncated, so effectively
+the 64-bit output wraps around.
+
 Changing a clock period
 -----------------------
 
diff --git a/include/hw/clock.h b/include/hw/clock.h
index d7a6673c29e..79c3b7ebe40 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -286,6 +286,47 @@ static inline uint64_t clock_ticks_to_ns(const Clock *clk, uint64_t ticks)
     return ns_low >> 32 | ns_high << 32;
 }
 
+/**
+ * clock_ns_to_ticks:
+ * @clk: the clock to query
+ * @ns: duration in nanoseconds
+ *
+ * Returns the number of ticks this clock would make in the given
+ * number of nanoseconds. Because a clock can have a period which
+ * is not a whole number of nanoseconds, it is important to use this
+ * function rather than attempting to obtain a "period in nanoseconds"
+ * value and then dividing the duration by that value.
+ *
+ * If the clock is stopped (ie it has period zero), returns 0.
+ *
+ * For some inputs the result could overflow a 64-bit value (because
+ * the clock's period is short and the duration is long). In these
+ * cases we truncate the result to a 64-bit value. This is on the
+ * assumption that generally the result is going to be used to report
+ * a 32-bit or 64-bit guest register value, so wrapping either cannot
+ * happen or is the desired behaviour.
+ */
+static inline uint64_t clock_ns_to_ticks(const Clock *clk, uint64_t ns)
+{
+    /*
+     * ticks = duration_in_ns / period_in_ns
+     *       = ns / (period / 2^32)
+     *       = (ns * 2^32) / period
+     * The hi, lo inputs to divu128() are (ns << 32) as a 128 bit value.
+     */
+    uint64_t lo = ns << 32;
+    uint64_t hi = ns >> 32;
+    if (clk->period == 0) {
+        return 0;
+    }
+    /*
+     * Ignore divu128() return value as we've caught div-by-zero and don't
+     * need different behaviour for overflow.
+     */
+    divu128(&lo, &hi, clk->period);
+    return lo;
+}
+
 /**
  * clock_is_enabled:
  * @clk: a clock
-- 
2.20.1

