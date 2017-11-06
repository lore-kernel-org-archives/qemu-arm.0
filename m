Received: by 10.223.150.237 with SMTP id u100csp2783627wrb;
        Mon, 6 Nov 2017 07:48:59 -0800 (PST)
X-Google-Smtp-Source: ABhQp+R7kKnEU802CyM8ve4H1xNa2RaFrAWEptWWm3zR1itGW4kdG3kL/LtjXGbYt5QBlApFG3SH
X-Received: by 10.37.128.194 with SMTP id c2mr1995759ybm.48.1509983339776;
        Mon, 06 Nov 2017 07:48:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509983339; cv=none;
        d=google.com; s=arc-20160816;
        b=duwOPuQ0tYXvW+HhjW1YFGRdiLFdb8BmqxnoVATTg/lZqqmwHlYETqkH2928Sa/CMo
         fi6r8zGZdOaBeSGPj6IB6wiXRkXOGabRYJxhBUZG46w5dYy3+Mgy2zc55LaL6x7E/V12
         lkS546Z5zPMrUrdtL/iMWAgBDjYyo3Ms/H+jry/+AolSR9+FIk7riCywkXveAFRDAd1P
         Pf0Q/ecjuCk3djBsBa1yNw5LRtxv0tBdR2WYj/tt8b+m2YR4keJDdqYmRZZ0STCTAVRB
         q3olmzdZsC2PenK/AQzrEbwvYG67e3HzYCJZS/YWcA1l+QfsfKyqwLdLqzKmY9S0/vyK
         U2jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=bQXVz+3ZaGZQxv+pGzi011Ap/wEKxrmHydrrlySYiFY=;
        b=DZqrp4c1JqZmV5YfUl4WGJv56jZry+NJowDF36CVW9th6mjfEWfeFLfKoYkkHyz7zI
         fW6vCWuOnal3tgFcBgQ7jbXlfnGFvi//I9vK5fumMUN5UexgTK4nH47nEPYyuu1dvhBO
         KWs5HZsTSNgyJ0k9UPctdRMPn6crRqXsWY9624EGFLxxsS+2qPoxvBdJrdqCy03zgvgf
         PkOTDJJnYUQ7AQooKmRp9Tdl/QspKLTPstJbGW0BDvsvnnlo4amQEf/CbL7U6ETrJAqA
         om/S/n/+6P5cpg2jepfvRBlH2r37jKfOUKFWkCd291YHa2B4Ygx5qLkEGTgJguhpaQq7
         l/Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oRgMnRIP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 17si2533374ybj.285.2017.11.06.07.48.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 07:48:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oRgMnRIP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48761 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjdz-0007D9-5i
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 10:48:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdZ-00070i-Gx
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdX-0000MO-B2
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:33 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:52656)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdX-0000M9-5U; Mon, 06 Nov 2017 10:48:31 -0500
Received: by mail-pg0-x241.google.com with SMTP id a192so8504612pge.9;
	Mon, 06 Nov 2017 07:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bQXVz+3ZaGZQxv+pGzi011Ap/wEKxrmHydrrlySYiFY=;
	b=oRgMnRIP41f3ECl3h2+X1jFBAqWsY8YQ1CDIoaqc3pombwNRlLc69EKqCceg2XjbdI
	HByiOMblRsRQ0tNlFVBKN0As1odVCLHZUbwaKvK2ap+LQF+OmR5hgaq88i9lgaeLQnJP
	HHqU7ZSxW9wnIQnPmSHrpkrM8jfODUG5VXozrfB9YTWKvnvCN18ImjNEX38pIbYpe8IO
	yEvI725JxsL9Hw9cAqGpfVi0uJS20T0JPvw5e6quabfCtBTotEjsSYgfqLvbnBfcPXtm
	NKz4GEjnqjfocacKsR9FD6ueV+V/rHgugy6kg3ONC9m2d53U6x8O47grUCqInHe8sDH+
	zIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bQXVz+3ZaGZQxv+pGzi011Ap/wEKxrmHydrrlySYiFY=;
	b=I4LH49Vj8PwZrFXN2OBgW7hSgolvz82V1aAIQ+gad4llpgx2Gc5ovUjs4/sFkG8WqY
	N45TKL/VGn04JUJfZ7QzLYzE9gOuguO9OMTAiz49HXTa16OIq8dX9evXvKl1Ipi8Sov0
	ZbM+iGis8lD1yEU5TQLPbMgG1H8aozbyrwM3ZXH9tgylqqHpDQz4pBw8Veysv8PleAxy
	KzAiFY6oM647ArwYrd8PDVzVE+edkfdYeaxymIKCFYeUBcx/aj7st4Q/SciPzj4Eq5y6
	Wfdv8PMXOYMygAwCg3zXo4oK4oE/ybbLa3vo2X9TTwI234tcfxiS/wuT224IbuGPx8fJ
	ILfg==
X-Gm-Message-State: AMCzsaVAZNLiOIoexNzDToAr05+lw3nK5BDwFd2E1dQTkQA84hFh8VbG
	nm47QIK3AOliG7gkhv7KcGp42m9rfWI=
X-Received: by 10.98.192.195 with SMTP id g64mr16951163pfk.95.1509983309874;
	Mon, 06 Nov 2017 07:48:29 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:29 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:47:45 -0800
Message-Id: <20171106154813.19936-3-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v3 02/30] imx_fec: Refactor imx_eth_enable_rx()
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
X-TUID: 2UFSV5+V+fWY

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
2.13.6

