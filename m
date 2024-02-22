Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp63738eja;
        Wed, 21 Feb 2024 22:37:19 -0800 (PST)
X-Received: by 2002:a17:902:c947:b0:1db:d7bf:70 with SMTP id i7-20020a170902c94700b001dbd7bf0070mr13294472pla.20.1708583839280;
        Wed, 21 Feb 2024 22:37:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708583839; cv=none;
        d=google.com; s=arc-20160816;
        b=ICQZk8U50XlWdUXO2wKFXFFgWmjv5EjVmoxTzyND+WTPZ2v6ErY0MFziERrQrWYKM5
         fExc5ljAwDF5rEYwTpJ7cgp59zrhQOpUpdyJ6bWf1rfQc0ni5N40++L/mZy/MiFkAqRu
         g1KgJ0p2V5CHHGsGLQi79KNVkoh987ufoGfKD2NiLYJZ2VYFFE8ES5g+a3Ad42UBvdOE
         gMoq9ZW0dFgy7kNJU8uOq1NxeDXW2cpOT59LcbAlJe8lZ7xv/Zwkqd8k3JWxalBnT/Hh
         OljGvtfT4bYf5Zc3mOtOFdki7DmBoMYoTQHDQsg3L6Qq1vK3tpY82SY2F/psrh/Ej2+L
         i2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=T/b0vPnGvrvn3JM0mQUk+THTOazfpt2hjrIbWxL2JwQ=;
        fh=8cuZ7vqpV859GmXJMo8BdyTx8PFbjG1t2be5aGq38dE=;
        b=LHWjri5MyMZReUDlJ/LlekDIu2z2rx4zXU+7tPLkXbTNKLyh4tWZmlMIB727TeuVod
         AWygAXU/iYzQLsl9Txskh+jedbEQqTv7C4XW/Z7fflUQ4BgFmYghw3LAXf2JxbK7jhOe
         MuujN89h8s148lxluy/ew7NJxCIFko1KAqV3eDwfW5iHuYtupfZRmGzrKZJGPQm7DSjQ
         0DYaHjDCT5utZh3BY59q0IwDYgeQOtt2tFDrbH8GhKn5WIiTNNsK+8UBniNx7yCSteRq
         uwM5hl4NhAhhM0gG7a1trIFkKfVH+odOyX1DDvxqnnAfIwo8WSV28XmALClfaCVkbVFK
         FAKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=cgfd2rsx;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id kf16-20020a17090305d000b001d92a50f95esor7072280plb.8.2024.02.21.22.37.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 Feb 2024 22:37:19 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=cgfd2rsx;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1708583838; x=1709188638; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/b0vPnGvrvn3JM0mQUk+THTOazfpt2hjrIbWxL2JwQ=;
        b=cgfd2rsxr7q+4o1D343NiFmBm5jJfa6o5n83WUNiN+LSdJuFIwhh+AYFUSXi5XH/R5
         DMXNy9N9di7ZA/6jtTNj5vcm+4foLh9K+FXtPeK7xf0d6s3cbBnFqRpRtFiVoB+IYP+H
         58SEUKYOZ3mNiLkhjSAeW8EhGb+7M/3Pzfwhg54027ZLlz9/AdCS6+gh9ZXPifK+nAtb
         5vwOcwldDWIjCYEIHpg02Mx/5/AkROr8vV6nPPL7BhD2+PE1rwcnDrX6QhpsfpaKpMOa
         c5vJ9pwPT65OC+s3lfXztPNAnBV/hMXzzSe13yjww+QUk8bD3Ott9MzrOfhLUaQunAIy
         4lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708583838; x=1709188638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/b0vPnGvrvn3JM0mQUk+THTOazfpt2hjrIbWxL2JwQ=;
        b=HFgWTn/dsHw+cluQ1EAK6yWRd0NSLAhxLMwgtyoN6Mn8jOELwU9doKQCEztdOmdBYu
         BYKmopJxhZZPt7Kay6tEQjak4X2HzVrosO55jXSvvcgmLzi7HrYYUJ8wRfvPIrRFfgY4
         gMT2TvbCAxMKJ9oUuRO8BHlRX7N7E8hENnr+Z6vOpBB0r+qYXWnzd6A/TYbjFsGqfjTB
         xCD3qSXlYKfJoBon5pZ4Fv4TiyhoM2aQkC7sDM9pw4Z5D+ZE7Mv3pa7Skv0Qv5wxS24Q
         PSadRx0U/UdJjgmNvegircmCkczYR2/YJx/Ikgn/CBppwWShlAPWaKKkaKgAYb5dDgPa
         q6Rw==
X-Gm-Message-State: AOJu0Yzb5Y7h2hsJQdqAoLow/IPOJCI6sxIuXJA++3PxFVXxfAQwqx7c
	N+8BTRC/OoIxVQdL85o9xbntNbKy5jPOJC3uSVpwShQSMRjNUz2L9f62IaY6M+tyGmB8WvHmtwd
	Q
X-Google-Smtp-Source: AGHT+IF4O25LMrfr5cKmZpDOT1LBxKto4EFWbnhcbXh/aqoIlqGIXhg34IDcGYHRkkraYVZBK+AmOw==
X-Received: by 2002:a05:6a21:594:b0:1a0:bb45:415a with SMTP id lw20-20020a056a21059400b001a0bb45415amr4830565pzb.28.1708583838595;
        Wed, 21 Feb 2024 22:37:18 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.203.206] ([157.82.203.206])
        by smtp.gmail.com with ESMTPSA id y18-20020a056a00181200b006e3f62e1fbbsm8436227pfa.24.2024.02.21.22.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 22:37:18 -0800 (PST)
Message-ID: <7e4b4ba6-3683-464f-ac37-3b7f19455643@daynix.com>
Date: Thu, 22 Feb 2024 15:37:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/23] plugins: add an API to read registers
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, John Snow
 <jsnow@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-s390x@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Brian Cain
 <bcain@quicinc.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20240216163025.424857-1-alex.bennee@linaro.org>
 <20240216163025.424857-19-alex.bennee@linaro.org>
 <c38a22b5-01e8-40f1-bfc4-4bba9bf7b516@daynix.com>
 <87il2jcje8.fsf@draig.linaro.org>
 <bf31a250-9539-448c-9c64-4168ab8741f1@daynix.com>
 <87bk8ab0f4.fsf@draig.linaro.org>
 <bf5e9471-c09f-47f2-a5a3-83713255c47a@daynix.com>
 <87zfvtaoqq.fsf@draig.linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87zfvtaoqq.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: gEDT0a9yuI7v

On 2024/02/21 23:14, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2024/02/21 19:02, Alex Bennée wrote:
>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>
>>>> On 2024/02/20 23:14, Alex Bennée wrote:
>>>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>>>
>>>>>> On 2024/02/17 1:30, Alex Bennée wrote:
>>>>>>> We can only request a list of registers once the vCPU has been
>>>>>>> initialised so the user needs to use either call the get function on
>>>>>>> vCPU initialisation or during the translation phase.
>>>>>>> We don't expose the reg number to the plugin instead hiding it
>>>>>>> behind
>>>>>>> an opaque handle. This allows for a bit of future proofing should the
>>>>>>> internals need to be changed while also being hashed against the
>>>>>>> CPUClass so we can handle different register sets per-vCPU in
>>>>>>> hetrogenous situations.
>>>>>>> Having an internal state within the plugins also allows us to expand
>>>>>>> the interface in future (for example providing callbacks on register
>>>>>>> change if the translator can track changes).
>>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
>>>>>>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>>>> Message-Id: <20240103173349.398526-39-alex.bennee@linaro.org>
>>>>>>> Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
>>>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>>> <snip>
>>>>>>> +/*
>>>>>>> + * Register handles
>>>>>>> + *
>>>>>>> + * The plugin infrastructure keeps hold of these internal data
>>>>>>> + * structures which are presented to plugins as opaque handles. They
>>>>>>> + * are global to the system and therefor additions to the hash table
>>>>>>> + * must be protected by the @reg_handle_lock.
>>>>>>> + *
>>>>>>> + * In order to future proof for up-coming heterogeneous work we want
>>>>>>> + * different entries for each CPU type while sharing them in the
>>>>>>> + * common case of multiple cores of the same type.
>>>>>>> + */
>>>>>>> +
>>>>>>> +static QemuMutex reg_handle_lock;
>>>>>>> +
>>>>>>> +struct qemu_plugin_register {
>>>>>>> +    const char *name;
>>>>>>> +    int gdb_reg_num;
>>>>>>> +};
>>>>>>> +
>>>>>>> +static GHashTable *reg_handles; /* hash table of PluginReg */
>>>>>>> +
>>>>>>> +/* Generate a stable key - would xxhash be overkill? */
>>>>>>> +static gpointer cpu_plus_reg_to_key(CPUState *cs, int gdb_regnum)
>>>>>>> +{
>>>>>>> +    uintptr_t key = (uintptr_t) cs->cc;
>>>>>>> +    key ^= gdb_regnum;
>>>>>>> +    return GUINT_TO_POINTER(key);
>>>>>>> +}
>>>>>>
>>>>>> I have pointed out this is theoretically prone to collisions and
>>>>>> unsafe.
>>>>> How is it unsafe? The aim is to share handles for the same CPUClass
>>>>> rather than having a unique handle per register/cpu combo.
>>>>
>>>> THe intention is legitimate, but the implementation is not safe. It
>>>> assumes (uintptr)cs->cc ^ gdb_regnum is unique, but there is no such
>>>> guarantee. The key of GHashTable must be unique; generating hashes of
>>>> keys should be done with hash_func given to g_hash_table_new().
>>> This isn't a hash its a non-unique key. It is however unique for
>>> the same register on the same class of CPU so for each vCPU in a system
>>> can share the same opaque handles.
>>> The hashing is done internally by glib. We would assert if there was
>>> a
>>> duplicate key referring to a different register.
>>> I'm unsure what you want here? Do you have a suggestion for the key
>>> generation algorithm? As the comment notes I did consider a more complex
>>> mixing algorithm using xxhash but that wouldn't guarantee no clash
>>> either.
>>
>> I suggest using a struct that holds both of cs->cc and gdb_regnum, and
>> pass g_direct_equal() and g_direct_hash() to g_hash_table_new().
> 
> We already do:
> 
>          if (!reg_handles) {
>              reg_handles = g_hash_table_new(g_direct_hash, g_direct_equal);
>          }
> 
> But we can't use g_direct_equal with something that exceeds the width of
> gpointer as it is a straight equality test of the key. What you are
> suggesting requires allocating memory for each key and de-referencing
> with a custom GEqualFunc.

My bad. I wrongly remembered g_direct_equal() and g_direct_hash(). It 
indeed seems to need a more complicated solution.

It is possible to write a GEqualFunc and a GHashFunc that consumes a 
struct but it is a chore. How about having a two-level GHashTable? 
reg_handles will be a GHashTable keyed with cs->cc, and another 
GHashTable will be keyed with gdb_regnum.
