Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2434750wre;
        Mon, 28 May 2018 05:47:05 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLuRRT/T+9YX1OErzEQ/LjsaQvEwJ1JZshwcAVjvibBtX9l/894VDyshJPzJ9MiAJI0c1AS
X-Received: by 2002:ac8:2b5c:: with SMTP id 28-v6mr12302624qtv.117.1527511625405;
        Mon, 28 May 2018 05:47:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527511625; cv=none;
        d=google.com; s=arc-20160816;
        b=ncwOADBD6gI8QjvT68vTb+EMO+gpfp6Y3BMdDo1MCKmEBX8b0hOzTiVEM6wcYAk5uc
         JqdXzlEn6VAjaj6CYWjtogd65kOsBD5thoJuHNEr8pkFXIo6z1m5IyHWksjsYHEr5CW2
         527yAjcwikXy7q61ukN67QFR/559z/zqRKQjB6TuSR49u+EhAcO08XZDjHh1mIiL6C8N
         vYY4+NAywQRn/MPXvGRKt5MnDcxwg7qlQCVlcb1Q9k9lzovCc5Vmlr1CMt9NBV6ArqDJ
         R84bt7d0AIXAvij7BED/w75Ma87APTuWnVmXNQY3g1fXT8rH/DN+7ZVdvwwxbPGRqHz8
         /gXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=/EnknxN0WvhkCqzmTeyninFC1hLj/4VSgVtjDPxAQNY=;
        b=I6EfFSR3zhl3IJeTMNHT+G4OB7FugsbafC+G4FArvsvIj+J+Jaow2EUHTI0G23l32Z
         kp7THwYLgwXrUI3Cbn1CzqIPI8jN0pLwEpkcv22v8ZB7Tnk6LN3H0qQGRvVS08NWrXth
         nrnEjl6gwV9/S5w1HRHFoYQr6NXIAisWhEBj3Y/poqp9oZpqqiJdwwfzo+Sw06iSpO/0
         9xuvHtbxqDuNdUvlpCqspnwCkHoTD2Ltff816Cb+KB6avovDzbUERLesivPT4faEcibu
         HS/qKbbmhRamYpCld3/2QsUqVx/bT1WMtz5sO38xsPdA4D4V12PUSzg0jNh0sbO6CIb9
         tj5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=G7iVq6PA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c22-v6si3555081qtq.106.2018.05.28.05.47.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 05:47:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=G7iVq6PA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56051 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNHYG-00019g-V9
	for alex.bennee@linaro.org; Mon, 28 May 2018 08:47:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fNHXt-0000z1-1F
	for qemu-arm@nongnu.org; Mon, 28 May 2018 08:46:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fNHXs-0001EI-71
	for qemu-arm@nongnu.org; Mon, 28 May 2018 08:46:41 -0400
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:32827)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fNHXj-0001AD-OF; Mon, 28 May 2018 08:46:31 -0400
Received: by mail-pl0-x243.google.com with SMTP id n10-v6so7175998plp.0;
	Mon, 28 May 2018 05:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=/EnknxN0WvhkCqzmTeyninFC1hLj/4VSgVtjDPxAQNY=;
	b=G7iVq6PA5iHvcRwd8dFqWBjzMGnG/H2jREWKGtKXvSKox3QavwjOvNyRRKkODFfq8x
	Jf1yBMSxIs/n0FSM4APYMsmS1Ibb4mi2a+3MheSUsV/N6dcAE+kTTptYpCSY9z+wVTAJ
	hWocEUIpJHNVyQ5Y7N9Cis+C5WI2l3bpVu3nKWwq4NIHYIhcT/RGcELltmQL6irYES0T
	lPd3pg92VqhXaaju7J4hRpMT/Ln7luNOC1bszZyokUF7+KH20u2vAIcA/f0gQjbQL+Ee
	SI0D7STke8a6DJ70CaLD2B+U/ivL5C3N7d7qEnUXWWHxv2e1fs6Z0pQOPLmhSnSuIkAk
	UaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=/EnknxN0WvhkCqzmTeyninFC1hLj/4VSgVtjDPxAQNY=;
	b=lGNHrhbRaUst0cNHv44wFf1ihA/Kc4tER/LVLgvmdxeg262QMu81I2/6JKuKqsnKay
	445FnxUfLmKtf2wTGyPqtSKIKhI54RZxX8hsx9efiR6F8HUZUjj2XbFmP0rySx2utf9R
	Ok0UB5XfHYtHU4d29vsBGlEhA7OK2qw5s+jfkBCWa/PuaHqWQhbDDyNUoWNYdTnB7Wal
	iJz1Ai5Dudb5vS469xI1/8RKA2x8Lxk7jKrPDjrTV8iohWM8ms3QXHn3Y+eg2YZIE0t+
	0yvKuY/ku9sXj4WTfr800V4aur+SW65L7mRGWtZjZelm+PARUjXys7CSAyNP+PnlizqV
	tV3Q==
X-Gm-Message-State: ALKqPwebwS6Acra9ulcRxW7qhEt6Y3bzX4sv98keir8AHswsRX+L96ZD
	pVJEHXn7kq74Clf/ZXrLHK+2/+bD
X-Received: by 2002:a17:902:507:: with SMTP id
	7-v6mr13685304plf.259.1527511590204; 
	Mon, 28 May 2018 05:46:30 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
	by smtp.gmail.com with ESMTPSA id
	s8-v6sm49880916pfh.30.2018.05.28.05.46.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 28 May 2018 05:46:29 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Mon, 28 May 2018 22:16:23 +0930
From: Joel Stanley <joel@jms.id.au>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 28 May 2018 22:16:21 +0930
Message-Id: <20180528124621.22977-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH] aspeed_scu: Implement RNG register
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
X-TUID: fQ45/UPeTzLr

The ASPEED SoCs contain a single register that returns random data when
read. This models that register so that guests can use it.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_scu.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 5e6d5744eeca..8fa0cecf0fa1 100644
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
+        return aspeed_scu_get_random();
+        break;
     case WAKEUP_EN:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Read of write-only offset 0x%" HWADDR_PRIx "\n",
@@ -287,6 +303,9 @@ static void aspeed_scu_realize(DeviceState *dev, Error **errp)
                           TYPE_ASPEED_SCU, SCU_IO_REGION_SIZE);
 
     sysbus_init_mmio(sbd, &s->iomem);
+
+    if (qcrypto_random_init(errp))
+        return;
 }
 
 static const VMStateDescription vmstate_aspeed_scu = {
-- 
2.17.0

