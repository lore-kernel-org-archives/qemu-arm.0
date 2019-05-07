Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3357576wrh;
        Tue, 7 May 2019 01:20:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+thDe6njVT6045UUNfG7tBjD0VLBzxrQLsQLtARGPmCGs3uVw+Z6UIQf5/RJZnKBBquZS
X-Received: by 2002:adf:8068:: with SMTP id 95mr20856000wrk.174.1557217256741;
        Tue, 07 May 2019 01:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557217256; cv=none;
        d=google.com; s=arc-20160816;
        b=uSjSI/kMr6KqbCnDRS6wdg2W6qyZu/Mz9njE2txPGp2ezhC1A7mHmXBCkjNRY6pHHY
         NkvF09clZZzhX+kdUemxqIhfj8uYFWz/AVMZNqzP7qA5IQnbycH2MpAZ2qAZ7SibDCeq
         SDBLcmCmY05Hrja7p4lLYJHmqBKvX1kBMgVveUlagREM4RHvi64wT1mCEuxnVeRYdOXF
         10dB2nG0pDvXpiOjYrz9qP0CWjGK344UIxU9fBehSy/zu1pE9aH3GS6r6vb/3mv41CT2
         FCqKwQaFnz2hYKhzYC441suVnQY/YSe9oKBn2d5TKXW9cligzm1132Nmvq8D8wd5ceun
         iqGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=+kpTzrs2AV5MM+7pm6biM4tit3FfYgwu+CraFuiapuo=;
        b=Y4wXExnCTmFddr4qqP7lZpoMLO1botrVahDC+F5qqaddtj2pem/05tjr7eDIRaWrko
         OtJMySSyF39ELepeDC+x2pDJd5K9b6zeiF9DUFZgLN8ZFEqRY+Ce2k31Qp7gmlGC7k5k
         yrqdezdw3SaOhVKH8+0IkWFt5JG9gCDHMDeKaCMzl+TkUY93tIWEd+QjH2Urzw9N3qJV
         E0qaYZ4d8xo7gvQCxf65jhayZUld+ck+nP3p8lTLMfToZlM5jES0D61ew3qR2fPUFZHx
         hSzWC2h8TfE8+TG4BqMCDitgmQtqxvDz+0aMQsJGIlK69edAKC423AZRLVivoe+41d6f
         7Q1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3si8249804wmh.44.2019.05.07.01.20.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 01:20:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNvLL-0001Kr-P6
	for alex.bennee@linaro.org; Tue, 07 May 2019 04:20:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNvKM-0000eI-Au
	for qemu-arm@nongnu.org; Tue, 07 May 2019 04:19:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNvKL-00089C-4C
	for qemu-arm@nongnu.org; Tue, 07 May 2019 04:19:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38136)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1hNvKK-00088b-UJ; Tue, 07 May 2019 04:19:53 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3195E308A9BE;
	Tue,  7 May 2019 08:19:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8295F171C5;
	Tue,  7 May 2019 08:19:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 90A91A1E2; Tue,  7 May 2019 10:19:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 May 2019 10:19:41 +0200
Message-Id: <20190507081946.19264-4-kraxel@redhat.com>
In-Reply-To: <20190507081946.19264-1-kraxel@redhat.com>
References: <20190507081946.19264-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 07 May 2019 08:19:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 3/8] hw/display/cirrus_vga: Remove unused include
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NOB4YyPN14oX

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Commit ce3cf70edaaf split the ISA device out of the PCI one,
but forgot to remove the "hw/loader.h" header inclusion (the ISA
device calls rom_add_vga()).  Remove the now unused include.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-id: 20190505225640.4592-1-philmd@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/cirrus_vga.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index a04440b3748c..76c052c702ef 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -38,7 +38,6 @@
 #include "hw/hw.h"
 #include "hw/pci/pci.h"
 #include "ui/pixel_ops.h"
-#include "hw/loader.h"
 #include "cirrus_vga_internal.h"
=20
 /*
--=20
2.18.1

