Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5816509lfk;
        Mon, 15 Nov 2021 04:54:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4pA0+uOd/gIMjec8H9+TQUcbUaCUCE1Umge6rH4k6xnPH0D0xkQAXpvkKB8ubCoHghlpN
X-Received: by 2002:a05:6000:1681:: with SMTP id y1mr46682222wrd.52.1636980854817;
        Mon, 15 Nov 2021 04:54:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636980854; cv=none;
        d=google.com; s=arc-20160816;
        b=xGMRaLeA40vDAwPLwNLv4KSA8s+G6HrSav4foMVECLyRuEGMw78TfmS/YrnGvMM9st
         3jWY2DSMVT9qQ6+/ZrLKGOxq3GjfucVUhFwYXY3ekCIUu5GWDfv9jOIZkYmT1pfNqp0m
         vEv2szxvwQ+YLDMR1uNZ6mMDza5rim3aPc3clavnuPSG2la4SynhUBBlkFJ9bhJB5aGO
         r6HMmolon81ZIMjjIn3i4Iz0qWJCzKxODkDk7U1l+RcsFkxxfudevwiWWAGxS+1dmtVz
         H5Nbm3weXi50Q/0F+7eOFzKvGoXnp+y2iIU5rw31LTv94Czlwlt/3Fls2tOaZFcUyb1H
         8D1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=HlW+W/eT4FUOKGGujlg+Q72ShzXFQaMl5XZWSviigFo=;
        b=fDNg8GLkep0h5lAF0rcWfiEmh4wT6vR4uimIkem9Rxre6FzWT8ncEQsD1ZD/hAu6mR
         8rIkN84oNDPP28ToLhAaFHhxZ+g7DuDeWZjuP6nYg4DjG63wYvN60yS/2i1xN4XLBMxX
         GiqJ+xhOojBUoq4eif0/2w/dwwrNfCyibRRq9QIGPOeOJwYRe5TCB1gKlv9DBlZU/j5t
         0w+U0wS/IqyZ70wgHnyWHne0yr7tu+3qCfkAvZIRtDQ9q4WoyBQ6LS2RQtn0M1ykkkJ/
         94NjIFLQFxWlrigboPxL+isiwQr1BCc5iwtAudFzxP+Sge43+tNtMjoEvLmacrinLA1d
         7DSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Return-Path: <agraf@csgraf.de>
Received: from zulu616.server4you.de (mail.csgraf.de. [85.25.223.15])
        by mx.google.com with ESMTP id z125si33754063wmc.231.2021.11.15.04.54.14;
        Mon, 15 Nov 2021 04:54:14 -0800 (PST)
Received-SPF: pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) client-ip=85.25.223.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Received: from [10.95.147.162] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
	by csgraf.de (Postfix) with ESMTPSA id 7749A6080381;
	Mon, 15 Nov 2021 13:54:13 +0100 (CET)
Message-ID: <2acb8b24-d0aa-d9c7-0af9-5814819c875b@csgraf.de>
Date: Mon, 15 Nov 2021 13:54:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH] arm: Don't remove EL3 exposure for SMC conduit
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Andrei Warkentin <andrey.warkentin@gmail.com>
References: <CAFEAcA8vRNC8RTAAxgYzZsGdqGfzDSr3m0UXmeZoF115z=6N3Q@mail.gmail.com>
 <8639608F-1685-48B8-B965-255D30B213F8@csgraf.de>
 <CAFEAcA_SzCtyDJfnJLLT57Xuf-TdJHRLEW00E7tQkdresxokMg@mail.gmail.com>
 <67c00a6a-e50a-3ea6-ef1d-98494fdbd729@csgraf.de> <875ysty5yo.fsf@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <875ysty5yo.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Th0qdsZaCSu3


On 15.11.21 13:08, Alex Bennée wrote:
> Alexander Graf <agraf@csgraf.de> writes:
>
>> On 15.11.21 11:46, Peter Maydell wrote:
>>> On Sun, 14 Nov 2021 at 17:41, Alexander Graf <agraf@csgraf.de> wrote:
>>>>
>>>>> Am 14.11.2021 um 18:20 schrieb Peter Maydell <peter.maydell@linaro.org>:
>>>>> This is tricky, because we use the cpu->isar values to determine whether
>>>>> we should be emulating things. So this change means we now create an
>>>>> inconsistent CPU which in some ways claims to have EL3 (the ISAR ID
>>>>> bits say so) and in some ways does not (the ARM_FEATURE_EL3 flag is
>>>>> unset), and depending on which of the two "do we have EL3?" methods
>>>>> any bit of the TCG code is using will give different results...
>>>> Do you think it would be sufficient to go through all readers of
>>>> the isar bits and guard them behind an ARM_FEATURE_EL3 check in
>>>> addition? I'll be happy to do so then! :)
>>> That would be a big reverse-course on a design choice we made that
>>> the preference is to look at the ID registers and phase out the
>>> use of ARM_FEATURE bits where possible.
>>
>> I'm open to alternatives. As it stands, we're lying to the guest
>> because we tell it "SMC is not available" but ask it to call SMC for
>> PSCI, which is bad too.
> Is testing the ISAR bits actually telling a guest that SMC exists or
> just the CPU is capable of handling it? I guess -kernel only is a weird


The way I understand it, it tells you whether SMC is a #UD or not. 
Whether that SMC call goes into happy PSCI land or into nirvana is a 
different question - but there's nothing you can do from EL<3 to figure 
that out I believe?


> case because otherwise if EL3 is available some sort of firmware has to
> have gotten the CPU into a state a kernel can boot. It doesn't imply
> that firmware knows how to do a PSCI call though - surely there is some
> firmware configuration/probing mechanism you need to rely on for that?


Oh, absolutely! As an OS, you should look up in ACPI or DT whether to do 
an SMC call for PSCI operations or not.

The problem here is that we tell the OS in ACPI to do an SMC call, yet 
we tell it in AA64PFR0 that SMC is not implemented and thus would 
trigger a #UD.


Alex
