Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp102916wrp;
        Thu, 3 Oct 2019 16:37:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwp2bIs9fMYo9O2dpKnIOqFUnht7kNg6VnBXW+y1FQpdx9pkR+tSsbBtgCbuaU/JrTzFuvz
X-Received: by 2002:a50:ed17:: with SMTP id j23mr12293561eds.248.1570145864659;
        Thu, 03 Oct 2019 16:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570145864; cv=none;
        d=google.com; s=arc-20160816;
        b=Kgh4fUozhptZBksZfuakUHDSIidj+BS07pO0qpdTwgJ+FJK+JS2Nvpi3/E7ZihWsK5
         1KzN0czD7dur6CKJsX4zVf/QxNfS2I5D3gFdVYZamrE/bu+s6PH5T4eYBQvXowTs5r5n
         mHZb+o6fEN6zmf5lRLJFnIrd3NaIZitUHqXPYXpBiKvIv9ZzzgGJYDzJxm//hISauGuv
         4xQW6BGXGYjSVYbQbSBd9bnzHHkRb3MuHxm+uEhVTdH1HT3AE/eEod3X8zMCnsQ29gr3
         PtYxqw/EPycXy6Nb4XyTlq38lHRdZ7VngXwFhWHBct5BX8yiJ1O+Et3nC7Sf+GKJgU2x
         cZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=9qZ+crvq/dV9BE/Tk15vJZIF2xO92wPdRyQ//JUFerI=;
        b=EGYx8duaCZRMTKVkxvxeYGcajFsb3QZwRVhWP/s7dFVoHdxvN/9Ix2ksX2/Itxt54v
         Vc+FNm7x2612EyD8A1TIDt75KIH+tFN2evE2IkdGcHerrxDHRBJqXYwTxz6cerg55ksa
         kgCR6gqqmkpGTX+Ugwac9S6RQXFX2BH5UWIxmDNH+IZFWZbI+yTwYKMufngxQw6LOrGV
         3Y3AW2FgkBGMzJW9GgDW5LhS9lbbW/skP8claGhcG4tDHUb52UxkBQkbihei6/Ebnrqr
         p2TbXm7YMjZnSQ8HhAVUbaZOSD1pa/QmYfbv9gN4qZmZ54ZYMCpUvK1FB9gcRG7db6QD
         mJkg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c26si2501724edx.353.2019.10.03.16.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 16:37:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGAfH-0003ca-11
	for alex.bennee@linaro.org; Thu, 03 Oct 2019 19:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47273)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iGACB-0002pm-8e
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 19:07:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iGAC9-0007UK-BZ
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 19:07:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45930)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iGAC0-0007Rf-Op; Thu, 03 Oct 2019 19:07:28 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 736C5A44AC6;
 Thu,  3 Oct 2019 23:07:26 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76A0110013A7;
 Thu,  3 Oct 2019 23:07:11 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/14] hw/rtc/aspeed_rtc: Remove unused includes
Date: Fri,  4 Oct 2019 01:04:04 +0200
Message-Id: <20191003230404.19384-15-philmd@redhat.com>
In-Reply-To: <20191003230404.19384-1-philmd@redhat.com>
References: <20191003230404.19384-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Thu, 03 Oct 2019 23:07:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uOzdUX/Z8SQ2

The system <stdint.h> include is already provided by "osdep.h"
(the scripts/clean-includes file clean such headers).

Commit 64552b6be47 suggests we don't need to include "hw/irq.h":

    Move the qemu_irq and qemu_irq_handler typedefs from hw/irq.h to
    qemu/typedefs.h, and then include hw/irq.h only where it's still
    needed.

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/rtc/aspeed_rtc.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/hw/rtc/aspeed_rtc.h b/include/hw/rtc/aspeed_rtc.h
index 3fde854ad9..b94a710268 100644
--- a/include/hw/rtc/aspeed_rtc.h
+++ b/include/hw/rtc/aspeed_rtc.h
@@ -8,9 +8,6 @@
 #ifndef HW_RTC_ASPEED_RTC_H
 #define HW_RTC_ASPEED_RTC_H
=20
-#include <stdint.h>
-
-#include "hw/irq.h"
 #include "hw/sysbus.h"
=20
 typedef struct AspeedRtcState {
--=20
2.20.1

