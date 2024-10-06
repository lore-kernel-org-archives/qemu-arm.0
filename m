Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1322506njb;
        Sun, 6 Oct 2024 01:00:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0RcfgX/t9jRBrCZAD9p3yPrU++CZAYTUoCiXV5cyAtkZsRJmz7FnN9F9Ozj7+ETTnxPJ6P33q95u6aw==@linaro.org
X-Google-Smtp-Source: AGHT+IGqfANkw4PD8FjFpo8P3iVa0y5ABWa/m8/pZZ3c7Cyso7k7IN+ZLC1enrUrfovDqBYUMN6u
X-Received: by 2002:a05:6214:2dc8:b0:6cb:3bc0:f5f8 with SMTP id 6a1803df08f44-6cb9a45c5a7mr125129496d6.38.1728201631502;
        Sun, 06 Oct 2024 01:00:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728201631; cv=none;
        d=google.com; s=arc-20240605;
        b=SxdBe7heTcP97JGygnZxoI+HYBBj1P3Ga2wW7RMEB3modsSflE78RZ46crpRya0uFx
         QoOQtXr0yWuoBNKIescDaZVKicxMopfs3/NipNi6PkXC9n81qRqcZXhsaav7K1aIZ6cP
         78ckpxQ5kpVMOly/i1e8t275HCfmQ8reWM/Fswsphdj1SeL1yZuRaGsBEa5oJHfUOKSt
         MdudAuCoqkEvzBzdAo2O9k2dWReB/vOJWULTYDAMNsb3Xps/ZVi6Y1FPYtvpnDEKwvPI
         9+jbObN7NnEyn1JBJlRHumIiXR9NPgzlslthmi2vJV0zPqTzy8d3/AVDEIxXA202uyZ/
         /zZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=Ou5JuTPGVZiC3ifacUBmsIaoE4lcFS/QCKIvm9iUQfk=;
        fh=11ftpBpDV4vughdtjwlu8r9gyL0WZFHVk/lZohOKGxo=;
        b=NVzQkYl3kGRo9uhVarrvjIGIss5nf/v1F1Nmf7XBjq9FxwZ31rOE6P12FjvpEI8Osk
         n6ZZ+aoOLjobyh5Ahg6pN5/DYopDT03dJKQ64ky7AeMKjP11kVUr14AkFRCxX3HTa+jJ
         td+SKUi1VhYclNwjHFLsNh6yi92tUozbsHJ+K0PKNIWLTkdsHr3u4Wg5k0Aa5h1jjhNB
         N90g/px0TBOs6kpXCMXbVL6zVJFXdhlkgFFRX40JzjDHpb5mOAXyS6BcXl7fRWKHnRam
         vqzx4jc60pDPMWUdE/BSoH+7YpyQfx7r1Onx2XPldc2Wfe8l4XoDnXTKeoHOObJ7CGe5
         T20Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cba475b7f7si36650356d6.271.2024.10.06.01.00.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Oct 2024 01:00:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxMBY-0003De-MC; Sun, 06 Oct 2024 04:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a.fatoum@pengutronix.de>)
 id 1sxMBR-00038q-Bx
 for qemu-arm@nongnu.org; Sun, 06 Oct 2024 04:00:05 -0400
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a.fatoum@pengutronix.de>)
 id 1sxMBO-0002y1-SZ
 for qemu-arm@nongnu.org; Sun, 06 Oct 2024 04:00:05 -0400
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1sxMBJ-0005Tc-KL; Sun, 06 Oct 2024 09:59:57 +0200
Message-ID: <0352a327-0e78-48d4-a876-d33689fcd766@pengutronix.de>
Date: Sun, 6 Oct 2024 09:59:56 +0200
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
 <65ab10d7-6594-490c-be07-39f83ac3559a@pengutronix.de>
 <87a5fiutai.wl-maz@kernel.org>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <87a5fiutai.wl-maz@kernel.org>
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
X-TUID: BBdfyEFt0TXB

Hello Marc,

On 05.10.24 23:35, Marc Zyngier wrote:
> On Sat, 05 Oct 2024 19:38:23 +0100,
> Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>> IIRC, the QEMU flash is implemented as a read-only memslot. A data
>>> cache invalidation is a *write*, as it can be (and is) upgraded to a
>>> clean+invalidate by the HW.
>>
>> So it's a write, even if there are no dirty cache lines?
> 
> Yes.
> 
> At the point where this is handled, the CPU has no clue about the
> dirty state of an arbitrary cache line, at an arbitrary cache level.
> The CPU simply forward the CMO downstream, and the permission check
> happens way before that.

I see. When I added that invalidation, it was suggested[1] that instead
of invalidation after the remapping, I would clean the range before
remapping. Cleaning the zero page triggered a data abort, which I didn't
understand as there should be no dirty lines, but now I get it.

One more question: This upgrading of DC IVAC to DC CIVAC is because
the code is run under virtualization, right?

[1]: https://lore.barebox.org/barebox/9809c04c-58c5-6888-2b14-cf17fa7c4b1a@pengutronix.de/

>> The routine[1] that does this remapping invalidates the virtual address range,
>> because the attributes may change[2]. This invalidate also happens for cfi-flash,
>> but we should never encounter dirty cache lines there as the remap is done
>> before driver probe.
>>
>> Can you advise what should be done differently?
> 
> If you always map the flash as Device memory, there is no need for
> CMOs. Same thing if you map it as NC.

Everything, except for RAM, is mapped Device-nGnRnE.

> And even if you did map it as
> Cacheable, it wouldn't matter. KVM already handles coherency when the
> flash is switching between memory-mapped and programming mode, as the
> physical address space changes (the flash literally drops from the
> memory map).
> 
> In general, issuing CMOs to a device is a bizarre concept, because it
> is pretty rare that a device can handle a full cache-line as
> write-back. Devices tend to handle smaller, register-sized accesses,
> not a full 64-byte eviction.

The same remap_range function is used to:

  - remap normal memory:
    - Mapping memory regions uncached for memory test
    - Mapping memory buffers coherent or write-combine
  - remap ROMs: BootROMs at address zero may be hidden behind the NULL
    page and need to be mapped differently when calling/peeking into it.
  - remap device memory, e.g. in the case of the cfi-flash here

The invalidation is done unconditionally for all of them, although it
makes only the sense in the first case.

> Now, I'm still wondering whether we should simply forward the CMO to
> userspace as we do for other writes, and let the VMM deal with it. The
> main issue is that there is no current way to describe this.
> 
> The alternative would be to silently handle the trap and pretend it
> never occurred, as we do for other bizarre behaviours. But that'd be
> something only new kernels would support, and I guess you'd like your
> guest to work today, not tomorrow.

I think following fix on the barebox side may work:

  - Walk all pages about to be remapped
  - Execute the AT instruction on the page's base address
  - Only if the page was previously mapped cacheable, clean + invalidate
    the cache
  - Remove the current cache invalidation after remap

Does that sound sensible?

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
