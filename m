Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp353653lfc;
        Tue, 9 Feb 2021 05:21:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyL3zlpxuMLvp2WG0ExZFJbfuUzny+8j4u62uVXnvCKsR9teU9OrUPurO6AWJg/O4sEGrWw
X-Received: by 2002:a05:6902:1001:: with SMTP id w1mr33138400ybt.176.1612876882684;
        Tue, 09 Feb 2021 05:21:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612876882; cv=none;
        d=google.com; s=arc-20160816;
        b=McW2cnXpv0rzE5lRdQ6NkA93Pq15+LT1IxsIxY17GszZciZfC9XMiQz8AQOdTwtTOy
         D8XDDMWbqaezgH5NncVXBMX4Up+FOG1oJk3kaDf0Xwbv8OHVLheabct0UPSYhl8FG8Sc
         z85RjieT79bisDHsHLJMUwSxa43Or3joqrlmKyYvE+L2eay+Kxa2o0f8tvH3ckLrmS0t
         cfHSbdaiPmlVXBlO9hQJ6NkoRhZ4BqTO1GAe39x2MhLv75ceYhST/cE1UmhKbNVxYWOE
         6qYxodE1+Dhh9I6NhkqZqHSGSFOyhkoRCYHMQpaV0DC+cNcMOTTbefx6Dz3mTKwUxUCA
         Ta1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=v42h+/gUC/c3GqgbqA5jD8JSk9/EEyzsdB3W6E1Nn8k=;
        b=olZnfxP/TFls+S8LJ9kXBgn7mtccSvpv+f1C7iDjKVQ5PTR/hM8KvgtkrCgoq6brGu
         FfA8GjHqaTBII3DSmzeFFriC0OCorC6XbuoK7vIAF1kZfxKTJUmUJwL6qXoUoKGzaa5m
         mbNAXpPJ+SjnipjgD763eUWICvXrhdY4d3zakd6kGovBhI83fZbi8P0M0L0rox4g92xA
         Q53UM5DfBABEKZr9QjN1REYk+ocjP9feM/bLzmqH4GV7VZW4RZqNLYVbCmtHqdUUJoFP
         YhfUJOBI/7t7GQ9PKK7a2w8JaOF2V5Uw2lQvdQdS80RRa4qExELn8dHCs3M+C+hPZfk4
         TkZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="N8uu5k/v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8si21803458ybo.338.2021.02.09.05.21.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Feb 2021 05:21:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="N8uu5k/v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9SxG-0002n9-1M
	for alex.bennee@linaro.org; Tue, 09 Feb 2021 08:21:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Swo-0002lV-Fp
 for qemu-arm@nongnu.org; Tue, 09 Feb 2021 08:20:54 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Swj-0000ji-Bb
 for qemu-arm@nongnu.org; Tue, 09 Feb 2021 08:20:54 -0500
Received: by mail-wm1-x32f.google.com with SMTP id j11so3090025wmi.3
 for <qemu-arm@nongnu.org>; Tue, 09 Feb 2021 05:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v42h+/gUC/c3GqgbqA5jD8JSk9/EEyzsdB3W6E1Nn8k=;
 b=N8uu5k/v3/P+C0n1YKAMNItFrfsWkQHVBcmxzp0jIMagS+1Ldk2l5vQrjXZ5juGb5s
 juhn+lJOY0mOZBT2+Mytw1WwDwSEIXD+vYnpnshe6ZogN12lUegyWXmmg5vwN3zOChuy
 SGzcJGgcoa/ZUMmk5Nr9duXR2/CDGH7d2E/3eRxosIMCOrgxLHS3DR0O6o+U0E1aZ+iY
 pWIcaXay9gxukfzB5v9EatN7+H4rlfpd6efjfRk+FmLyJBekOWlXMN2G7i0qnlorrfmj
 XPmSWQKHVLPuNO7o4bidNx10hbYsp9de/v7aZ6V7HVkyFIwEa1ngyJACv94tmsPQC9Jo
 0oLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v42h+/gUC/c3GqgbqA5jD8JSk9/EEyzsdB3W6E1Nn8k=;
 b=ITBqX3Y5MxXfZoGpUsC4Lq7M4dPc7I6/ul8fE+SMqZBEaG91FzhdfiITiwwRLjtAzL
 l6YQJ8XeZuCTW714i7MSQceKlQ0a+XKmYtVTlmMmFspvaGN8WxvYTAK42UHi008mEkKE
 F6Htnnfhc6m0zZbW0aBpsqJStj3M2pXEoGx36j3nl9QwUmD6mdtj5aDEFEdL4f+Dx9u8
 M7pLgQaB1heYR84P0s9Cft2pUQzknWfb/KVlSN0Ng+1utbAmJ7wfb1fVOmBYQwO/8B83
 oawnq8gkDMgHz3MTniT1VaGG+RmhPwBqNF5dj/bKW0pK4y/7Jaf4enb7OJGCyxU4WcYQ
 uO3g==
X-Gm-Message-State: AOAM531rQGjc4hBT4+23M5F3l0aW2dnGZIPX2NzPS63AMoKj2I6Ee5rp
 y7Rccfvv1kYdCG8NUIUgc0uvRKbZ0JqLgA==
X-Received: by 2002:a1c:c6:: with SMTP id 189mr3498907wma.128.1612876845507;
 Tue, 09 Feb 2021 05:20:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm34752472wrh.16.2021.02.09.05.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 05:20:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] clock: Add ClockPreUpdate callback event type
Date: Tue,  9 Feb 2021 13:20:38 +0000
Message-Id: <20210209132040.5091-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209132040.5091-1-peter.maydell@linaro.org>
References: <20210209132040.5091-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Tyrone Ting <kfting@nuvoton.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O8VJ4gwbSMty

Add a new callback event type ClockPreUpdate, which is called on
period changes before the period is updated.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/clocks.rst | 9 ++++++++-
 include/hw/clock.h    | 1 +
 hw/core/clock.c       | 3 +++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index cd344e3fe5d..f0391e76b4f 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -181,7 +181,14 @@ events.
 
 The events currently supported are:
 
- * ``ClockUpdate`` : called after the input clock's period has changed
+ * ``ClockPreUpdate`` : called when the input clock's period is about to
+   update. This is useful if the device needs to do some action for
+   which it needs to know the old value of the clock period. During
+   this callback, Clock API functions like ``clock_get()`` or
+   ``clock_ticks_to_ns()`` will use the old period.
+ * ``ClockUpdate`` : called after the input clock's period has changed.
+   During this callback, Clock API functions like ``clock_ticks_to_ns()``
+   will use the new period.
 
 Note that a clock only has one callback: it is not possible to register
 different functions for different events. You must register a single
diff --git a/include/hw/clock.h b/include/hw/clock.h
index 5c73b4e7ae9..d7a6673c29e 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -30,6 +30,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)
  */
 typedef enum ClockEvent {
     ClockUpdate = 1, /* Clock period has just updated */
+    ClockPreUpdate = 2, /* Clock period is about to update */
 } ClockEvent;
 
 typedef void ClockCallback(void *opaque, ClockEvent event);
diff --git a/hw/core/clock.c b/hw/core/clock.c
index 71dc1f4de65..2c86091d8a3 100644
--- a/hw/core/clock.c
+++ b/hw/core/clock.c
@@ -80,6 +80,9 @@ static void clock_propagate_period(Clock *clk, bool call_callbacks)
 
     QLIST_FOREACH(child, &clk->children, sibling) {
         if (child->period != clk->period) {
+            if (call_callbacks) {
+                clock_call_callback(child, ClockPreUpdate);
+            }
             child->period = clk->period;
             trace_clock_update(CLOCK_PATH(child), CLOCK_PATH(clk),
                                CLOCK_PERIOD_TO_HZ(clk->period),
-- 
2.20.1

