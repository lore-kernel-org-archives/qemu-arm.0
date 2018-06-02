Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1752007wre;
        Sat, 2 Jun 2018 07:15:09 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLJx78BoWh1nBmdfLAx6CG+OxftqDJnfVhIOEluklfjgsqGJud2z62srn+fJS2VOwfLd7GI
X-Received: by 2002:aed:3ce8:: with SMTP id e37-v6mr14666788qtf.295.1527948909516;
        Sat, 02 Jun 2018 07:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527948909; cv=none;
        d=google.com; s=arc-20160816;
        b=My4mcyMWTROyEbbqJRvVLQfcV0mwGEhhyf5JuUljRWnyvoYYm9FhQL8yT4qlxzJFUR
         BFvCZO2Af66mTXvymnhu5u8c7k/Ie3ml8s5n52h5xNPXTpbZWtvDa6qX71HnjAZVah1g
         A/B9HPhV5yfUqRXQoxrkQuMzpmQtkb38xuc7g2EpdcCGB3BqdqTymiFDy1bszTSzSSJ/
         +hI0bUIaIwQWJrHNX0oCe8lc/IkPYa1ULUT1j8MVFHfpbGaL4Ll6HM3DEU0D8TgF91ob
         CngeTlqb77R4fZT2i2WS7l0djtEN+Qb+0DqMxtYZp3/TKDHG/QlHGOwZ5ztezfwUPLqo
         Y9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=6jTV5JqYRIy5b4ASbhS4Ups6Q+sSrUehWHPG3QTJsI4=;
        b=0glGIjLwKv8PPOj+u3ws8+jJp4jrrUAlqMnb080qhd5SolQNzlw/1PVo4W/XfAnCUQ
         1tw0DSVBbUgzxiPh0oKOS9IpTCmgCVpwShh4lkiFNlO97RmdOBIUDXww02keBbN1QOMB
         UqpL6MFeJYJ62W9FJPenCVDkFBANJKEqYG4wtpaQDBzHhKXrjvECxuoa9Mf2Qlhg14pw
         EVwb2ghyzEEfdurc7q/z8UjZ453ZGkiVgvu+0Kbp1z6bDzzzBxWZVFJFlwy6SwUZTK01
         Vs29skvDc1UhxrwR8RwlfPZ73rAJi6X9iSbKmmFIl/XQ0k/jpE7ovbC7Q3Cn9gOH6oF7
         fcJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t16-v6si3987175qtg.94.2018.06.02.07.15.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jun 2018 07:15:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fP7JE-0001HO-Tw
	for alex.bennee@linaro.org; Sat, 02 Jun 2018 10:15:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fP7J4-0001Fw-7c
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 10:14:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fP7J0-00073K-Ul
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 10:14:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53184 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fP7J0-0006zk-Px; Sat, 02 Jun 2018 10:14:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0678A406E966;
	Sat,  2 Jun 2018 14:14:52 +0000 (UTC)
Received: from localhost (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 49E84111763D;
	Sat,  2 Jun 2018 14:14:47 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Sat,  2 Jun 2018 15:14:44 +0100
Message-Id: <20180602141446.29982-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Sat, 02 Jun 2018 14:14:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Sat, 02 Jun 2018 14:14:52 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 0/2] arm: add skeleton Cortex M0 CPU model
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, qemu-arm@nongnu.org, joel@jms.id.au,
	Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eg+3CF5HN0d0

This patch series adds a skeleton ARM Cortex M3 CPU model and updates the
"microbit" machine type to use it.

The Cortex M0 emulation is not complete.  This just lays the groundwork so we
can implement the missing ARMv6-M feature tests in target/arm/.

These patches cannot be merged until ARMv6-M feature tests have been fully
implemented.

Julia: it should now be possible for you to tackle the Cortex M0 emulation
tasks that have been discussed on the mailing list.

Based-on: http://github.com/stefanha/qemu/commits/microbit

Stefan Hajnoczi (2):
  target/arm: add "cortex-m0" CPU model
  arm: add ARMv6-M device container

 hw/arm/Makefile.objs            |   1 +
 hw/intc/Makefile.objs           |   2 +-
 hw/timer/Makefile.objs          |   2 +-
 include/hw/arm/arm.h            |  16 +++
 include/hw/arm/armv6m.h         |  49 ++++++++
 hw/arm/armv6m.c                 | 190 ++++++++++++++++++++++++++++++++
 hw/arm/nrf51_soc.c              |   5 +-
 target/arm/cpu.c                |  12 ++
 default-configs/arm-softmmu.mak |   2 +
 9 files changed, 274 insertions(+), 5 deletions(-)
 create mode 100644 include/hw/arm/armv6m.h
 create mode 100644 hw/arm/armv6m.c

-- 
2.17.0

