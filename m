Received: by 10.28.71.155 with SMTP id m27csp396513wmi;
        Wed, 11 Apr 2018 00:19:28 -0700 (PDT)
X-Received: by 2002:a19:cd4b:: with SMTP id d72-v6mr2017305lfg.87.1523431168872;
        Wed, 11 Apr 2018 00:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523431168; cv=none;
        d=google.com; s=arc-20160816;
        b=w+DoBPu5zwUuWm8g5a3G3TctWmafPh34/+Hks4xhaDASBaf4xqyZC+RSS/KLaQJG6G
         5HH2JDnHxoYoNIsgqnSoS8Ehv0sBC3+f+M0IdseOHE0zRdCb3LNvKzOb5XgCsnVdYHo7
         KlWPppy1NcDS1vnkewKHMjvGlZRArlTwOTkszof50e3qelHwmMlA48MkqITBbsTvghi0
         imFRbK4AswUXePtPITw5Ez1wNmeBEuuQKZgh6emXETldx5JcXANwjBJl92IdWNwXSTT5
         Ws2B6qiVPMaMo3QEJ68cWKErFoRd1hDG1bwqI2Ek4u4SCIufSMBfJpZnGNm0aBdZV4DF
         t/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=Ef9UdrUbNuUZ0foER+YoxtRy3M8IXtziDyqlF06Qyvo=;
        b=WHfc3tQSfRf64B7AKpFy+V2oAZP4Ec8zB45hW1kElGt4/ZtXWxni3fs/ff/mtMVtDu
         EMJEOPb8zm+8flVGSUBW0NhPV1jG7/qjDhFAOKNwOMebmV8LYE0vlc3VRVbUpCeC5Cwo
         FhtvlpF/EWsUSL7TR6rtnNYcRxcL4o6gjTffUV8KtaNybphLcgI6uv8hwHx0TUt3UMV/
         CIjvPlMPjHmGQZaWdic6UMe5t8NwGaxMmyQNCCpnpzBTUu8uKa8gqMC/zIYhE0kqap4D
         gvvLrTH9m5cPAcmOf9snyLm9ITn82BSPXh3fwj3pMQ+3fA7PjX8h/QdUkXw6Up67Gq7V
         U2Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=JQ9zIE03;
       spf=pass (google.com: domain of ajaygargnsit@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=ajaygargnsit@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <ajaygargnsit@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 69sor100390ljs.42.2018.04.11.00.19.28
        (Google Transport Security);
        Wed, 11 Apr 2018 00:19:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of ajaygargnsit@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=JQ9zIE03;
       spf=pass (google.com: domain of ajaygargnsit@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=ajaygargnsit@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Ef9UdrUbNuUZ0foER+YoxtRy3M8IXtziDyqlF06Qyvo=;
        b=JQ9zIE03/SdldY7hprZAndwYvEBQjzGjqM8p1FyEI5j3QymgVQKAGu7KQVne4xWVNp
         wNwqVRgmMojQR+nmjSx+qvpC0EWFBc114A4RfV9PDotqMNiQjzvnBvl4QAMaQ+OlI6fC
         TRYshcV3YrJpfbSOxsbUO7ckmF5auiA5qQiySZc5Feqo8ITuq1Z4/wvO4iLeIZTZW2gu
         rPOEYM0LCV41qdTq7bD3W8bM1XPt+R3C2ferMpHxbNvG0a2LGmBg8dKrNHff2NznbWsO
         o5ktCLKNCZPEcSSSjKD9BVu4FqpqlfmaC9ZJliDVzljTckypdyIqtJdEbfuKCGc+lsl+
         tvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Ef9UdrUbNuUZ0foER+YoxtRy3M8IXtziDyqlF06Qyvo=;
        b=SO9u3rma8RdsewbIu6zekhnZQbc51hyiBMiXeWPVPq8N5ZGxjB5q0yjmO9JoOGqhqQ
         dR9mpR88jEG7v8nWXBDgh6DszHSv7g+aTQLmi/58IXAFKMKcDug1vo9rXrnQGjVhvwa3
         fcRkmlhmfpg6mhop2lTqU5hupqyig6FaoAHCrx0sgFkAg2UZ4DPC7oKngmWXz1UgC6Tw
         Xw7Wd1KhvraIMAzjZSE+rTWONmzu1pXTehKrp4yQl/jLvl1YQ013wh83WwLFxfUEliaM
         ScT4+4MfuO+tkOf3PjJHFAjTsgReDIWC/qjlZZcWaVIvrMcVqbmBBLCXjAYX1jr8CjlZ
         ZYsw==
X-Gm-Message-State: ALQs6tDRERu67accgFUngobMqkcTPqJ6g+Pa5NCVaa2BAdBWODak4NFR
	SGZTaQYl/p369LKlcuzfTGWVnKRUaUGMcVduofy9hQ==
X-Google-Smtp-Source: AIpwx49Td0k4Zhjnjf2OuyHBM8FUElt+pXDAZe9e9CnmKf792BJ1bmFjIlrX85Sfu1gsh5DgazOnBOosXGZOEmtPfhc=
X-Received: by 10.46.85.196 with SMTP id g65mr2123527lje.10.1523431168143;
 Wed, 11 Apr 2018 00:19:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:c64a:0:0:0:0:0 with HTTP; Wed, 11 Apr 2018 00:19:27
 -0700 (PDT)
In-Reply-To: <CAHP4M8WEuR5JJTV_KggwJok0Pzbu8=4BifLuFOjhv3T9hfjUUg@mail.gmail.com>
References: <CAHP4M8VnuS5KijfVw9eDz41KPwaT4rJ+4VEU==EbBgdwgFKJhA@mail.gmail.com>
 <87efjov999.fsf@linaro.org> <CAHP4M8W-WuBmJUdb6LGR1t3tPayrnaS+b1ZZ1zew71aM==-imA@mail.gmail.com>
 <87d0z8v78e.fsf@linaro.org> <CAHP4M8VSzm4L6oS06J-e93FwjuHM=weJf2MegCaDNH8MPbsqgA@mail.gmail.com>
 <CAFEAcA91iNyUnahri9EdL7Th1Q9v44765z0OJexxMrNUD_DXEQ@mail.gmail.com>
 <CAHP4M8ViS=O4R+sMmR=CmkbgQtwd8RHGxLwNb5m_aMS_M++f6A@mail.gmail.com>
 <CAFEAcA8xG_GrVL5zgZqN26OQGj0UHWFNZ9xWEmHJyaiUFZLH8Q@mail.gmail.com> <CAHP4M8WEuR5JJTV_KggwJok0Pzbu8=4BifLuFOjhv3T9hfjUUg@mail.gmail.com>
From: Ajay Garg <ajaygargnsit@gmail.com>
Date: Wed, 11 Apr 2018 12:49:27 +0530
Message-ID: <CAHP4M8UESYxeJOd5Y+Hj1K26QUb2D1UJJoBTh9SYCsvuwBP95w@mail.gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] Crash when running hello-world unikernel
 for ARM
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	rumpkernel-users@freelists.org, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: G25KDVy7BC4Y

Hi All.

Just wondering if there is something specific that needs to changed at
https://github.com/rumpkernel/rumprun/tree/master/platform/hw/arch/arm/integrator
in order to get a hello-world app run on "virt" machine?

If so, I would request the rumprun-guys to kindly throw in some light,
on what needs to be done in order to have something run on a "virt"
machine in qemu-context.


Thanks and Regards,
Ajay

On Tue, Apr 10, 2018 at 3:49 PM, Ajay Garg <ajaygargnsit@gmail.com> wrote:
> Thanks Peter .. my sincere gratitude.
> You pin-pointed the real issue ..
>
>
>
> On Tue, Apr 10, 2018 at 2:50 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 10 April 2018 at 09:16, Ajay Garg <ajaygargnsit@gmail.com> wrote:
>>> On Tue, Apr 10, 2018 at 1:08 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> What hardware (what CPU, board, etc) is this "rumprun" software
>>>> expecting to run on?
>>>
>>> Yep, just to ensure that there are no cross-compiling issues, I am
>>> building rumprun on the pseudo-real hardware itself.
>>> In our case, the pseudo-real hardware are :
>>>
>>> a)
>>> An ARM32 "virt" hardware/machine in a qemu environment
>>> (https://translatedcode.wordpress.com/2016/11/03/installing-debian-on-qemus-32-bit-arm-virt-board/)
>>>
>>> Once I start  this machine, all environment is arm32, and I compile
>>> rumprun within this environemnt without any cross-compiling.
>>>
>>> b)
>>> A beaglebone-green-wireless.
>>> This is a arm32 machine bottoms-up, so no question of cross-compiling
>>> whatsoever here :)
>>>
>>> In both cases, I then use qemu-system-arm (on the "virt" machine, and
>>> beaglebone-green-wireless itself).
>>
>> That's telling me what setups you're trying to compile in,
>> which doesn't correspond necessarily to what the guest
>> OS is built to run on.
>>
>>> One query : It is apparent that there is nested qemu-virtualization in
>>> step a), could that be an issue?
>>
>> Why are you running this in a nested setup? I don't understand
>> the purpose of doing that. It would be simpler and faster to
>> just run the guest on a QEMU running in your native host system.
>>
>> Assuming this is the source for the guest you're trying to run:
>>
>> https://github.com/rumpkernel/rumprun/tree/master/platform/hw/arch
>>
>> that suggests that the only Arm board it supports is "integrator"
>> (which is an absolutely ancient devboard with very little memory,
>> no PCI and no virtio support). You need to confirm what Arm hardware
>> this 'rumpkernel' is actually intended to run on, and then give QEMU
>> the right command line arguments to emulate that hardware. I can't
>> really help any further, I'm afraid -- you need somebody who knows
>> about this guest OS.
>>
>> thanks
>> -- PMM
>
>
>
> --
> Regards,
> Ajay



-- 
Regards,
Ajay
