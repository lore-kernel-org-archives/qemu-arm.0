Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2392784lfm;
        Tue, 16 Jun 2020 00:53:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfSdo4cUh7A0eb0Ptx1lddCmJuPdhmh691kKvfHr65KYfxyO3ktJWKl5jdWni5BIvhjcf7
X-Received: by 2002:a25:c507:: with SMTP id v7mr2143274ybe.306.1592294031782;
        Tue, 16 Jun 2020 00:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592294031; cv=none;
        d=google.com; s=arc-20160816;
        b=cNUnJ8Vsz4KFekt+E3eb2corTurHrxPA+ZF+7I/m2LTEK/SDSmMF0z9zro/bHmUUxB
         pvbeuUGIZfnVGhyK9rHnIQM5oPG4EdNE+hVbkaOJRWBghS8rVmYUIn9DbevQIBE1eQfn
         8brMU59u7p1RkO2KPt0eR7vE5Jbzp5X3zoshn1mkv/rb+LGH0I1sbeYK1cSKEY3gKqYe
         iYEdj5wGoIPxoDA31mCPXlF0rTQ4s54OId0MZ12FFtC6S5PgrpWvy7RSO2+HmJw1sLhL
         kniaj7X3+xcaCDgHmmFk4J2F1njaZa5fqLZQIsqL0a1aeQQxZgZB8wL9s71pZeuLQYzu
         Ofgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jNTvdD7mpsXZtfy12szHXck2/SJaUPu7sRItCYEvWmI=;
        b=i4sW2GhlEWty4un8yumoMB7iYzekzT4FEa7LX20cCJhoc1D1le1y62P7wpZ8ZN/YD6
         4IAl4nfXniO7IkPWRMyyo93LGwcFL/YbWjid17dOqQzHKSgIPjVFmCDpvZWe3CmBdL93
         sHAWHDo1IAZj3saZQyaGZbfhZlTYCbSAZfLKBzhqoLgR7hC3SMrIAtssRUCHQy1pPxK3
         mFLZriSEEXhxyZKGBgXs2HM/Zhx8d8WOYDCJDQX7XFHFIBPISD7wRBoi5FWATdtEukzA
         JEXR2Gs5vgU3qZ/wB/SI6F4/q0afYyZ47urNl/rLcWk2vbvcIKktvSYdxpAMnqVlEXJm
         xoCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hlDQE2Y+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n131si7288911ybg.50.2020.06.16.00.53.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 00:53:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hlDQE2Y+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:51534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl6Pn-0007rE-39
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 03:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl6Na-0003oP-R0; Tue, 16 Jun 2020 03:51:34 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl6NY-000854-Sy; Tue, 16 Jun 2020 03:51:34 -0400
Received: by mail-wr1-x441.google.com with SMTP id p5so19645032wrw.9;
 Tue, 16 Jun 2020 00:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jNTvdD7mpsXZtfy12szHXck2/SJaUPu7sRItCYEvWmI=;
 b=hlDQE2Y+qIt5bfkxo5d9ivmg+RnCdrgZik2djnVqg9fzhIrguwMe2kvyLMnFNkvBF0
 fOj9yLWI3qWupCP8+4J6HdrmB6U6CcDV1+n2BP/RiO0JrA8cEh552ypE9Nl/rz/qBoJo
 XmMkyuNRVWUAXwAxiyexhm2kPcCDhHZRCgO2JIgEgAg1KK1jUXpeyDspzmSsRWgDMniV
 8me6Zg+qkEGe1jKLfX86KnAffrKijmKYaClzj9NU4zsNReHvGBxeK+9M6DWvVHkvrhC4
 XljtSuY3fqb+52RxtIOd4Piyrfumm5zdTR16RpUQkyKxrDE3P4RWFlvKvfQoRZZZOxRZ
 hJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jNTvdD7mpsXZtfy12szHXck2/SJaUPu7sRItCYEvWmI=;
 b=lTxB+SjuF4UXWO/+qgx795nv54TIckOQiWi4PlHjbBEaoG9P+lGR86UcNhPhGsmi87
 mBlzw1jO0LK9pqD7xiGQr97LlWxOvV8STF+sYQ1tkiJsjUtgu9prfVmE6qvG1GbzuCMU
 E4WsVqKXy9WmHFnGIDGfV733Shi9/Iho/gvyi3yx47nH1iPVyZTG8oCyikzMy/yqOXS7
 mjaDFwpSFhjI8a6ooEcV/kDWXlLuubM0ABL44RUyoCjn5CPGnnpAqkmJ7idNQ/Vr/zcB
 5g11RXR27WZr7FFLdAaJgnqubU4jY+LohMvUbbVM91vpT5FhfiIhyrjHCQ+mzFLASyad
 F7Ow==
X-Gm-Message-State: AOAM5311VsAP1M7QtKc7tb8DjGov3OBakQKh3nVqAB4o5q0syBYMWUGa
 LuRp9VvfySRtLSkWrHr88rFVom4g
X-Received: by 2002:a5d:45c2:: with SMTP id b2mr1541194wrs.323.1592293890541; 
 Tue, 16 Jun 2020 00:51:30 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id q11sm28093538wrv.67.2020.06.16.00.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 00:51:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] hw/rtc/m48t59: Reduce timer precision to milli-second
Date: Tue, 16 Jun 2020 09:51:19 +0200
Message-Id: <20200616075121.12837-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200616075121.12837-1-f4bug@amsat.org>
References: <20200616075121.12837-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Corey Minyard <minyard@acm.org>,
 David Hildenbrand <david@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SCd3hp2p73pJ

The current implementation uses nano-second precision,
while the RTC can not be more precise than a milli-second.
Simplify by using a milli-second based timer.
Rename the timer 'alrm_timer_ms' to have the unit explicit.

Inspired-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/rtc/m48t59-internal.h |  2 +-
 hw/rtc/m48t59.c          | 31 ++++++++++++++++---------------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/hw/rtc/m48t59-internal.h b/hw/rtc/m48t59-internal.h
index cd648241e9..f21b603f97 100644
--- a/hw/rtc/m48t59-internal.h
+++ b/hw/rtc/m48t59-internal.h
@@ -49,7 +49,7 @@ typedef struct M48t59State {
     time_t   stop_time;
     /* Alarm & watchdog */
     struct tm alarm;
-    QEMUTimer *alrm_timer;
+    QEMUTimer *alrm_timer_ms;
     QEMUTimer *wd_timer;
     /* NVRAM storage */
     uint8_t *buffer;
diff --git a/hw/rtc/m48t59.c b/hw/rtc/m48t59.c
index 47d48054fd..d2717d00a9 100644
--- a/hw/rtc/m48t59.c
+++ b/hw/rtc/m48t59.c
@@ -89,7 +89,7 @@ static M48txxInfo m48txx_sysbus_info[] = {
 static void alarm_cb (void *opaque)
 {
     struct tm tm;
-    uint64_t next_time;
+    uint64_t next_time_s;
     M48t59State *NVRAM = opaque;
 
     qemu_set_irq(NVRAM->IRQ, 1);
@@ -104,42 +104,43 @@ static void alarm_cb (void *opaque)
             tm.tm_mon = 1;
             tm.tm_year++;
         }
-        next_time = qemu_timedate_diff(&tm) - NVRAM->time_offset;
+        next_time_s = qemu_timedate_diff(&tm) - NVRAM->time_offset;
     } else if ((NVRAM->buffer[0x1FF5] & 0x80) != 0 &&
 	       (NVRAM->buffer[0x1FF4] & 0x80) == 0 &&
 	       (NVRAM->buffer[0x1FF3] & 0x80) == 0 &&
 	       (NVRAM->buffer[0x1FF2] & 0x80) == 0) {
         /* Repeat once a day */
-        next_time = 24 * 60 * 60;
+        next_time_s = 24 * 60 * 60;
     } else if ((NVRAM->buffer[0x1FF5] & 0x80) != 0 &&
 	       (NVRAM->buffer[0x1FF4] & 0x80) != 0 &&
 	       (NVRAM->buffer[0x1FF3] & 0x80) == 0 &&
 	       (NVRAM->buffer[0x1FF2] & 0x80) == 0) {
         /* Repeat once an hour */
-        next_time = 60 * 60;
+        next_time_s = 60 * 60;
     } else if ((NVRAM->buffer[0x1FF5] & 0x80) != 0 &&
 	       (NVRAM->buffer[0x1FF4] & 0x80) != 0 &&
 	       (NVRAM->buffer[0x1FF3] & 0x80) != 0 &&
 	       (NVRAM->buffer[0x1FF2] & 0x80) == 0) {
         /* Repeat once a minute */
-        next_time = 60;
+        next_time_s = 60;
     } else {
         /* Repeat once a second */
-        next_time = 1;
+        next_time_s = 1;
     }
-    timer_mod(NVRAM->alrm_timer, qemu_clock_get_ns(rtc_clock) +
-                    next_time * 1000);
+    timer_mod(NVRAM->alrm_timer_ms,
+              qemu_clock_get_ms(rtc_clock) + next_time_s *
+                                             NANOSECONDS_PER_SECOND / SCALE_MS);
     qemu_set_irq(NVRAM->IRQ, 0);
 }
 
 static void set_alarm(M48t59State *NVRAM)
 {
     int diff;
-    if (NVRAM->alrm_timer != NULL) {
-        timer_del(NVRAM->alrm_timer);
+    if (NVRAM->alrm_timer_ms != NULL) {
+        timer_del(NVRAM->alrm_timer_ms);
         diff = qemu_timedate_diff(&NVRAM->alarm) - NVRAM->time_offset;
         if (diff > 0)
-            timer_mod(NVRAM->alrm_timer, diff * 1000);
+            timer_mod(NVRAM->alrm_timer_ms, diff * 1000);
     }
 }
 
@@ -539,9 +540,9 @@ void m48t59_reset_common(M48t59State *NVRAM)
 {
     NVRAM->addr = 0;
     NVRAM->lock = 0;
-    if (NVRAM->alrm_timer != NULL)
-        timer_del(NVRAM->alrm_timer);
-
+    if (NVRAM->alrm_timer_ms != NULL) {
+        timer_del(NVRAM->alrm_timer_ms);
+    }
     if (NVRAM->wd_timer != NULL)
         timer_del(NVRAM->wd_timer);
 }
@@ -603,7 +604,7 @@ void m48t59_realize_common(M48t59State *s, Error **errp)
 {
     s->buffer = g_malloc0(s->size);
     if (s->model == 59) {
-        s->alrm_timer = timer_new_ns(rtc_clock, &alarm_cb, s);
+        s->alrm_timer_ms = timer_new_ms(rtc_clock, &alarm_cb, s);
         s->wd_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &watchdog_cb, s);
     }
     qemu_get_timedate(&s->alarm, 0);
-- 
2.21.3

