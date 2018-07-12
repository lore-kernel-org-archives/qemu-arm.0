Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1360667wrq;
        Thu, 12 Jul 2018 06:20:13 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcRUxvhnHqgbfPMklSnLYS3j3oO7bjQUPZoquE+B+mW6noTXWCKa5r/KwNoIi9HU2CuFKsn
X-Received: by 2002:a0c:bf84:: with SMTP id s4-v6mr2291920qvj.150.1531401613431;
        Thu, 12 Jul 2018 06:20:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531401613; cv=none;
        d=google.com; s=arc-20160816;
        b=EGF0JvVbQJ85ZnamlnR2tDDBA3oDZRiRDk+FBAMDPg3BcpN5yel/XL9SWY08Mc0DS8
         YF2YZj57n2falvKPjoobVB+k70Dp2UtfVDYObnFAXpLbnNDkRfJXD/RCPR7aL+DjZA+f
         rGuh251dI6+zWRJRNE96K369IhAYNRP+eBJamLhOnU7/EXV6so+kVesnWsQ5QCLur6uH
         o9YBD+oAZaKk1e+ROkVW/owmtVtfCy+gvoeDsqBCYD7gpcueNvLVoysKSG+4NBkViR4o
         K2IWYr828HmctKk0nNzCPfl/wMuqz/H59IZTuUFgerA6/1w/kxGZ0hcwawHsULzBt8+0
         hTJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=BASK12OIecWxpOYOnhTugDDVTA1XRzMDx8SglrKbdC0=;
        b=S0mxTWHj7xsxZeVJlSLakKVvTha7FXLl4N7GJYcPDSEByNE5LTaQ4RC1vSXRLZCSSB
         Rfmo4K+5nrXPKHUn194Ff1kP6T5Usb3/lBXfOPrzL4XUJVWQPXYALKrLthzkYixcN/CT
         98VuLvp30X7h0AGEths4zGl5ddCSkAOVo1icP26CWYuqYMXqhy7hQjmDO6d3PzsXdhar
         bfgUoAW8K5K7/8i6/vtmKVzMsdjA4T9bRHuHo1LprUc7ben9rP6BuoKQH3alVcF+ZUe3
         GwyaoO87+nusL7rbs3SKfckHXIwO/H1P/uW9r0bkF+3RIyHyYHSvK9PLvFIWhIoldOXs
         LPHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h57-v6si11920518qte.183.2018.07.12.06.20.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 06:20:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdbW0-0005wZ-TJ
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 09:20:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fdbVm-0005vI-8q
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 09:19:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fdbVh-0000jE-DN
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 09:19:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38214 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fdbVh-0000ik-75; Thu, 12 Jul 2018 09:19:53 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75AD8818B11B;
	Thu, 12 Jul 2018 13:19:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-125.ams2.redhat.com
	[10.36.116.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D6B92026D6B;
	Thu, 12 Jul 2018 13:19:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D35AB11385D6; Thu, 12 Jul 2018 15:19:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-T_d2kEU+Pb72=pJQhpvqvN1owgi4RLNtNY=L4t_1Z2g@mail.gmail.com>
	<5d0c7195-ffbf-1618-6106-ef6c82df3bd7@redhat.com>
	<CAFEAcA9GspXJg2ioLrCknBgYHJ9f6qvM=n=y0dLeU12yv_5ETA@mail.gmail.com>
	<931c0545-e3d8-fc84-9b69-59fab040265c@redhat.com>
	<20180711161216.GV7451@localhost.localdomain>
	<CAFEAcA-3aBQPwiwDfZSjspiwv4L-U0LXBKaOQ2m+=OzhqRq3OQ@mail.gmail.com>
	<87y3egmzem.fsf@dusky.pond.sub.org>
	<CAFEAcA-RwRdgr-_YVwEWf0pSNQj_rdEmX_OZf5HFmNoR8LbthA@mail.gmail.com>
Date: Thu, 12 Jul 2018 15:19:50 +0200
In-Reply-To: <CAFEAcA-RwRdgr-_YVwEWf0pSNQj_rdEmX_OZf5HFmNoR8LbthA@mail.gmail.com>
	(Peter Maydell's message of "Thu, 12 Jul 2018 13:55:49 +0100")
Message-ID: <87efg8lhft.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 12 Jul 2018 13:19:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 12 Jul 2018 13:19:52 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WVcG0VAX54pg

Peter Maydell <peter.maydell@linaro.org> writes:

> On 12 July 2018 at 13:06, Markus Armbruster <armbru@redhat.com> wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> On 11 July 2018 at 17:12, Eduardo Habkost <ehabkost@redhat.com> wrote:
>>>> On Wed, Jul 11, 2018 at 09:21:48AM +0200, Thomas Huth wrote:
>>>>> Hm, ok, so how to continue here now? Shall we at least mark the
>>>>> bcm2836/7 devices with user_creatable=false, so that users can not crash
>>>>> their QEMU so easily with device_add? The problem with introspection via
>>>>> device-list-properties would still continue to exist, but I think that's
>>>>> less likely used in practice... otherwise we could still move the
>>>>> qdev_set_parent_bus() calls to the realize() function instead, and just
>>>>> add a big fat FIXME comment in front of the code block, so that we
>>>>> remember to clean that up one day...
>>>>
>>>> Crashing device-list-properties should be a blocker bug, IMO.
>>
>> Seconded.
>>
>>>> Moving to realize is not the best solution, but I would prefer to
>>>> do that in 3.0 instead of leaving the device-list-properties
>>>> crash unfixed.
>>>
>>> I would like to see the crash fixed too. But I'd like to
>>> see it fixed:
>>>  (a) by having clear documentation about how the QOM
>>> system works, what you should do in init and what you
>>> should do in realize, when and why you need to manually
>>> parent objects, etc
>>>  (b) as far as possible making our APIs for doing this
>>> easy to use correctly and difficult to use wrongly. At
>>> the moment we have APIs that are far too easy to misuse,
>>> which means we will continue to get bugs like this and spend
>>> a lot of time on one-off fixes for them.
>>>
>>> In particular I don't understand why we need to manually
>>> parent these objects at all.
>>
>> I want both (a) and (b) as badly as anyone, but we should not hold any
>> particular crash bug hostage to get them.
>
> Without at least (a) I can't review this patch or any other
> patch that fixes this kind of crash bug...

Fair point.  But if Paolo can, and vouches for a fix, then we shouldn't
hold the fix hostage.
