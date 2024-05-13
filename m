Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp2071949ejb;
        Mon, 13 May 2024 03:11:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdGVWlmtk5USqOcp9J592gE6Z0Cc4b3/dmXWOyeqV+gVD+Yrszgrm8D7DUcMXA4Ms9Kt0Gx3gN7zHLQy64LqG0l8jPf8x7
X-Google-Smtp-Source: AGHT+IEGWHWmR0q9yKdnDzB5CoOr1hhhGG/ZWGiJ/t71qCmF5vxHqyXYuf2X5ILQekk4BlNrdXA8
X-Received: by 2002:a9d:628c:0:b0:6ee:1c59:20d9 with SMTP id 46e09a7af769-6f0e9109abamr8681741a34.2.1715595098741;
        Mon, 13 May 2024 03:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715595098; cv=none;
        d=google.com; s=arc-20160816;
        b=S3r4IJlGAy+LL15NQWc3o7y3Vod3Hut/weo9TQHtjJ2llR9ZgCwUwdUS+rS02K4vqV
         tY2UkIko07b0yR/mGMzPlKTdCMQLVqv5ZclLSs2lugjo1ywK1i/6eSIRfgQfYLa7ytGE
         NrHUdFD1aWAHIpz+MJ1csGWeczgiZCDEpFrTb/ocM3BEDe6SKCuNaGXNgMJxC4jkN/5K
         0TDG4ScfAq3bclfQ8l2ildUpHwaZgxujYTlCVTQywAxyPX/ssCDTBShL48J2l+GPp8W9
         4ZUHXzn6i+KopoZ5pNe97bmhD8D1hjoiGF8X0INKto4jXGGzh/YPV7jnzGbFypu5iZuN
         tI7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zXM+rlyySsEepbdMWPSfQWIUt/cvfwCazjiSQXOTYgA=;
        fh=JMQsjVV587By+C7ouAxk0wsTaK/OhI29vFSo+yWecJc=;
        b=klHj9QWDMfNPWHzXzR4zUp+08SqK4hoGJY73OvyMZkCx5mAhzs2UGP6cl600aMqdAT
         jOA07P58F5rAhpYIQzhPOLX8gahUSwQGDnd3CrIN93tnDrJThao7Dy4dwiI1AEgwOtV/
         L3U9y9mJTPr5x5dm1ahrVcbzmygeIwGsoX9he9RMLr/P1GoJB82gCXLnk8XKVvpHyMku
         NOz1TVyCcoB+I3t/dxcj/yMxHHemzAjpOOw+gwPoMM6Bj40YJYSfMZAeAhGV03mYz7IH
         JjRdMy5LKwpBdI4hIAvXX3B2aOTsKsiXL0mAjHgdH14KwvTqWbst6rNjmgHe5Rh7yfJ1
         OKUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="abgTgV/2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf297223si896451485a.179.2024.05.13.03.11.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2024 03:11:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="abgTgV/2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s6SeX-0005sZ-Jh; Mon, 13 May 2024 06:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1s6SeS-0005p6-ES; Mon, 13 May 2024 06:11:24 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1s6SeP-0006Nn-HT; Mon, 13 May 2024 06:11:24 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a59a9d66a51so947604666b.2; 
 Mon, 13 May 2024 03:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715595077; x=1716199877; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zXM+rlyySsEepbdMWPSfQWIUt/cvfwCazjiSQXOTYgA=;
 b=abgTgV/2ZXL4b709ITYeFKE9gjLK41zQ34pOgMROprDEoVwsx3DAWxElJB8k5r62om
 MaZ5397dnvfUGhc7spyCB+9A5o49IyldbFGoRi5BqUL2VDTlhtlPk4IngW/29ecvchuq
 kuHA/hAWoqkHHP8b5s0d4OwV07EwVKPsrX6hlLHZELABZgtGSp5g2qSpDBb/az1cs/gn
 srJ6a50NngLmnLteX0OkYji99I3Fyl0bnJqWvpLRXyY6usLVDGjNU4zPsfYN63c2K9C0
 rdhdEX8GLlsUyuUkLg3+NSP/dSmeW/N1wsLHfANwXnJvSWJzV+iRVcS+F5AseUIXzcgQ
 wEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715595077; x=1716199877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zXM+rlyySsEepbdMWPSfQWIUt/cvfwCazjiSQXOTYgA=;
 b=HYKOM+zafer5tz8GQIKKphXOA3M5vF1pnJ2If01t34kOAnUKA1W2mgX49jQeqEKHDs
 FQd0iiWLtimExIkKxLVsQYjr0op4MI4tOnQSQoWedUz1K3yaMaaPxXEU96FWQqVesjjX
 BtsMIqb5LBgmOmupxblQ/YJuamKINGvU0v+/PWXd2vh76/zFkaTCxjUo6IxfMFKKA64B
 +VFJacQb8ruvnyyE8rDKq3XV/OgxPG8pPRjaCteqrrgdY+vWHKN+HjwsVr2lPpllu4wK
 pdogh37oC7kufDlSsq+9cEkRyzp7J2SccRdpnu6AFRb1fN59Jjn/7Tq9JBob7jjmbK2T
 7zNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTI1BSArs9rqKkLjuWHTdBtupj4RArxi0Jae70rYfJH9cwHbS1+fZFtP7P9LEahY4HKyfk/BqTP2W0RJS4XIso1prrNd0pDSp2jWu/MViOJY7nvjQ+p0Ftwg8qWQ==
X-Gm-Message-State: AOJu0YxtbtEcuOT/WjDUrVxVmxjenuttgWJgHjMaDEvUWGQwGjbvvEd4
 mEYD6o6e/E6Os0Y7Pl30jOQXy71BzyuY3SnEnAtqN36hNkW2AqVaQy28MA==
X-Received: by 2002:a17:907:6d12:b0:a59:a532:ed5b with SMTP id
 a640c23a62f3a-a5a2d665e29mr756501466b.50.1715595077452; 
 Mon, 13 May 2024 03:11:17 -0700 (PDT)
Received: from archlinux.. (business-90-187-110-129.pool2.vodafone-ip.de.
 [90.187.110.129]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17894d2asm574906666b.87.2024.05.13.03.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 03:11:17 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/3] hw/rtc/ds1338: Trace send and receive operations
Date: Mon, 13 May 2024 12:11:06 +0200
Message-ID: <20240513101108.5237-2-shentey@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240513101108.5237-1-shentey@gmail.com>
References: <20240513101108.5237-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: /sYochkPdW0Y

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/rtc/ds1338.c     | 6 ++++++
 hw/rtc/trace-events | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index e479661c39..ec1b6c40b1 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -17,6 +17,7 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 #include "sysemu/rtc.h"
+#include "trace.h"
 
 /* Size of NVRAM including both the user-accessible area and the
  * secondary register area.
@@ -126,6 +127,9 @@ static uint8_t ds1338_recv(I2CSlave *i2c)
     uint8_t res;
 
     res  = s->nvram[s->ptr];
+
+    trace_ds1338_recv(s->ptr, res);
+
     inc_regptr(s);
     return res;
 }
@@ -134,6 +138,8 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
 {
     DS1338State *s = DS1338(i2c);
 
+    trace_ds1338_send(s->ptr, data);
+
     if (s->addr_byte) {
         s->ptr = data & (NVRAM_SIZE - 1);
         s->addr_byte = false;
diff --git a/hw/rtc/trace-events b/hw/rtc/trace-events
index ebb311a5b0..8012afe102 100644
--- a/hw/rtc/trace-events
+++ b/hw/rtc/trace-events
@@ -22,6 +22,10 @@ pl031_set_alarm(uint32_t ticks) "alarm set for %u ticks"
 aspeed_rtc_read(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
 aspeed_rtc_write(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
 
+# ds1338.c
+ds1338_recv(uint32_t addr, uint8_t value) "[0x%" PRIx32 "] -> 0x%02" PRIx8
+ds1338_send(uint32_t addr, uint8_t value) "[0x%" PRIx32 "] <- 0x%02" PRIx8
+
 # m48t59.c
 m48txx_nvram_io_read(uint64_t addr, uint64_t value) "io read addr:0x%04" PRIx64 " value:0x%02" PRIx64
 m48txx_nvram_io_write(uint64_t addr, uint64_t value) "io write addr:0x%04" PRIx64 " value:0x%02" PRIx64
-- 
2.45.0

