Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6078093wrt;
        Wed, 6 Feb 2019 07:36:05 -0800 (PST)
X-Google-Smtp-Source: AHgI3IazI6PO+77yuNOI8ODb/RxALuAqVomP/Lm75q+lbY6EYg94xXipTQot6lC0XjjPKv6z21vY
X-Received: by 2002:a81:7102:: with SMTP id m2mr8797211ywc.235.1549467365038;
        Wed, 06 Feb 2019 07:36:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549467365; cv=none;
        d=google.com; s=arc-20160816;
        b=rowpd7USCevXjEpJvlyscIvD22FNGoE9EZinBrskG+w7o/teSKHF0BCnvZcF7hY71e
         zf8SxXVAnmgjmhHT1HojSGUC+q4ojDDoelYG+iZL2ECd2P7Lpp8W6fBZO5SMy1ZRrPw2
         5BqrbGDZP8b4m0k13PVNto6Bb7k9J5v1j4y2JQa4daIPVzY07rIOxBy3pR12mraJpMS2
         vxUSJp4id4nAJDzYst2LbtZJGvgH7s3a3hy13JWCSYVO9JXY8SlJFejIjTUULIL15JbN
         Ror1B/PpDway5osmJitQOoe8j90Q08HELmUkBFGyCkoOWYAr34lZmMtJvTjOMaIEw8/a
         v3cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=SCF+pmn6/K5QqHdH5fepFqqrFqd+bCP64elPpTj6NjQ=;
        b=KjruWMkgZenNo/4bokTsT+wcYRn9fc53pRqt0wunbKZuS+ENMIQjMP8y07lz7UfD2H
         y1jyTtNbL1MA1/jFsPWMqZrCDgs0TtVWwhBdxFL9RUwghtLT0U5J7AYHrX1MPJplHcAB
         9lep9YK+zSw9PVlIYUIrfVvkkefq2uhjzLetN7/CyR938KpZneJH7o2YJ91tQ1zZa7mS
         xxAMlWl4EoejkJzOZUAdR/O6bkPWMd8QWULDruX9v8aNjpN5iVcQxGKK5RwVpHzgv4+l
         3Do1xO+OS80SdFnf81kVB8zVaqyQblscLqrNSgA8/ssONGB1/jJDAiHb/QNki39xwzX/
         BEnw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e185si3973320ywd.55.2019.02.06.07.36.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Feb 2019 07:36:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52709 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grPF5-00051L-GB
	for alex.bennee@linaro.org; Wed, 06 Feb 2019 10:36:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP8A-0000Ii-S4
	for qemu-devel@nongnu.org; Wed, 06 Feb 2019 10:28:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP88-0004Wo-Or
	for qemu-devel@nongnu.org; Wed, 06 Feb 2019 10:28:54 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:36805)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grP7y-0004LY-83; Wed, 06 Feb 2019 10:28:43 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MCbMx-1gztaB3u5b-009hc7; Wed, 06 Feb 2019 16:28:21 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Wed,  6 Feb 2019 16:28:04 +0100
Message-Id: <20190206152807.31896-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190206152807.31896-1-laurent@vivier.eu>
References: <20190206152807.31896-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bKdTrc9mrqwbl4GZgE3NVIEcluiPnApM95YC1fDj/QTrRmobN3V
	dG/u2K7a8HyTQSrJ7i7/2XFSkjyptgLIABjl+mop/XjG8gToRxQ1od0o1YVRB9B7codCT2s
	jidWk50pWxiR6DDFjiLGSwncbdu1dH9/lNuwjSYCARDKByUR83mTILmyXrR949YIBoshGCU
	1ReVSvdCaliIIhG/71dSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yb+Fau6AAYc=:4+LU9Pxf1yPfBVZp8wygvM
	ZUeH/yZJOPT52Wfe0YeCj8rv7ZF6PN6DggaeshwXc5fki++BJwakvE6g587D5GvpmEPp4MAzg
	jj9VWNTF+ACSWjLYI/h86NR0DuoEBvFLEHSGa4tzgU0ZtDupXECqCX5MbDJPymU+hdIRps2Rd
	KaHiSrRCWwZ2Keswf9yiGW7AApiHDgrWxZWAYEiXYVq0jlN509H1urKfnWcMMLQsPL6GDAI+c
	9z+AXVudbx4IrB6a2DdciOY8zFOVkj5uLNqMPycpeDMYwCz0mAC3Zpx2+x1I9cq+Dr+sD3cjZ
	gtkck+YEe/au6bOT2h3LNysmXnTsYa1P5n0Zuxomd831uChrOqEIWJ8YCR4m4nwsjQyWfJhVz
	RkyJ87J+D1ZEGRe4+jHtvfU0eUp+Oq1HK/tE7NBOZE65+QBXmO0ByTrKgwWb6u2KmqEA9MDAo
	nxgKDfjP6sm6roJL8IMo78cY7gmqOZx8lb9mUztGb/s50XxvzGwnLi7t4tq7TxVEnEbgMZXtH
	dnrwOt7vDeKfk7qV187bAMEFaZpNRHdd7tyQBIhq3fRGdAu+82i10K75VXrH6VAlfzu+zfpWn
	ZnOGKSRQcaXNQWFmhod9wyy80bb+E4/hkVt18PQbOo80OKzmKNvJ9j/K/eLetqorrmJUAVp8w
	VUFEf8h1a5VfMiA55W91z0UTS0u1kkP7D7vNSv4KEvKaO0pgd444OUDKRVGMQmynm5Py9T4BT
	sJua+27b6Quy1ObLl2VtbCX3DnsCNlUrzEJzMnjHfN2f64/LLzjy6sJMijQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-devel] [PULL 4/7] hw/sparc64/sun4u: Drop useless inclusion of
 "hw/i386/pc.h"
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
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Anthony Green <green@moxielogic.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ya3LvHiweikv

From: Philippe Mathieu-Daudé <philmd@redhat.com>

In 47973a2dbf we split the last generic chipset out of the PC
board, but forgot to remove the include of "hw/i386/pc.h".
Since it is now unused, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20190204210433.26088-2-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/sparc64/sun4u.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index f76b19e4e9..fdf3f14a29 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -33,7 +33,6 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_host.h"
 #include "hw/pci-host/sabre.h"
-#include "hw/i386/pc.h"
 #include "hw/char/serial.h"
 #include "hw/char/parallel.h"
 #include "hw/timer/m48t59.h"
-- 
2.20.1

