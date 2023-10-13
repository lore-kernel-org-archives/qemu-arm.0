Received: by 2002:a05:7022:2383:b0:6d:30c6:dd9e with SMTP id bz3csp1170994dlb;
        Fri, 13 Oct 2023 01:56:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhJHoVVHrWuT/LaRG2AfqkbE08yEAMR87oiVEZ3UOh11rEXG/sH4KQ3KjqSbB1OwZkqFHW
X-Received: by 2002:ac8:7dd3:0:b0:410:9089:6b74 with SMTP id c19-20020ac87dd3000000b0041090896b74mr35561041qte.15.1697187367660;
        Fri, 13 Oct 2023 01:56:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697187367; cv=none;
        d=google.com; s=arc-20160816;
        b=tXjvDfMkq3wy/cLxGXMQnoNg4FkC7dmR5cr88/ORKmXxGnZwq0vxmPPQmqzhlNi/iP
         zanU6EPTTby9Wsv/U0t8xXRvpgwia3wJWFhNKTB273vZ7zC5DA4d8pApVK9HuRNZoahJ
         vJM13H/BznY71Qbo8Pl82xRUHi1RgkQrNzgJNGimC1yHO3YhErL40GUuf7evBb4ZzFT1
         cMo7qNwNraDDgQjaIi9MM2HONUmY30lMLo/nDLdQTDOid3xWy2mv/xRtTKI78LbjraTo
         poE0TnE9Zjj52hqvncxkXKSHFAPrZC8b1v1Qdewgbf2nZqHurafFJ/G+pS7Adx7H2fqc
         N0Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0VENQfQUdQ3dL4N/9O98oBVereDcK/ooYXylgOlWI+E=;
        fh=cF18OC1CawvBZplI+kHlCER8ycHiGLYU96cieEbgLUs=;
        b=qAnWna/7cbum+moB1ZIS6lTpMxWCcJ02lv5m5VYAAhvxEZfh/kuBt4kp5ixbhzIqV+
         2jzzpijU/b5x/TDitKQLtW1AaOdElDqy+QvjLvJYPuw1PzNVPoTbjHP4vqPtHk8XbFjI
         Mx9OIWOCpXnYwggGQhBsvUijE2A2ObwkyWwpFrM7aGh2EvlaSlI1MWJtzQRz8Tb6SCh6
         C8jDerpWYAarXrkgR8FLvuwHIlO9yVFp8rZsZH0NDWAyzdO95o/m3au4fYvZh/eIslrD
         p+CrsQVib5s50GlrVZMgMBnHN/1CZy4JL8byEFvmUKDoCzamI1gAip+WOOW0lB5EBXqJ
         9s0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZWXJ+kIa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v35-20020a05622a18a300b00415184c4490si882414qtc.523.2023.10.13.01.56.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:56:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZWXJ+kIa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrDtP-0001OZ-Qe; Fri, 13 Oct 2023 04:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrDsh-00077b-Rm
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 04:50:53 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrDsf-0001ab-IA
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 04:50:51 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32799639a2aso1707835f8f.3
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 01:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697187044; x=1697791844; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0VENQfQUdQ3dL4N/9O98oBVereDcK/ooYXylgOlWI+E=;
 b=ZWXJ+kIaPhGcJt5JJ0Hqd+UgFEc9KJpTPtOlMA41CXU7pImfB+FXjezgw9fxOmz7WS
 KspRZga+VEeJWRm+bFqPl5Byv9JVYEafqw7r7/GcMeJdLDPB0PMRLAngxz4B9xNNh5NV
 sFahLV6RONDTMizN3zrqXWqTRGpFtzvBZ1CEMriUUgE9JfW3UXYwmN88DBZXFES0D9wf
 acqEXBT13pAqPuZCSfLbUjgsjSRDoArvA2tOogOVRXQsJ8D5hl4UJubpl0U++7Lm37nU
 3X2ncPwrl4MJTWsXYM+Cvaho2k+xtsEuK1Jj+BhBbjZFXnG4URceaeeKrlmxJYYUUn+o
 Nwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697187044; x=1697791844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0VENQfQUdQ3dL4N/9O98oBVereDcK/ooYXylgOlWI+E=;
 b=UoXZmqk/DS4Osv5gxYGJ3BjzD9p9KfPlfcWFD/g/fR5aVeguOUu3uvWYfon4ru1JgT
 d5XAyU128+50fmVjZ30gQV4D8pI7Cn9AqVEoIyHixLzh38HnfPFkE7h5uJFgLyeFBrHb
 6tqGHu4Ir0qVe/42rF9bvjctV+C76QiNJxKEEnh+dm/9EtUXUE8Rk+33N72bLkM1S8/O
 dFH7cHaObh+a/aSoafQIAG4bGUaM//k5Jw1LDAYUeYc+YgkCi0dk6I2edowYUnyIWoVl
 vcePPDQjCR+kEkkZ3TBxsfqOLwaitinCWCxJ7aknsebAwZ3zE5G/ZcrzdKHZWFMItd4C
 10hw==
X-Gm-Message-State: AOJu0YzJuJ33sIdyKBpEWlZTBdLsEoCY3cS97slPCB6Mpx+1xu2sS5Fj
 hsgc+91+ED4tdkYYzZ4C/g9ZXA==
X-Received: by 2002:adf:f103:0:b0:32d:9cd3:6a9d with SMTP id
 r3-20020adff103000000b0032d9cd36a9dmr948807wro.25.1697187044813; 
 Fri, 13 Oct 2023 01:50:44 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 v10-20020a5d678a000000b0032d9f32b96csm569185wru.62.2023.10.13.01.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 01:50:44 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [RFC PATCH v3 70/78] hw/rtc: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 11:46:38 +0300
Message-Id: <7bad24a9243a3d9f0190e2f89c86aa68816de5d6.1697186560.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697186560.git.manos.pitsidianakis@linaro.org>
References: <cover.1697186560.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: Uacx0LMrYUlb

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/rtc/aspeed_rtc.c  | 4 ++--
 hw/rtc/mc146818rtc.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/rtc/aspeed_rtc.c b/hw/rtc/aspeed_rtc.c
index fa861e2d49..59c64b01b9 100644
--- a/hw/rtc/aspeed_rtc.c
+++ b/hw/rtc/aspeed_rtc.c
@@ -78,7 +78,7 @@ static uint64_t aspeed_rtc_read(void *opaque, hwaddr addr,
         if (rtc->reg[CONTROL] & RTC_ENABLED) {
             rtc->reg[r] = aspeed_rtc_get_counter(rtc, r);
         }
-        /* fall through */
+        fallthrough;
     case CONTROL:
         val = rtc->reg[r];
         break;
@@ -106,7 +106,7 @@ static void aspeed_rtc_write(void *opaque, hwaddr addr,
         if (!(rtc->reg[CONTROL] & RTC_UNLOCKED)) {
             break;
         }
-        /* fall through */
+        fallthrough;
     case CONTROL:
         rtc->reg[r] = val;
         aspeed_rtc_calc_offset(rtc);
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index c27c362db9..6b6eef94fd 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -457,7 +457,7 @@ static void cmos_ioport_write(void *opaque, hwaddr addr,
             break;
         case RTC_IBM_PS2_CENTURY_BYTE:
             s->cmos_index = RTC_CENTURY;
-            /* fall through */
+            fallthrough;
         case RTC_CENTURY:
         case RTC_SECONDS:
         case RTC_MINUTES:
@@ -686,7 +686,7 @@ static uint64_t cmos_ioport_read(void *opaque, hwaddr addr,
         switch(s->cmos_index) {
         case RTC_IBM_PS2_CENTURY_BYTE:
             s->cmos_index = RTC_CENTURY;
-            /* fall through */
+            fallthrough;
         case RTC_CENTURY:
         case RTC_SECONDS:
         case RTC_MINUTES:
-- 
2.39.2

