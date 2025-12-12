Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43446D59D82
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Dec 2025 19:04:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vU8QX-0005ik-7h; Fri, 12 Dec 2025 14:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vU8QV-0005i8-04
 for qemu-arm@nongnu.org; Fri, 12 Dec 2025 14:03:39 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vU8QP-00021b-Qg
 for qemu-arm@nongnu.org; Fri, 12 Dec 2025 14:03:38 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-29f0f875bc5so18557745ad.3
 for <qemu-arm@nongnu.org>; Fri, 12 Dec 2025 11:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765566209; x=1766171009; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rsxp6xlgt0RPkQg3/SWc27vLJkj2JFC3MNg45WG/sOc=;
 b=BPF5QIquw4+2VSyxYxZzBjMytLTV7RNBr0qgjBl6CuRakHpEUEmQIJHABnYK7T707p
 62GFzfwwFQb5XwEw7d+iPnWO808hEDBBQQvO3xr97vJD3HVTJShX72nP2PRB8ytetBw3
 CTU7HHB+406F/ipwJyA7IDQY9fUmybz9yqdwqsAO3yPFNvD6Ke6HghXvQDbozR6p4Ivd
 RBEWP3xqH2w0ITcVQ6R3MygIX3F4QZ58uKhRJtkBLqqgr5Qf2frAMKHKB6Gdljy0nbEH
 fS8PUXdrHSgab4HUqJWqAKRTt7Li3qUhNTGvrAIl953tRytbkoP9iuipeMJ8nXHOKKaB
 rfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765566209; x=1766171009;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rsxp6xlgt0RPkQg3/SWc27vLJkj2JFC3MNg45WG/sOc=;
 b=EbFKVObp4Op+UIFsguWkeP2JUU/+9AehoMIwSvLxSpeeTRXNw6pEIwJ+920Nb4utMk
 ozZVEqlvD/18UwNeekb2wyyNQwp180Q4tjUjBNsK4iY8S/3IgQNxHFS3HD0wGtZPRI8g
 87hj97Jx+n3zTj9Fy5sKYG4OLjrwaa9GbYJARRnNKK5zVCxEL1cVEOD4KLWPg8FslbTU
 n2boddY5D3suf0aP5baTqo/UG6lthS4/4Xkfy0fysboTnNS+3hv1aLlwg/kdamoDgSLA
 9kfLyDV58CD5FLnPQdmChqqtU/9Bcl7/E+3oPGOtaHqB5Aaupn/S8hHjWx3uCPs0O+GH
 FcJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW36XMOGN2KmBvN3JN7UG+12HOkDUwuLSBkeEUKZiRhUDOz9tolv5bRrIqVrCAYNbPtJuWe3irxZw==@nongnu.org
X-Gm-Message-State: AOJu0YxScENRi7e7e23Sv/maNCDzum27a6CvRDY7OQRzYc2Sx8pONM0j
 16wQNonN4ltovgFBdP7OhUXofz+Ln5NmrrMY00L/dQ64vjFC21iJdh1FTshn9MKV+RA=
X-Gm-Gg: AY/fxX5vE5oh8HbJ7iuupO+nD3pkzVmXXvDqHbHr2lvk+YFQvPe1APoM6Mbe2DU+XpA
 yvSgN1nixArToAu3MhLK6rAl0agUdh/GiDx3myE/MZTVWY2OM2yw4KM5KhfoCJCSF9RC1kvJCn8
 Qii1trEn2IhX81+icA4L+bhyKm2v7vTpzLOxQ/yTgvDrXVw/lpq7U5U5KfuoXH59+Y+kjYUP+6t
 8P8vxA+B1lIRBOJns9S549jbosXyCbVbpg1MOXn4ZptJH6GZwpwyv70lvHMXpTXLRm5Ad2LVV12
 Bz2TnRPmK2F5Stc6bKqgP1e+32aHJdoSFx/f0wB/ZsfQv0GtGQJKw5VZ+WZX94+NAKaQ0HGIWkP
 SNZFcPoBn4dC+OASm3QqnRstZCHxfke8gEWLPe5I4IekEju87R06k+2FyGIJCOU8PUxtC6UQF2b
 OMNxXGOOTSSGMl3IW8TVZ1K7oSas91OF/8kq+P9tikx8b+CFLlL2Q2FXw=
X-Google-Smtp-Source: AGHT+IHyFYIgxAhhnt40Y0gXri6aldszHBhhhbeMX1h9XoUlvTF7/MCvXbwxXQvuB7apUNFmlh9BvA==
X-Received: by 2002:a17:902:f68f:b0:29f:2b8a:d3d with SMTP id
 d9443c01a7336-29f2b8a256fmr19017985ad.4.1765566209351; 
 Fri, 12 Dec 2025 11:03:29 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29eea04038dsm61147405ad.76.2025.12.12.11.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Dec 2025 11:03:28 -0800 (PST)
Message-ID: <cbc9fb41-6d66-4265-ac8a-1e10b01d9f83@linaro.org>
Date: Fri, 12 Dec 2025 11:03:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/arm/ptw: make granule_protection_check usable
 without a cpu
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Tao Tang <tangtao1634@phytium.com.cn>
References: <20251211234426.2403792-1-pierrick.bouvier@linaro.org>
 <20251211234426.2403792-3-pierrick.bouvier@linaro.org>
 <CAFEAcA-G0QchOw_zXNwUq3KAAKJZggnpeXkt7ePBAUa1SD1P2Q@mail.gmail.com>
 <1c170d41-f291-4c1c-b87e-1dba64231991@linaro.org>
 <CAFEAcA-nqaFdKBTNrEpm9r7g00iN7KNb6XYP5gSr4Z2jJEWt9A@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA-nqaFdKBTNrEpm9r7g00iN7KNb6XYP5gSr4Z2jJEWt9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x632.google.com
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

On 12/12/25 10:54 AM, Peter Maydell wrote:
> On Fri, 12 Dec 2025 at 18:09, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> On 12/12/25 2:35 AM, Peter Maydell wrote:
>>> On Thu, 11 Dec 2025 at 23:44, Pierrick Bouvier
>>> <pierrick.bouvier@linaro.org> wrote:
>>>>
>>>> By removing cpu details and use a config struct, we can use the
>>>> same granule_protection_check with other devices, like SMMU.
>>>>
>>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>
>>> I'm not 100% sure about this approach, mainly because for SMMU
>>> so far we have taken the route of having its page table
>>> walk implementation be completely separate from the one in
>>> the MMU, even though it's pretty similar: the spec for
>>> CPU page table walk and the one for SMMU page table walk
>>> are technically in different documents and don't necessarily
>>> proceed 100% in sync. Still, the function is a pretty big
>>> one and our other option would probably end up being
>>> copy-and-paste, which isn't very attractive.
> 
>> I'm not sure from your paragraph if you are open to it or not, so it
>> would help if you could be more explicit. Maybe giving a review is a way
>> to say yes, but my brain firmware does not have the "indirect
>> communication style" upgrade yet :).
> 
> Yes, sorry, I was too vague here. I was trying to say "this feels
> perhaps a little awkward but overall I agree it's better than our other
> alternatives so I'm OK with doing it this way" but I didn't put the last
> part actually down in text.
>

Sounds good, thanks!

>>> Also, the SMMU's SMMU_ROOT_GPT_BASE_CFG does not have the GPC field
>>> (it keeps its enable bit elsewhere).
>>>
>>
>> Yes, you can see in patch attached to cover letter this was handled by
>> copying this field.
>> That said, I can keep a separate bool if you think it's better and
>> represent better differences between cpu and smmu.
> 
> We could alternatively do the "is GPT enabled?" check at the callsites,
> which then can do it using whatever the enable bit is for them. That
> also gives you a convenient local scope for the config struct:
> 
>     if (gpt enabled) {
>         struct ARMGranuleProtectionConfig gpc = {
>             etc;
>        }
>        if (!arm_granule_protection_check(..)) {
>           etc
>       }
>     }
> 
> 

It's a good compromise. I was thinking about doing something like this, 
but since the GPC is clearly in GranuleProtectionCheck the Arm pseudo 
code, I thought it was better to mimic it.
That said, I'm with your approach and will proceed with it.

>>>> +    entry = address_space_ldq_le(config.as_secure, tableaddr, attrs, &result);
>>>
>>> as_secure is an odd name for the AS here, because architecturally
>>> GPT walks are done to the Root physical address space. (This is
>>> why in the current code we set attrs.space to ARMSS_Root and then
>>> get the QEMU AddressSpace corresponding to those attrs. It happens
>>> that at the moment that's the same one we use as Secure, but in
>>> theory we could have 4 completely separate ones for NS, S, Root
>>> and Realm.)
>>>
>>
>> If I followed original code correctly, the call was equivalent to:
>> cpu_get_address_space(env_cpu(env), ARMASIdx_S),
>> because .secure was set in attrs. See details below.
> 
> The behaviour is the same, but the old code is abstracting away
> "which of the AddressSpaces we have now do we want for an
> ARMSS_Root access?", where the new code is not. I would
> prefer it if we can keep the "how does an ARMSS_XYZ which
> indicates an architectural physical address space map to a QEMU
> AddressSpace pointer" hidden behind arm_addressspace() somehow.
>

How do we turn that into a concrete implementation?

Two ideas I can see:
- pass a callback taking attrs in param, and return the matching 
AddressSpace for it withing granule_protection_check. Clunky IMHO.
- Duplicate this attr variable out of function with .secure=true, and 
call arm_addressspace with it, and pass result to granule_protection_check.

> thanks
> -- PMM


