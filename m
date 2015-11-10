Received: by 10.182.105.169 with SMTP id gn9csp1861930obb;
        Tue, 10 Nov 2015 08:13:54 -0800 (PST)
X-Received: by 10.31.139.200 with SMTP id n191mr3187914vkd.100.1447172034908;
        Tue, 10 Nov 2015 08:13:54 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x232.google.com (mail-vk0-x232.google.com. [2607:f8b0:400c:c05::232])
        by mx.google.com with ESMTPS id 130si2612732vko.107.2015.11.10.08.13.54
        for <alex.bennee@linaro.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2015 08:13:54 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::232 as permitted sender) client-ip=2607:f8b0:400c:c05::232;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::232 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro_org.20150623.gappssmtp.com
Received: by vkbk63 with SMTP id k63so974731vkb.0
        for <alex.bennee@linaro.org>; Tue, 10 Nov 2015 08:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro_org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=qprR8/O1o4YyANrNEOcbhc6O9DLH4xtsGj9i5UdJ6Gc=;
        b=yxZDNnEwZgmBMP65aXkg45gK41ZGpbuRiEFK+h8+StaYrh8nIjgfPGJEAhcMEAmtiJ
         f1fIZ+5qNuUO7bSVc52Q/BiBDKuVY0aJ7RLs7KFrLSGiIppIpcPCb8J7XNPqgYtGeHwV
         uNGtQ+k3LsRKOOv29rtEGcVjtYtBNVdysrBIFvR7rsEEXeDp4YhzcRempHpHEX9a/vBu
         +tknyYoh9QZoDKZTPE3Bv1f7A1oeypJNjJYk/Y2msFWCJgjS9Gg/OsgVIYKNlV5q2rmN
         XuvsdYPlNTWG870k2xn+kmJPUqSwJ/IWuFhXZ47HRylCjs6Cx05vN1YU5kOMJtDiTTsq
         girw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=qprR8/O1o4YyANrNEOcbhc6O9DLH4xtsGj9i5UdJ6Gc=;
        b=ThBIMVIqbPxol+WDhHTqsHl4NL04zzYR6jZxvqkXQaI7uqPc0idoAEw4UkePxTlJr1
         MgJSwhi55DJcoXmbNHm6YcFhML4dWbh/m3CMzUINJe74LhCTjbI63yMM6jx9lCGMkvOW
         DH6frzeiLtFNlctUqJcVQOQqK5uGbSu7PbCbbtEE0m6pv0++0PauZNpi/EfHtDYJ6l0P
         s8VTxE7Ksgp9HQ5/pJR08aaYSHLoYVa8jQEKa9R7PnvN6j0wrEJV9QflZoBhyc4Y4XDO
         JZjEc+tf/cQCBoQDHcXDE/LBGCBZvR2dXYd52vezKefa8PFdGlz7FkFB/D7RJPROkOn4
         0yTQ==
X-Gm-Message-State: ALoCoQmo+E8jbQie0TNT4TOrlggUK+HYL3xP8uY8hCFSiuxflrypFVM+7zParVXJxCfzePWf/FHh
X-Received: by 10.31.132.8 with SMTP id g8mr3086848vkd.92.1447172034523; Tue,
 10 Nov 2015 08:13:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 10 Nov 2015 08:13:35 -0800 (PST)
In-Reply-To: <CAFEAcA90=U_RTmEtVOeHEmptEQwXc40RcV-kVJQ_88z8MYqwfw@mail.gmail.com>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-4-git-send-email-peter.maydell@linaro.org>
 <56407909.2080607@redhat.com> <CAFEAcA90=U_RTmEtVOeHEmptEQwXc40RcV-kVJQ_88z8MYqwfw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Nov 2015 16:13:35 +0000
Message-ID: <CAFEAcA_uct+Em93ARsckq=E-eVSaaHi+FC2nvNb2fwZ62b2g6g@mail.gmail.com>
Subject: Re: [PATCH 03/16] tlb_set_page_with_attrs: Take argument specifying
 AddressSpace to use
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-TUID: nmc3u6uozl6B

On 9 November 2015 at 10:49, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 9 November 2015 at 10:44, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>>
>> On 05/11/2015 19:15, Peter Maydell wrote:
>>> Add an argument to tlb_set_page_with_attrs which allows the target CPU code
>>> to tell the core code which AddressSpace to use.
>>>
>>> The AddressSpace is specified by the index into the array of ASes which
>>> were registered with cpu_address_space_init().
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> Can it be deduced from the attributes instead?  Basically, you would have
>>
>>    int cpu_get_asidx(MemTxAttrs attrs);
>>
>> in cpu.h, which is called by tlb_set_page_with_attrs.
>> cpu_get_phys_page_asidx_debug could also be replaced by
>> cpu_get_phys_page_attrs_debug.
>
> For ARM it could, certainly (and as you say, if we go that
> way then some of the extra passing around of asidxes collapses,
> and in particular we don't need to keep them separately in the
> iotlb entries). I wasn't convinced that this would be true for
> all possible uses of AddressSpaces.

Having thought a bit more about this, I think you're right. At
any rate, our current planned multi-as use will certainly work
with the existing attrs. And we could always steal a few bits
in the MemTxAttrs to indicate the asidx for some hypothetical
future usage even if they wouldn't otherwise have to be
exposed to the rest of the system outside the CPU.

thanks
-- PMM
