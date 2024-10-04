Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp386639njb;
        Fri, 4 Oct 2024 04:51:49 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUxjDre99A8mp9ObvlnX/XKT2X+/WZJzG+iIAHp3pVasRyUSorxV3RXvZDs4Hq5nOQ8QLpFLjM0Sg7ZjA==@linaro.org
X-Google-Smtp-Source: AGHT+IELNHhPP/xacpyvQp8LRWQL+zKeThzWoUj1VhEIzKZf8D0ShmH4anFjS3L5SUwY6aWj72XM
X-Received: by 2002:a05:6a00:3d46:b0:70d:265a:eec6 with SMTP id d2e1a72fcca58-71de23e2d8amr4463539b3a.13.1728042709577;
        Fri, 04 Oct 2024 04:51:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1728042709; cv=pass;
        d=google.com; s=arc-20240605;
        b=R/jWvwbZd8NeaxmwRWT/tbugg6RjZTOBD+QP0xDf7B7VAMPvHDB3gukFp8m5Ng8YRF
         nY1iUg+a3VQgd/DLl8ksdjvD2b1oqbd0YZHZ5dpRaS1nd+CLu8x9SEl9phQIs6FSh+zo
         +9SNmGGiASMUa1yZqI5xlpfdQVts1BESQ2UN7MOIN58I4BbWicraUMaCym3kVo3fwnr/
         emYl49G0AEDaRdzlrxdG2F/opFt/D5PrDvGvJ1uijzgGUAnEZA06CWyFAtDpSp17Puqe
         t+ZgjJWQ8D+GRSYNdhXdcqQteI0V99YIqtCfBe50Vj5bB1aBUR0Ww6F8znGPfv91rGkz
         OS8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id;
        bh=A8CY0MPNz65u83zzkQpZGHA2yWmLDWRj7viRGpaZSMI=;
        fh=CAbQ9BDNstdisPlH2CswLmUM1eipe1cQbLOukYdByUI=;
        b=kIk8NPPtZCFz7/RxYyyB2K7Y5g9lZDX/cyHm3q+UfrGNpiGpa9OrnxsMoI/uJW+jXz
         jEnbPyBa1Ap4i/Qwo68tCUtjnYIOk5Ot58ZXgKHU+30YQd6PIt5d0gYJtle6H18Vb3eT
         J3gXJsP/raAkKm37pRwdlYWZQ5MpyY1hgEoZpE1g/fANvSNhZ+7Gv3e+qAvNJHCErKBr
         GyEXItZ1tGW8DxRvzJE+zwQB7bQE6rQJ2EPhzTbu4Sh0Ta9/oxgmKUuTn6G454Oe3qwP
         2dTb6mT9t3eoMYGYju7pqWfBvvXJP2U4yuNnJ4lUcGKUAIWY1X26J2RpcqC0ZuCOPZnY
         Ox8A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=pengutronix.de);
       spf=pass (google.com: domain of kvmarm+bounces-16159-alex.bennee=linaro.org@lists.linux.dev designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvmarm+bounces-16159-alex.bennee=linaro.org@lists.linux.dev"
Return-Path: <kvmarm+bounces-16159-alex.bennee=linaro.org@lists.linux.dev>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-71dd9d732c3si3587100b3a.31.2024.10.04.04.51.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 04:51:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm+bounces-16159-alex.bennee=linaro.org@lists.linux.dev designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=pengutronix.de);
       spf=pass (google.com: domain of kvmarm+bounces-16159-alex.bennee=linaro.org@lists.linux.dev designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvmarm+bounces-16159-alex.bennee=linaro.org@lists.linux.dev"
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 173D128113C
	for <alex.bennee@linaro.org>; Fri,  4 Oct 2024 11:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06021EB2E;
	Fri,  4 Oct 2024 11:51:45 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748501D5AD8
	for <kvmarm@lists.linux.dev>; Fri,  4 Oct 2024 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728042705; cv=none; b=WvZIbv1b/JRXzkEjXUiOiRq9NOYepnJ+ZsBPr3SkGJuxPY/12NwN/01HtIHu13xwnViM+WMlhcrpDWiieXTisKhqfk70Wg4e8JIwIIxHm2Gyq6BrJJApG+dLE4e6ccIy9zCDZ8uQL4sA+5Wz+gTrqqk3f8UhbECk8YslxfpTOv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728042705; c=relaxed/simple;
	bh=+RV8w+SqG5co486pne4E9Kdn1l5e8/2DOkhj/ma8W7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwxEjNXZw4ICJNNPDu3lL/coJqL4jSXYzekpdQx97GbFdNNraYsr+WhhTGgynBLYmDtvPoqB/XiCGXBvcwp0np1IATH372C8pTrl9cb4I/6d9+sa8Yuq3suDjLQ1y4iUkSKrktjMRrcBMShK8GJBVO94lJb+vfilXMn4IiILyIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1swgqT-0006pg-26; Fri, 04 Oct 2024 13:51:41 +0200
Message-ID: <a4c06f55-28ec-4620-b594-b7ff0bb1e162@pengutronix.de>
Date: Fri, 4 Oct 2024 13:51:39 +0200
Precedence: bulk
X-Mailing-List: kvmarm@lists.linux.dev
List-Id: <kvmarm.lists.linux.dev>
List-Subscribe: <mailto:kvmarm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kvmarm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] ARM64 KVM: Data abort executing post-indexed LDR on MMIO
 address
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Enrico Joerns <ejo@pengutronix.de>
References: <89f184d6-5b61-4c77-9f3b-c0a8f6a75d60@pengutronix.de>
 <CAFEAcA_Yv2a=XCKw80y9iyBRoC27UL6Sfzgy4KwFDkC1gbzK7w@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAFEAcA_Yv2a=XCKw80y9iyBRoC27UL6Sfzgy4KwFDkC1gbzK7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kvmarm@lists.linux.dev
X-TUID: qIx5uxuwhe2G

Hello Peter,

Thanks for your quick response.

On 04.10.24 12:40, Peter Maydell wrote:
> On Fri, 4 Oct 2024 at 10:47, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>> I am investigating a data abort affecting the barebox bootloader built for aarch64
>> that only manifests with qemu-system-aarch64 -enable-kvm.
>>
>> The issue happens when using the post-indexed form of LDR on a MMIO address:
>>
>>         ldr     x0, =0x9000fe0           // MMIO address
>>         ldr     w1, [x0], #4             // data abort, but only with -enable-kvm
> 
> Don't do this -- KVM doesn't support it. For access to MMIO,
> stick to instructions which will set the ISV bit in ESR_EL1.
>
> That is:
> 
>  * AArch64 loads and stores of a single general-purpose register
>    (including the register specified with 0b11111, including those
>    with Acquire/Release semantics, but excluding Load Exclusive
>    or Store Exclusive and excluding those with writeback).
>  * AArch32 instructions where the instruction:
>     - Is an LDR, LDA, LDRT, LDRSH, LDRSHT, LDRH, LDAH, LDRHT,
>       LDRSB, LDRSBT, LDRB, LDAB, LDRBT, STR, STL, STRT, STRH,
>       STLH, STRHT, STRB, STLB, or STRBT instruction.
>     - Is not performing register writeback.
>     - Is not using R15 as a source or destination register.
> 
> Your instruction is doing writeback. Do the address update
> as a separate instruction.

This was enlightening, thanks. I will prepare patches to implement
readl/writel in barebox in ARM assembly, like Linux does
instead of the current fallback to the generic C version
that just does volatile accesses.

> Strictly speaking this is a missing feature in KVM (in an
> ideal world it would let you do MMIO with any instruction
> that you could use on real hardware).

I assume that's because KVM doesn't want to handle interruptions
in the middle of such "composite" instructions?

> In practice it is not
> a major issue because you don't typically want to do odd
> things when you're doing MMIO, you just want to load or
> store a single data item. If you're running into this then
> your guest software is usually doing something a bit strange.

The AMBA Peripheral ID consists of 4 bytes with some padding
in-between. The barebox code to read it out looks is this:

static inline u32 amba_device_get_pid(void *base, u32 size)
{
        int i;
        u32 pid; 

        for (pid = 0, i = 0; i < 4; i++)
                pid |= (readl(base + size - 0x20 + 4 * i) & 255) <<
                        (i * 8);

        return pid;
}

static inline u32 __raw_readl(const volatile void __iomem *addr)
{
        return *(const volatile u32 __force *)addr;
}

I wouldn't necessarily characterize this as strange, we just erroneously
assumed that with strongly ordered memory for MMIO regions and volatile
accesses we had our bases covered and indeed we did until the bases
shifted to include hardware-assisted virtualization. :-)

Thanks,
Ahmad

> 
> thanks
> -- PMM
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
