Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1827968ejb;
        Wed, 21 Feb 2024 02:11:14 -0800 (PST)
X-Received: by 2002:a92:c749:0:b0:365:bee:2563 with SMTP id y9-20020a92c749000000b003650bee2563mr15847627ilp.32.1708510274581;
        Wed, 21 Feb 2024 02:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708510274; cv=none;
        d=google.com; s=arc-20160816;
        b=NKjLRQLp7atNJuV2jhAvya694R//UsCf3p3NP+K6HGntSZn4DxgYu7/OvVK0Pgzz/q
         dNGfMp3hi5xHgnZbW1bL5bP7NE21/o4F6XBPnlGvo9NdABoKSTHYswaW+mrkv7owo1gY
         lZ0qQNITQMjcq0grfMqOk0NETLn0JSgf8pwf7Kfp0uosyEhGTt2NUsGCjr3grNn4bpjX
         avpqPd99/V3L8RMotZqo0jPCwRyerlD08La3rbZiwYMNivIqt7pdj6DWowF2BRxWfZUP
         CmHu0HibMR/IbXRdxctyE4GXPFrqTEeeW4MW8Qq8lUnlLmeMHhXT733+GmTzJypQkbTK
         Ga6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=XPD8jhIbDSZIaggwaCTJVQeh546LjhKhNB7LZ3iOLyU=;
        fh=8cuZ7vqpV859GmXJMo8BdyTx8PFbjG1t2be5aGq38dE=;
        b=jbT7qAz4fKWTLFvtzxakJo2gwFFlpp6nQ3oja2UMoapzXLZ+tC3HN04LhRi3kfV6lJ
         hzSk5AoFnMDCrehzbuqeVBBvZ5/6zH59b7i0UXmUT3QlbufMr6O9VUlDeUP5TPVbeg82
         q346/OtrYKaDnTm5zEhMnyDxgBZgBrckCcvgAEejgKoI7fNBvOKS2koLTV5u3KjnU8VH
         JhCMcmoSFE1IBUZmXdyZzN2PGPqZD3zuqIbVwZ7CAr+sutVEkUZ2cTacWIN1hZPwZPrJ
         XRCOew4hNWpeO25On6PJw5tFsGRz8qu2mWxK0zV+WGWCrEileQhpz9/GdlZw/JTFUdIh
         x5Ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=gdR2cfM+;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d15-20020a056e021c4f00b00363861a90bfsor2359741ilg.15.2024.02.21.02.11.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 Feb 2024 02:11:14 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=gdR2cfM+;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1708510274; x=1709115074; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XPD8jhIbDSZIaggwaCTJVQeh546LjhKhNB7LZ3iOLyU=;
        b=gdR2cfM+5NAZKOrl3l/8zI8j0FdVOFUnaE1P3E4m/UfT9saK3cDaeu0F7BdNVdO/EW
         X26hzAAwSD83ovo/CswlsWNxbytG0RnXCx159aapgNSzWM8I1HoFbobTge2OtKDECWCo
         ya4vSkl9c8nBCltskKbZtkO7zM3fScV3ZXz5GyPj5Ejs1Dl3FiOqLv+oGTNtJCMQkUyx
         iVyXQYqs5xPgJG29F0iqR76u4gLEZK2F/4SMCtLsBLabs2iLB8ZOcz4gWhyTZM9bN6mM
         WgLJ27Lmi64fBHOY9BGHQN1SbqlFe1G0fTuns3SISBl7hdo7E4g4/w/JP2G3ZR4NFI5m
         fFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708510274; x=1709115074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPD8jhIbDSZIaggwaCTJVQeh546LjhKhNB7LZ3iOLyU=;
        b=wg9yB2CSaa0pImFkit6QzWgs4MQ8Z9NlAWYcM4jDwpyNRJqsEtl/A5gQiExPs8EsuF
         asrjeU/TyKF8HRo2MOb355W8Z/ldPBLyFnlydMJiTj22Yc5hskLHCt6xRGl7evLDrqt7
         FlM1d1/F4al7IhE4iSUVx7KxeiWOMREdprneZ7DHo9/SH6EPgch/+59HOUXyzOrE57I2
         lBI4fyjtgyZNgGeRSE2Ed3sJDgRVtVrPcDmutVgpDLmGCbnGXoaJfhjgw8z+lpLuCZsE
         a+wX7h3XL3vsnRqWu0PZDNHAGqdjJ8A6WzhIpKU4buqp2HVHcCyJG+mVsanhaY5OdiNV
         Oo4A==
X-Gm-Message-State: AOJu0Yw4oP2pGwarG9p5DHl/5CgKMoYrVvRqaK6nhpUr75xCFXcxj1Wm
	8Tu92uj9Qw/soDobn8dYSoCF4ylNfS74cxD7elzcQtfogSi2mWwZw5VwDVcj3+Y0utM1SOmQy2S
	+
X-Google-Smtp-Source: AGHT+IE7unUuLCbAK2t/Rvu+pMjVTIQBGYWgnPs3uyfsRXfNtlQE9xB+W0G6Wq5Jmoc53U6R0JsUzA==
X-Received: by 2002:a05:6e02:214e:b0:364:2239:a89b with SMTP id d14-20020a056e02214e00b003642239a89bmr19188267ilv.11.1708510273879;
        Wed, 21 Feb 2024 02:11:13 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.203.206] ([157.82.203.206])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm8034185pga.71.2024.02.21.02.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 02:11:13 -0800 (PST)
Message-ID: <bf5e9471-c09f-47f2-a5a3-83713255c47a@daynix.com>
Date: Wed, 21 Feb 2024 19:11:05 +0900
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
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87bk8ab0f4.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /dulXsWh9cKR

On 2024/02/21 19:02, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2024/02/20 23:14, Alex Bennée wrote:
>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>
>>>> On 2024/02/17 1:30, Alex Bennée wrote:
>>>>> We can only request a list of registers once the vCPU has been
>>>>> initialised so the user needs to use either call the get function on
>>>>> vCPU initialisation or during the translation phase.
>>>>> We don't expose the reg number to the plugin instead hiding it
>>>>> behind
>>>>> an opaque handle. This allows for a bit of future proofing should the
>>>>> internals need to be changed while also being hashed against the
>>>>> CPUClass so we can handle different register sets per-vCPU in
>>>>> hetrogenous situations.
>>>>> Having an internal state within the plugins also allows us to expand
>>>>> the interface in future (for example providing callbacks on register
>>>>> change if the translator can track changes).
>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
>>>>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>> Message-Id: <20240103173349.398526-39-alex.bennee@linaro.org>
>>>>> Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> <snip>
>>>>> +/*
>>>>> + * Register handles
>>>>> + *
>>>>> + * The plugin infrastructure keeps hold of these internal data
>>>>> + * structures which are presented to plugins as opaque handles. They
>>>>> + * are global to the system and therefor additions to the hash table
>>>>> + * must be protected by the @reg_handle_lock.
>>>>> + *
>>>>> + * In order to future proof for up-coming heterogeneous work we want
>>>>> + * different entries for each CPU type while sharing them in the
>>>>> + * common case of multiple cores of the same type.
>>>>> + */
>>>>> +
>>>>> +static QemuMutex reg_handle_lock;
>>>>> +
>>>>> +struct qemu_plugin_register {
>>>>> +    const char *name;
>>>>> +    int gdb_reg_num;
>>>>> +};
>>>>> +
>>>>> +static GHashTable *reg_handles; /* hash table of PluginReg */
>>>>> +
>>>>> +/* Generate a stable key - would xxhash be overkill? */
>>>>> +static gpointer cpu_plus_reg_to_key(CPUState *cs, int gdb_regnum)
>>>>> +{
>>>>> +    uintptr_t key = (uintptr_t) cs->cc;
>>>>> +    key ^= gdb_regnum;
>>>>> +    return GUINT_TO_POINTER(key);
>>>>> +}
>>>>
>>>> I have pointed out this is theoretically prone to collisions and
>>>> unsafe.
>>> How is it unsafe? The aim is to share handles for the same CPUClass
>>> rather than having a unique handle per register/cpu combo.
>>
>> THe intention is legitimate, but the implementation is not safe. It
>> assumes (uintptr)cs->cc ^ gdb_regnum is unique, but there is no such
>> guarantee. The key of GHashTable must be unique; generating hashes of
>> keys should be done with hash_func given to g_hash_table_new().
> 
> This isn't a hash its a non-unique key. It is however unique for
> the same register on the same class of CPU so for each vCPU in a system
> can share the same opaque handles.
> 
> The hashing is done internally by glib. We would assert if there was a
> duplicate key referring to a different register.
> 
> I'm unsure what you want here? Do you have a suggestion for the key
> generation algorithm? As the comment notes I did consider a more complex
> mixing algorithm using xxhash but that wouldn't guarantee no clash
> either.

I suggest using a struct that holds both of cs->cc and gdb_regnum, and 
pass g_direct_equal() and g_direct_hash() to g_hash_table_new().
