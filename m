Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp664943njb;
        Fri, 4 Oct 2024 12:50:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxdmCqIwimSWMgsUIbeJS8pObv5rY+aPPlWdfUgSE6ogpIP+FCyvEMELXQIVKkbVPgH0yJ4i2txYK9Kw==@linaro.org
X-Google-Smtp-Source: AGHT+IG69lcjA5wZHlAkmQ3lPk10X7bJ0EGgm+9vrGA7E9X34iHwnytjrl5YWl7xhOjF+3GrYdOh
X-Received: by 2002:a05:620a:3725:b0:7ae:6e02:6a9d with SMTP id af79cd13be357-7ae6f43a92amr710408385a.26.1728071445602;
        Fri, 04 Oct 2024 12:50:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728071445; cv=none;
        d=google.com; s=arc-20240605;
        b=SSmORgcwqXqw1JPmXqc4PyGpzTxBpemsiuszd4PdkK1KcdIeGrvfqtlawsVGfCQOyn
         WgZY2hyqfGjNGqewNBGrsVjc3AkfO1yZjOgKLS8eH2CP6Kf6EBOq56RGypq8p0MVr6Lf
         QZMs1tX/7SG3srlvL45gcDA4O+IucQW2V5DyGDsf56YfrrjrDOO9WWAkDbRJs2CuBxbl
         +jBqe0PJML9ngJPggaf+H5BCviZFklvyAZDnpNnQ0SGZnJr87UQOm6dD+Dbx8JUBRs7Y
         ligAR1Uer58WaBV+qH94eQsMAlBfq/y938/5wqwMElek6AAhgO2uEADMfHSqKEj/+1Yn
         ct9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=Yoy0QBaXuWq9zQCN1DnTsTcGojJx4kkJvXqAeEBHiB4=;
        fh=CAbQ9BDNstdisPlH2CswLmUM1eipe1cQbLOukYdByUI=;
        b=LllQi7MHH8ij9GmXHA7zE4p+qJlJsv3kchYP7tFjZBx+GOm1wvNNIoWoku4uHT+Hw8
         TUKsaMRSxRzg7mhVRksWzFYK/5/+oTVAIt0Oo+pwvs+7S+Os6omLDnDRNFtXw0wFC4Sc
         fc7TnehtTkYSPzgwCWCAWCvldntZDmcfB1Fz3zNehdz68ZbxpeeSoTUx/4EuAd+L2nAo
         pKai7bUnjCtRD8EfY0aQljmcru0G7QVsICa2NSb3dgf6hjILUK5VUimlK1hbNgVdIl7x
         u6I6mLVCNsXQfrhBnLwGH/j1bErHj4ZYB+JUcvFKWzqeqXMCYcPyptIGLCUVJfnq3mVb
         5jmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae756158bfsi35439985a.110.2024.10.04.12.50.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 12:50:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swoJo-0004Sj-B5; Fri, 04 Oct 2024 15:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a.fatoum@pengutronix.de>)
 id 1swoJm-0004SR-Pi
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 15:50:27 -0400
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a.fatoum@pengutronix.de>)
 id 1swoJk-000410-Pn
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 15:50:26 -0400
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1swoJg-0001qQ-83; Fri, 04 Oct 2024 21:50:20 +0200
Message-ID: <4d559b9e-c208-46f3-851a-68086dc8a50f@pengutronix.de>
Date: Fri, 4 Oct 2024 21:50:18 +0200
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
 <a4c06f55-28ec-4620-b594-b7ff0bb1e162@pengutronix.de>
 <CAFEAcA9F3AR-0OCKDy__eVBJRMi80G7bWNfANGZRR2W8iMhfJA@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAFEAcA9F3AR-0OCKDy__eVBJRMi80G7bWNfANGZRR2W8iMhfJA@mail.gmail.com>
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
X-TUID: 0md/dv6gZbsI

Hi,

On 04.10.24 14:10, Peter Maydell wrote:
> On Fri, 4 Oct 2024 at 12:51, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>> On 04.10.24 12:40, Peter Maydell wrote:
>>> Don't do this -- KVM doesn't support it. For access to MMIO,
>>> stick to instructions which will set the ISV bit in ESR_EL1.
>>>
>>> That is:
>>>
>>>  * AArch64 loads and stores of a single general-purpose register
>>>    (including the register specified with 0b11111, including those
>>>    with Acquire/Release semantics, but excluding Load Exclusive
>>>    or Store Exclusive and excluding those with writeback).
>>>  * AArch32 instructions where the instruction:
>>>     - Is an LDR, LDA, LDRT, LDRSH, LDRSHT, LDRH, LDAH, LDRHT,
>>>       LDRSB, LDRSBT, LDRB, LDAB, LDRBT, STR, STL, STRT, STRH,
>>>       STLH, STRHT, STRB, STLB, or STRBT instruction.
>>>     - Is not performing register writeback.
>>>     - Is not using R15 as a source or destination register.
>>>
>>> Your instruction is doing writeback. Do the address update
>>> as a separate instruction.

With readl/writel implemented in assembly, I get beyond that point, but
now I get a data abort running an DC IVAC instruction on address 0x1000,
where the cfi-flash is located. This instruction is part of a routine
to remap the cfi-flash to start a page later, so the zero page can be
mapped faulting.

Simple reproducer:

start:
        ldr     x0, =0x1000
        ldr     x1, =0x1040
        bl      v8_inv_dcache_range

        mov     w10, '!'
        bl      putch

        ret

v8_inv_dcache_range:
        mrs     x3, ctr_el0
        lsr     x3, x3, #16
        and     x3, x3, #0xf
        mov     x2, #0x4
        lsl     x2, x2, x3
        sub     x3, x2, #0x1
        bic     x0, x0, x3
1:
        dc      ivac, x0
        add     x0, x0, x2
        cmp     x0, x1
        b.cc    1b
        dsb     sy
        ret

This prints ! without KVM, but triggers a data abort before that with -enable-kvm:

  DABT (current EL) exception (ESR 0x96000010) at 0x0000000000001000
  elr: 000000007fbe0550 lr : 000000007fbe01ac
  [snip]

  Call trace:
  [<7fbe0550>] (v8_inv_dcache_range+0x1c/0x34) from [<7fbe0218>] (arch_remap_range+0x64/0x70)
  [<7fbe0218>] (arch_remap_range+0x64/0x70) from [<7fb8795c>] (of_platform_device_create+0x1e8/0x22c)
  [<7fb8795c>] (of_platform_device_create+0x1e8/0x22c) from [<7fb87a04>] (of_platform_bus_create+0x64/0xbc)
  [snip]

Any idea what this is about?

Thanks,
Ahmad


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
