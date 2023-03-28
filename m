Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2623345ejb;
        Tue, 28 Mar 2023 05:54:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set+VW5Aur/NJv92mR/7mSK3xMrQbJ9xZT+O+wZgKriuUFFCKdTdge1G3fhzq8lEVd8p6kU0I
X-Received: by 2002:a05:622a:81:b0:3b6:3b60:e0 with SMTP id o1-20020a05622a008100b003b63b6000e0mr26386761qtw.31.1680008090160;
        Tue, 28 Mar 2023 05:54:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680008090; cv=none;
        d=google.com; s=arc-20160816;
        b=H1Dp3wU1AgcRDnMJJZMZmeIT91M6TY9MbilblKR5t1hU8LkRazgNTg+NKE305cS3CE
         m3nzYOH3ui13jXNg2gmshJG1nTfheX/JiVc9UsvxZJTazG5eDq99KsIHtQzWYBj91t9w
         Q3RDivHOawgOjOCUj7pf2RZ6HC8MdBHXD6h47DwklA7qn/yE1HSK49SaQ25DKFgtHexh
         Ebwx70aPsTZ0N+mGvL7OQprvee7cK7PLy9xcKvaNgC0GKpq46rNj6p9uAUfyhhqX9RCM
         1RkPaqMXSxeltOkv2WQFTgfdEiE2+gxvqX8gC7YuUx5C440ABLNshSCRv5JTn/jueKc/
         71iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=C7iFdOnj7M4H+0ZRXb8PlWhYO1YY24NLb67ZtHqEMbk=;
        b=t4X1QKE2i0VTQFYZ0e4kTFpPJK7bDzUXFR/76jwtNIukv1piC8r3bJi7Fo+YvjKjq8
         y1DR5oRSLH843NpGnEZ5HhxbLLfnHONwAcYL7eYksEbap+4/Xz6hrYvdAUp/eb1K4qAl
         jEJ/MrOztFzAsE5ZHU73J/IpJdaVOloKBwnnErJ9TvdHH64xYN0PPPvj/d/eQ6HddZGC
         gdY5KJfTzmgSzbnhgocqy6E5B/GNtL557wrubG5yZBTgMJNh2FryIuBXtLOZWoIkw54E
         TdDaobGzMbAytgcGP1pJW2Mzrf1pqmy/xjlAZ5KWnzzBYi4d3QHwT1WELpnj51Faay/m
         1wew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=E1Q+rszH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs9-20020a05620a470900b00730749b412fsi11965672qkb.612.2023.03.28.05.54.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Mar 2023 05:54:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=E1Q+rszH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ph8qF-0004zU-03; Tue, 28 Mar 2023 08:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ph8qD-0004xg-CI; Tue, 28 Mar 2023 08:54:21 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ph8qB-0000Gm-Gs; Tue, 28 Mar 2023 08:54:21 -0400
Received: by mail-oi1-x234.google.com with SMTP id w133so8840103oib.1;
 Tue, 28 Mar 2023 05:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680008057;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C7iFdOnj7M4H+0ZRXb8PlWhYO1YY24NLb67ZtHqEMbk=;
 b=E1Q+rszH3a4lJmaM7VHKbb77W2wTXIZ/TUAoyupUYlKgla0ZEH/9LzEskKR9lhpCHi
 gSpQ4NNN4qfuTw4rzJbjjjaezcbdBQhhgpMaN30II+srx2O/DJnUP+5D0fDbnllig7JV
 to4pyqqwR0Yri93SQhzak8eET66UIodv+SQjgpnSKK0BekEbgnZl69j+OgUjU9woGgDF
 rXeAyBP69hzkr7795VE4vEJp5bhP9lkJ8TejRtyzEsd+CBC3Mj90ah63Hu2v0rkAN4o4
 6Aa1QdepZcafll3NXmGTHywXujMuAx4wRTI1nQ46AbzJlDHOmKhjbYCyjitStggbesVn
 3aUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680008057;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C7iFdOnj7M4H+0ZRXb8PlWhYO1YY24NLb67ZtHqEMbk=;
 b=HVxJLdGEdbqRmwvRiI4NZUJvMhZ+kvcLAMcfNWUOVMEiRdpycJov/DR+nUR+yQy42U
 08I73AdbIzZIdEwoV8JmagBKsD1NqwkbUQKFJeqMyQBqGO8OzFoH01qyJjyk6Oh3oo8c
 Gdk5AcFX82oKACwjp2iNdolSWrD4nFLp+HGAtKa5gc/VtutuqcBt38m/CVhEKYfFsnXu
 hIATCi25SNaAD0NXz9sRtlTwJUhueroURYGpSKpH2HVr/JUyM2nHWpqZLve4NxckZl3Y
 gLE2xu1lwrqpxa1WUCbAPPBvTGSgr4yxONWNpP9Jq5UQlu4VVoFBA8rBNhdRsUhvBaUP
 558w==
X-Gm-Message-State: AAQBX9d9UBOWuoPPEQ2wHA6d8Hg/LXbBS0T8nwA08/pfFelwnkfGLnea
 aK/D+tnBqotB4vYzo8p4ihs=
X-Received: by 2002:a05:6808:9b3:b0:389:545c:a95f with SMTP id
 e19-20020a05680809b300b00389545ca95fmr751043oig.42.1680008057700; 
 Tue, 28 Mar 2023 05:54:17 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 p204-20020acaf1d5000000b003845f4991c7sm12354406oih.11.2023.03.28.05.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 05:54:17 -0700 (PDT)
Message-ID: <f00b7e27-4c9f-226d-d727-241430be1d4c@gmail.com>
Date: Tue, 28 Mar 2023 09:54:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/1] hw/arm: do not free machine->fdt in arm_load_dtb()
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20230323204414.423412-1-danielhb413@gmail.com>
 <20230323204414.423412-2-danielhb413@gmail.com> <87zg7x2wca.fsf@pond.sub.org>
 <49e58c51-fca4-6b6f-db4a-27e4cfefacd4@gmail.com>
 <87v8il19sz.fsf@pond.sub.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <87v8il19sz.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 71KgSr8VIOU/



On 3/28/23 06:53, Markus Armbruster wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> On 3/28/23 04:01, Markus Armbruster wrote:
>>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>>>
>>>> At this moment, arm_load_dtb() can free machine->fdt when
>>>> binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
>>>> retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
>>>> the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
>>>> machine->fdt. And, in that case, the existing g_free(fdt) at the end of
>>>> arm_load_dtb() will make machine->fdt point to an invalid memory region.
>>>>
>>>> After the command 'dumpdtb' were introduced a couple of releases ago,
>>>> running it with any ARM machine that uses arm_load_dtb() will crash
>>>> QEMU.
>>>>
>>>> Let's enable all arm_load_dtb() callers to use dumpdtb properly. Instead
>>>> of freeing 'fdt', assign it back to ms->fdt.
>>>>
>>>> Note that all current callers (sbsa-ref.c, virt.c, xlnx-versal-virt.c)
>>>> are assigning ms->fdt before arm_load_dtb() is called, regardless of
>>>> whether the user is inputting an external FDT via '-dtb'. To avoid
>>>> leaking the board FDT if '-dtb' is used (since we're assigning ms->fdt
>>>> in the end), free ms->fdt before load_device_tree().
>>>>
>>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>>> Cc: qemu-arm@nongnu.org
>>>> Fixes: bf353ad55590f ("qmp/hmp, device_tree.c: introduce dumpdtb")
>>>> Reported-by: Markus Armbruster <armbru@redhat.com>i
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> ---
>>>>    hw/arm/boot.c | 10 +++++++++-
>>>>    1 file changed, 9 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>>>> index 50e5141116..de18c0a969 100644
>>>> --- a/hw/arm/boot.c
>>>> +++ b/hw/arm/boot.c
>>>> @@ -549,6 +549,13 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>>>                goto fail;
>>>>            }
>>>>    
>>>> +        /*
>>>> +         * If we're here we won't be using the ms->fdt from the board.
>>>> +         * We'll assign a new ms->fdt at the end, so free it now to
>>>> +         * avoid leaking the board FDT.
>>>> +         */
>>>> +        g_free(ms->fdt);
>>>> +
>>>
>>> "We will" is not true: we will not if we goto fail.  Leaves ms->fdt
>>> dangling, doesn't it?
>>
>> We can postpone this g_free() to execute after "if (!fdt) {}" to be sure that we're
>> not freeing ms->fdt right before 'goto fail'.
> 
> Yes, but what about all the goto fail further down?
> 
>>>>            fdt = load_device_tree(filename, &size);
>>>>            if (!fdt) {
>>>>                fprintf(stderr, "Couldn't open dtb file %s\n", filename);
>>>                  g_free(filename);
>>>                  goto fail;
>>>              }
>>>              g_free(filename);
>>>          } else {
>>>              fdt = binfo->get_dtb(binfo, &size);
>>>              if (!fdt) {
>>>                  fprintf(stderr, "Board was unable to create a dtb blob\n");
>>>                  goto fail;
>>>              }
>>>
>>> If we succeed, we'll assign @fdt to ms->fdt (next hunk).  Won't this
>>> leak old ms->fdt?
>>
>>
>> For all callers binfo->get_dtb() is returning ms->fdt, i.e. this line:
>>
>>                fdt = binfo->get_dtb(binfo, &size);
>>
>> Is equal to this:
>>
>>                fdt = ms->fdt;
>>
>> And this is why we can't unconditionally do a g_free(ms->fdt).
> 
> Uff.  Not exactly obvious.
> 
>> I believe we can improve the ARM boot code to not create ms->fdt at init(),
>> leaving it unassigned, and make get_dtb() return the machine FDT on a common
>> "void *" pointer. That would spare us from having go g_free(ms->fdt) to avoid
>> leaks and we would assign ms->fdt at the end of arm_load_dtb() normally. I made
>> a quick attempt at that but the ARM init() code is a little tricker than I've
>> anticipated. I might have a crack at it later.
> 
> Do we want a quick interim fix for 8.0?
> 
> Have a careful look at the untested patch below.
> 
>> Thanks,
>>
>> Daniel
>>
>>
>>>
>>>          }
>>>
>>>> @@ -689,7 +696,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>>>        qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
>>>>                                           rom_ptr_for_as(as, addr, size));
>>>>    
>>>> -    g_free(fdt);
>>>> +    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
>>>> +    ms->fdt = fdt;
>>>>    
>>>>        return size;
>>>
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 50e5141116..54f6a3e0b3 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -689,7 +689,10 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>       qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
>                                          rom_ptr_for_as(as, addr, size));
>   
> -    g_free(fdt);
> +    if (fdt != ms->fdt) {
> +        g_free(ms->fdt);
> +        ms->fdt = fdt;
> +    }
>   
>       return size;

This looks better than what I've been proposing here because it centers everything in
the same spot. It'll also make it easier to change/remove it when we have the chance
to take a look at the ARM boot code.

Just tested it here and it works fine. Feel free to format it into a patch and send
it. I'll give my r-b.


Thanks,

Daniel

>   
> 
