Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp664771wrg;
        Mon, 20 May 2019 14:45:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqznt7tMdrXzKw+4gltGX6S03ztWQFKJknX6k8KSfN12bRA2BcBchG48xrmBFPMKUI/LDeGb
X-Received: by 2002:a17:906:2482:: with SMTP id e2mr61221947ejb.289.1558388755758;
        Mon, 20 May 2019 14:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558388755; cv=none;
        d=google.com; s=arc-20160816;
        b=PfRXt5XlEjgOV6UvZ7reaZq1JCXfGNbkBUyA6OLX1lF3K4VRmvCTLh3W5LZP0vE3SA
         y2ddYI5rviOIflVSPK7dDylNumWGys225uw1e64m0EBfjqJZyhjD+07HXk14E+wRw50G
         mmL0s7hkHnYuOajJMa0PWTqaVRQ64uZmvDwlJ2HDaJkSFf0xSCmX0zdHRvXVw2yvm8Y4
         SykUjUr09KqQAGgaizOkrQw2GeDUX6f495Fb2hVd0td0NgMq78PoqppquzmIGchUYhxX
         Hdf41+G1yJqjo/vDXWmGzyFA1f86KJ6BdABLrpejNclE+24kVeYD4rH+9bron4z93Bte
         zS9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Q1p8jgR0wliheF4QJsEl7JrYA6nTekOo5YiIUGHR+lU=;
        b=TR5WiTHWh+gTLgsE0LN9hkPYzNCndkFiFF/E8K9ThPbEsC3FwCdpJ2cui5mkTlRQ6S
         WNjKv4q9nwff9SNM2uVKAZC9JI7U6N3FMmMcKn1LwBKIpbOxDGjM0EK6dRuH2hlLp0Qv
         gtj3Dr/U0VsL8pEaCDBj+LLOJiGuZHnoJp1PDGlevStDRTV5JUDmgkjkBIV87E+53xs1
         Q60JjRsekSThG3vNs0Z8bLgc0vv7VTujRA4LGaR5UEkwaOg4DM3PJNU2sCK6ZVzCwcFv
         hvQ3IdTnMd0Q1TYCAiQkYOAIxSt5JqIsImSUqwb3kjg9AcXncm21OxgUsIWgmCCmX99u
         /BoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21si12979817edc.6.2019.05.20.14.45.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 14:45:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSq6U-0008Fm-NW
	for alex.bennee@linaro.org; Mon, 20 May 2019 17:45:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSq4c-0007Pu-MI
	for qemu-devel@nongnu.org; Mon, 20 May 2019 17:44:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSq4b-00008Q-Rj
	for qemu-devel@nongnu.org; Mon, 20 May 2019 17:43:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59072)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hSq4Z-00006K-P2; Mon, 20 May 2019 17:43:55 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 09CA030842A0;
	Mon, 20 May 2019 21:43:55 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-28.brq.redhat.com [10.40.204.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12B8F1001E6C;
	Mon, 20 May 2019 21:43:51 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 20 May 2019 23:43:39 +0200
Message-Id: <20190520214342.13709-2-philmd@redhat.com>
In-Reply-To: <20190520214342.13709-1-philmd@redhat.com>
References: <20190520214342.13709-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 20 May 2019 21:43:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/4] hw/arm/exynos4: Remove unuseful debug code
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iASDV1KPiBXF

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/exynos4_boards.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index ea8100f65a8..f0c24b7992e 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -35,20 +35,6 @@
 #include "hw/net/lan9118.h"
 #include "hw/boards.h"
=20
-#undef DEBUG
-
-//#define DEBUG
-
-#ifdef DEBUG
-    #undef PRINT_DEBUG
-    #define  PRINT_DEBUG(fmt, args...) \
-        do { \
-            fprintf(stderr, "  [%s:%d]   "fmt, __func__, __LINE__, ##arg=
s); \
-        } while (0)
-#else
-    #define  PRINT_DEBUG(fmt, args...)  do {} while (0)
-#endif
-
 #define SMDK_LAN9118_BASE_ADDR      0x05000000
=20
 typedef enum Exynos4BoardType {
@@ -140,16 +126,6 @@ exynos4_boards_init_common(MachineState *machine,
     exynos4_board_binfo.gic_cpu_if_addr =3D
             EXYNOS4210_SMP_PRIVATE_BASE_ADDR + 0x100;
=20
-    PRINT_DEBUG("\n ram_size: %luMiB [0x%08lx]\n"
-            " kernel_filename: %s\n"
-            " kernel_cmdline: %s\n"
-            " initrd_filename: %s\n",
-            exynos4_board_ram_size[board_type] / 1048576,
-            exynos4_board_ram_size[board_type],
-            machine->kernel_filename,
-            machine->kernel_cmdline,
-            machine->initrd_filename);
-
     exynos4_boards_init_ram(s, get_system_memory(),
                             exynos4_board_ram_size[board_type]);
=20
--=20
2.20.1

