Received: by 10.80.166.35 with SMTP id d32csp239442edc;
        Wed, 26 Oct 2016 12:36:56 -0700 (PDT)
X-Received: by 10.55.159.140 with SMTP id i134mr3294162qke.172.1477510616214;
        Wed, 26 Oct 2016 12:36:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b124si2114961qkd.125.2016.10.26.12.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2016 12:36:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzU0N-0006xL-Lg
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 15:36:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bzU0K-0006x3-FY
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 15:36:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bzU0H-0003d7-Ew
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 15:36:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51108)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1bzU0H-0003cJ-9B; Wed, 26 Oct 2016 15:36:49 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35FE2C04B922;
	Wed, 26 Oct 2016 19:36:48 +0000 (UTC)
Received: from localhost (ovpn-116-163.phx2.redhat.com [10.3.116.163])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9QJakvI001547; Wed, 26 Oct 2016 15:36:47 -0400
Date: Wed, 26 Oct 2016 17:36:45 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161026193645.GD5057@thinpad.lan.raisama.net>
References: <1477499426-9550-1-git-send-email-ehabkost@redhat.com>
	<1477499426-9550-9-git-send-email-ehabkost@redhat.com>
	<CAFEAcA9cr63HyXR+USsXJcF5txwJy0t2pw7NenCTHAAH=pRnUw@mail.gmail.com>
	<20161026165753.GC5057@thinpad.lan.raisama.net>
	<CAFEAcA885YFMCE=ZFbo=7iitwRuc1nyUzyJK38=T+KLOw46mNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA885YFMCE=ZFbo=7iitwRuc1nyUzyJK38=T+KLOw46mNg@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 26 Oct 2016 19:36:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 8/8] qdev: Warning about using
 object_class_property_add() in new code
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CeTR6wL4r9ov

On Wed, Oct 26, 2016 at 06:57:12PM +0100, Peter Maydell wrote:
> On 26 October 2016 at 17:57, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > On Wed, Oct 26, 2016 at 05:48:03PM +0100, Peter Maydell wrote:
> >> On 26 October 2016 at 17:30, Eduardo Habkost <ehabkost@redhat.com> wrote:
> >> > The only remaining user of object_class_property_add() is
> >> > arm_cpu_post_init(), but removing it may take some work. While we
> >> > don't change it, warn people to not use the function in new code.
> >>
> >> This is about the third time I've seen this commit
> >> message go past, but:
> >>
> >>   git grep object_class_property_add target-arm   => no hits
> >
> > Erm. I meant qdev_property_add_static(). Sorry.
> > Commit message needs to be rewritten as:
> >
> >     qdev: Warning about using qdev_property_add_static() in new code
> >
> >     The only remaining user of qdev_property_add_static() is
> >     arm_cpu_post_init(), but removing it may take some work. While we
> >     don't change it, warn people to not use the function in new code.
> 
> Can we say what the recommended replacement function is?

It's mentioned in the comment I added[1]. I assume I don't need to duplicate
the comment contents in the commit message.

[1] "Do not use this in new code. Either use qdev_class_set_props(), or
    register regular QOM properties using object_property_add() or
    object_class_property_add()."

-- 
Eduardo
