Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp784032wrx;
        Fri, 12 Apr 2019 09:57:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwFfuff3oT9XisDMMJy9bf7DTFyw+q6XLRg0DGE/XL78PDV/EioU2BjCgR6qKqtV1m9KLhN
X-Received: by 2002:a7b:cf2b:: with SMTP id m11mr10994608wmg.56.1555088222104;
        Fri, 12 Apr 2019 09:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555088222; cv=none;
        d=google.com; s=arc-20160816;
        b=F27xQ3w8MDOWG3e9W20fD/sRNxoBxVXsZfILX/Fl8zBKObLU0XztOmQBLE86GgNP02
         uCfEHpIXDRY/okZYMg6I3Ol5MAyaDEsY8/EfNlTWKrF5V9SxptsLBPpHC0f79TtXZ7sy
         MQ4cL4h2K5MOnosI4vmS3stnH0O02SQxafUYSCFOgNvbzh3TCB2J+M+ozvGmCTeDN+oU
         sAT2yEI8Lxw6hNJ6viGz5S0+vWgCHMv8qICHu5FiK4nE1iBE4qYwmx4E8C7PQPCajVzo
         zghVhPc4RNeLnHXW2SiQXqr6n2Jul2hOlK1UAAW9VSv+WIx/4Mupi8Ca6IvGdkIPMclh
         kP9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ei4CkhjSI2gnusxI/IbrvTawGP+mj7Rl0SBVjWRMlM4=;
        b=zxqXzE5ZoEWUy0URDm0NerAjLVBcAVaPj/gVKikp1t7l3dlKp2leRDyr2fVf0nJeAs
         vbclMOnCIYEqHCHlXoG9iTJUoXPzHJEF/rtzTMl/6pyh/YGRWxN/Eke7E3WsMnFebNbU
         Mudy4Ho0fImRGO6UrfMs0CFHh/IplljZLdDXrEotCjoaXlXwnQcCxMAyCL/RfqmF+cNc
         /4ykeAd2WhRBL9wyutHAXsXagQkKjUSGZ8N/JCDarvV/cu2PX25ecJLRb1f+BmgUcc1+
         WitvarC8uu/lK+Y9IE9f5YBtEDX7Aa8GPRYossuoYsh594UFHP8mInd8oAiYX8vtl8B7
         xYkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r128si5773406wma.88.2019.04.12.09.57.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 09:57:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40069 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEzU5-0002VU-5d
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 12:57:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzRm-0000rs-NT
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 12:54:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzRk-0006fK-5K
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 12:54:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58122)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hEzRg-0006O7-G0; Fri, 12 Apr 2019 12:54:33 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CEF6788AC1;
	Fri, 12 Apr 2019 16:54:29 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-66.brq.redhat.com [10.40.204.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E28960BFC;
	Fri, 12 Apr 2019 16:54:27 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Date: Fri, 12 Apr 2019 18:54:06 +0200
Message-Id: <20190412165416.7977-3-philmd@redhat.com>
In-Reply-To: <20190412165416.7977-1-philmd@redhat.com>
References: <20190412165416.7977-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 12 Apr 2019 16:54:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 02/12] hw/arm/nseries: Use TYPE_TMP105
 instead of hardcoded string
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 137Oc0DM/V8E

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/nseries.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 906b7ca22d4..2b710c3d49f 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -31,6 +31,7 @@
 #include "hw/boards.h"
 #include "hw/i2c/i2c.h"
 #include "hw/devices.h"
+#include "hw/misc/tmp105.h"
 #include "hw/block/flash.h"
 #include "hw/hw.h"
 #include "hw/bt.h"
@@ -218,7 +219,7 @@ static void n8x0_i2c_setup(struct n800_s *s)
     qemu_register_powerdown_notifier(&n8x0_system_powerdown_notifier);
=20
     /* Attach a TMP105 PM chip (A0 wired to ground) */
-    dev =3D i2c_create_slave(i2c, "tmp105", N8X0_TMP105_ADDR);
+    dev =3D i2c_create_slave(i2c, TYPE_TMP105, N8X0_TMP105_ADDR);
     qdev_connect_gpio_out(dev, 0, tmp_irq);
 }
=20
--=20
2.20.1

