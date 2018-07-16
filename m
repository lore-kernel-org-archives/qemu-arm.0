Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1173528wru;
        Sun, 15 Jul 2018 23:43:37 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfHI9kcjWPLOP8MjVwWMnF/Gpp4vstY73ClzCs9y9+pT9J/owqzXDaCl8OYfDAyoFj5EvRS
X-Received: by 2002:ac8:3417:: with SMTP id u23-v6mr13360465qtb.237.1531723417207;
        Sun, 15 Jul 2018 23:43:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531723417; cv=none;
        d=google.com; s=arc-20160816;
        b=BE8s9GUSLND5YUSAAGAFeGC2kbNk1Tilqv2bttvclZMJ1AQO/2AgMAL48dxGOOseOh
         5lRDKGM41HPlCYdnIXd/BGnUSXiA7AOtxj6YsF5KWXys1w08xfSra1pmGnRpXq4Gpx7g
         zFpL1FhUhp/TE2IrvfNCKeg7YDC1VSA+hamRcVKUDoyr7x3So71b8ooa2Yxo/i3Z7b2c
         Ub3pZfuhXoB7t3GQ32yZoHtmERzKNJ+pPRirGyRoqj8qDJOabDbKIIdyAY5306IiQUl7
         1/j+sxlA5vezjt58657fle/nUP6vAPmk66KMBys4O4+sPmy+8HTgaitcCxsxvPFavoUx
         xyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=p69Uf3S/lC7LylEI/wEmx3naz2TaPAgzCtOEq+18gwg=;
        b=ZmRTrn3VC5d/AP+yQeXPK7vi7rJVZse7lPNbBTNBTIf5gTi06H7Vq+o6XcUozFz0bo
         qnOUJioIjTq3OdIo4NaHnWiznOZu58EzVyOCusCbHdTjvDUyVC3bR+GXabLqtUv2ivme
         69DkTDn4Mh6/x81J9m7Jaudw0cgdqYU8nBdWESC4M/0BhRqfftkaY5P7os2WvsPWIkLL
         Idc+9zxc+GqwkDjY1XAsQ6+4YxkQ//6WZv62hXZnmPIUHPbqt2IAFF6OQOR1CWSZ6iC+
         P9SYtBvzj+nZY765GdQ+hQjXXO7b3IC7rprkie4pIFAhahMO+IOFhJvbCurJQiEUp7o0
         wCtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k7-v6si2307977qtj.247.2018.07.15.23.43.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 15 Jul 2018 23:43:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49113 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fexEO-0006ys-QD
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 02:43:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fexEH-0006yk-Qx
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 02:43:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fexEE-0006uK-N6
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 02:43:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47182 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fexEE-0006u5-Ha; Mon, 16 Jul 2018 02:43:26 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 00D5B402178A;
	Mon, 16 Jul 2018 06:43:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-125.ams2.redhat.com
	[10.36.116.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD56F76C5;
	Mon, 16 Jul 2018 06:43:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7E1A411385D6; Mon, 16 Jul 2018 08:43:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<ca91bffe-2bcf-78a2-02cd-8ae7cc48074c@redhat.com>
	<20180711183031.GM914@localhost.localdomain>
	<ce0b8bf9-b0e6-fe02-c685-5a6c3140a3ae@redhat.com>
	<20180711202351.GA31657@localhost.localdomain>
	<00130bb8-4dfc-3a76-3f51-9f4c6da891c0@redhat.com>
	<20180712180420.GH31657@localhost.localdomain>
Date: Mon, 16 Jul 2018 08:43:24 +0200
In-Reply-To: <20180712180420.GH31657@localhost.localdomain> (Eduardo Habkost's
	message of "Thu, 12 Jul 2018 15:04:20 -0300")
Message-ID: <87efg3istv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 16 Jul 2018 06:43:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 16 Jul 2018 06:43:26 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/bcm283x: Fix crash with
 device_add bcm2837 on unsupported machines
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IGUCBkrGEwXf

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Jul 12, 2018 at 10:05:46AM +0200, Paolo Bonzini wrote:
>> On 11/07/2018 22:23, Eduardo Habkost wrote:
>> > On Wed, Jul 11, 2018 at 10:16:42PM +0200, Paolo Bonzini wrote:
>> >> On 11/07/2018 20:30, Eduardo Habkost wrote:
>> >>>> The theoretical behavior should be:
>> >>> It's not clear below where you expect
>> >>>   qdev_set_parent_bus(..., sysbus_get_default())
>> >>> to be called (if it should be called at all).
>> >>>
>> >>> I don't know where it should be called, but I'm absolutely sure
>> >>> instance_init is not the right place.
>> >>
>> >> I think instance_init is fine to call qdev_set_parent_bus on contained
>> >> devices.  Why do you say it's not?
>> > 
>> > Because object_unref(object_new(...)) is not supposed to affect
>> > QEMU global state at all.
>> 
>> It should not affect it.  Any changes to the global state done by
>> instance_init are immediately undone when object_unref destroys the
>> child properties of the object.
>
> I would prefer if it didn't, but not a big deal as long as all
> QOM code is protected by the BQL (it is, right?).
>
> If we get rid of object_new() in qmp_device_list_properties(),
> then most of the restrictions on instance_init can go away,
> anyway.

How could we get rid of object_new()?  As long as we create properties
in code, we need to run the code to find the properties.
