Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1121011njb;
        Sat, 5 Oct 2024 11:38:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0MLUrO3y/7h344Db09hYM/kTxoi/aaDalfplpwfwZSB0J6Z8E8atfTEi7kftQgp0wgToUekZdW29zjg==@linaro.org
X-Google-Smtp-Source: AGHT+IHr+OPSeQIngvL0J6hjG4QTNq4+0R93cdoDjBcZZn8qng5KqA2QW+HTqWaydWkXBviIfEyZ
X-Received: by 2002:ac8:5a52:0:b0:458:3b10:872 with SMTP id d75a77b69052e-45d9bb34e8amr100812261cf.60.1728153526049;
        Sat, 05 Oct 2024 11:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728153526; cv=none;
        d=google.com; s=arc-20240605;
        b=kuKe+tz4sXvHZBsptGiFBNxx+r15U6RDJa6Q9rhoulcFFhKxGykCUdVtd8jVFNzskn
         1LOuro6ucLc2AQNufmqJrc4/PCFJFvKM16V9oHJXYUDxCBIaUUyTMGB+51Jc5acqhBoz
         J8DMp9GuZTDvoct2KYg4L4S/GnscD3XeIfM1D352AgeoPHRQbFTH8J39FFT9G8W7yv+n
         KwYtjkRGir0YDSf2xWb0SUS/vvUdkG02QroKOES9c+/u+hs1t3zRotLlhCxvgzmPe6RN
         fFzCGtFZ2ey7wA62KB12JA+I7dUhzFkpidyMr+d9vi7rADS3dICb4EqUnkdXWL9ruM5c
         EyVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=JW1Q+AXUfpg5ccyV1NNyWdXQx2llJCmjitOM7aU47tY=;
        fh=11ftpBpDV4vughdtjwlu8r9gyL0WZFHVk/lZohOKGxo=;
        b=bC0yJ1ZQlXYSOxJWMIZm4fj68d8ViMlc+wu5JPADpMqDasQcEuql9Tucs7xVwH2CUr
         hptY775WMNvsdFtfAlsz5WQpHBneF3cjvA+l74d9yscBYivENPuseu2cBt7zQraKCbhc
         gJJMVJrbDw5CtxTnKVp9+Ko7Bga8LT8XzmShKxVrGOtSz+ef3mSxzPQryFG332/H8aqo
         56fwAgakSJIG8e6iyO4gwzO3MnkhQgvBz+Ms/3A5UOygq9X7aBhv4azZMYIuJgqGGP82
         QRUqiLTLcrrhz5Qqz5OoGnG5GCVmxBuZ+uAjroEUKJz08MPw0vOLEC9xX0QFyzrtMVsX
         sfag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45da74abe46si24409921cf.72.2024.10.05.11.38.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Oct 2024 11:38:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sx9fr-00024o-3I; Sat, 05 Oct 2024 14:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a.fatoum@pengutronix.de>)
 id 1sx9fn-00023l-2B
 for qemu-arm@nongnu.org; Sat, 05 Oct 2024 14:38:35 -0400
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a.fatoum@pengutronix.de>)
 id 1sx9fk-00065s-QK
 for qemu-arm@nongnu.org; Sat, 05 Oct 2024 14:38:34 -0400
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1sx9fd-0001EL-CD; Sat, 05 Oct 2024 20:38:25 +0200
Message-ID: <65ab10d7-6594-490c-be07-39f83ac3559a@pengutronix.de>
Date: Sat, 5 Oct 2024 20:38:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] ARM64 KVM: Data abort executing post-indexed LDR on MMIO
 address
To: Marc Zyngier <maz@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Enrico Joerns <ejo@pengutronix.de>
References: <89f184d6-5b61-4c77-9f3b-c0a8f6a75d60@pengutronix.de>
 <CAFEAcA_Yv2a=XCKw80y9iyBRoC27UL6Sfzgy4KwFDkC1gbzK7w@mail.gmail.com>
 <a4c06f55-28ec-4620-b594-b7ff0bb1e162@pengutronix.de>
 <CAFEAcA9F3AR-0OCKDy__eVBJRMi80G7bWNfANGZRR2W8iMhfJA@mail.gmail.com>
 <4d559b9e-c208-46f3-851a-68086dc8a50f@pengutronix.de>
 <864j5q7sdq.wl-maz@kernel.org>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <864j5q7sdq.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: qemu-arm@nongnu.org
Received-SPF: pass client-ip=2a0a:edc0:2:b01:1d::104;
 envelope-from=a.fatoum@pengutronix.de; helo=metis.whiteo.stw.pengutronix.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: QccvhrEOpXVw

Hello Marc,

On 05.10.24 12:31, Marc Zyngier wrote:
> On Fri, 04 Oct 2024 20:50:18 +0100,
> Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>> With readl/writel implemented in assembly, I get beyond that point, but
>> now I get a data abort running an DC IVAC instruction on address 0x1000,
>> where the cfi-flash is located. This instruction is part of a routine
>> to remap the cfi-flash to start a page later, so the zero page can be
>> mapped faulting.

[snip]

>> Any idea what this is about?
> 
> IIRC, the QEMU flash is implemented as a read-only memslot. A data
> cache invalidation is a *write*, as it can be (and is) upgraded to a
> clean+invalidate by the HW.

So it's a write, even if there are no dirty cache lines?

> KVM cannot satisfy the write, for obvious reasons, and tells the guest
> to bugger off (__gfn_to_pfn_memslot() returns KVM_PFN_ERR_RO_FAULT,
> which satisfies is_error_noslot_pfn() -- a slight oddity, but hey, why
> not).
> 
> In the end, you get an exception. We could relax this by
> special-casing CMOs to RO memslots, but this doesn't look great.
> 
> The real question is: what are you trying to achieve with this?

barebox sets up the MMU, but tries to keep a 1:1 mapping. On Virt, we
want to map the zero page faulting, but still have access to the first
block of the cfi-flash.

Therefore, barebox will map the cfi-flash one page later
(virt 0x1000,0x2000,... -> phys 0x0000,0x1000,...) and so on, so the first
page can be mapped faulting.

The routine[1] that does this remapping invalidates the virtual address range,
because the attributes may change[2]. This invalidate also happens for cfi-flash,
but we should never encounter dirty cache lines there as the remap is done
before driver probe.

Can you advise what should be done differently?

[1]: https://elixir.bootlin.com/barebox/v2024.09.0/source/arch/arm/cpu/mmu_64.c#L193
[2]: https://lore.kernel.org/barebox/20230526063354.1145474-4-a.fatoum@pengutronix.de/

Thanks,
Ahmad

> 
> 	M.
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
