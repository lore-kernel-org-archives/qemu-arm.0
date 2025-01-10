Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp476251njn;
        Fri, 10 Jan 2025 15:06:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVFuXbxVK3YTH/tEg8q5+unxPeonpzWUBdPp8oQZMhP9k4dVRheibSeiBultO5Ts63W3X7e+BkI9KURA==@linaro.org
X-Received: by 2002:a05:600c:1da8:b0:436:6460:e67a with SMTP id 5b1f17b1804b1-436e889dff0mr78007305e9.25.1736550382074;
        Fri, 10 Jan 2025 15:06:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736550382; cv=none;
        d=google.com; s=arc-20240605;
        b=GZslgmKUo3Ardh1/USCkrLCsk2K1pmdqXbiErPLbcZ5lFTNd47ebzEY8tY8C+yOzRq
         fkPMFsetdpqTkcYE2fnNoZovReyrB9ucdcwVhf3CD4qV0jfuKD0f9ey5/nV96rwgRB5q
         CTsDkbRKoOJqbYGX4vqjA/39JtADJ/MIpFmvldcuYJDLQjVJTLskTVuH7Cnv1xS1KQAz
         uX38E1ZFOcEEIsTw8RHtaYLVHoYF7GmlZns1j4P8frds/Ye+TOxh4YQPH82QtkhHvPLo
         0xmpo9jBD4EAFViaA28CgLDU7OZPy1WZNH7pWkGIGYWGYzqGJeudNcHv5AQL9vrk2YSf
         fvVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9WvEiz7oRaAe+ed3CIaBlI+rsVdRU+nVSLZIrb/e8xA=;
        fh=EplS/18h3ixqsqLd3HxHvv/TeNlO+mC+2S8l6xlBSbE=;
        b=V42G0z7lHZqYrw2GITkNjZtsgrwV5AM1UV04MQSjUHrLgjYnqizME2LSJ8RijR/VXz
         H4CG55f10NyATfbaAA+yhf60JvosTxoxdKNp9VUQ6u7yrK6SMaJdfHRMutNfUz2yHsrT
         QQJJIYmhWkE1s2UvxA70oe1g64PopwVDgiR++gFyLtBgqW9ne6E6mVTJJBSiMzZpegx8
         aIbqAX1lS5Km5tJPpa77mZFPrgrI7f03hnWXlVlVosV/fzyI2lJx5V3TlrCtiILyixFQ
         +zw0d3RskLB5Cc9yFiKshtbyfsca2C32OkSQXm1loj/5ElLMhKBsqwRtlwxps4m4y3UZ
         SgBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nPJmAcer;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-436e9a556a9sor20016695e9.11.2025.01.10.15.06.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Jan 2025 15:06:22 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nPJmAcer;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736550381; x=1737155181; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9WvEiz7oRaAe+ed3CIaBlI+rsVdRU+nVSLZIrb/e8xA=;
        b=nPJmAceri0O4YmLbEuQi5LIlquTSagVHUOmcWmNjtaDe7vPZcCL8otlMQArfCfUent
         eMyWOp/hva8pJ15+Ttgq0xOzbLIX5TY/hkFQCQ1jPD0xXz2Ajjn9ZO0ThmVXTwPC/iUU
         F47IHBiHLUMCmgZxvmkrGYK5R7bQBkz31nYFrRzfRbUGVSU38Joo4MyoFKN0qGUR4013
         K13m1h5o2rT6vXJOli94IPbO6aNwQYTlBz/KUP3IsTb6GpnKtJrgByha7dR5liLqpaII
         SbZhcN7aFyXwvWI4nqjZB1rw5W+SuC+JVUEQwWNSow2wHKXyWGPUwcDCuLBd4jhtbDoj
         J1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736550381; x=1737155181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9WvEiz7oRaAe+ed3CIaBlI+rsVdRU+nVSLZIrb/e8xA=;
        b=S60wFKD6Eascnb6C1s5sMzq1hZEm3i3lKCR+3PnN+6LD6AFWzxCB4QpwnMT4CJ4UGF
         dgifH2g5NgAuMyWSa9ePBiNrRn6qBF3KpFsFza4YaGtTF02jsHSKjovTuSJjbMnxZmF+
         ABLXU2ppnXgkHAtALpoK0No9Zvk7IRGk0uWVeQObL5V8jSYp2nTepAwGGvlzbhWBzzRN
         zQgig2DIGanmxkC7FoVtRPJpihewoYeQZ25S/e6XE0TtmMDmtco7UK/bABnJJk8AVjny
         MGATCejdKhx07eGlQjHrPVa+fDcn0+ldqP9PIHxfrkQ4YdVAkFeRWKUS/qFR/8E2Fx8O
         Ha8g==
X-Forwarded-Encrypted: i=1; AJvYcCWu/jVhf8QBFCIqvSgvEZWoJxsFGJpIuiRWZhPA1yYh9t39ZsrMC+n/mqFQKdSa6Al1aIIs7FVi7SERNg==@linaro.org
X-Gm-Message-State: AOJu0YwJvHEhfaf8d8+XOjBZAIz5EfNYxej7CHtnleCnJsdLb15+6Jel
	U05SbxOb/z7OIzdsTLfykPraCzEEAs1K1rijRYZIhBD/rDBqkqOIvNM3D5/WZtZv2A==
X-Gm-Gg: ASbGncvx3n4lFClX4oOXkzxyA+jcjvRNR2NnrciuC7LyimdrNSe+uoiRMeRh1LEwNI1
	eqcZ3042SPqAIQrsHfrGy+JbBhC3RUCdW3AOfxjPPG4mUChVcoOSg0+Z2ib/FGcn547z14o6mn1
	XbmY5TmCFIel3jrplMF+VSc1nzCk0cx9aC1N0vPLdf7d8dRKZqiN6ji2XXKBrV3wvdzga+l1vcp
	UlQceXJxL7ACr3ODqP+u0B9u2sb5LBnCFmLcgMT2uL/uRFjbhjRmrjpWZOJ1sUx0nexEdJJCkK+
	Lx8XBYj+LoCRHgus+tN0VRRK7qdSqQ==
X-Google-Smtp-Source: AGHT+IHpF8D887abFDPO14FrPzkdLY625uKWEyjv9MKG+wSN5u5jA2Z7ku3bOO8lVQCcI0WKqUYrDA==
X-Received: by 2002:a05:600c:3c85:b0:436:18d0:aa6e with SMTP id 5b1f17b1804b1-436e2679a7cmr131881975e9.5.1736550381551;
        Fri, 10 Jan 2025 15:06:21 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9d8fba4sm65855165e9.4.2025.01.10.15.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 15:06:20 -0800 (PST)
Message-ID: <11eae685-4bf4-4d64-8cd9-733775df82ed@linaro.org>
Date: Sat, 11 Jan 2025 00:06:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] docs/system/arm/virt: mention specific migration
 information
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20241219183211.3493974-1-pierrick.bouvier@linaro.org>
 <20241219183211.3493974-4-pierrick.bouvier@linaro.org>
 <CAFEAcA-LYWhtFaUanq_qS8nDEVdhDOhDR2kcKv8Ch_5fKSnv-Q@mail.gmail.com>
 <331d0b7b-40db-4a6b-80ba-178892f60506@linaro.org>
 <77f1cf6d-afba-4311-a15b-50594cb5fda0@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <77f1cf6d-afba-4311-a15b-50594cb5fda0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /5dpkD/7vSoy

On 10/1/25 23:59, Pierrick Bouvier wrote:
> On 1/10/25 13:29, Philippe Mathieu-Daudé wrote:
>> On 10/1/25 17:30, Peter Maydell wrote:
>>> On Thu, 19 Dec 2024 at 18:32, Pierrick Bouvier
>>> <pierrick.bouvier@linaro.org> wrote:
>>>>
>>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>> ---
>>>>    docs/system/arm/virt.rst | 14 +++++++++++---
>>>>    1 file changed, 11 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
>>>> index d25275c27ce..9f1457cf9a2 100644
>>>> --- a/docs/system/arm/virt.rst
>>>> +++ b/docs/system/arm/virt.rst
>>
>>
>>>> +VM migration is not guaranteed when using ``-cpu max``, as features 
>>>> supported
>>>> +may change between QEMU versions. To ensure your VM can be 
>>>> migrated, it is
>>>> +recommended to use another cpu model instead.
>>>
>>> This paragraph is good, though -- that 'max' doesn't work for migration
>>> is important, and we should definitely document that.
>>
>> Ah yes, I've been there. 2 close-by comments:
>>
>> - 'max' is not restricted to the 'virt' ARM machine, but this document
>>     is about it, what about other ARM machines?
>>
>> - More generally, "max" CPU won't migrate easily (in different versions)
>>     on all target archs.
>>
>> Not sure where to document that; maybe a generic chapter that can be
>> included in a board.rst template?
> 
> It's a good point.
> Maybe somewhere in docs/devel/migration, where versioning is mentioned?

Yep. docs/devel/migration/compatibility.rst sounds the best place.
