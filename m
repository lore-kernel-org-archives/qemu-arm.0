Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2276428ejf;
        Mon, 26 Feb 2024 12:04:28 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXpKkzHa9h72kx2NY0sWkIU1c4p6d4P6dsBM7ewC5S3nrUAFmQ6hMLzcH37XP6uXhvpWCIyiDRjWHVi+ZTDVTQ47lbFRZfS
X-Google-Smtp-Source: AGHT+IE9swEcdyFCM1cFKrrNXcVjFlUKeL5aqooBAvWSofncrDS7aWBpXhVK5y0v92VQnBgmPD3H
X-Received: by 2002:a17:90a:4701:b0:29a:24c6:5cd2 with SMTP id h1-20020a17090a470100b0029a24c65cd2mr5191425pjg.32.1708977868169;
        Mon, 26 Feb 2024 12:04:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1708977868; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z8EPyRtlUXVmY39NiC6J93BjJiJY6doBFszbRIzw8Vo1Nf2xLl/vhOFPyqg5muarFO
         nYKJ0FunqXgxLhYH8fLJGNru4c0wJJ/XVGZEXgRltOq5mZP08DSouL4lUsJcLq0AhRQV
         9Wm8J6rF+DVvbL6cqSNsnTWDhdFcF1/DdrfaFs7JzPL2SGzJ8HXqr+x2Z5//VZ8LU/xf
         q1Cd2kPcm37UJmY3+8+x/eGRnsKAbtGRaJrjfzqB3rtSN3WWWsVbTX3ni+u7I13XNkqN
         Ba6aUKNxa8FVwWvB9bjwuSNUII7d4Tn0PFygNrTyohZDsop4V5dT86gkiPWg6DENwqTh
         gk9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:in-reply-to:subject:cc:to:from:date;
        bh=HcZ/sBGt9reI1wFgvb+ibADOGF13fPja/plyjotp8lU=;
        fh=UFW275cRVxdo2aD32lpuv/hTe/R8c3sBlY+UXq+JJ+A=;
        b=Wny06xHqGxkcCG5ODkwxy+yB2lOOd0VcwaO4UmczAsdPcyt2QZNHeeQz2d4z2CeAG0
         /NrrzLSU8yn9WfJkYdZjXD536elm13e6NpE4WC0Vs3VQh3H7cT6MuOa6dl2OKA5HCczH
         HMzfsiXMdFRVVgFEei0zFf4NTUubAU7IIAMhey3yqNmvVHOJcBsNKBAj8tWAo1bDdFEY
         wMmm5IrTyQ1Qc88HitxuBVk/1IzGWNxrGF1mEtZQMqtrBDREsu5lcUGWZhyD+6l+5/z0
         LYN1mIazZFfpkyPSURwNhX71Xb5YPcesF4bGyAPtCeBAg1Uu9XrVNZFEP4sFiuY3xJ/r
         vuEA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=eik.bme.hu dmarc=pass fromdomain=eik.bme.hu);
       spf=pass (google.com: domain of kvm+bounces-9995-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-9995-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <kvm+bounces-9995-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id oe7-20020a17090b394700b0029adca9a9c8si408278pjb.108.2024.02.26.12.04.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 12:04:28 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-9995-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=eik.bme.hu dmarc=pass fromdomain=eik.bme.hu);
       spf=pass (google.com: domain of kvm+bounces-9995-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-9995-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9EF8B23B99
	for <alex.bennee@linaro.org>; Mon, 26 Feb 2024 20:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB18F1292FF;
	Mon, 26 Feb 2024 20:04:20 +0000 (UTC)
Received: from zero.eik.bme.hu (zero.eik.bme.hu [152.66.115.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0643130ADB
	for <kvm@vger.kernel.org>; Mon, 26 Feb 2024 20:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.66.115.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708977860; cv=none; b=D19BlkIqfCADgxGll9H83MVdIWC66AeRnD0iFkK7bfzn0Rp9NOmAtf8R59YrAArnp8sO/wHo+35w+Io7mG+4EXxM8iHOwoYa0yfyY6sBtA3xRmra27Ehb61xhsxyAhc2B+au0YERBko1B5F33iCikwkkbegdTg8CQk/8L0OypcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708977860; c=relaxed/simple;
	bh=OM5yEvjLqCASQyyyq6ESNY+qU3ZtdETPEs2un++CTiU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UWzUJseLvVQpT4QNcpXTPopI0elfCqs491dii3Zt5KrTfh6QObz5PtwoER3ptZdgXeUmUMAoZwcDhMCi39X6ErYiqfZn0xISTOlftmBaQojaRDU+bb8YBxUzQuDpsgWQDfoprnhPsOlllsS/5+yLxSOkb7uVrh561vxb+zq1dQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eik.bme.hu; spf=pass smtp.mailfrom=eik.bme.hu; arc=none smtp.client-ip=152.66.115.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eik.bme.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eik.bme.hu
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 9BD1F4E601E;
	Mon, 26 Feb 2024 21:04:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
	by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
	with ESMTP id wLBUWJt-thNp; Mon, 26 Feb 2024 21:04:06 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 9F81E4E6005; Mon, 26 Feb 2024 21:04:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 9D6CA7456B4;
	Mon, 26 Feb 2024 21:04:06 +0100 (CET)
Date: Mon, 26 Feb 2024 21:04:06 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
    Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
    =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
    Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org, 
    kvm@vger.kernel.org, Igor Mitsyanko <i.mitsyanko@gmail.com>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Markus Armbruster <armbru@redhat.com>, 
    Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [PATCH 1/6] hw/arm: Inline sysbus_create_simple(PL110 / PL111)
In-Reply-To: <c5d5f835-5b7f-46bb-8393-6d638cbad012@linaro.org>
Message-ID: <14dc34ed-be4a-e3d1-dfae-95d141519d3f@eik.bme.hu>
References: <20240216153517.49422-1-philmd@linaro.org> <20240216153517.49422-2-philmd@linaro.org> <bcfd3f9d-04e3-79c9-c15f-c3c8d7669bdb@eik.bme.hu> <2f8ec2e2-c4c7-48c3-9c3d-3e20bc3d6b9b@linaro.org> <b40fd79f-4d41-4e04-90c1-6f4b2fde811d@linaro.org>
 <00e2b898-3c5f-d19c-fddc-e657306e071f@eik.bme.hu> <2b9ea923-c4f9-4ee4-8ed2-ba9f62c15579@linaro.org> <6b5758d6-f464-2461-f9dd-71d2e15b610a@eik.bme.hu> <bc5929e4-1782-4719-8231-fe04a9719c40@ilande.co.uk> <CAFEAcA-Mvd4NVY2yDgNEdjZ_YPrN93PDZRyfCi7JyCjmPs4gAQ@mail.gmail.com>
 <0a31f410-415d-474b-bcea-9cb18f41aeb2@ilande.co.uk> <9ef2075b-b26b-41d2-a7d0-456cec3b104a@eik.bme.hu> <c5d5f835-5b7f-46bb-8393-6d638cbad012@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-2026228376-1708977846=:54539"
X-TUID: SrbTOBI3Yo40

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2026228376-1708977846=:54539
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 26 Feb 2024, Philippe Mathieu-Daudé wrote:
> On 19/2/24 15:05, BALATON Zoltan wrote:
>> On Mon, 19 Feb 2024, Mark Cave-Ayland wrote:
>>> On 19/02/2024 13:05, Peter Maydell wrote:
>>>> On Mon, 19 Feb 2024 at 12:49, Mark Cave-Ayland
>>>> <mark.cave-ayland@ilande.co.uk> wrote:
>>>>> 
>>>>> On 19/02/2024 12:00, BALATON Zoltan wrote:
>>>>>> For new people trying to contribute to QEMU QDev is overwhelming so 
>>>>>> having some way
>>>>>> to need less of it to do simple things would help them to get started.
>>>>> 
>>>>> It depends what how you define "simple": for QEMU developers most people 
>>>>> search for
>>>>> similar examples in the codebase and copy/paste them. I'd much rather 
>>>>> have a slightly
>>>>> longer, but consistent API for setting properties rather than coming up 
>>>>> with many
>>>>> special case wrappers that need to be maintained just to keep the line 
>>>>> count down for
>>>>> "simplicity".
>>>>> 
>>>>> I think that Phil's approach here is the best one for now, particularly 
>>>>> given that it
>>>>> allows us to take another step towards heterogeneous machines. As the 
>>>>> work in this
>>>>> area matures it might be that we can consider other approaches, but 
>>>>> that's not a
>>>>> decision that can be made right now and so shouldn't be a reason to 
>>>>> block this change.
>>>> 
>>>> Mmm. It's unfortunate that we're working with C, so we're a bit limited
>>>> in what tools we have to try to make a better and lower-boilerplate
>>>> interface for the "create, configure, realize and wire up devices" task.
>>>> (I think you could do much better in a higher level language...)
>>>> sysbus_create_simple() was handy at the time, but it doesn't work so
>>>> well for more complicated SoC-based boards. It's noticeable that
>>>> if you look at the code that uses it, it's almost entirely the older
>>>> and less maintained board models, especially those which don't actually
>>>> model an SoC and just have the board code create all the devices.
>>> 
>>> Yeah I was thinking that you'd use the DSL (e.g. YAML templates or 
>>> similar) to provide some of the boilerplating around common actions, 
>>> rather than the C API itself. Even better, once everything has been moved 
>>> to use a DSL then the C API shouldn't really matter so much as it is no 
>>> longer directly exposed to the user.
>> 
>> That may be a few more releases away (although Philippe is doing an 
>> excellent job with doing this all alone and as efficient as he is it might 
>> be reached sooner). So I think board code will stay for a while therefore 
>> if something can be done to keep it simple with not much work then maybe 
>> that's worth considering. That's why I did not propose to keep 
>> sysbus_create_simple and add properties to it because that might need 
>> something like a properties array with values that's hard to describe in C 
>> so it would be a bit more involved to implement and defining such arrays 
>> would only make it a litle less cluttered. So just keeping the parts that 
>> work for simple devices in sysbus_realize_simple and also keep 
>> sysbus_create_simple where it's already used is probably enough now rather 
>> than converting those to low level calls everywhere now.
>> 
>> Then we'll see how well the declarative machines will turn out and then if 
>> we no longer need to write board code these wrappers could go away then but 
>> for now it may be too early when we still have a lot of board code to 
>> maintain.
>
> I'll keep forward with this patch inlining sysbus_create_simple();
> if we notice in few releases the DSL experiment is a failure, I don't
> mind going back reverting it.

I'm OK with that. Just thought that keeping a sysbus_realize_simple 
function that's the same as sysbus_create simple minus creating the device 
would not be a big change and cause less churn. But if you plan te remove 
this completely in near future so another API would be needed anyway then 
maybe not worth keeping it. Having only low level functions to create and 
wire devices seems impractical for writing boeards in C so eventually some 
replacement will be needed. I doubt every board can be quickly converted 
to a new declarative way soon but you can prove me wrong. If this helps 
you to progress to that direction then I'm not attached to it to much but 
would like to keep some simplicity in board code wherever possible as it's 
already quite complex to do simple things with low level APIs so I'd 
prefer if convenience APIs don't go away.

Regards,
BALATON Zoltan
--3866299591-2026228376-1708977846=:54539--
