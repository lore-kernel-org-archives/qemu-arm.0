Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2572359wre;
        Sun, 3 Jun 2018 05:14:43 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKzV0j9ibpcpOrg6Q/fDA9fiqdNwI3oOml0b913fdP+utMcEdDlKCgHEKVUZnXfow5Fc24X
X-Received: by 2002:a0c:e90f:: with SMTP id a15-v6mr16113246qvo.165.1528028083667;
        Sun, 03 Jun 2018 05:14:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528028083; cv=none;
        d=google.com; s=arc-20160816;
        b=mcG3hj2dihNBP7vCa+eHnhu3cIM48PCnV30BGBHjidsDYUD7AGNdMEMwFh3uPbg5NY
         dlFPLA2en60mEmAub6S9eKpuWrWxpv/LlrQ2XZPIuJAJ2FQEiaDSYTh5Hunv6bNqkQYj
         Z5MCvnv8kN2Tyek6ipN8SpwfPldvdgd9yUHUDcEAbgCvEVE3HKV2DHAeNwFzg5k5HcDu
         O23P9VqILQr3qUP889g/JKq4wSMPt/5u56g3CrPYv07vgt+MO9qSHjHzqSP6hWQbghrf
         b7tz7Ffp+jwla6xo2UMxpleb7NFP/PSHRfH6BEtm8Z4yOi8uAYkDvg/IlEDK7XK04MSu
         BOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=GbnlKgim+CRJ3HsA7xNZ/9+jfMlYvZ5IYtv7ZTdAbos=;
        b=cVec6PZDqg5IEK7/km6nl8zcIdU3RwudzUoqfkgXBOaEM/GBXppd0Y/ljbn6TDXdmR
         JN/I/BrJPFTPek5ZqTtCG8xHiHbbfgfJtX98cYZOh2b79qU44dcBs6IHHOE9/lXmZazy
         3Svkm6fktEffp8Fy2LnSqcFWYW9Wdm2UXtNsk+9YV6kIaXQuIu6Kq8Fd8Hmb27nAbwnt
         46S9YjfCtPLdV7N7rFMg3CFGrZwUbPR6VFc10wzpCPJ8A5Ac/PRyUSmLaHNKLGk4rWyn
         J1wSbrGqCQjjjfLErBzptlyeXZ/UHp8Nsl+3KzAdPbwU9i6uaDRjhy7rKRblnIuP5vcq
         k0cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N87JvXA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 32-v6si15496514qvn.112.2018.06.03.05.14.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 03 Jun 2018 05:14:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N87JvXA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPRuF-0000hr-5u
	for alex.bennee@linaro.org; Sun, 03 Jun 2018 08:14:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPRu3-0000ha-Mx
	for qemu-arm@nongnu.org; Sun, 03 Jun 2018 08:14:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPRu2-00032p-Mg
	for qemu-arm@nongnu.org; Sun, 03 Jun 2018 08:14:31 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:40760)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fPRu2-00031g-HE
	for qemu-arm@nongnu.org; Sun, 03 Jun 2018 08:14:30 -0400
Received: by mail-oi0-x243.google.com with SMTP id f79-v6so12160683oib.7
	for <qemu-arm@nongnu.org>; Sun, 03 Jun 2018 05:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GbnlKgim+CRJ3HsA7xNZ/9+jfMlYvZ5IYtv7ZTdAbos=;
	b=N87JvXA6SMZQ5yHO1kOpSSJqbzsRZj9n9q9TfyfsGWOPe22SHQNxFTdHGQHGbr8m3W
	ZUxvRMTnSgUdJ5hxUfMacUlvy2BjkiHHtgzAJ0//50JYQNOLdUn3IUWguHmrSLlmCV07
	vSy1dVQXkUzHsmOY2e1ZR18NxB8T6gFbaB4vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GbnlKgim+CRJ3HsA7xNZ/9+jfMlYvZ5IYtv7ZTdAbos=;
	b=iMUoEauW8OeZ0EVsfKeTyYGFnCD9v5dW5+ZU93fXoObK03KE6hy3RKBApYkABw8FQO
	w0tZtAByeG5FXQv5C05fPMSHXhCHjEHrfthdqFFlHn/4JjjRkGyhlVMFGoIRT/R42/Xn
	7gveyqlCZ8Hmy6cuX0jKr28QtUjKRxwIKcvSyT9g90Q5FjJlLkZWX6WabrWFOtuGBNfz
	sLVWDWElufNGFPRCGFiGZ4e6Wtl4Ct5dnxwDgVIqs8PZNDPMam0ze4GEaoJ51KlJ7s5m
	0mrhW6H0paQOErmZTko9cnWrzPJsw8Nad0VjM+N5m4QHQILo9l2VxrbufY7GrCd+VPpr
	l6Hw==
X-Gm-Message-State: ALKqPwdBnUtWEbh23ktS5amY1RaH1NEbXg/qISTStaA0EcScFohNJ/mW
	+Uq21IFfJOLgE5R2oldz86jEPRJTZqfi26t7aOKdKw==
X-Received: by 2002:aca:f141:: with SMTP id
	p62-v6mr10381061oih.80.1528028069681; 
	Sun, 03 Jun 2018 05:14:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Sun, 3 Jun 2018 05:14:09 -0700 (PDT)
In-Reply-To: <CACPK8XfOZezMM2fL1aNoPx7Gjc1zeCJf5MNaS4FOPfZ5XABB2w@mail.gmail.com>
References: <20180601144328.23817-1-peter.maydell@linaro.org>
	<20180601144328.23817-3-peter.maydell@linaro.org>
	<CACPK8XfOZezMM2fL1aNoPx7Gjc1zeCJf5MNaS4FOPfZ5XABB2w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 3 Jun 2018 13:14:09 +0100
Message-ID: <CAFEAcA_ixGE+noHpuPVyRZCKnWqL-Nx6QqUxaj_fx+VLdKfKcA@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/armv7m: Remove unused
 armv7m_init() function
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	"patches@linaro.org" <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pM4BhkDjzwB/

On 3 June 2018 at 01:48, Joel Stanley <joel@jms.id.au> wrote:
> Hi Peter,
>
> On 2 June 2018 at 00:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Remove the now-unused armv7m_init() function. This was a legacy from
>> before we properly QOMified ARMv7M, and it has some flaws:
>>
>>  * it combines work that needs to be done by an SoC object (creating
>>    and initializing the TYPE_ARMV7M object) with work that needs to
>>    be done by the board model (setting the system up to load the ELF
>>    file specified with -kernel)
>>  * TYPE_ARMV7M creation failure is fatal, but an SoC object wants to
>>    arrange to propagate the failure outward
>>  * it uses allocate-and-create via qdev_create() whereas the current
>>    preferred style for SoC objects is to do creation in-place
>>
>> Board and SoC models can instead do the two jobs this function
>> was doing themselves, in the right places and with whatever their
>> preferred style/error handling is.

>> -DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
>> -                         const char *kernel_filename, const char *cpu_type)
>> -{
>> -    DeviceState *armv7m;
>> -
>> -    armv7m = qdev_create(NULL, TYPE_ARMV7M);
>> -    qdev_prop_set_uint32(armv7m, "num-irq", num_irq);
>> -    qdev_prop_set_string(armv7m, "cpu-type", cpu_type);
>> -    object_property_set_link(OBJECT(armv7m), OBJECT(get_system_memory()),
>> -                                     "memory", &error_abort);
>
> It looks like the snippet above is going to be a cut/paste for all v7m machines.

If you look at pretty much all the v7m machines except stellaris,
they don't use this code fragment. (Instead you have an
object_initialize()/qdev_set_parent_bus() in the SoC container's
init function, calls to set properties and realize in the container's
realize, and a call to armv7m_load_kernel() in the board code.)

I agree that what you might call the "modern style" of writing
SoC containers like that has a lot of boilerplate, but that's
not specific to the armv7m object, and if we want to reduce
boilerplate we should look at how we can do it consistently
across devices.

thanks
-- PMM
