Received: by 10.223.161.27 with SMTP id o27csp229828wro;
        Mon, 23 Oct 2017 13:11:50 -0700 (PDT)
X-Received: by 10.129.141.5 with SMTP id d5mr623109ywg.184.1508789510592;
        Mon, 23 Oct 2017 13:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508789510; cv=none;
        d=google.com; s=arc-20160816;
        b=FUH8kOUwXRFMhDv+YiJ7oaqsLuf7lYbYci/4Zx2ygs+lSQuwf04dDCfqsVW5Hml3Gg
         Xn7Iw077JIBqwQYXjN9Uy0nYjnaut5tnCEGpUgx9dCM47JBuVQZZQwFM5cLAiteTmW7G
         DofEh8KnMKMiTOiIO5Fge52wpJNdoGjgZEvmLNMcj8X1YTZU98DzotQd6dPYHvrp8z4K
         NsDvZoJme4mhv6fujgTfyS8YN/RKV4rnp7o7jj4/TJ3Ouk+PpDWMCyKYbd4vtV29xZs/
         qh1hJg30SSthlbFJlmZAwbUTd+1ONVdWJpitMX2x0wqecomhPU2gWZJKQBBlCjQma05V
         EUfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=h17Pqnilkz0hCyGOWOyihM9V6YRuS6kqpc24yee7Hck=;
        b=bYH5d9YHAWp6rZsava8GW3kxELtfz31pfducPwN7oazBorBISumoExIuQbgFZmclDh
         jlbJQMndgqCHhPm7W5CFcnKVOjLUBuQh1Zj587SqQ6dAi17pl+zkmfeWlc5riIYtTOxU
         fNGcUl6h1ULFmJ8vf3oFp/xJAxeWpfd5oRMFUGvfOPxBIgJmRbiMZrkrrTdxTFSLGJRt
         L01try9xwnyVdRNAgimPuGe+oKdkdavOERgy71e4cxt+VbK/Z9LwTatLfWM7UI7S7HmK
         vsUSoPz+N/jZWciB5Mr6I5fm3ukeUxLYlIxeGH6wxu7NQgCKeXjU4TPqQDqH/QFnIwpf
         sZRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Hy+qMeEx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n16si1096870ywd.336.2017.10.23.13.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:11:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Hy+qMeEx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6j4f-0000Pr-Sx
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:11:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4B-00007M-VT
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4A-0002Qk-Ix
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:19 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:55426)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4A-0002QB-DD; Mon, 23 Oct 2017 16:11:18 -0400
Received: by mail-pg0-x241.google.com with SMTP id 15so7944625pgc.12;
	Mon, 23 Oct 2017 13:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=h17Pqnilkz0hCyGOWOyihM9V6YRuS6kqpc24yee7Hck=;
	b=Hy+qMeExqIWBYDjjQFR39WdDF/EQvvWCuDNPOBSh3wLyJ0m5BFVMn6bqalruOUH4nN
	RtTsUR8hHc9s/MHlg1KRXLfKA7uppqipmtFe92ffChRL3clEPaYuWVPrS4/9Jaq3TjzT
	8UehlTLQ+SX0xOTUo/an+QXOUf4XJZTrCmeH5jwgazN3KeBPxS3DGX6Jh+lszRVwTBMj
	04Pj6MmJDI9l3gVzOH9TIYJrgE0I7VGcBKztaKZxO4BRbrjvJ8FDU+18NBlNDSFLvY5u
	UpNm9c3opHmvdDzntykvyxv1Cwn4PRpNt+OBNrkYRImHodLIVqGZt3sCAfFZrHdTPU2R
	IU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=h17Pqnilkz0hCyGOWOyihM9V6YRuS6kqpc24yee7Hck=;
	b=DTPiG8dTSuESnwL2VJmc19Xh0mfzO2XrltBrQLQtdbFOA1HogcReE/EaicjV0a8g4x
	BaqjWeyBvjFQuQ0Ov3vw+K9Y+tjImflbzoS7kvdN1pBpXdWApzmwmx3AStNPcyzu03uQ
	PouGUzUkDTMQ79buLV9x9xZc1dMaf985CrGnomwBa02PBF72XruU50UxvokFhHA4bgmP
	+pTalMwLcHUY2YNIgWmmaxMCEtY/Lz4oq2tCnBDD40/zAKuJItUUY7y3FpedjIR2+fnP
	5CraJV3+Pm9wEyJ1CwH3i4Hx46/KEdfXbCubEmTMCb7ELAs4CZFWtPf/0UzbC6/fg1+o
	9TzQ==
X-Gm-Message-State: AMCzsaXgV7gnJoXdN9m8yf5wv4KNfRhNi9buGIRG4pf2qA6bGfcNYCkZ
	jK/b9gbjm8q66krHoyWOKGGYgVsp
X-Google-Smtp-Source: ABhQp+Tkn0ogAH+BDKJQBbz6Ev2DNhuoGP3CiYAjUETGVdwzC1XTLi/+vr4m0ATvBfD45Y9puGKTrQ==
X-Received: by 10.84.134.164 with SMTP id 33mr11303621plh.323.1508789477347;
	Mon, 23 Oct 2017 13:11:17 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:16 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:30 -0700
Message-Id: <20171023201055.21973-3-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v2 02/27] imx_fec: Refactor imx_eth_enable_rx()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ujyKqnvKkiqZ

Refactor imx_eth_enable_rx() to have more meaningfull variable name
than 'tmp' and to reduce number of logical negations done.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 88b4b049d7..8b2e4b8ffe 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -536,19 +536,19 @@ static void imx_eth_do_tx(IMXFECState *s)
 static void imx_eth_enable_rx(IMXFECState *s)
 {
     IMXFECBufDesc bd;
-    bool tmp;
+    bool rx_ring_full;
 
     imx_fec_read_bd(&bd, s->rx_descriptor);
 
-    tmp = ((bd.flags & ENET_BD_E) != 0);
+    rx_ring_full = !(bd.flags & ENET_BD_E);
 
-    if (!tmp) {
+    if (rx_ring_full) {
         FEC_PRINTF("RX buffer full\n");
     } else if (!s->regs[ENET_RDAR]) {
         qemu_flush_queued_packets(qemu_get_queue(s->nic));
     }
 
-    s->regs[ENET_RDAR] = tmp ? ENET_RDAR_RDAR : 0;
+    s->regs[ENET_RDAR] = rx_ring_full ? 0 : ENET_RDAR_RDAR;
 }
 
 static void imx_eth_reset(DeviceState *d)
-- 
2.13.5

