Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1558638wrq;
        Thu, 12 Jul 2018 09:22:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcgZUG+T/baOZlmf0fotX3DgHyPoQIGysWgeqcYAQWw+pA5Kh3aLRnf/boOFT/ku2tqDajX
X-Received: by 2002:ac8:f5b:: with SMTP id l27-v6mr2479256qtk.158.1531412573268;
        Thu, 12 Jul 2018 09:22:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531412573; cv=none;
        d=google.com; s=arc-20160816;
        b=z3/BfEiRmTaQrMR6Yk5bGtdksfp/mATYqwNemfiXFfcZO0yu3th9IYDmdHnXru6o6H
         8iYTJt7Npv+gf25LjXt9ySkMaZtV9ryR0y55qQ/JGVY1yvi3DqP2EJqBDxbKPhc+fvrj
         DHeWFNFC4xp4wF946DYWMn/7Qz+DAWHlNuGBYzIRv1XUSDcCeRtz+pojvDe6IdmuKHTg
         JlExpFL638NOZABSOe2PcxMPrEqkMozcPl8zCaK4VsLoqbNlY/zJURbCX3OMXz+RCBLm
         Z1klt70iZBuSdX1rCKwqo5JsL9FkXf1drH/0q8y4r3InPMfxcU5P+B6byQisJGohIhOh
         NCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=hi4UK8imtTgt8tO1cssvDHGjZnUeXDKoUoph0bC6hCk=;
        b=uXzaBaS0qTa3KQzxDScNEqmCA213Tqvjbx2/fRH4bIXXEUUtup2CViMwRbKx57a2Uz
         XSH/XUFfBPpn7wfh2CroM/ibWEYp7eNwFFRafVRoXX0SlEoV2gogeYrRxoFObPfybs24
         VRocSl40XTWyQYx7WZb4plUY3ndsrUr4h9eYkeJ0gwreLLrc0GgNDy9UkpagXdHPmEGJ
         ELGX4K98qeoKw92k6m93DrfDcc7guvJ0ga1iRyNtZ+oApfb0uCkuVUU6b+GWt5sBNcJ1
         X5BcLI4YRn3MJL+v/W/SMTZe81TYFzwk2DtIht51nrXVuFqYok+Pn1ojTGKi+S6X8/gs
         o83g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lv3589Yb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a10-v6si3291957qvk.39.2018.07.12.09.22.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 09:22:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lv3589Yb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdeMm-0007wc-Rg
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 12:22:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdeMa-0007v5-Gs
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 12:22:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdeMZ-000234-KS
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 12:22:40 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:43226)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdeMZ-00022h-GN
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 12:22:39 -0400
Received: by mail-oi0-x243.google.com with SMTP id b15-v6so56820022oib.10
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 09:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hi4UK8imtTgt8tO1cssvDHGjZnUeXDKoUoph0bC6hCk=;
	b=Lv3589YbyLfmbXT+NrhwWVvCVqiJgQhYx+EEOyJ7Decgjjxte74zRaG/J7Dnm/AxVI
	+bG4jP531wmtotD7NmituqxYLan8Sc2GatO/7VvMLfN7mCDtd/pkdAzxWFGgkrp9jvqu
	GRt9FAWHssX/t5jPeAhfyEras5AeLrBSIDjAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hi4UK8imtTgt8tO1cssvDHGjZnUeXDKoUoph0bC6hCk=;
	b=ONyPrPQv+ih1dkwXVoNGq9/2klPOWN1tMipVQcSglPrzjDz/IM+w7Ml85Z+TC1MF3y
	S8n6+NA6heSoEJNglHOBNZxh5DwkNUEJrl0DGGS+n9bxsfWZjFIFmvq2wrwyHLvUGyS4
	tXI/5630lyRGL8PWhL9lvAi6VQzJhTiiEucq/jsiCj0CucZdSJsi4PljZNCipQR1JHYX
	krBsysl7tW9OTcOE2KJ2zg/adp25fStNhOuLBwPye1zEo1BOBC9d3rvMqqpVjsAr0slT
	J0LDc2aXFJ060IdSlleUq8Eea8Q3Qwfc03OQYSupKVHDps1GeaNOlSly76bBXmILyLTQ
	wC5A==
X-Gm-Message-State: AOUpUlGuHunvmbB+zXUO0HvCFLrJ3fTFpao6RA0Aa1qHoFRIoKOkWnVz
	7CLLBrLYfc/wshlDP2zMM8CtvQpQCg/v7EaVX8LfNQ==
X-Received: by 2002:aca:ce0f:: with SMTP id
	e15-v6mr3225381oig.13.1531412558808; 
	Thu, 12 Jul 2018 09:22:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 09:22:18
	-0700 (PDT)
In-Reply-To: <87muuwo2dz.fsf@dusky.pond.sub.org>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-T_d2kEU+Pb72=pJQhpvqvN1owgi4RLNtNY=L4t_1Z2g@mail.gmail.com>
	<5d0c7195-ffbf-1618-6106-ef6c82df3bd7@redhat.com>
	<CAFEAcA9GspXJg2ioLrCknBgYHJ9f6qvM=n=y0dLeU12yv_5ETA@mail.gmail.com>
	<931c0545-e3d8-fc84-9b69-59fab040265c@redhat.com>
	<20180711161216.GV7451@localhost.localdomain>
	<CAFEAcA-3aBQPwiwDfZSjspiwv4L-U0LXBKaOQ2m+=OzhqRq3OQ@mail.gmail.com>
	<87y3egmzem.fsf@dusky.pond.sub.org>
	<6cc1c007-4bdf-2b8c-b0b0-d32979a56ecd@redhat.com>
	<87muuwo2dz.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 17:22:18 +0100
Message-ID: <CAFEAcA9g0Vu-cF50maC2cVrSffZA5F6AsoM5pz2XT09YKG4WHg@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
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
X-TUID: KffhRSP/g+bx

On 12 July 2018 at 17:16, Markus Armbruster <armbru@redhat.com> wrote:
> Thomas Huth <thuth@redhat.com> writes:
>
>> On 12.07.2018 14:06, Markus Armbruster wrote:
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>
>>>> On 11 July 2018 at 17:12, Eduardo Habkost <ehabkost@redhat.com> wrote:
>>>>> On Wed, Jul 11, 2018 at 09:21:48AM +0200, Thomas Huth wrote:
>>>>>> Hm, ok, so how to continue here now? Shall we at least mark the
>>>>>> bcm2836/7 devices with user_creatable=false, so that users can not crash
>>>>>> their QEMU so easily with device_add? The problem with introspection via
>>>>>> device-list-properties would still continue to exist, but I think that's
>>>>>> less likely used in practice... otherwise we could still move the
>>>>>> qdev_set_parent_bus() calls to the realize() function instead, and just
>>>>>> add a big fat FIXME comment in front of the code block, so that we
>>>>>> remember to clean that up one day...
>>>>>
>>>>> Crashing device-list-properties should be a blocker bug, IMO.
>>>
>>> Seconded.
>>
>> Well, maybe I should then not suggest to add a hmp("info qtree") below
>> the hmp("info qom-tree") in test_one_device() of
>> tests/device-introspect-test.c ... otherwise we'll be quite busy in the
>> next weeks...
>
> If we can't fix these bugs in time, we can bring back
> cannot_destroy_with_object_finalize_yet, as Eduardo mentioned upthread.
> Would be sad, but sad beats crash.

...but are they actually interesting crashes? Nobody is ever
going to actually start emulation of an integratorcp machine and
then try to add a bcm2837 device via the QMP interface, except
if they're deliberately doing exhaustive testing. They're bugs,
sure, but they're not bugs I can ever see any real user possibly
tripping over, so we don't necessarily need to go to any
particular lengths to fix them for 3.0 if that's painful.

thanks
-- PMM
