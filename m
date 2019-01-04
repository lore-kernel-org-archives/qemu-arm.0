Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp866155wrt;
        Fri, 4 Jan 2019 10:06:18 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UZVlm+Ef/+fXW01PX0HwqHRpSv/bjW6kKT9UbNX91uyZJCV/wmAKYclqxGtL4T99kHAWbP
X-Received: by 2002:ac8:33fc:: with SMTP id d57mr49051425qtb.82.1546625178806;
        Fri, 04 Jan 2019 10:06:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546625178; cv=none;
        d=google.com; s=arc-20160816;
        b=EZQvjLnYQ4ALVIdxdqtmb2syOs0upD7wR2mVwsU7HPBEqKgIkh2Kfz0nC3Rz2sD9gT
         68ztGK8O++huDxXJYqz2R7u+q9gr7dudBtyb9s+SOy04vE7cs5LHVIhI7nhAoTEZhCnm
         msupPcxUqeKpCxuZO17b3x6qP+LK6S29O1f4qJHcJiRBdqOiAAKUNss5j/+CZV1W6t6y
         JDYJAfRU1KBq1HMPrfFd/XuhT3TSNQU6FLPgRhve+g/lVAd1RIf1qrVxZjkP+Uf14YYe
         sJcbirHzKFl8+DScjA9NSRIR87n3AoxIag6HKcFr6bb3vId67CCFwW/+XPAe37ubbfFr
         gPTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=wdmYC+kcPben8e9/fuhmobs9C9XfmKooR+bF4jcOIwU=;
        b=xJMhGOVnTQrMREQRNAoH0qun0Bgc/IxNGG/RhFrApFKLOfRu8FtP6A2HgW2QZyA0nD
         RscTY8a/jW+scCPkW6BWjzxIq6tpMF/yWHc5Ex+I14oEDSfEfQDr8D+HTkQRCG8a0kd6
         gKmNDgo3VfLrnaHtwgdb6yHyVEebnHTFhK7ZuG8lpvty9A+MR0Aohg6qURayGXSxR9J5
         +cMniH2qbmR9Teawa9V3rDWbPiH6eG9soyRQJKsrt5RgppchmMl/uYONXRpTOB7Y7Ph/
         TgQ8E+2wcyaq+nMZQdsmpxxx/3yUGbOWwm0YrTkJ61xtxAITu0m3hpPJE8shko8J+hFs
         T6NA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id e5si3646325qtq.387.2019.01.04.10.06.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 10:06:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfTrO-0000kE-7D
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 13:06:18 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTmN-0004iI-0k
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 13:01:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTmM-00059G-9u
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 13:01:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54826)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gfTmK-000579-6W; Fri, 04 Jan 2019 13:01:04 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3610280461;
	Fri,  4 Jan 2019 18:01:02 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-119.brq.redhat.com [10.40.204.119])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C28FD5D6A9;
	Fri,  4 Jan 2019 18:00:49 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri,  4 Jan 2019 18:58:39 +0100
Message-Id: <20190104175847.6290-9-philmd@redhat.com>
In-Reply-To: <20190104175847.6290-1-philmd@redhat.com>
References: <20190104175847.6290-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 04 Jan 2019 18:01:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 08/16] MAINTAINERS: Add missing entries for the
 TI touchscreen devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ibcWCKp8OiPP

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f571b29077..03872552ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -640,6 +640,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/nseries.c
+F: hw/input/tsc2*.c
 F: include/hw/display/blizzard.h
 F: include/hw/misc/cbus.h
=20
@@ -649,6 +650,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/palm.c
+F: hw/input/tsc2*.c
=20
 Raspberry Pi
 M: Peter Maydell <peter.maydell@linaro.org>
--=20
2.17.2

