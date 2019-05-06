Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp2683862wrh;
        Mon, 6 May 2019 10:50:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwHN+cHesdhNmFU+sskGHNyNQPTg4hfQUsl+uTWbcVadvq1hmxbRYtzjAqpPqSHtPYIf2Dh
X-Received: by 2002:a5d:5108:: with SMTP id s8mr1671454wrt.99.1557165015388;
        Mon, 06 May 2019 10:50:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557165015; cv=none;
        d=google.com; s=arc-20160816;
        b=vy2WaIaw2hWeogpSPcBij3bDSguN8Qjq3I+zCCheC2Y5cBVynWWPP4SgXRUStjoFgz
         cMJ7ERWz6aDQoBNu2c+qZFevjWsyhpL6gUDCj9RrUiXU9x2BsXOq3IJawmkvDQ+xV9ep
         bcImm+P3gAYox4T548OgitbegGVYfPdLr2wcnTYVbo/Lp7Ex3Zqvb0OJC+j25x+OPZCG
         WcUbiG2JC/59ZfLTs/4+w+/Gzgyl/DWZb5dpw3d6gD99TjL1+Kj7wvpyHYKihTRM1FG+
         PieB+8cRNa8EJy3vXzg9heUqjZ3Du3FYa5mTMl63l8Oy/BJq5KpE+5Rbg+3M73UV5Lnd
         tX/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=WkMgXREw0aoSQxhQGI3jtOyJDuRA2/EcPM5PhnT27hg=;
        b=N9VPEO8hdcb+N7Y7WMf6pdRgVY5UDLaVFK8fPOwGPVoo0xejzJhIN+CrCcPzdfhN2W
         x0xbFohd8uzQA4SiocApE84pCAfU1a4mtgZTJhAZjWb6Rnwzffo4CRWsLiPXr4/IgNl9
         riU7on8gPpRG9pbYIp+rdUMQ6D5uNOoZIfGdrw0f4a/VoyeuDSRleaH4qCGg6E4fmlyX
         Emj+QefK8H6ut53LDkG7LKwew8C8qeO88tdz6anShnxGUyd3gVt9cIT7+dXIhXTqweBp
         27W31611t6V/yWRQvUEUTKX92UtFgAgKDD7kxcW1VPtngEHoIhIwJ18I9S9/3Y7npdom
         dkIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M0lQsOCD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j27si6389138wrb.51.2019.05.06.10.50.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 May 2019 10:50:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M0lQsOCD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNhkk-0006tE-FG
	for alex.bennee@linaro.org; Mon, 06 May 2019 13:50:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hNhVV-0001P6-6G
	for qemu-arm@nongnu.org; Mon, 06 May 2019 13:34:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hNhVU-0001ch-6e
	for qemu-arm@nongnu.org; Mon, 06 May 2019 13:34:29 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:33276)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hNhVS-0001Tm-5B
	for qemu-arm@nongnu.org; Mon, 06 May 2019 13:34:28 -0400
Received: by mail-pf1-x444.google.com with SMTP id z28so7145840pfk.0
	for <qemu-arm@nongnu.org>; Mon, 06 May 2019 10:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WkMgXREw0aoSQxhQGI3jtOyJDuRA2/EcPM5PhnT27hg=;
	b=M0lQsOCDnQ1jXB8oOlUdFWQEnQl2GKBcG39v9z7yxfTA5yax80UsmGLJL3XbgGwRIZ
	w8RJlHAQ+ehS6e7VcrU2IsXp+KANuR7/iwP+VM7eBCxb8meC1VxMltyitzx7SzJSURXB
	DGQ5EC3fnwwcmYznShqkqR/yg6BzPaEQ/6GBcRCBPo46g8zOui0qUU6qqeB7ZAqfrPXh
	fJS+HIVgnBy55567Zj7eJvPEHlLg/tjyAnB3ndc9hC4scZhErZmcpqtLnYs1mCIWagY4
	clTC+PnhZ5/8tS9DSZg0TRAnlj2cFe22ajUUea5otUju4fD5s2PThdjBIe4zBwyBSs98
	T+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WkMgXREw0aoSQxhQGI3jtOyJDuRA2/EcPM5PhnT27hg=;
	b=W3nffw+wHzQ6Ln5lxYAq4MPrs+CVZGhhLZetfcTcVaIOF6aXtMz0ov5qre9u7W7XBX
	ObxzM4jZlKFFlL5WAGPFTSYnOAzFiSbJUrMFOAnxSrg01mJ18Pi2KI2Awr783KcKrS3d
	nySThwwoXYWlfErwx3zhYGTKg1S2iWcx2qegWOUDC5wkKAyzFSJDCikApMN1IHQIWVlf
	AMzaiOWX/HknTiGYV79+zH94NRkjpiNlQ3PtI4cK6wL4Sg638D20QFHGD2kOWqWClrMN
	dhwz+SrZzpGKjaxM1+THGeXJdM4HvrwAKeKQFl5vV1VNVNcC5KjARxoBCaKaO8L+r3Ba
	g2tw==
X-Gm-Message-State: APjAAAVeXbsXv0bsfisq3Hw9HM4WnvDMTMA5ob+ipYMMmeEaehk4kFFk
	3CzWY5pJ+RsX8LzcOR0wCWwzYLPZ+Ks=
X-Received: by 2002:a62:5915:: with SMTP id n21mr34013649pfb.180.1557164059592;
	Mon, 06 May 2019 10:34:19 -0700 (PDT)
Received: from localhost.localdomain (97-113-189-189.tukw.qwest.net.
	[97.113.189.189]) by smtp.gmail.com with ESMTPSA id
	k9sm2268839pfa.180.2019.05.06.10.34.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 May 2019 10:34:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  6 May 2019 10:33:49 -0700
Message-Id: <20190506173353.32206-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190506173353.32206-1-richard.henderson@linaro.org>
References: <20190506173353.32206-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH v4 20/24] hw/misc/exynos4210_rng: Use
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
X-TUID: U0B+tQAjC6jK

The random number is intended for use by the guest.  As such, we should
honor the -seed argument for reproducibility.

Cc: qemu-arm@nongnu.org
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
2.17.1

