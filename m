Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp522537ejb;
        Wed, 7 Jun 2023 14:03:53 -0700 (PDT)
X-Received: by 2002:a7b:cb96:0:b0:3f7:e818:3a6c with SMTP id m22-20020a7bcb96000000b003f7e8183a6cmr149350wmi.5.1686171833842;
        Wed, 07 Jun 2023 14:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686171833; cv=none;
        d=google.com; s=arc-20160816;
        b=a/2Iiko/NrTqEDAuYs3OD0DPTryiTKJVk0QxwL/d05BbeHSnCJ0m+EhVEyeK4ZNFWd
         LgSvGQ07dPbNzRALaeSgvfB7S8KFZ9Bui4aFTYvZMvG3NHIMV8CWB8Z03MQiSVs9bFKK
         BOJ+onscwjutj+s14h9oPs6IqCxBUOrh7WCXUHgqtjfUtdShGaOeIhJ04yRjbL3IgcaA
         1CLqULDHLaMTCVOYcCQcD2zgIBjsTjD/PmWMsTEhyN2TkufprvHtgQ2oVf8lYY9S8obq
         SE4QYlzGf9OvKcF0S2nEOBnaElswvKKq6pG1EV7x4qBJWsmw8cOnTWGJU8CZrNBFp480
         RfYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4VuzHqF/JgnVuuww4s0SJArrcUABjRCgbQR1faNyZFc=;
        b=xiABOYgh/5vQdm4sSD49W4N1YpO7izGifyU1dc8yxdfvErqi9tyKKbfKdgDfSlJWzx
         SUopzk7sy3rG51kGFB1PklvukR6TMNoFLm+8l4sr7k/aIHEuHdRZJZcdqpk/RFs0rpyq
         rOmYBR+2uRF3SzgbpKpyphlLx1XFf5dLdMIuPolyxNYiQndzuBK7ISPHsK+mkII3tu5i
         4D9/kDUaTNK/SRuHhsz+U7nsJq66kAV+UBWL26hr1f4efzdlCKvppsvzDYsPbjKs9ay9
         7Mz5P9kw9fWzICn+Tl0HFr/lYv9uRlzsqai18GhTKIFCwtxLQPUTe2ehirofIaPGMPf6
         RQHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XdJsfHXb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y12-20020a1c4b0c000000b003f7f58457acsor289278wma.3.2023.06.07.14.03.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 Jun 2023 14:03:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XdJsfHXb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686171833; x=1688763833;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4VuzHqF/JgnVuuww4s0SJArrcUABjRCgbQR1faNyZFc=;
        b=XdJsfHXbIvMLQk4pOa0u+KdeR5mBS4kmg/htMpzy2raKTfri55IgLUBJl4OAqs8hbm
         jIBEGDuW6x/6AgPnjYZRbyrgLD7fhy2Er3WIecLHjqWCMevBriagd2zAJNHYFvx9TbZ5
         zkM+CM4eWKF0BgKLcnJBmw8O0OZxbJqDYJfurrjVNxFBlExznNFLZRhkVMVw6KfKhJUw
         nm1KUwZwgmDloR4jV9YBpp7oM532Moi3RYGukY04jH8dfDhBU2lN52N85UbWzY3+B+Dl
         seZqvTbfcsiWFIutowpJpAh0GfGtdOJ7Y5CxYYh3DtrtxXpRz5dagQ2Uu8lNZq+8rfHK
         dVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686171833; x=1688763833;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4VuzHqF/JgnVuuww4s0SJArrcUABjRCgbQR1faNyZFc=;
        b=A65yG8PZnT1Y7Yj69t8NPGDGiWiJuFN39NAOIHtcK6Ms5QxtSTfmHHWT1jnGQr8OG5
         z2ktYRAZwvwP9AFVOMgavmMJu4MpXTIK1yeQZZnVzSHYzfth/vIjGf/T7jVbekD9m11c
         4IvE0DiNcK6v8tMG5nY6sqILjl/SW7KcVXv3SOFBJn/v32GlE6AeKXnOIxjw1lsAT4Io
         5EIl91pJaLS1THfpS2ZDoDdnbkbDzYvi70yt50dmHENASFPiD0ffp2uAFYMiInPFp+HL
         aJM+100swBFR+s0MC5GR+IhdEddWHGmFN6+mEamhVoQ8MBwY9u1EDkRjPiKQAo7mDwxv
         /7+g==
X-Gm-Message-State: AC+VfDyCYCH9albUNYBN7tDNXGG9mLqAm5yrRNkQYE4wnQd+yxkrlD67
	8YaKYrcjXfl9OmGo0rEkGWPbsZmz
X-Google-Smtp-Source: ACHHUZ5l32jJkwhuTlTJq1ZMPXAiCCvuf6zs6N6kj0RA7kVN+CC4p0F16H5GDpkfV4c58/4mjJ+54w==
X-Received: by 2002:a1c:6a15:0:b0:3f7:367a:bd28 with SMTP id f21-20020a1c6a15000000b003f7367abd28mr150124wmc.4.1686171833201;
        Wed, 07 Jun 2023 14:03:53 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (bd137-h02-176-184-46-52.dsl.sta.abo.bbox.fr. [176.184.46.52])
        by smtp.gmail.com with ESMTPSA id c23-20020a05600c0ad700b003f7f1466203sm3062975wmr.34.2023.06.07.14.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 14:03:52 -0700 (PDT)
Message-ID: <579fb938-dc8a-5f85-143f-644ba1f1db40@linaro.org>
Date: Wed, 7 Jun 2023 23:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 1/1] tests/avocado: update firmware to enable sbsa-ref/max
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20230530152240.79160-1-marcin.juszkiewicz@linaro.org>
 <ab3d3d19-2604-c519-03b0-af3952fb7718@linaro.org>
 <50e8f35d-855b-4d0a-abdd-2aa42599bd65@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <50e8f35d-855b-4d0a-abdd-2aa42599bd65@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: tsCUt0A6m8Pw

On 7/6/23 17:29, Marcin Juszkiewicz wrote:
> W dniu 7.06.2023 o 16:33, Philippe Mathieu-Daudé pisze:
>> On 30/5/23 17:22, Marcin Juszkiewicz wrote:
>>> Update prebuilt firmware images to have TF-A with FEAT_FGT support
>>> enabled. This allowed us to enable test for "max" cpu in sbsa-ref
>>> machine.
>>>
>>> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>>> ---
>>>   tests/avocado/machine_aarch64_sbsaref.py | 22 +++++++++++-----------
>>>   1 file changed, 11 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/tests/avocado/machine_aarch64_sbsaref.py 
>>> b/tests/avocado/machine_aarch64_sbsaref.py
>>> index 0a79fa7ab6..35f8042416 100644
>>> --- a/tests/avocado/machine_aarch64_sbsaref.py
>>> +++ b/tests/avocado/machine_aarch64_sbsaref.py
>>> @@ -29,23 +29,23 @@ def fetch_firmware(self):
>>>           """
>>>           Flash volumes generated using:
>>> -        - Fedora GNU Toolchain version 12.2.1 20220819 (Red Hat 
>>> Cross 12.2.1-2)
>>> +        - Fedora GNU Toolchain version 13.1.1 20230511 (Red Hat 
>>> 13.1.1-2)
>>>           - Trusted Firmware-A
>>> - https://github.com/ARM-software/arm-trusted-firmware/tree/5fdb2e54
>>> + https://github.com/ARM-software/arm-trusted-firmware/tree/c0d8ee38
>>>           - Tianocore EDK II
>>> -          https://github.com/tianocore/edk2/tree/494127613b
>>> -          https://github.com/tianocore/edk2-non-osi/tree/41876073
>>> -          https://github.com/tianocore/edk2-platforms/tree/8efa4f42
>>> +          https://github.com/tianocore/edk2/tree/0f9283429dd4
>>> +          https://github.com/tianocore/edk2-non-osi/tree/f0bb00937ad6
>>> +          https://github.com/tianocore/edk2-platforms/tree/7880b92e2a04
>>
>> Thanks for updating this comment!
> 
> Having a way to reproduce is crucial for CI.
> 
>>> -    @skip("requires TF-A update to handle FEAT_FGT")
>>> +    @skipUnless(os.getenv("AVOCADO_TIMEOUT_EXPECTED"), "Test might 
>>> timeout")
>>
>> Can it still timeout?
> 
> All Linux based tests in this file have that @skipUnless as they take 
> some time:
> 
> test_sbsaref_edk2_firmware: PASS (2.72 s)
> test_sbsaref_alpine_linux_cortex_a57: PASS (23.71 s)
> test_sbsaref_alpine_linux_neoverse_n1: PASS (23.53 s)
> test_sbsaref_alpine_linux_max: PASS (28.16 s)

I suppose this was due to a bug we had with Avocado consuming QEMU's
console. I don't remember recent complains. Alex, do you know if this
was fixed?
We define the class timeout to 180s, so all tests inherit it. In your
run all tests take <30sec, it should be fine to run them on CI.
Adding ~1min30s extra on the job running these Avocado tests seem
reasonable to me, but I have Cc'ed Thomas who took care to reduce
testing time.

Regards,

Phil.
