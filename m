Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp107534wrp;
        Thu, 3 Oct 2019 16:43:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHVR/dh0y/7HyC99sjxaAGZL7Cyu5dCrv9G/F71PgNMNy4WaVhnpLOJaeBm2KQgjx7noZZ
X-Received: by 2002:a50:ec81:: with SMTP id e1mr12427111edr.107.1570146199487;
        Thu, 03 Oct 2019 16:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570146199; cv=none;
        d=google.com; s=arc-20160816;
        b=0Hk/DdHBqemOETMnigaFpst4zUH39Iji14JSWdlXN8E7elbTdOXiJ/jx1SKOk6J06t
         w+FBD29DjqeNfjLj9RbpwTFpb6gAP1Rh3msG05Q13pIEziemPH5wu7oE0n3dYO0wpXaj
         Ckjy2LyWbHazcFws+bvalPM1K3oD+g/87XIp/bjfxA0S1lxuNdtplK7yEe6rCM72uhVi
         RDviVsW4/WfGVxGA2JjxkgXq6PHJzn6qq1pMX/JFPCnY2MtVibyX1qfxtObh9mFHgyOF
         rj3wQEFv2RKqMMwdIcWHY+PlfyCy4fKvuyWAs44JWccFvnbk8/Gx4lKYfUWtFLWvH7Rk
         htvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=U/lE0t96AsuEWd78d5VwXp/h9Y+5FWNw2HSuLZMhjlE=;
        b=S2vQvQAf92RKtgMnbts+W84klH3HcqYLS1kJs4SEjo4L8akyx8Q+3e0ARQPih+hNmn
         XEN++E5OH9O2wynCg1uLqvvEVeKhFPW8gaQxfpgjo/+OnMpKhpxHdoAGewgEf8wrcGGG
         8udYHMKi/brF7SMlOKeNOL1N6YGGegANrQSrW00BYPXtH+jdzFtbzYhsTMegWIZwAFyI
         KoE1MYYaqbI0Vhg1qemgc45Cj/H8R9Pv07CykfR69FfnQV3mDXZbhxyt5maj+VPH/Db/
         8kZTXQB8zgsv7KOqvdIgwUgc/1PjbVdpJX76SrmyhxSxxydW3yi0hGGj1vtGpEGKlZNG
         5kEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si2535894edb.238.2019.10.03.16.43.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 16:43:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGAkg-0008Ms-C2
	for alex.bennee@linaro.org; Thu, 03 Oct 2019 19:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46861)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iGABd-0002PU-33
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 19:07:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iGABb-000764-Oc
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 19:07:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37032)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iGABb-00074y-Id; Thu, 03 Oct 2019 19:07:03 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7CE455117D;
 Thu,  3 Oct 2019 23:07:02 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 541BC10018F8;
 Thu,  3 Oct 2019 23:06:48 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/14] hw/rtc/mc146818: Include mc146818rtc_regs.h a bit
 less
Date: Fri,  4 Oct 2019 01:04:02 +0200
Message-Id: <20191003230404.19384-13-philmd@redhat.com>
In-Reply-To: <20191003230404.19384-1-philmd@redhat.com>
References: <20191003230404.19384-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 03 Oct 2019 23:07:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 Alistair Francis <alistair.francis@wdc.com>,
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
 Andrew Jeffery <andrew@aj.id.au>, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: koq98J81cFh4

Only 2 source files require the "mc146818rtc_regs.h" header.
Instead of having it processed 12 times, by all objects
using "mc146818rtc.h", include it directly where used.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/rtc/mc146818rtc.c         | 1 +
 hw/timer/hpet.c              | 1 +
 include/hw/rtc/mc146818rtc.h | 1 -
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index ced15f764f..9d4ed54f65 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -35,6 +35,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "hw/rtc/mc146818rtc.h"
+#include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc-target.h"
diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 02bf8a8ce8..9f17aaa278 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -34,6 +34,7 @@
 #include "hw/timer/hpet.h"
 #include "hw/sysbus.h"
 #include "hw/rtc/mc146818rtc.h"
+#include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
 #include "hw/timer/i8254.h"
=20
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index 2e9331637a..7fa59d4279 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -10,7 +10,6 @@
 #define HW_RTC_MC146818RTC_H
=20
 #include "hw/isa/isa.h"
-#include "hw/rtc/mc146818rtc_regs.h"
=20
 #define TYPE_MC146818_RTC "mc146818rtc"
=20
--=20
2.20.1

