Received: by 10.25.134.130 with SMTP id i124csp1992672lfd;
        Mon, 11 Jan 2016 06:18:43 -0800 (PST)
X-Received: by 10.31.52.133 with SMTP id b127mr73768207vka.77.1452521923797;
        Mon, 11 Jan 2016 06:18:43 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22f.google.com (mail-vk0-x22f.google.com. [2607:f8b0:400c:c05::22f])
        by mx.google.com with ESMTPS id k202si74038472vke.149.2016.01.11.06.18.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2016 06:18:43 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22f as permitted sender) client-ip=2607:f8b0:400c:c05::22f;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22f as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x22f.google.com with SMTP id a123so194039823vkh.1
        for <alex.bennee@linaro.org>; Mon, 11 Jan 2016 06:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=mckZmOtvANQe64+T/2B0CwgUrh3x4+RmVZqoPsskO+Q=;
        b=jvvjdOnP2+qG6IQcLpVnzPADBMi213KF3tgHY2ynDaMzdO+z19Zgs8XVTT06zmHVdq
         Df11EzF8vwAgnPZN2p92vuhscpk2VrM2EDks2rZbOQPCqsJ48avNpoklruPfj0Ys0E81
         6iG3baJ3rxbh8+VHzWYBMILXWfc2AEhl/0R3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=mckZmOtvANQe64+T/2B0CwgUrh3x4+RmVZqoPsskO+Q=;
        b=cU8K2gfHpuavX9RIyZmuLTMc53CUCZ339dobxlf8T5s+5oBzMeHOwqA0wG1p6PDjQW
         A+bhdNR67T/W9SfxXGam8GVCaKcsPdhUwbOctfwL5fTfbolN9o73+21WJByP4XuLWS3b
         nQt/SMISEYRULBVOL6je6MWr22nu4eAQkehIsgjvGRmOnau9gH1Uv5yvz56LF04QfdF/
         LMwvkUXmSIgf7E56d4RfwC7fSGRaa8GYhG68s+CEatiPTNaGUbFVWYWxPfni9pYoVqLb
         C4qXUigsMf+KyScHfzqvPgG1nWM65mIpV9a2YsZ8WpDwjaybJBX5TEr34vs4/cyzGbKa
         9Idw==
X-Gm-Message-State: ALoCoQle8k9b67lwiyyKRDbLTIUvC8GsDNeKGPufEjoaDMct4muHeKTAuZo/nklaY+79wa4BJiqTFfK2FnJ1EyNEaE49McfX0fn1YH1iAbqHzfkmT0jlLzU=
X-Received: by 10.31.194.21 with SMTP id s21mr88264334vkf.92.1452521923398;
 Mon, 11 Jan 2016 06:18:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 11 Jan 2016 06:18:23 -0800 (PST)
In-Reply-To: <5693B259.2030106@redhat.com>
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
 <1447682723-3977-10-git-send-email-peter.maydell@linaro.org> <5693B259.2030106@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jan 2016 14:18:23 +0000
Message-ID: <CAFEAcA_L-QiV5Wbf6SVVnbKU06TC=VZUL-9SBGkOomqvb8QvOA@mail.gmail.com>
Subject: Re: [PATCH v2 09/19] exec.c: Use cpu_get_phys_page_attrs_debug
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8
X-TUID: XwBwxqypo/Y8

On 11 January 2016 at 13:47, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 16/11/2015 15:05, Peter Maydell wrote:
>> -    hwaddr phys = cpu_get_phys_page_debug(cpu, pc);
>> +    MemTxAttrs attrs = {};
>> +    hwaddr phys = cpu_get_phys_page_attrs_debug(cpu, pc, &attrs);
>> +    int asidx = cpu_asidx_from_attrs(cpu, attrs);
>>      if (phys != -1) {
>> -        tb_invalidate_phys_addr(cpu->as,
>> +        tb_invalidate_phys_addr(cpu->cpu_ases[asidx].as,
>>                                  phys | (pc & ~TARGET_PAGE_MASK));
>>      }
>
> The only question I have is whether it is right to have empty MemTxAttrs
> here.  Is there any way to use the MemTxAttrs for the "current state" of
> the CPU, whatever that is (on x86 I have added cpu_get_mem_attrs to
> target-i386/cpu.h)?

That's what the call to cpu_get_phys_page_attrs_debug() does:
it fills in the MemTxAttrs :secure and :user fields, and then
cpu_asidx_from_attrs() uses the returned attributes to pick
the right address space. (cpu_get_phys_page_attrs_debug()
only fills in attribute fields it knows about, which is why
we pass it an empty attrs struct to start with.)

thanks
-- PMM
