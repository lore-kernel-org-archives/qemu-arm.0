Received: by 10.182.105.169 with SMTP id gn9csp1109985obb;
        Fri, 6 Nov 2015 06:51:38 -0800 (PST)
X-Received: by 10.31.166.194 with SMTP id p185mr13718987vke.52.1446821498712;
        Fri, 06 Nov 2015 06:51:38 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22e.google.com (mail-vk0-x22e.google.com. [2607:f8b0:400c:c05::22e])
        by mx.google.com with ESMTPS id w136si421919vke.109.2015.11.06.06.51.38
        for <alex.bennee@linaro.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 06:51:38 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22e as permitted sender) client-ip=2607:f8b0:400c:c05::22e;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22e as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro_org.20150623.gappssmtp.com
Received: by vkbk63 with SMTP id k63so3826460vkb.0
        for <alex.bennee@linaro.org>; Fri, 06 Nov 2015 06:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro_org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=DsGhNSsl0mqM57c5GeIjJtzSAfldOD2EWO3S7OcoEjk=;
        b=psIxvpL+tKSLZZkM+ZtWU7inHzc1Tc9+fmbm+Wp141/kwmoH1q+7FAiIW4th3d89X2
         fy974oooCbWd0jnKlMNUO2pKEeFv6kY75SV7O/IQnaUrojRw0arfLuL4OdLzTAQVULXB
         Q3wPSOhT2W2wmBxefkPziLJsMC9kHLC2ZuOB8DKoEVBVqApTuY+JmOpNJ4iy+hP/90tS
         zoyZZxJ9//kbdo+bLn9U4V5Tto94JaHSvYB7dNH8Och6sZyNPgymreWmWSOY4EHScr/P
         KryG1w+ziT9jTvx8rIqFOu3bInNT4SIfJbhy9NvTbSqPsLvHUG8NBjiH2JyVVkBxQi8F
         XLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=DsGhNSsl0mqM57c5GeIjJtzSAfldOD2EWO3S7OcoEjk=;
        b=bIcIFUgopEeKUKAO0gh7bbfLfaAaOV/T+JtiWR7igJl+h1KyVOrunW/0gWCWKUTWN8
         lyNzC014yHU03R3ytF/90D5TwN9tQxHPRGazDQEiBzQU6f9OB3BlV/CTEmIT4FG8/ssP
         BkkRhh727fSqy4zEHTe43yEKoP2RpPnVjWEAYMdl7DOv9tRwY88XOStiKh9ak12GxuxU
         uGcyIH/9Nmayd8VdI+p0mfj72JENS4qM71FWUmor8KunJKQCuSeKHyZQxYIlJMTv2sSN
         CMFr3sXXAD7rz8GAiOYxwhVfrgXYwxQnQgCjjksF32O4UvkVIhBtJ6dwoo6PyRmf4JO1
         vgYA==
X-Gm-Message-State: ALoCoQmG+Xu/AFb9sa3Eg4IgYH7SvzTJ7BX6Od6deKh2w2IO0XSA9oy40WrRveN8bDEFlBuOj9T/
X-Received: by 10.31.56.198 with SMTP id f189mr9552153vka.83.1446821498488;
 Fri, 06 Nov 2015 06:51:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 6 Nov 2015 06:51:19 -0800 (PST)
In-Reply-To: <20151106144559.GQ13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-15-git-send-email-peter.maydell@linaro.org> <20151106144559.GQ13308@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2015 14:51:19 +0000
Message-ID: <CAFEAcA9ccrLoiGdKdiaQ0Q71yHRWBtca+NvMiKoXwtYOK7pqNw@mail.gmail.com>
Subject: Re: [PATCH 14/16] hw/arm/virt: Wire up memory region to CPUs explicitly
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-TUID: 7dojtvSrhT5D

On 6 November 2015 at 14:45, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> On Thu, Nov 05, 2015 at 06:15:56PM +0000, Peter Maydell wrote:
>> Wire up the system memory region to the CPUs explicitly
>> by setting the QOM property. This doesn't change anything
>> over letting it default, but will be needed for adding
>> a secure memory region later.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> I'm not sure I understand this, if not set, wouldn't "memory"
> just default to sysmem anyway regardless of if we set
> "secure-memory" or not? I'm probably missing something
> in the init/setup sequence...
>
> Anyway, I don't mind explicitely setting "memory":
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Yes, you're right, it would default to the same thing;
but it seemed clearer to me if the board is going to be
setting memory regions explicitly on the CPU to set them
all rather than letting one default and one not.
(Also it provides an example in the code base of how to
do it right ;-))

thanks
-- PMM
