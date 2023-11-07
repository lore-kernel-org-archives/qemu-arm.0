Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp281684ejv;
        Tue, 7 Nov 2023 04:41:47 -0800 (PST)
X-Received: by 2002:a17:907:1c0c:b0:9c7:59d1:b2c6 with SMTP id nc12-20020a1709071c0c00b009c759d1b2c6mr19065624ejc.11.1699360906728;
        Tue, 07 Nov 2023 04:41:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699360906; cv=none;
        d=google.com; s=arc-20160816;
        b=Wmj40NIRMGSzfg9YrrvLGt0NOK52BSwmAlB7jm23euGxXCt9xSmsASirwCfu4BGtVz
         hQ/CXQuUSC+QNSs0eKxQsthd0RbOXxiG5MLuSiFFHXmxGpI1/hUOM6EgVAR+3hACasqg
         a9jeeqskDDpQmeA2vGyXpTbl2Ay3C2QV/Au7uIdjiCUJAd/3FBSoKuHVsWx+sMCZJfY5
         vXlru4zYmQY/4Alb4wmiMDC4mW9t/+62/mwtcmPHIKE58xArd752Oj2zyiw/UIRAQ+uS
         MuNMcx5N2c11n7Q/vX09tbsCX/0FfG3JNJ3ewt+OkOs7HBxPTeS/Q8MPmWvKBgL6edMz
         SgfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tAoZibYEe4Ru+I+aeFdl+94OXUU0LwHizg/8NDWLrTE=;
        fh=815NqEkMWlMTdb8GLJNTrLppWR8KF0BSEtK47yLmKsk=;
        b=d6P9RiFDKNzQ3bq295j5Yp/Tq1t7rh+bm7LZ4VSKselArS+r70kfjM7RpGjtZ3ngTi
         mhsLfrdxxp/+XwaD9duYs3uEz73L+o9dj5nKAd5ONriMmexzKXapAW8ZPZN9fcK1I0+3
         HluIfPwzNeeXjA+oPCHJaULEzm5E3B4izGc3BnnuUdOsSS6rMapbkAFMcDdwkD/5cxOu
         lz18QdZmSkCYvr54hAuqinWIucdzWHChejObagazvgcyraOcCW6C6sGrJLkUtI1JeOgq
         wRkjMg5AQ2iO1UdKYVQN9b8zfenjiISO+Tn3ZubOig5zlDMOdfm4HxIs/8IN6Z3vR2pU
         zrbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ifKCDLYf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 21-20020a170906101500b009b65592e3bfsor798389ejm.17.2023.11.07.04.41.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Nov 2023 04:41:46 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ifKCDLYf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699360906; x=1699965706; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tAoZibYEe4Ru+I+aeFdl+94OXUU0LwHizg/8NDWLrTE=;
        b=ifKCDLYf8dTfnLl+4b0fmKCsegsEXaCDrwFKxOXWZvlQIG8/q/3/GrEIWmvHuU0YL8
         pkFcgrVrZNY0iYrcSwg40Nrg1BC6r9sh9BJDYDSmJZnHCf6bKCCqq5t2FPulFIrgxaJG
         LvAsZTOP6ZdjxUwp4NxflswWl9RwjJ0CIF2CcSpcYnpV86LNdq+OQu1o79s1YIlmOI/6
         maF0EPVNSR+aMDogRA14FtgzPvHcgRqlXVzNy/G3u6WYPl848RdLu4eniIwwg3lge5KM
         u9NFKa+hNER/pT//ULtwtgXrBfUuhk7QNSTcwTUXK/6KYRCoJiS73pPtRH7FFlnP/PpQ
         WBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699360906; x=1699965706;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAoZibYEe4Ru+I+aeFdl+94OXUU0LwHizg/8NDWLrTE=;
        b=eoyESrDybA0HjhswgjeVCluIBgPZolh0zr7P1DkPk20lKRRbLSCoBlHmL2ZgaSCbOJ
         tMz51B8AJiI06f6qynhA4Sc7SKpeYwj6lpn9baJ0CGdZvnZb/nnn6lcIgmW5vjAsxjmN
         Hr09IFTGsTnUeTTswOJAeu9QSjgnX03mEJIUqPIpPuNl3VCIytI0zq3NP2U91ikgPQl3
         3Xb6naGSU524B4gHE35dq5Zkckrs3fehT9T1E9dhZkRf2CyncMlU/VjLXCtzE+lDCo2M
         wjsJCl3HVfgFV6vgGBVCiZDf2dJNSefpCJNMfyY3kg+W7x8LpqqrgDRwEvzxOd/c9yZ8
         Lr5g==
X-Gm-Message-State: AOJu0YzEo2bQuLuK6et7SEhQsLewAm6cj/fHWBqUYMlytsl3jch/FSI6
	23hMjoE5T0V8+y3wZnPubt4VpQEEyecwfktsYJf53w==
X-Google-Smtp-Source: AGHT+IFJZb7nQSTx55m/1srg1ujgFK/fTE8UpyP7djFlxvda2wBfhwTRcotViXwPYZUXpL09apNzgQ==
X-Received: by 2002:a17:907:a44:b0:9e0:8782:fb98 with SMTP id be4-20020a1709070a4400b009e08782fb98mr4811812ejc.32.1699360906004;
        Tue, 07 Nov 2023 04:41:46 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.216.69])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15733671wmr.14.2023.11.07.04.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 04:41:45 -0800 (PST)
Message-ID: <556909c8-4beb-4e8d-972f-55c075d7fdaa@linaro.org>
Date: Tue, 7 Nov 2023 13:41:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/22] gdbstub: Add num_regs member to GDBFeature
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Richard Henderson
 <richard.henderson@linaro.org>, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
 <20231106185112.2755262-9-alex.bennee@linaro.org>
 <3bf96059-44a8-4af3-9b0b-c9f070cd498b@linaro.org>
 <878r797te4.fsf@draig.linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <878r797te4.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /cOIkAqiqQlh

On 7/11/23 11:24, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Hi Alex,
>>
>> On 6/11/23 19:50, Alex Bennée wrote:
>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> Currently the number of registers exposed to GDB is written as magic
>>> numbers in code. Derive the number of registers GDB actually see from
>>> XML files to replace the magic numbers in code later.
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>> Message-Id: <20231025093128.33116-2-akihiko.odaki@daynix.com>
>>
>> Something in your workflow is odd, you should keep this Message-Id,
>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Message-Id: <20231103195956.1998255-9-alex.bennee@linaro.org>
>>
>> and not propagate this one, IMO.
> 
> Why not - it tracks all the review stuff. I explicitly keep on
> Message-Id per domain so we see the original posting and the last time
> it was posted (which you can then follow the chain of reviews from
> there).
> 
> If we want to have an explicit policy on which Message-Id's to keep then
> we should document it.

Fair enough :)
