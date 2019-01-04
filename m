Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp871254wrt;
        Fri, 4 Jan 2019 10:10:58 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4NjLzi3dSkkqXSqkHd47SYAnx1CZyYzE1Jr0BxAnW2wL9AJr109WLai1tFsWfs7AmYYKc3
X-Received: by 2002:ac8:44d4:: with SMTP id b20mr48185419qto.340.1546625458560;
        Fri, 04 Jan 2019 10:10:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546625458; cv=none;
        d=google.com; s=arc-20160816;
        b=mox0pi1KXEK+EwvA9k0MROPSTFzTzDRbdMRWJopb0o/6IVUlJMHdTLb4Mywyqs1EhH
         dfsVisAMWArFtLhAGdIjShskebZpqcDQQl3idY3VyFBq85nI3nJuntoOZ4k/Es2AjPRs
         TR1JhV5NafELW5nLR7OMJrVYoAnC5v3P6oWVVFOjoQF+GOjEK+7SqgXvnvJmFfgVJW4n
         B31399O4nG7bu4H2Hl1IGn4VrD5sqD39UU4C4PKU//lP9nDingWonJaCExYm4MFhWq3F
         1yoYaAdhMlCyarAIUr0ArM6C8F9FtmOem59z+p/A4ifJWEVKAyV6om4VTWzO7FbTYmg2
         CE8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=lu3ZFoibdovo8OGVzQH/0N466TXB2OTlBsLHvfHvUMg=;
        b=nWRSqZlMcBvnQ7F0MFulSvxZg7PmCxKfvCndvdLav8XOqBFF679bs9EZJtRm3FEm3C
         sacnjdndLRu7svOCJl3ahu/PdHguZUJdhc2bCth5Mbmlk8cvHTffkpRKxQjDmDK6J2AH
         cDLK1oDR6bC+ZIZRlMnuCpR2EuGok+NvrTGWRB7dtqyeJbid0VJopIcuIZD66EfYBYIa
         WzPAe6NpMTr+BYa0sT3aE4ZMizIT2kfRK0KzQHutbgwPFOarQHSqde5wl84IOXwzOOW3
         3akZxPNDMKuLIKVqI4GywMtKvRAx7w0Isu0ExTyEwW4CboRgD0/2wxTKRBgHtngOqfgy
         Z/gA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from listsout.gnu.org (listsout.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8si1800037qvp.40.2019.01.04.10.10.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 10:10:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37823 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfTvt-0008LW-UV
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 13:10:58 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTn9-0005bf-E1
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 13:01:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTn8-0005ir-NR
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 13:01:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59939)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gfTn8-0005iD-HJ; Fri, 04 Jan 2019 13:01:54 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6049D89AE5;
	Fri,  4 Jan 2019 18:01:53 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-119.brq.redhat.com [10.40.204.119])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 149545D6A9;
	Fri,  4 Jan 2019 18:01:43 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri,  4 Jan 2019 18:58:44 +0100
Message-Id: <20190104175847.6290-14-philmd@redhat.com>
In-Reply-To: <20190104175847.6290-1-philmd@redhat.com>
References: <20190104175847.6290-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 04 Jan 2019 18:01:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 13/16] hw/net/ne2000-isa: Add guards to the header
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
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AeGUrjpAquvE

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
2.17.2

