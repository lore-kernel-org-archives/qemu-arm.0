Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2619362dyb;
        Mon, 23 Jun 2025 08:18:29 -0700 (PDT)
X-Received: by 2002:a05:600c:1c83:b0:43c:fe15:41dd with SMTP id 5b1f17b1804b1-453653ceea5mr107621625e9.6.1750691908944;
        Mon, 23 Jun 2025 08:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750691908; cv=none;
        d=google.com; s=arc-20240605;
        b=fA386fXwWv2b8tdHttXU5bP3AXp1dHRJK40FolstR9FmUas1z1MjNgIDZJaK4t1pKM
         S+rnjLCb9e0Bpkts2rNIdm+dZmDQybNqz+j/MkMLDaYa2ZlC85JaP/EQWwfa/GLkFniU
         1HNPermkRWGa+PHzSjVJvoFXU3BhOXhrYQXLL3KzCWk09bAIubezrrQMDyBj3CdxXiyK
         HY62qTIZokgsc4A4BaKro6nOjlf0Tx4sOvxPh5WyV7crNdzV348hapEWZL3dTd34et3t
         UWCMycdqotBIoaa3970YmCraUKJH7c7juZXCAFsuj3vK/A8P5Bucv5wBZKPKJFyPs2OW
         bmRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wIN+RgRGGCJnokaRdCTi07yk/D+XISYakVoaYJMHles=;
        fh=fO/jlvXUXUQh9ypZfnyHDA27bkuAgwMkV8J+3vUZ7co=;
        b=gwwpkogi21w1CzwYCrvYgSl6Yy4U1wF+Z7nPLig8L/MKGjGRBc+k2zTAu2Zm1vSR7z
         TI8J1t7Um8vXv8nmA1rMAn0Zv625hJ/g4IgRB6WNHtfcMhbK9zVC1Pv7TMIZTS4Jv/up
         ENjBsg0iLFZPeOT6KWgZkpPmLwaHg9wDyxiG2Z9f9dz8FmXWXD6DNzPVh/f3H2VDodv2
         UkMaJUo1vb5Pm+qz+Wzqnb784ZDe1XUH893iX5oXqcyk0QqiJ7eiH3K03IPh5C805JC0
         5GlysN0ZNnVFTIlIlL1QlGEyvApb7aDvpWsyvKnlroDI3wflARS22ZjwX1bRix4cGCoY
         L8yQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zgEn4f3y;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453656c3689sor23049895e9.0.2025.06.23.08.18.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 08:18:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zgEn4f3y;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750691908; x=1751296708; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wIN+RgRGGCJnokaRdCTi07yk/D+XISYakVoaYJMHles=;
        b=zgEn4f3yt6x9dj/cx5yCZt2ML8amQQFi16tDksb3XvQ3fhHHE+1F+HdkmZLSVJUptY
         qMponwINzlc5E2V0S+ILhoN6D8weX8paMB2TrIq9uIc1QYcfwrvWvYf4oEoj92uF0Bas
         89vlJnHGNLw/hw7I3ZWoAipJC9RzMJLxYeO7JkwAO2aULcceiDhzqSWiwPSlXsw9CwDy
         Sn9QiRQW56dXQxvDDshGYQXIhF65erkRfZLv60/cQj6N5vSYaa4mYAOMlA+pwnGgjYfs
         Ll1YIJm0+pieiUcGbWOVV2gMR7RbfOw+9emfo3rTL2XOWvcjVH0LvJ1Byj9OWqhOafWc
         p6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691908; x=1751296708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wIN+RgRGGCJnokaRdCTi07yk/D+XISYakVoaYJMHles=;
        b=SG9d3I/svoCf9fkdE9ohcp1ECAcyfHk8JLQ+WKxotiMx2Cjnfu1RZy4LpKFHWNPR0J
         tx9nGBpMRESEMMHR1XuA8pqazrCOiaFbt5+vz0HOioTq05Vpw+hcKOijQiCBKUQ7uSpw
         KQ4K7on3PjzWDjGC1Y7F7049xri/3vW1lbLqQfx1ea1B9g0lrh75GhF62LsF+/os6adR
         xwtKqR4pDWbUxZ94EnmGZ72W1Jua7DdDud1igN3ys7sGLtALEqM4kDOIimPVhBBixBVu
         joN3Homl4NDkdCFO95t9SwOi44pBxsUVtQNw3cTf4hMvKzsEAywTfs6D54ZmB3tXYs6S
         +ZAQ==
X-Gm-Message-State: AOJu0YwngK25kw09f4/ajpsFPstYCShIDZwEdi2Qk9eD2ADq0h+ySs/J
	1DWaQJ+s88ICD1CkfN21mJz2PYf69mKQi5gn/uUP/x/eF1nPQASDBTbP2NGUUlfEs+wPEPrQxNh
	tNc9MqQU=
X-Gm-Gg: ASbGnctxX6uagb+uFx6IRmHWd/1lmEot0dSob3witAJcEPv1W0RqJmIxs0QRPzgR7iM
	xlvdnFWM6UVkxtLBfoBEEGgWLyln40dLNT6u/wJlcae2PG93EG+Vt6Uq1BEK3M/57tTFJGHx5OH
	whEcoRs194e/35+omYYTcMO3mdx/5Inf/H2g0cssNA5v9qVGpn8naj2R1Pq0Tf9JR+OfLYgp75D
	zxdzPJ8u4+Zn1Y2XZot2NiyMHZ9dih7fl84aA4TOjRaimq24xPcfBz6o5GiEbt8/ipD1GhDKr7d
	54YNAxJG/Fvu+ChWKE6WUIyQmie8HyFERkI8aBUAl7vFgu2i0o9xcZrXHRpvHxUoQl78ydLykCz
	G6iGhBvxDK6PPSO/9Zit7FMwZqQyAow==
X-Google-Smtp-Source: AGHT+IH5HwlDfedhxQ2UBOIYP7nsIw3gbY72muiBf9A3OzLSvMyE2iSR+eAsDWo7s2KE6DPTbZIwwQ==
X-Received: by 2002:a05:600c:3f90:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-453653cf3c4mr109783435e9.4.1750691907914;
        Mon, 23 Jun 2025 08:18:27 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.167] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45363c0f227sm55323695e9.2.2025.06.23.08.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 08:18:27 -0700 (PDT)
Message-ID: <a8a4d2f7-2341-4cdb-8ca9-8deda337434c@linaro.org>
Date: Mon, 23 Jun 2025 17:18:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 26/26] tests/functional: Expand Aarch64 SMMU tests to
 run on HVF accelerator
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Bernhard Beschow <shentey@gmail.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cameron Esfahani
 <dirty@apple.com>, Cleber Rosa <crosa@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
 <20250623121845.7214-27-philmd@linaro.org> <87sejq1otw.fsf@draig.linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87sejq1otw.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 5zxlxiXStFZD

On 23/6/25 17:04, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/functional/test_aarch64_smmu.py | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/functional/test_aarch64_smmu.py b/tests/functional/test_aarch64_smmu.py
>> index c65d0f28178..e0f4a922176 100755
>> --- a/tests/functional/test_aarch64_smmu.py
>> +++ b/tests/functional/test_aarch64_smmu.py
>> @@ -17,7 +17,7 @@
>>   
>>   from qemu_test import LinuxKernelTest, Asset, exec_command_and_wait_for_pattern
>>   from qemu_test import BUILD_DIR
>> -from qemu.utils import kvm_available
>> +from qemu.utils import kvm_available, hvf_available
>>   
>>   
>>   class SMMU(LinuxKernelTest):
>> @@ -45,11 +45,17 @@ def set_up_boot(self, path):
>>           self.vm.add_args('-device', 'virtio-net,netdev=n1' + self.IOMMU_ADDON)
>>   
>>       def common_vm_setup(self, kernel, initrd, disk):
>> -        self.require_accelerator("kvm")
>> +        if hvf_available(self.qemu_bin):
>> +            accel = "hvf"
>> +        elif kvm_available(self.qemu_bin):
>> +            accel = "kvm"
>> +        else:
>> +            self.skipTest("Neither HVF nor KVM accelerator is available")
>> +        self.require_accelerator(accel)
> 
> I think this is fine so:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Thanks.

> However I wonder if something like:
> 
>          hwaccel = self.require_hw_accelerator()
> 
> Could fetch the appropriate platform accelerator for use in -accel bellow?

Then we'd need to make it per-host arch, and I'm pretty sure hw
accelerators don't support the same features. So I'd expect a
rather painful experience. WDYT?
