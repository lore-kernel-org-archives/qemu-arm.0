Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp3366962lfo;
        Mon, 1 Feb 2021 04:30:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLeeldlvziUgqQPzPs99ljyZCmL5Nu84UFYPNlhuI28D5YJWPp5jVIaIe69PVyc1mbZHV/
X-Received: by 2002:a25:9a04:: with SMTP id x4mr25336838ybn.184.1612182655098;
        Mon, 01 Feb 2021 04:30:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612182655; cv=none;
        d=google.com; s=arc-20160816;
        b=XwZ0NozcuRBGwnRcFUwzuh+D453GvObZXncFVm1gZv0VnK3BndI8JxMBhE6er3rVrW
         V+Tv6JAd972bfUJGuOV/chRMLJ2ibIaHceoOS2rJ0HpHHw1MqFCBZZGvtgXnaa0HmRXc
         3Is0RaUqdP4EYBq4u78o9BNxixLh9xUaLHQeJM/X2GvJy7bGdDSotiTe+fwxqk405JpT
         YBTFf/inwtfUSNKpsHGXSheTPGPsVPvOPx1SSxrWumKhVgTW05Po+UtSBy4KNHRE7EQs
         vKgTr8jJJFN6qCUJ9mnDaFjrDPDVA26b3AqiK8mlfym9XfJu96TUVfPkzrEwH5zJskPT
         qypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dZnuCCfmvDgfaNUppjP1kLNGCewuh/sSis1yC+WzkTg=;
        b=asc39Y+LHsmAbt1okpcE/yW1ilIfDY3v9A0aor+l5HGXxZrd43ew/rlA/aXX7MCwFV
         95Rg9+ZGrzyJn9ykRIaLmUg4TfyF3j45KvwS7mdUpUiU0iO0avXzhvoDgoh0CTOup0Bi
         Qv5gdzFw0D5VmkWJUEf/ZafGqX4jwqKpWQr9KzGiULuI+lsuIsW2VILyctDgHEnhg/Rs
         qJXfnkFwAk71CxzHK3XMv+ONPxjY5qsV+08XGcKKup1kWl0VmkYsqDaU5vGLziLxVroj
         H/XaFNqLVcr5AdUA4ZaT+OHY1mDfvHfDTEysuhO/0H5dkxjG7NmDKITo9Mz0jhb5Nn4Y
         8e8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WRgITgzC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1si18285501ybp.257.2021.02.01.04.30.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Feb 2021 04:30:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WRgITgzC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6YM2-0004tm-EL
	for alex.bennee@linaro.org; Mon, 01 Feb 2021 07:30:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6YLd-0004M1-LB
 for qemu-arm@nongnu.org; Mon, 01 Feb 2021 07:30:30 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6YLU-0003cJ-9S
 for qemu-arm@nongnu.org; Mon, 01 Feb 2021 07:30:28 -0500
Received: by mail-wm1-x336.google.com with SMTP id u14so12482167wml.4
 for <qemu-arm@nongnu.org>; Mon, 01 Feb 2021 04:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dZnuCCfmvDgfaNUppjP1kLNGCewuh/sSis1yC+WzkTg=;
 b=WRgITgzCFFJWwzhIuStZKCghFmZ11to5z1rmMCG/cRipRKdpKfPMFlttmSnwmLCH1b
 FO+9Z0MeE3Z3n/B4+Jsv5ElyazR6uGY17C4du9HXCbAt9qvw25ZGx3/mkdOER3kGD30V
 cOjNWzC1dMDq2oZtusyJzVKUuum79jdxEbnnuRdQgEkB3EidQGrSFy1n8xamKSMbYGUv
 ehdWHnAPQAS3NqEDLgUYJL8FvtXiGe+gZdvNd4n4z8wdwjU6+w1vycyIak/p/Y07teS6
 bEci1mDZLcmrQdjQ4SiRf+UNm/DC7hhAAS2halLYW5frCVH7PbSPw9/XSIQcxsijprB0
 tKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dZnuCCfmvDgfaNUppjP1kLNGCewuh/sSis1yC+WzkTg=;
 b=oxTHrW5q9Tefzhvumpmb9W6aC9AFLlUWMoAkCt7AzsjYgs+WL3i9lqN0BQvifmR4E/
 DWqXwmLgdlsiiFrDm9xVsiXGYNOSuaFjUrXgLQozyBc/d1KxChKFFPBiLCeUrNXIwTmU
 rmf+bvxWD8Cn6GOyGZI12Vtykot/Mt3feu+T3U4vBfoSwMEjgrrKit8OQS+yFfO0kPQd
 v57ZQm5HMkY5YnE0ZfdTo5qfxwvy67jY1yDyuUAJPdT0i+Emh3SathjqW/ht4mGnJZuk
 owSi+ouBHKfHqL+JeN0T5JC8S6lFKUYGyQ86bXHRQW6fO3m8gJuI+B32IFhdrakg57zN
 gG1g==
X-Gm-Message-State: AOAM533fVFc5BsAaCtF83HFj3nImPGoNbwW8WD7G4Tb9Scan+y9GI3Gi
 yMw1H1rd6FAZZAdkGZp83DncLSpArl5q0g==
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr14443391wmh.131.1612182618716; 
 Mon, 01 Feb 2021 04:30:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm20466278wmj.32.2021.02.01.04.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 04:30:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC 2/4] clock: Add ClockPreUpdate callback event type
Date: Mon,  1 Feb 2021 12:30:11 +0000
Message-Id: <20210201123013.32308-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210201123013.32308-1-peter.maydell@linaro.org>
References: <20210201123013.32308-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Luc Michel <luc@lmichel.fr>, Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6vFdHm0NM9+Y

Add a new callback event type ClockPreUpdate, which is called
on period changes before the period is updated.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/clocks.rst | 9 ++++++++-
 include/hw/clock.h    | 1 +
 hw/core/clock.c       | 3 +++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index 8d3b456561f..dea63742fb0 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -179,7 +179,14 @@ specific events they need to handle, so that if in future different
 events are added the callback code doesn't need to be updated.
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
 
 Retrieving clocks from a device
 -------------------------------
diff --git a/include/hw/clock.h b/include/hw/clock.h
index 323f8d49fed..7d0eb286faa 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -27,6 +27,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)
  * has been called.
  */
 typedef enum ClockEvent {
+    ClockPreUpdate, /* Clock period is about to update */
     ClockUpdate, /* Clock period has just updated */
 } ClockEvent;
 
diff --git a/hw/core/clock.c b/hw/core/clock.c
index 772d03a2eb5..963fe83a363 100644
--- a/hw/core/clock.c
+++ b/hw/core/clock.c
@@ -68,6 +68,9 @@ static void clock_propagate_period(Clock *clk, bool call_callbacks)
 
     QLIST_FOREACH(child, &clk->children, sibling) {
         if (child->period != clk->period) {
+            if (call_callbacks && child->callback) {
+                child->callback(child->callback_opaque, ClockPreUpdate);
+            }
             child->period = clk->period;
             trace_clock_update(CLOCK_PATH(child), CLOCK_PATH(clk),
                                CLOCK_PERIOD_TO_HZ(clk->period),
-- 
2.20.1

