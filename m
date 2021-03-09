Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2620366lfg;
        Tue, 9 Mar 2021 01:43:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPOja8zNJcH/ZR0fS0jyk1aICANPC6dGpWG4QsUHhTlhyDZXFgB714o5kQZRSdwTA658Ux
X-Received: by 2002:a17:906:f0d0:: with SMTP id dk16mr19520703ejb.48.1615283031855;
        Tue, 09 Mar 2021 01:43:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615283031; cv=none;
        d=google.com; s=arc-20160816;
        b=VhsnrQQtbrkGcV+RBVHzJwBCC88cVRbdh+uDc/YHR0DEZEwh94HRYmoIRzHZWep+gu
         xZ+53OZqKaNDvp6A7JPwaKwq2fZdQrAQsSRnbJKwKIMHSs9JH9tuyOVWBP7yHiRUnw8r
         ErnFpJmmym4tDzptDdaJDq9gQXXWUtLGd+wbgrmJOl8Le/EPh/C0KkTb6JUlnjuSadJ4
         BNZW7PVKGs+xzrlmgk6gVAucZIUIOC7Hfof1cc53IghmKVQagCgrRDv57WTkBaq5AWGX
         9JjzuQrJFoO+soLygM2NTjnfo64eJBsafSzFtLpZFOXjXb1WpkGjt7eweTmDUMw/wJfx
         gsZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=FNEf+GtEbXYXeLBBojgwoYyBlmOqbIHHX0ChTeVYfLI=;
        b=d8ur6OarkiPEP4FcIomPPN2DxpwZf+OTkJRqr1C+G6q1tepN2/cvRm9gKpdWn/MzXn
         1QfmCqVJ1eqxNvurLUCvmw188YnE7yIQzDxzQpLoRrYuTWnbXO5vZ2nMCc++XvFNBskX
         jbuXDwO4hSlbHK69WYmMCxitfgYJ6su0nSah4raBudhfhhx/axUdAJZw+WEXuPS+moDa
         PHRBut7+VgNRYqQl3Xm4untNf/tmE53IIBv1g+YOnN3B+QmKRsQn/ZHJMVXt74uSsvUP
         d5uXCSMQfH5trMoRHJdugwU+GwW14HTXculonYA8oNysUVMB1hLX1KjQlzKQhwlIi9Ff
         SRQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mzz9Tcxx;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id a20si4420369ejf.345.2021.03.09.01.43.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Mar 2021 01:43:51 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mzz9Tcxx;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615283030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNEf+GtEbXYXeLBBojgwoYyBlmOqbIHHX0ChTeVYfLI=;
	b=Mzz9TcxxwnibQyhiJcKrOMazV7KLRv9s7X6GxRp2To++eKl7p8d5GAh4DyCj/U/3xOyPyT
	+GiEYzS3T0uzdhachM8jWO0vkOq7MGu5RLuE1ps44fffdVas578iuB/qc1V6uoK7bHnGd3
	C3cXKStwiStTvwkzt2LLuDfbHDtfJzg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-QQzuaGWNMmi2LX-h7Y3rmw-1; Tue, 09 Mar 2021 04:43:47 -0500
X-MC-Unique: QQzuaGWNMmi2LX-h7Y3rmw-1
Received: by mail-wm1-f71.google.com with SMTP id a63so230329wmd.8
        for <alex.bennee@linaro.org>; Tue, 09 Mar 2021 01:43:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FNEf+GtEbXYXeLBBojgwoYyBlmOqbIHHX0ChTeVYfLI=;
        b=MXmP9cV8ZSBoZOczr/ogKXBaU4WzkGaAfFfWENp/B7bAK+HolsQ8q1bZ3FSQZpA5oa
         yhkJR19oOCleJoS1uynSd3qQoWPrTmsyGfNKEt8QdBbTBhWSRX1KKp2gYLCdEPCNURoW
         J/kigH2hVwAWmBrhETA9L5BCrncDfYpaVyFdDHR/NVPjX+soXcUgdvQlTkM0BRyLyDn9
         HV6jB7bjjjZUaf7w2TEXxTMza0XijLsdqOqskjR3E/ha0UE50i2MpLxZ/65Wz28lByp0
         d7zkmhEMhmua/G7BPxb8KvjoMTV9xsbUeIqEJZ2zOs2pRuyNE9ISVev8NlluG1elP/Ik
         0XxQ==
X-Gm-Message-State: AOAM530dsSCsO0jcfx48xm33iwgk7Pwre1ZJmO1k5yI0lXbEuSJSFMGR
	BvRd/37Re0Sk/bbG2F3gO9q9wiRPStOZA9myMm2vA6F2y1EwpZs8VtNGRBjOMjK/4VY4+HdjWDK
	KReDPaB9p5JbJF0gh
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr3044811wmc.168.1615283025985;
        Tue, 09 Mar 2021 01:43:45 -0800 (PST)
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr3044795wmc.168.1615283025781;
        Tue, 09 Mar 2021 01:43:45 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id 18sm3231744wmj.21.2021.03.09.01.43.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 01:43:45 -0800 (PST)
Subject: Re: [PATCH v2 0/2] tests/acceptance: Test Aspeed ARM machines
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20210304123951.163411-1-joel@jms.id.au>
 <CAFEAcA9jux7H2cAwgrndvUv5=fivgQwbWDUEbU7rv7xUb=rz4A@mail.gmail.com>
 <345ad50c-ac43-2337-29e4-b7f060896434@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ce0fdfce-409f-4e20-7b11-180673a39473@redhat.com>
Date: Tue, 9 Mar 2021 10:43:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <345ad50c-ac43-2337-29e4-b7f060896434@kaod.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: +NoElqdzxd/b

+Alex

On 3/5/21 4:38 PM, Cédric Le Goater wrote:
> On 3/5/21 4:12 PM, Peter Maydell wrote:
>> On Thu, 4 Mar 2021 at 12:40, Joel Stanley <joel@jms.id.au> wrote:
>>>
>>> v2: Fix ast2600 test, thanks Cédric for the review.
>>>
>>> This adds tests for the Aspeed ARM SoCs. The AST2400 and AST2500 tests
>>> use OpenBMC images from that project, fetched from github releases. The
>>> AST2600 test uses a Debian arm32 kernel.
>>
>> Just a note that I'm assuming that Cédric will gather up the
>> various aspeed related patches that have been on the list recently
>> and send a pullreq for them. (Having been on holiday my to-review
>> queue is pretty full so I've just ignored anything aspeed-related;
>> let me know if there is anything you specifically want me to look
>> at, queue, whatever.)
>>
>> PS: softfreeze is 16 March so a pullreq on list sometime next week
>> would probably be the ideal.
> 
> Yes. I am preparing the PR. 
> 
>   aspeed: Integrate HACE
>   hw: Model ASPEED's Hash and Crypto Engine
>   hw/misc: Model KCS devices in the Aspeed LPC controller
>   hw/misc: Add a basic Aspeed LPC controller model
>   hw/arm: ast2600: Correct the iBT interrupt ID
>   hw/arm: ast2600: Set AST2600_MAX_IRQ to value from datasheet
>   hw/arm: ast2600: Force a multiple of 32 of IRQs for the GIC
>   hw/arm/aspeed: Fix location of firmware images in documentation
>   aspeed: Emulate the AST2600A3
>   tests/acceptance: Test ast2600 machine
>   tests/acceptance: Test ast2400 and ast2500 machines
>   arm/ast2600: Fix SMP booting with -kernel
> 
> The HACE patchset needs a second look from an Aspeed-aware person and 
> I have some questions on AST2600A3.
> 
> Merging these acceptance tests would be really nice. Have we addressed
> all you concerns Philippe regarding the image downloads ?

No, but I'll defer to Alex here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg787742.html

> 
> Thanks,
> 
> C.
> 
