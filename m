Received: by 10.28.71.155 with SMTP id m27csp3571766wmi;
        Tue, 10 Apr 2018 03:19:19 -0700 (PDT)
X-Received: by 10.46.50.11 with SMTP id y11mr2425294ljy.149.1523355559026;
        Tue, 10 Apr 2018 03:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523355559; cv=none;
        d=google.com; s=arc-20160816;
        b=W5ZtNerG7cA8HcIcVJ7BdMn/F6sPYax+3REQurCE/Y+ljhYTb1/u76g2ETiAIXVnbo
         mkGXlaNs8nMZ9e/oqDomOpfYm8Q4DcxcXtVeZ44cT9NNQMppPDPt2tq1JmSUAzyMf5W+
         xR4Kx3ek/hTaanFGVSoJHSObRBeuPZN5h2KkZPlw60Gd/itFE4v1vhqgQ3SrqrGlU7En
         iJnRnPRNbJ4A/otpbGj8IMu2yABjFqh2uzDxl8370zDeX3RncaYENqhD9Ik2CW7/uuKh
         p6kNamJ/lh3O9WpSdQkNGvQPS0/iXo4bGCfdItIyA+6b+AGGQaYpyR6KjfyJcCyxQXB/
         O4Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=N9+UgMF798pDYPepmEN6vRfFl87/PRxH6h5nuD85U/Q=;
        b=pYyNBWQ5cmpnRcXnD7X8yLP1TUsWKZFI/Zj02sMHI0rPj/FVZj1Usncd2i0I3h4z0B
         pO97dLxbg4voIkC6Cp+XC6iMzLN/6Fl/Tm6rWm6OG0KxMNFoG39D/QXJKyOtKTtQjcKN
         AqER5Ge+E2aByd0MiUY9i4aB0PGmt/4GWQTVvpx/rzIM0Sn6L6Gwb4gC70RImIfLmxAb
         cUjbcx76hNdXFvzLoxZey5u6fF/mXxrZvcUvc9rzwl22KoWQPby7vrlR/WrjX6cY/HLj
         isBfZgweNGOdFkHaMicwlDdUQWAYDf9KElp/OIgo7BqFpBC/eG7Zr6IMhCfR+3rxFyGJ
         waTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=okh4bV2s;
       spf=pass (google.com: domain of ajaygargnsit@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=ajaygargnsit@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <ajaygargnsit@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 69sor590032ljs.42.2018.04.10.03.19.18
        (Google Transport Security);
        Tue, 10 Apr 2018 03:19:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of ajaygargnsit@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=okh4bV2s;
       spf=pass (google.com: domain of ajaygargnsit@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=ajaygargnsit@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=N9+UgMF798pDYPepmEN6vRfFl87/PRxH6h5nuD85U/Q=;
        b=okh4bV2sv3Roo4oxbxGhJeCvU2HjSWMXFif8mzQPNzn0yAMW1NXlFn8Nx6GI220COU
         RavsHvji04D51IyAVjMgJiMcKSQyhv3MezRPeRYXaNhA5n20BrKg2+w4E8QSGd8NHIio
         AT++4iWXJR8YnBBtgZFww/I07tlmX/EjLaPOUXMS8wq78AyN4tRONKKfthXdWtaQFCpp
         ZEVsdEGFUvcWNwuQFprOOpDvvbU02wXFOq7ICTqrmIooz6/ypmc+pmi/iZAb8WTIyh50
         P19MOuDjqH08yWXePNbWf05GgGgquhIuh7YupU9PiYWyA1ZFycaxstfX6Fiw4Oq5W+EO
         QeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=N9+UgMF798pDYPepmEN6vRfFl87/PRxH6h5nuD85U/Q=;
        b=FVf/yj6dcBCHFK7dYBRL0zGVIFP28jaPl18qrd36IXk5XfTc3oQChS2bgylkIq/cly
         KYZIwmEE1Zi11/dR4jCop1aC6j1tFxA9pbt1eDwecjlzu7n7EuOiWZl0TkhXlzi+UzSZ
         eod+0nqba9B2HEEz46an/bkSkoH7Q5r1W57V4dkA6B0UZs89RQvVAhM4EIV9dtbD2YZ6
         unqscXUqUVXl6KIosIoZGJwIX9H6ikcGnJn6JqQJ6aCanfaf3WNqKERMFREgs1A/YVMD
         YTi4X2P+DTGaSm8OhwiFpvRCG3ayTBeSqK4zPq2PDuqGryBICi/W1sngK8qAIww5bmhq
         1Qag==
X-Gm-Message-State: ALQs6tAQcCJuuqkV9kiHKFvop/a3M/TxKEpQ1HH7+C3xaczPI2Xc1Wkf
	0ElsSX4q5WXXbc5RqfiM0VMk+YVNiNnl2K8atVQ=
X-Google-Smtp-Source: AIpwx4/ijOQ2g/E7l/qnVQz8Z0idjo/jjmayz8ixB0QRnD7YPt8gqPL1+M71cOZnqr+eI6+jmErnWEAJsVxk55MmOS4=
X-Received: by 10.46.41.156 with SMTP id p28mr24986911ljp.32.1523355558388;
 Tue, 10 Apr 2018 03:19:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:1708:0:0:0:0:0 with HTTP; Tue, 10 Apr 2018 03:19:17
 -0700 (PDT)
In-Reply-To: <CAFEAcA8xG_GrVL5zgZqN26OQGj0UHWFNZ9xWEmHJyaiUFZLH8Q@mail.gmail.com>
References: <CAHP4M8VnuS5KijfVw9eDz41KPwaT4rJ+4VEU==EbBgdwgFKJhA@mail.gmail.com>
 <87efjov999.fsf@linaro.org> <CAHP4M8W-WuBmJUdb6LGR1t3tPayrnaS+b1ZZ1zew71aM==-imA@mail.gmail.com>
 <87d0z8v78e.fsf@linaro.org> <CAHP4M8VSzm4L6oS06J-e93FwjuHM=weJf2MegCaDNH8MPbsqgA@mail.gmail.com>
 <CAFEAcA91iNyUnahri9EdL7Th1Q9v44765z0OJexxMrNUD_DXEQ@mail.gmail.com>
 <CAHP4M8ViS=O4R+sMmR=CmkbgQtwd8RHGxLwNb5m_aMS_M++f6A@mail.gmail.com> <CAFEAcA8xG_GrVL5zgZqN26OQGj0UHWFNZ9xWEmHJyaiUFZLH8Q@mail.gmail.com>
From: Ajay Garg <ajaygargnsit@gmail.com>
Date: Tue, 10 Apr 2018 15:49:17 +0530
Message-ID: <CAHP4M8WEuR5JJTV_KggwJok0Pzbu8=4BifLuFOjhv3T9hfjUUg@mail.gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] Crash when running hello-world unikernel
 for ARM
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	rumpkernel-users@freelists.org, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: cbe/rPT3jCMw

Thanks Peter .. my sincere gratitude.
You pin-pointed the real issue ..



On Tue, Apr 10, 2018 at 2:50 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 10 April 2018 at 09:16, Ajay Garg <ajaygargnsit@gmail.com> wrote:
>> On Tue, Apr 10, 2018 at 1:08 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> What hardware (what CPU, board, etc) is this "rumprun" software
>>> expecting to run on?
>>
>> Yep, just to ensure that there are no cross-compiling issues, I am
>> building rumprun on the pseudo-real hardware itself.
>> In our case, the pseudo-real hardware are :
>>
>> a)
>> An ARM32 "virt" hardware/machine in a qemu environment
>> (https://translatedcode.wordpress.com/2016/11/03/installing-debian-on-qemus-32-bit-arm-virt-board/)
>>
>> Once I start  this machine, all environment is arm32, and I compile
>> rumprun within this environemnt without any cross-compiling.
>>
>> b)
>> A beaglebone-green-wireless.
>> This is a arm32 machine bottoms-up, so no question of cross-compiling
>> whatsoever here :)
>>
>> In both cases, I then use qemu-system-arm (on the "virt" machine, and
>> beaglebone-green-wireless itself).
>
> That's telling me what setups you're trying to compile in,
> which doesn't correspond necessarily to what the guest
> OS is built to run on.
>
>> One query : It is apparent that there is nested qemu-virtualization in
>> step a), could that be an issue?
>
> Why are you running this in a nested setup? I don't understand
> the purpose of doing that. It would be simpler and faster to
> just run the guest on a QEMU running in your native host system.
>
> Assuming this is the source for the guest you're trying to run:
>
> https://github.com/rumpkernel/rumprun/tree/master/platform/hw/arch
>
> that suggests that the only Arm board it supports is "integrator"
> (which is an absolutely ancient devboard with very little memory,
> no PCI and no virtio support). You need to confirm what Arm hardware
> this 'rumpkernel' is actually intended to run on, and then give QEMU
> the right command line arguments to emulate that hardware. I can't
> really help any further, I'm afraid -- you need somebody who knows
> about this guest OS.
>
> thanks
> -- PMM



-- 
Regards,
Ajay
