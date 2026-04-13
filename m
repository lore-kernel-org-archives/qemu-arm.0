Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A065EF34C52
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Apr 2026 13:11:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCH44-0005E2-Kc; Mon, 13 Apr 2026 09:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCH42-0005Dj-Sy
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 09:10:54 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCH41-0004pB-3C
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 09:10:54 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488c2690057so42158065e9.0
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 06:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776085851; x=1776690651; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x0jSFPhNSNtyBI/o0IEkt+dfELMsEWf+OoJ+558Ayxg=;
 b=IUxsg5pTnXLVBxF86/vvDnBvCcdE9qIDVIgWv17gL5STCIsdFg+P7+xdotBP3FQLTd
 pLOvCJdNNmp38tHnSFqK27IA4lyyItTyrs1WSCzg6uvDc2tOZsct8rujsk9aOFTJ3SA1
 d6oPmjrHUw7Q7RqeHhLVKrLt99eNSXmJlj/KlsPZD63H6XQ2iyFSq+4URiXBMzgp7nyc
 di0OO0Lp/9yVelz3jBjInpUrR1kJrtdPa3y7KuLPxaTQIPV7+D1LC0VBNwDvdkkWgir5
 LN5F+8lWOfD3VdaG9FWAZlbfxU7wPeZKjOUR5iB26QbJDDqVnpI72Swn3PARTPwwomDo
 l0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776085851; x=1776690651;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x0jSFPhNSNtyBI/o0IEkt+dfELMsEWf+OoJ+558Ayxg=;
 b=e/mH147vdSAQxtztYhdmB6kU2vr/FsGxCoNoEATmntCOrYURw+nXBbg+cLyDWxnYlm
 HiTGAMKfb4tg3AwUUScXqegXOoTl6HdeMmgDQM3/7wACGg4ZXbUrKbfG6YXftAkZ7P7a
 2XcKvpasruqQHNddCgMq8IY2Bff2Ncej5kEmIPzD7GYpJGLR7WB0sdbDiApZCQZIT9E/
 S0qa7/skF46SmYtkl8kdnbGwXDvHb2nok77hfohwdYuLy2a0AaYXMEKzqTqTCIQJmW0z
 wnU97o5/vPrGWZVpzJqxC/d0LGJh1oM3+hQyB32VmQUtqcOoRLkUdZznKM5NtufdiwOz
 1exg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ts+GQ+gWo/3cHD1mjdFjpQmhT1tV3RvSgMMWjU34JUZF+EbZWiT4x5J5N9aayY/yd47u86s2Ydg==@nongnu.org
X-Gm-Message-State: AOJu0YxDy15vVnn0x5QSkpL8g9/7a3N+kygiN+zmPp7xC+68X5ahjDqk
 f2OxF+uXIRxGBx+Bwr2qV2l620kAqrKy7HaIwitXjlGqe1n3drSrBlM7FS7Kvh464H8=
X-Gm-Gg: AeBDiev8IgpstKpBHvn6KOrFIHwk34wFWpg3JORCNYlpHXfk42k4DeemekAoX+Ubc9S
 K4H2FtoVCw9S3ebxTzvRBofva3mMOro80J6HJOEwl2WNAywQ7WIX1SIDhs35KG3458ISy1zrmtX
 lXtvmidAoTu6VF1C3SfKRi4wiKSZNv/Y+q+s6eOfopiYlDiXuSFfNuiV0u8XAVjQnQXeSZzoNeI
 a/+BSNkggB6zjHICawDi0lwrboK0cen3k9QtUC2FKcqwTtUyjH6Ad8lTlSfrtkQGsovVNW/sWMS
 qudTaDmp6094NjYrimaErhaBXHUeEYoetP9p/dA2nqNKS5fMHS5UHLKHMQ9IZ0uhTM/w9/lCZVs
 AS8WwFUiFjqRwgQ0/IsWFSpOnO7nnpsImCYSEDEqfBEuTT1Q2CvxBuE7osc3iH7RZ61R12dPw1f
 XgMeCT3OARaiuqGJjB4b9j7M3Cn9Sw2dcXHOZjj0hUMXM6nEBCiHFvm18UkLdwyx8+ZA==
X-Received: by 2002:a05:600c:3150:b0:488:c80c:c236 with SMTP id
 5b1f17b1804b1-488d68057f3mr196997615e9.5.1776085851265; 
 Mon, 13 Apr 2026 06:10:51 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5cf2e70sm161679665e9.0.2026.04.13.06.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 06:10:50 -0700 (PDT)
Message-ID: <8b4c7707-3a17-449e-9039-4c20809bcd72@linaro.org>
Date: Mon, 13 Apr 2026 15:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/13] hw/usb/hcd-ehci: Change descriptor addresses to
 64-bit
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
Cc: Troy Lee <troy_lee@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20260311072614.1095587-1-jamin_lin@aspeedtech.com>
 <20260311072614.1095587-4-jamin_lin@aspeedtech.com>
 <4253d673-02a9-45cd-9781-0f03866b9703@linaro.org>
 <6ae68fe4-6b54-433e-a9df-ae703a9c5f38@kaod.org>
 <9a15c454-c904-4c16-8ba1-14352bd9b86d@linaro.org>
In-Reply-To: <9a15c454-c904-4c16-8ba1-14352bd9b86d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

(Cc'ing migration maintainers)

On 12/4/26 23:16, Philippe Mathieu-Daudé wrote:
> On 12/4/26 23:03, Cédric Le Goater wrote:
>> On 4/12/26 22:34, Philippe Mathieu-Daudé wrote:
>>> Hi Jamin,
>>>
>>> On 11/3/26 08:26, Jamin Lin wrote:
>>>> Change internal EHCI descriptor addresses from uint32_t to uint64_t.
>>>>
>>>> The following fields are updated:
>>>> - EHCIPacket::qtdaddr
>>>> - EHCIQueue::{qhaddr, qtdaddr}
>>>> - EHCIState::{a_fetch_addr, p_fetch_addr}
>>>>
>>>> Update get_dwords() and put_dwords() to take 64-bit addresses and
>>>> propagate the type change through the descriptor traversal paths.
>>>>
>>>> Adjust NLPTR_GET() to operate on 64-bit values:
>>>>
>>>>      #define NLPTR_GET(x) ((x) & ~(uint64_t)0x1f)
>>>>
>>>> so that link pointer masking works correctly when descriptor
>>>> addresses exceed 32-bit space. The previous mask (0xffffffe0)
>>>> implicitly truncated addresses to 32 bits.
>>>>
>>>> This patch does not change the on-wire descriptor layout yet.
>>>> It only removes the internal 32-bit address limit and prepares
>>>> for later patches that will add full 64-bit QH/qTD/iTD/siTD support.
>>>>
>>>> Since the type of fetch_addr changes from 32-bit to 64-bit,
>>>> bump the VMState version.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>>>> ---
>>>>   hw/usb/hcd-ehci.h | 10 +++----
>>>>   hw/usb/hcd-ehci.c | 67 ++++++++++++++++++++++++ 
>>>> +----------------------
>>>>   2 files changed, 41 insertions(+), 36 deletions(-)
>>>
>>>
>>>> @@ -2484,8 +2489,8 @@ static void usb_ehci_vm_state_change(void 
>>>> *opaque, bool running, RunState state)
>>>>   const VMStateDescription vmstate_ehci = {
>>>>       .name        = "ehci-core",
>>>> -    .version_id  = 2,
>>>> -    .minimum_version_id  = 1,
>>>> +    .version_id  = 3,
>>>> +    .minimum_version_id  = 2,
>>>
>>> Since this device is used in cloud virtualized instances, we can not
>>> ignore previous migration streams and really need to implement the v2
>>> to v3 hook.
>>
>> We will need :
>>
>> +    uint32_t a_fetch_addr_hi;
>> +    uint32_t p_fetch_addr_hi;
>>
>> to be set by pre_save, and used by post_load to reconstruct
>> 64-bit addresses. This is going to be tedious ...
> 
> Would something in those lines work?
> 
> -- >8 --
> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> index 57f930b0998..c228d4a8c6d 100644
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -2439,6 +2439,10 @@ static int usb_ehci_post_load(void *opaque, int 
> version_id)
>               companion->dev = NULL;
>           }
>       }
> +    if (version_id < 3) {
> +        s->a_fetch_addr = s->a_fetch_addr_pre_v3;
> +        s->p_fetch_addr = s->p_fetch_addr_pre_v3;
> +    }
> 
>       return 0;
>   }
> @@ -2471,7 +2475,7 @@ static void usb_ehci_vm_state_change(void *opaque, 
> bool running, RunState state)
> 
>   const VMStateDescription vmstate_ehci = {
>       .name        = "ehci-core",
> -    .version_id  = 2,
> +    .version_id  = 3,
>       .minimum_version_id  = 1,
>       .pre_save    = usb_ehci_pre_save,
>       .post_load   = usb_ehci_post_load,
> @@ -2500,8 +2504,10 @@ const VMStateDescription vmstate_ehci = {
>           /* schedule state */
>           VMSTATE_UINT32(astate, EHCIState),
>           VMSTATE_UINT32(pstate, EHCIState),
> -        VMSTATE_UINT32(a_fetch_addr, EHCIState),
> -        VMSTATE_UINT32(p_fetch_addr, EHCIState),
> +        VMSTATE_UINT32_TEST(a_fetch_addr_pre_v3, EHCIState, 2),
> +        VMSTATE_UINT32_TEST(p_fetch_addr_pre_v3, EHCIState, 2),
> +        VMSTATE_UINT64(a_fetch_addr, EHCIState),
> +        VMSTATE_UINT64(p_fetch_addr, EHCIState),
>           VMSTATE_END_OF_LIST()
>       }
>   };
> ---


