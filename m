Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp785751wrx;
        Fri, 12 Apr 2019 09:58:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwqoIOXRQjmfIfZrdxCTiQCorP5kx5C0avK2YGaFtoU1K95gTEX+JxuZwnVjGJIzk5wvJBN
X-Received: by 2002:a1c:3982:: with SMTP id g124mr11740210wma.25.1555088338557;
        Fri, 12 Apr 2019 09:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555088338; cv=none;
        d=google.com; s=arc-20160816;
        b=Ai4/aiW0waYYa88MVHzmDD2CnMPfVVJ257BjfU3yfRoyOSKmT4PTI4ajTxooN5Hxb0
         B0arUpRTsxTLOa57fv62CbkoR2drVywH2QMVHsOWICztdHBiBDv4s71TKFOCIefw0vwQ
         x5XCPooqU9gKm5v0NDZOOoE4Cu6Xies4DpHBGdjEIMSifzyRZ90eFvOe8eoCv1vhnCOo
         ck0xoluywesCpSXmNgp5uM5bLKPHb2qWPGu5oC0dRARUTB1ZicdW505PODrGG0xiHjXQ
         6pMXb+9NghLtdKgxjB/hZ7WNp28LWq2zzk87m13MAEd9p0NEKd0BIk13OfKIyXgpiajH
         rESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7E6nKVmmMxdokKLngqggx7BrqY283Ru2gbdKmD9qilU=;
        b=W3BuT8cjsusUsZm8cUcJnpyg5BRby1onjaWmHk8L2JQ7NfqfGvG6es34BuQg7Iyd7D
         zE7qhJqp7ZwbFI0eEAW4sf3Zguv7tcRd+ZqR7JZR3uS27oZLO+wEeQKWLwdaLfg+vSVN
         zCcN3QLa4Q3yAkN+BMF3O2Bz/HswoHV+HHepRdfMtPwF32QRqN6YK3yd69uwVdRlzGuH
         8hKlhvAe6We7LFYwJV81Ii2HdpxF+otoFXfzCyxn/rf56NuxyvoEUlopdnL23K/ABbgm
         yj7gPjMrDlVsWQxoUhcVdP3i5friXgNBoo4eiraReO1Wfk8pqajkFBrKwtdxgOlaPNsg
         SeOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16si5697953wmc.49.2019.04.12.09.58.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 09:58:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40091 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEzVx-0004UN-IP
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 12:58:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzSG-0001LK-MY
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 12:55:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzSD-0007ru-RV
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 12:55:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40202)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hEzS8-0007Xe-7G; Fri, 12 Apr 2019 12:55:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF5353082129;
	Fri, 12 Apr 2019 16:54:55 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-66.brq.redhat.com [10.40.204.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ECB860BEC;
	Fri, 12 Apr 2019 16:54:53 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Date: Fri, 12 Apr 2019 18:54:14 +0200
Message-Id: <20190412165416.7977-11-philmd@redhat.com>
In-Reply-To: <20190412165416.7977-1-philmd@redhat.com>
References: <20190412165416.7977-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 12 Apr 2019 16:54:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 10/12] hw/net/ne2000-isa: Add guards to the
 header
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
Cc: Thomas Huth <thuth@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U1IYkctYmApT

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/net/ne2000-isa.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/hw/net/ne2000-isa.h b/include/hw/net/ne2000-isa.h
index ff2bed9c95d..527337c4548 100644
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

