Received: by 10.28.4.212 with SMTP id 203csp1660806wme;
        Thu, 3 May 2018 02:06:27 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrYvuqHRy3PVWCt7shkgeccxs4qf/bfUyMXbFoBe4e0q+QR6x0W6tJFw49XavKVZfaBU1//
X-Received: by 2002:ac8:701e:: with SMTP id x30-v6mr8532369qtm.229.1525338387587;
        Thu, 03 May 2018 02:06:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525338387; cv=none;
        d=google.com; s=arc-20160816;
        b=ZbcQL58cC2/uc5v/F0vUYCeW4yu1PeUCVyWbyRP86k1bhyqjBq9kl2jfPFz6Vn0pak
         YTped+B4W5hzr9qk5/29DGreBU/2vW0A5nC+lsyvoJuaY7RiZgkYMZguBa9cR6JMHRn6
         OxEOfdu3UraJzjMjk9nQ2B7nUTrHq7gCJYRURQZA7LdarA6wGeuifVv5XiusXqWQ8kbu
         1cYnW+Qqq0h3lpKm0a32wYXS3s+2YskzFUE7+tio5xEKOt/aIoy2FzAZHmo2F53kCfCQ
         DKb9CNfWrYEC8z0Uh4o4k98o915PIPYMRUr/rdp84qyDak92n/kCqW2ywbmZkHLsi2Hq
         +aSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=sYa76pQcrvBDR660MIUVnEbn3J1tHKaClZMtIOYr9E8=;
        b=SPg4CU6uEUEtW+YAoRX2sXm5wGVfBabmPCy4ox75dvtt8eaMacNKGgZTSorXg1na+r
         vnUkvt1ZnsaY9SliFV/bLMFroEFiOUe41ZTwD8X8Oeoj5ZtQ7POzX5F1dp7W3VMFCb6b
         FkjhFYTy5198c4Qd/y/IUogEOaBbDn0r+BzqBD+u+scwOyGKDZQesRhfomntEglutZ3M
         u3aSxKj6rtoKyFmljNmynek6RnZmqDm66KIgxj5mLQyfEbzCwB22do8cUETQDMGylNEJ
         t7eW7BEDZ0/Ez6cnBSONVQfddbmO6AuaFB/hnzgqs+maWPjof5IltZCtWyBjWnghjfIm
         KXHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xj/ss6By;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q27-v6si1930293qtj.288.2018.05.03.02.06.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 02:06:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xj/ss6By;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEAC3-0002RK-00
	for alex.bennee@linaro.org; Thu, 03 May 2018 05:06:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fEABk-0002MK-SV
	for qemu-arm@nongnu.org; Thu, 03 May 2018 05:06:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fEABf-0008Ss-6d
	for qemu-arm@nongnu.org; Thu, 03 May 2018 05:06:08 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:39184)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fEABb-0008Rf-Gq; Thu, 03 May 2018 05:05:59 -0400
Received: by mail-pg0-x241.google.com with SMTP id e1-v6so1320678pga.6;
	Thu, 03 May 2018 02:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sYa76pQcrvBDR660MIUVnEbn3J1tHKaClZMtIOYr9E8=;
	b=Xj/ss6ByLFb/qYWnaw3MtMUnWveEih6UdiMTb3IMQnQUqr+QAkU9vYN7vSEGILN36a
	7C0/GSPCOhIPyU5JSFXI9+/jakADayTuSZ3ozgPaHgKNwCQXhnAf0jKBseAWJ249q8NB
	al0r0HOTAYbtucF0ZpLOOh0mxQshR86nAHdp7ylu2tch6zpyQ0b5Any9kUU6Rt8Yhebr
	rCZPN5XNeM0DEBm/k07nxfP6nKz9V6Hu+u3MVJ9vza5MAws74cNbuzhbvY3bOOs26Ksg
	AKPdrWytBqCsqtxBuM+Vm5qelxv9HDihlH8o5CM26i0cXeuD4D8jOiMBO68A8w5EDQDR
	viuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=sYa76pQcrvBDR660MIUVnEbn3J1tHKaClZMtIOYr9E8=;
	b=KTce/HZbH1oYwGtxiJ0KkSYUAopnKenwkKX4s7SQqmBmtvsYmXBsQV/j39vMNcFsH4
	uMQWouElVXRd178Wq3mT6aGJcjuWyu/7EXPcw/ffCdfZ7MQEpDJpJDYj4ghnjtq3TFYM
	377a2SsJCzf5aTRJSBgye8pZ8ZjkoJG75g0k2sX4ufucMbrwy9+TfTW3lwe2LbtO4w1A
	I8NGonF+nGl20oeNL6kf5L8MCK+OiaK7ohEaPVBi3+lad0Z5eRdpSN5dzC9I8w2LTowH
	3NVE7YIAcERgibp7+cgULbeNg+VVWzLfw3SQrZnsIDMYxnTTiCeQdeBOM7tFDPK4Qf7t
	/9ZQ==
X-Gm-Message-State: ALQs6tC6N2UfiZoMXbNfozN3usAFn/ks1PsuFczNFlHmKTiB2htdxbK8
	WHZlBH3Zf6SRcFF3vjGGvBE=
X-Received: by 10.98.170.24 with SMTP id e24mr22158936pff.107.1525338358477;
	Thu, 03 May 2018 02:05:58 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
	by smtp.gmail.com with ESMTPSA id
	b3sm25504874pff.11.2018.05.03.02.05.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 03 May 2018 02:05:57 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Thu, 03 May 2018 18:35:51 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  3 May 2018 18:35:32 +0930
Message-Id: <20180503090532.3113-3-joel@jms.id.au>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180503090532.3113-1-joel@jms.id.au>
References: <20180503090532.3113-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH 2/2] arm: Add BBC micro:bit machine
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Stefan Hajnoczi <stefanha@gmail.com>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sKoA0lKjE9vA

This adds the base for a machine model of the BBC micro:bit:

  https://en.wikipedia.org/wiki/Micro_Bit

This is a system with a nRF51 SoC containing the main processor, with
various peripherals on board.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/Makefile.objs |  2 +-
 hw/arm/microbit.c    | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/microbit.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 1d7211850454..c01e7a1e39fb 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -35,4 +35,4 @@ obj-$(CONFIG_MPS2) += mps2-tz.o
 obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
 obj-$(CONFIG_IOTKIT) += iotkit.o
 obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
-obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o
+obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o microbit.o
diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
new file mode 100644
index 000000000000..b61d0747fe56
--- /dev/null
+++ b/hw/arm/microbit.c
@@ -0,0 +1,33 @@
+/*
+ * BBC micro:bit machine
+ *
+ * Copyright 2018 Joel Stanley <joel@jms.id.au>
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/boards.h"
+
+#include "hw/arm/nrf51_soc.h"
+
+static void microbit_init(MachineState *machine)
+{
+    DeviceState *dev;
+
+    dev = qdev_create(NULL, TYPE_NRF51_SOC);
+    if (machine->kernel_filename) {
+        qdev_prop_set_string(dev, "kernel-filename", machine->kernel_filename);
+    }
+    object_property_set_bool(OBJECT(dev), true, "realized", &error_fatal);
+}
+
+static void microbit_machine_init(MachineClass *mc)
+{
+    mc->desc = "BBC micro:bit";
+    mc->init = microbit_init;
+    mc->ignore_memory_transaction_failures = true;
+}
+DEFINE_MACHINE("microbit", microbit_machine_init);
-- 
2.17.0

