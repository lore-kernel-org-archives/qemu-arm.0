Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5727931lfg;
        Wed, 3 Mar 2021 14:24:47 -0800 (PST)
X-Received: by 2002:a65:480c:: with SMTP id h12mr953750pgs.169.1614810287681;
        Wed, 03 Mar 2021 14:24:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614810287; cv=none;
        d=google.com; s=arc-20160816;
        b=Jj930+s04jF9XYbAibS7EwHpGEDqHHOVbrS7DMa6NOGbOL0B/i7kRxAxKQxGyWtlln
         yDcBPGycsqK04x7JOJLBKonHcNKKyO5PrfPnsl/iPiDaSrQ8zC2ZWKnMEUrh1MKfXX0R
         lyPIrqV6Z64Eme+IgwIecdXE3jgeecSBEYvSQFQVeFtuIudOsFzzE2PGUpTiHw/kIqk/
         EcadATPyVOW7aagt04BK3qlagTzSbwtVGsGT4QaTcZflNphpc4jTffh7r+UZeU7enjkZ
         BdyUT8OEfiJkA2oe4kiYgqR2MhYXi4qAg59Gbyd2O/dpUIXHxbQbDZAp9VE0jHQzOI1S
         cLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=I6X6JX+zoLYqkMO4mIBzK9KHuuUucguX2pj4i17mdYQ=;
        b=pWfnaReMiszZIUELblnxTkJWF5T4CjP1zOLyeUCBEHxpHlbPfDPivkjqtjQIabBRrg
         IAVgHbng80IwWP2j+bfEuW8FfzGKzwtZVuwvSLq5LeAffVNNAnV5hXar22ahDRdpqOD1
         wyeyQdYMoOBDrGaHcZi5T3rSES0pC8xvK09DFpta7/X7EDdahXeKwFnM8wXvEwg1Z4OV
         KHM7OPNig4illPEf3RIymTut3x6bMTr+oNYub+jsIp3QotqBk8KtChQs7ZN6J0BRUzCR
         MYh9Oc5pv04tPKXmqxMwT/aVntYiP6Z+QmenWpurqMPCiRoIlCGqLNIc143/lcqRx2G2
         XrkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RBeqpBiO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g6sor12181584pfo.0.2021.03.03.14.24.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Mar 2021 14:24:47 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RBeqpBiO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I6X6JX+zoLYqkMO4mIBzK9KHuuUucguX2pj4i17mdYQ=;
        b=RBeqpBiOI4Fxtfv7hAy7WOg4ev07LksEeXuxGVGHfFsVfvtVFH63KDfmpB217n4I2k
         VXLGwALXK93JfjvdOk3e6klsiPsNjjw+6oINc8HzMIKS6K+HtCN1or4vXfBZphRa/3Fr
         o1cGRih3Vc/b1SPMXujleRUAGDMnUGruGRP05PriQx7YTX/LFN98P9fmu/OFxLYM+L5r
         UMM2gxCOgDhx6eCn7q9ZYTnwS8g9R3u64cP4dHTP9SpGlIunAXrrLKOfYZue80VWft9S
         uVdmDIMexPnRjnFwCvY2oXXiae2qYGDdiD2V81hv/SDTI59zaJcnW0j53AwUo8MKD0i0
         eEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I6X6JX+zoLYqkMO4mIBzK9KHuuUucguX2pj4i17mdYQ=;
        b=mxgzMjb/l3lcR2QGrcrytVqpTzueh1OnESY+pJHfO/cJ26fV0H0CJM1H2ikSvi3xgB
         O7ExMqR1RCRem1Xs+qrgtFYLwrAZetJWLm0sh4pRJJPpVhOhIAPHMbKNWf9Tf7z8UG9D
         DZoLO1GSHBZ3hgmQf8ravEM/AzyibwHut0y37S65ZNEVFstK9kYDdCK/MO9BVRW8E97N
         mtl8dpsJBisBE7xbkYgpkBQimNuyCgnLAkV1ScQFBGJE0TuiDvwD+80lTHJQkDLbE4Oz
         WcjPP8XmX4fJHrXEdAdLP6xKUXinysXie/5P45bsONs0xzsVgYK0CBtzwwfo4FYGDEN6
         z2fg==
X-Gm-Message-State: AOAM532RLwEIpwSbM0A1e77Ufg8iaM5X1855UbZQu3TxNYcp7g1NWPHg
	Ie4ol8YkaEQXvbeLdvIWgTgZb6zq
X-Google-Smtp-Source: ABdhPJw0wkkqf0aIoW8TgkVxQ4EOSd/TgJP1G21fo3WDe1/E3ReuWDy5G4gPHVn0lNu4sTCu/aO1LA==
X-Received: by 2002:aa7:8e51:0:b029:1ed:2928:18ff with SMTP id d17-20020aa78e510000b02901ed292818ffmr888648pfr.76.1614810287142;
        Wed, 03 Mar 2021 14:24:47 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
        by smtp.gmail.com with ESMTPSA id b3sm7358587pjh.22.2021.03.03.14.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Mar 2021 14:24:46 -0800 (PST)
Subject: Re: [PATCH v4 03/28] cpu: Introduce cpu_virtio_is_big_endian()
From: Richard Henderson <richard.henderson@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20210303214708.1727801-1-f4bug@amsat.org>
 <20210303214708.1727801-4-f4bug@amsat.org>
 <20210303170743-mutt-send-email-mst@kernel.org>
 <20210303171059-mutt-send-email-mst@kernel.org>
 <d17a5ae7-2b71-6b53-f7c3-df2406a001f2@linaro.org>
Message-ID: <656728c2-180b-a412-b802-0bd545647b1d@linaro.org>
Date: Wed, 3 Mar 2021 14:24:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d17a5ae7-2b71-6b53-f7c3-df2406a001f2@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 7Ge4eJV6indf

On 3/3/21 2:18 PM, Richard Henderson wrote:
> On 3/3/21 2:15 PM, Michael S. Tsirkin wrote:
>> On Wed, Mar 03, 2021 at 05:08:36PM -0500, Michael S. Tsirkin wrote:
>>> On Wed, Mar 03, 2021 at 10:46:43PM +0100, Philippe Mathieu-Daudé wrote:
>>>> Introduce the cpu_virtio_is_big_endian() generic helper to avoid
>>>> calling CPUClass internal virtio_is_big_endian() one.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> Using virtio in the name here probably because virtio wants this?
>>> That doesn't sound like a good naming strategy, name should
>>> tell us what function does not how it's used.
>>
>> On a more concrete proposal, how about using this change
>> to rename the virtio_is_big_endian field to guest_is_big_endian(),
>> and put the wrapper somewhere in a virtio header instead?
> 
> We already one for normal guest endianness.  This one is for when virtio 
> specifically differs from that.

Hmph.  I remembered incorrectly.  I thought we had a bit of ppc weirdness in 
which endianness was reversed for virtio, but no.

I'm ok with the renaming.


r~
