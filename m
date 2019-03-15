Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1564220wro;
        Thu, 14 Mar 2019 20:35:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwu1z9HmVpyUejD9h8WdIxhjw+J1wv1KEFWndTqFEREX1IG85JrVbQAbVL0czI2bBiPFxdi
X-Received: by 2002:a1c:be14:: with SMTP id o20mr506019wmf.110.1552620945228;
        Thu, 14 Mar 2019 20:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552620945; cv=none;
        d=google.com; s=arc-20160816;
        b=oGIl/jaDlGnYr15yzJSp+YcZh3gaVdKMiyMX7EiFDw858i+INLEYdqkx0vgPl7RNU9
         Svm1i1xxfOjgeEyONVL9bpQh52T1sDT1PcCVW8CVM1zJyl3JMXiQicUlkdwcjSHHM0UC
         s4zg7NStJ6GmBb2sJjEIjgPByCXahHzh7MqKMwGiHH98PoYKOsj4D6c5CE1XOPYvMDgW
         7BY78q+Wtk4SIpSxmuO5GRgYQFn5pFu645cEkmCNFXQAEfh+5gDb9KOu/IFNBHSVOiC3
         RT0I4QLSOjLMdVeoWwOY3Ra1H36GL5xhWsfCEGBdxSW0QP5tTKtLbaGCTrlQI78Hw0+d
         briA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=wbb+2FtxbsNv9nDIL4ojxmrs2WISC5sGRSdsm2e7KNc=;
        b=LWVVM50Z/t4EsknjvrbsAb+pc6PTPIMg5QqSQ1apgGpJtMlEnMR9onP3NUhtWJx8gP
         6Pq+ZZFk+SjoXUjdoR8kHAqaOsSrd7ltiayrCs4nyMDn33J373ClbVei2BFFHrN6SUvN
         j0XnXNpwfgEtLKATfCvzmxw7K5rZhK4C9hJHYb1p3r8uRNL8hFzUdxiE+jy9QP+t2eRh
         qWXaPRuNV8fCmX/faGX5s3VsxzEhDX0grLTN7jwuKarJipWRzzatupx3+s74P5D1OAHS
         0I1t5nP2h5ch+ZUJ+iAH9x05T3bpO8pZ4ehA7cdZ8fzaMigk45K4ES0xCsC06a4lf+RX
         Dvgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MpbBVGj6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z203si378555wmb.121.2019.03.14.20.35.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 20:35:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MpbBVGj6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48700 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4ddI-0005y5-6N
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 23:35:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h4dcI-0005C3-Oh
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 23:34:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h4dUo-00036k-1V
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 23:26:58 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:42120)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h4dUn-00035x-Pu
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 23:26:57 -0400
Received: by mail-pf1-x430.google.com with SMTP id r15so2519113pfn.9
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 20:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wbb+2FtxbsNv9nDIL4ojxmrs2WISC5sGRSdsm2e7KNc=;
	b=MpbBVGj6KrFs2tVEETUExFUhEjqs/GUUqi28oWfBgjJR2MIBDQpuuWcAmXm72g4VB4
	cT7OFFGEBnx0tpNzD672yvpL7Mh4CYbkC40a5qIfIiY0IJ5UmFFjnhkwHWtmLwi8MEON
	Kjpf6aR3vr/wmvaPrTfIqDq/NMFtuvvoDsLE05uWyAgmNQJCknUugQbYhicdE9JUoHVj
	qEW7+7i+pF72dsesyvegmtp0g7K8ZmjxNJFvcyYPABxUO9vXuwP6zU42EnYLGQzwmcTx
	6gPDIIb1Pmw1BKFDuhJoPf3z3l/7jJQZ2XrTz+502ttXx48AGUNiRwlOeR2IDnq/dO96
	c0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wbb+2FtxbsNv9nDIL4ojxmrs2WISC5sGRSdsm2e7KNc=;
	b=H5wK3SV6YldhQCyFBIiJlZ8HwSE8LZM5rBJxQPJ0Lmqp0sn+6yTOYW/OSuau0AoPbQ
	pvEtpAVrlFaVkZ1S2rq1M6wBLVSCIHcXFqavymROh0tyw7Mkzq7fFDILQWUFjBMRhwkc
	D7iwnnxmk1j7+nxetLG5YrRzXw4Tux8a2hKYSqdP6fYCCvrs4yVwnkS8TOZ5LJAnhYo3
	LTqa7j9WkxR32N53xvFZ+GkzhgH3AuCEeimbi2bROLkeJYAOZlMvGr2GoLGkzPHh/h7i
	ka2K4Vvh7qXZEsDOL0LXzONa/5XyfNEjzoZ9utypWv4GlJRTm7mhL+6IrffsaeroMoe8
	833A==
X-Gm-Message-State: APjAAAUEQJOfjcEeXdiUjU36XvyS357z/t8ksQXbuOr0QFhbUb0A3Icc
	AUihYCOb0WpKzdxeLgVqoG+8QQ==
X-Received: by 2002:a17:902:1125:: with SMTP id
	d34mr1816140pla.75.1552620416859; 
	Thu, 14 Mar 2019 20:26:56 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82])
	by smtp.gmail.com with ESMTPSA id d26sm690816pfn.86.2019.03.14.20.26.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Mar 2019 20:26:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 14 Mar 2019 20:26:25 -0700
Message-Id: <20190315032629.21234-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190315032629.21234-1-richard.henderson@linaro.org>
References: <20190315032629.21234-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::430
Subject: [Qemu-arm] [PATCH v3 19/23] hw/misc/exynos4210_rng: Use
 qemu_guest_getrandom
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pfWDS10Uk4Jo

The random number is intended for use by the guest.  As such, we should
honor the -seed argument for reproducibility.

Cc: qemu-arm@nongnu.org
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/misc/exynos4210_rng.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/misc/exynos4210_rng.c b/hw/misc/exynos4210_rng.c
index 4ecbebd2d7..0e70ffb404 100644
--- a/hw/misc/exynos4210_rng.c
+++ b/hw/misc/exynos4210_rng.c
@@ -18,10 +18,10 @@
  */
 
 #include "qemu/osdep.h"
-#include "crypto/random.h"
 #include "hw/sysbus.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
+#include "qemu/guest-random.h"
 
 #define DEBUG_EXYNOS_RNG 0
 
@@ -109,7 +109,6 @@ static void exynos4210_rng_set_seed(Exynos4210RngState *s, unsigned int i,
 static void exynos4210_rng_run_engine(Exynos4210RngState *s)
 {
     Error *err = NULL;
-    int ret;
 
     /* Seed set? */
     if ((s->reg_status & EXYNOS4210_RNG_STATUS_SEED_SETTING_DONE) == 0) {
@@ -127,13 +126,11 @@ static void exynos4210_rng_run_engine(Exynos4210RngState *s)
     }
 
     /* Get randoms */
-    ret = qcrypto_random_bytes((uint8_t *)s->randr_value,
-                               sizeof(s->randr_value), &err);
-    if (!ret) {
+    if (qemu_guest_getrandom(s->randr_value, sizeof(s->randr_value), &err)) {
+        error_report_err(err);
+    } else {
         /* Notify that PRNG is ready */
         s->reg_status |= EXYNOS4210_RNG_STATUS_PRNG_DONE;
-    } else {
-        error_report_err(err);
     }
 
 out:
-- 
2.17.2

