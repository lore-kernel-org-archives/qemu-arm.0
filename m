Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp144401lfo;
        Thu, 28 Jan 2021 03:42:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/q4DddBJ3vYJeMCAfCGrw6Z1lA5924o8Vj03wy73DqfO9tcX4XwERIBfnZ/s2ernY3TGx
X-Received: by 2002:a25:7544:: with SMTP id q65mr24827976ybc.200.1611834140965;
        Thu, 28 Jan 2021 03:42:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611834140; cv=none;
        d=google.com; s=arc-20160816;
        b=LukPSq3vI6/o6RtYQQ402fGTjIyCJ1FWqA6yrJuX8Nc8Ny53JkBuNJmDZhffsVjZDO
         syd7EN6Sr9jIeu1WVaiu9GS/M2GvOwTz23EZwyXYM0njC2y/Umhc1PGlz616RmWfppcS
         hi5DMc7zNnLiL2i6rfJGODfiINMNd3fA2QV+iGs351D07HCYjvILFIuUqLFUuATroJ5D
         E9Kw09f7DbT2hSqxAnZNnSq2hGWCmZ4UQ5J7Fdn2AjaLL0DJ05ASABbS+dhUTOoUWw9U
         QbdQPRUaCOTddLZ7rqL0byG7R1e3ye//jn+OQo9L20mTKVOpTGUa1jOyriUBHVRV5hZM
         8Rng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=p7OK2Ltq3LcHT8jmiWMB0NuP9bP3FPom3Sa8lyw278I=;
        b=UUJ2//nho0KsZkbJc0x6JdrfdJMZfN3W8Ak0GuGVfpgxX8i2G5fiQBSQ6ZrKJn5fng
         AtHswS5VZMbRPWJNMxvTR/S0ChC98CaTIUc5Kpr6Faw0p9Cuq64wRrNaVZTq4WGuONst
         lRlDPy54fKAXLXYW21U+Y+IG1Ynfd87LNTusvtosx75oUNFs7+uy+hypUY3k2JuYoAa6
         MoEeYr/7RzxbCR7bs6IT+hHbTSblw++1oIxzH35+ipqT9fp0l618JnxHEUt7oRQTVYrX
         R3NjEsQEtvAq8knUmXE1ZixfOdWNLP4CEQBqRpzHN96qfc940PFsdSO398aDw+cFIHsK
         VPWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gCGquRP0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15si5515252ybm.442.2021.01.28.03.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 03:42:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gCGquRP0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l55gq-0001A1-7N
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 06:42:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gS-00018F-VV
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:41:57 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gO-000658-G1
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:41:56 -0500
Received: by mail-wr1-x42d.google.com with SMTP id s7so2068863wru.5
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 03:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p7OK2Ltq3LcHT8jmiWMB0NuP9bP3FPom3Sa8lyw278I=;
 b=gCGquRP0Tq7iLV2+thH/SHMnbU0DmXPsCQFJBliQwiegVnuo+8SgdBKCRXffaVjgUz
 fguVSICbaKxF8x9apRR8SalcuuPmJGz1+mXPpyptKYSbKDx1IfNVghD1Yadia5WuM+6Q
 qzbRex3U8lZCMrU53+eeRKP+NpL2IrxVznCYpKsQE4a/pV97wVhU2MFbWS8RWGaPN/6K
 4cuQOaGiVgadLm+z+y7BN51sV87w0Ok5ggMNdWZNRSpz7Cdvmd2ROGGmFkH8dI+m255a
 9zs0/Wg6gu2EdT2qDW4hVwVpW+cHWU+hERhlwl85nlxJ7CGP2ptsJ/IhnRh2WacIFCPB
 kP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p7OK2Ltq3LcHT8jmiWMB0NuP9bP3FPom3Sa8lyw278I=;
 b=PCZZWT410URbnM/kO8bT90hu9KKlurn1b0tNuHnxEJnu5PwVDE2hJSzqXltabuWYtm
 Ur+Mji7rs/wHoWiyBIakgraG740X9ir5TV9nr4COY6kure4HUHVT5sfvQ/nFWFZz+vBk
 NoFFHQKL3rMXwUXK5WXYXvsMsNlWi/1b1CChVzNGlphQfEHC+cizbhJ2CECiPpsrXPiU
 JiS6w8rztXxT+8e47uk5enjTF3iyBXkQLTQFtdvXmeHpOlrSKtj4FPJPnK97FrARuZnP
 FiDs09B96J6s1D4OhJjHEYXbVbGKjcVxbFwmi6FyJRK3RN6Qhslt/N00nLVUtUqp+lZS
 y1tA==
X-Gm-Message-State: AOAM530L9IOboW7lSez8UfiNNDisNa4zprm02mKJx9Y6Y6F47MlZo8F5
 IccWN9lBrvn3BTDVBNmF0Id4Qu/J8V660g==
X-Received: by 2002:a05:6000:1547:: with SMTP id
 7mr15910116wry.301.1611834110398; 
 Thu, 28 Jan 2021 03:41:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:41:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/25] clock: Add new clock_has_source() function
Date: Thu, 28 Jan 2021 11:41:22 +0000
Message-Id: <20210128114145.20536-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h+1SxOptqeAP

Add a function for checking whether a clock has a source.  This is
useful for devices which have input clocks that must be wired up by
the board as it allows them to fail in realize rather than ploughing
on with a zero-period clock.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210121190622.22000-3-peter.maydell@linaro.org
---
 docs/devel/clocks.rst | 16 ++++++++++++++++
 include/hw/clock.h    | 15 +++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index 2548d842322..c54bbb82409 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -235,6 +235,22 @@ object during device instance init. For example:
     /* set initial value to 10ns / 100MHz */
     clock_set_ns(clk, 10);
 
+To enforce that the clock is wired up by the board code, you can
+call ``clock_has_source()`` in your device's realize method:
+
+.. code-block:: c
+
+   if (!clock_has_source(s->clk)) {
+       error_setg(errp, "MyDevice: clk input must be connected");
+       return;
+   }
+
+Note that this only checks that the clock has been wired up; it is
+still possible that the output clock connected to it is disabled
+or has not yet been configured, in which case the period will be
+zero. You should use the clock callback to find out when the clock
+period changes.
+
 Fetching clock frequency/period
 -------------------------------
 
diff --git a/include/hw/clock.h b/include/hw/clock.h
index 6382f346569..e5f45e2626d 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -139,6 +139,21 @@ void clock_clear_callback(Clock *clk);
  */
 void clock_set_source(Clock *clk, Clock *src);
 
+/**
+ * clock_has_source:
+ * @clk: the clock
+ *
+ * Returns true if the clock has a source clock connected to it.
+ * This is useful for devices which have input clocks which must
+ * be connected by the board/SoC code which creates them. The
+ * device code can use this to check in its realize method that
+ * the clock has been connected.
+ */
+static inline bool clock_has_source(const Clock *clk)
+{
+    return clk->source != NULL;
+}
+
 /**
  * clock_set:
  * @clk: the clock to initialize.
-- 
2.20.1

