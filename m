Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4114757wrt;
        Mon, 4 Feb 2019 15:23:42 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY4+hak4sBP+edhA5OHDjpckcPyNyDI30GXDK0bEy8I37XcEVdAQUuy8vatHVjbwRifmYBG
X-Received: by 2002:a0d:e741:: with SMTP id q62mr1637264ywe.34.1549322622686;
        Mon, 04 Feb 2019 15:23:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549322622; cv=none;
        d=google.com; s=arc-20160816;
        b=FiQ7WeRTGIT1dyrG27c9BHzKWi9l2p/Pxb4MdsOucUBKcvDDxZb1LzO94n6c2ADku0
         QLk1kWyAzHZEhJfcOwr69jqZZh/U+13mslEJYCkfSblivqFMOlsvdGMr/U/s0ZcRE/QR
         UV4GWrVL3TeVpPpXnzAGxIRMMNUK99HdGNL50flJDb+9TrG7+5R3HgjcM9aomjNr2AB5
         /e3ZVV9kANOJ7uhaI+VNLHsbGUbh+wEu4zFD33plw026qY+L9A44JUq9M7CK76eSLkxk
         rkHOkS53RlzSiZtsP9ls+BNb4VKi/NFSj40uwAxCk56y8yFT5pzD+wvjZB3hfc4ITTAA
         /Zdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=kCYeTYgraMKtbuMKub8S3UAfYk2dLp4B59I1qM0m2ms=;
        b=R5E9LejWe9Z+TPw32bijhQMiGZOZaCpzSiQHJdk4zpUBowwjWtmWGMtE8nHKub0j+8
         SSx+ZqySSBvtZQ68r837l7noX8tUcCCknqhcSktaPc58T4VTr66VNOapKCModFF+AsHT
         IM40AuY6QFUqa/OYTWHexLABngjWEDRMtECGq5+Ckfo3dr/QTYGQHDJjJVJqvnfk368P
         9kteU9xzAc6lFGyn+snfiq6LCsfDCAuSDPz+jYZXT5fRBqBDAnOKepdpZFlJ3mYAvpn5
         1fTk7HTcUcD1+JSqmFOt0lujh0irkVbIRfpo9r5SblAQohnvpPtQhAsjoEJN7VmbQYZ9
         +mtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7si906891ybp.73.2019.02.04.15.23.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Feb 2019 15:23:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50985 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gqnaY-0004ae-3S
	for alex.bennee@linaro.org; Mon, 04 Feb 2019 18:23:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnX2-0001l7-Ud
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 18:20:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnX2-0001UG-71
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 18:20:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46124)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gqnX2-0001TL-1F; Mon, 04 Feb 2019 18:20:04 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F40F5C9433;
	Mon,  4 Feb 2019 23:20:01 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-98.brq.redhat.com [10.40.204.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88A7A63BA3;
	Mon,  4 Feb 2019 23:19:55 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Feb 2019 00:18:13 +0100
Message-Id: <20190204231815.29661-10-philmd@redhat.com>
In-Reply-To: <20190204231815.29661-1-philmd@redhat.com>
References: <20190204231815.29661-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 04 Feb 2019 23:20:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 09/11] hw/net/ne2000-isa: Add guards to the
 header
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>, Thomas Huth <thuth@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ab2fYGMHM69C

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/net/ne2000-isa.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/hw/net/ne2000-isa.h b/include/hw/net/ne2000-isa.h
index ff2bed9c95..527337c454 100644
--- a/include/hw/net/ne2000-isa.h
+++ b/include/hw/net/ne2000-isa.h
@@ -6,6 +6,10 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
  * See the COPYING file in the top-level directory.
  */
+
+#ifndef HW_NET_NE2K_ISA_H
+#define HW_NET_NE2K_ISA_H
+
 #include "hw/hw.h"
 #include "hw/qdev.h"
 #include "hw/isa/isa.h"
@@ -31,3 +35,5 @@ static inline ISADevice *isa_ne2000_init(ISABus *bus, i=
nt base, int irq,
     }
     return d;
 }
+
+#endif
--=20
2.20.1

