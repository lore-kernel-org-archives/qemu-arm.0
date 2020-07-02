Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1282678lfm;
        Thu, 2 Jul 2020 02:02:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvX6Mo68oGWMtIvOG+3wGlq9zTnz+WsPoPOA5H8s/Y7E2HTyLneLapKva3qK52kC4X0nRZ
X-Received: by 2002:adf:eec8:: with SMTP id a8mr30958571wrp.421.1593680537867;
        Thu, 02 Jul 2020 02:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593680537; cv=none;
        d=google.com; s=arc-20160816;
        b=GP/mxYoYE/4ljV5uBOQe8RbpqNfvQ08gRwrjEHLA05/z0pSsBrZDJPTadAMqPdBKT8
         g2wIgHubCKYlhichsoXLlehBJiUXXmh8H7jxAArvIUurt6lF3iJ7Wjwvm/UupuvngqsX
         qslLGpaGlI60oCRn0zVqr2st94zWJTVYqmfSNwMmHims/E2WSVw35jGs27jPo6Cq76yM
         UJC7VN5u6JvTQUqzUxhloRJzoGIBZhudZPzD6E/87gby9aZ5tLoBZj++UNMv1E6PiBww
         WM0IDaMtmqjghvaH8E79Isqdbb9uuDgxPaqbRAqNjTS7ZpjHb0J/rAeGivJIb1oO2dTy
         pZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=nn8IbQ3J36+ArvhFcW01bSI26Cd+kcqppdXoDP8YCCM=;
        b=pQPXWAo7sH7f9rkq/PSgt7t3h5iPKlw54VPgEvdnxVFLR/Cm4VUJ7vO3cBPrVeSrFZ
         dw/QoTLR5nWyj6nAajsRriTiA+48EimZRk12jhfDOOkafYZYbYrAd0vXXuY+Dd4dE/1G
         MeAQMyEqB/auLANUR+RB7qbS/RSFd/8F/siIOFeupEevP0aLOFalPa1GQ3RKfPlGPngV
         GctZw8/HDBM7eULf6ZxyxWotl/KBvD7X2Idr3ArxkEjEjQrqpYPRFbxTr9lbier4pCIV
         AN+drqPoBie5Xlz3gpl5+mBKFv0dg7KqvIkBNFIx1YjCF+T66NGn2PMtuInN7xeP1q2C
         6bdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 188.138.100.120 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Return-Path: <agraf@csgraf.de>
Received: from zulu616.server4you.de (mail.csgraf.de. [188.138.100.120])
        by mx.google.com with ESMTP id 135si8442298wme.180.2020.07.02.02.02.17;
        Thu, 02 Jul 2020 02:02:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of agraf@csgraf.de designates 188.138.100.120 as permitted sender) client-ip=188.138.100.120;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 188.138.100.120 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Received: from 38f9d3867b82.ant.amazon.com (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
	by csgraf.de (Postfix) with ESMTPSA id 2FB6139002EF;
	Thu,  2 Jul 2020 11:02:16 +0200 (CEST)
Subject: Re: [PATCH] target/arm: Treat unknown SMC calls as NOP
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
References: <20200701200848.26746-1-agraf@csgraf.de>
 <CAFEAcA9S5v0LHMNc4fu9JGUzecbg8DsogZuCEv_aGNqVxRAcDQ@mail.gmail.com>
 <60440cb5-bd18-2928-afcf-974766222dd7@csgraf.de> <878sg2qrli.fsf@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <83381dc5-a259-e6d6-11b0-a6b96e850003@csgraf.de>
Date: Thu, 2 Jul 2020 11:02:10 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <878sg2qrli.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: CMMh0GRl0lRk


On 02.07.20 09:54, Alex Bennée wrote:
> Alexander Graf <agraf@csgraf.de> writes:
>
>> On 01.07.20 22:47, Peter Maydell wrote:
>>> On Wed, 1 Jul 2020 at 21:08, Alexander Graf <agraf@csgraf.de> wrote:
>>>> We currently treat unknown SMC calls as UNDEF. This behavior is different
>>>> from KVM, which treats them as NOP.
>>>>
>>>> Unfortunately, the UNDEF exception breaks running Windows for ARM in QEMU,
>>>> as that probes an OEM SMCCC call on boot, but does not expect to receive
>>>> an UNDEF exception as response.
>>>>
>>>> So instead, let's follow the KVM path and ignore SMC calls that we don't
>>>> handle. This fixes booting the Windows 10 for ARM preview in TCG for me.
>>>>
>>>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>>> +    if (cs->exception_index == EXCP_SMC &&
>>>> +        !arm_feature(env, ARM_FEATURE_EL3) &&
>>>> +        cpu->psci_conduit != QEMU_PSCI_CONDUIT_SMC) {
>>> This condition says: "we got an SMC, and this CPU doesn't
>>> have EL3, and we're not imitating real EL3 firmware".
>>
>> I like to think of it as "This CPU exposes an environment that looks
>> like KVM, so it implements HVC calls (EL2) and is responsible for
>> handling SMC calls as well.
> That is a very KVM centric view of the world ;-)
>
> I thought the aim was always to behave as the real processor would.


If we aim to behave like a "real processor", then why do we implement 
PSCI using HVC? A much more likely "real processor" would implement EL3, 
but no EL2 and then have PSCI as SMC calls, no?

My understanding for the rationale on why we do PSCI over HVC by default 
was to make the VM as similar between KVM and TCG as possible.


>
>> The main difference between the two semantics is that in yours, you
>> don't have EL3. In mine, there is an EL3, but it's virtualized by the
>> same layer that implements EL2.
> If you boot up with secure firmware + EL2 aware KVM kernel I assume
> everything behaves as expected?


I would assume so as well, but I don't have a working ATF setup handy. 
I'm also not worried about making it work for me - I have my local debug 
setup now :). I'm worried about a good out of the box experience for 
users who want to run Windows on ARM in TCG.


Alex
