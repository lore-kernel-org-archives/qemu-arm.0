Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp3491714wrq;
        Fri, 25 Oct 2019 01:52:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyH98u1pqMCnKpuIqH2QDO35UWRZS1wgXq0IY0o45J8frC2KulsuUwYU3j0/nJZwlR0xnPm
X-Received: by 2002:a50:b5e3:: with SMTP id a90mr2509323ede.201.1571993570658;
        Fri, 25 Oct 2019 01:52:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571993570; cv=none;
        d=google.com; s=arc-20160816;
        b=XVYnPWhwg9Q3kueDSJvB9xQvpUXpKtI0SRMbcNUmc6wzEY+b2lVKnFdNPj/rvViSvo
         f3A+zOCbjlPQ/twYHhmWkHqMDKZFkj2Z8U1BHC1MqQjtpBnpF3+HBEY0vMq5R6fm0FXy
         7p/tvbLjY56PVqgjB4JBbpI7TKcktqCP8P+eQiVBOVP0IohRd7teZuwaorSM63xAQ9OD
         I10lm0gF6Kosf1VnRH2SKQAz/Qe119xK8Gpp0+PoGlV1JJ75jgmf9J6/SuAoChIG0rOr
         CNQ9ZQLBeZzvLbCrqgOdNWD9TIDSO/g1Y368em7nObuK+AWa+wYmnfM7qP91UzIT+Gwj
         usBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Gb5npTdJyZDSp0w020GsvHVx3i93dCcPsU8onSeE7p0=;
        b=uEoevPFxXYjn5HQWgimFT8Lt76UVrBrdK8oB4DRvLVtMKZYNcNvuywV08t4Z/jTa4i
         8dXKCIIiJK39rZD1EvJ+YMhSMVA+M+8nBrnXlCm/CsSMXox2y/XvK/tkLnObOHDrPT9T
         A6GzWUbGHftIqCOnh5Uc2IBv+KPgsnNjtLyYZInZPhTh2YdTAitf7Zm5Qy561dDj9ksR
         jninYMVXh7HNZKqCAexs0Geug8XcKmlWK9WK9qsObZ8sQdMKBaLC/+epYzJg2RGauYw8
         4Bda/zgzo1Wrj0dcBzMAiG6xxe01MMIkicOtMWFayUFzc7e0lotzykTwYOeVY4jFOAaj
         dvCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id nr22si830744ejb.16.2019.10.25.01.52.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2019 01:52:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNvKz-00048j-FK
	for alex.bennee@linaro.org; Fri, 25 Oct 2019 04:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50711)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv5Y-0001hf-5L
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv5W-0008KZ-Ul
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:51 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:34557)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv5P-0008CN-FA; Fri, 25 Oct 2019 04:36:43 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M4K6z-1iOC3d1MB7-000O1d; Fri, 25 Oct 2019 10:36:00 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 18/19] hw/rtc/xlnx-zynqmp-rtc: Remove unused "ptimer.h" include
Date: Fri, 25 Oct 2019 10:35:10 +0200
Message-Id: <20191025083511.11463-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bIVh4Atdz8bHUNgDKytO4sxywaGZPxNGPkscIkQ59ZOiIyIm/xq
 c8nPdAO8wITFiXU10dVK67Q/hD/eeRjyt7FlwozDNzVNUSu7N5VWqK4n9MHIEupT16Crppp
 +0UYhJlob30MSu6hlUpt/rYmmSIknby3svJtfkCbqClmTP2DvE77O6Cr/Vjh0/9KYswm32T
 w1Ix0+hjxjmif4ar3mGhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ra8smSEyvIs=:JTCe2FY0XoUYysYNNN89O1
 Aro3pi6I4fhHm4AXqjsGea1WxQ8lDqO8HwQEFWwhrLOhITnHTI5eUXJvhIt0GMXwm/DeFkNdR
 hwoS5iC4RNrZKP67fcCvcGfzLiSA9UTG4C9iXv22bVb8VvQXUkSA9dYfqd/dsLiRs45QUnad9
 zA/nUqmX8FuHrTAG0tIu/nU54+5tcZ4yzruXEVO3gmKT3Y57Vg3TgEMP6m5a1YD0dYifPr4Pd
 sXmSE/JT4TCZVAdDieQlFOlQvbKJRPIsceaIAmRxPqwBGs0HASYSfi+lfAwHw0U7Y0x5wsm3/
 9WJxT8d+CzM8spnitrE5LWibeOCMgXQIs1OHPLTGpeUzjDeN2VwO0T+Er2WnAJsor16ProFgS
 wAEVxOrsFTiWUV3lmudp0OACmpXsVweblTah713IRaExbhR/8dh0Mt13VZ0e/cQ6MHC38TaE0
 9kaFSItY77DwttlKpPO9H++p5pz30/gi+/218zR38dNd3kQhD8xRp1sM+9hU0WASgdwMJ8r4n
 TdVGDxjqw4EuezAQ8Oj8c/CLg1pXmsBW5K2db5k3aXxr6ZejRx7CrFXlLe8UJJaE7NIfd+9lA
 0QzMMrM8UMUV+e0eDDj6N9EqBfWifrQTW0K6cqBviaI0NY41Jkdz1Nrb8Tsa1eOJbmIEpnEou
 i90n4oLape0x7p56MhqJU6a3/17VV2xLf/+iQoZHWaulz5scPM0C+YT1BBp9XWHhZCJ0P6m/l
 m/ZN9K3mlbjRLF4NFqnVPHbc4j8RkIPBYHBFLZVbL+N8LlTHkUBasWh479xXMrKjxUT3dYn1w
 Y1NtT6Ae5egJGyc+vSkA61Alkz492aB6TBA+1GkOGAVQvyn9Wwp8KmcJQomuV6rs7nr+2U36q
 c7X5oYlwsc6k8qGcSOZEzK/5ySzyhlnCIxPACRGrk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.131
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
 Laurent Vivier <laurent@vivier.eu>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: szrmpYn86ucE

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The "hw/ptimer.h" header is not used, remove it.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20191003230404.19384-14-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/rtc/xlnx-zynqmp-rtc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/rtc/xlnx-zynqmp-rtc.c b/hw/rtc/xlnx-zynqmp-rtc.c
index f9f09b72965a..2bcd14d7795d 100644
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
-- 
2.21.0

