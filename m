Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp107077wrp;
        Thu, 3 Oct 2019 16:42:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw5luRVig04T2I0RIQdVEk2PzXVjrEwXurznizn1T9H5OmdFZVu4cmyrIc4r9tMBKIzGhof
X-Received: by 2002:a17:906:5ad8:: with SMTP id x24mr10061824ejs.107.1570146159371;
        Thu, 03 Oct 2019 16:42:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570146159; cv=none;
        d=google.com; s=arc-20160816;
        b=VAG1vYMLn+31U0p4S9fb6qiREXn6UFj8BCDsmO/2OqVOHnsiaplOnRtP2ZvBkrB9oX
         ElVju3ZF5r9zmly387nnOrsFScOfY+KoU+ijTt1/wdGo4+J/d3rVrJSekEXuVgHu10BE
         XElNr2XXvh+jenLxniXmYezfcG4rUyeb29TsY1S5WRnZW1N8jHBFkCxj8eDrOzy4LsxS
         HARcWbuUu7cUpjWqpiIIEkKOHCmLzOsvXRNMQ/UPVMforzE36s2bojkaam1bu1l7Msdv
         5A19DfAKoozv3SCh4rRhgnktjVE6rAZo6F6GRVIiMsKNZ8+5SZ7jVkelHh2rRHHnEWIW
         Zglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=1lWYZCAzvAsUtWc9/cSX5yBOj3yi6XIrOtZwrvM5C9c=;
        b=zMA4JsBpdQJl+vvSgVtj4xgrKXIcx50gZuzfKfkDm9uAbH3bxvYaSybKWWgDmJoJI+
         dwwjMiTK0UzG+p+ahXDWRyo9DbQ2PoGzByRYieY/18cxihX6Liru0B/q17KOIryuP9Vh
         YZmXvHrp6Rjsq7H8N7b4NLazQ9BJNXKlYEjd90QAbfeue+u00UKxB7yzYzU868hKfOsJ
         ygZwcpGpr5QqxixxvqZ9uvumo3jrWfEqH2BM0TceW+o+Iz3/0hzCDVVppkqMP7GWmqQl
         jiSIuZ2B+zTtuttKtf8W37ieLVlNpy/3u1zBr41RYSyQuOS+XQrgT2epxE3Ul+U+QdGO
         05BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j51si2496028ede.301.2019.10.03.16.42.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 16:42:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGAjw-0007hs-MO
	for alex.bennee@linaro.org; Thu, 03 Oct 2019 19:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47039)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iGABl-0002aY-79
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 19:07:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iGABk-0007GL-4T
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 19:07:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45600)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iGABj-0007FO-VX; Thu, 03 Oct 2019 19:07:12 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E37F33078A23;
 Thu,  3 Oct 2019 23:07:10 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 036CC10013A7;
 Thu,  3 Oct 2019 23:07:02 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/14] hw/rtc/xlnx-zynqmp-rtc: Remove unused "ptimer.h"
 include
Date: Fri,  4 Oct 2019 01:04:03 +0200
Message-Id: <20191003230404.19384-14-philmd@redhat.com>
In-Reply-To: <20191003230404.19384-1-philmd@redhat.com>
References: <20191003230404.19384-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 03 Oct 2019 23:07:11 +0000 (UTC)
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
X-TUID: 8SMSZL8nPMIQ

The "hw/ptimer.h" header is not used, remove it.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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

