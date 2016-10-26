Received: by 10.80.166.35 with SMTP id d32csp188643edc;
        Wed, 26 Oct 2016 10:37:23 -0700 (PDT)
X-Received: by 10.31.89.132 with SMTP id n126mr2170370vkb.47.1477503442758;
        Wed, 26 Oct 2016 10:37:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m206si1202646vke.212.2016.10.26.10.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2016 10:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36355 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzS8g-0003m5-1f
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 13:37:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bzRWc-0004Go-0Z
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 12:58:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bzRWZ-0001uo-CH
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 12:58:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33512)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1bzRWZ-0001tm-6s; Wed, 26 Oct 2016 12:57:59 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9ACBCC00BB11;
	Wed, 26 Oct 2016 16:57:55 +0000 (UTC)
Received: from localhost (ovpn-116-163.phx2.redhat.com [10.3.116.163])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9QGvsX8027120; Wed, 26 Oct 2016 12:57:55 -0400
Date: Wed, 26 Oct 2016 14:57:53 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161026165753.GC5057@thinpad.lan.raisama.net>
References: <1477499426-9550-1-git-send-email-ehabkost@redhat.com>
	<1477499426-9550-9-git-send-email-ehabkost@redhat.com>
	<CAFEAcA9cr63HyXR+USsXJcF5txwJy0t2pw7NenCTHAAH=pRnUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9cr63HyXR+USsXJcF5txwJy0t2pw7NenCTHAAH=pRnUw@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 26 Oct 2016 16:57:55 +0000 (UTC)
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
X-TUID: SzcllmaUqrlV

On Wed, Oct 26, 2016 at 05:48:03PM +0100, Peter Maydell wrote:
> On 26 October 2016 at 17:30, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > The only remaining user of object_class_property_add() is
> > arm_cpu_post_init(), but removing it may take some work. While we
> > don't change it, warn people to not use the function in new code.
> 
> This is about the third time I've seen this commit
> message go past, but:
> 
>   git grep object_class_property_add target-arm   => no hits

Erm. I meant qdev_property_add_static(). Sorry.

target-arm/cpu.c:        qdev_property_add_static(DEVICE(obj), &arm_cpu_reset_cbar_property,
target-arm/cpu.c:        qdev_property_add_static(DEVICE(obj), &arm_cpu_reset_hivecs_property,
target-arm/cpu.c:        qdev_property_add_static(DEVICE(obj), &arm_cpu_rvbar_property,
target-arm/cpu.c:        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_el3_property,
target-arm/cpu.c:        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_mpu_property,
target-arm/cpu.c:            qdev_property_add_static(DEVICE(obj),

Commit message needs to be rewritten as:

    qdev: Warning about using qdev_property_add_static() in new code
    
    The only remaining user of qdev_property_add_static() is
    arm_cpu_post_init(), but removing it may take some work. While we
    don't change it, warn people to not use the function in new code.

-- 
Eduardo
