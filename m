Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4219785wrp;
        Mon, 16 Sep 2019 09:34:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzHuQRIxTah6NVcpJlJNaCXEtjby8gRx4C9n7jvpvgVTdAZ/SjIZVcxebomKqedq+tEVJFT
X-Received: by 2002:a37:2746:: with SMTP id n67mr929472qkn.368.1568651640180;
        Mon, 16 Sep 2019 09:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568651640; cv=none;
        d=google.com; s=arc-20160816;
        b=UFfZm5Ooi594Ymkg1XU07+GQc2UVzddfiTrS5PknVLGB+2k7lPknUUn89WRNo3cJtw
         vCTUzQbKhwmqgu0g4rFQNKSEp3xOVC8pY0gdMpM05EqW71KxrAgzYWfewHV1LDBg2zC+
         HviEvLV16qRZAH2WEl9OnOnVkoNpjukeh9TjEth4KJxfasKOaIL2k5VfkwwxmwYhbjzY
         xsO3rohruZP3F27PaQJXS6a/LWjyMElmXVFhG7sx35iXtpD3TBgO0RX5N20ZawFOADrG
         hsfACBO7sqZH8dd8dHGsA6O+0kl9kz7oriC9CF4WqrWfyWGWuLz6AaDKi1djIPek8quR
         i8Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=GpwoH1G6pyu9/lSpSnc9hrbQ7oVeYCYko6BLIsnO2SQ=;
        b=gkGL4p31QBVfgIK+9JsgYfCFkHTjLTS71Z1l7LqEsxXS9uupNrlEc4moKqvYxtPB80
         wJu2YvH5s573ASWs7WqtgeRJz9VK3zy7k+kjNvpfGqE7yyS3/+Sn+e0XAOg0QKHqfRqx
         WxdxNeWXPyX1NiWeFv2boqCgfP7VfbxjoDjL6I3r7s6VWZKsuzCYVqu/PjkmjYhoZUDv
         Is6SNisRbcYLd2baoejt4vmjWlXS/Bx3FyTFbqmCtX8vORVM/F841+pZ7TLyjR9svi+L
         hr8q1VP7fgXYEuezdVIYPvB7vbv/1CI5jXDjy3U+no1uWdrJPBuJb+2BCH/N2D58UA++
         k94g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k52si28807371qvk.147.2019.09.16.09.34.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 09:34:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i9twt-0000aH-8E
	for alex.bennee@linaro.org; Mon, 16 Sep 2019 12:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36102)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i9tJ8-0003yP-En
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 11:52:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i9tJ7-0002qz-9e
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 11:52:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40572)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i9tJ7-0002qZ-1A; Mon, 16 Sep 2019 11:52:53 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1B4DCA2666F;
 Mon, 16 Sep 2019 15:52:52 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-115.brq.redhat.com [10.40.204.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5962D19C4F;
 Mon, 16 Sep 2019 15:52:34 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2019 17:48:47 +0200
Message-Id: <20190916154847.28936-14-philmd@redhat.com>
In-Reply-To: <20190916154847.28936-1-philmd@redhat.com>
References: <20190916154847.28936-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Mon, 16 Sep 2019 15:52:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 13/13] hw/rtc/xlnx-zynqmp-rtc: Remove unused
 "ptimer.h" include
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AG9wp1FbfeW1

The "hw/ptimer.h" header is not used, remove it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/rtc/xlnx-zynqmp-rtc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/rtc/xlnx-zynqmp-rtc.c b/hw/rtc/xlnx-zynqmp-rtc.c
index f9f09b7296..2bcd14d779 100644
--- a/hw/rtc/xlnx-zynqmp-rtc.c
+++ b/hw/rtc/xlnx-zynqmp-rtc.c
@@ -32,7 +32,6 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/irq.h"
-#include "hw/ptimer.h"
 #include "qemu/cutils.h"
 #include "sysemu/sysemu.h"
 #include "trace.h"
--=20
2.20.1

