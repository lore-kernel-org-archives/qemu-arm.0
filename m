Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp1332381njb;
        Fri, 2 Aug 2024 06:14:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1JCxsS+ppRwmbc5dI9gVm5ZafezYgyaVIUMF/b6eE3UNKeylIW2avL6KCTMo2en5CmWkyHvN1LAKK9GB1rUh1P/6vNScg
X-Received: by 2002:a05:600c:444e:b0:428:e866:3933 with SMTP id 5b1f17b1804b1-428e8663e2cmr17892095e9.22.1722604483516;
        Fri, 02 Aug 2024 06:14:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722604483; cv=none;
        d=google.com; s=arc-20160816;
        b=odjno+zd1npdykeUK4gux8pLJbvCSqPny5MM3WEFZRqAcrb7yOFaWLO5IDcY5+/diW
         kv4NpveKUTRLp+mZ0KSzgAuym1rsBv5ryDibv3sIwT7X0+diHq9CGW16zYYZpUXLg9S7
         pKVWt7Fn74ZEkqIo6teqU8uaLnBJ5ltERvF5ccHE+Y9JRtsvU1t3eeQWy2u+K3fIY+2X
         d9dUT5VztBOhaOZi+Rc4xao6jHT2Wu4e5sfHMWoYfIDfSm9wUlzl8LYjX4XB5j/7o//B
         4GAcQARGnHtGFLHw3A16J/o/j++OEF9bsZH1WfB75HABOdF6dFnmoQMrsdSqh+RCXcOB
         aqJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=f3Ig9qrNqS796eTen6yC/TdSkvMI/5+1PaGFCTS3GZw=;
        fh=7b4fPmxBRgkobmMXvDRmFXyCgN88ziPAuqtIX//Sf6I=;
        b=I3VKGVh0vNKSjitDcvkFYkMpXr/AVQCgepUFIOn/rrSbfvS54AGPt1W71NspWGdfKA
         s9rAGvsAmc6kkOskcsVRqgaMw4SnFdVf3Fp1iz03TF1DDswPY/8EhOK7bhiESqR9Gnqp
         0zTUJ6V5PC1ABNOUGluAyTqz5+Rzvii2qTcAup22wX6umReBzzBB3tVMG8Qb8fu33FmE
         ei2syRkgx0RXiWkbxt6hmB+rxZY4dC3HU1xiHulY/+ApA38MR1nUO6Skid+f35pcCAGX
         bSwCvUPSzRiKmVt/qQMaEfCIEEJXrWnfKMPrm0Jknuwi/i8fbKGBFJzXo1WOxMh81vd8
         0r2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SZDwU70o;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-428e7349c5fsor4649135e9.0.2024.08.02.06.14.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 Aug 2024 06:14:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SZDwU70o;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722604483; x=1723209283; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f3Ig9qrNqS796eTen6yC/TdSkvMI/5+1PaGFCTS3GZw=;
        b=SZDwU70o3WDW885gflkB4ZAlove/AAnbHdlQCq3pTDOdJ2kutK5j/AWDbF/OaQdc8b
         fUBVI//DM7EwuA6QOGRpequ3FoJlCvXmoYPfyxW4zyV6hBWRu0LkbgL0XMDtxFZ+wLAG
         8wPzlWqZ/P6hnzHrOos2gGmxT0xr2r7WIsMbtNmv+lvQIGLcT6qFjvHsPhe6XtpNbvcQ
         bajp2YkTqXP11yF6VKFO5YrP036hljdFkUIaGOouyBdYfifocoJsCahZN4aocbS7/y+0
         taEnoj4adXmFQERS8qVhZqBqHWePyg7PBum4oUSlKoIndH5lqRdFKuIPaRTh9slxCp9u
         dLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722604483; x=1723209283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f3Ig9qrNqS796eTen6yC/TdSkvMI/5+1PaGFCTS3GZw=;
        b=ULKFDi+XiqjQt1BVM6oEnIpaQVZXQ/6pDC5WuvoZxvQik4jL27TwR4YqrK85OBsnRT
         pPyNaRCoo4T+C8JLrLi4NryqJOCzBtTWAVCC9PGsMxc0j+ZJ5++IxC+zoeEtM5f2c9Ib
         r0YYx9zPtR+6T1LrLlNvYG+wsR22qY9itwiAJCBlik0DGRfLPAGDO4cFZ8mZ85Ye76JO
         7ASSgKfl4aT72vzoIcXmzEITuh7DtJ2zRzNhknYabsrsEL37UbRMDbMSsydXBCodh8K1
         OR9Fkh76zFMSwC7XTTgkHs69uRuUHwpZZRhnjIkBH1ruYIuFLLmtKSBOF4tq8Sx0TgFA
         CTPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbn7DlrnjWdeIMa1uDagLE3v4B27z+jf/EHrFzbQaVqMhINLbqDyXEy4YYkO3q9gcR5o0ELvu0ijvqiv0mbuLVCWpliquI
X-Gm-Message-State: AOJu0YzCOhJB7cz6J3Rjyy1+FDsULtrtbK1QBlCJfrM5kA+nKMlho5pc
	fOAaSK1bqnOaglqYFB2DDnaCkN+jBpl3O8a0nNQPe/wsjHE9XLHWOdVCThyYLmedQQ==
X-Google-Smtp-Source: AGHT+IFJ5Jrfc3nemcN+4XkWnV3Ou5dWwp24s/GYXu+YmOcgrmVE6SAsu4lL4UQAOfp1KYf9z5Vqvw==
X-Received: by 2002:a05:600c:4f8d:b0:427:b995:5bd0 with SMTP id 5b1f17b1804b1-428e6b7c5a4mr23302515e9.23.1722604482796;
        Fri, 02 Aug 2024 06:14:42 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.211.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e11356sm32059165e9.19.2024.08.02.06.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Aug 2024 06:14:41 -0700 (PDT)
Message-ID: <6874940a-8a89-476d-a8ac-b6622aafe7c6@linaro.org>
Date: Fri, 2 Aug 2024 15:14:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] tests/avocado/kvm_xen_guest.py: cope with asset RW
 requirements
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>
References: <20231208190911.102879-1-crosa@redhat.com>
 <20231208190911.102879-7-crosa@redhat.com>
 <20efca0c-982c-4962-8e0c-ea4959557a5e@linaro.org>
 <CA+bd_6K5S9yrD6hsBsTmW4+eJpPsquE8Ud9eHZzptUwDrHcpeQ@mail.gmail.com>
 <a3b0ebf6-47ca-4aad-9489-16458ffd6ff3@linaro.org>
 <CA+bd_6LmuOdQ8ZdLjwt+MCusjQ8ROv23d9PXoF-Ku3j4j73wsg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CA+bd_6LmuOdQ8ZdLjwt+MCusjQ8ROv23d9PXoF-Ku3j4j73wsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EfwjVtfYK+Uc

On 1/8/24 17:17, Cleber Rosa wrote:
> On Thu, Aug 1, 2024 at 8:57 AM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>> I agree those files should not be modified, but I wonder if you
>>> thought about any solution to this? Given that the same user writes
>>> (downloads) those files, do you think setting file permissions between
>>> the download and the use of the files should be done?
>>
>> We want to share a cachedir on development hosts with multiple
>> developers. OK to alter a downloaded file before adding it to
>> the cache; but then once a file is added/hashed it shouldn't be
>> modified IMO.
>>
> 
> I was asking more in terms of what to do before/after the test.  When
> it comes to this type of setup, Avocado's cache was designed to
> support this use case.  You can provide multiple cache dirs in the
> configuration, and some (the first ones, ideally) can be RO (life NFS
> mounts).
> 
> But this is hardly something that can be configured without proper
> user input, so this is not present in the generic "make
> check-avocado".
> 
>> So far this directory is group=RW but we like the ability to track
>> a read-only directory (like owned by a particular user) and adding
>> missing assets to current user cachedir, to avoid duplication of
>> files and waste of network transfer.
>>
> 
> That can be done in avocado.conf, something like:
> 
> [datadir.paths]
> cache_dirs = ['/path/that/is/ro/because/owned/by/someone/else',
> '/home/cleber/avocado/data/cache']
> 
> The asset library will take care of trying to find assets in the RO
> directories, while writing to the RW ones.

Great, thanks!
