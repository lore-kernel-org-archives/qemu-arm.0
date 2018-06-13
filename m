Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp579657wrq;
        Wed, 13 Jun 2018 04:49:07 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLblQwdVDrINh3AJBS509ENYzlACmJXGztCfHRK4ph4Mo1HCfP+4ublL938UkkmQV5MWlTX
X-Received: by 2002:a37:d746:: with SMTP id m67-v6mr3937259qki.267.1528890547859;
        Wed, 13 Jun 2018 04:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528890547; cv=none;
        d=google.com; s=arc-20160816;
        b=TadrJ61IO3y0C7ScEm10YlPPSFG5OI2tTnHa61ZxK0YPOXlw5O/NI8B0QBMs9tBbus
         dGJyacXg3nx9ps7Q9cKV80qjengZFTVr2vt8kIRuwBU9flXNKE0T0UPPv6k4nrd8yO1e
         D1XuGOw1w3r425rZOBY75y9Ou/QnF7x+Bm+LAmFVk0SUGpxGkN+WvtbLhW+SMnErWFtk
         ovOu+VkDY6yZTtdjCtIKo5cdBKozMhst61j/iH2zfBp8pGiB7SrvfqG/bpnWGQNe+thl
         l5jpgQuH2snCIS8P/F+hkQnef79x2CsTuc4awyupjx/ZyOF5OMoUl3snNS5LpTCKNSoh
         9cZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=jgwnPRRh27YQYslsZ8Dh2Suw4Hfu3PHVCPixgXnYnqw=;
        b=o2i3er1RUHqQgePuJdGhyrRHolB3B9B1npv+P3NaKnsYo4lrYYio3khIjxTA/pb47W
         fseCV0TfOCHuSfoMXMctZBZ0j3ikXnAI5rVgSW/Sj1JLY+rt+O47tCsEkF1b6JYpwD6B
         lKj6LMZ+NDqwNfoBZwL0+aT2bR+6icGj467KlWKMi6BiIEev+s4OD1DEUmdlMm2qeZ0w
         9QslBKYsvcVmqn2HLyqEktgTxRtUf+8GvdviciS5g5MnmAwSU0tYHAjCRwyS/GXN4d75
         W70IvcRRINoby2AWPpo8B/gguAMUiJoQapCzp7q2OkoH+qyBU1gWOnSJacrDtBKE+bTp
         5+yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aTuvvlVt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i36-v6si2526261qvc.148.2018.06.13.04.49.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 04:49:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aTuvvlVt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT4Gx-0000Fe-CF
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 07:49:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fT4Gp-0000Eh-MC
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 07:49:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fT4Go-0006Cx-OF
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 07:48:59 -0400
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:42942)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fT4Gi-00069L-MY; Wed, 13 Jun 2018 07:48:52 -0400
Received: by mail-pl0-x244.google.com with SMTP id w17-v6so1402688pll.9;
	Wed, 13 Jun 2018 04:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jgwnPRRh27YQYslsZ8Dh2Suw4Hfu3PHVCPixgXnYnqw=;
	b=aTuvvlVtO60afbdMg1IDTDK64KZZcsjYJlMu/QNzbGEaq0FRSg03CirOZAZ/InZpzt
	Jslc14b/RduTYM9d48UgL3TjZh8KHCPaZ2MCGYvHUxMfLqAzDXwB2ApxJjNmzBNvOHUb
	oYir9ujvm8GnDsshZZfU8x271dFXNfqE2K/oP2NCB/keRf2aVJjQJogcwfmPWu5VAGAO
	PN0zb04XTcYYIQ8qcdDeJWvaciZw++nRox22Agc302Kdv6VRh4EDZrtqUF97EmxKgtf6
	U+JlaJw9RipGdRIy8UzYrNUDrOR6wFO/owBqY9U3n2h2xwsHqaK6ZpVxU6Ciubpmclln
	J4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=jgwnPRRh27YQYslsZ8Dh2Suw4Hfu3PHVCPixgXnYnqw=;
	b=dhDDPBpkfuQ5Rw0WnAF/xZe46UMcQ1r7ppdqzaZrLya4dMrmyFpxjlD2hkZW8uW2sW
	uTTp/LjLRUgx+24Xse2pLIMatG4OlsxD43rVaQJ5UoYFUaXg0SvF1QfPrQdC2hnbNezz
	1jBCppb9cyvSBbqSudkoGrq/tfBkmjhg4+9kywDAU0m/Zkf3qvNctKXbSu1x2WGHVaS6
	5Q2hXZcT8Y9IhVVhXDhDbJN42ioGl9Ksq2A87p2ptvVDmj0hxHSFTEwlfb0QrxvpasNu
	Vpj5hZqOcJxrgb2PVM2lzRGVNhYBzksjXDdOKwHrvKt2OYrUbLPJsq/iCRVyKSUquzX3
	NSnQ==
X-Gm-Message-State: APt69E2Fm5Q+6a/yQddFVbE3BsvDjX/NcjvIj9XV8L3Vjen6GBWSciGR
	FEBRnkwfeGM/4Xo0vy4w1ko=
X-Received: by 2002:a17:902:1029:: with SMTP id
	b38-v6mr4771604pla.277.1528890531113; 
	Wed, 13 Jun 2018 04:48:51 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
	by smtp.gmail.com with ESMTPSA id
	c67-v6sm4988328pfj.173.2018.06.13.04.48.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Jun 2018 04:48:50 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Wed, 13 Jun 2018 21:18:44 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 13 Jun 2018 21:18:36 +0930
Message-Id: <20180613114836.9265-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-arm] [PATCH v4] aspeed_scu: Implement RNG register
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eCYiH9kae/kR

The ASPEED SoCs contain a single register that returns random data when
read. This models that register so that guests can use it.

The random number data register has a corresponding control register,
however it returns data regardless of the state of the enabled bit, so
the model follows this behaviour.

When the qcrypto call fails we exit as the guest uses the random number
device to feed it's entropy pool, which is used for cryptographic
purposes.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - Remove call to qcrypto_random_init as this is done in main()
v3:
 - Add Cédric's reviewed-by
 - Add a comment about why we don't check for the rng enable bit
v4:
 - Bail out when random number api fails
---
 hw/misc/aspeed_scu.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 5e6d5744eeca..59315010db9a 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -16,6 +16,7 @@
 #include "qapi/visitor.h"
 #include "qemu/bitops.h"
 #include "qemu/log.h"
+#include "crypto/random.h"
 #include "trace.h"
 
 #define TO_REG(offset) ((offset) >> 2)
@@ -154,6 +155,19 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU_NR_REGS] = {
      [BMC_DEV_ID]      = 0x00002402U
 };
 
+static uint32_t aspeed_scu_get_random(void)
+{
+    Error *err = NULL;
+    uint32_t num;
+
+    if (qcrypto_random_bytes((uint8_t *)&num, sizeof(num), &err)) {
+        error_report_err(err);
+        exit(1);
+    }
+
+    return num;
+}
+
 static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
 {
     AspeedSCUState *s = ASPEED_SCU(opaque);
@@ -167,6 +181,12 @@ static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
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
2.17.1

