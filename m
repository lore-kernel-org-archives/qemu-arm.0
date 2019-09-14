Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2101514wrp;
        Sat, 14 Sep 2019 08:53:06 -0700 (PDT)
X-Received: by 2002:aa7:d1da:: with SMTP id g26mr29737289edp.100.1568476386036;
        Sat, 14 Sep 2019 08:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568476386; cv=none;
        d=google.com; s=arc-20160816;
        b=MxfhJBxKZga0VX96I4EgFr3gmyZb022gk0Z2W3yQT9GMJ7ipCqAbvS9dp8ljBwLYQT
         LtO5AplZA+YxQJUtotdCkBpJHGcmJSrcYRW/a34zOXXsSM35AuWO/tUAU+18NwWuW/BA
         98HEajeY7oEPPnow7h/mmxlkpSz1KRcb96v8LDJuD9hLEVZrUSOm9YVQ41OkXbJiHDvM
         r/PoRF5QAQ57wpKSQ7PHZxD77884RUXtoP4ek6LMz4LJqVnBHXz+ybUdp6Rse5ToGT3s
         dBtKQ6Wj3EFeHD1Zp9GjLlfVo1CAEJ8hRNektY8qnztBMdV2as7HiZjuWXq/7Y8laOP9
         KyQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=i45Wi1jeYhYFpNz+2IXLaY6w4HIOvN+kqymRjs2dzXw=;
        b=JFOB6OA/2iMQoDRKhvlpDd6/t7tV67qCgKnT2Lqkq4efks/+47Sg0eXopIGDLNs+p5
         vWJRpW5KDnfKLwdIeHyB013pfCcBVu7YTekXior69O+/Ptwy8doUmeDBigqZk4YpWG39
         SE+IbVOP53dv+KVeiY5NL1dtB12xZqSOngIYq+1wClMxslW7M1AkJ8q5qOV1L348g42a
         h6J/ApQnmeh5BggvAp2UfQjwAmbmK6AH3tBGgiMJXFSY2L/0NNQug/4iWUzpqiGuwcBA
         +Ubd83kWxMvgLaQdUbGmJNPQCAzg6ap6CcLaJjt+ALGL2cjUCIcE8QIdCCHpMsIl3WI+
         7Qbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UhhGqSnF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d15sor1614032edy.17.2019.09.14.08.53.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 14 Sep 2019 08:53:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UhhGqSnF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i45Wi1jeYhYFpNz+2IXLaY6w4HIOvN+kqymRjs2dzXw=;
        b=UhhGqSnF3BSxTnNGLEOZ1v4m+cuPepV7pPNurGwQ0+6BE++8+PW+WnTquTZWILwiel
         UximVJA+qUq8eueZ5U8aqstcZvcBFQZp3LJCahL/ZxpPwb0/atU3I+9gV0NYfCclXobj
         uQXilX8eVs90xjEI463rTujcIQehNrJ/CbSWVBJ3FRwj4orBCPxs75a/xWLMInl96qh2
         Sfle6sky7+Az+rGli8Deddnvi+jZil5dRi3ROSRMzFDb+X0pmg4Nzyiuhi9SsBhZVzgh
         67B+GgMe9MEDKJk2Fgb+ZnGMOehFggqW8vmwclepVe73XS/841mYe5Jb/QY7q35bwZNd
         stKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i45Wi1jeYhYFpNz+2IXLaY6w4HIOvN+kqymRjs2dzXw=;
        b=o1zz4iJxVrS2g6P/hQIzuCc6rMd+/3C1/lHZp1BcP+WGuDzo65pLwv7VCPaK2Lveim
         VcO8P186AuTpPsdyWfV81/9V/33uhAMhxwrgQwI0O/UgEDKKsLkZlSNmWdZudynD6+sM
         t6HfDYBlVdar1f6c0M/OniEF3naBgWBkeZAonoJXsT56U1ps57225Gvo48tpHtuG5+wp
         2uvxtxaCnbNbq9t9oYy2IqQzt8DqR3eDPiwqMldjszWW14AQs6hhCcac9apVNrG007YD
         pyczrL09IKlXolOHNzu8YJ+7fub/lHQQoGZCzYFDRCxaw1KcG19LNKY9wWVEF+GJtdxB
         6MKw==
X-Gm-Message-State: APjAAAU2aMZvv9IVZXB/m7Urctq9/kmV1Sod2b8+kG+DwiQocTumzOSb
	vUW1KYtdwgQfpNxOU3V6sRZbd9fx
X-Google-Smtp-Source: APXvYqz5FSh+cmsAN3EuJv0y6STgbeegym7IS4xMQSas+eqw6eJ5nr4zFH09f34imhlX6hfgJph3fA==
X-Received: by 2002:a50:934c:: with SMTP id n12mr45773462eda.12.1568476385634;
        Sat, 14 Sep 2019 08:53:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.44.107] ([185.81.138.18])
        by smtp.gmail.com with ESMTPSA id r18sm6016614edl.6.2019.09.14.08.53.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Sep 2019 08:53:05 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 4/4] elf: move ELF_ARCH definition to
 elf-arch.h
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc: peter.maydell@linaro.org, Riku Voipio <riku.voipio@iki.fi>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20190910193408.28917-1-alex.bennee@linaro.org>
 <20190910193408.28917-5-alex.bennee@linaro.org>
 <CAL1e-=giNc1e+kN04KqHFQGkJbP4BKziQyxVd3-RTtL+UOfSoQ@mail.gmail.com>
 <874l1j18vm.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5880b9c9-969f-fa79-f7f4-a45a6568635e@linaro.org>
Date: Sat, 14 Sep 2019 11:52:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <874l1j18vm.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: LaCLg67I5vcg

On 9/11/19 5:26 AM, Alex Bennée wrote:
> 
> Aleksandar Markovic <aleksandar.m.mail@gmail.com> writes:
> 
>> 10.09.2019. 21.34, "Alex Bennée" <alex.bennee@linaro.org> је написао/ла:
>>>
>>> This is preparatory for plugins which will want to report the
>>> architecture to plugins. Move the ELF_ARCH definition out of the
>>> loader and into its own header.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> --
>>
>> Hi, Alex.
>>
>> I advice some caution here
>> . For example, EM_NANOMIPS, and some other EM_xxx constants are not
>> included in the new header.
> 
> EM_ARCH was never set to EM_NANOMIPS. In fact I can see e_machine is
> checked against it so I guess it is only ever used to checking the
> loading elf directly.
> 
> In fact EM_ARCH is only really the default fallback case for checking
> the elf type if there is not a more "forgiving" check done by arch
> specific code (elf_check_arch). The only other cace is the fallback for
> EM_MACHINE unless PPC does something with it.
> 
>> I am not sure what exactly you want to achieve
>> with this refactoring. But you may miss your goal, since some EM_xxx will
>> be missing from your new header. Is this the right way to achieve what you
>> want, and could you unintentionally introduce bugs? Can you outline in more
>> details your intentions around the new header? Is this refactoring the only
>> way?
> 
> As mentioned in the other reply maybe exposing a value from configure
> into config-target.[mak|h] would be a better approach?

I think using EM_FOO to tell a plugin about the architecture is just going to
be confusing.  As seen here wrt EM_NANOMIPS, but arguably elsewhere with
EM_SPARC vs EM_SPARC64.

You need to decide what it is that you want the plugin to know.  It is just be
gross architecture?  In which case QEMU_ARCH_FOO is probably enough.  Is it the
instruction set currently executing?  In which case neither EM_FOO nor
QEMU_ARCH_FOO is sufficient -- e.g. arm thumb -- and you'll have to invent
something new, because no two architectures handle this in the same way.  The
closest you might be able to get without invention from whole cloth is the
capstone cap_arch+cap_mode values from cc->disas_set_info().  But that only
handles the most popular of targets.

In any case, a single header that every target must touch is the wrong
approach.  If you want to do some cleanup, move these defines into e.g.
linux-user/$TARGET/target_elf.h.  (And I wouldn't bother touching bsd-user in
its current condition.)


r~
