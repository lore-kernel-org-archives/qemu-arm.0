Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1146767wrq;
        Fri, 13 Jul 2018 14:47:13 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcahVyMHlSuwL/WqDMW6HC+yw2S+Q8TqpNnQGG8twban/xfVnveZL9LSzkMT4MPoPuSNowz
X-Received: by 2002:ac8:12c3:: with SMTP id b3-v6mr7463760qtj.352.1531518433354;
        Fri, 13 Jul 2018 14:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531518433; cv=none;
        d=google.com; s=arc-20160816;
        b=iEz49+N2A8LgeWgahytBTsCuq9gQ3Iwf2VCBmbb9GZM/Dv0mZWiXb9/wj513IXZofG
         C0xErMIYVrpoYcKWaSzKJXaW2fP7ekJvhDxk3B15VydDIXKXQBs7F9jaZ67j1Kl9GruR
         fxUgpBZFSzntJ71HxdjrDPgoqVU2VAxamzeD+6L/0la5XLSPvj73/g20Wj8zVVc8fFcP
         xGaw7BqxA0aSFIHqGxCnuYFQzfd2ACZP6j03KsUoQRhRbe7gyFVJi2OVtKhH/Bts3AhD
         1JLiT0jVwnQUBHtrWLQtyn8aXuhGiQw/mkJMEryT5a0UWCUGxGh6e/3wvx0NuC0+N3Fz
         s91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=o73EJkFiIZtOOgggHo5qwP3Au309/Zp5Ruh84uz4+AM=;
        b=hEAxyotDybnx//jtrQcAUxRCBs2U9zQB3B+l2PH8DLtfGDHuUwYD7I6UTJGt9+OqEx
         hidt520OFiH6mF0hQEUwGXplEqx+raO48RCf4tLwGFJIrcmj3ibaUd36/LqMGBeyKL9W
         QAvOaKZKolhIYp7IiQuJc9RvaKZvOFfsoTYhrxnG9aHp1o/itNl0tVvw/HdFqEH+sTCx
         1/7JCtG5G18A7Tj6/oIx2v2SEUZJZ4yKnP8eq+abAw4HMEmZUTFN2ifMxX00mjb1ebEr
         ZVvqlVnl0Rie3BctY8/h4oD8aMW1cAhKqcA9o4mx4wzcXzyoUNm2afC0nz4PrAHE/K1O
         kN/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18-v6si19839823qks.375.2018.07.13.14.47.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 14:47:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39271 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fe5uC-000322-Rv
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 17:47:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe5u2-00031s-5V
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 17:47:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe5ty-0005WW-9W
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 17:47:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36280)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fe5ty-0005WK-2u; Fri, 13 Jul 2018 17:46:58 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24C563683B;
	Fri, 13 Jul 2018 21:46:57 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D2405D968;
	Fri, 13 Jul 2018 21:46:56 +0000 (UTC)
Date: Fri, 13 Jul 2018 18:46:54 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Message-ID: <20180713214654.GW31657@localhost.localdomain>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
	<1531470464-21522-2-git-send-email-thuth@redhat.com>
	<20180713211636.GS31657@localhost.localdomain>
	<0a63f154-ac68-b6f0-ab6a-e0951c6ae8d5@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <0a63f154-ac68-b6f0-ab6a-e0951c6ae8d5@suse.de>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 13 Jul 2018 21:46:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 01/16] qom/object: Add a new function
 object_initialize_child()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UrMk7yHLthBX

On Fri, Jul 13, 2018 at 11:29:17PM +0200, Andreas F=E4rber wrote:
> Am 13.07.2018 um 23:16 schrieb Eduardo Habkost:
> > I wonder if we should deprecate object_initialize() and support
> > only object_initialize_child() later.  Initializing an object
> > contained inside another one without making it a child of the
> > parent object is a recipe for trouble.
>=20
> The root container object needs to be initialized, too.

If the object is not embedded in another struct, I would expect
it to be created using object_new() instead of
object_initialize().

--=20
Eduardo
