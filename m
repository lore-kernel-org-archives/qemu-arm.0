Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp680226njb;
        Tue, 18 Feb 2025 05:19:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXOQ2aaQ7yeD9JN0b/fppnqbXSjOpiPbXejMd43/nZo3+63xvVh0vfUMc5zHTcYwuY1ijLyMYuI2LFzgw==@linaro.org
X-Received: by 2002:a05:600c:35cc:b0:439:654e:ddf6 with SMTP id 5b1f17b1804b1-4396e6a9e69mr125938945e9.9.1739884776215;
        Tue, 18 Feb 2025 05:19:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739884776; cv=none;
        d=google.com; s=arc-20240605;
        b=jx+UssiNFQGuMfdawr4Ty1bfHfj9mhjrUdG47i7aMRr8aBo4jPd1TBOGLNYxgnbrNs
         Jfy2U8e0ZLCM9eFaR6xsGh+2cWOJ46NL3bQhGx81PCyHUiK+e11BuWa39p3qOWtBNLbv
         JhyN4FrgQwixW2GnS0ZJtysC5brIn0fOfuo1RuaE+bNZ4GI2/0k3nI94pqi4EQZOWln9
         WrLDpAmb4AjOxbtuXNAtC0QrI/FBjpNn772IQedma7aJrUw4AxQH0P/K0Fjocxx80GBV
         xUuqbjLxJX+frYn6wrj07bErrjvgNe0OblBYtMfcfv283kkOUBRrQkBubl+oBgpQ/si+
         UDQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9jOWDgWdgm3WlBmHZkzJFmY7KFSm2K7SI7318/JBa0I=;
        fh=auE+kGqb4ujPRyUyb0UUqrh+e0DzmLQSDoucs+OuRy0=;
        b=jJzLqODi+q3sQ8P3bcflLmYDqhdoG0PvVuPxbHHTaIKXhWJnwsKtv5WpLas5CviJK6
         9ei66allVTEs81PgM1gXhvjHafd9A2IUMZBy0g8nR1XjTJiOXH6J0JxeG3D2Ld19biy3
         UebOQXMjs7sffd689TBDTj/7/tKwh/9IVn2FQd8wJaZ6hIyAw8pI742IdtfgYsU4xulZ
         DCv3bqiIna2WlpWuWSFnxZSwhooJTsKsH75icd1dvmxgHfSc9DeyN8HEwlSCbhPJ4sYS
         J2g2WryDS2gb8ctKtq9+xVS3ymz3gaP/oxRp1Cd8NmaPVn+kxna+OqxHAZROwofmrTue
         p14w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=baY4MIzU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4398a62df3csor17574605e9.8.2025.02.18.05.19.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Feb 2025 05:19:36 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=baY4MIzU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739884776; x=1740489576; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9jOWDgWdgm3WlBmHZkzJFmY7KFSm2K7SI7318/JBa0I=;
        b=baY4MIzU1Xj50HMGtsI6YBSzvZ4Gd3uX74CH0SwHoxLXCRU/H+XUaasM/2DRY7mh97
         TIXFMB1f4VsIzdp/GPEIUY/nYm23Xx8qXldZK9d1EpV9YrhELDRnVBxVVLqsH58k8euy
         i9vQEzeaqNqM/duzvrIUIn0l7Dng7EKLC9u4dKM9lxyoV89gIJjAtctaPzd9c/xASomc
         hqIKCjhMLXqvGWRoGFlVFXnzR44m5C0evubdaB9qgqCqRWpIPyFW0CthLOyZ3/hGcRvq
         Iv2ssPNV7/kYVynsRTW1OH5UBgFPPVP+FRqtVmmQ3bsMS9YoygulaanglYAKgLoFs79A
         0tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739884776; x=1740489576;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9jOWDgWdgm3WlBmHZkzJFmY7KFSm2K7SI7318/JBa0I=;
        b=wktc4Siu7FTwaZUDEweC+LvNEPtjbVzlaFnCk7rPhOKefzBiBooVusOHysw+WNxVZM
         637YOFqzhUYbdscKPaqZgHPnxEBSDH5h52yU7dfn1JQJI/vjq/q8bletyMovYB3+KIcE
         6ctErWazPL6Sg3cwQL+uPlBS8NpWMrWSwqIC7ENUD0MOYrFhdl96q+ffSKbP2HKq7Gtu
         i4ydL/eMk15y19gwHdLQkxreu4/7vs+t5t0k8oPHxDAcZK5ZT23SUdctF+Ad+J+XrTKl
         mDsW1T/S0l0EDtuaekW0hRxY0bSgXOAt4vO9Rsqz3e/cOgmD7dboUZknyREBEcyex+zX
         rMgA==
X-Forwarded-Encrypted: i=1; AJvYcCVbltK841m2YSEtFXJ1wmG7cLxPmNagl2MTM7U5e/mfTeNyV0WxojoNvvzxafdkDTaMCYN7IXFkezSt7A==@linaro.org
X-Gm-Message-State: AOJu0YwTchXQZBkOUogMGPezBV9JZix6QmE5f/M1j5058DIqh5a6qE3E
	Gf1zzccXkLmEWzrpzdd/JcfNjHO+bFQ9u4N9IE7dg7dLnuoULHEarDuv+n4hKb4TRw==
X-Gm-Gg: ASbGncvlnwNP6uP7imY6AbAl3ZvCOng8lLQ1wus8oDck5tdL+mphjl34vgaUnf22jt+
	QdX6m/sfd62CW6UjVXHsA1Zf4j6U3oJ5RPJq2SwHoS6U95FtLzsCtCVSuxBVE1U0MccjKGNbo6w
	emxLD9l0dLmIRHJPZW2qt7ozcDW0tO1EkiHm2Lz1jhEDpMZsrMe4RVl0xyr4onctA5KSzxBQA+w
	U8oJaNB9ljGb31LQiBJl2CerbncBKWecC9BPjSXHUKb0oAGoH/NonkhL5+9DyEOO+wMYcLbZ6jk
	CVjLY3IzoLHR6OQKcwyD/1696YXeupZ9rnIGa1GtCUpewwASCQAzYRIFcX8=
X-Google-Smtp-Source: AGHT+IFqA+wta4oXzvphBFhAl3JSyZyc9j8Lmp26VteGErYposT+mqTp+MOGtS8nT9S2EAYzkKJk9A==
X-Received: by 2002:a05:600c:3b22:b0:439:8bc3:a6a3 with SMTP id 5b1f17b1804b1-4398bc3ad73mr64046275e9.3.1739884775677;
        Tue, 18 Feb 2025 05:19:35 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa7e8sm183896475e9.26.2025.02.18.05.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 05:19:35 -0800 (PST)
Message-ID: <dc24cf43-b6a1-42b6-ac93-4128f2c03684@linaro.org>
Date: Tue, 18 Feb 2025 14:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 3/9] meson: Disallow 64-bit on 32-bit Xen emulation
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, David Woodhouse <dwmw2@infradead.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20250208205725.568631-1-richard.henderson@linaro.org>
 <20250208205725.568631-4-richard.henderson@linaro.org>
 <aeaf0f19-0f14-4a02-9c51-09521e7c75e1@linaro.org>
Content-Language: en-US
In-Reply-To: <aeaf0f19-0f14-4a02-9c51-09521e7c75e1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: gACuhrr2Oz6i

On 18/2/25 12:20, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> Adding Xen community.
> 
> On 8/2/25 21:57, Richard Henderson wrote:
>> Require a 64-bit host binary to spawn a 64-bit guest.
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   meson.build | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 1af8aeb194..911955cfa8 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -304,9 +304,14 @@ else
>>   endif
>>   accelerator_targets = { 'CONFIG_KVM': kvm_targets }
>> -if cpu in ['x86', 'x86_64']
>> +if cpu == 'x86'
>> +  xen_targets = ['i386-softmmu']
>> +elif cpu == 'x86_64'
>>     xen_targets = ['i386-softmmu', 'x86_64-softmmu']
>> -elif cpu in ['arm', 'aarch64']
>> +elif cpu == 'arm'
>> +  # i386 emulator provides xenpv machine type for multiple architectures
>> +  xen_targets = ['i386-softmmu']
> 
> Is actually someone *testing* this config? I'm having hard time building
> it, so am very suspicious about how it runs, and start to wonder if I'm
> not just wasting my time (as could be our CI).

This config is not tested and not functional. I'll post a patch
removing it.

> 
>> +elif cpu == 'aarch64'
>>     # i386 emulator provides xenpv machine type for multiple 
>> architectures
>>     xen_targets = ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu']
>>   else
> 
> Regards,
> 
> Phil.
> 
