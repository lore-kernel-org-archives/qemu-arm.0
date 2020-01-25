Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2020365lfp;
        Sat, 25 Jan 2020 10:38:26 -0800 (PST)
X-Received: by 2002:adf:f605:: with SMTP id t5mr11075245wrp.282.1579977506801;
        Sat, 25 Jan 2020 10:38:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579977506; cv=none;
        d=google.com; s=arc-20160816;
        b=hzF3j+aQ5AzOoJecdiEJpOKvVf6It/VNa92L276dOhQqH6uZjuD2oz3FCh5vHZqvek
         fZTYhhXGakZ+phRNjOv8cxNVSb9HBGUO4dPkk7EtQ8WMZolSOiaHGlvrVC+PZIDOLXXC
         EfxxnfoTTDPZPG6rSqvwMPSLkPFcnlbrEio04URdmXB5XJdQnH1NrzHlWRETo/hI2Df0
         QCbno3I+T+C4NKg7zmc1s2o2eJv3/6cNvsrQOl2lirPS/B45gXg+K9/fh/Y4/RzuPFBG
         XqfyjHs7ora2JToSIb0YA0Q05bzu6BqafA9P9IEGCbMzGeGY2CbVlhKAmqGQMjMbZuxZ
         LRAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :sender:dkim-signature;
        bh=8GIFXBe0JSd/fyILjKjL55XGjg+TuGX/sPNd+9vQIgI=;
        b=0fl+ff9mlMfnfD/6FDyb1Svj3TMEswXbqyWvUVKFTC2/55kkq/O7gGaRb1irRdII3g
         gepwf8Jai2kZOJTBnIqL/zE4dSU5Ytf5BZ3ZtnOaJgiUMV3IZBSf6dzsNVDXB/J2CZER
         elmtEW7N1Aef75MuBT9v8bHnWlR6Z4I8ALLQrHHsZc8skzUHWi0pyxL+TnEnZ+VaqyrE
         2ZPEOc6ayRLHlG8iC9TcETh+81GRBbLiHKnRrHbZEqCKp70rRKmuEdHch0a1WAQYXekN
         TdbyTm+PB9xgsedH+jPzmqi/OVrwTgDWvZQLjm5ZHkCMgZDcrM20YDMlut95XDgu4lab
         hr/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=i7wtN1Ec;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x7sor1446111wmk.18.2020.01.25.10.38.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 25 Jan 2020 10:38:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=i7wtN1Ec;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8GIFXBe0JSd/fyILjKjL55XGjg+TuGX/sPNd+9vQIgI=;
        b=i7wtN1EcP412gXG3IKHkWZFji/yK1v0HjTL1gWvfOWTmEJAKAsdELZRJ9Qs3V180ke
         uK7yvaFfJ+K9p4Z1Y6IpCUdNiqh1/e1aXyPk+QA2sYcMHex4aN7c4bZZw1pSLMmy0BA1
         D0HzDy02iDDMjBg6PUZNdlI6GMOjYyHbg5DyWARAmvc8iOW205nYZhSIV3fipt6wEjBQ
         1uQs1Ux2IHo1p0qWiaPPKG3KECWssOkw7qU1Bt/GuHTJSHkrfgptdQelfbLHE0P1DdE5
         R/YJ4crxL7Hzv9gpnVKaAHk3PiWF9LBNFmN3yr19u7xobtCOCqKh79ujw6WcwsBd2mUK
         MEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=8GIFXBe0JSd/fyILjKjL55XGjg+TuGX/sPNd+9vQIgI=;
        b=nRd+V65KBYAubzmS0By6dUC5/cWaGEL10eQkv+aeWfDkg5VGKS2ajPItjzj3ZFtjPh
         Pk8z1RcEnPsNA6yZEldB0tbOy6S600aOezYUzOqzsqkll0BphXyWZCA0mWpT57Q+kQm5
         VvfPJf0TcNRSSOyvwUMwEyIWQmnpk3MaJelARJpOMI/6TteYMDLmZR+klUIfPyv+Yd70
         jjXjka0aCEmN/j7nOOU087tnmksniSxmhjj+VIdzVls0R5mvLaTTu2XutkCwbYaH/VVT
         pjpHz+Snf/vJ4GBBZ01S7X8m8T/FTqzb5egqrl7mc6C/Db8wFhNqsBBXnEYTO4gGC9D7
         lh2Q==
X-Gm-Message-State: APjAAAWXyTQXuLkcSILWY+7TO9yewSgnk+X43LHZ8pm3mSNcmKkK/giM
	kqa8s3FDZ0ZDtpz63b7ldJU=
X-Google-Smtp-Source: APXvYqw34vGwbDFx+Rh/8c6pIf5WfyKfaP8vaENi9d7xJ/3o3CKAdtsiiDnxGRfLYVVrx/ELD5Zang==
X-Received: by 2002:a1c:ddd6:: with SMTP id u205mr4860000wmg.151.1579977506480;
        Sat, 25 Jan 2020 10:38:26 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id d8sm12970419wre.13.2020.01.25.10.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2020 10:38:25 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH] tests/acceptance: Add boot tests for some of the QEMU
 advent calendar images
To: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>
References: <20200124170325.30072-1-thuth@redhat.com>
 <8f085a1a-b9df-29d4-db51-eb345a44a971@redhat.com>
 <1f564925-2ee1-ab17-a946-f9bcd656926f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <4d5fe645-0652-893f-4e6b-2929849d3cdc@amsat.org>
Date: Sat, 25 Jan 2020 19:38:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1f564925-2ee1-ab17-a946-f9bcd656926f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: hAriXS3FOAye

On 1/25/20 5:43 PM, Thomas Huth wrote:
> On 24/01/2020 22.28, Wainer dos Santos Moschetta wrote:
>>
>> On 1/24/20 3:03 PM, Thomas Huth wrote:
>>> The 2018 edition of the QEMU advent calendar 2018 featured Linux images
>>> for various non-x86 machines. We can use them for a boot tests in our
>>> acceptance test suite.

Excellent idea!

>>>
>>> Let's also make sure that we build the corresponding machines in Travis,
>>> and while we're there, drop the superfluous --python parameter (python3
>>> is now the only supported version anyway).

I'd rather see this change as another commit.

>>
>> Yes, please, removal of --python was in my wish list.
>>
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   .travis.yml                            |  2 +-
>>>   tests/acceptance/boot_linux_console.py | 96 ++++++++++++++++++++++++++
>>>   2 files changed, 97 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/.travis.yml b/.travis.yml
>>> index 6c1038a0f1..73ca12c921 100644
>>> --- a/.travis.yml
>>> +++ b/.travis.yml
>>> @@ -268,7 +268,7 @@ matrix:
>>>         # Acceptance (Functional) tests
>>>       - env:
>>> -        - CONFIG="--python=/usr/bin/python3
>>> --target-list=x86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc-softmmu,ppc64-softmmu,m68k-softmmu,sparc-softmmu"
>>>
>>> +        -
>>> CONFIG="--target-list=aarch64-softmmu,alpha-softmmu,arm-softmmu,m68k-softmmu,microblaze-softmmu,mips-softmmu,mips64el-softmmu,nios2-softmmu,or1k-softmmu,ppc-softmmu,ppc64-softmmu,s390x-softmmu,sparc-softmmu,x86_64-softmmu,xtensa-softmmu"
>>>
>>
>>
>> Perhaps use MAIN_SOFTMMU_TARGETS in only append the other targets, like:
>>
>> --target-list=${MAIN_SOFTMMU_TARGETS},alpha-softmmu,sparc-softmmu,....
> 
> Not sure ... while it is a nice way to shorten the line here, it adds a
> dependecy to that variable ... and MAIN_SOFTMMU_TARGETS has been changed
> a couple of times during the course of time, so we might risk to lose
> some testing coverage here in case someone removes a target from
> MAIN_SOFTMMU_TARGETS but forgets to add it here again...? I think we
> should better use the explicit list here instead.

Maybe related: "Split enterprise vs. hobbyist acceptance test job"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg644683.html

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
