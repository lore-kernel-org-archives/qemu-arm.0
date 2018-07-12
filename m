Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1287020wrq;
        Thu, 12 Jul 2018 05:06:42 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfGl/NY15/PSkpSrt+N+L3wwi0XCBpQW3hnE9tMsE/DYF/vJDLl8b/hGyIX4I9qw4ZAhce6
X-Received: by 2002:ac8:29ef:: with SMTP id 44-v6mr1449476qtt.174.1531397202808;
        Thu, 12 Jul 2018 05:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531397202; cv=none;
        d=google.com; s=arc-20160816;
        b=SovST8k+mh1PXAOGRnbef8t9eH9O+sseLlX/tdG4GAf0VEsq4YY4PstOUVzIN5Nvx7
         VMWQQmNyagJ31cSsKsDHul2e9JQvLOHbZ37aK+QJIfT3pbmblKnh3OTlPlRQrZUt/xpd
         KpeQIr6Ce8JRPJjp40iAw8Whxu3CibsDf3VLT6nzKACiD9zPmHMn7idjvrS7tLQvOXOi
         OB0I0Enpm+qxzu3P6v8qkPR3HBBYYswiAmxfHkOIbLeJ0ASJEcRlpZxIY5Kx9tKNvyLr
         GmbQzkBfdA7Fp+MwzlMN0g/9ZcJm6SiA33MYr/FVD89399hIErkDuOeheX0Jf6BRsXlt
         4hJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=6+RX82KVTZ+snzgZEPwlxM0sGR38JYbp8MQ2NMlbZLM=;
        b=0hCZyPSQOBKS9vdurhYDFlSUdiyMQtO+qamT5dFh0A2zGTW2pR+dZItTfEs3IpYeX+
         mZ/QCYa8jBSkFMwMbxKmKMcqo47X8RyQb0kdKsnwRP0GdAOplfvcWFfMN4u1J6ubbKOj
         jXVhfAYvxl1iUPePY9DsIKww4dfN0VZk8kJ7DBb/zA+ScyfxdRaLVtU+yLsOa3KN9sCp
         Tr/GDPAfKgo2SaQ5Qtw+lS0CSo5EEM4ITp8unDpjoFqv4JjBjB2TD8fvLceJXSfJzD/w
         tY/pEwH8zR6Dka56PqnMm/y216p+CQVabydYBNJ/U4+sx5ZWmfUI3fUEWnKQCvKBVN4p
         ZRtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y7-v6si2613522qvk.173.2018.07.12.05.06.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 05:06:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdaMs-0003H1-AZ
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 08:06:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fdaMh-0003G4-9R
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 08:06:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fdaMd-0001oV-T8
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 08:06:31 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44022 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fdaMd-0001nx-OV; Thu, 12 Jul 2018 08:06:27 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5AE42859AA;
	Thu, 12 Jul 2018 12:06:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-125.ams2.redhat.com
	[10.36.116.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B526F2026D6B;
	Thu, 12 Jul 2018 12:06:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 76D4311385D6; Thu, 12 Jul 2018 14:06:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-T_d2kEU+Pb72=pJQhpvqvN1owgi4RLNtNY=L4t_1Z2g@mail.gmail.com>
	<5d0c7195-ffbf-1618-6106-ef6c82df3bd7@redhat.com>
	<CAFEAcA9GspXJg2ioLrCknBgYHJ9f6qvM=n=y0dLeU12yv_5ETA@mail.gmail.com>
	<931c0545-e3d8-fc84-9b69-59fab040265c@redhat.com>
	<20180711161216.GV7451@localhost.localdomain>
	<CAFEAcA-3aBQPwiwDfZSjspiwv4L-U0LXBKaOQ2m+=OzhqRq3OQ@mail.gmail.com>
Date: Thu, 12 Jul 2018 14:06:25 +0200
In-Reply-To: <CAFEAcA-3aBQPwiwDfZSjspiwv4L-U0LXBKaOQ2m+=OzhqRq3OQ@mail.gmail.com>
	(Peter Maydell's message of "Wed, 11 Jul 2018 18:15:01 +0100")
Message-ID: <87y3egmzem.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 12 Jul 2018 12:06:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 12 Jul 2018 12:06:27 +0000 (UTC) for IP:'10.11.54.4'
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
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b7WyMq6utzqX

Peter Maydell <peter.maydell@linaro.org> writes:

> On 11 July 2018 at 17:12, Eduardo Habkost <ehabkost@redhat.com> wrote:
>> On Wed, Jul 11, 2018 at 09:21:48AM +0200, Thomas Huth wrote:
>>> Hm, ok, so how to continue here now? Shall we at least mark the
>>> bcm2836/7 devices with user_creatable=false, so that users can not crash
>>> their QEMU so easily with device_add? The problem with introspection via
>>> device-list-properties would still continue to exist, but I think that's
>>> less likely used in practice... otherwise we could still move the
>>> qdev_set_parent_bus() calls to the realize() function instead, and just
>>> add a big fat FIXME comment in front of the code block, so that we
>>> remember to clean that up one day...
>>
>> Crashing device-list-properties should be a blocker bug, IMO.

Seconded.

>> Moving to realize is not the best solution, but I would prefer to
>> do that in 3.0 instead of leaving the device-list-properties
>> crash unfixed.
>
> I would like to see the crash fixed too. But I'd like to
> see it fixed:
>  (a) by having clear documentation about how the QOM
> system works, what you should do in init and what you
> should do in realize, when and why you need to manually
> parent objects, etc
>  (b) as far as possible making our APIs for doing this
> easy to use correctly and difficult to use wrongly. At
> the moment we have APIs that are far too easy to misuse,
> which means we will continue to get bugs like this and spend
> a lot of time on one-off fixes for them.
>
> In particular I don't understand why we need to manually
> parent these objects at all.

I want both (a) and (b) as badly as anyone, but we should not hold any
particular crash bug hostage to get them.
