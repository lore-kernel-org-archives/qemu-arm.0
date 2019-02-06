Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6073859wrt;
        Wed, 6 Feb 2019 07:32:13 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYbDEQ4g69f+TZBzECHPyUkYDYw+h+IJG0XhbJ0FZ48o9AY3JiPlPg601Ugr2RY9D5bjIHX
X-Received: by 2002:a25:da95:: with SMTP id n143mr8649049ybf.488.1549467132995;
        Wed, 06 Feb 2019 07:32:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549467132; cv=none;
        d=google.com; s=arc-20160816;
        b=s4qpWOUG4hFjQiejOeXn4YTo/r1iAfrktff6dVHfQILRJi9d4YJDeqcT/qIFL56K5/
         dmI10ytPvFQGsvVlWyWWJR/I6TJ5tzUCXKTLRPJBodi6d9KCriXSns1sO9S1GEa0HO61
         lqW2U9P9wMr0x0+JYkBojatEEL2ff6/p7W8wYrnX8Qb7YrCtOgR6C9R1CpdiALLu1lW+
         k8DtFgR91vHkXSHwNl2Mqhjbnj76XoGgNoEcMn9a16GYU8GvlbO5WrbCouLon90AyGL6
         tTc9UyBfL1CqSXG1nqfY8l8xrB2a+cB90Ygh+vkRPSuoq/Sr9DFqUEPFlIlv+0IRrsZr
         QOmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=vCEAsHGI8yHUq6tofr1s+fkN/tP8GIaoIIGxVseV72Q=;
        b=ZyO+Tcxd/aB3SDitikt3uUV8lm4F67jjYvk05S0fRjsczXtMqeSfezpyeB3j6dmI64
         +QmtCUYq0Dg42ww3vxFCPuF2FOwSwPNXBWFydPaTtTq2ZHJtCFbFn1X5OD4HLsYP6NKQ
         1dtNL8v/Y0kpVCKQap2Bb5b1vcRA6ZP6F0LTAQcHffUz20nXb6dm9pZJPoWoPYcyaNyB
         /1oXpAbL6kEKxh8suySeC1RsRT4OiKqyjcULRbvhTwkZuWlQyblkeM1grKHiTAylzsQL
         HDZpj/UA6nWgeQrT5CCtI+AJVhibU+SpkImItOVceaJEjwVJMT+LJvYhKIrX5/wdU2iH
         pBeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si3883027ybo.397.2019.02.06.07.32.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Feb 2019 07:32:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grPBM-0002Eq-D4
	for alex.bennee@linaro.org; Wed, 06 Feb 2019 10:32:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP80-00007E-5T
	for qemu-devel@nongnu.org; Wed, 06 Feb 2019 10:28:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP7y-0004Ol-3X
	for qemu-devel@nongnu.org; Wed, 06 Feb 2019 10:28:43 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:40983)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grP7w-0004M1-6H; Wed, 06 Feb 2019 10:28:42 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MZkxj-1geuHZ1lyx-00Wknr; Wed, 06 Feb 2019 16:28:22 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Wed,  6 Feb 2019 16:28:05 +0100
Message-Id: <20190206152807.31896-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190206152807.31896-1-laurent@vivier.eu>
References: <20190206152807.31896-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:I/l1wIG9RgiSe/mg3CqvszPKZgpos3TLowNggKqzG/ZxR/4yIix
	tCE8cOy04FcHkmI+grDa0F7dgWZayGkwKExnS9E4Th2J/crbGXXacXFOW3SWzM/ZrLkvToL
	4noTWFwPvRJCmbpYs2K3ZDiBIaPFiVKBd7P3Z16fqUkmQEYEbpI83bM0PNYg1Nr4HDGcD9h
	2qt8gH0yTOR2Q89K8UdkQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+ExGxIGhJE0=:OqSyYalCLaI0QciLXQOSHE
	auo7UiJVqAnIccrKjrhsPCCuMPSrKPUdB8mA2oTGj4kFrM3BTouDxPtRIXu0X36NOyAMpDv1h
	/zZHr/hcuYfpBNil9ohYoCCfjCg+tXxMe+oErtoolD5w68rn5XQz35Jb+cA0GPv7GHriw6VvW
	eHococZHF6ijKsZfHdLyz05ZziHojHUBZg41ShEY/AvoURbZvSDB8fMZRBv7TDFASED3UKvBD
	tD2JljqdVAE3MqP6epIGmh2ycGFSVFg9oYdT3BaOCmtJchIUopL8dULeCdOyaKlC76VIsS5iL
	D9DvWo4rXyjBmqUGAFCHRi9kC5lH57ZlsZua0g/QImy5Rr8DMmbS6sc0D5A+jxuPBZRS9L0KY
	rgSIl9lylnZmDBvCAaZGb5Zp3GVHC03t0qQs9OVwmxXJnasLPjJVKn51AIUUcIs/puML9TJ1+
	xYt/GCQJrJUN5XEy1jzDU7A54zx3sEdmbzCOWYYDawh0p1l0dUlQKFIRZVkhSgYoYZoPKUCKE
	n3YEHwgoth+w1NcEWcAjkS1h/TxZioEySRGJr8lYvyi7Rj71R11UtMLHO5pIKF2/CSLEqu2nJ
	6szJwsMJdr5ojeDkpEIs/Vl2H58KbzoE3NEkcoB2Oys6B32c50xWj5n9H4m4Bpj9OC6swqeIj
	4UkfQw57WiLzR+2hdThEI0EnrB49/x8me7jZivoRKb4uVfZvc6ZNfLaUMnkqB+KgBFDXunUJb
	Z8U8CWEZgu5OQbDGMfmRqfe5FBfc5ah0fLCdEzTNlVfLNw/Qf/4ZooutMHY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-devel] [PULL 5/7] hw/unicore32/puv3: Drop useless inclusion
 of "hw/i386/pc.h"
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
X-TUID: oXA4PoToRUP9

From: Philippe Mathieu-Daudé <philmd@redhat.com>

In 47973a2dbf we split the last generic chipset out of the PC
board, but forgot to remove the include of "hw/i386/pc.h".
Since it is now unused, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190204210433.26088-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/unicore32/puv3.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c
index 830fe3face..b42e600f74 100644
--- a/hw/unicore32/puv3.c
+++ b/hw/unicore32/puv3.c
@@ -15,7 +15,6 @@
 #include "ui/console.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
-#include "hw/i386/pc.h"
 #include "sysemu/qtest.h"
 
 #undef DEBUG_PUV3
-- 
2.20.1

