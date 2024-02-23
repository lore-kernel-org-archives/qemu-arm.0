Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp483462ejf;
        Fri, 23 Feb 2024 02:58:49 -0800 (PST)
X-Received: by 2002:a05:6358:9229:b0:17b:581c:430e with SMTP id d41-20020a056358922900b0017b581c430emr1495166rwb.3.1708685929335;
        Fri, 23 Feb 2024 02:58:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708685929; cv=none;
        d=google.com; s=arc-20160816;
        b=GE6XDLZ270+32fV8fqIh8jlrmxXzHJrRJV25jP4KoMiwf2qS0TzCZ6oxm5qXoPhlts
         j9lJLeHQdxKr1k3M1ngDzz13FEC3I+K1RiQ9e1pvvH59eb0L4ise+Ve9ol2OMGhzYY43
         9RONk/y6quAs6WvhBGC1ChAkDoVoFt1GIvdHMkHh+xfwxDTdykjUf64Vp+HFtgj/kiLU
         neJke9Bczs2mh6RazpM+kdY55Q3W07x9nAsSTdHSeL6kkkCO0IiAu2P8tqOywnRa0P9i
         LRUnEZPw43XPdOcG2apO4MHQBCDbrtDDEdTBbzyZHbd+CrIyKMX89rrkdxP0R5xtHy6+
         U+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EpbXx+7haH1GYOtKVl30UsM+arK0qNuLz1pHozXP9pQ=;
        fh=8cuZ7vqpV859GmXJMo8BdyTx8PFbjG1t2be5aGq38dE=;
        b=tuttniEh04L/Kc0osQM3Kn6eq8GXoFDPCJvFrUuet/5yOxT8ZQo54oFMbquS7xvIAk
         xKJ0bq556AJv6+hZogpZneDqK/+pQRleBE8oC8e0ISCP6L38Xo4Jrr8QS4eps43x287V
         Iy7NFolmD06npUMB2ZjYNtW5C9bURuMM2hxvzgmHkW3k2NIRVjl0X7Ajh/lwkFNgdkeU
         TnSG8OyGRI2g0vVgpnG4fs+t7nBQBX4Qglb2deHygfATRQoiXEj4a/BO97BLqLZJbpCz
         XZcLBAKbMN4/xLpT5/vIFaKyCiD6pUZJGZGZu7zf6QkFNZzzPNXil/Lnbkm7hDpm2bbw
         TopA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=DGNRJUj3;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h62-20020a625341000000b006e02ff65b3csor8526841pfb.8.2024.02.23.02.58.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2024 02:58:49 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=DGNRJUj3;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1708685928; x=1709290728; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EpbXx+7haH1GYOtKVl30UsM+arK0qNuLz1pHozXP9pQ=;
        b=DGNRJUj3ONnN2AZ6DZVWKhIv9wyBvJhmGvTWbI1afHWwD5RJ266V92Sdm86/hYcEWh
         5bHFnFp10SGxG48ABhNpjf8bzmiJ4uF0LU6+7Fg9LXPfkso5V9u4/4mj6bFAS1IVYBqu
         EMuaSnPG6aiSXQofVocTE7ZOPb8ZcYh+xLVRLpluamvWKZ9XZuixPG5pQQ6NGaEbDzqt
         b9airvMf5IURkwTj7ycbAb+uNlJqEqyjQc1Ier4ZrMlVzE0XYDAu2AaL5VfyHJM9A/Ee
         1alFFQW/12zDV2Y6Hb5+VHWOLIjhdeP2fl97bFnRWV9NBOzfzbV2OgGatbPc0SOknl0Q
         UpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708685928; x=1709290728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EpbXx+7haH1GYOtKVl30UsM+arK0qNuLz1pHozXP9pQ=;
        b=IJgW2HTRKTf4TDc2Z1i0nZTMZZwnUL5lmsPtKHqE5ajoeztfEuPYpSbuO/qDLNxYvw
         yD5r4d494q4k1Ym+MJYaUKMznwdVRGEELhQvFmZJIoQhplOF0wL/3LrkI4vyh/HfTC6Q
         OnvkCQmTEtWIS/K/MrZH1Xu+Se40gHalpfENqPZLhZTaNLJIeJZgH3Hk68xF+k2HYS1z
         NLwRiW5ub04gzSQ9Jhp+8WTPpBGo8PMcNROtXYYFiLrTq4Ss9JQhfni8gj7fInMSSMWg
         PRjHLxWLh1UAaXIbhUaR9D16ju3kbbu7w4RKfSez7e17qjYadlJsragA4vDHmFAyzTfM
         WDfQ==
X-Gm-Message-State: AOJu0YzXZWYiI1A/qbfGfcOisUURdK2pSGy2IyYdPI+8x4TRdddvGTXr
	AMFv3oswmEUD8ciaYLjI4lvbZAFgCAtqm/ucwBg6bsog4c5HCGWIJNseZdDtsQTFJ3IOuV3pG5l
	1
X-Google-Smtp-Source: AGHT+IGmOSVfIxGx7+Z7RRI6jAHl8gSIFO1wqOIRw0QKk3OFe1CHU5caYalbZ42k9eQo6qTyqZfugA==
X-Received: by 2002:a62:d459:0:b0:6e4:df65:8335 with SMTP id u25-20020a62d459000000b006e4df658335mr1045740pfl.16.1708685928499;
        Fri, 23 Feb 2024 02:58:48 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.203.206] ([157.82.203.206])
        by smtp.gmail.com with ESMTPSA id x3-20020aa79a43000000b006e4dad633e1sm1534666pfj.177.2024.02.23.02.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 02:58:48 -0800 (PST)
Message-ID: <308de8f7-5871-4d3d-847c-f4f55fb6f790@daynix.com>
Date: Fri, 23 Feb 2024 19:58:40 +0900
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
 <7e4b4ba6-3683-464f-ac37-3b7f19455643@daynix.com>
 <87cysoajhl.fsf@draig.linaro.org>
 <f4b0b535-9e2b-47c7-a84b-afd851deb88a@daynix.com>
 <87plwo8l56.fsf@draig.linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87plwo8l56.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: dmrzU2JpV3bP

On 2024/02/23 2:27, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2024/02/22 19:20, Alex Bennée wrote:
>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>
>>>> On 2024/02/21 23:14, Alex Bennée wrote:
>>>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>>>
>>>>>> On 2024/02/21 19:02, Alex Bennée wrote:
>>>>>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>>>>>
>>>>>>>> On 2024/02/20 23:14, Alex Bennée wrote:
>>>>>>>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>>>>>>>
>>>>>>>>>> On 2024/02/17 1:30, Alex Bennée wrote:
>>>>>>>>>>> We can only request a list of registers once the vCPU has been
>>>>>>>>>>> initialised so the user needs to use either call the get function on
>>>>>>>>>>> vCPU initialisation or during the translation phase.
>>>>>>>>>>> We don't expose the reg number to the plugin instead hiding it
>>>>>>>>>>> behind
>>>>>>>>>>> an opaque handle. This allows for a bit of future proofing should the
>>>>>>>>>>> internals need to be changed while also being hashed against the
>>>>>>>>>>> CPUClass so we can handle different register sets per-vCPU in
>>>>>>>>>>> hetrogenous situations.
>>>>>>>>>>> Having an internal state within the plugins also allows us to expand
>>>>>>>>>>> the interface in future (for example providing callbacks on register
>>>>>>>>>>> change if the translator can track changes).
>>>>>>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
>>>>>>>>>>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>>>>>>>> Message-Id: <20240103173349.398526-39-alex.bennee@linaro.org>
>>>>>>>>>>> Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
>>>>>>>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>>>>>>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>>>>>>> <snip>
>>>>>>>>>>> +/*
>>>>>>>>>>> + * Register handles
>>>>>>>>>>> + *
>>>>>>>>>>> + * The plugin infrastructure keeps hold of these internal data
>>>>>>>>>>> + * structures which are presented to plugins as opaque handles. They
>>>>>>>>>>> + * are global to the system and therefor additions to the hash table
>>>>>>>>>>> + * must be protected by the @reg_handle_lock.
>>>>>>>>>>> + *
>>>>>>>>>>> + * In order to future proof for up-coming heterogeneous work we want
>>>>>>>>>>> + * different entries for each CPU type while sharing them in the
>>>>>>>>>>> + * common case of multiple cores of the same type.
>>>>>>>>>>> + */
>>>>>>>>>>> +
>>>>>>>>>>> +static QemuMutex reg_handle_lock;
>>>>>>>>>>> +
>>>>>>>>>>> +struct qemu_plugin_register {
>>>>>>>>>>> +    const char *name;
>>>>>>>>>>> +    int gdb_reg_num;
>>>>>>>>>>> +};
>>>>>>>>>>> +
>>>>>>>>>>> +static GHashTable *reg_handles; /* hash table of PluginReg */
>>>>>>>>>>> +
>>>>>>>>>>> +/* Generate a stable key - would xxhash be overkill? */
>>>>>>>>>>> +static gpointer cpu_plus_reg_to_key(CPUState *cs, int gdb_regnum)
>>>>>>>>>>> +{
>>>>>>>>>>> +    uintptr_t key = (uintptr_t) cs->cc;
>>>>>>>>>>> +    key ^= gdb_regnum;
>>>>>>>>>>> +    return GUINT_TO_POINTER(key);
>>>>>>>>>>> +}
>>>>>>>>>>
>>>>>>>>>> I have pointed out this is theoretically prone to collisions and
>>>>>>>>>> unsafe.
>>>>>>>>> How is it unsafe? The aim is to share handles for the same CPUClass
>>>>>>>>> rather than having a unique handle per register/cpu combo.
>>>>>>>>
>>>>>>>> THe intention is legitimate, but the implementation is not safe. It
>>>>>>>> assumes (uintptr)cs->cc ^ gdb_regnum is unique, but there is no such
>>>>>>>> guarantee. The key of GHashTable must be unique; generating hashes of
>>>>>>>> keys should be done with hash_func given to g_hash_table_new().
>>>>>>> This isn't a hash its a non-unique key. It is however unique for
>>>>>>> the same register on the same class of CPU so for each vCPU in a system
>>>>>>> can share the same opaque handles.
>>>>>>> The hashing is done internally by glib. We would assert if there was
>>>>>>> a
>>>>>>> duplicate key referring to a different register.
>>>>>>> I'm unsure what you want here? Do you have a suggestion for the key
>>>>>>> generation algorithm? As the comment notes I did consider a more complex
>>>>>>> mixing algorithm using xxhash but that wouldn't guarantee no clash
>>>>>>> either.
>>>>>>
>>>>>> I suggest using a struct that holds both of cs->cc and gdb_regnum, and
>>>>>> pass g_direct_equal() and g_direct_hash() to g_hash_table_new().
>>>>> We already do:
>>>>>            if (!reg_handles) {
>>>>>                reg_handles = g_hash_table_new(g_direct_hash, g_direct_equal);
>>>>>            }
>>>>> But we can't use g_direct_equal with something that exceeds the
>>>>> width of
>>>>> gpointer as it is a straight equality test of the key. What you are
>>>>> suggesting requires allocating memory for each key and de-referencing
>>>>> with a custom GEqualFunc.
>>>>
>>>> My bad. I wrongly remembered g_direct_equal() and g_direct_hash(). It
>>>> indeed seems to need a more complicated solution.
>>>>
>>>> It is possible to write a GEqualFunc and a GHashFunc that consumes a
>>>> struct but it is a chore. How about having a two-level GHashTable?
>>>> reg_handles will be a GHashTable keyed with cs->cc, and another
>>>> GHashTable will be keyed with gdb_regnum.
>>> That still seems overkill for a clash that can't happen. What do you
>>> think about the following:
>>>     /*
>>>      * Generate a stable key shared across CPUs of the same class
>>>      *
>>>      * In order to future proof for up-coming heterogeneous work we want
>>>      * different entries for each CPU type while sharing them in the
>>>      * common case of multiple cores of the same type. This makes the
>>>      * assumption you won't see two CPUClass pointers that are similar
>>>      * enough that the low bits mixed with different registers numbers
>>>      * will give you the same key.
>>>      *
>>>      * The build time assert will fire if CPUClass goes on a sudden diet
>>>      * and we assert further down if we detect two keys representing
>>>      * different regnums. In practice allocations of CPUClass are much
>>>      * farther apart making clashes practically impossible.
>>>      */
>>>     static gpointer cpu_plus_reg_to_key(CPUState *cs, int gdb_regnum)
>>>     {
>>>         uintptr_t key = (uintptr_t) cs->cc;
>>>         /* this protects some of the assumptions above */
>>>         qemu_build_assert(sizeof(*cs->cc) >= 256);
>>>         key ^= gdb_regnum;
>>>         return GUINT_TO_POINTER(key);
>>>     }
>>
>>
>> I think the assertion and comments are overkill. Doesn't having a
>> nested GHashTable save some words you have to wrote for the
>> assumption?
> 
> A nested hash table for a single entry is overkill.

You mean that the first level will be indexed by only one CPUClass (or 
few if we support a heterogeneous system).

I think it's still OK though. It's not like we will need more code when 
having few entries.

> 
>> I'm also not quite convinced that the comments and assertions are
>> enough to say this hack is safe; what if some sort of pointer
>> authentication is added and shuffles bits? Will this hack be
>> compatible with static and dynamic checkers we may have in the future?
> 
> We are not using the value as a pointer so that should be irrelevant
> although generally those bits tend to be at the top of pointers so they
> can be masked off.
> 
> I'm not sure what we are trying to achieve here. I've got something that
> works, doesn't fail any tests and has some guards in for potential
> future problems. At the same time I'm not prepared to over-engineer the
> solution for a theoretical future problem we haven't got yet.
> 
> What about if I just key based of gdb_regnum and we accept that that
> might break the one heterogeneous system we model today?
> 

That's the best option in my opinion. gdbstub won't work well with such 
a system anyway, and fixing it will need something similar to 
GHashTable. But if I would fix gdbstub for a heterogeneous system, I 
would add a field to CPUClass instead of having a GHashTable keyed with 
tuples of CPUClass pointers and register numbers. It should be fine 
considering that CPUState already has gdbstub-specific fields like gdb_regs.
