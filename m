Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp719926ejb;
        Mon, 19 Feb 2024 06:23:49 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXwbitG5cw0Fs0SCpvn+U25WVGJrrM49GeZIX7cFVpvU22xq/D14GODFmKE38qT1EweDh9XnX5WgnciAWrmtOzoOVPfUZJZ
X-Google-Smtp-Source: AGHT+IE1lODWquE0eZXbudFZJwYZAa1gWxgDtZTzR0kXLklDsLxDAcx9LW0lDWqN4U7NzOKg1Opw
X-Received: by 2002:a25:838c:0:b0:dcc:fea7:7f7b with SMTP id t12-20020a25838c000000b00dccfea77f7bmr11551397ybk.11.1708352629431;
        Mon, 19 Feb 2024 06:23:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1708352629; cv=pass;
        d=google.com; s=arc-20160816;
        b=E5aUpgZAuxsbrRYlJneHNM3N1ruq4DYe6kbbu9m5mJ0DSmPXSFY6UcPvW3TIEDhI+m
         MxGqnetUyogzzNGblA2ox0mOGbq834MiTfffl4XfRsBPiTbYlb9SD0syJdzuQ7Exx1Nz
         4Y1ov1cooPeYYlbNSoN6ZjPElh1xZoMlyz/q8guZoIvcJwT7+TjEuB/1Z/jhYLEwH364
         NDGIaNr5vf0QymqBkUWEcLsvwdsBIabkBVMlGq5DgswX8FIXK+FL/JS1GC2x4JZdTSyF
         yP6qmdo07jZO9jUiQjvehtrqbaXKRBhyAYWbEd4iG/oIl+7v9MywtpJx39u076zR5V2R
         xizA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=mnDDTtlItDfPp9YM6wZ4fhPF4cOhRwX1C0WTfTez+m0=;
        fh=TmCIe11psca2bcL1HlEy+/x5TF4euVCCWvzBC25zSHs=;
        b=kCs9MBPCD9z44arNevG1y1ZlNugpovO4LxoYmrcB19sxVphk9J3o5dDei1qMtWoIbX
         TTwRy//UJ7RHpOD1Us6y2ArCQMYuSBtwQwzmhlJZCKYceiopRgcSB2cqMBKYwW13n9W8
         S2S6ygClEemxYud27uJdmJo9GBFiRmdg6fGyeXuQA6xjUJ9kBKL2A1yWJk0LhGHrqnaM
         XZMG2JmSGsjGr0P3OB71JmTvB9/NF/KC8zkj6DTpOFi35nyf2UZufefXbftmoL2Pooiw
         h7zK18M4fXFUTfnQukZIpREZRTfHy6Wxhto7QBHMw36C6cmu1FNFuf20oUhSqzR+YDfA
         UqkA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DFSdYjzo;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-9094-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-9094-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-9094-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id d24-20020a05620a205800b007872024671csi6412754qka.732.2024.02.19.06.23.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 06:23:49 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-9094-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DFSdYjzo;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-9094-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-9094-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 105021C21944
	for <alex.bennee@linaro.org>; Mon, 19 Feb 2024 14:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5474137162;
	Mon, 19 Feb 2024 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DFSdYjzo"
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A4C374F5
	for <kvm@vger.kernel.org>; Mon, 19 Feb 2024 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708352625; cv=none; b=hcSYhaUgr+5N1GlLtepl4XpjIK0YqiDWrwFoEALIhN43yt9Bu/AGLtdhvbM8KnbXDhS2FHzVwXhXV2wCk4TJ5OGtAlddxnoVKendtKjDIhCtNktLd8ndhe0gfsGidmc0BicGMkdRcxjZFNT1Ri8HQGZTeuKGCc5t/PV2ViAkFyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708352625; c=relaxed/simple;
	bh=SUhfK829Y+oM/GBiH7Fk1PS+v5a1KyCKm1UKtSI5pKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MqFtnLQBOwanelbatHl7zXJQhcdBnNG6shvboijWCgFTIAWVG4MovuVDmhHZJnriYPy16BXYHf24Om/qNCUmLJD45K+jOtTavA8IsB0LPn2gQjA+BKcpB0g1p54+GpiEKccj5XZBwWrkiyEdepAhwZ1GCdNXWIZT19XNrXUC8pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DFSdYjzo; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d0b4ea773eso55599671fa.0
        for <kvm@vger.kernel.org>; Mon, 19 Feb 2024 06:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708352620; x=1708957420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mnDDTtlItDfPp9YM6wZ4fhPF4cOhRwX1C0WTfTez+m0=;
        b=DFSdYjzoTfA6zN24F6U9VMA0AA+qdJ+hsjZHvM06egPsPYoNYws0hIwOWtnPncPeH9
         GH8YO2hhwb9S43JqytRpRZ3sQ2CjO7qA1KVcaa5o13qwZgrd2L/vx4b3daekZR8sVNoq
         Z3QG2pE0IrPqR5bViwrkLZrJ/fFeWdPOPm39ytAYBOZPdHm0MN8w6MWj2bIvf1yAcIm+
         qg7MyAVW6GNRcq336depN8En5G12iVgYd/PumPJHtPyMPZlqbaBR4pVhh2hELRz12ka6
         NNbWwca4/WUjFD3T/aMqn0fJ6ygv1kNNxVU6jIa45OLgJ0hctfHtR38S1Ww5I7aKmmbC
         kCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708352620; x=1708957420;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mnDDTtlItDfPp9YM6wZ4fhPF4cOhRwX1C0WTfTez+m0=;
        b=OlJ3xFvtP0uV4umOQt1gKuICyJEw24lZZmae0qp22+zJ+4sUb1Zlrf3ewjRqrtiSqA
         KHUITq3fs43OTkliJtZalA86ySU5JnSsNbOJGnTUKA/db57ggyAZ0BAZAN5p+bqUbW+H
         x2PTpU4PP4xS85CxGrqoPFZ0UA1vW1BlulzaMd+H8uHhtCD3oj1WLAnCXpADT0LusfUx
         q8p4YQtljV8P1kdzvNGhxbh7nOkTQhyV08xWumr5A9QLSxH1gNK+1Soq3/DP24fZSdO+
         O5wX9YzlVGI9NDrM51cwNRT0pyE+p491APxe/1CjOFxAM3xfNUVAdag4nvhaQtIG0esp
         Im+w==
X-Forwarded-Encrypted: i=1; AJvYcCWJLDMb5XyDGJ0xmMBD2AoTczRh9Tp2XJU9aNBYMWOrsLbs+pm0X5SD8GKp5/fQ4phJaBLFVLrwQxbg0u00TdU82iN3
X-Gm-Message-State: AOJu0YyUkTD3b5Z2qx5tK6wFOURDOAWlmMnJOS6UA8AG9jOA1CVlCPkj
	07zZk8CQkx9zNYdTdlRyTGIVNGS4mRpEmuh6e9SgRsR4WpcHLknfFGkRPIs4B00=
X-Received: by 2002:a2e:8546:0:b0:2d2:4474:2e69 with SMTP id u6-20020a2e8546000000b002d244742e69mr100766ljj.9.1708352620437;
        Mon, 19 Feb 2024 06:23:40 -0800 (PST)
Received: from [192.168.69.100] ([176.176.181.220])
        by smtp.gmail.com with ESMTPSA id s6-20020a05600c45c600b00412696bd7d9sm1590167wmo.41.2024.02.19.06.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 06:23:39 -0800 (PST)
Message-ID: <ff91fafa-1f6d-442f-adf5-f7a6e108cea7@linaro.org>
Date: Mon, 19 Feb 2024 15:23:37 +0100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] hw/arm: Inline sysbus_create_simple(PL110 / PL111)
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20240216153517.49422-1-philmd@linaro.org>
 <20240216153517.49422-2-philmd@linaro.org>
 <bcfd3f9d-04e3-79c9-c15f-c3c8d7669bdb@eik.bme.hu>
 <2f8ec2e2-c4c7-48c3-9c3d-3e20bc3d6b9b@linaro.org>
 <b40fd79f-4d41-4e04-90c1-6f4b2fde811d@linaro.org>
 <00e2b898-3c5f-d19c-fddc-e657306e071f@eik.bme.hu>
 <2b9ea923-c4f9-4ee4-8ed2-ba9f62c15579@linaro.org>
 <6b5758d6-f464-2461-f9dd-71d2e15b610a@eik.bme.hu>
 <bc5929e4-1782-4719-8231-fe04a9719c40@ilande.co.uk>
 <CAFEAcA-Mvd4NVY2yDgNEdjZ_YPrN93PDZRyfCi7JyCjmPs4gAQ@mail.gmail.com>
 <0a31f410-415d-474b-bcea-9cb18f41aeb2@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <0a31f410-415d-474b-bcea-9cb18f41aeb2@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: SlAkr6gGhlW3

On 19/2/24 14:33, Mark Cave-Ayland wrote:
> On 19/02/2024 13:05, Peter Maydell wrote:
> 
>> On Mon, 19 Feb 2024 at 12:49, Mark Cave-Ayland
>> <mark.cave-ayland@ilande.co.uk> wrote:
>>>
>>> On 19/02/2024 12:00, BALATON Zoltan wrote:
>>>> For new people trying to contribute to QEMU QDev is overwhelming so 
>>>> having some way
>>>> to need less of it to do simple things would help them to get started.
>>>
>>> It depends what how you define "simple": for QEMU developers most 
>>> people search for
>>> similar examples in the codebase and copy/paste them. I'd much rather 
>>> have a slightly
>>> longer, but consistent API for setting properties rather than coming 
>>> up with many
>>> special case wrappers that need to be maintained just to keep the 
>>> line count down for
>>> "simplicity".
>>>
>>> I think that Phil's approach here is the best one for now, 
>>> particularly given that it
>>> allows us to take another step towards heterogeneous machines. As the 
>>> work in this
>>> area matures it might be that we can consider other approaches, but 
>>> that's not a
>>> decision that can be made right now and so shouldn't be a reason to 
>>> block this change.
>>
>> Mmm. It's unfortunate that we're working with C, so we're a bit limited
>> in what tools we have to try to make a better and lower-boilerplate
>> interface for the "create, configure, realize and wire up devices" task.
>> (I think you could do much better in a higher level language...)
>> sysbus_create_simple() was handy at the time, but it doesn't work so
>> well for more complicated SoC-based boards. It's noticeable that
>> if you look at the code that uses it, it's almost entirely the older
>> and less maintained board models, especially those which don't actually
>> model an SoC and just have the board code create all the devices.
> 
> Yeah I was thinking that you'd use the DSL (e.g. YAML templates or 
> similar) to provide some of the boilerplating around common actions, 
> rather than the C API itself. Even better, once everything has been 
> moved to use a DSL then the C API shouldn't really matter so much as it 
> is no longer directly exposed to the user.

Something similar was discussed with Markus and Manos. Although the
first step we noticed is to unify the QDev API -- making it verbose --
to figure what we need to expose in the DSL. Doing it the other way
(starting a DSL and trying to adapt it to all QEMU models) seemed a
waste of time. At least for our current human resources.
