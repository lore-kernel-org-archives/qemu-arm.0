Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp755087wrd;
        Mon, 20 Aug 2018 07:32:37 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZfsF+mWAKe2G75Etaz8jhwpVw8nAePApy/s5jmxsFrzshzHG+tI6o+WMR7Rf+ok8Ec0FNb
X-Received: by 2002:a0c:8962:: with SMTP id 31-v6mr9628560qvq.190.1534775557044;
        Mon, 20 Aug 2018 07:32:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534775557; cv=none;
        d=google.com; s=arc-20160816;
        b=EkeJPwFDYBVnOY7xBlHlZLb20ZBqBnk8DCb/CscnP6yDV5EL+cyVRsFVK5XXvv7dR2
         sbac3ij+8WaaqmdMzpsbNDeRO6i2dhQoaI2qQobmr1BDg7iKQm6ZD6jQGoI8FkBe+9OX
         lJL6SVnhAmc6VkUaT+vPaGNdsqKqQcKjNCua9gPsOeUqoKJIqWw/Xj/9oOXv836YYR1P
         4S1tD2zcdmPTg1ywMFAvN3MhGdCojovCrJGeRqCbKX6yc41ivEsLL7axjRmbNlBgU5Ht
         IC1YkWCif4Kp6Uugif0VHlDu/wK6hI2gtolFtSCnZbG3euNdFV9yyZG6xLQT0x4qLWFg
         7Xow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=xV+RJsTboDo9aJFBBGRclTLNNLRxNZj61B+x0RnssV4=;
        b=NPXtXrVcmSFao5K6d10TrHY/q9YksJTom6wo2n5L2WEEiL0kjwrxejMelUBH+GY+OK
         9hCnWj1FU/YPVh7v4N1uJvhcG3fYLJKcZivNq5tgkvIkdM2RcnyibBHAA2MpEh+g5ady
         RFKIKzDAmo6wFGXSoO3wGz4LywaKP8vJtjD7ge+mes9arHG8fQtYp4vtWNznitz9cIOv
         eGSkqhZXbnWrhngxFI57iojHcCyNpPgPpSQDiuqT4cDdFSLidD0QuMqZz/zmo3K3zQ3A
         n72E7Z3iOd0Tj5dhw3lTg/UU9wGXV9LJELaz94BZYkyUIvP113RtDVtawOljZnNT8Tg4
         pvTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 25-v6si3170152qts.301.2018.08.20.07.32.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 07:32:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47428 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frlES-0005UC-Iv
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 10:32:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frkuF-0003ef-De
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frkuE-0007PI-Oj
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:43 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44676)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frkuE-0007ON-Fb; Mon, 20 Aug 2018 10:11:42 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frkuD-0003VB-JA; Mon, 20 Aug 2018 15:11:41 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 15:11:14 +0100
Message-Id: <20180820141116.9118-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820141116.9118-1-peter.maydell@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 20/22] hw/ssi/pl022: Correct wrong DMACR and ICR
 handling
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I2GaaLRknWHP

In the PL022, register offset 0x20 is the ICR, a write-only
interrupt-clear register.  Register offset 0x24 is DMACR, the DMA
control register.  We were incorrectly implementing (a stub version
of) DMACR at 0x20, and not implementing anything at 0x24.  Fix this
bug.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/pl022.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c
index d310671d18e..e58247554cc 100644
--- a/hw/ssi/pl022.c
+++ b/hw/ssi/pl022.c
@@ -146,7 +146,7 @@ static uint64_t pl022_read(void *opaque, hwaddr offset,
         return s->is;
     case 0x1c: /* MIS */
         return s->im & s->is;
-    case 0x20: /* DMACR */
+    case 0x24: /* DMACR */
         /* Not implemented.  */
         return 0;
     default:
@@ -192,7 +192,15 @@ static void pl022_write(void *opaque, hwaddr offset,
         s->im = value;
         pl022_update(s);
         break;
-    case 0x20: /* DMACR */
+    case 0x20: /* ICR */
+        /*
+         * write-1-to-clear: bit 0 clears ROR, bit 1 clears RT;
+         * RX and TX interrupts cannot be cleared this way.
+         */
+        value &= PL022_INT_ROR | PL022_INT_RT;
+        s->is &= ~value;
+        break;
+    case 0x24: /* DMACR */
         if (value) {
             qemu_log_mask(LOG_UNIMP, "pl022: DMA not implemented\n");
         }
-- 
2.18.0

