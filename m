Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp444339wrq;
        Wed, 11 Jul 2018 10:15:33 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfv8+TJOYAQ0/1zEn5ztSUfs8W2zSPCPHHmfrxUxjVCu5Wjx0gCBIVrPIeSBIaxQ/dtGkPc
X-Received: by 2002:a0c:be88:: with SMTP id n8-v6mr142279qvi.78.1531329333591;
        Wed, 11 Jul 2018 10:15:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531329333; cv=none;
        d=google.com; s=arc-20160816;
        b=YHjMjWYoZubG7gemGp+OPxW+w3QbIAWIt1MkekfCjOFRAwutLB9ku6gWHwheeDV/Lj
         Ge6fwC/dpc2g9BxpvuCdEqLJfaFfdWv7qRj/K0/L+eEAZVTkmpjY2doju79sKeOyFNKl
         /VK6qInc1ALA4O1LRMxB44FyYfmW06oiz7Ii0X2kc5Psdj76j2lnnSm9p8fSyXLSi2ky
         pnI6Ylrjke3kHuJatzJCoJJpFUkkvXSUzWRbiSipf5j7gFCNbEOqYrMsKgxCmqDaj9je
         UKaTf5HXY2IYa+eDVODiJVIKkVscH9/ZDKdfuqCGgkCd42Of1jXq/YFzqVereciglqrB
         gHZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=K49v3f8cjrVJ/V+Ip7BBtP5WwiuC8802ln/MMdL5I1w=;
        b=HGBXOyMlq1gpE3Snax/kkcg7HvGKVKsH+3mvAZUyW/vRjAdO0mmS2AzoU6PGdJJb67
         ELescWx8tTgLq+wXF3BnEftsOOQQuKY0iLrjMcU9uqVjVj/N7J47Q7V1lxr6XBhKGX5L
         3/gL2YJBhtsUTjOWcysa4LHe2rK0OuhCRVBapvfGTN00V9IMqta6MKGsuyn783SZlsaV
         L76bMeoNp15OyRVt2mbY/ZXjRdDZ2SwqHnt2bxPACulAz8HpMwb/pHt6wgkvSZb4XYm0
         CiTzi9sy8PqdvWR3Uu541srUHEhVTNT1RcDPbQvAo0Iq+DDDT0yWicRR3atj9ToDcrRH
         TeWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YxcqpKeX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d26-v6si74344qvh.202.2018.07.11.10.15.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jul 2018 10:15:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YxcqpKeX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54820 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdIiD-0003CX-3W
	for alex.bennee@linaro.org; Wed, 11 Jul 2018 13:15:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdIi4-0003Bx-Oc
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 13:15:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdIi3-00081N-Is
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 13:15:24 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:42058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdIi3-00080t-A7
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 13:15:23 -0400
Received: by mail-oi0-x242.google.com with SMTP id n84-v6so50619340oib.9
	for <qemu-arm@nongnu.org>; Wed, 11 Jul 2018 10:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K49v3f8cjrVJ/V+Ip7BBtP5WwiuC8802ln/MMdL5I1w=;
	b=YxcqpKeXId/imWEg6xWQ6W0eoMnyfw88XQyP++hjlBvQ9HpoRwT7MTfJInzCPXsJzc
	N6lOeKdsK2Q4R0hVKTUvcI3fE9kE2nZ4ZwEMNvDQcDNnpDXCgG37fajMFnYsIq3IWbNA
	VyhYs5N+YY9cSZwY3MdB8BNnmF0csswRLN5Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K49v3f8cjrVJ/V+Ip7BBtP5WwiuC8802ln/MMdL5I1w=;
	b=Awlec26bZGak+csyfiWfTc2HN7U6gXaAc7Zk2GkYVrT/38yKO87xqBmc2GEF+p9xsA
	itl7ww+DxiBoGKosNtxqBgHJgA7eYoRhk6xCEtMFcqMdudiSC6UiFocPZUIMy1Y9tyly
	dWQwc3nLFgbANJdcwmX3NOvVsnR/P8YNTkxVCVSlTf97UGYZj9Jnstfep1GL9WcG6TzM
	s3MO8juo1UO2KcgIKeXxyOfxK5y677b5svI70+4vvhRL7OTU6wN4zTLEDfpd2u9QIHb9
	foAIl3nPXv8V19UJ3OTKNeJcx9mKYWgRECGAXKt1ZwGk9dyfpQrXBj4KPiYF1IK95EOn
	Ie1w==
X-Gm-Message-State: AOUpUlFMvvr/PHu4ai46AVOWPxf6bV3yXPwQVqMwarsCkwXF7YnfCtLm
	iLkjzEUd9l+zKXk47sAscQGU1MdZMS3nuWI3lbC/9A==
X-Received: by 2002:aca:ce0f:: with SMTP id e15-v6mr158907oig.13.1531329322022;
	Wed, 11 Jul 2018 10:15:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Wed, 11 Jul 2018 10:15:01
	-0700 (PDT)
In-Reply-To: <20180711161216.GV7451@localhost.localdomain>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-T_d2kEU+Pb72=pJQhpvqvN1owgi4RLNtNY=L4t_1Z2g@mail.gmail.com>
	<5d0c7195-ffbf-1618-6106-ef6c82df3bd7@redhat.com>
	<CAFEAcA9GspXJg2ioLrCknBgYHJ9f6qvM=n=y0dLeU12yv_5ETA@mail.gmail.com>
	<931c0545-e3d8-fc84-9b69-59fab040265c@redhat.com>
	<20180711161216.GV7451@localhost.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Jul 2018 18:15:01 +0100
Message-ID: <CAFEAcA-3aBQPwiwDfZSjspiwv4L-U0LXBKaOQ2m+=OzhqRq3OQ@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EtwaEExt/n4u

On 11 July 2018 at 17:12, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Wed, Jul 11, 2018 at 09:21:48AM +0200, Thomas Huth wrote:
>> On 10.07.2018 08:50, Peter Maydell wrote:
>> > On 9 July 2018 at 23:03, Thomas Huth <thuth@redhat.com> wrote:
>> >> On 09.07.2018 23:42, Peter Maydell wrote:
>> >>> On 9 July 2018 at 22:03, Thomas Huth <thuth@redhat.com> wrote:
>> >>>> When trying to "device_add bcm2837" on a machine that is not suitable for
>> >>>> this device, you can quickly crash QEMU afterwards, e.g. with "info qtree":
>> >>>>
>> >>>> echo "{'execute':'qmp_capabilities'} {'execute':'device_add', " \
>> >>>>  "'arguments':{'driver':'bcm2837'}} {'execute': 'human-monitor-command', " \
>> >>>>  "'arguments': {'command-line': 'info qtree'}}" | \
>> >>>>  aarch64-softmmu/qemu-system-aarch64 -M integratorcp,accel=qtest -S -qmp stdio
>> >>>>
>> >>>> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 12, "major": 2},
>> >>>>  "package": "build-all"}, "capabilities": []}}
>> >>>> {"return": {}}
>> >>>> {"error": {"class": "GenericError", "desc": "Device 'bcm2837' can not be
>> >>>>  hotplugged on this machine"}}
>> >>>> Segmentation fault (core dumped)
>> >>>>
>> >>>> The problem is that qdev_set_parent_bus() from instance_init adds a link
>> >>>> to the child devices which is not valid anymore after the device init
>> >>>> failed. Thus the qdev_set_parent_bus() must rather be done in the realize
>> >>>> function instead.
>> >>>
>> >>> Yuck. The real problem here is that we're still requiring the
>> >>> code that creates these QOM devices to manually set the parent
>> >>> in the first place. It's not surprising that we don't get it right
>> >>> (either parenting in the wrong place or not at all). I'd much
>> >>> rather see us fix that properly than keep papering over places
>> >>> where we get it wrong.
>> >>
>> >> Sorry, I'm still not an expert in all this QOM stuff yet ... so what do
>> >> you exactly recommend to do instead?
>> >
>> > I'm not clear either, but I don't think that what we're
>> > currently doing can be right.
>>
>> Hm, ok, so how to continue here now? Shall we at least mark the
>> bcm2836/7 devices with user_creatable=false, so that users can not crash
>> their QEMU so easily with device_add? The problem with introspection via
>> device-list-properties would still continue to exist, but I think that's
>> less likely used in practice... otherwise we could still move the
>> qdev_set_parent_bus() calls to the realize() function instead, and just
>> add a big fat FIXME comment in front of the code block, so that we
>> remember to clean that up one day...
>
> Crashing device-list-properties should be a blocker bug, IMO.
>
> Moving to realize is not the best solution, but I would prefer to
> do that in 3.0 instead of leaving the device-list-properties
> crash unfixed.

I would like to see the crash fixed too. But I'd like to
see it fixed:
 (a) by having clear documentation about how the QOM
system works, what you should do in init and what you
should do in realize, when and why you need to manually
parent objects, etc
 (b) as far as possible making our APIs for doing this
easy to use correctly and difficult to use wrongly. At
the moment we have APIs that are far too easy to misuse,
which means we will continue to get bugs like this and spend
a lot of time on one-off fixes for them.

In particular I don't understand why we need to manually
parent these objects at all.

thanks
-- PMM
