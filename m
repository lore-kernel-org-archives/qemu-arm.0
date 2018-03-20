Received: by 10.28.91.67 with SMTP id p64csp3238461wmb;
        Mon, 19 Mar 2018 18:01:54 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtwIvyR5NMW2BYOmLcxySDwRiBPgRaY56nOtARNWBfKeYzagZ4cwuAwTvn7iWhxRA1Rw6xq
X-Received: by 10.200.57.132 with SMTP id v4mr21021658qte.204.1521507714141;
        Mon, 19 Mar 2018 18:01:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521507714; cv=none;
        d=google.com; s=arc-20160816;
        b=bZu/3n8h+IF3H3kYlw4vS8IxJtKpzSOOfwc5IPADTdExe3hegBJeZj/6wUTVaD6wlB
         4N4jEmdT72zII5RdsBsALKiRRTNYXbgliWwlwqzbLHjmJ4vPd1mH3jfYiU0o2Q6Gkq9c
         06rDKmZ9dLdtARQE1diPRq22o0Zg9TcG/7AzJJ1gCGd0oBno7XPoUR5e7y+1Ov2XU4Jf
         GtBxY0n1huHzdUkIjbPcy41uWXQP3lB8OF5TcKrMUItnqCMEaJrLxMf+PVnlBBf8od50
         bOXEZjizqOZeE53TMDWxegHerQmEOuvJdY4F1L9lZhoN7zFkn5wKI8HzuQ7wBO0f62zP
         G22w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=rdxmO/fWUE9nzHFiWp9GuowsXdLRnykepGrbfYLUkwg=;
        b=YC+PuCtwP16dPojio7sm15WxHUB4ORf1y12aGsAT9j/Z6FuK3BqJkfMFE3tX6sBKhD
         KHOPvHifI1Q1VD/J5rDBTZ1gs10AsAg1biLaAAtsDm9RgL3s2DOAuz/oaNAtcZF6aaJV
         OqgCn3Az6sj62TkQ15F/XVF/BSi5YNurh+wX9GidVQpJ5eWbWATc6bjkCu8Zv32Ew0zV
         VIJ0tEGlm6+f+BnkHYQnOjfaIuDEdyBH+dVAPbT5lbDWDJL8nUUBSTvM6IiUAyttdiQB
         zpMo6d6lE3hqfaQqV6m370WvMz/nhp7gxEyfEJhDQ9JVdUBEFiE5oRI+706WF7yRxSHj
         pmlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a6+NvT1v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d28si1608097qkh.274.2018.03.19.18.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 18:01:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a6+NvT1v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ey5ez-00079a-KH
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 21:01:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ey5el-00079I-D9
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 21:01:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ey5eh-00059w-Hh
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 21:01:39 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:50297)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ey5eh-00059E-8J; Mon, 19 Mar 2018 21:01:35 -0400
Received: by mail-wm0-x241.google.com with SMTP id f19so340093wmc.0;
	Mon, 19 Mar 2018 18:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rdxmO/fWUE9nzHFiWp9GuowsXdLRnykepGrbfYLUkwg=;
	b=a6+NvT1v+jAryV3qbOX/0MKEWhlYaknWtQBZhIFMm9c81WlvRuXH39oeCcoCNjpydz
	7naxTvSAy6eYM+e9Qoa74ZVKxagT27rtlGZJjSz3O4HZgvOQKcwE7CIMW8bd0ZS3pU70
	rOyFaMwMPHsEwYy1nAVC9fWCt4rHPtXMSeSML9PhwJFVGhex6Ia4q5u9LWb4/K2Xxx0i
	PGTuCPK3kLX+RGCOTXEt3ehCBTz8D35h5yNTTyX3ZwMqHo2gzhEBwl/IMMmgCSOm9ALG
	rlR2Utrw3vyh/r6Djo64edjkW4u0ZHngfW/42B0VqjE7ikQS2guuHNXSyPbgeR6stiGc
	v9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=rdxmO/fWUE9nzHFiWp9GuowsXdLRnykepGrbfYLUkwg=;
	b=ZrxeocY6DRVaXTyC0lhiL06Ua4sK5Ysr2OyuvGQgjShwYpH8ortM8AYcn4vBjA4l2h
	YOkZ3H0UNMC4K+0VtkyHejrZ4s3Fx5muADzIddCpEZFEt+GU/bvDV4j29BXZXC7yREHO
	iWkcXiX+geww9OvXvePY7Peu6Fqv/VLWKKaQq8LuPoZrA1n9qIzYD9AnbxI5U+isLtOF
	GblDoR9fBZggeW1DMaIxMja7B5TGvzxuVVX4/76AE6SkJ66J84x5wF36UcJ0pflt0SDl
	LFgP6Aj8UWtzG1mY/AtK5npBqiH6HhZmLX7hgKwR0PTDTmsG70jnzGAS2lRUbibYeDga
	1cWA==
X-Gm-Message-State: AElRT7GOL+2GGpf1+allSQJUJGEysYwlTlrq/yl7WSdUkvnBFvPNNVFk
	WMKbozbHwz0BiwE/aZIuTCVKyO6L
X-Received: by 10.28.64.193 with SMTP id n184mr485664wma.4.1521507693585;
	Mon, 19 Mar 2018 18:01:33 -0700 (PDT)
Received: from [192.168.1.37] (67.23.27.109.rev.sfr.net. [109.27.23.67])
	by smtp.gmail.com with ESMTPSA id s19sm902421wmb.23.2018.03.19.18.01.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 18:01:32 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	Aaron Lindsay <alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-15-git-send-email-alindsay@codeaurora.org>
	<9af89876-bf5d-4696-a430-664fcd5a02fa@amsat.org>
	<20180319152426.GB24561@codeaurora.org>
	<CAFEAcA_1gVEziptLMoEm-noVM7EZqP=KLg1uyaLfAd+7PToHdQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <d0800ac1-2830-31d2-c41d-1387cace20dc@amsat.org>
Date: Tue, 20 Mar 2018 02:01:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_1gVEziptLMoEm-noVM7EZqP=KLg1uyaLfAd+7PToHdQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 14/22] target/arm: Make
 PMOVSCLR 64 bits wide
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, Michael Spradling <mspradli@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: os3a4746NCLA

On 03/19/2018 04:31 PM, Peter Maydell wrote:
> On 19 March 2018 at 15:24, Aaron Lindsay <alindsay@codeaurora.org> wrote:
>> Phil,
>>
>> On Mar 19 00:14, Philippe Mathieu-Daudé wrote:
>>> Hi Aaron,
>>>
>>> On 03/16/2018 09:31 PM, Aaron Lindsay wrote:
>>>> This is a bug fix to ensure 64-bit reads of this register don't read
>>>> adjacent data.
>>>>
>>>> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
>>>> ---
>>>>  target/arm/cpu.h | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>>>> index 9c3b5ef..fb2f983 100644
>>>> --- a/target/arm/cpu.h
>>>> +++ b/target/arm/cpu.h
>>>> @@ -367,7 +367,7 @@ typedef struct CPUARMState {
>>>>          uint32_t c9_data;
>>>>          uint64_t c9_pmcr; /* performance monitor control register */
>>>>          uint64_t c9_pmcnten; /* perf monitor counter enables */
>>>> -        uint32_t c9_pmovsr; /* perf monitor overflow status */
>>>> +        uint64_t c9_pmovsr; /* perf monitor overflow status */
>>>
>>> This doesn't look correct, since this reg is 32b.
>>>
>>> I *think* the correct fix is in ARMCPRegInfo v7_cp_reginfo[]:
>>>
>>>     { .name = "PMOVSR", ...
>>> -     ..., .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
>>> +     ..., .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
>>>       .accessfn = pmreg_access,
>>>       .writefn = pmovsr_write,
>>>       .raw_writefn = raw_write },
>>
>> Nearly all of these PMU registers are 32 bits wide, but most of them are
>> implemented as 64-bit registers (PMCR, PMCNTEN*, PMSELR, PMINTEN* are a
>> few examples I see in this patch's context). My understanding is that
>> AArch64 register accesses are handled as 64 bits, even if the register
>> itself isn't that wide (though I haven't personally verified this).
> 
> Correct. Technically there's no such thing as a 32-bit wide AArch64
> system register -- that is just a shorthand in the Arm ARM for
> "64-bit wide with the top 32-bits being RES0".

Ok, good to know. Thanks both for your explanation :)

Phil.
