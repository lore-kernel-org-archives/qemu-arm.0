Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1799462wrm;
        Fri, 11 Oct 2019 23:55:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+LKzBoBLuAZxKcYGbNPMiy3GX10BoHGeqyfsnQcHNALSrdVb84xHzAEabiUIVM4YKNOUe
X-Received: by 2002:a37:b981:: with SMTP id j123mr20513322qkf.205.1570863335505;
        Fri, 11 Oct 2019 23:55:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570863335; cv=none;
        d=google.com; s=arc-20160816;
        b=lCgQUhSKisG3sjxyYcYqvPS/OTcIWysZ5dkIO11Q06x3HbvWpVrPEcCr3zOyCwd43i
         Ud6eVxk5t13jLJYk1/+RvCW0+6gbvYz7AvGHe1whoOEuLBqN4giR4gXqVXruDqa5gQYa
         Pn/JsxwQ7kIdOKShLtg7JjULmn7inkjg/Pi4uXh5tgXmJ8309cPdGgDGP7tWGNDWOqP7
         Ula4gypTu3PWg84fQIUqoqq0/h2E9TssNoNOf3Irg9nCZRlXDaqou2aqzLUgGoy/adF+
         QKcKKOHioEhoWdjxeB5K2ijT7Dg8igCCr+XHCQpEmUiN0uXGtOtY2+XtUNuNOCsp2ArX
         3QjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=417r/ELBSY78JYbU1NWZChNpaAUUU3TGa0k9GnlJZ5k=;
        b=pZr2AOPPMDFz3rvRmoFxbaE/VEQu3Ac2BaS024DLerVZWNBz6xNJAkm7/Rl53K8z/h
         Vs26v30jP/ATl/UJNlk3VbJOHXKFQQjj+uhGEl1llpkDwrfUHkRMqtfyX3N4LirVTAmh
         qkwtxfkDTMp7oemwBFb+NMZfb5XXBUiRC3nfecz7mrndUNVTv1DUZKlCekYE+3YOOWzQ
         3gwO9dQiUTc3BJwr76IUKfz09qpQv2n5Za0v2UDfpzZ/qC+geW63C+4vnejGKE+atEIC
         IxsFSDvOLdZ3T9oBCvQ8CbbVzTmshn2I1grD6F5cjWASXBvEuV9OqxhbXYrXdCgycE48
         CwgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d202si11710696qkc.73.2019.10.11.23.55.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 23:55:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iJBJO-0004X1-PJ
	for alex.bennee@linaro.org; Sat, 12 Oct 2019 02:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46948)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iJBIb-0004Ga-Rj
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 02:54:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iJBIa-0006Ht-LY
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 02:54:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38036)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iJBIY-0006H0-6W; Sat, 12 Oct 2019 02:54:42 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6ED2310DCCA4;
 Sat, 12 Oct 2019 06:54:41 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-46.brq.redhat.com [10.40.204.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DBB65D6C8;
 Sat, 12 Oct 2019 06:54:39 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] MAINTAINERS: Move the OMAP section inside the ARM
 Machines one
Date: Sat, 12 Oct 2019 08:54:26 +0200
Message-Id: <20191012065426.10772-4-philmd@redhat.com>
In-Reply-To: <20191012065426.10772-1-philmd@redhat.com>
References: <20191012065426.10772-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Sat, 12 Oct 2019 06:54:41 +0000 (UTC)
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SQgNJfaEcTIN

Add the Siemens SX1 (OMAP310) machines with the other ARM machines.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 65fbc6d7b4..87afc1126a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -558,6 +558,13 @@ F: include/hw/arm/digic.h
 F: hw/*/digic*
 F: include/hw/*/digic*
=20
+OMAP
+M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/*/omap*
+F: include/hw/arm/omap.h
+
 Gumstix
 M: Peter Maydell <peter.maydell@linaro.org>
 R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
@@ -1351,13 +1358,6 @@ F: include/hw/block/fdc.h
 F: tests/fdc-test.c
 T: git https://github.com/jnsnow/qemu.git ide
=20
-OMAP
-M: Peter Maydell <peter.maydell@linaro.org>
-L: qemu-arm@nongnu.org
-S: Maintained
-F: hw/*/omap*
-F: include/hw/arm/omap.h
-
 IPack
 M: Alberto Garcia <berto@igalia.com>
 S: Odd Fixes
--=20
2.21.0

