Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1565675wro;
        Thu, 14 Mar 2019 20:38:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyAVRU0BDsvWi59W2fwH+DMAPEYGgIM9YdGknTSAMzS/+wF1OTh9AQp7s516WkAmIxFMDKW
X-Received: by 2002:a1c:cecd:: with SMTP id e196mr546430wmg.31.1552621090156;
        Thu, 14 Mar 2019 20:38:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552621090; cv=none;
        d=google.com; s=arc-20160816;
        b=dX0c2frgYgwIx016Y7hC0sUs3MPS8LM4X4Vfc2v/3rs3MugeCcPo0N5czb02L5VOg6
         L/Rhf7zdoJKUFx07iZfKBj7CDdVIFPeRX1ysc/xgt2NaCgETNqtK2HMTy5MOhz9+JxF7
         owDZzEWYDrhdIQMtsk2d5lOdjLVfJCR1C0mrByEgpKcF5b+qESsimrf+SGqkW6uXl3tW
         JmkXKJYaIBxTRBBXpOVlutHTNokWk3QmCcM3a/ikKdUouoDUDD87LqJVGp6QSbVxLm6p
         OxxRo876VpMpiVUtG3GqGSIPiT5lchHP+2CmXoQ33amS9M3coLwv4ctjNNKaZU0reLS4
         0jqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=XMJVRmxir4vbfLAyTItoiDoux1wKrsQiL1gSDEPlj4M=;
        b=vnG0bOecM6NAWJJOmaBLx9tdSgTdfkvE1J50MNCRVW3sGYOMroSEGVuY+4RdNf4SRv
         fpcUkdYr/mqMJCfrJmrHWJg1uYrgCAKoxt7kl0m3aEF91oaVqBMitEVGhiq1SwBQn9v4
         gb9k24j28chHTkxxwIEAuQaDN0HzoAu1IMNuTPwMWcEKIkms54IEW7/XPnK6BbjC1hPs
         ED2jWaleqqaj0c+GVsnThn/vkP9SlbaRqCZHxunYWXl16z69pXTMGS0PUG4TvoWyRR3y
         /7N0bIWZebvz4YU9pyRM/gg4m/+DOhZQ7EfJj3E9XFCC9KeQxq+Smrqddvk7P+Bg7cWR
         TMAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SjjUwj0D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8si416263wrn.132.2019.03.14.20.38.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 20:38:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SjjUwj0D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48720 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4dfd-0007o0-5S
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 23:38:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h4dcJ-00059H-PB
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 23:34:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h4dUk-00030z-03
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 23:26:54 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:40504)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h4dUj-00030D-OG
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 23:26:53 -0400
Received: by mail-pf1-x431.google.com with SMTP id y124so5272407pfy.7
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 20:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XMJVRmxir4vbfLAyTItoiDoux1wKrsQiL1gSDEPlj4M=;
	b=SjjUwj0DUmXlWaQVjmBAR0mLmUigqY+iu0LKulaVGDW1cO5tt636tS3ngti7U0o9p7
	t05Mg6hSUUtT5wmQxwaH/RLWz/nQCUguWfHZUTt/wwF/lGiRCscOJZiEfuOXcFXKtXfY
	uTmbMz/T0/T31NB/LGm4BgV9TBD+myO75R6aLuPFl0OzIPsQynZxDoe89z7XlzitgEep
	bOPHbBcczF1v+bCtKH/cqlWCvg4QH0/uwQPIEZKPDqvXn4ApDXzCtyDPjJHbIXoZYSMZ
	besBzNAhJgSRXgQfAM/bvfOX/U5pipTxmMcS6zPIgQef3UafpnoB6gDMnzWWzwqIVWo2
	8aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XMJVRmxir4vbfLAyTItoiDoux1wKrsQiL1gSDEPlj4M=;
	b=j9z9/sYN4aq9A2ktZYQ6X6yZL5M6TZGJTkoT0gGEwylBrCPyfSkyltkA33TDBsfbS9
	CiMLGVINayMVheiQmTc16k/td3TW7Hw+ZR7J1+nBsUnMn8S2ZetRHDqwRHhp7raymqSD
	6GhlUnlP9sdCwWlToXOSHYh2/t4dHrJG3t4WPNnjwOZr/PSo+iar8AUgT9nAsyNoiAwk
	0FCAmxxDMV3Rm+Pb62IZSuqYudv7YB6hDpxc5++IK+U/lB7rtgp6fgF+BlZTIMzIfDOz
	Tr9t4tERz5MJjo4q278HcPv8+KfcF8BXPU2xbsD552KVebu8eLUHPbb2LqK+qfWYnE7I
	f3bw==
X-Gm-Message-State: APjAAAXcUZddVYnhi3s9qvvs36KumYsfbiY6KW5CoUcy0EJhricAVmg2
	AT4q6O5ZPBN1pdXRLuvask0VzN4qAOY=
X-Received: by 2002:a17:902:421:: with SMTP id
	30mr1809917ple.142.1552620412804; 
	Thu, 14 Mar 2019 20:26:52 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82])
	by smtp.gmail.com with ESMTPSA id d26sm690816pfn.86.2019.03.14.20.26.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Mar 2019 20:26:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 14 Mar 2019 20:26:22 -0700
Message-Id: <20190315032629.21234-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190315032629.21234-1-richard.henderson@linaro.org>
References: <20190315032629.21234-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::431
Subject: [Qemu-arm] [PATCH v3 16/23] aspeed/scu: Use
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v46ob466AgXK

The random number is intended for use by the guest.  As such, we should
honor the -seed argument for reproducibility.  Use the *_nofail routine
instead of rolling our own error handling locally.

Cc: qemu-arm@nongnu.org
Cc: Cédric Le Goater <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/misc/aspeed_scu.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index c8217740ef..ab1e18ed4b 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -16,7 +16,7 @@
 #include "qapi/visitor.h"
 #include "qemu/bitops.h"
 #include "qemu/log.h"
-#include "crypto/random.h"
+#include "qemu/guest-random.h"
 #include "trace.h"
 
 #define TO_REG(offset) ((offset) >> 2)
@@ -157,14 +157,8 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU_NR_REGS] = {
 
 static uint32_t aspeed_scu_get_random(void)
 {
-    Error *err = NULL;
     uint32_t num;
-
-    if (qcrypto_random_bytes((uint8_t *)&num, sizeof(num), &err)) {
-        error_report_err(err);
-        exit(1);
-    }
-
+    qemu_guest_getrandom_nofail(&num, sizeof(num));
     return num;
 }
 
-- 
2.17.2

