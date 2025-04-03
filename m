Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4370867njd;
        Thu, 3 Apr 2025 13:27:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhcnRp3V7su1Q4r1u5loHX7/+zHejLOeMnmEYxk2G/f90/eTNfMRpRJWSWrAYHyZPny3YKJoXwWWX8GQ==@linaro.org
X-Received: by 2002:a05:6000:2903:b0:391:4873:7940 with SMTP id ffacd0b85a97d-39cba97f911mr566862f8f.54.1743712030713;
        Thu, 03 Apr 2025 13:27:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743712030; cv=none;
        d=google.com; s=arc-20240605;
        b=KXSTwZH7v0ebLk6L+D62BgEqNeq86lx2RZ/KwqeftzntiQ2VqB9DlUrVtxQ7ATNHd2
         1osdciJsQoNiy0n27WE3h3ya8H7N0+cKW+lt0UVHuDYIEourL3poSxnQokS/FDm3eP93
         XiX4KJ3ubKU28yuoJgoR69hY9/paA/4iiNGS6G5K//dD0q3DXpRq0ZaNhidttofGWxw3
         vhv6l4mcO+ZLcUebXx2lcuWXkBtxaKLh0csToiNwGbeRtKlu8Y1jRXuV92LjWy93V8rk
         OmVeIm42hUVhBNnzdRvkbcgCyDMxzNq+jA1QoKQ5Kk7JfrFMyMc2TX3FxHw6uzFFlZtE
         INVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yMdxd7fjIjihh9SvmEj50b94nf5OcoxMUT8JuDjtX0w=;
        fh=8SyKPCHToBPScUXxn2CXnZLB9z4gCoiWUafihLdJ7rs=;
        b=jWbHmlowPQoNvBaLg1TPrPA64Y7qX5bhgHojGnk94OX1tsXKuIV4+0+APPqmJ5t1kR
         62bNSM2Eie5O3PS9GiklNX+33VHv878bGoQaP/OWai1XznLjqlwkW8KBLVqln33Hr+8u
         eA12D2VEM+JyD7cWhtcySZ9ntbXtdFmdhiU6S0tRKyol/EhBavFHQnQmFH+SSHoFlPrc
         1ai3IUkyQFWnmmQrRksP6NvA862EBSqQ+BoOqcPGTeeRpJx1bx4UEuOyC6xGIR7Bpvd9
         WxlfUacqa3aBWL/5JbZGreQKub0UJHdc77otjb/921VPslFKZJUqOZH8XUgDWEoCVoq+
         HB2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JT/PusVq";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec3642923sor9272625e9.6.2025.04.03.13.27.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 13:27:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JT/PusVq";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743712030; x=1744316830; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yMdxd7fjIjihh9SvmEj50b94nf5OcoxMUT8JuDjtX0w=;
        b=JT/PusVqsXKvWkHRIMQsQrzv8A3OP4TkXcJ27LG9bQFIgeOwpX/s4BNh9KNnkIY4er
         elClqtXvEfV62f8T3tubrRdk/qa572iFgT4V9Mlo1NWRYOvf/VsdPURn2Ba6c2JuXf5j
         m03iWnimxH6Wzp5UPwNVVNijh6vRoWwe101rJOucKu3QsTr631QTvWcz3VHcMZUjP2b8
         0ITvLvoPZzbbr/58VylUkgFqZbpzQ+4ZxVYHJcCWP6ypE0deinBMPv/Pn2TgDIzITW5E
         AWj2V2ug8/6caz2nPIqC4uRLBzrCNfUsL4LSETIDnNpM1bmumJhISbFzzwGoL8atJtiH
         V1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712030; x=1744316830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yMdxd7fjIjihh9SvmEj50b94nf5OcoxMUT8JuDjtX0w=;
        b=hNQpexr0skSdzoImAHnd8rBQXc+lBYichoitF02kpg44vgmofpxyPKpJE8X+QMJtj5
         sSdoOZaC29Q6MOn8sBz5g6SNCHabrqwoa61KMylyRR6NFz0CRI79x76UAIxXUKpcTqwp
         gAzYV8L7rv9lwcirGcoHY26tbCwK8NGEPPfBkmT9QJjuiyILOjF9WZfSRbQFl0F8lAZ0
         0tc2Fy5j2aCv4Mw+SNjv+Ql0J5JrmTtjB1xKSmaUvRhUqDvgHEDsmVRacwAtmI8v+C1g
         /OzoSQVIySLNmaCBRXEfi4yk0FUZC5KXypUWsLRwOryaLX0QEREEnbXsMZ4S7wJ71ePy
         5imQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhYK36fzRaB0Ov9OXgLxIYDa7VdBfI7T2jXz8F1zFr6kVJ+uDLtiOl/JvoTGU1yAUe84GxIdIkOZuMDA==@linaro.org
X-Gm-Message-State: AOJu0YyBXKYgjhULTpP9GtvTux4ZPvPjFh/BJLgeWNfY05OGY3VgBpyh
	6UbqFJ+5bZdPQlxWs7moS1pC21pxgBUmpOe02TYpUzYgAnZeeJfUA5wZ+fK8kb+Tug==
X-Gm-Gg: ASbGnctskoq8/i46bhg1Gy7rit3PZHUtEJTS+HLzGA1l4ojIgnLt1h+NnNUto27vv2Q
	/x6h+Lry6vFdaPTxlCNHpimlRWY1QS0cnTun3AJqFWTiX6EE5KZ5f80/ZAwr/dZF4jny4A5zAT2
	Bu8aA5SrOscyj430r34xPSYc/Gy0xfC/xFAJn6Dpwtp0/zQtO4VSkLpXne9Ftl1Dk/wZ62arEtw
	4fO3FmCNnE/Oz4a09DVNNeJjafuQjWyljyPY+rXSOp2tetwfQ6HTe9yPgGoe9fDG7D8NfO+T8Jw
	PjQSBn9nCptqtt6Qfu4tegnXBeK0iYcxHvf6NvgRmae37ENp3twAv6tZbLtAgd6GTwtoRV/cAZX
	ciXjmyz7Ppmos9dHGYUn1PhYZJ/rw
X-Google-Smtp-Source: AGHT+IG6q2NbvrftZycWiIt3unU0xEkB4OU/iwKufzZaVzSyKXino8Oy1aPrQLr9ZbGdUbfk6udRYg==
X-Received: by 2002:a05:600c:3ecb:b0:43d:7588:66a5 with SMTP id 5b1f17b1804b1-43ecfa06563mr4594095e9.31.1743712030167;
        Thu, 03 Apr 2025 13:27:10 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a1fesm27825145e9.3.2025.04.03.13.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 13:27:09 -0700 (PDT)
Message-ID: <ba70bea2-46b7-4abc-b1cf-dbfe68d56143@linaro.org>
Date: Thu, 3 Apr 2025 22:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 v2 02/14] tests/functional: Add a decorator for
 skipping tests on particular OS
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Gustavo Romero <gustavo.romero@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Udo Steinberg <udo@hypervisor.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>
References: <20250403151829.44858-1-philmd@linaro.org>
 <20250403151829.44858-3-philmd@linaro.org>
 <7c417483-7d5d-456f-8187-56b5264f539e@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <7c417483-7d5d-456f-8187-56b5264f539e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1xWheGLmqFWw

On 3/4/25 20:04, Thomas Huth wrote:
> On 03/04/2025 17.18, Philippe Mathieu-Daudé wrote:
>> Since tests might be failing on some operating systems,
>> introduce the skipIfOperatingSystem() decorator.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/functional/qemu_test/__init__.py   |  2 +-
>>   tests/functional/qemu_test/decorators.py | 15 ++++++++++++++-
>>   2 files changed, 15 insertions(+), 2 deletions(-)


>> diff --git a/tests/functional/qemu_test/decorators.py b/tests/ 
>> functional/qemu_test/decorators.py
>> index 1651eb739a7..b6a1d41c55c 100644
>> --- a/tests/functional/qemu_test/decorators.py
>> +++ b/tests/functional/qemu_test/decorators.py
>> @@ -5,7 +5,7 @@
>>   import importlib
>>   import os
>>   import platform
>> -from unittest import skipUnless
>> +from unittest import skipIf, skipUnless
>>   from .cmd import which
>> @@ -26,6 +26,19 @@ def skipIfMissingCommands(*args):
>>       return skipUnless(has_cmds, 'required command(s) "%s" not 
>> installed' %
>>                                   ", ".join(args))
>> +'''
>> +Decorator to skip execution of a test if the current
>> +host operating system does not match one of the permitted
>> +ones.
> 
> "permitted ones" sounds like you'd need to specify the ones that are 
> allowed to run the test, but it's rather the other way round, you have 
> to specify the ones that are not able to run the test. I'd suggest to 
> rewrite the comment accordingly.
> 
>> +Example
>> +
>> +  @skipIfOperatingSystem("Linux", "Darwin")
>> +'''
>> +def skipIfOperatingSystem(*args):
>> +    return skipIf(platform.system() in args,
>> +                  'not running on one of the required OS(s) "%s"' %
> 
> Same here, maybe rather: "running on an OS (%s) that is not able to run 
> this test" ?

Yes indeed, thanks!
