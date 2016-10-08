Received: by 10.80.163.71 with SMTP id 65csp4082146edn;
        Fri, 7 Oct 2016 22:16:27 -0700 (PDT)
X-Received: by 10.55.60.13 with SMTP id j13mr22186695qka.113.1475903787217;
        Fri, 07 Oct 2016 22:16:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q188si11653521qkf.70.2016.10.07.22.16.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Oct 2016 22:16:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39341 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsjzm-0001DU-Mb
	for alex.bennee@linaro.org; Sat, 08 Oct 2016 01:16:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bsjzh-0001D7-UO
	for qemu-arm@nongnu.org; Sat, 08 Oct 2016 01:16:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bsjzb-0001nA-PJ
	for qemu-arm@nongnu.org; Sat, 08 Oct 2016 01:16:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60372)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1bsjzb-0001mw-JI; Sat, 08 Oct 2016 01:16:15 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 65952C0528BD;
	Sat,  8 Oct 2016 05:16:14 +0000 (UTC)
Received: from javelin (vpn-236-50.phx2.redhat.com [10.3.236.50])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u985G9DU002668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sat, 8 Oct 2016 01:16:11 -0400
Date: Sat, 8 Oct 2016 10:46:08 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA8GFqj4S7NE+b=zcqoPBTq+KZU4AGSTW0sfVH8iD=RyFQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610081045310.1044@wniryva>
References: <1475485496-21168-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA8GFqj4S7NE+b=zcqoPBTq+KZU4AGSTW0sfVH8iD=RyFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sat, 08 Oct 2016 05:16:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3] timer: a9gtimer: remove loop to
 auto-increment comparator
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Li Qiang <liqiang6-s@360.cn>,
	Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PAMvhKJkWTIN

+-- On Fri, 7 Oct 2016, Peter Maydell wrote --+
| This is still losing the setting of gtb->status in the
| case where the auto-increment bit is not set.

Ah, I've sent a revised patch v4. Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
