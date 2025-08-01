Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6E9C87FCA
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 18:13:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhuEg-00030z-MO; Fri, 01 Aug 2025 14:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhspE-0006YJ-0n
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 12:41:46 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhspA-0003CN-Gv
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 12:41:43 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2406fe901c4so14145085ad.1
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 09:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754066499; x=1754671299; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yIEXqfliB1+oonLgDfHyNEDNtRGn8bpzP0dWuMeLXZ0=;
 b=Yd4onsH4FeF++uD3zb+8fRONzBUDh71Ru4rZ2tuo3/NJK7hcIsR51A8RibWi7CX86d
 QDLnJuCHPuIAvW4INslLocsZqUcBJIXzde/RdyEM97StPRcJ8pTmHb21Ge9js+k6BFX+
 hPGfn/Udsi5vc+ejjADgF8yb91ns6YUnap9pS25ygNis9jBPyZngNBZnPMNLQyn0av8J
 NyKMSxavFZ55X/cwBbMEAGXhyvGxXvRL9hHd5J5EhclKlLss8gVNInAi2Ptse5aaLBHr
 ZXnlkaQ0mSDwnjMesDNA9ffWf8DFQszNTqhX32xB3RfepPeakZfIXY9QLHwmh6K0ud50
 rJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754066499; x=1754671299;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yIEXqfliB1+oonLgDfHyNEDNtRGn8bpzP0dWuMeLXZ0=;
 b=dr2QA1ypyHWj4DLFjC1qTYxOlktyh7VadzrB+kH/EQgj7m5xl90rUREPDhhcAKQCCE
 aBD2PjqcI3ZujLuadmAwQDnR/GN25yu9vVvHlV72Zezj9rusKAoOrlIuD66warHRE1Iq
 UIvBL4MSgPFYVLeM3IJfoVn/U/N6NZH8j+ebOt5yMUT0yqVR9CzHw40suMyOVLpjukkg
 hEZwlz72N3lMJyK2VaKV7F5VgCuGer3tBeA1x1LDFgzruV69mRnXCSdk6KjkhoitGAVd
 vpguk8Fmd7Gnk7Jtlswrkb4vNvFRArgYNssJPNfD+vBw1vGSkYDrNplCiEksyU6cExMf
 /hrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHwcAVj14XWcUG9cV/Z89xGltnYF3rg4AvkgByMKk72OJaLSd+1grJtlJlSgsUXCWFJAofbQeHXA==@nongnu.org
X-Gm-Message-State: AOJu0Yz87fg8Bdsx5D0fZOPe+d0mNRrEgoIs1Ob4VphGs7Ichy2OxR5e
 I/l0988JBQ+GELG5f+iLxuuKUkHXbli5xFiIqfrToFFv5VdG4frq72jWg3uKS8qFI5s=
X-Gm-Gg: ASbGncvgijXJpsS4iCvV/8Rc19dS6ua3SRa+6sEq9TQJCBEiKHgn/nexrxwaCiu2oIj
 GLLd2+nQae00OcTOEyBJAJ2UdRiH7ksjr2WG85lPq0XKmxqRWGjnLr57MRhY6hA8BSNU3prPfKO
 9jplDfQMXzgCf/dUrtWnSSgxxjTsrY5ZHVIUa9bN7teMEKxuIGfr3vVHV/FeBVmoWMK/Nw57kdt
 ZluhuHMoagbmDITu2jkGN6w+F+kWoe3qT3JKYH6FTnX/dUyMwiYEaalSKL5lTiwnG/xW7XU67yS
 6bzScb4pR/p86F0YtKtRzDnQKPwLP2fwVrt4y/25IHnqtskwHRqDCOPS59Y4Mic9PKBDEc/YTnL
 t3Ckh8Cdq9zBuFaXBKOeWb8N7A+JTBFgul3I=
X-Google-Smtp-Source: AGHT+IH4TpBsILrrVPOsYyGmL6VI9ok49ReVjSDxOZqwPuKHoup13219zsX1eQGEaF9spZtQY2tp+w==
X-Received: by 2002:a17:902:e5cb:b0:240:3ca6:184c with SMTP id
 d9443c01a7336-24247056c29mr2698485ad.48.1754066498857; 
 Fri, 01 Aug 2025 09:41:38 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e89a6ec2sm47356865ad.145.2025.08.01.09.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 09:41:38 -0700 (PDT)
Message-ID: <cedc5b94-78e3-4d9a-bdd8-60c82673c136@linaro.org>
Date: Fri, 1 Aug 2025 09:41:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 47/82] target/arm: Expand pstate to 64 bits
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-48-richard.henderson@linaro.org>
 <b2e40787-6043-4d4c-9cbb-731d0e92e25c@linaro.org>
 <CAFEAcA_9tkv1EoM33=G=zW6Pw0gBirvjs-SsDaC8ar8feyH_8g@mail.gmail.com>
 <2c337408-5caa-4e24-a8dd-d947203a1dc3@linaro.org>
 <CAFEAcA-LmS0dus5ZW6P+-VXkw=m4K3MaE6O+Qtj5i3H7ULJFFQ@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA-LmS0dus5ZW6P+-VXkw=m4K3MaE6O+Qtj5i3H7ULJFFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/1/25 9:37 AM, Peter Maydell wrote:
> On Fri, 1 Aug 2025 at 17:26, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> On 8/1/25 6:22 AM, Peter Maydell wrote:
>>> On Thu, 31 Jul 2025 at 21:34, Pierrick Bouvier
>>> <pierrick.bouvier@linaro.org> wrote:
>>>>
>>>> On 7/27/25 1:02 AM, Richard Henderson wrote:
>>>>> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
>>>>> index 64ee9b3b56..3cef47281a 100644
>>>>> --- a/target/arm/gdbstub64.c
>>>>> +++ b/target/arm/gdbstub64.c
>>>>> @@ -47,6 +47,7 @@ int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>>>>>         case 32:
>>>>>             return gdb_get_reg64(mem_buf, env->pc);
>>>>>         case 33:
>>>>> +        /* pstate is now a 64-bit value; can we simply adjust the xml? */
>>>>>             return gdb_get_reg32(mem_buf, pstate_read(env));
>>>>>         }
>>>>
>>>> If I'm correct, we currently don't expose PSTATE through gdbstub, but
>>>> only CPSR. This was a bit confusing for me, considering that CPSR is not
>>>> even supposed to exist in Aarch64.
>>>> Maybe it's a good opportunity to expose PSTATE instead, which could have
>>>> a 64 bits size. This way, we don't break any workflow.
>>>
>>> Architecturally, PSTATE is simply an abstract bundling together of
>>> different information: it is not a particular format of a value,
>>> whether 32 or 64 bit or otherwise. (This makes it different to
>>> AArch32 CPSR, which really is a guest-visible register.)
>>>
>>
>> I see.
>> Then maybe what we really miss are the special registers associated to
>> PSTATE (CurrentEL, DAIF, NZCV, ...) which are defined architecturally.
>> When I tried to read EL for the first time using gdbstub, I was looking
>> for CurrentEL, and finally found it accidently under CPSR.
>> Would that make more sense?
> 
> I think for backwards-compatibility reasons we should stick
> with the current cpsr format for the information that is in it.

Yes, it's here anyway. My proposal was to add new registers.

> We do at least define the fields so you get a nice view of it:
> 
> (gdb) print $cpsr
> $4 = [ EL=0 BTYPE=0 Z ]
>

Do you have specific pretty printers installed? On my debian trixie (gdb 
16.3), there is no pretty printer for cpsr by default.

>>> The thing that *is* defined architecturally is the SPSR_ELx format, which
>>> is where various bits of PSTATE get saved when reporting an exception up
>>> to a higher exception level (and which is pretty much the AArch32 CPSR
>>> format when the lower EL is AArch32). (Note that not *all* of PSTATE
>>> appears in the SPSR_ELx: for example the SME SM and ZA bits are
>>> considered part of PSTATE but they aren't saved into SPSR_ELx.)
>>>
>>> For convenience, various pieces of software pass around information
>>> in that SPSR_ELx format. Calling this either "CPSR" or "PSTATE"
>>> is not really correct, but either is perhaps less confusing than
>>> calling it SPSR when the context is that of the code running at the
>>> lower EL rather than the higher.
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/include/asm/kgdb.h#n41
>>> suggests that expanding the existing pstate to 64 bits is probably
>>> likely to produce problems. Perhaps we should define a pstate_high
>>> or something for the top 32 bits?
>>>
>>
>> It seems we don't expose pstate at all now, and from your answer above,
>> it would not make sense to expose it directly, as it's not formally
>> defined. What is exposed by kgdb?
> 
> kgdb currently does the same thing we do, and exposes a 32-bit
> "cpsr" value.
> 
> -- PMM


