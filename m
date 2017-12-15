Received: by 10.223.159.74 with SMTP id f10csp7097671wrg;
        Thu, 14 Dec 2017 19:27:05 -0800 (PST)
X-Google-Smtp-Source: ACJfBotHimcauITfnHrK9mxwxd7Y+KexRCzkHWXT7jFk3NIMwNJ88cjaNvXfoHFlHEpzBP8IdwWF
X-Received: by 10.37.8.195 with SMTP id 186mr6104168ybi.92.1513308425122;
        Thu, 14 Dec 2017 19:27:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513308425; cv=none;
        d=google.com; s=arc-20160816;
        b=hsLZItEqyjyacu8f4pbQCWULOhQxbPF2KPeO0fByz+NL8U7DMvPEo+GqdDQC72sffj
         bjgZaS18VyIjedI2QEaUV9NkvhpwRQDYESTHygpgJdxme5gfBu79CKJeOjSP//xlAZKw
         7XZSbjgXmtFbJPncJOgMXr59fcPb7pIKOzGlMQa82pF4wT4I65EShPk16Yqa2+ET3L2B
         I+7/4cUJ77W/HZr4x/iiwaZCS2tu5iUUx/Eu/YjGLD5VYSxBLSqNjIo4+5XqCjcyMkpu
         aSL8+HdKXDWLppBtOPLz9+kbUnR/YRbbPoWT7FL2hQ/TnJjhEQ5ZJ1ngeTqR1zDNlWb3
         +YTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=THkgUfqUiqXw870D7xLkWUs8/Gqxud/f5zCcdJ/zCgY=;
        b=NqVsaZEq4NZbK634acBBC2IYOVesDQqK54P+pWMjTlH+OVhixFITkIHtLZvJ9fCovv
         sgeQkb44Yaas2KFhun04ef4YnYl00ul9AdqBZJfUgUWAMBrThsaJrMKH1RmhYCsUDVrV
         5f1EjQGRQ9dCWYE1hdx67OCLqhPgYcJh/o6vqIQetwJJM/XeFM4yVWuwQ1T6nIxGAtFC
         nZzd3f2XSYh7MrZHwS2/5WlW8J1qIGipWwZ0wS/BZciiavILzo3Qjel14SDbASYIBflL
         bch+y0Tgm4eFGmpE4CrsFuB6BKEd1Cd/MfB93oR9a5Fz2KceosLLcIq/k5GXxePhWN7S
         bEFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lMUdHpbZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v98si1108319ybi.409.2017.12.14.19.27.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:27:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lMUdHpbZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgeO-0006hi-GN
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:27:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUi-0006Dg-LY
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:17:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUh-0001YH-MR
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:17:04 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:46858)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUf-0001Vp-Cr; Thu, 14 Dec 2017 22:17:01 -0500
Received: by mail-qt0-x243.google.com with SMTP id r39so10523258qtr.13;
	Thu, 14 Dec 2017 19:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=THkgUfqUiqXw870D7xLkWUs8/Gqxud/f5zCcdJ/zCgY=;
	b=lMUdHpbZzsxmPRicTBpOS7hLy27cESp74g+TGpWprqTNaW4WvLmleyVTt1ulglyiss
	0LHWha8TDBVwIsetwNdE8kFoZunll9pEgVg48XzzYbNQw1wMheY+VQF3pX/n7uBURZvC
	gX4VVDsCpdNJrhuEHOBQ4ZTWpWhSbv/ri29MEAiEkLfWfZfHPN+JGqHW6Mi00itPaA8D
	cVVbuQGauo9k0WRwFQ6NRhmdg3cDPiWqhGVAOy0yMr3o6mDbgpfg9oqHVVIvIZShX/R9
	/jxAaqIbD4SMaS+php5C5HFRUJpojE1cKsy7ytbyUODkiXHRF2sJW8qtyL0UfSMyr4Rx
	pKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=THkgUfqUiqXw870D7xLkWUs8/Gqxud/f5zCcdJ/zCgY=;
	b=LXrzWwdUgRUZuHvX94yFxQibIR2ANJh49ihgA5jullJvwCMC0pA0NBntLFAxTbmIJ1
	4NYs5qRv89uNEShUxVB9hVTb0x87nHpI1d/OR9cd5QEMP8uSDMJhDnAnX2++mg7WaDFp
	gM4CgcoGZ/yNjU2msmmTGqG1qIvReWk+V4fruiWqNwngHrQAX1qB2ZY+XPKxi9d/zJ2o
	yGJewitFrDMnD7OtAhgjh0VAO50GyoJPnAacXvj18ZEWW+ZO2DkPJ38RBB9OtryrpjlE
	LnS5wQuS5uU9GKpnWuG5qYnTBN7M9qH92bLSPixYo2RF9lnfLQ9bzX9ZLg6uFwt2SeuU
	hoPQ==
X-Gm-Message-State: AKGB3mIZTppFgNEZSY0pnjJiw9Fqk+J2Yqxjn3Z1bcHCAtYjXpRkBune
	pi1BccQSqUuemHZ6Lj5Rp6k=
X-Received: by 10.200.26.123 with SMTP id q56mr20600127qtk.145.1513307821022; 
	Thu, 14 Dec 2017 19:17:01 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.16.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:17:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>, Jason Wang <jasowang@redhat.com>
Date: Fri, 15 Dec 2017 00:15:40 -0300
Message-Id: <20171215031547.31006-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-arm] [PATCH v2 13/20] sdhci: Implement write method of
 ACMD12ERRSTS register
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EzZm3RtAwvIk

From: Andrey Smirnov <andrew.smirnov@gmail.com>

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 9c1b28d9dd..64a9b26e0d 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1124,6 +1124,9 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
     case SDHC_ADMASYSADDR + 4:
         s->admasysaddr = deposit64(s->admasysaddr, 32, 32, value);
         break;
+    case SDHC_ACMD12ERRSTS:
+        MASKED_WRITE(s->acmd12errsts, mask, value);
+        break;
     case SDHC_FEAER:
         s->acmd12errsts |= value;
         s->errintsts |= (value >> 16) & s->errintstsen;
-- 
2.15.1

