Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2589084wre;
        Mon, 28 May 2018 08:23:06 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLXWS/pyJGLCzSls11qmg1hxHuWjFyivilbU6xQLOK5R3x8FTHLBoq6tt1HRajxwajpFdc8
X-Received: by 2002:a37:ea13:: with SMTP id t19-v6mr11712979qkj.431.1527520986691;
        Mon, 28 May 2018 08:23:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527520986; cv=none;
        d=google.com; s=arc-20160816;
        b=snXHVN7Y7y6uoWYuKBOC7w87UjyMxO9813tK4p5ZkfkkruT0dXtVtjM2e77vWPj3um
         L1k3HHsWXYfz62KhIXiNaXH6vb5jxS0Jdcm8tPDyeaIcSKlK1gLC6a/FMFaPNW6sn3rt
         GqZPBSmVMmmoSKdzVMhOrri6vDDcV6jmJqZVJKopuKml7iH/lwu4rJ9Qegl6isKimCub
         VnNOmbnEA3ZqToW/Sd47gxZz2TKRajj6gHmStUOGbH0Asl6k03gI8vnqDXAT3w2198r9
         FraK8iLy0YzxeyRfqP1Lvy6q6I19PNto8dL7JokKhFMPgOrTo1EJeYBItfUk8VXdDCM7
         p3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=keJ/obweUXMCiRK6NUgn+vv974SVmLZqwQbdmkHCIvQ=;
        b=D5L7uP2eoG1oLpNvjQ01hKlSsSYmrPGTASU2dqxTd+wkFUansKepkrt1nDx3A0g2aq
         w9crm+ha/p97UmIxyCV/MSmy0sClUHNCc8RNlCK3ifLWyLioP3YhVDc8LkqvLevBzNjo
         CbbZ5huWyNK84s5e122Fsjqc/XV6LTh0tQyfw8ndYlrvYYpZjGgzOL2iedXUwHkHL7Mo
         ZJvWP8yha14BKE2/Sh7FefjsgGxZXo/jJS4SRDO3vOfRBuB9E7lqBFFuVrk3qAAHVVWi
         4fOYCJVeoQLHGREpb/FljztcyaprnqtfGYJp4h0mrBb3v0qWhXsWHbctFy+LUJ0Bcp1m
         OgwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UaL2+WnF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t17-v6si7047380qth.259.2018.05.28.08.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 08:23:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UaL2+WnF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNJzG-0002jB-7d
	for alex.bennee@linaro.org; Mon, 28 May 2018 11:23:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fNJyq-0002hC-Cw
	for qemu-devel@nongnu.org; Mon, 28 May 2018 11:22:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fNJyn-000260-Qb
	for qemu-devel@nongnu.org; Mon, 28 May 2018 11:22:40 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:44802)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fNJyn-00025X-LE; Mon, 28 May 2018 11:22:37 -0400
Received: by mail-pf0-x243.google.com with SMTP id q22-v6so5980344pff.11;
	Mon, 28 May 2018 08:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=keJ/obweUXMCiRK6NUgn+vv974SVmLZqwQbdmkHCIvQ=;
	b=UaL2+WnFSrT92W9nIHaafG5sZlxhpIgwbmUPp30hFR0Eu3ikdg19iO+JCFmodbXJ4q
	wQufSy/tPrd83CVwm5iKURVGdRY+bpr0TZKzt7djoWyS51A8vzrUo+gdV0TciA2Q0MuY
	gU7wbxzG77afWrORMLEgUhOkvEgg5DRG/fVZWCL4QpUbp55mClXpjDkw2GGeG0az7F4W
	wAjOz7Pt/AxJaMIJyMMUcNJ3Gsa4fSzabsCT4+wZBUNmD8fP3SgYY2pgXDqbp9aSG1oX
	jyR9aWZ6w/dgWWJQ18d4H3PX1sBd2h9b81PzttqKATWtXkIusai/c97RiMGqjc5UNr7C
	xTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=keJ/obweUXMCiRK6NUgn+vv974SVmLZqwQbdmkHCIvQ=;
	b=autsZaWm3AgtUYkRMChwkOM7AvFXPj/ZvrmrGGu1jAdz4aZ602qKJ63FOBwUj6I1+6
	DvVcFT42l+0NE3KUSoJgWL1oN22giHQ/UW52BeEAy3E/ZesEXnMmiP0BnQ0cGegWtJB0
	R28RlkzwLYwRZ8osFupobdBfgNp3I1kpnrG1iicekqCbRMB3gl5YFnr3MCLBs0ct7HyE
	lJIRRtlt/D26YzghFpM0THSvLLC3VagFiKza4qhyrMIO9R1q4qewvbYkO9+T6/vSY9f8
	jO+A1lGDIPGpu0iHJ21tOzvJjeK3P6huTIhaUPIALbeCkhJwtinf2JFidmMGq7VldPyh
	OkIQ==
X-Gm-Message-State: ALKqPwd1NwkFcCT+NOs6fW5b8iYhuOw9GkTfZm0wgnHh129+LUCsiDa6
	Clrcx48qsamPNnu+9Sqg5N0Mwwfx
X-Received: by 2002:a63:62c7:: with SMTP id
	w190-v6mr11185320pgb.104.1527520956190; 
	Mon, 28 May 2018 08:22:36 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
	by smtp.gmail.com with ESMTPSA id
	a11-v6sm44230583pgn.64.2018.05.28.08.22.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 28 May 2018 08:22:35 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Tue, 29 May 2018 00:52:28 +0930
From: Joel Stanley <joel@jms.id.au>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 29 May 2018 00:52:25 +0930
Message-Id: <20180528152225.7108-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-devel] [PATCH v2] aspeed_scu: Implement RNG register
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IksdweYh+Hin

The ASPEED SoCs contain a single register that returns random data when
read. This models that register so that guests can use it.

The random number data register has a corresponding control register,
data returns a different number regardless of the state of the enabled
bit, so the model follows this behaviour.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - Remove call to qcrypto_random_init as this is done in main()
---
 hw/misc/aspeed_scu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 5e6d5744eeca..29e58527793b 100644
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
@@ -167,6 +180,9 @@ static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
     }
 
     switch (reg) {
+    case RNG_DATA:
+        s->regs[RNG_DATA] = aspeed_scu_get_random();
+        break;
     case WAKEUP_EN:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Read of write-only offset 0x%" HWADDR_PRIx "\n",
-- 
2.17.0

