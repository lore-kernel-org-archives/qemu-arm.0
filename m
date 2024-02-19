Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp627488ejb;
        Mon, 19 Feb 2024 03:28:13 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVSTDxJK6B0Eg4kP+Wmrp0wxpq8p2la48eBipqdKxsUWWneVuMzSKTXpqk8SharU6g47Wj5MhVqwxYXD5bqfOZeDDJ1T27b
X-Google-Smtp-Source: AGHT+IEFYjyf9YiMMSNbgKlgkiJ+2Al7Y7kpvRLW+B1SZjWkhboT38criq1V+33p3WPUHmQz818s
X-Received: by 2002:a92:d34b:0:b0:363:ad00:106d with SMTP id a11-20020a92d34b000000b00363ad00106dmr13141276ilh.4.1708342093339;
        Mon, 19 Feb 2024 03:28:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1708342093; cv=pass;
        d=google.com; s=arc-20160816;
        b=iI11NyFAYAUnP9l5SrRNMjxoX5vpaGsJJu6NO2PBl2WoR+JPR4BsXb0Wu5s9s6Tbej
         jod/RF9O+AUAaFeikOaWBdH6NJAbrvL3My3gwrHGehLUUC5PT6sIPtdZOFmiu/dn5Z9I
         ExtdSwJw/bWCz0l4o/MGVh28XtArTih8tqQjfKZeLUtctTRa4Eosln/leujLBKRiLsGb
         9fk8e5rqzU0sbH330s+M33IqZGEcU1iRRxf809bc93xlRtlDrIpyyt75jyDSir9bU1D8
         UkufsWPeh5m/fcNgc7VGcO10VtXnI5Cm9lx+/IRN66OSNX8zXSKBlI036n1RrkhCZ3Q6
         h6dw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:in-reply-to:subject:cc:to:from:date;
        bh=CquV0sxoVd0UBXjoz5VhS08IEblbK/nKg2tDxegxD3c=;
        fh=2EkYgGc6JBEuJEHLkCYJgIjEaKtKqkk4EF8znv4UTSk=;
        b=a2n1+tnXSRNn9Rb+aTr9hsLSUH/T1fRXKvgxp9iqWJCTsTN+6yyBsuk/Qj5O8475M+
         0sPIUHUzQ7v1Kdx4vwyWxsBnug0/E8IO+327W6cRmAWUqYWRnO0r1N/Ipzjy2BtVE8YZ
         P3SqWO6FdG1XwtX5Rnry80pb8Rnttx72lRJtZSJylueTUwE8jQkNVnZURKWOQtV4/Bc6
         +ivQtF4Ja/gY57OVTXp3Oj7h6OYd3xmVYTsxjlFtPJduqZbpB2vOv1L6LKvr6/iAx/GD
         RwMwnmkWGlKK23HU90n/y4x39zSjpOM64jbMwE1NawK5M3labI/6XJJNy/YtAr3TSXQ2
         jJaw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=eik.bme.hu dmarc=pass fromdomain=eik.bme.hu);
       spf=pass (google.com: domain of kvm+bounces-9072-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-9072-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <kvm+bounces-9072-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id w22-20020a63af16000000b005e220e5132bsi2193615pge.749.2024.02.19.03.28.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 03:28:13 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-9072-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=eik.bme.hu dmarc=pass fromdomain=eik.bme.hu);
       spf=pass (google.com: domain of kvm+bounces-9072-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-9072-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28679B23DD2
	for <alex.bennee@linaro.org>; Mon, 19 Feb 2024 11:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41A22C1A0;
	Mon, 19 Feb 2024 11:28:06 +0000 (UTC)
Received: from zero.eik.bme.hu (zero.eik.bme.hu [152.66.115.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D663E847A
	for <kvm@vger.kernel.org>; Mon, 19 Feb 2024 11:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.66.115.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708342086; cv=none; b=THZKtrAvg2I86Y0qxTSRa8HmTJ3JIDyZ+08Kl5D/yF9IcRvbfbRIlqF93YClUGi+ZxpT1joXvSOX/TGD1cE1oAIVwK9iZSdPfhjIERyY+fNzyWfk/qENW8RMwTwOuC08Nws/A9DXpK5o5DqiiI18ZUJextH1wQtVxtdzKAHmjEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708342086; c=relaxed/simple;
	bh=4Cvud7QyiAKhb7TutEh2G1s4OpY3N/BteMZqGcYZ1Jo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tuWj8wRJPww3W6Pu7FIHX0yZEHvx9A6RL/OKcqLHnPXY6fyx3b5dPvg26U9NUfr5D5Q3SisD23tGjE8Bi4IaoS5DNEwu5Y9wSumuIrir395mEigMFDGVb1zz7dvKu0Ylso6La0+quZAVz1JV8ZeiXd1nLvM7D+2Tb77L55CtO3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eik.bme.hu; spf=pass smtp.mailfrom=eik.bme.hu; arc=none smtp.client-ip=152.66.115.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eik.bme.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eik.bme.hu
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id C27344E6012;
	Mon, 19 Feb 2024 12:27:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
	by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
	with ESMTP id ZCiph4DT3mu7; Mon, 19 Feb 2024 12:27:51 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id C80734E6003; Mon, 19 Feb 2024 12:27:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id C65637456B4;
	Mon, 19 Feb 2024 12:27:51 +0100 (CET)
Date: Mon, 19 Feb 2024 12:27:51 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, 
    =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
    Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org, 
    kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
    Igor Mitsyanko <i.mitsyanko@gmail.com>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Markus Armbruster <armbru@redhat.com>, 
    Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [PATCH 1/6] hw/arm: Inline sysbus_create_simple(PL110 / PL111)
In-Reply-To: <b40fd79f-4d41-4e04-90c1-6f4b2fde811d@linaro.org>
Message-ID: <00e2b898-3c5f-d19c-fddc-e657306e071f@eik.bme.hu>
References: <20240216153517.49422-1-philmd@linaro.org> <20240216153517.49422-2-philmd@linaro.org> <bcfd3f9d-04e3-79c9-c15f-c3c8d7669bdb@eik.bme.hu> <2f8ec2e2-c4c7-48c3-9c3d-3e20bc3d6b9b@linaro.org> <b40fd79f-4d41-4e04-90c1-6f4b2fde811d@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-507710864-1708342071=:44613"
X-TUID: t5NtGZXiJL8L

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-507710864-1708342071=:44613
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 19 Feb 2024, Philippe Mathieu-Daudé wrote:
> On 16/2/24 20:54, Philippe Mathieu-Daudé wrote:
>> On 16/2/24 18:14, BALATON Zoltan wrote:
>>> On Fri, 16 Feb 2024, Philippe Mathieu-Daudé wrote:
>>>> We want to set another qdev property (a link) for the pl110
>>>> and pl111 devices, we can not use sysbus_create_simple() which
>>>> only passes sysbus base address and IRQs as arguments. Inline
>>>> it so we can set the link property in the next commit.
>>>> 
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>> hw/arm/realview.c    |  5 ++++-
>>>> hw/arm/versatilepb.c |  6 +++++-
>>>> hw/arm/vexpress.c    | 10 ++++++++--
>>>> 3 files changed, 17 insertions(+), 4 deletions(-)
>>>> 
>>>> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
>>>> index 9058f5b414..77300e92e5 100644
>>>> --- a/hw/arm/realview.c
>>>> +++ b/hw/arm/realview.c
>>>> @@ -238,7 +238,10 @@ static void realview_init(MachineState *machine,
>>>>     sysbus_create_simple("pl061", 0x10014000, pic[7]);
>>>>     gpio2 = sysbus_create_simple("pl061", 0x10015000, pic[8]);
>>>> 
>>>> -    sysbus_create_simple("pl111", 0x10020000, pic[23]);
>>>> +    dev = qdev_new("pl111");
>>>> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>>> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x10020000);
>>>> +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[23]);
>>> 
>>> Not directly related to this patch but this blows up 1 line into 4 just to 
>>> allow setting a property. Maybe just to keep some simplicity we'd rather 
>>> need either a sysbus_realize_simple function that takes a sysbus device 
>>> instead of the name and does not create the device itself or some way to 
>>> pass properties to sysbus create simple (but the latter may not be easy to 
>>> do in a generic way so not sure about that). What do you think?
>> 
>> Unfortunately sysbus doesn't scale in heterogeneous setup.
>
> Regarding the HW modelling API complexity you are pointing at, we'd
> like to move from the current imperative programming paradigm to a
> declarative one, likely DSL driven. Meanwhile it is being investigated
> (as part of "Dynamic Machine"), I'm trying to get the HW APIs right

I'm aware of that activity but we're currently still using board code to 
construct machines and probably will continue to do so for a while. Also 
because likely not all current machines will be converted to new 
declarative way so having a convenient API for that is still useful.

(As for the language to describe the devices of a machine and their 
connections declaratively the device tree does just that but dts is not a 
very user friendly descrtiption language so I haven't brought that up as a 
possibility. But you may still could get some clues by looking at the 
problems it had to solve to at least get a requirements for the machine 
description language.)

> for heterogeneous emulation. Current price to pay is a verbose
> imperative QDev API, hoping we'll get later a trivial declarative one
> (like this single sysbus_create_simple call), where we shouldn't worry
> about the order of low level calls, whether to use link or not, etc.

Having a detailed low level API does not prevent a more convenient for 
current use higher level API on top so keeping that around for current 
machines would allow you to chnage the low level API without having to 
change all the board codes because you's only need to update the simple 
high level API.

Regards,
BALATON Zoltan
--3866299591-507710864-1708342071=:44613--
