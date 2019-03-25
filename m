Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3719872wrx;
        Mon, 25 Mar 2019 04:10:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyjFbUoMrSDv5AW/BizE1XjVf+HnyMuxgBt5axEdwyCC+LaM2guO11L0Yk9XWZ18JOkLCE3
X-Received: by 2002:a25:76c5:: with SMTP id r188mr19841633ybc.147.1553512229111;
        Mon, 25 Mar 2019 04:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553512229; cv=none;
        d=google.com; s=arc-20160816;
        b=yfW/eQxvsgADZnHAVyDmqz+r4FieYuiBvAbFP7FWkTw9lSDJkxCpwp9GsWJ9uc/GHl
         3fWEKDUob28hx0kjJ1WyxAbL3HwcYJOhEOxYAPwi4J7dV4LjcxaLkM/ll5EQRxxZslhf
         dnDoHW3h6I/SteSEmcrbs8sSYnUDyCv5HJ2fZbSXxOZNuEV2rGp5RNKlo4RO2FQXpf99
         TwOjJNpM0sGVTsF7zqklBrie0PuM6cFFb6QDr903sc326yxCMU4elP3iZTi/gPlc+5d1
         BkMLz9tScDMUjq4AaLJhAnEgQPSYhOQ5JGDntQxf0Pa8mK+1AzEgw2UGcoFyIezpKB0N
         TP4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=193SyYU/5ic0rPxqvJCGoJrg9LVBs/i5Oj8zPtfrl18=;
        b=ACQBVVtutOytImIByhGwDbA+O4j5w38A3axGWI03wD6aRIhDvvE0x4I1GGfdLbzY5H
         RDK4z8P1PtTR45XUBWHVJVj/jEme9d3vXS529b36xmEHhn31LTJfGiipoJOskAv2IjqT
         w7nAM8mv7DgnSogxqSTV7tNxahqB1AsOds8K5cu/3cTGZc3zxI5NO+fnLvlcRUPcx+/O
         00+YGhOtumzcVIoGzcUq4SaRrrvyD9ZJyHAH9rT+fUXzLks1wF+j4E6dm+joMACwlyjC
         CsbfST4meqQU5Q8RJhjk3LJA+V1caUnZ8NKSIhnYfhHYMDtPJuHDWP01hzrcFZf1We5L
         z9+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iGxnBKmG;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=o3jWwBEl;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=o3jWwBEl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 135si9057641ywp.288.2019.03.25.04.10.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 04:10:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iGxnBKmG;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=o3jWwBEl;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=o3jWwBEl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8NUq-0003Ya-HF
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 07:10:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNW-0005NR-4o
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNU-00081y-67
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:54 -0400
Received: from greensocs.com ([193.104.36.180]:38361)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1h8NNT-0007oy-5o; Mon, 25 Mar 2019 07:02:52 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 38B3D7D78A5;
	Mon, 25 Mar 2019 12:02:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511750;
	bh=TViZaoixjVUmZtj2y6Y12CBUXZYUENGeEM/hotObZrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iGxnBKmG/Bk6Hxvd28mqC23q3DXaeQ6MwZ50YGn61ABAraBEkTrq3QFEhtI3LM30O
	zzdmECfMKWLR7cebbcdGQA5I2SCxPByoUe1Dc7HJuvluKXug/bNstO068wcEeyV5YW
	hVk4pT5WqSmlAWe3qUlPGgMWo8+Gf9fJaO6o1vac=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=o3jWwBEl;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=o3jWwBEl
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QBsgpXXUB8Jl; Mon, 25 Mar 2019 12:02:29 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id C86997D78BA; Mon, 25 Mar 2019 12:02:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511748;
	bh=TViZaoixjVUmZtj2y6Y12CBUXZYUENGeEM/hotObZrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=o3jWwBEl+Fy3LB5y5UuZ3Ou2jZwYB7AtpbFFRuswwTm0X3LamZiKAOmH/9szQCp5x
	kljrFj5zUeVj8vXFiFkp3wiEfmBVGgroXh0Bpz8vJKjarOlzQpxs2SFSDLPPOp7oCx
	ueSr3nofnM8oWUPiSqNmxRTbNwWH9fMDsLRpIJOo=
Received: from kouign-amann.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E1C857D78A2;
	Mon, 25 Mar 2019 12:02:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511748;
	bh=TViZaoixjVUmZtj2y6Y12CBUXZYUENGeEM/hotObZrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=o3jWwBEl+Fy3LB5y5UuZ3Ou2jZwYB7AtpbFFRuswwTm0X3LamZiKAOmH/9szQCp5x
	kljrFj5zUeVj8vXFiFkp3wiEfmBVGgroXh0Bpz8vJKjarOlzQpxs2SFSDLPPOp7oCx
	ueSr3nofnM8oWUPiSqNmxRTbNwWH9fMDsLRpIJOo=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 12:01:54 +0100
Message-Id: <b1b153a19e260b36ab8dfe97994196d750b0ecf3.1553510737.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1553510737.git.damien.hedde@greensocs.com>
References: <cover.1553510737.git.damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [RFC PATCH 11/17] Put orphan buses in system reset domain
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
	alistair.francis@wdc.com, marcandre.lureau@redhat.com,
	pbonzini@redhat.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4VspJqWrighg

Switch from the legacy reset handlers to the system reset domain in order=
 to
use the Resettable interface.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/bus.c b/hw/core/bus.c
index 0a60bb4b24..73b215d2bb 100644
--- a/hw/core/bus.c
+++ b/hw/core/bus.c
@@ -150,7 +150,7 @@ static void qbus_realize(BusState *bus, DeviceState *=
parent, const char *name)
     } else if (bus !=3D sysbus_get_default()) {
         /* TODO: once all bus devices are qdevified,
            only reset handler for main_system_bus should be registered h=
ere. */
-        qemu_register_reset(qbus_reset_all_fn, bus);
+        qemu_register_system_reset_domain_object(OBJECT(bus));
     }
 }
=20
@@ -169,7 +169,7 @@ static void bus_unparent(Object *obj)
         bus->parent =3D NULL;
     } else {
         assert(bus !=3D sysbus_get_default()); /* main_system_bus is nev=
er freed */
-        qemu_unregister_reset(qbus_reset_all_fn, bus);
+        qemu_unregister_system_reset_domain_object(OBJECT(bus));
     }
 }
=20
--=20
2.21.0

