Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp2697375lfh;
        Mon, 30 May 2022 04:37:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEAwMlZoWWimMka6CLnL55kkGmOHvMBeKmRsF6Chk+8mzDjN3aLto5nutmvGsksrs4zjC3
X-Received: by 2002:ac8:5f86:0:b0:2fb:ad06:a71f with SMTP id j6-20020ac85f86000000b002fbad06a71fmr19586451qta.38.1653910648627;
        Mon, 30 May 2022 04:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653910648; cv=none;
        d=google.com; s=arc-20160816;
        b=BvGlaSmUIoU24wNq4TDC84w1V0NqiMdbzZpivEfBYS5NdNAVcqDtxMeAk8eZDfAkvO
         NnTxjYfCy2UnV0TGAmeJVc5LLlQob7XTNQGnWP3njzEibu6UbdU5eNoGTkhbQvz6VjYp
         u42Y2Ej9R4d8B0rhXffj1Wb+T/GBlMjAutsUVr7yrXviQ8Z82x1WQwb0O2pRl3/r1xfC
         F/6kC2ZAXOb2urCzeNyMcaQlrLNBjy+2206Aim78IpTg+g+ZwXhhD5f+isbZzNeoNTW2
         kneziRA2/x4jCb3FYDdKZaXwcy4OA73yGJV59Sf7wabshX7Yq+qwaPvkAylSYQuNfxja
         86Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:cms-type
         :content-transfer-encoding:in-reply-to:from:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature
         :dkim-filter;
        bh=I0K+D6qEaLZzsBUSKM3o4Hm1kQJgTHbdQpE2i7/1E8I=;
        b=qlhYl/zn4Jj2GXycEufPODjRTpg3dHpEJMLozCIHe90nVbhrtreyeZkapvprOeZNJ6
         v4UKKHoFu7bac4FYAIk5eR3TO14XQyDHGAMDtNYOp1n1unQI3QVM0JxnUu81XfWjVjOe
         ncq1sZbfZ9raS1wJwV9c9O4W3IoUHY2tQEQ8xZg/g1mGXVTn2e/+sM1VOqZr4cF1H+GT
         zT6SXsJK+ENWwV4jVDFjzhC/WmUy6fZsMG09wYp5P87vKYjwCySpJGJ3oP+qNag7w61U
         3G6oCT1uTbZ3ELyCfKs28mAoH4odtvffmmTTvkASirQQL1vuYnqaEil6eDn6TiNlmDgf
         B0AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@samsung.com header.s=mail20170921 header.b=jBARTi7r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samsung.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11-20020a0562140d4b00b0045b09ec71fesi7107356qvr.292.2022.05.30.04.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 May 2022 04:37:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@samsung.com header.s=mail20170921 header.b=jBARTi7r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samsung.com
Received: from localhost ([::1]:52834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nvdiB-0007YH-Vm
	for alex.bennee@linaro.org; Mon, 30 May 2022 07:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.kotrasinsk@samsung.com>)
 id 1nvdfI-0005Lq-IL
 for qemu-arm@nongnu.org; Mon, 30 May 2022 07:34:35 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:19796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.kotrasinsk@samsung.com>)
 id 1nvdfB-0002QQ-FO
 for qemu-arm@nongnu.org; Mon, 30 May 2022 07:34:27 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220530113416euoutp0120fd754b2723156c62984752e6950c17~z3swsuXrj0988909889euoutp01W
 for <qemu-arm@nongnu.org>; Mon, 30 May 2022 11:34:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220530113416euoutp0120fd754b2723156c62984752e6950c17~z3swsuXrj0988909889euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1653910456;
 bh=I0K+D6qEaLZzsBUSKM3o4Hm1kQJgTHbdQpE2i7/1E8I=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=jBARTi7rVWbzbw/v1RhWRM50TtKsiU5JuPea7/KvxV99+VBmbU+x6DCj61Z/x82pQ
 buu3/M+WUScaiCEopV1Y+qUg69z1pFn+g8rZyw2i2S9pCu4lPmonEpAF2wJsTbxIzw
 4hIBIDnd8zzBZ0YUs+EjSdniEwpDFdhivdXYqEoM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220530113416eucas1p2f6cfdfcad4196c4ad424e22415a608c7~z3swaMEtX1645416454eucas1p2v;
 Mon, 30 May 2022 11:34:16 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id C3.CC.10067.8BBA4926; Mon, 30
 May 2022 12:34:16 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220530113416eucas1p2b34675c347e3c49b04450b2a95b76462~z3swFcqXL1645916459eucas1p22;
 Mon, 30 May 2022 11:34:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220530113416eusmtrp27435f7da1e894d7609b4bcb8be027f99~z3swE3p9Y0906909069eusmtrp2Z;
 Mon, 30 May 2022 11:34:16 +0000 (GMT)
X-AuditID: cbfec7f4-dd7ff70000002753-32-6294abb80e58
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 2B.3C.09038.7BBA4926; Mon, 30
 May 2022 12:34:15 +0100 (BST)
Received: from [106.210.134.115] (unknown [106.210.134.115]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220530113415eusmtip29ed8c88fc9d852db7fc00b84f4dc5c8f~z3sv0HGA21885318853eusmtip2G;
 Mon, 30 May 2022 11:34:15 +0000 (GMT)
Message-ID: <5a05e699-d050-adae-ca14-c68b5534f214@samsung.com>
Date: Mon, 30 May 2022 13:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.2
Subject: Re: Help: NVIC, level-triggered interrupts and interrupt pending
Content-Language: pl
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
From: =?UTF-8?Q?Igor_Kotrasi=c5=84ski?= <i.kotrasinsk@samsung.com>
In-Reply-To: <CAFEAcA8EqCh0LDS=N+5W8fPnF2Fj-Z7r=wssDAD-V5tBWRM85w@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMIsWRmVeSWpSXmKPExsWy7djP87o7Vk9JMth9XchizpkHLBYLuhey
 OTB53Lm2h83jybXNTAFMUVw2Kak5mWWpRfp2CVwZCxecYC04bFQxbaZkA+NftS5GTg4JAROJ
 gwvuMXcxcnEICaxglHjwdAELhPOFUeL95ylsEM5nRonlB94zwbS8+bOXFSKxnFFiUstkqJaP
 jBJPWg8CVXFw8ArYSTSuzgFpYBFQlbj/Yw9YM6+AoMTJmU9YQGxRgSSJqZP72EBsYQFPiaWP
 rzOC2MwCIhI3HrWA2SICOhJXrm9mgoiLS0ycepIFZDybgJPEpFVSIGFOgUCJ91O7oUrkJZq3
 zgZ7R0JgKYfEh9bPLBBHu0jsfnmCHcIWlnh1fAuULSPxf+d8qMeKJZac3QFVXyNxvnslVI21
 xK7j3WB7mQU0Jdbv0ocIO0rcu34ULCwhwCdx460gxAl8EpO2TWeGCPNKdLQJQVSrSUz7tYcZ
 ZumyxkcsExiVZiGFySwkv89C8swshL0LGFlWMYqnlhbnpqcWG+WllusVJ+YWl+al6yXn525i
 BKaL0/+Of9nBuPzVR71DjEwcjIcYJTiYlUR4G5InJgnxpiRWVqUW5ccXleakFh9ilOZgURLn
 Tc7ckCgkkJ5YkpqdmlqQWgSTZeLglGpgWrjgiZ5a/FrvXT+WPuD5IuF5+paamK/N3IznZ1Iv
 vlP0PnVhU3p5ld2Nwq/ey9Wj76032Tzp74Msl0gp6+c/VOsK1VPCfkzb4uX9N2Ktgof1rcyQ
 uUWXhSbO//faVuXaSf6Tz65drOVhqHncExL8ob19Ysb+dUe4z0eV3BO/GDRhT4bhQya1LaVe
 rSHl36Oaj5a5XbHZzivFYyK8pufsz13v8zI97bvLvS3O6imtnsPTpWs1b1u1mf+1kpuPQvjq
 d02LnLY0Qofl7OfjL20Z7N8tmBKu9z7oVdOt6Fw1k39bJQ0P3mu0u6NTFb4vdVpglMn1Tde/
 GHx5yrjQ0P146JLMKT8tk84pnS58c7t4kRJLcUaioRZzUXEiAJCJmCGGAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeLIzCtJLcpLzFFi42I5/e/4Pd3tq6ckGSz9ZmYx58wDFosF3QvZ
 HJg87lzbw+bx5NpmpgCmKD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTub
 lNSczLLUIn27BL2MhQtOsBYcNqqYNlOygfGvWhcjJ4eEgInEmz97WbsYuTiEBJYySixuncMM
 kZCR+HF6DRuELSzx51oXG0TRe0aJ5sMzgTo4OHgF7CQaV+eA1LAIqErc/7GHCcTmFRCUODnz
 CQuILSqQJHF8+wx2EFtYwFNi6ePrjCA2s4CIxI1HLWC2iICOxJXrm5kg4uISE6eeZIHYdZNR
 YuG8L8wgu9gEnCQmrZICqeEUCJR4P7Ubqt5MomtrF9RMeYnmrbOZJzAKzUJyxiwk62YhaZmF
 pGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwBjZduznlh2MK1991DvEyMTBeIhRgoNZ
 SYS3IXlikhBvSmJlVWpRfnxRaU5q8SFGU2BYTGSWEk3OB0ZpXkm8oZmBqaGJmaWBqaWZsZI4
 r2dBR6KQQHpiSWp2ampBahFMHxMHp1QDk8+rFI/FXnPKwk3OXlDt0zm02MW0c37HJO7aBfM9
 jcyuPDy5gFXGc5LPut2nNmTHfHBdfGNh0tsMhRUinNVnLj7P3Gdcen+jg7h3dnlj9J/0CYZ/
 +lKNOeOYn2TMvrOh4cSSRDnDbvkD7yanv1u94edjw12rk+x1/Jy2a0xYtWWTSsHs+x4TdyuG
 3cqYMI3r51sHz2tKxavuVy8/tm7RkS+LDf+2Xnxyonue88s282cMota1/h3da3OOM109vPrP
 esdKrxJGTa/LGdsNXTN/f1xXeJZDZ77DkY592RdX2odXJU+pcwkL+hYVaLT5kISSE/Pi99ur
 5qVuPjyBUeUUv5nj33OcT99Mn/phVfk8y9VKLMUZiYZazEXFiQCaEU7lGgMAAA==
X-CMS-MailID: 20220530113416eucas1p2b34675c347e3c49b04450b2a95b76462
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220530093333eucas1p2c05b46a5f9c66704919743236753858f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220530093333eucas1p2c05b46a5f9c66704919743236753858f
References: <CGME20220530093333eucas1p2c05b46a5f9c66704919743236753858f@eucas1p2.samsung.com>
 <e3573c25-1ba6-cb57-f813-99c538a2d254@samsung.com>
 <CAFEAcA8EqCh0LDS=N+5W8fPnF2Fj-Z7r=wssDAD-V5tBWRM85w@mail.gmail.com>
Received-SPF: pass client-ip=210.118.77.11;
 envelope-from=i.kotrasinsk@samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W5q5mj0a2TQn

On 30.05.2022 12:49, Peter Maydell wrote:
> On Mon, 30 May 2022 at 10:33, Igor Kotrasiński <i.kotrasinsk@samsung.com> wrote:
>>
>> Hi,
>>
>> I've been hacking on QEMU recently, adding support for a custom Cortex-M
>> board. One of the devices that I'm emulating is using level-triggered
>> interrupts, for which I assume qemu_irq_raise/lower is the right tool.
>> However, I'm having trouble receiving interrupts for my device which I
>> *think* are caused by interaction with setting/clearing
>> interrupt-pending status.
>>
>> The way I'm handling my interrupt currently is as follows:
>>
>> 1. The device raises an interrupt with qemu_irq_raise.
>> 2. In interrupt handler, I set the clear-enable nvic register and queue
>> a handler.
>> 3. In handler, I read data from the device and set a register that
>> lowers its interrupt with qemu_irq_lower.
>> 4. Then I set the clear-pending nvic register.
>> 5. Finally I set the set-enable nvic register.
> 
> You don't say in this sequence where "return from the interrupt
> exception handler" happens, which is an important part of the
> sequence. (That is, I'm not sure whether your design has only
> step 2 in the CPU exception handler with the "queued" handler
> being run after exception-return, or whether all of 2-5 are
> in the CPU exception handler for the interrupt.)
> 

Sorry, I lied a bit here. I'm running someone else's code and I misread 
it a bit. The exact sequence here is:

1. The device raises the interrupt.
2. Interrupt handler sets the set-pending register, then the 
clear-enable register, then returns.
3. A handler running outside exception context reads data from the 
device and lowers the irq.
3.5. The device raises the irq again.
4. The handler sets the clear-pending register, then the set-enable 
register.

I hope it'll be useful for reproducing the issue.

> It is also weird that you are clearing the pending state by
> manually writing to the NVIC register -- generally the expected
> design is that the NVIC itself will mark the interrupt as no
> longer pending when it takes the interrupt (ie at step 2).
> Also, it's implementation-defined whether the NVIC even lets
> you control the pending state via the software registers, so
> a design like this isn't guaranteed to work on all hardware.
> 
>> The problem happens when the device re-raises the interrupt between
>> steps 3 and 4. I would expect the interrupt to stay pending after
>> clearing its pending status, and random ARM docs I found on the net seem
>> to confirm that:
>>
>>       A pending interrupt remains pending until one of the following:
>>       ...
>>       * Software writes to the corresponding interrupt clear-pending
>> register bit. For a level-sensitive interrupt, if the interrupt signal
>> is still asserted, the state of the interrupt does not change.
>>
>>
>> https://developer.arm.com/documentation/dui0497/a/cortex-m0-peripherals/nested-vectored-interrupt-controller/level-sensitive-and-pulse-interrupts
> 
> This is a explanatory document; its explanations might be helpful,
> or might not. If you're in doubt about the precise detail of how
> the CPU and the NVIC work you should be looking at the Armv8M
> Architecture Reference Manual (or Armv7M, possibly, depending on
> what CPU you're using).
> 
>> On QEMU however, pending status is cleared and I lose the interrupt. I
>> tried to hack in the behaviour described in the docs quoted above, like so:
>>
>> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
>> index 773e311754..4914b1217f 100644
>> --- a/hw/intc/armv7m_nvic.c
>> +++ b/hw/intc/armv7m_nvic.c
>> @@ -2393,6 +2393,12 @@ static MemTxResult nvic_sysreg_write(void
>> *opaque, hwaddr addr,
>>            for (i = 0, end = size * 8; i < end && startvec + i <
>> s->num_irq; i++) {
>>                if (value & (1 << i) &&
>>                    (attrs.secure || s->itns[startvec + i])) {
>> +                /* If the interrupt signal is still asserted, the state
>> of the
>> +                 * interrupt does not change.
>> +                 */
>> +                if (!setval && s->vectors[i + NVIC_FIRST_IRQ].level) {
>> +                    continue;
>> +                }
>>                    s->vectors[startvec + i].pending = setval;
>>                }
>>            }
>>
>> This fixed the issue I was having. However, I'm not sure if it's the
>> right solution. One, this affects all devices connected to nvic, so this
>> might randomly break them. Two, there's a confusing comment in
>> armv7m_nvic.c, in set_irq_level, that seems to imply that all external
>> interrupts are edge-triggered:
>>
>>       /* The pending status of an external interrupt is
>>        * latched on rising edge and exception handler return.
>>        *
>>        * Pulsing the IRQ will always run the handler
>>        * once, and the handler will re-run until the
>>        * level is low when the handler completes.
>>        */
> 
> The NVIC doesn't make a distinction between "edge triggered" and
> "level triggered" interrupt types. Instead it provides behaviour
> which generally speaking is compatible with both kinds of device:
> an interrupt becomes pending if either:
>   * the input IRQ line is high and the interrupt is not Active
>   * the input IRQ line transitions from low to high and the
>     interrupt is Active
> 
> (this is rule R_CVJS in the v8M Arm ARM, and the implications
> for both level and pulse sensitive interrupts are explained in
> I_WTFS). The code associated with that comment is doing the second
> of those -- if the level transitions low-to-high we call
> armv7m_nvic_set_pending(), which will mark the interrupt pending.
> Checking the pending status on exception handler return is part
> of the first bullet point -- it's a transition from interrupt
> Active to not-Active, so if the IRQ line is high at that point
> then we should make the interrupt Pending again.
> 
>> I'd be very thankful for any help with this. I *think* I found a bug,
>> but I'm not 100% sure.
> 
> I suspect you're right that there's a bug lurking here -- I'll think
> a bit more about it and dig into the details of what the architecture
> specifies -- but I suspect also that your software design is doing
> something a bit odd that is why it's running into this corner case
> in the first place.
> 
> thanks
> -- PMM
> 
