Received: by 10.25.208.211 with SMTP id h202csp555724lfg;
        Thu, 18 Feb 2016 03:42:37 -0800 (PST)
X-Received: by 10.31.190.195 with SMTP id o186mr6029131vkf.100.1455795757498;
        Thu, 18 Feb 2016 03:42:37 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22e.google.com (mail-vk0-x22e.google.com. [2607:f8b0:400c:c05::22e])
        by mx.google.com with ESMTPS id l62si7146218vke.71.2016.02.18.03.42.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Feb 2016 03:42:37 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22e as permitted sender) client-ip=2607:f8b0:400c:c05::22e;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22e as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x22e.google.com with SMTP id c3so41492986vkb.3
        for <alex.bennee@linaro.org>; Thu, 18 Feb 2016 03:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=PRGq6OoFXp5eyP0jx1svAjzRhrywXVji/ZmSykPWlzc=;
        b=i0Lq3YkcD9UK/YhiaYsdap5NKR+r9yey5FaX/AbTTbadUzkU+u43hjy+Z7aAkrCiNh
         FJa+jsZT5LCyRKbGGcdhEG9DYAzZ7p8Q+yVdpk8OQ6sysljOnVKMbgzPQdYxYz09aEPZ
         jJ+gKHee3eegszGqGbIndBHOYJWAwfS6SGGao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=PRGq6OoFXp5eyP0jx1svAjzRhrywXVji/ZmSykPWlzc=;
        b=D18NpmtEyQjJaMLBzD+Zy7a5VtAjyk62fKjVyndRHogSIyAxK/uWiEXBsRmoCtNaGm
         oAuI+g99n9S9CtwV+Yb86p+7D3iikjy728NBFyHpbTF31K8kraLfidTtRF2c+WrhRvJq
         KYQpE42ddt+aVZrVr346pY8EpMJnO2qljfVUBQw0CN2foxseeF6sfPIwoCq7Z94dcNbP
         Z0UqORlp/1/kGSXp/VWcK79NeGURd1xPiezSnex1jPiLTpTdUENId5rM3iMiTKUqJ8yj
         9gI9M9UQQwQTjT2CAYti+7c5OKnP8UDB0OM0PeMvntZrw4aaAViPXN9RaR2R9Ne5+HM2
         HPDw==
X-Gm-Message-State: AG10YORMroemGrR7HeLaK75+ThsYCPdVdGulBWsd40811jc2ZMdWGrpBG+UI05cEWbfvR6iTcS0BL4/u1w5HeUe214Y=
X-Received: by 10.31.47.207 with SMTP id v198mr5757264vkv.6.1455795757057;
 Thu, 18 Feb 2016 03:42:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 18 Feb 2016 03:42:17 -0800 (PST)
In-Reply-To: <20160218095654.GD4403@toto>
References: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
 <1455287642-28166-9-git-send-email-edgar.iglesias@gmail.com>
 <CAFEAcA8VfyWn8t4jBAH3_ph1W7=FhPMr0Z+TEk9SXtv5Adv23g@mail.gmail.com> <20160218095654.GD4403@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Feb 2016 11:42:17 +0000
Message-ID: <CAFEAcA99-ypB=cMvL8aQwwStbFquv5zUE0xfgKnkwGVaUvdkog@mail.gmail.com>
Subject: Re: [PATCH v1 8/9] target-arm: A64: Create Instruction Syndromes for
 Data Aborts
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Sergey Fedorov <serge.fdrv@gmail.com>, Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	Edgar Iglesias <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: mEbmjcfaVEZA

On 18 February 2016 at 09:56, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> On Tue, Feb 16, 2016 at 07:13:32PM +0000, Peter Maydell wrote:
>> I think this patch also would be simpler if the encoded info
>> put in with the TBs was just the syndrome register, rather
>> than some other encoding.
>
> My first try was to only pass the bits needed for the iss
> (i.e not the full data abort syndrome). We don't have all
> the info needed at translation time to create the full
> syndrome (e.g stage2 trap? stage2 trap while stage1 PTW, etc).
>
> But we could maybe create as much of the data abort syndrome
> as possible at translation time and then have the exception
> handling code add the missing bits. We can then pass the
> preliminary syndrome from translation time to exception time
> in the std syndrome format. I can have a look and see what I
> can do if that makes more sense.

Yep, that was basically what I had in mind.

Am I right in thinking that at translate time we capture:
 IL ISV SAS SSE SRT SF AR
and then at exception time we determine:
 EC FnV EA CM S1PTW WnR DFSC
?

In that case I think you could reasonably have the info stored
with the TBs be "template syndrome >> 14" (since bits [13:0] are
all info determined at exception-time). The only reason for doing
this is that the encoded data is stored as sleb128 deltas between
lines so keeping the values numerically smaller should make them
take up a bit less space. (I have no idea how significant the
space saving would be.)

You should then be able to just have restore_state_to_opc()
write straight to env->exception.syndrome rather than needing
a new field in the cpu state.

thanks
-- PMM
