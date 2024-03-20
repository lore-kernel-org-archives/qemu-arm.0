Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1823433ejb;
        Wed, 20 Mar 2024 02:50:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWRSbcEufwswMNgw4LnfqINp37ZSw8vVICQsGVOP+En1ZStqE8wZTW+Vw1SU61A+5Rqsym1h5ye55c0h5T/nVKl8Vke2iDz
X-Google-Smtp-Source: AGHT+IF71TVYkkp1ulkkv3iPdAq/mxTqjOcd7wP/PkZnK8CfUftUg0+G5PLf5fG2MRDWFHFWLSAH
X-Received: by 2002:a05:6214:420b:b0:696:36dc:4278 with SMTP id nd11-20020a056214420b00b0069636dc4278mr3933301qvb.33.1710928207516;
        Wed, 20 Mar 2024 02:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710928207; cv=none;
        d=google.com; s=arc-20160816;
        b=kPfr+Wzj7otjd97qEruurv7m+sOyqyyX+jAwTmTvnIyRqIZue7zJ7V008up9ytfF0l
         qo8xyJe8CaGDwYWM29oGbrPMvWoarRTAjcW2pvaOiUhzTWDkYU3Les7t0CdBKNKPx68x
         zxO41oGFmRY1Pt187p2bQpceBn8UteZh1kSP5cHx1roqbBaqE/60kTeUoK11zY/VXyVv
         Rv/kvOcghG6jaqM3kJkzq53DNP9i46QlH4Nez01dL6ZUETdzNPcko9EbqTUvRJeTP6Nb
         gHKykJvlWVtk9wJb0vGbVmHdGaQ2wvCIPuT534S9Kl0td+FNAJTdHhxN+9ZjPVDBRcJj
         cQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=DaOCn82q9kV/RHC+Jyy5glsl9cnwkygvzX0a05g9ywE=;
        fh=QW/sty6zuGe+f03KlxMuRqvloQv3QKHD/mcAgcSuAjc=;
        b=PPLA+aMFAYO9FxC3pWPv8mQWfdgeV26AJw7GraC+AB/VT/iSbe4Ys6lDUMqHL82BZ6
         xnqXO8tBA+A5SP1l/T3RFlPYRIMLcur40d0kUuyvo6oKFH7Hg46hALYlww0VQoPDBNNg
         B3+scJnjy8sde8GSDKEOwec8pS325ClurZyg5yPViHqWOTz9ehDaB/SxRss/AYkshnIQ
         nNeuzCYiF8TqPCUr5WDK/JyieTU8bNJNVIldN2oRfzXInmeu0b4HV5NW2xcHv2IMN7gA
         Bn0drwQY8uKUG86znUpMcpsiiFWMKfAsF03nO72p5OF+2oA5jDFwLxHUyDtDvStM/A6Q
         7jPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7-20020ad45c67000000b00690d4ba4fd3si13033729qvh.398.2024.03.20.02.50.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Mar 2024 02:50:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmsa0-000212-9s; Wed, 20 Mar 2024 05:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rmsZv-0001zb-DP; Wed, 20 Mar 2024 05:49:47 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rmsZp-0000MF-Rv; Wed, 20 Mar 2024 05:49:45 -0400
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V03dy3Bbcz1h39r;
 Wed, 20 Mar 2024 17:47:02 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 9A59F1A0172;
 Wed, 20 Mar 2024 17:49:35 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 17:49:34 +0800
Message-ID: <b26cbc2d-c048-354e-2c19-43dadef7b44a@huawei.com>
Date: Wed, 20 Mar 2024 17:49:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH v8 06/23] target/arm: Add support for Non-maskable
 Interrupt
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
CC: <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, 
 <wangyanan55@huawei.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
 <20240318093546.2786144-7-ruanjinjie@huawei.com>
 <CAFEAcA_xSHAJnn0_O9=zGo9u8omzhuB_WvuMo9gf7wKt8OVDmw@mail.gmail.com>
 <cb5d981a-6db4-479c-9eaa-bca49c40bc72@linaro.org>
 <CAFEAcA9bKcu0FrfqRGg6bbtNX1kYR04_oian_5YXaduq_a3W3Q@mail.gmail.com>
In-Reply-To: <CAFEAcA9bKcu0FrfqRGg6bbtNX1kYR04_oian_5YXaduq_a3W3Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.417,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hXxfMr+3ahY8



On 2024/3/20 3:26, Peter Maydell wrote:
> On Tue, 19 Mar 2024 at 18:51, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 3/19/24 07:28, Peter Maydell wrote:
>>>>       switch (excp_idx) {
>>>> +    case EXCP_NMI:
>>>> +        pstate_unmasked = !allIntMask;
>>>> +        break;
>>>> +
>>>> +    case EXCP_VNMI:
>>>> +        if ((!(hcr_el2 & HCR_IMO) && !(hcr_el2 & HCR_FMO)) ||
>>>> +             (hcr_el2 & HCR_TGE)) {
>>>> +            /* VNMIs(VIRQs or VFIQs) are only taken when hypervized.  */
>>>> +            return false;
>>>> +        }
>>>
>>> VINMI and VFNMI aren't the same thing: do we definitely want to
>>> merge them into one EXCP_VNMI ?
>>
>> We do not, which is why VFNMI is going through EXCP_VFIQ.  A previous version did, and I
>> see the comment did not change to match the new implementation.
> 
> Why do we put VFNMI through VFIQ, though? They're not
> the same thing either... I think I would find this less
> confusing if we implemented what the spec says and distinguished
> all of (IRQ, FIQ, IRQ-with-superpriority and FIQ-with-superpriority).

Should there be separate VNMI lines and exceptions for the
IRQ-with-superpriority and FIQ-with-superpriority ?

> 
>>> The use of the _eff() versions of the functions here is
>>> correct but it introduces a new case where we need to
>>> reevaluate the status of the VNMI etc interrupt status:
>>> when we change from Secure to NonSecure or when we change
>>> SCR_EL3.EEL2 or SCR_EL3.HXEN. We either need to make sure
>>> we reevaluate when we drop from EL3 to EL2 (which would be
>>> OK since VINMI and VFNMI can't be taken at EL3 and none of
>>> these bits can change except at EL3) or else make the calls
>>> to reevaluate them when we write to SCR_EL3. At least, I don't
>>> think we currently reevaluate these bits on an EL change.
>>
>> We re-evaluate these bits on EL change via gicv3_cpuif_el_change_hook.
> 
> Only if the GIC is connected to the VIRQ and VFIQ interrupt lines,
> which it doesn't in theory have to be (though in practice it
> usually will be). Plus it feels a bit fragile against
> somebody deciding to put in a "this line hasn't changed state
> so don't bother calling the handler again" optimization in the
> future.
> 
> thanks
> -- PMM
