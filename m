Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp680832njb;
        Tue, 18 Feb 2025 05:20:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWMbMbslPEqaPm1n1SR5TshndXwFFjstcFN1EOF4pTtu0xhBt5yqorOjCruB29c/NYn8VSEyE27d4PD9Q==@linaro.org
X-Received: by 2002:a5d:5343:0:b0:38d:d371:e04d with SMTP id ffacd0b85a97d-38f33f437dbmr10471729f8f.34.1739884835238;
        Tue, 18 Feb 2025 05:20:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739884835; cv=none;
        d=google.com; s=arc-20240605;
        b=izrNFLaOPRqq7tb234YoS8rXD35qMIV+eqh4SgN7F2vGbPAs1dx0GkViTh+3oX5eXO
         +tbP0f+0ffLkQDeWB+A3HSRAu5IM54sM5gzQASjrT0JlFZUEc8Lo23cmk48+qUefo+08
         T29KNQ+JR639Gdj3zUoDnykB+4uQhKCC30CfSY/TZBKOqOWBOeRD2hOlvJhJ6ZhMxfvt
         xJhZlQobPfMFsaPLlE8610uZ43h8ZXJ9RlbHQAWw3Udlv2LGQoba1q5qz4jFSCrmoxyy
         3zqUlduf+fvPLt58dKhXdsihTztMGZEJ34kTs4MU930N0D0eiHVJEphGWddDQyvvHyoR
         a9AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vC3MmtES1R3kkG1nVWHLeiRBuKWybO9xGwH1FF01u2M=;
        fh=tCqEjanl/TmAPm7IGO1ITuqd9XCmFumGPkr3gh21XR4=;
        b=gUqhXHTpkDibtr9QfD/GSKz9Xf97CURXOqsNrRS0EUl8Z1NeLzQieoFkJR8ClIx/hB
         GaBJ4Pa+0hU+5k5EYxTTGd68W5iDVrZo8bf4AIlwUj+Uuc3XQPXpNaqS/V0+c4/vbzf/
         u1Ao99tfPQnhkekhhKyZ+PWljc4Wx9N0U+9gc7bUaCh1xainQRnZZRpcc+PA0leYjtwY
         WvSeCc6MRc8WjaPfbKfHO6zXICfrsZCXQPeSJ6sXEhYTOpN1skRc3teKm6oXt43ShHB3
         8UirUBmbKg8QbcDC9meLDA9MitFL6HGqiu57xlr3ZYtkVrFh9t+ShAjYVnztSMdfGQ5k
         SXKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VnBf5ELL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38f25898f63sor4956661f8f.1.2025.02.18.05.20.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Feb 2025 05:20:35 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VnBf5ELL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739884835; x=1740489635; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vC3MmtES1R3kkG1nVWHLeiRBuKWybO9xGwH1FF01u2M=;
        b=VnBf5ELLZ760OuR7Pry/+N/1nod75f9YB1c8EbAxaeQGwMkdwM6dWUF0d8nX9LuKFN
         wC+vS+c4RqJZzMadoUS7/Ht3IV9H6Tu5ciGO4XG5rpXUHMTgWYr+UanCzYzh7r58+Qdz
         6qmmz32xva2WUIt8j7o9ihSJvCaDHbXHJogX7tYPvom8L60T+ILOwNTym005TUBp+Itf
         OVFrIIKwDpj8ZIi4ZnKEcs28uPln0cRQz/L5A9s0puHc+qD/OABouQm8LWw9ekxxVXAX
         TIFw0oXuX8W4Ms/9kSwvE9oCDdXHWdCFrqaKSXyRATFqbOb0DSCCgF/Qs5FMhoXsMmxB
         gLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739884835; x=1740489635;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vC3MmtES1R3kkG1nVWHLeiRBuKWybO9xGwH1FF01u2M=;
        b=jW4vYzJXekQuPsnQroOiZ5wUEGnjqZFJfF7XKVvmmnMMcRdRORUExItN9uePgL+lUC
         2AFgm8naJ8R6Rqh44pimIrKqNiUKIHmtgq4tyLKhLPqvEHQnxfUhd967P1TEoyLuoPAk
         a3SD5wi11pyhVAMNpCwlpZFj3uEu6v2yqS4XzHP8C+zZgEotFyEHe6J/UtzfnPUYYKzY
         1cxBD0pH1or6zMdWut6TXQ4TJxR/4Z6fOeEjpECxrwzvmlyu7Tz8kiRFW/TN/ktg7YXK
         KZMqpklhA1pKC4m5RQl9FaX7ntVzpQ2xub2fWmhJbkfqesHViDG+P6NJ5DfL1SdDTZo6
         gyHA==
X-Forwarded-Encrypted: i=1; AJvYcCWI5+q0JkKuBe3sruISwSZTVZWtCXvEMkYk255UT5JFwT+Sl7x0how5+9Z7P9IYzzpy/1yH/9HeD/0v4w==@linaro.org
X-Gm-Message-State: AOJu0YzNO721Vz7S+piAVJUm9tePXOkYJ/drpJ8CK2WgEjZdaC5hchAl
	3df9s4u7a8AJlzKcORzaPh3I1HrrVxHIe84EKKpQM1hQaEydoPiqVSVGNRKNB7stfw==
X-Gm-Gg: ASbGncuN3QSjFN+OvZ3Syid7wOqbR+9ZcVxWJ0U5dX2y1rAtLxf2AU2Ecc07Y0p3N0P
	CYT03RArUOemItUebc1gzm+B4eIt+APMdjin9PntFZgurA4aa+WXVjZz2Ejj+QJVydflTwadQqE
	B60uIVJlCnQ4E4+5cY2h6IJtSeEmOT+/hU2JT8+8rNOffqQIQeCttrjpw7ffKvaw/PDqmhY68lG
	VWfTnbsQPjayGibPjxzh3qMBo1CLZfJP49wfIsLqhcwwcBEd2IsNoTDsObrigjgleNoJCw8sC7z
	i8wviU6fvzAzS3q7UQ+FhLLJiKmHqyKgs/pKwDB3IKmCWUM8YknL5HjUZ6Q=
X-Google-Smtp-Source: AGHT+IForCtadydOvVhTNjd9ECIey58DSMhrG0QgWU5N7F/lu9Reb+pwn3DxvYQ/N+/It+4SLbTErg==
X-Received: by 2002:a05:6000:156c:b0:38f:2ddd:a1bb with SMTP id ffacd0b85a97d-38f33f10603mr11940369f8f.8.1739884834689;
        Tue, 18 Feb 2025 05:20:34 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b824dsm181005315e9.34.2025.02.18.05.20.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 05:20:33 -0800 (PST)
Message-ID: <2691328e-09db-496f-975a-c4f61e358f92@linaro.org>
Date: Tue, 18 Feb 2025 14:20:32 +0100
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
 <dc24cf43-b6a1-42b6-ac93-4128f2c03684@linaro.org>
Content-Language: en-US
In-Reply-To: <dc24cf43-b6a1-42b6-ac93-4128f2c03684@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: lUOJMNYFSOS2

On 18/2/25 14:19, Philippe Mathieu-Daudé wrote:
> On 18/2/25 12:20, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> Adding Xen community.
>>
>> On 8/2/25 21:57, Richard Henderson wrote:
>>> Require a 64-bit host binary to spawn a 64-bit guest.
>>>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   meson.build | 9 +++++++--
>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index 1af8aeb194..911955cfa8 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -304,9 +304,14 @@ else
>>>   endif
>>>   accelerator_targets = { 'CONFIG_KVM': kvm_targets }
>>> -if cpu in ['x86', 'x86_64']
>>> +if cpu == 'x86'
>>> +  xen_targets = ['i386-softmmu']
>>> +elif cpu == 'x86_64'
>>>     xen_targets = ['i386-softmmu', 'x86_64-softmmu']
>>> -elif cpu in ['arm', 'aarch64']
>>> +elif cpu == 'arm'
>>> +  # i386 emulator provides xenpv machine type for multiple 
>>> architectures
>>> +  xen_targets = ['i386-softmmu']
>>
>> Is actually someone *testing* this config? I'm having hard time building
>> it, so am very suspicious about how it runs, and start to wonder if I'm
>> not just wasting my time (as could be our CI).
> 
> This config is not tested and not functional. I'll post a patch
> removing it.

(thus no need to follow the deprecation policy).

> 
>>
>>> +elif cpu == 'aarch64'
>>>     # i386 emulator provides xenpv machine type for multiple 
>>> architectures
>>>     xen_targets = ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu']
>>>   else
>>
>> Regards,
>>
>> Phil.
>>
> 
