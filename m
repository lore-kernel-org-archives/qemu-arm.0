Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3139249wre;
        Mon, 28 May 2018 21:20:15 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKgR6JTv28fQncW0z9HNH9UvBcogZCdWBkPq+BbFNv/L562BZHNhFM8iSSSX6YRCAjZiYgv
X-Received: by 2002:a37:c0c5:: with SMTP id v66-v6mr14291395qkv.194.1527567615583;
        Mon, 28 May 2018 21:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527567615; cv=none;
        d=google.com; s=arc-20160816;
        b=f7GZH4/HueLVcuwq0j2SL60OJemgLmR+VHmCIJAGdFK39om719LzLfCek6F0Gz2yVb
         7srVG9aI0R4voM28JvIoHQ2ZWA7dFvSlswV5my/PLMtqsrLSrZna0HEapSxek35yoq+z
         mQBqq1fpflx+aOAzM2QlEKb1vjh0Pqpah+qSawL592JmrWBnwXU2Dfl5erKXDIrY3+ZN
         6LtYPJaJSc7H6COgM2cCSCi2UvWf++iuzeKsGeEZOywKh4lyFCMspoyDjXA83F0UEnyK
         NKtbf37TKDW+uCL2pZCFgv7oavSqCoK41zCttmpWgsURw283zRQnggDBmzboUIdX9JKm
         lrTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=JV+Ci9ekYscGMpKyph3ZhuflAPe4bzvXwHunA2FQ5y0=;
        b=C/WDK0R7XBhIR8cdQ4y0x8bdOuyX2+Gy1SdsVf0d1gAgwzVl7XwifVXhBA1sM3janV
         uX//r20wD+4wzb9uwoQLKKU2jLeIRHUHfoQCSqGFK3VqSqXR2UwXpbMf3s6xVhSJWjzE
         GExYgAWzqSCLsG0Li4ETBdOaunMPx+0EqongQEa3cxL/Q7MMm7yru5FHr/8rUeFg/xdK
         lXxlDpjAB8gfc1D2qh8pvr49IfZqR2IAsEUk13kkipHCGPlEYkOu/bMb3v0s/HtjKkm1
         9lTO9ykKTdsx0tzkgURzv+mKAFO6QN/UvKhGqZyrBUurSLLzbkKCx0bZriNlo0YOKKVr
         iJ2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PB5NBGDp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l9-v6si5103313qvb.262.2018.05.28.21.20.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 21:20:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PB5NBGDp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNW7L-0007Zp-3S
	for alex.bennee@linaro.org; Tue, 29 May 2018 00:20:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fNW79-0007YT-GC
	for qemu-arm@nongnu.org; Tue, 29 May 2018 00:20:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fNW78-0000IP-IG
	for qemu-arm@nongnu.org; Tue, 29 May 2018 00:20:03 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:37138)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fNW72-0000Fj-G3; Tue, 29 May 2018 00:19:56 -0400
Received: by mail-pg0-x244.google.com with SMTP id a13-v6so6000459pgu.4;
	Mon, 28 May 2018 21:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JV+Ci9ekYscGMpKyph3ZhuflAPe4bzvXwHunA2FQ5y0=;
	b=PB5NBGDpJCwDy5eYgoenfnDmEpZhveM1ocoMPRR4DEVReQYnSz6GcC9rjII8TqANqW
	e585Fef3Cw5nD4dcrikr1fGuz//+27JfG+cTYCS7At0is+NNJrswx0n1dp3oEiPT4AVr
	q65vPW3LbQj7GA+6HPep4d7lUCEpEI6q96JoC9l+kFBI81dPbJpBPTVQWhFaOPQ8f9ax
	JJiICezCmWrBHt8YnW9Xnn6evnLj2z6zy6e7po3g2dQghcdc0ThJeJpQmjTsWXra4cbL
	wOm9d/QBINDzRbNBThRntVJBhyV9j0aohIgfMd0boYy2oOeuA3WsU71Z4KOB08OKsz4N
	hfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=JV+Ci9ekYscGMpKyph3ZhuflAPe4bzvXwHunA2FQ5y0=;
	b=Th8Y4LG+eAswfADyibR1bPtBxw3Edl2S6NK+/Z3BskADKyljJLyW4om4++Xr7Fv+JG
	ygnQeThLNXGl9QiPXpRadIgVC5jZ7GEtX6d99vpE/XAGxVM1q4OVYB2lBYitz1vTUnI9
	ag0F9xBqC1D4sUSc+Xx2vtZmxL/Ehof0//TEqxvRzalYleL/eXYtAHBsuyrPAGz3r352
	1c5Fsd71pRi2EPuDw85kuD/Bz3raXaGOxXpOJ9XKLwwAOE4anU10v7dHJ3bcMojA9/SU
	gJBt2vJ4u8QLBadyUuHlx+XJu6O1nPcOVR9zyJFCshIbxlYRPB00IuvasSPYidar0KkR
	nenA==
X-Gm-Message-State: ALKqPwd4po+flmntq9Ebk6m4ah2VBzUCOD8slOI3RCdezxp3vsZT4G3i
	uXL4Km6MsY0llZxnTr39npNO4uiI
X-Received: by 2002:a62:cf43:: with SMTP id
	b64-v6mr15747679pfg.248.1527567594939; 
	Mon, 28 May 2018 21:19:54 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
	by smtp.gmail.com with ESMTPSA id
	76-v6sm74547456pfm.178.2018.05.28.21.19.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 28 May 2018 21:19:54 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Tue, 29 May 2018 13:49:47 +0930
From: Joel Stanley <joel@jms.id.au>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 29 May 2018 13:49:46 +0930
Message-Id: <20180529041946.9481-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH v3] aspeed_scu: Implement RNG register
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R71kotRyosJD

The ASPEED SoCs contain a single register that returns random data when
read. This models that register so that guests can use it.

The random number data register has a corresponding control register,
however it returns data regardless of the state of the enabled bit, so
the model follows this behaviour.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - Remove call to qcrypto_random_init as this is done in main()
v3:
 - Add Cédric's reviewed-by
 - Add a comment about why we don't check for the rng enable bit
---
 hw/misc/aspeed_scu.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 5e6d5744eeca..96db052389cc 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -16,6 +16,7 @@
 #include "qapi/visitor.h"
 #include "qemu/bitops.h"
 #include "qemu/log.h"
+#include "crypto/random.h"
 #include "trace.h"
 
 #define TO_REG(offset) ((offset) >> 2)
@@ -154,6 +155,18 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU_NR_REGS] = {
      [BMC_DEV_ID]      = 0x00002402U
 };
 
+static uint32_t aspeed_scu_get_random(void)
+{
+    Error *err = NULL;
+    uint32_t num;
+
+    if (qcrypto_random_bytes((uint8_t *)&num, sizeof(num), &err)) {
+        error_report_err(err);
+    }
+
+    return num;
+}
+
 static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
 {
     AspeedSCUState *s = ASPEED_SCU(opaque);
@@ -167,6 +180,12 @@ static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
     }
 
     switch (reg) {
+    case RNG_DATA:
+        /* On hardware, RNG_DATA works regardless of
+         * the state of the enable bit in RNG_CTRL
+         */
+        s->regs[RNG_DATA] = aspeed_scu_get_random();
+        break;
     case WAKEUP_EN:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Read of write-only offset 0x%" HWADDR_PRIx "\n",
-- 
2.17.0

