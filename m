Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp2682882wrh;
        Mon, 6 May 2019 10:49:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwR7xgNLI/G1yoht99Q81gb2YDk2rBZY2dj3GB93xSCyxhxCCEyik7pBc4mk5WqKgzV9ieX
X-Received: by 2002:a1c:6342:: with SMTP id x63mr17685102wmb.58.1557164956285;
        Mon, 06 May 2019 10:49:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557164956; cv=none;
        d=google.com; s=arc-20160816;
        b=ACTsvvT7EBUGMvXEJMI1WlvWJ2qZ0pu/6pYyuzpdU9cRZ11ASCqBVCMk86G6dG8APT
         3dg37l3dGff/o/WjmVEAGGmIqPkJbDDo2HP8m8hcAXbw/trrK+1qwKwzvttIb+6yCJuz
         ySuukk+jV0/C2MDrl2QJ8bRENF3A07qVgIXP+QzC250aUiJRzH9KguJP6SmWhSqhbvrf
         aGhifG+HSgDner3O5q4T1u/hBa6XlM7+TzW90xtO0Ly16y2Z+upOqo7Pmu3LytVhKjAL
         ZcNFUCJJZX2hBL1zSLQcThhUuzD0WmPzENJ0qR2M6Dm9h24FgWFrW2bUmDbUzMAVvfzk
         ok6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=N99BQlBfn/0a0vkPsRVGBD0Y+fTNw9UH381I+mLvorI=;
        b=Oy5Aqy594y1/AX/uJOvkIcivxoSwQtXFzFPOPz5W31TMxIA9ntieoJWJ0bEJLNNceP
         Dkvk1geyLeZjPG+g+YfcOOebw7Z/J0v68kPhZlFp6utMECBqfYgJkszFdqNfSCzL4ESj
         TpLD5VKCQ9UQiNxt6iCgb7aSWacfUAL4wfbpUUz8GD/PNaTSijlVz8/AcwLEgsNQPHH2
         MlAX9Fz1mx5kBY0hnk/UuHaJ+qo7rXMHeIWS5MJnFH9WQMlT5C8sgIzhYOXD9H2NuQwb
         sv5uYCIewklm2qkJwfmculty2fW67nHLRBLZafjHM99pkui1h3pKb4gLWetNuHGqLRhE
         KGqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dg5+08ul;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3si3196697wrv.412.2019.05.06.10.49.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 May 2019 10:49:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dg5+08ul;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60097 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNhjn-0006EM-Cv
	for alex.bennee@linaro.org; Mon, 06 May 2019 13:49:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hNhVO-0001F3-0E
	for qemu-arm@nongnu.org; Mon, 06 May 2019 13:34:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hNhVK-0001T9-Q0
	for qemu-arm@nongnu.org; Mon, 06 May 2019 13:34:20 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42933)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hNhVK-0001Rk-JZ
	for qemu-arm@nongnu.org; Mon, 06 May 2019 13:34:18 -0400
Received: by mail-pl1-x644.google.com with SMTP id x15so6707425pln.9
	for <qemu-arm@nongnu.org>; Mon, 06 May 2019 10:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N99BQlBfn/0a0vkPsRVGBD0Y+fTNw9UH381I+mLvorI=;
	b=Dg5+08ulJwFtevhdXETSihRnqYW53GxvjPzw9ZR3Qx6fNBXqDsUz+BEg2OG4QoUPe8
	vkoX4Cs3zdwrbURmxP7Z5gDG9uvSpuYLcAl2mt1cL2BfZWIJDouEdvI3YxOExef4pqDP
	m5dU93hcjaSZu/r5Rq/WnMWTNMIyIDCMaIuzmiHaojzodxuIcuUpU7QSkftKg1DT8hcJ
	mNvgznnAm2labFfkUIS9R/KqaLXyETesGAqL8i2q5hn4GBphmnJHBn+SMNi+9FgWyjKF
	xqr9Jb/vVNb6XzFDBMUBx5vJA2Xli40KCjRhl+BZdwcIDuCapR5tZ76B1tHpCOrESQ/I
	5vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N99BQlBfn/0a0vkPsRVGBD0Y+fTNw9UH381I+mLvorI=;
	b=bzHLr/9gNHQGC8SGg06TaG+asconHXn1UtSRXBf8U7+2NZlFqpQNoEVJZMJQWf8k7J
	v8PPVEYGn0RHwCkY4OX9+FJzGxROPGGCHhgn4ojFfce8/WFlMbstURp0WFWdEK7cpRvv
	98lCkgy5CZDKT4WOVkI1NXEjDB+3c1BplC/rdWypRy3hWPLxLuKKjV/PppBMTRmHkCnu
	EryMk1Gm5dF/JBOBmCN2JCP3TjH+MN1L89FIogy3RQ50kWxqdcK2IfJywjxTPlsLRpJI
	kmdu4R42jK7CNvLIk/U1c5qNVQF2xkKjMzhAKNhO2One9nGeYOO/aD7dysIq3QAXC+lR
	ZQKw==
X-Gm-Message-State: APjAAAV7F/9mLuM/sTc6TR4fbXHjiwMjEApDXPxw1gdz+XNJBmTim4Ws
	dgaD2LxFk9UxJjE09NV9LeVwNw==
X-Received: by 2002:a17:902:76c5:: with SMTP id
	j5mr34356896plt.337.1557164057250; 
	Mon, 06 May 2019 10:34:17 -0700 (PDT)
Received: from localhost.localdomain (97-113-189-189.tukw.qwest.net.
	[97.113.189.189]) by smtp.gmail.com with ESMTPSA id
	k9sm2268839pfa.180.2019.05.06.10.34.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 May 2019 10:34:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  6 May 2019 10:33:47 -0700
Message-Id: <20190506173353.32206-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190506173353.32206-1-richard.henderson@linaro.org>
References: <20190506173353.32206-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-arm] [PATCH v4 18/24] hw/misc/nrf51_rng: Use
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
X-TUID: kKm+mUZ0cPW9

The random number is intended for use by the guest.  As such, we should
honor the -seed argument for reproducibility.  Use the *_nofail routine
instead of error_abort directly.

Cc: qemu-arm@nongnu.org
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

