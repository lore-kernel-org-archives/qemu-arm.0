Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2361195lfq;
        Sat, 3 Oct 2020 03:37:04 -0700 (PDT)
X-Received: by 2002:aca:bb09:: with SMTP id l9mr3704997oif.175.1601721424703;
        Sat, 03 Oct 2020 03:37:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601721424; cv=none;
        d=google.com; s=arc-20160816;
        b=Q1KLcNSjfn2c2iGb++9V+/SvBYCwrMwowKHbvbH+84+LQcYzRjgAI/ERWdU7hZjwvo
         k4WwXec6kbeglhtuEjiWjSsREYN0hn1ZoMUL2CoySoKxx7OQ06R67jzxgqxV2r0jyJCD
         FkXFP9Di1Q8mAiiloQPyfJpTTVo2spA2PBz6zBDpAH3qNdwViD4Laj1HpuKn5M/FuDsm
         QLAli7atFNPYVuce8a7CkblYA3AFt74olbQX2UPWMwtyCuA64R1dMupoy+ac8KXmXvlI
         AnQV29H5uVmuNBmov8uD6kE9PfBz12wf9ju5+GWrGM/qsJTpKrHdaRN37+8aQlBBAzpA
         0Eaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=VYwFI82HcYrq3ZgcNxh+7SPF1EvBaUooAvpT377YG+U=;
        b=i8how2IfiP8PZUArjartXlfpRpPyA7h4MvOQV/88ikG7HzUa0skca4ou4KDjZ40IYk
         CvDjooQiBH6qO8UbOHwoueUp1eHIomCcgCv3dHLW699KBtKiec5CI0n1C3ogrs4CIw2C
         j8mcfGfunKen+iLbEOkOl7LfqLCXoyLFmrXF4gzKMnYs5kArO80DbkXBERkLlvJnxkdT
         liV4+lnez1K4GlALuoPfl90XKMFi5ysiNyHfIMxYFCGZkHh8jm1vGo2C78/CFJlcYUBQ
         dQmWYazEQH0gaZUOZCRMZuvEkJtwASVyNUTAC3arGRvHNJgs3vLdCyWDvLYfJqmzgNXI
         D7tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kkuIbLNu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o22sor817413otk.159.2020.10.03.03.37.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Oct 2020 03:37:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kkuIbLNu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VYwFI82HcYrq3ZgcNxh+7SPF1EvBaUooAvpT377YG+U=;
        b=kkuIbLNu/anD0Jaybii3oWCIfTglSY8QcWy0VEMk7kYxqR9SBZJg3GzDBNyVA3hs0X
         f8O7ItiVpZmFG0PDKDAtFf2ngs0jLSvRmYPcmu7cl3EiO/llS3gB/zwZpsjhdRILz6n4
         4CkEqwyCXw4uqKTUQZH8MnHnlQ7cbZpYrBvl8js/GMI53RiRSguS85jV34MbvWtQgORz
         cu9IGG84PAvnSSRfmQ7apvGD9kERUJHLzvOqbt2GbkSYIXKF4MkItCO0qdxdJ1+qYzdl
         2aqsRubeKaHyq1/Egd/Y+fDGY3B4H7YaBBOT0PrrHnVtz9y/336rnOCZhJ1etRp+bTbx
         Qm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VYwFI82HcYrq3ZgcNxh+7SPF1EvBaUooAvpT377YG+U=;
        b=lPe6YkRoDJgZ9Pc4XG745mlW76e5ARor5hVQ1SK8R9HbFw9MK/BuPRR5p65xpm5Dck
         sPGZUTF56+TT9pgtJqMeHmJRn8l9GUy1cdNTGMm7rl81bTwvsoDpjO8GMLhATrjylPJI
         ljZt/rgudZNtz1O3TdkyBnHFpRG1C4VO8KKgcLrFGCe4CnmAzXakQyhj5gevVZJSk3iJ
         P2M1aYqFY0Knod8XtxOtIyKn71lyVg9jyCmDXcs5rbRcuqgR64lCzm5ycXk7u/1NyVeq
         cXVugN+yIouuxFRPcvuTatr5OucoceR8ihonlKEqsq7N30DXsptVT1p0dKE/Au9xPiNz
         zqcw==
X-Gm-Message-State: AOAM532FW66mtbP4op45P59hK8H+e6ECRnkeP2W7Plm8c8sw683KZQ5B
	1C0y3GnWT0nMPWaVpES6/88eruhw
X-Google-Smtp-Source: ABdhPJyykWKhd6FiYjB5gw31NYFOzxdDlvz9ehjm7fFSXkcbpSlhgQsBUp9IHtz7QKHbMQdlKaIsEg==
X-Received: by 2002:a9d:7d8a:: with SMTP id j10mr4589711otn.27.1601721424036;
        Sat, 03 Oct 2020 03:37:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id m187sm896465oia.39.2020.10.03.03.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 03:37:03 -0700 (PDT)
Subject: Re: [PATCH v4 12/12] .travis.yml: Add a KVM-only Aarch64 job
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200929224355.1224017-13-philmd@redhat.com>
 <bd4c4587-de23-7612-48c7-afc8b94ab9fb@linaro.org>
 <c7140a42-043c-9bc5-88c8-2cdad9ae2a14@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <01fa70d1-0f11-78a1-aeb6-885e91501429@linaro.org>
Date: Sat, 3 Oct 2020 05:37:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c7140a42-043c-9bc5-88c8-2cdad9ae2a14@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: M5f91cMgfNr6

On 10/3/20 5:14 AM, Thomas Huth wrote:
> On 03/10/2020 12.03, Richard Henderson wrote:
>> On 9/29/20 5:43 PM, Philippe Mathieu-Daudé wrote:
>>> Add a job to build QEMU on Aarch64 with TCG disabled, so
>>> this configuration won't bitrot over time.
>>>
>>> We explicitly modify default-configs/aarch64-softmmu.mak to
>>> only select the 'virt' and 'SBSA-REF' machines.
>>
>> I really wish we didn't have to do this.
>>
>> Can't we e.g. *not* list all of the arm boards explicitly in default-configs,
>> but use the Kconfig "default y if ..."?
>>
>> Seems like that would let --disable-tcg work as expected.
>> One should still be able to create custom configs with e.g.
>> CONFIG_EXYNOS4=n or CONIFIG_ARM_V4=n, correct?
> 
> But that would be different from how we handle all other targets currently...

So?  Does that automatically mean they're golden?
Perhaps they should be doing it the other way around too.


> IMHO we shoud go into a different direction instead, e.g. by adding a
> "--kconfig-dir" switch to the configure script. If it has not been specified,
> the configs will be read from default-configs/ (or maybe we should then rename
> it to configs/default/). But if the switch has been specified with a directory
> as parameter, the config files will be read from that directory instead. We
> could then have folders like:
> 
> - configs/default (current default-configs)
> - configs/no-tcg (all machines that work without tcg)
> - configs/lean-kvm (for "nemu"-style minimalistic settings)
> 
> etc.
> 
> What do you think?

I don't really understand the suggestion.  My first reaction is that this is
more confusing than --disable-tcg, and trying to automatically dtrt with that.


r~
