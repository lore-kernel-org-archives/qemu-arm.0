Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp435649njn;
        Fri, 10 Jan 2025 13:29:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWcV6d7HuoLj2hmLRRBXOKH23CRluDCEtY9ljqGpgFuR0lU13/u6VSiGrIQeka1aMdpegShEpxnG5+Lkg==@linaro.org
X-Received: by 2002:a05:6000:18ae:b0:38a:4b8b:1ba with SMTP id ffacd0b85a97d-38a873049e3mr11516374f8f.14.1736544551591;
        Fri, 10 Jan 2025 13:29:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736544551; cv=none;
        d=google.com; s=arc-20240605;
        b=aIL58FSzxkKvrPwRaukNWiUDXvL4U4IofX3I35QSSt4/LjN3mZobYH6uCBPizc1qu8
         Dk1QlMrfQAsYHdEPgqHRkYhkr0ostD4H730OUP+WlBrFZfuZYXZ1u+jEWI4Z3+RZk1W5
         pEpE2vjmH26XitUGPtV7TIfcqbiooo3GfBkIzsftOlUyofSY7qcthukW5oHDfFUhRPWE
         F4j6YwVLGQ/K2zL1GNURz3hDkzvcrYHpNrhEmGK2DRvvpnXYTB57ZogrL+/rMTWT9uPo
         RarBQcT+k6BDdwn1jysOVoX4UgQNcaMqQYxes4FqcrvKBDoV5kFNWf00xoi7yUkRPcdM
         b4vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fbvXoBhBxiCwa6nIvqU4MPfEkFBKSPV+I1cN8+JUX5o=;
        fh=PRtLcwAZS4EVOwCmb++xxC++1qSY6fmvNGQX9F2HGgI=;
        b=KFSJJFslaZOF1DxSj7TFYEAdFx283d133m50eHrllyPye98iX5m5m4IYkhRIHz0eMA
         xndp3+iIcEsOGCHNMInb4p5MZlZ2L+OUjK+NzLJstXfyU0Hf7oJu9r3ToblFw8vHIJuP
         zeWLmh+VWnxY7hBRWVK6TGhQVhA+auUk53sNBmH3ntQeY/xpVTuMK3NAJnJur4iCW1ST
         +HC1MgTKbjvG2SAAi9DtaTgdASWPIVwAW1ZJlg4ekdu/O9SHNdX3NaQzLisNfPzPqTqT
         MA90AdN2B0TeQQ3Z9RNbjxBzLD32XUnUaK0UaJ1KS+oBnhwTGS1NY9W5CwfuEHr2Gzgz
         PHSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gK1LcwOg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38a8e4aea99sor1963822f8f.6.2025.01.10.13.29.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Jan 2025 13:29:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gK1LcwOg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736544551; x=1737149351; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fbvXoBhBxiCwa6nIvqU4MPfEkFBKSPV+I1cN8+JUX5o=;
        b=gK1LcwOg2wST9S7rXRhKQPwSHb1a7/uaOFZ3hM/Ee86wYQdAw6NqQO2e1p/w5Uf7Fj
         mKfM6Kel5qddoZDuo71RBEIlsqXMxfGcsYyn/23Td8GZVsDVCSMdo+yrkpvw8hU/TtD6
         ziftp4LumtdyRyOyiSMrBqW/7p7TYzyl0JINx4Jrn77ljmvyl6ZuQLbdnQ/yf+sdBqGs
         CudLD9axY32ju+TBU9Csm1tE/KC6NEicReC428Yqi3PqP2m01FLW+5z3VkkutB1Ha3ck
         UOByXHbmRnkxuNTwco3PpAJU4oXBqCqT8jm4eb7UugqDC4eabdobbzziDmzLw8t6ERzX
         S4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736544551; x=1737149351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fbvXoBhBxiCwa6nIvqU4MPfEkFBKSPV+I1cN8+JUX5o=;
        b=ri/yTaZ3KVyuThoVRjOd5lMnfe44C34MO23gcJVEe6l6aR9y2gZpuEoVKrjb79R/MV
         hL5Puxryyi6KGWIPYRMnJi52iXJNMm5Xpkry4x3GArxrzKRC2a89K6My/lT7DtMn43/D
         +6dYBmT74kQD5gfZBweWigUnxP8g6YPEATR1cVjAKNpU4CmHwgifu+bP6bKcUAPCyz5W
         GhxTkNBIMA6S08Q3jEnQx4hJHaJr9xoRdmzkEN4sBt/AMp00ciBhI9MPuy+yunGobciG
         Rcs51TYJSnWkPYtpu4WZQZnv7lAEcYO+3mDZ9Ps/L0/pg6Bb7tfakrMPE38ChZUwIhdQ
         wD6g==
X-Forwarded-Encrypted: i=1; AJvYcCV7qAQfoFx1IqqsGR9hj6jtQhV7wWROk5k0LtekA9PwroQoTt9TWmbo2XDxcJ0PvEQBWtYFr6lwP3M9Iw==@linaro.org
X-Gm-Message-State: AOJu0YxD2vSCcuDzsr+cEM+zUt1Pzn3P56v0XirYaDfMBKZimcYx40fq
	Q3UA614HNTh0aCNYSC6XY61vnHYZRk2422QCqIDTIhfFyPRVoDx1vjvZyCLMJlL3wg==
X-Gm-Gg: ASbGncseCJUc0Y8LvEXiO8z47a2mfmZlQGYiUev/o1WCwVPNp4lSo2XZihRKRN7PleP
	Sy5/Fb4JeIWR6VE0mj/Qx/djDxt+WJMcfkmCQftwA+uNrm6GkTjIRJcwYi/yk8CEInjC31/qnB5
	bKqsexwH3dLJgg+ZlnQ7xV2M+i060BnKEhFVbh/Hg/VVrxAGMMuuWPAkUwoT4fLZJvUOsP6Mw+6
	EpbDb5cbCzjZi8VyzWMoPGORUXsl4HWvRFLTYM3EaBNjWUvpJlFrM/zXmwsmY8gJhy6tOWOeWPX
	XoacsLH8Zjsm2yU7XysRvlEM+0Rd5Q==
X-Google-Smtp-Source: AGHT+IFCngRRzBH2bbSEVPKw3buqQwex23MUTpgfO8hjFAYZzHLnjWNULFkxG/PI0JHR6pkrTO/PwQ==
X-Received: by 2002:a5d:64cc:0:b0:385:e8ce:7483 with SMTP id ffacd0b85a97d-38a872faf34mr9403358f8f.4.1736544551032;
        Fri, 10 Jan 2025 13:29:11 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2c27008sm98910035e9.0.2025.01.10.13.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 13:29:10 -0800 (PST)
Message-ID: <331d0b7b-40db-4a6b-80ba-178892f60506@linaro.org>
Date: Fri, 10 Jan 2025 22:29:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] docs/system/arm/virt: mention specific migration
 information
To: Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20241219183211.3493974-1-pierrick.bouvier@linaro.org>
 <20241219183211.3493974-4-pierrick.bouvier@linaro.org>
 <CAFEAcA-LYWhtFaUanq_qS8nDEVdhDOhDR2kcKv8Ch_5fKSnv-Q@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-LYWhtFaUanq_qS8nDEVdhDOhDR2kcKv8Ch_5fKSnv-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Dq7MKZaGjoOZ

On 10/1/25 17:30, Peter Maydell wrote:
> On Thu, 19 Dec 2024 at 18:32, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>   docs/system/arm/virt.rst | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
>> index d25275c27ce..9f1457cf9a2 100644
>> --- a/docs/system/arm/virt.rst
>> +++ b/docs/system/arm/virt.rst


>> +VM migration is not guaranteed when using ``-cpu max``, as features supported
>> +may change between QEMU versions. To ensure your VM can be migrated, it is
>> +recommended to use another cpu model instead.
> 
> This paragraph is good, though -- that 'max' doesn't work for migration
> is important, and we should definitely document that.

Ah yes, I've been there. 2 close-by comments:

- 'max' is not restricted to the 'virt' ARM machine, but this document
   is about it, what about other ARM machines?

- More generally, "max" CPU won't migrate easily (in different versions)
   on all target archs.

Not sure where to document that; maybe a generic chapter that can be
included in a board.rst template?
