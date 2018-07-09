Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp2877696wrq;
        Mon, 9 Jul 2018 14:42:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdCABpPcosKTp4seZ80p9wxseQth1baA2KguMiiUpTKQUakc9/1QxMMe2l3Zr8wbtT16SSS
X-Received: by 2002:ac8:73ca:: with SMTP id v10-v6mr21209695qtp.329.1531172550630;
        Mon, 09 Jul 2018 14:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531172550; cv=none;
        d=google.com; s=arc-20160816;
        b=D9zVyRSR/FXAROToRwzBR0sAZYfZeaXgyT+NB0IgcrriI6kD5iMey2bOWq0JO+0fZz
         j5fMP+1Z+gDH0ZuuK9kEC47EzGzUV8amONJmZ8x6ppChcYAGlUpNN4FPL8XK+7VuAbHr
         d4p8mwL4xIG30HNZ4lAlQSOiRW5ECtNE1o7fD5IDZpHnPoP80CwMxtSCtf28zDIxxbTG
         w7mKUZ5UENEFnRmMX9PWxikH9zOgXrHGa9w7HNQJfd36HvYTetrOO4FtM7wZ+UsTMrG9
         wf9lL0klJQG+miOpJ2M8BNl1f8JUM420zC1ke51lJ5LGzpzcaetJjqNcfE+RbayILHlP
         8zlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=bAqEPeblGNlSASUrBhpS+zyjAJ/Nv4wxcgVu1YEzhpM=;
        b=xPAIFm4L5y3XnV151juvNo2+t4+Yr7JofdzX9dWO/WFvUoHSC/sbVJg/j3wRfh/MJY
         17eTK5kya2+iC4dT3gYW3xn07T0+EvCVmTSD+Ac8tGNxbKzMx4wCmxKBExHlkOMx1Wi5
         2wbq2MPg9HWExPVizqv3ZvAM3qDpc9ylH6VVcJLlVrlfBtVB6ZSWTB9QGNyUoUfZQSti
         6Xy7Uxi8WxEogo0eVdNH5Oc2H1jbPzCxEEGLeceTC+xB9JChw1E7/4+8xy6GJYwYlFOc
         XZqDztL7CXrUsoMFXoyq6SsPLi16UTR4vIFb99a4l8BDAjQzlIs0+1lScRKYb2+M82V+
         0kRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KqTotuaH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d39-v6si4111431qkh.36.2018.07.09.14.42.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jul 2018 14:42:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KqTotuaH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcdvS-0002cw-2u
	for alex.bennee@linaro.org; Mon, 09 Jul 2018 17:42:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fcdvL-0002cl-En
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 17:42:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fcdvK-0006it-IE
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 17:42:23 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:34136)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fcdvK-0006iR-4N
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 17:42:22 -0400
Received: by mail-oi0-x244.google.com with SMTP id 13-v6so38747424ois.1
	for <qemu-arm@nongnu.org>; Mon, 09 Jul 2018 14:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bAqEPeblGNlSASUrBhpS+zyjAJ/Nv4wxcgVu1YEzhpM=;
	b=KqTotuaHwl2zyXoQBkpDzdNG4Wk7TxiAhEChbjb1g7wvX4I4H7yh0OCDCLJnbz+Sps
	+FiRNaaRq4lHIzyPvBUJX6EKgJjoGOyyz+9QVIAbJTEHI4md2UUwl2agg9HhK+z8dSJC
	oFKoeZmRsyOcNu7osWjIRsFZX6q2zVJ0RMAAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bAqEPeblGNlSASUrBhpS+zyjAJ/Nv4wxcgVu1YEzhpM=;
	b=Y4XOEBAFGa4GtwtAkEha/PwgcrSubxPXul1ynyuy3FYF5qyDrB+v8Qqi6iusOyGmDt
	91M/a7hu6SKHfCB9qQAlosuD6EvKX1hYgDAhuOb9eTbbeuGuf7kVRHyYG5yKJz1nYGka
	s2nN39N5qK0hg6IPRmZFHBy/uqKPFalUaaI630XOhxxZZfUZjWvcU0SbVskNF8BzWGR0
	06EemeZyGPBUVJd4TDY9i3MwYH0J4Fm4Yo1TXW88x7tJIJLga0clkqIs0+Cgj2d4tHvz
	3oju7NaOk2ScSQlI128L7cgHq0GpoOYlBDrQ2Na7V7oHH1FRq/ok4c5iXfjjrZM0cnrz
	utFQ==
X-Gm-Message-State: APt69E1eru8Sae1rL7U7n8au0h+whvAAX6owIm9+M8QEjUAxTByLh4NM
	/HokwYqB92ik40xyg2hRpL2vBmdhardvngM7jfUfwQ==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr26117144oic.252.1531172541269; 
	Mon, 09 Jul 2018 14:42:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP;
	Mon, 9 Jul 2018 14:42:00 -0700 (PDT)
In-Reply-To: <1531170180-21199-1-git-send-email-thuth@redhat.com>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jul 2018 22:42:00 +0100
Message-ID: <CAFEAcA-T_d2kEU+Pb72=pJQhpvqvN1owgi4RLNtNY=L4t_1Z2g@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH] hw/arm/bcm283x: Fix crash with device_add
 bcm2837 on unsupported machines
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vCDJHth3wT54

On 9 July 2018 at 22:03, Thomas Huth <thuth@redhat.com> wrote:
> When trying to "device_add bcm2837" on a machine that is not suitable for
> this device, you can quickly crash QEMU afterwards, e.g. with "info qtree":
>
> echo "{'execute':'qmp_capabilities'} {'execute':'device_add', " \
>  "'arguments':{'driver':'bcm2837'}} {'execute': 'human-monitor-command', " \
>  "'arguments': {'command-line': 'info qtree'}}" | \
>  aarch64-softmmu/qemu-system-aarch64 -M integratorcp,accel=qtest -S -qmp stdio
>
> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 12, "major": 2},
>  "package": "build-all"}, "capabilities": []}}
> {"return": {}}
> {"error": {"class": "GenericError", "desc": "Device 'bcm2837' can not be
>  hotplugged on this machine"}}
> Segmentation fault (core dumped)
>
> The problem is that qdev_set_parent_bus() from instance_init adds a link
> to the child devices which is not valid anymore after the device init
> failed. Thus the qdev_set_parent_bus() must rather be done in the realize
> function instead.

Yuck. The real problem here is that we're still requiring the
code that creates these QOM devices to manually set the parent
in the first place. It's not surprising that we don't get it right
(either parenting in the wrong place or not at all). I'd much
rather see us fix that properly than keep papering over places
where we get it wrong.

Also, "device_add bcm2837" is just nonsensical: there's no
way to create an SoC device like this with device_add.
We should not allow it (for this and all the other
devices that device_add will never work with)...

thanks
-- PMM
