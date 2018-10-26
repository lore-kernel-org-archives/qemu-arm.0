Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp524292wro;
        Fri, 26 Oct 2018 03:07:22 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eUTezrA+JbU4YJmV4ddc6Edp0wbcfSBgsoAWJCsy/j/XAgYCvtpdRpcGQ+BWpZIS7ysOaZ
X-Received: by 2002:aed:33a7:: with SMTP id v36-v6mr2466721qtd.267.1540548441940;
        Fri, 26 Oct 2018 03:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540548441; cv=none;
        d=google.com; s=arc-20160816;
        b=W2EINRQKUFnIt8vjEBw35d1CyEdD4Cm3p19peFBLd0tc9J3hm3rkshPJMpxNAN8vUu
         vXS0lQSPY9U8bs4yEAeT6DIY1f/gEr8oEx7S2/B6Fn1+MwE4R6nZA8CQw294ei0C6Azk
         ZfHrcr2D8dTAfMJcD/h7cpfvOAPwZAAHmi2gya1+vY+yMcj/KPgnfOcKI68KEnfHOdQB
         iOy5ev9XxAai73s8cR80OcIQ8lcWkXg6dA2pLvWFwoWV2ZPv10o760H9fNMAcexODLBt
         XyaLUF2TkU5AxD6uZ08dHPRNPThG0WzP8pG/u3mJ2Ts+iylBgiXxABbAQ0GK50LIvq43
         Z8Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=qqMIirBdrqA2Rnqw2MrZ8DVbX1m5L2y5u2phKDfdHUs=;
        b=UB0EYpk8+xEhDBd/qRZgsbErgad30Ucv3s4g8NE8byH5JND46z6yOlV2ixsNUTWtGz
         KIsNQSxFy6MR5Jc4yUYWGciJI4+0DymB+x/K2opR3xGnXW5Opy1fGwPS5G6HpAcJkRZh
         044jGl19ZWoedi1d0IqA+RhHMN6PyGh334i9y1djNrf6PV5fOMHWgLTM02req52EpPI4
         QPOBKG2Rw2FCABdrlKWqfD9VFHwDGaAaBVaIEXdP18TyzpBACV1q2wprnPxdU9bbDDNj
         OZ6yv6hcf6GBUH5tkv+sdCXAcZITCRK5FutNmgt3kWSttWJHv6s5Meevs/MTKobymG6i
         cAkg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g1-v6si7931523qtd.284.2018.10.26.03.07.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 03:07:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59290 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFz1V-0006FH-9C
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 06:07:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gFz1D-0006Ea-NR
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 06:07:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gFz19-0005Yd-Dw
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 06:07:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57088)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gFz19-0005Qz-13; Fri, 26 Oct 2018 06:06:59 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24973311C3D0;
	Fri, 26 Oct 2018 10:06:54 +0000 (UTC)
Received: from thuth.com (ovpn-117-235.ams2.redhat.com [10.36.117.235])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D68FA60C46;
	Fri, 26 Oct 2018 10:06:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Date: Fri, 26 Oct 2018 11:06:47 +0100
Message-Id: <1540548409-22560-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 26 Oct 2018 10:06:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/2] Deprecate the "collie" machine and Strongarm
 devices
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
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u/o3X1N3hS1D

These files lack an entry in the MAINTAINERS file, and according to
the initial commits, the board and devices are incomplete. Since there
have hardly been any commits in the past to really improve them, we
should consider to mark them as deprecated now.

Thomas Huth (2):
  hw/arm: Deprecate the "collie" board
  arm: Deprecate the Strongarm sa1100 and sa1110 processors

 hw/arm/collie.c      |  1 +
 qemu-deprecated.texi | 10 ++++++++++
 2 files changed, 11 insertions(+)

-- 
1.8.3.1

