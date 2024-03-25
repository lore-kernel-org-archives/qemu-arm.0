Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp775237ejj;
        Mon, 25 Mar 2024 08:29:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/nzdpa+tdGz6/tTeg3IANf/jZyDbHcMYKA0D0l1Dx4aBA6fePchmfXrZvrWtQmflyxVKAMFelkKO14cXL6YVgmsHPPK3r
X-Google-Smtp-Source: AGHT+IHSrX4QFvGRTGKjalv9Z0wq0u/QJAF0i8BTCWlX9TUhElKhUJUcP9He3AcGXRrNI53HHzYr
X-Received: by 2002:a0c:f013:0:b0:696:7b16:999e with SMTP id z19-20020a0cf013000000b006967b16999emr5196993qvk.33.1711380563650;
        Mon, 25 Mar 2024 08:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711380563; cv=none;
        d=google.com; s=arc-20160816;
        b=cdFC2oQV98N70C/CWQDqd3dLrouxhuA6wGLUBSYJGvsLhJ2gk5Y7BQG0UXMWEQU708
         gYqUrJYBf27GmE2ruJIBY6zQpXMGujb2mqeQX47ZMrqwUdQgIZ2sIgBkVpZ/p9SaPf3P
         B2WDSuNdPGBf7Jxvq8KqPmejP/MtoZ6PK9ifKz2iR49FOcTFyFT5kAK2euT9nCf3oOuH
         lnuk25l57s2SYfk24Q/MuM+GJfZWNbpYCBG77LoMFlh5C15QeYgSn9ztborVd9ngioI8
         jJbEttcpMsJNSctM01ygTZeCdRq6g1/9miaDfLj8hpkua6gK/rpYrkcLK1uuvaYURq2o
         kNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XGixc8/beFlJTVTR97uUt5Nz0tk7RL3jZppYJHNPExI=;
        fh=o78Q0PDB6ccQGBRbYxx+MjNePSvSa0YMlwYL9lSVwr4=;
        b=pEnanBepsK5vYPRYgcFHNSYD1gaM3o4HKTyJ4qBAhj2tR36iOgEKkr5ZYDsKTXF5dR
         i3s9vhPsDhhVmAaX+XJm6PEvCt1ZP+xxKiwNagoNjQ6zfG9NNUd1x6o206w/mX1G14qR
         SVfyJlvpusfW9lSxHi4Q8ANUmJG0ccAcrC0hpNrMjgQbbQODmLYdE/lGR/U0oicDDWO5
         wKlknkBB4Q7fmhI56P9E9pDDqhaWiqXJeufPiLwVlQQo6yFp38jPH6kOjdziJgbhttBP
         CUAJI0iZtjMpgowUMOU5lf7ApFAUBokWv97uiXGQRMiTOuKcXPj5qAWFgF8CjA2kjsG9
         VEnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zUO5lcGH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id mw10-20020a05621433ca00b006968f22431esi2063694qvb.421.2024.03.25.08.29.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 08:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zUO5lcGH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1romFb-0002j9-TK; Mon, 25 Mar 2024 11:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1romFa-0002it-Q4
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 11:28:38 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1romFZ-0000Es-7y
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 11:28:38 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3416df43cabso3134269f8f.3
 for <qemu-arm@nongnu.org>; Mon, 25 Mar 2024 08:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711380515; x=1711985315; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XGixc8/beFlJTVTR97uUt5Nz0tk7RL3jZppYJHNPExI=;
 b=zUO5lcGH+H3miZ8LyQYp7HMTlvl8rHp7dhA2m+VJQ8b94V+Tx8h3L7CTecgVGSgycO
 kOUUwLwMIjJSRY2BX7uOB4Vh1SgbeB+gN6LM2k0adBB+sNQ/Ih0Gz7Ul+G/eQW5nSLjU
 1Yujyp0UrA5TpOc1dpajKHuXsARD58aPE0hJLULpZY8MWAqLp9i7N8UWQ/ve7p5PGTut
 w6s5YxZ6rkN5V8R7bH9GK074wVZWLbpIOcLyEHgNlKlWcXAMajKp/xlsQO4Y/neT9Zp0
 Lgtmh5zebll45NwsGxFmRhPEp0GCb3z/xYR4YV1pFgwV5hjlnW/30CzJkhpfyHEKzzxN
 dVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711380515; x=1711985315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XGixc8/beFlJTVTR97uUt5Nz0tk7RL3jZppYJHNPExI=;
 b=fPA6+fhhAw+52r/Y6yA/3FKZEEyhU9sn3V5XnRbhn9Cd1n7Lr+8dP7DJYUCkoZHtTh
 8bIJNMCUy3xtG4ZMGiV3gZEiQvA6EleEA6WVawiaZMGUBpu4VQDfnZ2q8vGcCawEIEBu
 P74hnbxycqe9FB3JVeNQ/qOz3chSuxsEVm6Xl4Uzb9lzGSSk3613pHA8S/lHbZzFxhln
 6Txi+bujOHCAzHUWnlLt0zm4idBbrGUq17EsuK4W6rpUWWVOZaRPEvlijMuVdC+vwnGW
 /s1IkcRULmGSCTVROSLXOsX5acbiWipAyCjIlH3T3rVx3nhcP122sNoGh28avjWP5Idu
 hm7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVtT8hvXmGISJXUDWyvDvf7A8E1XCwztXGr1TjAiviCWdNyNxrvdHwctx1KCTCK35SrC80iSgSObH+sDhs14Sg/XuU
X-Gm-Message-State: AOJu0YyyUew7kFrR2aZkLW4kEH4mtKLYnAXYef8BCA8nSg9j9lTJmPEX
 wlauB+e75iSXJm6DfgiwRlCVNHjcbQN2QSjgyaAheopbRoJSfRVohss+zbuUTys=
X-Received: by 2002:a5d:52c6:0:b0:33e:b1e7:742a with SMTP id
 r6-20020a5d52c6000000b0033eb1e7742amr3826539wrv.10.1711380515517; 
 Mon, 25 Mar 2024 08:28:35 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.208.214])
 by smtp.gmail.com with ESMTPSA id
 df10-20020a5d5b8a000000b0033e756ed840sm9759377wrb.47.2024.03.25.08.28.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Mar 2024 08:28:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Damien Hedde <damien.hedde@dahe.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 v3 1/3] hw/clock: Let clock_set_mul_div() return a
 boolean value
Date: Mon, 25 Mar 2024 16:28:24 +0100
Message-ID: <20240325152827.73817-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240325152827.73817-1-philmd@linaro.org>
References: <20240325152827.73817-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ErY1W/CKI+Ao

Let clock_set_mul_div() return a boolean value whether the
clock has been updated or not, similarly to clock_set().

Return early when clock_set_mul_div() is called with
same mul/div values the clock has.

Acked-by: Luc Michel <luc@lmichel.fr>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/devel/clocks.rst | 4 ++++
 include/hw/clock.h    | 4 +++-
 hw/core/clock.c       | 8 +++++++-
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index c4d14bde04..b2d1148cdb 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -279,6 +279,10 @@ You can change the multiplier and divider of a clock at runtime,
 so you can use this to model clock controller devices which
 have guest-programmable frequency multipliers or dividers.
 
+Similary to ``clock_set()``, ``clock_set_mul_div()`` returns ``true`` if
+the clock state was modified; that is, if the multiplier or the diviser
+or both were changed by the call.
+
 Note that ``clock_set_mul_div()`` does not automatically call
 ``clock_propagate()``. If you make a runtime change to the
 multiplier or divider you must call clock_propagate() yourself.
diff --git a/include/hw/clock.h b/include/hw/clock.h
index bb12117f67..eb58599131 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -357,6 +357,8 @@ char *clock_display_freq(Clock *clk);
  * @multiplier: multiplier value
  * @divider: divider value
  *
+ * @return: true if the clock is changed.
+ *
  * By default, a Clock's children will all run with the same period
  * as their parent. This function allows you to adjust the multiplier
  * and divider used to derive the child clock frequency.
@@ -374,6 +376,6 @@ char *clock_display_freq(Clock *clk);
  * Note that this function does not call clock_propagate(); the
  * caller should do that if necessary.
  */
-void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider);
+bool clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider);
 
 #endif /* QEMU_HW_CLOCK_H */
diff --git a/hw/core/clock.c b/hw/core/clock.c
index d82e44cd1a..a19c7db7df 100644
--- a/hw/core/clock.c
+++ b/hw/core/clock.c
@@ -143,14 +143,20 @@ char *clock_display_freq(Clock *clk)
     return freq_to_str(clock_get_hz(clk));
 }
 
-void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
+bool clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
 {
     assert(divider != 0);
 
+    if (clk->multiplier == multiplier && clk->divider == divider) {
+        return false;
+    }
+
     trace_clock_set_mul_div(CLOCK_PATH(clk), clk->multiplier, multiplier,
                             clk->divider, divider);
     clk->multiplier = multiplier;
     clk->divider = divider;
+
+    return true;
 }
 
 static void clock_initfn(Object *obj)
-- 
2.41.0

