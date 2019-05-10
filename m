Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1458630wrh;
        Thu, 9 May 2019 18:40:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwW9tsATE8IKiJCh/RkyWiAR4qRzm0g3wUJLn0pkWe6YBo159/qDd7yEBglzv2coypGFdtt
X-Received: by 2002:adf:e44b:: with SMTP id t11mr5576816wrm.151.1557452421190;
        Thu, 09 May 2019 18:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557452421; cv=none;
        d=google.com; s=arc-20160816;
        b=q6MAJ43h1xWcW6g9cMVVfBaqMnqADasG+RtIKE57+Pbzmp1ozcmmCWleCzTdvXFRAi
         uTip/DeRwjM+aPUpKXyRJ4Q4p5uS+oYeUptC3wTnthH07/saAJ2WS8Liv3T0kD3Hgf6Q
         GDX//H8e9Kr/A/z96ADzUZE2VXv5jxjAYVUZbkPVFM3feU2dkj9hOL7CZXU7dKXNzLqB
         Ny4WKZKB1bWpF++bHy0Gxp6lKsEmYlU9W7jRhTpPLnRjM8LKotQy62khHZ65mnqo+EIa
         YFPzSuvdBxbq2YzqEotnrK1DOMZkDCtpbpaSiKHxDAssenU1kMm4Nz5F0XdFhPn+uFi5
         jjAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=CbChhlXQdosoI4MWUK/zk2WTRGwUvizy4vwPQDmKAqs=;
        b=FYR4t/303kUgnlOBj+W7/5IAOCldiPM8tYeb4fgv2SNsUpsqjy//DNxaBn1kSw22Bx
         u1zEL+TR/oRFWiPhssvt2KfwkJusdaQ9jCFVBd8PSuTj/SCEns9NgGrOhnZGmpp91hs8
         pylh8684D/JMX8kioJakft56yLbEtuz1tBtZozGu4De46ZsbT5Gyyg2SZ4ZPIx/u+LD6
         B3i/1kqAWJd1H/dL8wr97wDgdFIFCT3qcF77SxmLvZ1VUtK21xPzDcv3XJgZJacM4hN2
         YpmxqwFFYTJUKz9wiTDWsAJnnmvryHwGR8toIxrOsISrZv5BgrrZzbL4tmWE0I5SxbHn
         zOxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mGlxs+Ik;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si2158466wmm.84.2019.05.09.18.40.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 May 2019 18:40:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mGlxs+Ik;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOuWK-0002uI-9F
	for alex.bennee@linaro.org; Thu, 09 May 2019 21:40:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOuHu-0006Oc-42
	for qemu-arm@nongnu.org; Thu, 09 May 2019 21:25:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOuHt-0001KP-10
	for qemu-arm@nongnu.org; Thu, 09 May 2019 21:25:26 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:39933)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hOuHs-0001JP-Rf
	for qemu-arm@nongnu.org; Thu, 09 May 2019 21:25:24 -0400
Received: by mail-pg1-x52a.google.com with SMTP id w22so2123704pgi.6
	for <qemu-arm@nongnu.org>; Thu, 09 May 2019 18:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CbChhlXQdosoI4MWUK/zk2WTRGwUvizy4vwPQDmKAqs=;
	b=mGlxs+IkXNYa9y7ymy9eoOjb1uY9oIleFJoAdb2sQNqtgw9XGoWKqDvOQQ0KHuyHWP
	GBqOzvAQZXaQyKYddxNliA2cj/LQ+BWNKktDhMxaziCB7gQ7eQ3VxC7waceUkjIci+vh
	O6F/UBGLbxI86EhfpCRx7vInAa41BvVpwauHa30wEjgyaWmYCLFSo7utNrSdLnlnv6d6
	bcY754D/Va8ma506KyuJpKTtNv1e+Ikep8BjK3GEjxEEFggMz6xAGUxoZYkrKskARBD3
	+ujpaYssXBI0o3IXk/rID2La/D7wGbflEbA0gXG8cvQU8wKXyak0+36rK8oM8lnzXXzZ
	fmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CbChhlXQdosoI4MWUK/zk2WTRGwUvizy4vwPQDmKAqs=;
	b=CoKQBwpn2+bZZhMNOp+X2gVycay1rlOYXdukQF6MPFDOts6FJLDz2Re0blAhPAw1Rq
	EBCnW7y4qQEIN1JkFT26VfKCT4WYECFmIr5cEyv75dgrItPkdfGobz2mIbeDCmp+fLKL
	3XbMeqrOHRO88xXVVVuESlQrg67xXJnxjn8Wx5TLgyOLzYA+WFVIx/CcRDmiySRP4DjR
	y8KPl7KlCaJ7AUhmS7Ghia6iVoi90GrV8EyVtFGl4sdtxUQWlbhLTTb1ZUp2hyDXK+LT
	Egv9yY0rNilPFSvjyPvoA6nynHZWECHiKg0MEUqVo/y4gFymOBOKh4oVs0xUJhcgmEub
	V8cQ==
X-Gm-Message-State: APjAAAX4FDAlnPuYh14l4Rkv+n+dDWt3MZITRJD8bLxTvDGta4D0NTgX
	kbbNnDJM6rc2LAVL6V/vubOIFvdTaNo=
X-Received: by 2002:a63:6804:: with SMTP id d4mr9965353pgc.240.1557451523832; 
	Thu, 09 May 2019 18:25:23 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	n18sm8252700pfi.48.2019.05.09.18.25.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 18:25:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  9 May 2019 18:24:53 -0700
Message-Id: <20190510012458.22706-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510012458.22706-1-richard.henderson@linaro.org>
References: <20190510012458.22706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52a
Subject: [Qemu-arm] [PATCH v5 19/24] hw/misc/bcm2835_rng: Use
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
Cc: qemu-arm@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sFgVMSpmVdNG

The random number is intended for use by the guest.  As such, we should
honor the -seed argument for reproducibility.  Use the *_nofail routine
instead of rolling our own error handling locally.

Cc: qemu-arm@nongnu.org
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/misc/bcm2835_rng.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/hw/misc/bcm2835_rng.c b/hw/misc/bcm2835_rng.c
index 4d62143b24..fe59c868f5 100644
--- a/hw/misc/bcm2835_rng.c
+++ b/hw/misc/bcm2835_rng.c
@@ -9,30 +9,26 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "qapi/error.h"
-#include "crypto/random.h"
+#include "qemu/guest-random.h"
 #include "hw/misc/bcm2835_rng.h"
 
 static uint32_t get_random_bytes(void)
 {
     uint32_t res;
-    Error *err = NULL;
 
-    if (qcrypto_random_bytes((uint8_t *)&res, sizeof(res), &err) < 0) {
-        /* On failure we don't want to return the guest a non-random
-         * value in case they're really using it for cryptographic
-         * purposes, so the best we can do is die here.
-         * This shouldn't happen unless something's broken.
-         * In theory we could implement this device's full FIFO
-         * and interrupt semantics and then just stop filling the
-         * FIFO. That's a lot of work, though, so we assume any
-         * errors are systematic problems and trust that if we didn't
-         * fail as the guest inited then we won't fail later on
-         * mid-run.
-         */
-        error_report_err(err);
-        exit(1);
-    }
+    /*
+     * On failure we don't want to return the guest a non-random
+     * value in case they're really using it for cryptographic
+     * purposes, so the best we can do is die here.
+     * This shouldn't happen unless something's broken.
+     * In theory we could implement this device's full FIFO
+     * and interrupt semantics and then just stop filling the
+     * FIFO. That's a lot of work, though, so we assume any
+     * errors are systematic problems and trust that if we didn't
+     * fail as the guest inited then we won't fail later on
+     * mid-run.
+     */
+    qemu_guest_getrandom_nofail(&res, sizeof(res));
     return res;
 }
 
-- 
2.17.1

