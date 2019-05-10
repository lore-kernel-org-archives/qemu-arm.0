Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1447851wrh;
        Thu, 9 May 2019 18:25:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy6alfxSvMyTgbuBgo/wHHuoUXzvF+SVBaUDDdWpBqF6jYks5IwZ5eRM13XhIbNwgxtNqUQ
X-Received: by 2002:adf:efc3:: with SMTP id i3mr4365022wrp.45.1557451545240;
        Thu, 09 May 2019 18:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557451545; cv=none;
        d=google.com; s=arc-20160816;
        b=B0UeuJ6wDEJZgspjpKy79mYhPNNUM4rLPsUr2pZEsf1n+8gj8P9x3IeuRELq0hy6sx
         wNMT6Z8PjJipAkXF2Wv1k0HrLE+76oen2SANGKFThwNFpveXEKt+n2AhEIN4wEnalswn
         kwyii2kA+aGbuS+4AEYh+0yDO2Lh0zF+fsQ+LK37djgF4LPvrv/uiHxKiQEGoo8pUQqc
         RZ4MEgV0S/fkRS51aY+gOeUBv/ZoqZnYqAq9NJR09+Oxg/Az7A6G6xMVFXT/Zrw1gP23
         rYjGaUng+mmrQyGtcrP4IIkiHpR0ekJOSaW9MxNReFL1oCY50nx/Awyb8Zeb4hSBrAhE
         BGhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=iRt1ekpVqMBTFPlbEkwvccpMEH6z9s1kPn0wCee76Ys=;
        b=E1ssSO47lC3Y+GhLXrpjTd25/vCljYrJhegN/vd5uTCIvQwshskUUmRsvjhdQ1/t9t
         3XkcnukGdTnrkU5CLf7I4b3FicpWVMSugQf0HJoTIItJdN/6/nIvjwRBqqjlXY4neAz2
         O13GHNc1P/vzmY0RDS1X/4ENF26dVXKfwvZ7J620BzLWDZPcBwEIIZzNLhClM0Rc/0zJ
         gsl3r0Ej+NR88rYKYkfGPGjj6+JeR97vYORZypTLEVs8Rj2U2DVe5sfeyOW7ubBPFpT9
         JhQLSru5VOHVpyO/pvNYcRrEuFu8RM5vd+xgmsSvDqBYTPeeP2btbCVkuBU6T2RPKCF+
         NCmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xZKBvI5w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15si2986731wre.309.2019.05.09.18.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 May 2019 18:25:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xZKBvI5w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35012 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOuIC-0006P0-7C
	for alex.bennee@linaro.org; Thu, 09 May 2019 21:25:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOuHs-0006N3-KA
	for qemu-arm@nongnu.org; Thu, 09 May 2019 21:25:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOuHr-0001IQ-PY
	for qemu-arm@nongnu.org; Thu, 09 May 2019 21:25:24 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:37356)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hOuHr-0001Hn-K9
	for qemu-arm@nongnu.org; Thu, 09 May 2019 21:25:23 -0400
Received: by mail-pf1-x441.google.com with SMTP id g3so2262583pfi.4
	for <qemu-arm@nongnu.org>; Thu, 09 May 2019 18:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iRt1ekpVqMBTFPlbEkwvccpMEH6z9s1kPn0wCee76Ys=;
	b=xZKBvI5wkHxN8vjZl6NblWPq5dSgQO4dYbU3Bgo5lChSGqLdi8PvGxQsaPmWTMXKUZ
	prPiD6tUxsooCy/3NbroKaReKsUjU2y7JhTaph/hTZnBk5B/kt0ISR0iUZ5ZAue0M1Dr
	UzJMuyWoGIW85R+sqeMwRFV+6tpYmwVzaBBLSuzYtJdqd+TMvxeQVCCDg5rI02Loah1S
	OtQFJQn1X4liUzI2pp8Zi6UEb2lfk41tWRuSOMA6MN5lizf+F2U0naiPVrRll/cIy9Rt
	A85xKvcWmrTsztX+lZDaTNeghRqz2kOcinMD+0uYVdfZ/UzOaT/dnwhuaY2INaqW/ItK
	6hIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iRt1ekpVqMBTFPlbEkwvccpMEH6z9s1kPn0wCee76Ys=;
	b=EeNKdplLTBJikjVbgOo0jnQqJakdn4JKxbzra2G13wFb9k0v1ps7f6c1NnFtqDZSbk
	1MbgTn3XecB0DjANhuapeC16lj32KaZ/IhQkzceJW37tyt680zTFzS5fBYEn4rQGY+3c
	EU3nuv5uC3CpN6ijzB/L/GNl1BRavB/RZcd4QNBOw0IFUYfPbX8iBE2Nj3IfZFMsb6yA
	UxCVsoUVCzelHaWWV6s9c6f1tWC64xfysfmeCDdK30wxSuD56dSmJHZWAZVWjtZEbMPm
	Q65dIwJNxYsAi3R6Z1WSGzm445WV63FdTEZ1H27Bd6D6lnbmrWFVcyRG1Tn34pf6hJGQ
	W8MQ==
X-Gm-Message-State: APjAAAWiAUOJ2G9FLRwgO1eqh+1dBLBp8XiF9QSVBSurt0KC9JiSWOFl
	E5dg2AwonbMaUl57jowyRDfWHg==
X-Received: by 2002:a62:4281:: with SMTP id h1mr9882033pfd.162.1557451522632; 
	Thu, 09 May 2019 18:25:22 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	n18sm8252700pfi.48.2019.05.09.18.25.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 18:25:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  9 May 2019 18:24:52 -0700
Message-Id: <20190510012458.22706-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510012458.22706-1-richard.henderson@linaro.org>
References: <20190510012458.22706-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v5 18/24] hw/misc/nrf51_rng: Use
 qemu_guest_getrandom_nofail
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6400t3txeQxF

The random number is intended for use by the guest.  As such, we should
honor the -seed argument for reproducibility.  Use the *_nofail routine
instead of error_abort directly.

Cc: qemu-arm@nongnu.org
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/misc/nrf51_rng.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/nrf51_rng.c b/hw/misc/nrf51_rng.c
index d188f044f4..3400e90a9b 100644
--- a/hw/misc/nrf51_rng.c
+++ b/hw/misc/nrf51_rng.c
@@ -14,7 +14,7 @@
 #include "qapi/error.h"
 #include "hw/arm/nrf51.h"
 #include "hw/misc/nrf51_rng.h"
-#include "crypto/random.h"
+#include "qemu/guest-random.h"
 
 static void update_irq(NRF51RNGState *s)
 {
@@ -145,7 +145,7 @@ static void nrf51_rng_timer_expire(void *opaque)
 {
     NRF51RNGState *s = NRF51_RNG(opaque);
 
-    qcrypto_random_bytes(&s->value, 1, &error_abort);
+    qemu_guest_getrandom_nofail(&s->value, 1);
 
     s->event_valrdy = 1;
     qemu_set_irq(s->eep_valrdy, 1);
-- 
2.17.1

