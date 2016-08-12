Received: by 10.25.21.156 with SMTP id 28csp203081lfv;
        Fri, 12 Aug 2016 08:05:06 -0700 (PDT)
X-Received: by 10.55.126.195 with SMTP id z186mr12087705qkc.76.1471014306645;
        Fri, 12 Aug 2016 08:05:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b17si4865656qtc.32.2016.08.12.08.05.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Aug 2016 08:05:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52669 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bYE1B-0007lC-UL
	for alex.bennee@linaro.org; Fri, 12 Aug 2016 11:05:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bYDUM-0004z0-3o
	for qemu-arm@nongnu.org; Fri, 12 Aug 2016 10:31:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bYDUI-0002k5-Vd
	for qemu-arm@nongnu.org; Fri, 12 Aug 2016 10:31:10 -0400
Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229]:34979)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bYDUI-0002jq-RP; Fri, 12 Aug 2016 10:31:06 -0400
Received: by mail-oi0-x229.google.com with SMTP id 4so36435852oih.2;
	Fri, 12 Aug 2016 07:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xijtZrbzec2icWGm12mBWYIh0WQVEPFhFfkjbOXbXhw=;
	b=uTi9pb9x22lxFkP49QaXn3O4yO1jiYpnHCJ8UBc0ig8DN8WD4bzhQ3goxSKdhpWiWx
	5BxynSE9GpqUc+r+zjjOB9qCzRh6QmMR7ZHeH/ZLL2JRcvk1uWA9q/fCKXyEowxTG2qH
	xNimmoVZO6Bz6vVsUBO2V1g11cw8UEEtyvq3poWiUk9OgPTk9zMasP9eTXRQqPU84UBT
	gIRlYCPkrqwLKFfhB1Ue62vARh0Pr5DCcxafW2IbelcBjaOaugvcAwVsab69EB6SNyQG
	PA9hOfFN83CSXKzIWDKNHTW6nf16yGXTh7j6a0jaGkBGD4YqFxewuJ1BkZBsno451ouu
	Grpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xijtZrbzec2icWGm12mBWYIh0WQVEPFhFfkjbOXbXhw=;
	b=hqrEBljpscLU6JrWkCnxTZKFxCdHgJQ7sCdhS3NR/yp6s+cDI5PznGTMouBSYJ3zDU
	PXMwbB0HXw9Fpz0qRDpMgNTSQWgYBXOWWd19egDwX9jAJAmCbc8oGuyBQXaj9M5qA8Ib
	PZJGNhB+T3T4nKwPZNh1PnE8oEl4zPJHFKtXtuIvLvAbFsWWh4WeHCToZLjOYHTarP37
	wMCX7Caiol9ThFOYF02tFM4BnAj5x+6DF1IctpYwtYX6xW+2PeSTb7vnPb6M1ZtLEjCM
	u+7wUz00N4FWNH5/Srjz4kGkfvY+Ym2tmrkojACj2yRdWe3Hy/umVDh6rmUfdRUMOlqK
	51jA==
X-Gm-Message-State: AEkoouu6YBrzYDDI7Wq5KDb98LQWzbnVHG9hb0BTm7Qf+ubnXQO3LP+aJhbND9lxtrLYurzleJiZlnikPLP5cg==
X-Received: by 10.202.206.20 with SMTP id e20mr7118437oig.136.1471001520867;
	Fri, 12 Aug 2016 04:32:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.244 with HTTP; Fri, 12 Aug 2016 04:32:00 -0700 (PDT)
In-Reply-To: <540c4c1d-1590-4c64-116a-e6b41bd3475e@twiddle.net>
References: <1470133216-6758-1-git-send-email-vijay.kilari@gmail.com>
	<1470133216-6758-3-git-send-email-vijay.kilari@gmail.com>
	<540c4c1d-1590-4c64-116a-e6b41bd3475e@twiddle.net>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Fri, 12 Aug 2016 17:02:00 +0530
Message-ID: <CALicx6so0YyDumHm3VX0WiUCdkKQx1MQHXEzTzbMyUHXT+Z4AQ@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::229
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH v1 2/2] utils: Add prefetch
 for Thunderx platform
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"prasun.kapoor" <Prasun.Kapoor@cavium.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VOLG0LG2G9M7

On Sat, Aug 6, 2016 at 3:47 PM, Richard Henderson <rth@twiddle.net> wrote:
> On 08/02/2016 03:50 PM, vijay.kilari@gmail.com wrote:
>>
>> +#define VEC_PREFETCH(base, index) \
>> +        asm volatile ("prfm pldl1strm, [%x[a]]\n" : :
>> [a]"r"(&base[(index)]))
>
>
> Is this not __builtin_prefetch(base + index) ?
>
> I.e. you can defined this generically for all targets.

__builtin_prefetch() is available only in gcc 5.3 for arm64.

>
>> +#if defined (__aarch64__)
>> +    do_prefetch = is_thunder_pass2_cpu();
>> +    if (do_prefetch) {
>> +        VEC_PREFETCH(p, 8);
>> +        VEC_PREFETCH(p, 16);
>> +        VEC_PREFETCH(p, 24);
>> +    }
>> +#endif
>> +
>>      for (i = BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR;
>>           i < len / sizeof(VECTYPE);
>>           i += BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR) {
>> +
>> +#if defined (__aarch64__)
>> +        if (do_prefetch) {
>> +            VEC_PREFETCH(p, i+32);
>> +            VEC_PREFETCH(p, i+40);
>> +        }
>> +#endif
>> +
>
>
> Surely we shouldn't be adding a conditional around a prefetch inside of the
> inner loop.  Does it really hurt to perform this prefetch for all aarch64
> cpus?

prefetch is only required for thunderx pass2 platform. I will remove this
condition check.

>
> I'll note that you're also prefetching too much, off the end of the block,
> and that you're probably not prefetching far enough.  You'd need to break
> off the last iteration(s) of the loop.
>
> I'll note that you're also prefetching too close.  The loop operates on
> 8*vecsize units.  In the case of aarch64, 128 byte units.  Both i+32 and

128 unit is specific to thunder. I will move this to thunder
specific function

> i+40 are within the current loop.  I believe you want to prefetch at
>

I am dropping i+40

>   i + BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR * N
>
> where N is the number of iterations in advance to be fetched.  Probably N is
> 1 or 2, unless the memory controller is really slow.
>
>
> r~
