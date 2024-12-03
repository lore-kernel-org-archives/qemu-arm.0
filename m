Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp4001261njk;
        Tue, 3 Dec 2024 12:44:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUaLsqrK/Lc+YoYBHyllUl+6TLYKK3mxSXCvNRLxWCdSqhx3s3++atWIQXjgn1Knl+/zZQVqQnTBs+/NA==@linaro.org
X-Received: by 2002:a05:6a20:a120:b0:1e0:d533:cb2f with SMTP id adf61e73a8af0-1e165411bf1mr5928142637.44.1733258640231;
        Tue, 03 Dec 2024 12:44:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733258640; cv=none;
        d=google.com; s=arc-20240605;
        b=bSl61ykUoGKm08bJZktsmhCsGOfiiyri5skUAOvgtGqSHWdgid/MWk1cm13v7Czx2f
         +pm0fZ0xOrxV5Gk7x/cNgS0Kv2I+S8XzCpozQRwgmKKAr9ErDGgdQwlKxN4VIGhVdNOK
         uNY6QCTM2cWw4Nqq/hRxqViyxasxd0mMr8iXe9K+VIfhejlozdcsLSjOx7yO/Od7wZ/u
         ILJbhnJagoO50QiY4pGEr+4/O55Bj2O7RBIvsMZzo+6opCua+52fJdon5tIMDxZtlOif
         EO6KVVN+ru80H6IRyhdHF/YBNaFxfsj/0JBkszJK+WCXI3A1tLwyHzXEOhg1Z/W4svia
         ZDNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2m6CpvQHO/YDC11hJhBycspt3bWc9KD96XfQ75TSBo0=;
        fh=eNf7GC32KU4xvBKGVoxsEcXa62byOMGleLPQ77zh7lU=;
        b=QiEvsVjPFTRBBdN5bbR7t7ugrZHuhzGgiZwaEErNUjdhHPvbBCJ+hVWGdQsYHDpjan
         ++zYnuz0m9VL1H/eeK8AO1qCSxFqSJDdE5hEUtt5BoJ2iIXBDpF9hg2py3+BOkr/C+6N
         MdNfgevZhsVUzJL916A4V+vAY0ryZbLj6r64fmBvu2IwtWvmVffik5rsqS7DAEIFk4R3
         vjZMRjY5xu3rY2CJPjAR+oOcFyhTcm6RJ6dVsTa7vX46iA7BZkCVQB1ggXBchMdsdyfS
         55ae6SyrDlrnm3u0bX4OKSnbEw1trteaIV5at9oguR810dxm42Lw4jIs6Mpw66wRJnM+
         sKjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ekpVG6az;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7fc9c30fd5bsor8603081a12.4.2024.12.03.12.44.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 03 Dec 2024 12:44:00 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ekpVG6az;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733258640; x=1733863440; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2m6CpvQHO/YDC11hJhBycspt3bWc9KD96XfQ75TSBo0=;
        b=ekpVG6azcYFD7e9VmjJD8oXxvxR+wgX2c2oRXWOmkMs4QZN4Ypw80w/VwLMZYKEeJH
         BC13d/Zqy11Fu3kZY6SIH64aKyb8Yv30BUcT1VAoUr4+TSAKfj136lql1jzDkj0XC9ou
         guO25ux25jgYAfV2QKZP3JTRmKTCSM1e8Fc5Zj0cpDpoqbL8TDW4NdBwPZq3nVFkPZKz
         j9u1RwjK7sLwar6yL9eAYT9XBFR1npVFb3pXVNGsxq8bVrprESOQcS+rGQkJ60qt9mWX
         3J94mAnyPimQev98jQGBIZm64XL4uIVbbOIQm0MfqxTJ2kTgYZyfi5IpnUk4CFsNdiwG
         8tMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733258640; x=1733863440;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2m6CpvQHO/YDC11hJhBycspt3bWc9KD96XfQ75TSBo0=;
        b=AAD56HrhYDW51P7OJMVpY/Tw/u5VmS1ZJAJJY6GlRZae9qGdMuVCoOCKMhyPeshXrw
         gwEbMRICUHxOXVPFkHGxBh8VVkMYKr2O8BX5lJlz3Uky/WrZkF5SXFujeWf6W3QwPgYr
         RB9px1EHpIuedQMBDw2zsqp9NUECxvGlOMzOOFpQy6+63vbDzOTX7WEiPU24wGwxCC4s
         nLhDMgFQdlzbCTwHRHYCKTYg0Lp18ENNtJHBks0JybDYbC4TiPTQ+gakYt57NeT31ZPX
         55RW59nySFQ0ZJHlGPBjb0njVEABs9pU9eJtXdFkvZ9wS8cXJqwwbSRIYJoDBeiiW//7
         1ZAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKZRmZoMPOSTT4yd5DhnW742p9LsBZP8fEg1qucCbAWkxcZIh1OMe4rk8/XzWz310b6nQLy9lXWjrhjA==@linaro.org
X-Gm-Message-State: AOJu0Yz//AIyuEho7RQOtRMmdVDoTFShChoXF8xIQMdKe+jKhXmgAmJ+
	Gxq7SJnoj6xkmb2MmBWKwJDab6JNiY400SlZbCGwhOncdsGa/1UvVBdCOyaRYqhI2Q==
X-Gm-Gg: ASbGncvOFKK8BdehVUbZn7f9c5g5+gXiLL39bD42KRfKv2SPQOD9mCIXmEaro1WPjZH
	K8nyNs2vAB+oo81gHHaiJqJeS8XBzG7YnBed3XT/DeKvV1/oi7br+VfJ2yMxQoCrDoxKdixek6h
	fcvTjvlcmTrrzch/J3jqxKlBeswQEn7p8cdfQrJuRpIog6SXR60j0NAmmGBjUKfyNDVTYnqEZdD
	AueAggSHJ5s0/P5HfEcrFcw8oNT34ycYdV2O6PWn9mju6sNtuKXdpG0MMlqvloVrxEh6ZSpqrNI
	Q+zT8Gv32gr7VbFS1OshlQ==
X-Google-Smtp-Source: AGHT+IG2ETHF5mGEbGuuHv5fovAe2fL+4Jyw1sfOgWoAD7vzLq8AeZOpE/ZVGMcP7mLGDqXHq3168g==
X-Received: by 2002:a05:6a21:9998:b0:1db:e464:7b69 with SMTP id adf61e73a8af0-1e1653c5e66mr5968057637.20.1733258639794;
        Tue, 03 Dec 2024 12:43:59 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7258cbb5e26sm58310b3a.119.2024.12.03.12.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 12:43:59 -0800 (PST)
Message-ID: <d204e918-6847-41f3-8085-72ee1206c066@linaro.org>
Date: Tue, 3 Dec 2024 12:43:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tests/functional/aarch64: add tests for FEAT_RME
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-devel@nongnu.org, marcin.juszkiewicz@linaro.org,
 gustavo.romero@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 mathieu.poirier@linaro.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20241203001741.2068452-1-pierrick.bouvier@linaro.org>
 <20241203155434.GB1903051@myrica>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241203155434.GB1903051@myrica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: OYh9SU5/OFgS

Hi Jean-Philippe,
(adding Daniel and Thomas as well)

On 12/3/24 07:54, Jean-Philippe Brucker wrote:
> On Mon, Dec 02, 2024 at 04:17:41PM -0800, Pierrick Bouvier wrote:
>> This boot an OP-TEE environment, and launch a nested guest VM inside it
>> using the Realms feature. We do it for virt and sbsa-ref platforms.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>
>> -----
>>
>> v2:
>> - move test to its own file
>> - add sbsa test
>> - check output of `cca-workload-attestation report`
>>
>> v3:
>> - build and run test with cca-v4 images
>> - factorize nested guest test between both tests
>> - remove accel tcg option as it is the default when running tests
>> Note: It's a long test and there is a work in progress to understand why
>> debug build is so slow (x12 vs optimized).
> 
> Can the functional tests take as long as we want, or are they regularly
> run by a CI?
> 

It is run by the CI and developers as part of functional tests (make 
check-functional). The shorter the better thus.
Adding more (shorter) tests would be acceptable though, as they can be 
parallelized.

> The `cca-workload-attestation report` command is great for making sure the
> RME feature is working and the guest is running in a Realm, and it's very
> light. In my opinion it's sufficient here.
> 
> We could also run kvm-unit-tests on the host, various VM payloads and
> configs (in particular edk2 boot), and performing local attestation, but
> those would all be testing the other software components, so don't seem
> relevant to this functional test of the QEMU emulator. That said we do
> need regression tests for the whole software stack (including QEMU VMM)
> and this test automation is really convenient so I'd like to extend it
> with extra tests but outside the QEMU codebase.
>

I saw that kvm-unit-tests are mentioned in our documentation, but I'm 
not sure if we have any functional test image running them.

I'm not familiar enough with this topic to know what would be the value 
to add such tests, or edk2 boot.
That said, if we can have extra (short) tests upstream, I don't think it 
would hurt anyone.

For your need when working on an RME stack, it may be easier to keep 
those specific tests on your side.

Someone on this thread will probably have a better answer than mine :).

> Thanks,
> Jean
>
