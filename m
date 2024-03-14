Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp378601eju;
        Thu, 14 Mar 2024 07:39:48 -0700 (PDT)
X-Received: by 2002:a05:6512:3095:b0:513:b8be:fa0d with SMTP id z21-20020a056512309500b00513b8befa0dmr254626lfd.61.1710427188269;
        Thu, 14 Mar 2024 07:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710427188; cv=none;
        d=google.com; s=arc-20160816;
        b=IOpXwJZRtBqFPMJvpvRN00aDGaSg5kD4Di/PvAUVmCkJSeKG5W+RaeWfONnMhvKK8+
         +Zse1is1i4al/VF6iVeGtiDWQO1JEHhBaKLG0nIR9OqMU3+nMVvIVo00RNySzfk6PcCz
         ZCPFEqg86+r7ngoCp+JV263R21daDb5uXp1Wz3rvE4TE3BD8e8vH+Cgf4sLCQfXnjH5S
         7pF1CLXxqOG1spAyDAMPo/WAzR6r6QD4vEqUWTBp5DMHFC1DSD8H1o5xk2gxzo8YYtqh
         ZANtWrPlDGYPp9He89pn9EAAO2Jw+bGQKDKWK1X2528dHREW7DWGIalGICFmfywkb+/H
         pQ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vxbaZwekquaku/Npv8Z3xYVN46oxQj9yTwQgTQzjTiA=;
        fh=HnRGgITkPdzwtnnH9EYV4Qv7mKtXy/ggT2zXy357+co=;
        b=l4vmI3l6T2WZvaja1w3Aeo1d3DNbUFVdzPQfzFKZbigrJ8xBxx8WXFX7eDQx1AsCPp
         Kngx4Tc9KFDofHng7pdl67VEb3nGB9uARxEbcR1bmeMZBT1tIp3jM0syEi22RiQXyHjv
         80Ehku++ZkG5F8fkn2+KCVL0ABgP27Nfde9lpgHwRo9AhoDPEzj3dI6+TZQRTz1qIiM/
         Z3gAidrrULy9q5mzpoISer/a2DsiJg8nHr2zoavljTYGbv/Fjf+I2RMMSgFvbWb9rxeC
         AMMYO0NwwMJaXOFbw43jF8NmORWNiEsy/CsNOnql3VuXEANyCi82UmJ0HYgEHhHjnJyY
         mOQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VuDmx0iL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z22-20020ac25df6000000b0051323372d64sor464680lfq.23.2024.03.14.07.39.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Mar 2024 07:39:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VuDmx0iL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710427187; x=1711031987; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vxbaZwekquaku/Npv8Z3xYVN46oxQj9yTwQgTQzjTiA=;
        b=VuDmx0iLyqPGNq6Fkj8iZdb3JK1TfpUZe9z2mg2wAQdUddRS75CeqEJ02F84h3y1A0
         qQScvZFMOncWNjabESMrklJ1zoe0lLn0GNuCqEu2MRbn0IZGbr26i7BtpRByjzqCS9Yo
         hdizOkdew+F2RG6ufIE15qgDb/sH8jvmTTZPOrS49N+wCBVl9UZe65Vsb2IhdGaJNTxt
         wrwvX4ABwk7T420YToWopwe+p05n1JktLpg0vELOKp/B6aC8D+cOphuTW6HcPrsqbeT8
         Ao9o1hQQ9KpVauytaHo5kH9DR9HDbmJpHKYs8Sd1ZQIar5ZPjvyactOdklekDftMYhjl
         Z8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710427187; x=1711031987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vxbaZwekquaku/Npv8Z3xYVN46oxQj9yTwQgTQzjTiA=;
        b=VAMsOFS6z0SALIYBpQ5ZqKlpJn42Kp59uDYddkERk5Enlz7Uj6b/juedBcZ+zbWjgV
         wSF/d+R647NkdDkAG5LKJXnZQ+zalddR8NpdhjOLq3uU5KRx622zwpC3QhXNVsER/NQ7
         iplmxzh6KOht0tD4x2Zqa6kDflYkBAGGwd0oGmiLRre8VruMbeeCGAy/bTVxShUknK3F
         ElriYqfeO9OXjorxs+l52Urykoi3Bx+DMqiT0H/iL+3vwlxIOPZNBRbRoPWgX9LVCftZ
         ZSIDtyB1YIQNHrl6SjJsr2JFgOBmMek02PX5DlKvKkRg3M8BIGTOE63Ze+4R3XgJxRvo
         w+yQ==
X-Gm-Message-State: AOJu0Yyrkq3uOiMJQroo5aJLOP8MaxdxV32E10zB3YgYZsReX01aOR9C
	vNnwufV0X9ubnbESovUGHZnOT7XA9dCl7jOE5U+kNC1xfnkjEFVyePqdtAYn5Txuj8+NxZs2dsv
	QcBLXrw==
X-Google-Smtp-Source: AGHT+IFZvxJxW8cgPHeNwKAYGFIModlfpPdaIpc+8Azsyrt/9fTFf+s5LRJRKJ5jMQv5WzA4yhvZiw==
X-Received: by 2002:a05:6512:443:b0:513:c9ca:1333 with SMTP id y3-20020a056512044300b00513c9ca1333mr196656lfk.22.1710427187340;
        Thu, 14 Mar 2024 07:39:47 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.197.77])
        by smtp.gmail.com with ESMTPSA id bh26-20020a05600c3d1a00b00413ee67f741sm3648570wmb.13.2024.03.14.07.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 07:39:46 -0700 (PDT)
Message-ID: <7da62f7f-3e87-470b-b089-1bfe5aa97555@linaro.org>
Date: Thu, 14 Mar 2024 15:39:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] tests/avocado: use OpenBSD 7.4 for sbsa-ref
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>,
 qemu-arm@nongnu.org
References: <20240314-sbsa-ref-firmware-update-v2-0-b557c56559cd@linaro.org>
 <20240314-sbsa-ref-firmware-update-v2-3-b557c56559cd@linaro.org>
 <87bk7hggcz.fsf@draig.linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87bk7hggcz.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: cDNH697OuYUA

On 14/3/24 13:14, Alex Bennée wrote:
> Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:
> 
>> 7.4 was released in October 2023, time to update before 7.3 gets dropped.
>>
>> Disabled tests for 'max' cpu as OpenBSD fails there.
>>
>> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>> ---
>>   tests/avocado/machine_aarch64_sbsaref.py | 47 +++++++++++++++++++++++---------
>>   1 file changed, 34 insertions(+), 13 deletions(-)
>>
>> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
>> index 259225f15f..0e52dc5854 100644
>> --- a/tests/avocado/machine_aarch64_sbsaref.py
>> +++ b/tests/avocado/machine_aarch64_sbsaref.py
>> @@ -159,14 +159,14 @@ def test_sbsaref_alpine_linux_max(self):
>>       # This tests the whole boot chain from EFI to Userspace
>>       # We only boot a whole OS for the current top level CPU and GIC
>>       # Other test profiles should use more minimal boots
>> -    def boot_openbsd73(self, cpu):
>> +    def boot_openbsd(self, cpu):
>>           self.fetch_firmware()
>>   
>>           img_url = (
>> -            "https://cdn.openbsd.org/pub/OpenBSD/7.3/arm64/miniroot73.img"
>> +            "https://cdn.openbsd.org/pub/OpenBSD/7.4/arm64/miniroot74.img"
>>           )
>>   
>> -        img_hash = "7fc2c75401d6f01fbfa25f4953f72ad7d7c18650056d30755c44b9c129b707e5"
>> +        img_hash = "7b08b2ce081cff6408d183f7152ddcfd2779912104866e4fdf6ae2d864b51142"
>>           img_path = self.fetch_asset(img_url, algorithm="sha256", asset_hash=img_hash)
>>   
>>           self.vm.set_console()
>> @@ -180,23 +180,44 @@ def boot_openbsd73(self, cpu):
>>           self.vm.launch()
>>           wait_for_console_pattern(self,
>>                                    "Welcome to the OpenBSD/arm64"
>> -                                 " 7.3 installation program.")
>> +                                 " 7.4 installation program.")
>>   
>> -    def test_sbsaref_openbsd73_cortex_a57(self):
>> +    def test_sbsaref_openbsd_cortex_a57(self):
>>           """
>>           :avocado: tags=cpu:cortex-a57
>> +        :avocado: tags=os:openbsd
>>           """
>> -        self.boot_openbsd73("cortex-a57")
>> +        self.boot_openbsd("cortex-a57")
>>   
>> -    def test_sbsaref_openbsd73_neoverse_n1(self):
>> +    def test_sbsaref_openbsd_neoverse_n1(self):
>>           """
>>           :avocado: tags=cpu:neoverse-n1
>> +        :avocado: tags=os:openbsd
>>           """
>> -        self.boot_openbsd73("neoverse-n1")
>> +        self.boot_openbsd("neoverse-n1")
>>   
>> -    def test_sbsaref_openbsd73_max(self):
>> -        """
>> -        :avocado: tags=cpu:max
>> -        """
>> -        self.boot_openbsd73("max")
>> +# OpenBSD 7.4 does not boot on current max cpu.
>> +#
>> +#   def test_sbsaref_openbsd_max_pauth_off(self):
>> +#       """
>> +#       :avocado: tags=cpu:max
>> +#       :avocado: tags=os:openbsd
>> +#       """
>> +#       self.boot_openbsd("max,pauth=off")
> 
> If we are not going to delete the entries then at least use a @skip
> instead of commenting. Maybe:
> 
>    @skip("Potential un-diagnosed upstream bug?")

Daniel or Peter suggested to open a GitLab issue and use

     @skip("https://gitlab.com/qemu-project/qemu/-/issues/xyz")

to track progress.

> but it would be nice to figure out exactly where is breaks.
