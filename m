Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3884640lfc;
        Mon, 7 Sep 2020 09:36:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNGbdLa1vF9v3wu0enKUTcb1k1CmrqPGwqAkDGC+uEo7BoHs/B7aYGxRm5PoWtv/Cj0wJ/
X-Received: by 2002:a25:ac0d:: with SMTP id w13mr2663301ybi.51.1599496577730;
        Mon, 07 Sep 2020 09:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599496577; cv=none;
        d=google.com; s=arc-20160816;
        b=KwNZyKdHlBZmPme8B4v0gIt64kb8oDNO0XaG9gESoQSFcMaTp9O33GD50qZUL7JuUL
         RmrSzKdGZ+EcATULFNoHAIZdGKdqkjdFVvtejkBV2Vv3McdBu+90xq4zxjnNi3NeP2qJ
         AZlsHj+a/IK2XOyM/Zm/oHJK8+a+lioBxQMG6E1pKvqjwSkNSKASV/J+93CREHRqX+qn
         XXOk/hL9tcVO9Av0JEnIEUnU4LdHvtiO8t3MMXGhaq999/9CqbqJaTnXn71eMbxd9veX
         XPtnIgTDqO27oM+fE1sKu3Vp4ywqMY5pjCxuJjzcRZsNS5IV5LO5Oj8E7/jbJIIACQmp
         +GkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sOTWIKCT6VDFv2Z2z68Ud6vgTWqu6BKF5mHpas4qUIU=;
        b=g4FNNAANlXOiwZQte6c6E10jMnFVM4Qbi+q1OtZITYA6chftvPt2/HY69a9KQfrBBm
         XjjpF644lX3FkfH6mNLbndZ7gLdTa6zzqSxfuQpNMTbACIlMWKiEQIQzoEf8ehl1gUAQ
         WaArN8HtoXCOKeD/d6zs9kPS2hZmJB3waKsftQYF0GRUenlMyL10BRbRC/XLnXZTCZ24
         3JkurZ4G5b2Bf45GpMNmw91GnU4IkLBi5PGdXCxbCquMvuG41apPka35I7G/N1vIYh92
         OsALdOmhmFK7hOuokvx4IKbgtk8TR6YNDOmEGtb/gtZXD+5oIkYPYxat6luEcPk5cXuc
         FYbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CbNlWh0S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o187si14402347yba.66.2020.09.07.09.36.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Sep 2020 09:36:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CbNlWh0S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFK7t-0003vt-4B
	for alex.bennee@linaro.org; Mon, 07 Sep 2020 12:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kFK4q-00088C-4j; Mon, 07 Sep 2020 12:33:08 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:45189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kFK4o-0007c4-Gw; Mon, 07 Sep 2020 12:33:07 -0400
Received: by mail-ed1-x52d.google.com with SMTP id l17so13270655edq.12;
 Mon, 07 Sep 2020 09:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sOTWIKCT6VDFv2Z2z68Ud6vgTWqu6BKF5mHpas4qUIU=;
 b=CbNlWh0SZ+7iSW1+FYz4wkXR13QN3P64ZIb9mGTZ45QuJKP8BzwzHJWcUZ4opDAS+U
 NPwfnLRggsDeRGkYoETvHFcOISfCCoZEBl+m+F2F4mhClWL1W/PD5k5C1JukQNptuduA
 tQYQrZiO1+J2GdIJssDIepQ8IXYIGxQp/bQ/kOcAVQj7UzI7873cVIxKWzS6H6JJMr3A
 EIGAyzN7jkWU3F93RLTnvnKHR4JYudYeEVDsMDW+esIf/UaVOF8/qwDCf6g0x5jA086X
 KDLkQl6FTCHaGXnVaaqSBu6CGskE+VSvlpwu2B6tB0ppiVXB+JvGr12EHMXcectt4ETm
 SBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sOTWIKCT6VDFv2Z2z68Ud6vgTWqu6BKF5mHpas4qUIU=;
 b=rB7ahS0G9JlxY3QXewcESNSsRkeWoFlGKpNjHawHP/dEnFJb97X9FLcu837CbMkZIg
 JKN1ONuKycBOxRvUcEKLcQQoH/GdiJIoy5LJpGqk21IRhmKG9uibJd+M6yDQAmClcme4
 Di6Sz4ZE331MeZhJAkAt1LI6aaL1NQNgK/b7V1r4h+jr+B1mHKro1owfuCN2kyJGWnI7
 inHZPrrjtLM/XxL6d2cVMl6Xhu6pMuohm7La3aTutI2clsWLgEAY23THrH5kcxXv4XQR
 lnMnZ0SKLmve5sQ6RGY2XZHQh670pwkApPlwrykEdvGGY1n1hxnUZYpvqORk8QZXMdP2
 0Wzg==
X-Gm-Message-State: AOAM531FuvZIlbPA2cuIPqWLC5x39+HsMUpYsRwiQm/Imzg2Pi3D09HQ
 RKMTAuwV1omZIxtM+Eysg1K3lR1g9Ng=
X-Received: by 2002:aa7:dbd9:: with SMTP id v25mr23489525edt.78.1599496384529; 
 Mon, 07 Sep 2020 09:33:04 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id u13sm15700199ejn.82.2020.09.07.09.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 09:33:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/8] hw/misc/led: Emit a trace event when LED intensity has
 changed
Date: Mon,  7 Sep 2020 18:32:52 +0200
Message-Id: <20200907163257.46527-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200907163257.46527-1-f4bug@amsat.org>
References: <20200907163257.46527-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Luc Michel <luc.michel@greensocs.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j641E2m1yY+b

Track the LED intensity, and emit a trace event when it changes.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/led.c        | 4 ++++
 hw/misc/trace-events | 1 +
 2 files changed, 5 insertions(+)

diff --git a/hw/misc/led.c b/hw/misc/led.c
index 1acade1d592..b7e9b1465bb 100644
--- a/hw/misc/led.c
+++ b/hw/misc/led.c
@@ -41,6 +41,10 @@ void led_set_intensity(LEDState *s, unsigned intensity_percent)
         intensity_percent = LED_INTENSITY_PERCENT_MAX;
     }
     trace_led_set_intensity(s->description, s->color, intensity_percent);
+    if (intensity_percent != s->intensity_percent) {
+        trace_led_change_intensity(s->description, s->color,
+                                   s->intensity_percent, intensity_percent);
+    }
     s->intensity_percent = intensity_percent;
 }
 
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 76c9ddb54fe..89d15f05f9a 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -216,6 +216,7 @@ grlib_apb_pnp_read(uint64_t addr, uint32_t value) "APB PnP read addr:0x%03"PRIx6
 
 # led.c
 led_set_intensity(const char *color, const char *desc, uint8_t intensity_percent) "LED desc:'%s' color:%s intensity: %u%%"
+led_change_intensity(const char *color, const char *desc, uint8_t old_intensity_percent, uint8_t new_intensity_percent) "LED desc:'%s' color:%s intensity %u%% -> %u%%"
 
 # pca9552.c
 pca955x_gpio_status(const char *description, const char *buf) "%s GPIOs 0-15 [%s]"
-- 
2.26.2

