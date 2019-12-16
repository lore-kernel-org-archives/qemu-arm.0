Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4755529lff;
        Mon, 16 Dec 2019 08:18:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqwC6N6+Y5luJNvCM0KzYQ25tL355geXApZPsU/lkGKLDN2pYfxbzUbgf0iTYRH0i9MMGDOB
X-Received: by 2002:a05:6830:10a:: with SMTP id i10mr31297807otp.365.1576513125203;
        Mon, 16 Dec 2019 08:18:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576513125; cv=none;
        d=google.com; s=arc-20160816;
        b=Z3kWGI6+DQcAT6QFQzp96G+NQr2688qaOWoS3LCemWmDWwq1bkAg7hPOBecuuSwZQ9
         OfCAvKuDf42zS4AoRTZ1821f3P9b8IDjhSXZXisPI9k2gDso3fD9TObUZLZCqYVQDcZE
         3TW2mnBVKuEOmiN7V8D2eNTguYv2a7YiTJ2v2kEXupClNHTEjM2P8KFgQXvp0xJe7+IJ
         jXDB3KXU1INe02g7wPXzXEKk0HlgmAF7IeMnBrSzpBfZcnPytNZNfKmeJlMO6PvLbpBV
         FoeYtkw7jwRTODKaHk577vAQFjn7sOj90SBdLnPGiDIbF7guc/Jk4fy0gyEFry/Hzb+B
         NFXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:message-id
         :references:in-reply-to:from:date:content-transfer-encoding
         :mime-version:subject:to;
        bh=v/X6zm6rjtuL4U9zomzXF7IvLXDw55lm0i0+bptFZfc=;
        b=Y31U7P9KH2M+lLSbC3oASixIul+8H8TCgXec+HKHTz7e32PrUtg04LM1YeAIoWG5KL
         LaXiGfKtY/iyr/3XDSzNTKWsqxBKkhAfc410becmO74x38jAVozHAiBfI6KJfpVqLTcn
         0GrCB2aGVzC6YwVczl5BVq8l5vaC+pqGXaCVahTiYZWOgOaL7XwsOUBepe+hT5qjO+Qo
         A8IswgkFbweaRnAS8AvyBgzHvFry2ao4bLBGhXU0XUiW+0Vx2TRH/RY4c2ENw5fjH/aT
         MMYHBoDyolVODRhBcdP1VHLBE70HhbWovzqgIVBvA5Hzb4LSqxn8jQm7apIedkHABTOh
         rTNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10si2629ota.294.2019.12.16.08.18.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 08:18:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:56376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igt52-00045w-AN
	for alex.bennee@linaro.org; Mon, 16 Dec 2019 11:18:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50902)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1igt4p-0003xA-UF
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 11:18:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maz@kernel.org>) id 1igt4o-0007sz-Ts
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 11:18:31 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:50356)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <maz@kernel.org>)
 id 1igt4l-0007gz-JQ; Mon, 16 Dec 2019 11:18:27 -0500
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
 (envelope-from <maz@kernel.org>)
 id 1igt4h-0003D3-8K; Mon, 16 Dec 2019 17:18:23 +0100
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v2 0/5] target/arm/kvm: Adjust virtual time
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 16 Dec 2019 16:18:23 +0000
From: Marc Zyngier <maz@kernel.org>
In-Reply-To: <CAFEAcA9FprSotg11rS0fM94QiciysZ6kgKhyU4eQfZg7YYaL5Q@mail.gmail.com>
References: <20191212173320.11610-1-drjones@redhat.com>
 <CAFEAcA9FprSotg11rS0fM94QiciysZ6kgKhyU4eQfZg7YYaL5Q@mail.gmail.com>
Message-ID: <4cb9bcfd47dff57c9ae6bb92bae87589@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: peter.maydell@linaro.org, drjones@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 guoheyi@huawei.com, bijan.mottahedeh@oracle.com, msys.mizuma@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org);
 SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 213.251.177.50
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, bijan.mottahedeh@oracle.com,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Heyi Guo <guoheyi@huawei.com>, msys.mizuma@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fcR+6S8jaB0O

On 2019-12-16 15:33, Peter Maydell wrote:
> On Thu, 12 Dec 2019 at 17:33, Andrew Jones <drjones@redhat.com> 
> wrote:
>
>> Userspace that wants to set KVM_REG_ARM_TIMER_CNT should beware that
>> the KVM register ID is not correct.  This cannot be fixed because 
>> it's
>> UAPI and if the UAPI headers are used then it can't be a problem.
>> However, if a userspace attempts to create the ID themselves from 
>> the
>> register's specification, then they will get KVM_REG_ARM_TIMER_CVAL
>> instead, as the _CNT and _CVAL definitions have their register
>> parameters swapped.
>
> So, to be clear, you mean that:
>
> (1) the kernel headers say:
>
> /* EL0 Virtual Timer Registers */
> #define KVM_REG_ARM_TIMER_CTL           ARM64_SYS_REG(3, 3, 14, 3, 1)
> #define KVM_REG_ARM_TIMER_CNT           ARM64_SYS_REG(3, 3, 14, 3, 2)
> #define KVM_REG_ARM_TIMER_CVAL          ARM64_SYS_REG(3, 3, 14, 0, 2)
>
> (2) some of the RHSes of these are wrong
>
> (3) but the kernel internally is using the same 'wrong' value, so
> userspace also needs to use that value, ie trust the #defined name
> rather than manufacturing one ?
>
> That's awkward. I think it would be worth at least having a kernel
> patch to add a comment clearly documenting this bug.
>
> (This error seems to only be in the 64-bit ABI, not 32-bit.)

Yeah, this is pretty bad. I wonder how we managed not to notice
this for so long... :-(.

Andrew, could you please write a patch documenting this (both in
the UAPI headers and in the documentation)?

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
