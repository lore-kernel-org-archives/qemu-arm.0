Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp3369297lfo;
        Mon, 1 Feb 2021 04:34:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7JKZI+xN3paxQPFdYk9vDjavV4hFO9foTbHEljD88ljC1kZwESgyE/sUyLSoI9IaEEaYz
X-Received: by 2002:a25:bd94:: with SMTP id f20mr24151785ybh.205.1612182854459;
        Mon, 01 Feb 2021 04:34:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612182854; cv=none;
        d=google.com; s=arc-20160816;
        b=l2PxyvPS1ccbj1pq2zZ0dw6FruecWY32rFPkuU6b17jTrE4Isp6ErkwCo6B4kEytD9
         wGFOKVhlGh/vQO5VKYdpqS4CgKIi+3nVvHckVkb5G9ecdkeyDEskhAY8dcieOspAPOm4
         WbDIKhV+LntGF3O3hENIurGA6x8kqCqtn0l+wJ1uyPyP820fWUjKEWTM3shrglrGkHGE
         uOrWnavqWQQ73Z2zAfQgNkbtm2agYFb83pRfAETz1IsAPNJJiUFHpW9FZcZPpOs9pFcb
         NvklGafJHX4Ba6h57ya4AvBP0xSgVqSq0o1eUoUkIQmPB21giOXk2pW3BN2n50nsUvVJ
         2N/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uHDOPARSpjV/tDsSIA6xCo+KUD0YSwaTbi1mbLNgF8E=;
        b=AyDJWK3rE7ipHTggwnI2Ho9XuHJVCpQXE98dLF1GUG2gT32dIoLsF6EOo6AEZRGlci
         lH/FkTJiBPO8tkQw5RD8cv/kM9qEYKW2bWE3T5XmggVLCD2rJwodRn9zZX9d1nttYG5D
         vZ050xq/kOhOZAQTq3+QnfUSSN9hyaI4MVd1rOMQVlPbUyVkpD29xLkRxtr/B4WXCqty
         Qr6tY8HrXHvKucZYrQ7/8SFQL9OPpED+OW7Ux67RXsT01bFiLwO+9l2uZvFmnbkUvws6
         nhhhADB7JBXHTPrRl29NRL4bVurJLAccHgDDqUirfAudvNT++Ti7hCPNYujvwozLbO7a
         NUFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jKdlu11I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z62si15904803yba.98.2021.02.01.04.34.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Feb 2021 04:34:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jKdlu11I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6YPF-0008Ow-SS
	for alex.bennee@linaro.org; Mon, 01 Feb 2021 07:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6YLd-0004M2-Mi
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:30:30 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6YLW-0003cj-7q
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:30:28 -0500
Received: by mail-wm1-x330.google.com with SMTP id o5so2847348wmq.2
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 04:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uHDOPARSpjV/tDsSIA6xCo+KUD0YSwaTbi1mbLNgF8E=;
 b=jKdlu11IPuckU/0YRicenJ4UdNCj6AlNvysHT0xUyRVPUrckLu6qZBM/f3o/ystuhg
 /wgu2l/8Ue99WeHqHppaA6jWjQGbJAKyglsU72FLNK3SsqHgq9e4gGC2tbLfB7O7JArK
 3dSK+LC+VBE4vZ5Ir09kZUcqhSkinAHtuq0QXUBqhhQgQyGoB2RQ80lEEGW/1aAmuwuP
 E1Wz+Yyq2nqnj9qvB+GjlF3qlSLjP19hCPH9i23xs1CjpouhdqJ7PJjwgYpUYfhXR5TU
 ByvVCXm/2IcFFW6P8+nUaJG6lhnSKW4UwapcXfMgaNk2/qvXFijgqCDQgbN081eFdSMN
 3fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uHDOPARSpjV/tDsSIA6xCo+KUD0YSwaTbi1mbLNgF8E=;
 b=iMpEEMcB5G790bjP+SRTyYuaU3VYbyClDBJDr+/evqOonzExOErznkNhupzOUyAK3B
 3dckSgIyG7kVxmy87WSYl5kXNWEzRY+Vj1rjihejh/CelFIrABpSLFafvxoahxLe8EGj
 pDq8il7gOxyctymuETd9SYbiLzL7GDc4s2vCitrT69ahY3lCgh7fWyoDcwPFP1ZiTJtq
 OyPvUXu5zfJGligd1PHqJkEKF3Os1pkPPRT3BuvHD9XQivUNAAz1ikpqe0kit+zzxqEa
 Vmy3o1VFspGWQi2pqSreU7v4oFJ3R7RDwr4E6/S3mKrTCWbow4Eo3IcM54rtMBhXJdcN
 fZ8A==
X-Gm-Message-State: AOAM533Dkr6uN8+7nPt299XXKmvWjphZzSgU7osOLGj1eN41OZw3uy0x
 8Nj40OwhKz8j9V5iYcy5EXTefg==
X-Received: by 2002:a1c:27c3:: with SMTP id n186mr14872555wmn.96.1612182619771; 
 Mon, 01 Feb 2021 04:30:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm20466278wmj.32.2021.02.01.04.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 04:30:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC 3/4] clock: Add clock_ns_to_ticks() function
Date: Mon,  1 Feb 2021 12:30:12 +0000
Message-Id: <20210201123013.32308-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210201123013.32308-1-peter.maydell@linaro.org>
References: <20210201123013.32308-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Luc Michel <luc@lmichel.fr>, Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1XichomLhbV5

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
index dea63742fb0..84fb45bbe5f 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -355,6 +355,18 @@ rather than simply passing it to a QEMUTimer function like
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
index 7d0eb286faa..e3545eda439 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -277,6 +277,47 @@ static inline uint64_t clock_ticks_to_ns(const Clock *clk, uint64_t ticks)
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

