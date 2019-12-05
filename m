Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2526441lff;
        Thu, 5 Dec 2019 11:36:30 -0800 (PST)
X-Received: by 2002:a17:90a:a416:: with SMTP id y22mr11359115pjp.114.1575574590060;
        Thu, 05 Dec 2019 11:36:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575574590; cv=none;
        d=google.com; s=arc-20160816;
        b=mP17adob/9s25JZhboSnAJue1DveW3x3gSVoxPg5/a6TeJIWNzbnqAdMJWvewegLrf
         CS+KSgwy6Un6xY6Jw7D57/k6suXOWX4wHgW4krfOBytQVVWXnfJEJENUF/HlIrP3qzhx
         UpJCPnUDIRkyClfU0eHLmrUlwYdryndaYpWSRhWVYGq3DnURG6wbmwzYgjDUwzZAV/vT
         71y6wd+oC3IsHajWOuEd1QaFZ6GMIvt0POOVwQTVL61hheeogf4lMR32fHZq4+50FNg0
         K2F5DwMIqSXy/V7Bp2DxVmPDVf88vJiPk3sdKK+YLoMlW5uqQjaUv84pJLrdGlSVITaN
         TDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=+wif4h4CRxcxxjYAPak4RRxF1JnlVEgWYO5ih4Y0pfY=;
        b=UPWMwaec4MwJgdBbVjHcacxMKrWiiMIYLsbsyC5PVnMvejBwhnyyVS0ARnYNP2qEX1
         8zHTUt8bDfvMLYkZPzLWi02XiHrEYZBEQUFSc8zrZ8NBRuWCyES6RO6tOd62GQz43Xm6
         2iA5hkHL1wKoqgTzAHt6oxCbAhijLoUtk5YnhXKUp0tiwT3rQzV8Vi2gfr7Hk+p+0Bih
         iVrbu++ucjK2ahDoRZwkgbJ9tKlqknozkUNewjPq745Y5rZDEG2YOgDjRku6/d2FNmAP
         /NJL6F1GpaH2AnyqwONX4fu77P9UWAowDo/YDCGXR3R+eNBJP6oPvjGPCCWGmGs7WF4m
         GXzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SqUaMfXF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f8sor10446777pgg.26.2019.12.05.11.36.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Dec 2019 11:36:30 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SqUaMfXF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+wif4h4CRxcxxjYAPak4RRxF1JnlVEgWYO5ih4Y0pfY=;
        b=SqUaMfXFSihNvxOnqqn7pBDj/km17ZmaTt2ghEyxmNKVReuGMXYwRwFbm7AF+Tfm2S
         OQX2YmzuBWoZoOgGvqlZXaaUyv4IWDvSX8GhvCTLbxqGUE+O7i+MRABgkBLJadN/xzNB
         VIui/zF5+z5N9+yG+x9usNyvNCTwdLX26TTyf2KixlqQa8Zjy6CTnr3fphZ6vF+3N+zs
         SrTbzJsdqyc8sczMRWBsh5fFRKQFqwxW1jRROEeR/vNFnc6Sd0k8kQlqoWfP/a18Hqrf
         upqqdOzQ0i7XcTsYmrWjIQ8cfXoMl5NE3yniNLYfECx2C6EOM1PCTTOCfDTVH5G6r0Hj
         yUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+wif4h4CRxcxxjYAPak4RRxF1JnlVEgWYO5ih4Y0pfY=;
        b=mPclOWV0wTRNkGk6VkuJIcOduHTodSCQG9sMowz1Xx8sP1WLjhq+7neNRUgcEM8Zrv
         un02r+6esGyyRxASNiLR/4PMSNtoO92fnRVzifQXL/91VG0GbZ5AaCla/MTD5hKZmp70
         svhrK5qgy7gImDEwaJyCQ1QMMTQ1E+8TACuB0g0kHwhjaf9W40/tAqid4zDbnz+AFqUY
         /gvDlf+Cvd3pioyl1dBK1eC4gDfHrGOQ+tQC+YFWZeHwQSFwl2r0TslsTYjfRwYaTQHH
         hLtDC5ncsXhWimfbrZ/Ix1z0gCCcn1nf0mBqFnjL/0xm2XeC7dlr044Ja9iwKTkdU1Af
         jGDg==
X-Gm-Message-State: APjAAAUTnTvNp8U/qo1pVunECoy+GJuyL4Hb29n9uNuKJxyFrXLwmtsH
	3SYP+Aj/xa6Zvfac+6uUDkDi5yIk
X-Google-Smtp-Source: APXvYqyEQ8RZvjSBrBG4nwRogjPgebId2z/n0JyheG+9wEeMCqNdh8TPoFdVtVUThjYW4+VDiqITSQ==
X-Received: by 2002:a63:2acc:: with SMTP id q195mr10878365pgq.26.1575574589524;
        Thu, 05 Dec 2019 11:36:29 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id h3sm12499284pgr.81.2019.12.05.11.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2019 11:36:28 -0800 (PST)
Subject: Re: [PATCH v2 11/14] target/arm: default SVE length to 64 bytes for
 linux-user
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20191130084602.10818-1-alex.bennee@linaro.org>
 <20191130084602.10818-12-alex.bennee@linaro.org>
 <9362663d-6452-39aa-2a8d-1cfd853d7faa@linaro.org> <87o8wm7k6v.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cc54dbf6-01ed-f92d-5088-efe7e917b870@linaro.org>
Date: Thu, 5 Dec 2019 11:36:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <87o8wm7k6v.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 7ZTlRCZvbVoe

On 12/5/19 9:31 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 11/30/19 8:45 AM, Alex Bennée wrote:
>>> The Linux kernel chooses the default of 64 bytes for SVE registers on
>>> the basis that it is the largest size that won't grow the signal
>>> frame. When debugging larger sizes are also unwieldy in gdb as each
>>> zreg will take over a page of terminal to display.
>>>
>>> The user can of course always specify a larger size with the
>>> sve-max-vq property on the command line:
>>>
>>>   -cpu max,sve-max-vq=16
>>>
>>> This should not make any difference to SVE enabled software as the SVE
>>> is of course vector length agnostic.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>  target/arm/cpu64.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>
>> 6 is the largest size that doesn't grow the signal frame.
>> I imagine 4 was chosen because that's the only real hw atm.
>>
>>> +        /* Default sve-max-vq to a reasonable numer */
>>> +        cpu->sve_max_vq = 4;
>>
>> I also agree that we should match the kernel, but this is not the right way.
>> Changing max vq is not the same as changing the default vq.
>>
>> You should change the value of env->vfp.zcr_el[1] in arm_cpu_reset(), and the
>> user can increase the length with prctl(2) as they would be able to on real
>> hardware that would have support for longer vector lengths.
> 
> No the intention is to default to a lower max VQ because...
> 
>> Also, I don't think you should mix this up with gdb stuff.
> 
> it is what we use for sizing the registers for the gdbstub. The other
> option would be to use the effective zcr_el1 value at the time of the
> gdbstub connecting but then things will go horribly wrong if the user
> execute a prctl and widens their size.

Why would you care about the size of the registers as passed by default?  You
shouldn't need or want to change that default to make gdbstub work.

The gdbstub should be passing along the vq value (via the "vg" pseudo-register,
iirc), and gdb should be working out what to display based on that.

If that isn't happening, and you are only changing the default so that gdb
quits displaying massive registers when they aren't in use, then you're doing
something wrong with gdb and gdbstub.


r~
