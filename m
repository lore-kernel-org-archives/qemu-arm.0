Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp193533lfg;
        Wed, 3 Aug 2022 01:11:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sPLuojHYHzYUcXxZtplXPuVyEhyXaSMC4bAX807ybEacnzdO4GDG60Uo0PrsxC88Sk/Fdl
X-Received: by 2002:ac8:5d94:0:b0:31f:1e7b:7d9b with SMTP id d20-20020ac85d94000000b0031f1e7b7d9bmr21054691qtx.205.1659514276673;
        Wed, 03 Aug 2022 01:11:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659514276; cv=none;
        d=google.com; s=arc-20160816;
        b=TOX3MGOZ0CMlr5kiEeSPwXK9upkZhT/VGQ0rvj0xifPHhn7v5hpuIqm3jOGI/Emo5Z
         519p/8GKUFiBEH7DlQuFeEjpa3Jl2U3DLn8xJ6JKSjDNdTAqJ3Hi/cZFnywTKiZg2q5M
         rlyFcCLmUz/fggV1IYxV0xw62Pr3XFTuQsfWBj58bubwBUmOcP2CkCw43HQc8swFFuRK
         reI2ArovCX2DmM9ZnXTZVylbYSDQI1sNeCTi/GeqowCEFngBkxS9SaHRfigr7PxPD3YC
         qymfgr/Asu6Bs2tQKyyM1fwopHnSzR2CFiqETiRRM875DkPuq7F+AaYQEOWiBRUmVccD
         Kwrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/h3rQSZtaBenNFjjcQfd7E8i8jSma4t1c57ega+CGRI=;
        b=SxvIUzWT6gmQ2QiStS11kq7ILwoz03XqsG/qUClFctOD8Lib56Q5UkynP4eaITEqGg
         pKG5PqAM+JEqYNNbFuUR9Yx9L8CSQQx6YIXR4QTI96FbDFncAq9Q+Entq1I6z2AbzAUU
         knhfrReOld84c9Sk9jX/FsdsZBy+b+WzRSSMqqYZzUH8J76V2a8gMflX2VCSVck6lZYW
         95DkmWcdWGgTUCtd7sfMIknVMwKodEQgMcr3HCdpc3HjPBc11dDg2++g8fXKwPxXXGHP
         b/kCWfLMWmzh9S8A1nc3dE+7uioMFBnm/lOH09usvs/T9Nu268OLxFu7/2CG683dmwAP
         WRnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YMX2RyTw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2-20020ac84b42000000b002fbcd60bd45si8747064qts.390.2022.08.03.01.11.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Aug 2022 01:11:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YMX2RyTw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oJ9TI-0002C5-5W
	for alex.bennee@linaro.org; Wed, 03 Aug 2022 04:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oJ9Sr-00029p-G9
 for qemu-arm@nongnu.org; Wed, 03 Aug 2022 04:10:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oJ9Sp-0000tv-Kd
 for qemu-arm@nongnu.org; Wed, 03 Aug 2022 04:10:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659514245;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/h3rQSZtaBenNFjjcQfd7E8i8jSma4t1c57ega+CGRI=;
 b=YMX2RyTwGp5Q9b3FWs2t13fSD4ZYWg6LZEQly+QaPNvFG6jGxRLAbMrSYwXefA+Wa7GVbw
 HMR0bqkt62eEky3LU5vpdyWwaun9fWL90S8LBjBe2vcUJrs9E58CdWGjQq5mGAbR63ShUj
 JqSV5jjKscj052C5mmBVHQOdJOn3C10=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-Q6m1WjrlPTmKxz-UE3vvYg-1; Wed, 03 Aug 2022 04:10:44 -0400
X-MC-Unique: Q6m1WjrlPTmKxz-UE3vvYg-1
Received: by mail-qt1-f199.google.com with SMTP id
 bp9-20020a05622a1b8900b0033921a622ccso2999320qtb.23
 for <qemu-arm@nongnu.org>; Wed, 03 Aug 2022 01:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=/h3rQSZtaBenNFjjcQfd7E8i8jSma4t1c57ega+CGRI=;
 b=fQWHSWDoacs1vislJxf3EIZViplPPQt9vbearB2gycLAFU2Tbg/iTrz4cwkcB5WvMt
 vk6dp117jDfQ5JIbqpOliGwU0rwzKV3yRv26Se5zeLQm9nblwdNYVTNrIuBFUSgVkh8x
 OhXCVKG9Cqa9W6kUyti4YlvsbcQyvVmbcBY6+p23AOjL3QnH2NRcigZRE07NzUivG1zp
 srIUNLA5UEIECgumLhReJxNNk0SJR99h5hL9lC+ss+nakXwjxJNFlBWdZrQ/cfgD1Jr8
 9CkT8IGTiTdncJhIN/WxWrASjG13h9P/zUfssR8pNGNs+Eb8X+QPwV9QkOanGCMS6lWk
 NAxA==
X-Gm-Message-State: ACgBeo0VmoPBzqn3GWv7fdKm7mPURqGp6+xw6KC8QVV2dEhkqWbW3mlR
 KZEUETQHgnl/jm8EPMJXS4U1CNvlK9KClbneusnPR/s1YFfSDEMbQPh5X6W7eCURt32UN9J7lax
 iOFSZ0NrAF4K7
X-Received: by 2002:a0c:c789:0:b0:470:8c5b:5e13 with SMTP id
 k9-20020a0cc789000000b004708c5b5e13mr21167630qvj.86.1659514244269; 
 Wed, 03 Aug 2022 01:10:44 -0700 (PDT)
X-Received: by 2002:a0c:c789:0:b0:470:8c5b:5e13 with SMTP id
 k9-20020a0cc789000000b004708c5b5e13mr21167622qvj.86.1659514244002; 
 Wed, 03 Aug 2022 01:10:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 e8-20020ac845c8000000b0031636caa40bsm10345406qto.65.2022.08.03.01.10.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 01:10:43 -0700 (PDT)
Message-ID: <807e61a6-3a39-921b-516e-a8d893509137@redhat.com>
Date: Wed, 3 Aug 2022 10:10:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] hw/arm/virt: Improve address assignment for highmem
 IO regions
To: Marc Zyngier <maz@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, cohuck@redhat.com, zhenyzha@redhat.com,
 shan.gavin@gmail.com
References: <20220802064529.547361-1-gshan@redhat.com>
 <20220802064529.547361-2-gshan@redhat.com>
 <dcca0792-4f62-2cf0-9080-309d2e78e690@redhat.com>
 <9c8365c6-d27b-df76-371d-bd32ca2a26f7@redhat.com>
 <87tu6tbyk9.wl-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <87tu6tbyk9.wl-maz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: adG241oMmqDZ

Hi,
On 8/3/22 09:01, Marc Zyngier wrote:
> On Wed, 03 Aug 2022 04:01:04 +0100,
> Gavin Shan <gshan@redhat.com> wrote:
>> Hi Eric,
>>
>> On 8/2/22 7:41 PM, Eric Auger wrote:
>>> On 8/2/22 08:45, Gavin Shan wrote:
>>>> There are 3 highmem IO regions as below. They can be disabled in
>>>> two situations: (a) The specific region is disabled by user. (b)
>>>> The specific region doesn't fit in the PA space. However, the base
>>>> address and highest_gpa are still updated no matter if the region
>>>> is enabled or disabled. It's incorrectly incurring waste in the PA
>>>> space.
>>> If I am not wrong highmem_redists and highmem_mmio are not user selectable
>>>
>>> Only highmem ecam depends on machine type & ACPI setup. But I would say
>>> that in server use case it is always set. So is that optimization really
>>> needed?
>> There are two other cases you missed.
>>
>> - highmem_ecam is enabled after virt-2.12, meaning it stays disabled
>>   before that.
> I don't get this. The current behaviour is to disable highmem_ecam if
> it doesn't fit in the PA space. I can't see anything that enables it
> if it was disabled the first place.
>
>> - The high memory region can be disabled if user is asking large
>>   (normal) memory space through 'maxmem=' option. When the requested
>>   memory by 'maxmem=' is large enough, the high memory regions are
>>   disabled. It means the normal memory has higher priority than those
>>   high memory regions. This is the case I provided in (b) of the
>>   commit log.
> Why is that a problem? It matches the expected behaviour, as the
> highmem IO region is floating and is pushed up by the memory region.

the only concern I have is we changed the user experience with
d9afe24c29 ("hw/arm/virt: Disable highmem devices that don't fit in the
PA range")

before we returned an error if the highmem devices could not fit within
the IPA range and exited:

-m and ,maxmem option values require an IPA range (41 bits) larger than the one supported by the host (40 bits)


Now we skip them silently.
Most probably we should have gated that change with an option for
compatibility.

>
>> In the commit log, I was supposed to say something like below for
>> (a):
>>
>> - The specific high memory region can be disabled through changing
>>   the code by user or developer. For example, 'vms->highmem_mmio'
>>   is changed from true to false in virt_instance_init().
> Huh. By this principle, the user can change anything. Why is it
> important?
>
>>>> Improve address assignment for highmem IO regions to avoid the waste
>>>> in the PA space by putting the logic into virt_memmap_fits().
> I guess that this is what I understand the least. What do you mean by
> "wasted PA space"? Either the regions fit in the PA space, and
> computing their addresses in relevant, or they fall outside of it and
> what we stick in memap[index].base is completely irrelevant.

agreed. To me the only 'waste' we can have is when highmem ECAM is
disabled through a combination of user options and we provision for the
unused space when computing the highest_gpa. But it is 256 MB and the
case where it is disabled is marginal.

Eric
>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>   hw/arm/virt.c | 54 +++++++++++++++++++++++++++++----------------------
>>>>   1 file changed, 31 insertions(+), 23 deletions(-)
>>>>
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index 9633f822f3..bc0cd218f9 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -1688,6 +1688,34 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>>>       return arm_cpu_mp_affinity(idx, clustersz);
>>>>   }
>>>>   +static void virt_memmap_fits(VirtMachineState *vms, int index,
>>>> +                             bool *enabled, hwaddr *base, int pa_bits)
>>>> +{
>>>> +    hwaddr size = extended_memmap[index].size;
>>>> +
>>>> +    /* The region will be disabled if its size isn't given */
>>>> +    if (!*enabled || !size) {
>>> In which case do you have !size?
>> Yeah, we don't have !size and the condition should be removed.
>>
>>>> +        *enabled = false;
>>>> +        vms->memmap[index].base = 0;
>>>> +        vms->memmap[index].size = 0;
>>> It looks dangerous to me to reset the region's base and size like that.
>>> for instance fdt_add_gic_node() will add dummy data in the dt.
>> I would guess you missed that the high memory regions won't be exported
>> through device-tree if they have been disabled. We have a check there,
>> which is "if (nb_redist_regions == 1)"
>>
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * Check if the memory region fits in the PA space. The memory map
>>>> +     * and highest_gpa are updated if it fits. Otherwise, it's disabled.
>>>> +     */
>>>> +    *enabled = (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits));
>>> using a 'fits' local variable would make the code more obvious I think
>> Lets confirm if you're suggesting something like below?
>>
>>         bool fits;
>>
>>         fits = (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits));
>>
>>         if (fits) {
>>            /* update *base, memory mapping, highest_gpa */
>>         } else {
>>            *enabled = false;
>>         }
>>
>> I guess we can simply do
>>
>>         if (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits)) {
>>            /* update *base, memory mapping, highest_gpa */
>>         } else {
>>            *enabled = false;
>>         }
>>
>> Please let me know which one looks best to you.
> Why should the 'enabled' flag be updated by this function, instead of
> returning the value and keeping it as an assignment in the caller
> function? It is purely stylistic though.
>
> Thanks,
>
> 	M.
>

