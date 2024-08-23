Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp95760njb;
        Fri, 23 Aug 2024 01:24:13 -0700 (PDT)
X-Received: by 2002:a05:600c:5252:b0:428:29d:4b59 with SMTP id 5b1f17b1804b1-42acc8e14a8mr11065585e9.20.1724401453336;
        Fri, 23 Aug 2024 01:24:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724401453; cv=none;
        d=google.com; s=arc-20160816;
        b=uhSbTtsf210RLmp7pl85PWW4OfVfdXrXzrw2yfw7diySCk0vlqrUph1O3wn43uNirX
         mZIBJofTzsB0dEhMfk4hTiJArKff5MJnoX1jk2mLVDQkX/5fUZ2SeWIOq/a1cqX1uiVv
         mXBn1/I6Uer7M3VnhAi0ziKgLhxN6jD0z1OQWtyR2cROBgigF7VPhK1Z1pWKse683TsK
         GqsM/ZHpAZPZzsdJOr8PIROenJSCgdWFas8qVjBDqxGiTv9nTM2kqE12z+Ve7mbjWh8q
         vkBtScxxfQprioDpiuxYtuZ1MATwzCNEJSfjHLEYiyI86h/BPXK3O51DsouRGIc36v6F
         hFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oOoceEIcYGKPldCMuMwpOHROEYBnvJrMPykhiJEBUGQ=;
        fh=HWVKh/2UeTpqd+Mx+8vqffT54Rn+fuC9OnvKhnsCEBI=;
        b=z2RXPrt2FxPjsn8OxfiDDEjFU+Psnx0r5xzmGFY9nR4cUmUYmePsapJrBA2Hy+VQsP
         EVh6L9ufY9jpg+vzMbFXVO5ZHqypfXQoL20RFo4UCChua9R3dLpfv2bRDBDQsfGgjKbr
         xSTZ/hFNBC6sl9uNCPIwo1gAYsNnVoEsXr6rjDJxkXjs3VATcCoAfMnL6Rfd4pS0x2nK
         A39hf5JHvSqyYZeYttre8BRd+s0d8M9pydqcF+16p5Xw0GDUE4lOTW22zGF3+V8vY7he
         8MfL0nLLG1NBWM5p6p1g7HY1xiwTyPKkVBccvrSqCnFcU3ep/FUWy+vGTvxAij9ILvWm
         bRWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GltIXZPJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42ac517e67esor12656965e9.10.2024.08.23.01.24.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Aug 2024 01:24:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GltIXZPJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724401453; x=1725006253; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oOoceEIcYGKPldCMuMwpOHROEYBnvJrMPykhiJEBUGQ=;
        b=GltIXZPJo8edNMgBfGZhKoN3wv/ut1+5T312rlnmDn5SLOZOtCVl0pBh4MGmC2BWs1
         YUXyD5pLM32ALxhqHFiBuBND//wAF55ODj2c446nqAEpzptIjBCGQ3967uQ6gSfHuBtr
         4vSf2O/urIzbcwsYdgXqMrvBt8wWEX1WNX0IavlfhuDk/M12qZudZ6H+fzlJL1w7zeAw
         df22Xk6hjliPf55ImbXHe8XeD3XaI2qitqEnMPXFZo5EcDNjly/wjco/RmrAKpM2IEIm
         M/h0/U03m2QqKjCctIzvHkWBuWG1luxLawIrwSVr5Btvt97iCtUu8Dpy4NQzXcZH3izz
         nl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724401453; x=1725006253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oOoceEIcYGKPldCMuMwpOHROEYBnvJrMPykhiJEBUGQ=;
        b=lR7u+YtJtBc97Xg9YUnXVZ1TiJeCNR3yWBKmfperuD0zXA37aON6diyDBTcuMlsUVW
         gEYWC9Q8JfLohk9erDuxEwqxt9oIvV1jTt2+f+qRllIC+m7TVz/feR2uAHUc2b1CyP0Q
         bo+/GXdKhX5fj/q+bGOnm5cNnynuWsAxuirvuqVmJwMOV0t/T9iOUxSJ44AoV3694ekd
         bIXeQ9ukSAcN4lA8H3XR3IkmDlkoylCqLInbnFrFcyqaHW8Nwr0tpz2g38TPo8gZ7oEn
         wyg82fg7QZTuYMsnwBe+P67p7vCuvonnW/dSetGSOyT3WDGYp1ItaF4fCOKH7moCx7jJ
         UZog==
X-Gm-Message-State: AOJu0Ywwo35y1ayAfHa5x3zM+Dx8XcNoYCRBPX1YRnW1PZ7/GNlUqhGR
	MIYfH9kxyAc+0Tg5V60Pjzd5v9HCeitAdMdBL2Io9MYOquM4nF1Z+ud/Ki/BEGJ9Qw==
X-Google-Smtp-Source: AGHT+IFKS1fEEsG4cbsF5JWpptmRmTe+F4voxq26sVkgZvOsdph+eOhKGIWgircWtl1tdkdUL5iALg==
X-Received: by 2002:a05:600c:1552:b0:426:5416:67de with SMTP id 5b1f17b1804b1-42acc8ff52bmr9280085e9.30.1724401452650;
        Fri, 23 Aug 2024 01:24:12 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.206.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abed8b83dsm87623545e9.6.2024.08.23.01.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 01:24:12 -0700 (PDT)
Message-ID: <df7826f8-df08-46d0-b5bc-86b640b71c6f@linaro.org>
Date: Fri, 23 Aug 2024 10:24:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional: Convert Aarch64 Virt machine avocado
 tests
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20240822120750.89065-1-philmd@linaro.org>
 <23566834-d8e5-4a54-8f3e-cc68e6b7d951@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <23566834-d8e5-4a54-8f3e-cc68e6b7d951@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 50cRh4i2Y7v1

On 22/8/24 14:41, Thomas Huth wrote:
> On 22/08/2024 14.07, Philippe Mathieu-Daudé wrote:
>> Straight forward conversion. Update the SHA1 hash to
>> SHA256 since SHA1 should not be used anymore nowadays.
>> Use has_cmd() and run_cmd() methods from qemu_test.
>>
>>    $ make check-functional-aarch64 V=1
>>    ...
>>    ▶ 1/4 
>> test_aarch64_virt.Aarch64VirtMachine.test_aarch64_virt_gicv2                 OK
>>    ▶ 1/4 
>> test_aarch64_virt.Aarch64VirtMachine.test_aarch64_virt_gicv3                 OK
>>    ▶ 1/4 
>> test_aarch64_virt.Aarch64VirtMachine.test_alpine_virt_tcg_gic_max            OK
>>    1/4 qemu:func-thorough+func-aarch64-thorough+thorough / 
>> func-aarch64-aarch64_virt  OK   30.44s  3 subtests passed
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> Based-on: <20240822114146.86838-1-philmd@linaro.org>
>> ---
> ...
>> @@ -100,12 +98,11 @@ def common_aarch64_virt(self, machine):
>>           image_path = os.path.join(self.workdir, 'scratch.qcow2')
>>           qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
>>           if not os.path.exists(qemu_img):
>> -            qemu_img = find_command('qemu-img', False)
>> +            qemu_img = has_cmd('qemu-img')
> 
> As far as I can see, has_cmd() returns either True or False ...

Oops.

> 
>>           if qemu_img is False:
>>               self.cancel('Could not find "qemu-img", which is 
>> required to '
>>                           'create the temporary qcow2 image')
>> -        cmd = '%s create -f qcow2 %s 8M' % (qemu_img, image_path)
>> -        process.run(cmd)
>> +        run_cmd([qemu_img, 'create', '-f', 'qcow2', image_path, '8M'])
> 
> ... so this seems wrong to me?
> 
> tests/avocado/avocado_qemu/__init__.py used to have a get_qemu_img() 
> function, maybe you could port that one over?

Good idea.
