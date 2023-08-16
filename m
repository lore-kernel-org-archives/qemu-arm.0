Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp427466ejs;
        Wed, 16 Aug 2023 08:11:49 -0700 (PDT)
X-Received: by 2002:a05:6808:2ca:b0:3a7:238a:143e with SMTP id a10-20020a05680802ca00b003a7238a143emr2856987oid.2.1692198708965;
        Wed, 16 Aug 2023 08:11:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692198708; cv=none;
        d=google.com; s=arc-20160816;
        b=KaH12DzvaLw0SEw3lE7j1Km5g9tG1rvra8Dt2CkZM5ITCcyDH2d0IU8zH/2QfU4GS+
         nwJQ1OcgfSBvk56v0uDUAaAeLWYf+VDuyWkladfxSmbekHwaJAqU6Q7maadiBegRKEkH
         ERTCeRgbb9e+mdn7yp7AuKRk9kIbnJfHXWxdeiBetdX0MUReiCCWexHKkmAGuy20sG17
         v+Dd3EBw6FgG1axC9VRroemKIxb6Wzy+7siotLfPyhiyPLQ0WVz9TLpFKfWkPyWlPG3f
         IiR3KDQWQXN9oTZMEyZWwntgPZ87nQwieqKdM3SdEDhk2sM4FR3uwS33xTZ3W95RYKjG
         1LIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hEU3dFmLOGxf0aPW9ITZrVwFlm7H6G41V9IogAXUhfg=;
        fh=EcO5he7kBhkq1+blo3bftTd/gQjAs68nzvCtO96H+rw=;
        b=xQ5B716xEmpkF8Cv+pWB3UcBU6yiMR/Ti8ib+HWzgsaVDazZhOOv+8NlmWuSTInhDJ
         umaGSrd45v20zq5ZpL/n3XF7YiDEd6wHeHAzQPz/ZP/QcA9sa9AY5G9VF8qTQ2nzn2pb
         Dao88UM5fF4RW81fEBU4FJs36j8bdzB/Vt8QBngJ1JF2XllavDSb5bcyMK/ycKWQyxAS
         GMu7Tip7QH3ebsMBP+88Xxar9/mgYG704sJRC6wvRhOQ5ZkVjgxWPdpC3iFCUCbk7o0B
         m5dEB36Y9wWvNTWZJpn6Y7ZKCPf8UM4cg+aArrDilADZHe6sfXuKhR04CuBKQgqw+n4D
         /q6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=OFqOqlQo;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id db22-20020a056808409600b003a467b65413sor9171392oib.4.2023.08.16.08.11.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 08:11:48 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=OFqOqlQo;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692198708; x=1692803508;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hEU3dFmLOGxf0aPW9ITZrVwFlm7H6G41V9IogAXUhfg=;
        b=OFqOqlQoRXKD4t5nRwTaPlXEpfwku5Cw0gzzR1M919EGe0Z0LX0c4qiPMV9FejaLc3
         OOoztCVACQmIVbyPftACFo1hYVVxQpHHS0/z3R9721qSXEX44orLZpcygzXvHrxc8iE/
         7E32Kz7eANye2Ah6YPGDBNCu0uDhUJRBv8BL7Eac/VyxNqtDhE8yFd6XUo39XVjepNcr
         W2fC1Xsn12KrdWn0vPiaKvTxBhGy/N9NHWc6XiBV/P4iO9nrk/V6ThmhedOvSQtjwGcL
         pGVxa8Rt+2V250YSJQqVcT2bfWCHy4NiiZTwPpyJIjBk6LTT8jT773pszuqmS6nfXpIh
         6GOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692198708; x=1692803508;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hEU3dFmLOGxf0aPW9ITZrVwFlm7H6G41V9IogAXUhfg=;
        b=bGFWZkdcrfbnAxHSZhSB19ZKKCw5A5NZt3KFosw+o8FjC6egUCMbE9RinhyGYToyFS
         1ACFt59zNklKSThn/vZedTFHm/heJMdDnai5Nz9i4bPuIX9zqua7ArBJbxupVLzx94/x
         rqtnztlAnm9kTwTJmdQgX3R+v62OI+G4fEzvy9GjJLy67QlxJhXMtr5ODbM0Os4iWKsZ
         Ar82Jxkn+T20/F0lL8g1ZkNwWINNIIR9P+0lxUvwJbKc35WFNvqzw4+cxHa4rV9EjI2m
         tIUPMBa/VH4T06depz4/Uguqr7Dw1GpaObaSAzk2tCwd4efyt7BYIziCc5/dnkms4ic8
         nUWA==
X-Gm-Message-State: AOJu0YwY0r6P3O6xTvJKptPob+rIHRBX5GM21BiYPAQHC0KZpmpLVREa
	g4PW72AGVHhinmxmb5YWxb6O677d6ZHDmrghDAY=
X-Google-Smtp-Source: AGHT+IHYO1WNOfWm/5h18/YpTTaV11QaqcX4jo99s1nzLeeMnAL7r6TQ0+INirHDbb67ZYs11pMGgA==
X-Received: by 2002:a05:6808:200f:b0:3a4:8590:90f2 with SMTP id q15-20020a056808200f00b003a4859090f2mr3342939oiw.47.1692198708388;
        Wed, 16 Aug 2023 08:11:48 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486? ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id s10-20020a639e0a000000b005633311c70dsm10919319pgd.32.2023.08.16.08.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 08:11:48 -0700 (PDT)
Message-ID: <5fb9ec6f-f8b5-4cf3-8179-ebb496b06862@daynix.com>
Date: Thu, 17 Aug 2023 00:11:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 15/24] target/arm: Fill new members of GDBFeature
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-16-akihiko.odaki@daynix.com>
 <87350lr7p8.fsf@linaro.org> <f41aae27-8538-46b5-93fa-67de41602077@daynix.com>
 <87r0o3ni57.fsf@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87r0o3ni57.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7bECE+3ZfdQu

On 2023/08/17 0:03, Alex Bennée wrote:
> 
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2023/08/14 23:56, Alex Bennée wrote:
>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>
>>>> These members will be used to help plugins to identify registers.
>>>>
>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>> ---
>>>>    target/arm/gdbstub.c   | 46 +++++++++++++++++++++++++++---------------
>>>>    target/arm/gdbstub64.c | 42 +++++++++++++++++++++++++-------------
>>>>    2 files changed, 58 insertions(+), 30 deletions(-)
>>>>
>>>> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
>>>> index 100a6eed15..56d24028f6 100644
>>>> --- a/target/arm/gdbstub.c
>>>> +++ b/target/arm/gdbstub.c
>>>> @@ -270,6 +270,7 @@ static void arm_gen_one_feature_sysreg(GString *s,
>>>>        g_string_append_printf(s, " regnum=\"%d\"", regnum);
>>>>        g_string_append_printf(s, " group=\"cp_regs\"/>");
>>>>        dyn_feature->data.cpregs.keys[dyn_feature->desc.num_regs] = ri_key;
>>>> +    ((const char **)dyn_feature->desc.regs)[dyn_feature->desc.num_regs] = ri->name;
>>>>        dyn_feature->desc.num_regs++;
>>>>    }
>>>>    @@ -316,6 +317,8 @@ static GDBFeature
>>>> *arm_gen_dynamic_sysreg_feature(CPUState *cs, int base_reg)
>>>>        DynamicGDBFeatureInfo *dyn_feature = &cpu->dyn_sysreg_feature;
>>>>        gsize num_regs = g_hash_table_size(cpu->cp_regs);
>>>>    +    dyn_feature->desc.name = "org.qemu.gdb.arm.sys.regs";
>>>> +    dyn_feature->desc.regs = g_new(const char *, num_regs);
>>> AIUI this means we now have an array of register names which mirrors
>>> the
>>> names embedded in the XML. This smells like a few steps away from just
>>> abstracting the whole XML away from the targets and generating them
>>> inside gdbstub when we need them. As per my stalled attempt I referenced
>>> earlier.
>>
>> The abstraction is strictly limited for identifiers. Most plugin
>> should already have some knowledge of how registers are used. For
>> example, a plugin that tracks stack frame for RISC-V should know sp is
>> the stack pointer register. Similarly, a cycle simulator plugin should
>> know how registers are used in a program. Only identifiers matter in
>> such cases.
>>
>> I'm definitely *not* in favor of abstracting the whole XML for
>> plugins. It will be too hard to maintain ABI compatibility when a new
>> attribute emerges, for example.
> 
> No I agree the XML shouldn't go near the plugins. I was just looking to
> avoid having an XML builder for every target.

Oh, I see. It's done in v4 with patch "gdbstub: Introduce 
GDBFeatureBuilder".

> 
