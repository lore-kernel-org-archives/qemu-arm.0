Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp2391001lfk;
        Fri, 11 Feb 2022 08:18:05 -0800 (PST)
X-Received: by 2002:a17:902:f648:: with SMTP id m8mr2299303plg.127.1644596284854;
        Fri, 11 Feb 2022 08:18:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644596284; cv=none;
        d=google.com; s=arc-20160816;
        b=bX72vqItRE7alELdVasnYZOBR7qROSkm37eyoexC89ehzi0tm3joLIu1SMJuyXZxzx
         1F5vGaUhwkNPGbD2WhlbgNS7YkqiTxIwIBlZpgFccpn+UM76YbIOVrf/ZLe+4vFm97TL
         VRxwB/CJLNW3CMzMjhNp0q7dmLkBBfCRvahe9NpzDsb/iH58bujQ/ypttbBd8kuRDQMC
         fpl48pZJVyZrdZ8bviEHyXK1viK4NucADjCBFsRgG5V+/40svnEmTlRio+XEVZa7dN1Z
         GOaHz2NE9yPX8cnmKdDW+5YBfLsF2rXuW5yGhTi9+IRspGtc+chNG6T0WG97I2HQnUiC
         rKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=HKy+54r3kPvEsdRKeUwuulEqApURLp9eG6DA0mzLXC4=;
        b=WjMlIDBMvHpY55kcRK2qJCNFaOAMQppeqsUWl6iSw02nrBibZLq/AxOhGouqRkALhj
         kSLaDTWaWc9nz5ql71nPjAfWu2TBkZJ73FT4S/yCJHwvoE0snR5JYQ+iodAazkgI6+vG
         WehthcoVEdbDT1j1vwRuUTkFfBBW9Wq3WoCdZL2QV4mX78+iTCus7kL70QQ2N0o4dzYe
         B9kgoIf9onU/QlbDdjf2qoKzPpYhuNsuajlxo1Tsd3GlpSSIqE9FNAkK98FLfqt5GKvw
         p9kPXuzGs3fPhMSg3XNTXYdl/nXymYvSpHyNviktSXocEOgUS6nr2PhXdpV6sS+2i7Xx
         nnWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=pWal7Qk+;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i3sor11485556pgq.18.2022.02.11.08.18.04
        (Google Transport Security);
        Fri, 11 Feb 2022 08:18:04 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=pWal7Qk+;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HKy+54r3kPvEsdRKeUwuulEqApURLp9eG6DA0mzLXC4=;
        b=pWal7Qk+qeuCmVjHdOdt/Ztk9gewSx3H6R5+kjA7V6qICO3qI29t9GCBDpaQmm6+Is
         cjoaV5ZSlXheQ+ioWMeRzNL9emXDs5gv8+dZO5gOTm1SJKpx8AZGzbC5DyJOCrsb6sQJ
         Z6FHPUbOB6tR7H3H2r33OIucuCsemNGepPxNLlSBgDbmPRiHnNQeYky0dLgry/EtgiXh
         uvkI9AuMUMcs23RIIvoEY9O4NRlYWjNk7v1vnRXfze4Kltp8oX1764EKBpMMdG47Ion+
         eQ9C28PAhvkravMq9mN5MyXoA3x7qXSpicGyMUb57MkpVTEUr3MvwajH00XMCWdRyBaC
         ZNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HKy+54r3kPvEsdRKeUwuulEqApURLp9eG6DA0mzLXC4=;
        b=qG+Xz2eRCK3Dg80SfgZY2+7Wpw2XiUAKLITeCcFQaIWgt2WLPqFXJisOtnfm5yq5AJ
         Vf3L6bABFW0PZSfPIeNzzBrawtbOUKMQfvQkIpoAnEWQ410heMCTKa3uikTDauvQclbM
         pPa3+ull7/Pd4rdJhOjHMOpWSl7SG6q+GryNCeclm8TGFgC9k6Lq+37FvHCm8iPEDkER
         VbzqNIP2kzl5gChkQ1rJZCwqUXA/tQSKE4Zmk2NscCMXGHgBrEtgc4zdRmpRPUMNeM79
         QEkjVIfPXe99sHwdXBQoRNGtme5yWG6ZSPPB1eWhruATL1kDC7kNzYZJi85BYKM9gEDz
         iHMQ==
X-Gm-Message-State: AOAM532+3YDIAt4FT2cZwv3w6A47UZmBCHpt0bMMtKSlX7akgFy3Sfb9
	xkFGG41rbab8QMMDFI4hDQOVsSPuaio=
X-Google-Smtp-Source: ABdhPJyi7RCE+MQ+I+jMRFmYj4IKZXuof6CW7+znZJMNLvgS5wBOp+d3K95kem/Tv1bqNvhNLHpb1Q==
X-Received: by 2002:a65:6ccf:: with SMTP id g15mr1937037pgw.105.1644596284176;
        Fri, 11 Feb 2022 08:18:04 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
        by smtp.gmail.com with ESMTPSA id h25sm25466813pfn.208.2022.02.11.08.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 08:18:03 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <a45108c0-c5ed-3d98-77d2-c8b9c5c26be8@amsat.org>
Date: Fri, 11 Feb 2022 17:18:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Andrew Strauss <astrauss11@gmail.com>,
 Keith Packard <keithp@keithp.com>, qemu-arm@nongnu.org
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
 <20220210113021.3799514-2-alex.bennee@linaro.org>
 <8b6fca38-8a4e-af35-f202-86a5a3f98e47@amsat.org>
 <CAFEAcA-2=TD9FeOn9ZJLBmJJBfQhOKSTRWpOXEw0AVktWmE6vA@mail.gmail.com>
 <878ruhedv0.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <878ruhedv0.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: NFnnG9VsPrBp

On 11/2/22 14:22, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Thu, 10 Feb 2022 at 11:48, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> Hi Alex,
>>>
>>> On 10/2/22 12:30, Alex Bennée wrote:
>>>> The previous numbers were a guess at best and rather arbitrary without
>>>> taking into account anything that might be loaded. Instead of using
>>>> guesses based on the state of registers implement a new function that:
>>>>
>>>>    a) scans the MemoryRegions for the largest RAM block
>>>>    b) iterates through all "ROM" blobs looking for the biggest gap
>>>>
>>>> The "ROM" blobs include all code loaded via -kernel and the various
>>>> -device loader techniques.
>>>>
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>> Cc: Andrew Strauss <astrauss11@gmail.com>
>>>> Cc: Keith Packard <keithp@keithp.com>
>>>> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>>>
>>>> +static LayoutInfo common_semi_find_bases(CPUState *cs)
>>>>    {
>>>> -    MemoryRegion *subregion;
>>>> +    FlatView *fv;
>>>> +    LayoutInfo info = { 0, 0, 0, 0 };
>>>> +
>>>> +    RCU_READ_LOCK_GUARD();
>>>> +
>>>> +    fv = address_space_to_flatview(cs->as);
>>>
>>> Why are we using the CPU view and not address_space_memory?
>>
>> If you have a choice between "use the right view of an
>> address space" and "use the global address_space_memory",
>> it's better to prefer the former, I think. We use the
>> latter in lots of places, but it's not conceptually the
>> right way to think about how the memory system works IMHO.

Yes I agree.

For user-mode, this patch makes sense. For system-mode it is
not obvious to make sense of SYS_HEAPINFO (except focusing in
cores targeting embedded systems eventually).

> In this case the addresses have to be as the CPU sees them because it's
> between the CPU and the semihosting backend to share data.

Beside the sysemu curiosity, the patch logic is fine, so:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks,

Phil.
