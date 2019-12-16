Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4843056lff;
        Mon, 16 Dec 2019 09:27:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqxh48/DkEKQhT3ZdIaJqIUr1k9g1bm81SpNS9fXLIQyOkk7JRPen8QjidnnxWVf22wBHEc9
X-Received: by 2002:ac8:145:: with SMTP id f5mr354911qtg.194.1576517270980;
        Mon, 16 Dec 2019 09:27:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576517270; cv=none;
        d=google.com; s=arc-20160816;
        b=akMsQCUsLxwWeGvMG1A1DsJDoa0lpJ+55B9zLSorXuGzVvm6tFczZfKdvXjA5wUk3X
         qOWig6+v7BEPaVJciNscLGeKrqZKdh7uQb7/qtCjxGgRkMg6DrHrZHUcrvK7xjIWO0Kn
         Rrq2bht+svDSeyAauSwe8Mqae4LZzTtfqjI9qN4gN29hreeXW7eljOOAlRXoKus5K+B9
         xa4OKeeP986NawIRFngmVJL4l3UGW1ofyc72m77kKmgRReLoL7dzLxBSOBlTPnvH5FQ2
         qGMnTR9zHHAvQJ1TaXoVuGDowbPrX4YcKqEPP8imflmLCA6PMOjdTtoenJU2tItrrwoO
         evRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:message-id
         :references:in-reply-to:from:date:content-transfer-encoding
         :mime-version:subject:to;
        bh=WTxWliyGmgQUUH6Jy3lCepAIvQ1oqM6eWHf9iLz3IME=;
        b=xzyj+O9D8o4NjHo1ft6rh3LacCf9T4hdF/r0GVtvmsrG/yzo3krncMrM1v9yMlIzF6
         u/hGx8+fzVJ22NERQ8pFeoP/dhkcxjYsx9wD66RMOxqpKZckQhqIJENd6/AxZqZHlyCj
         z/4AViIFv43J3LUV50AHDoziotJnycen8Z1HNfOtXSmWuR741x3pwwij2AHeJu/2wpVl
         g7U9x+psthJRcONO9PzAUmfRPqefVW0Bxji/XywKwBRN9L0hqmCzHZe0Vpj6IJup61ON
         NjoIlDfB4wEvOp5OWnzFfBM3e57lmVC/qgWnw/lE7O3dTTe+dOo/r0wtoH8hpbgvuXSk
         Irwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x188si9980072qkb.28.2019.12.16.09.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 09:27:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:57538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igu9u-0004pp-D1
	for alex.bennee@linaro.org; Mon, 16 Dec 2019 12:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48977)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1igto9-0007qZ-Lw
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 12:05:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maz@kernel.org>) id 1igto8-0008Nc-98
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 12:05:21 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:47927)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <maz@kernel.org>)
 id 1igto5-0008KZ-RH; Mon, 16 Dec 2019 12:05:17 -0500
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
 (envelope-from <maz@kernel.org>)
 id 1igtnu-0004Nj-E9; Mon, 16 Dec 2019 18:05:06 +0100
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [RFC PATCH v2 0/5] target/arm/kvm: Adjust virtual time
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 16 Dec 2019 17:05:06 +0000
From: Marc Zyngier <maz@kernel.org>
In-Reply-To: <20191216165920.qsx7ufviir74tbkl@kamzik.brq.redhat.com>
References: <20191212173320.11610-1-drjones@redhat.com>
 <CAFEAcA9FprSotg11rS0fM94QiciysZ6kgKhyU4eQfZg7YYaL5Q@mail.gmail.com>
 <4cb9bcfd47dff57c9ae6bb92bae87589@www.loen.fr>
 <20191216165920.qsx7ufviir74tbkl@kamzik.brq.redhat.com>
Message-ID: <d1d394292a294f32c237d3ddbb0e96ad@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: drjones@redhat.com, peter.maydell@linaro.org,
 bijan.mottahedeh@oracle.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, guoheyi@huawei.com,
 msys.mizuma@gmail.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, bijan.mottahedeh@oracle.com,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Heyi Guo <guoheyi@huawei.com>, msys.mizuma@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f/hy9xJ/bQgA

On 2019-12-16 16:59, Andrew Jones wrote:
> On Mon, Dec 16, 2019 at 04:18:23PM +0000, Marc Zyngier wrote:
>> On 2019-12-16 15:33, Peter Maydell wrote:
>> > On Thu, 12 Dec 2019 at 17:33, Andrew Jones <drjones@redhat.com> 
>> wrote:
>> >
>> > > Userspace that wants to set KVM_REG_ARM_TIMER_CNT should beware 
>> that
>> > > the KVM register ID is not correct.  This cannot be fixed 
>> because
>> > > it's
>> > > UAPI and if the UAPI headers are used then it can't be a 
>> problem.
>> > > However, if a userspace attempts to create the ID themselves 
>> from
>> > > the
>> > > register's specification, then they will get 
>> KVM_REG_ARM_TIMER_CVAL
>> > > instead, as the _CNT and _CVAL definitions have their register
>> > > parameters swapped.
>> >
>> > So, to be clear, you mean that:
>> >
>> > (1) the kernel headers say:
>> >
>> > /* EL0 Virtual Timer Registers */
>> > #define KVM_REG_ARM_TIMER_CTL           ARM64_SYS_REG(3, 3, 14, 3, 
>> 1)
>> > #define KVM_REG_ARM_TIMER_CNT           ARM64_SYS_REG(3, 3, 14, 3, 
>> 2)
>> > #define KVM_REG_ARM_TIMER_CVAL          ARM64_SYS_REG(3, 3, 14, 0, 
>> 2)
>> >
>> > (2) some of the RHSes of these are wrong
>> >
>> > (3) but the kernel internally is using the same 'wrong' value, so
>> > userspace also needs to use that value, ie trust the #defined name
>> > rather than manufacturing one ?
>> >
>> > That's awkward. I think it would be worth at least having a kernel
>> > patch to add a comment clearly documenting this bug.
>> >
>> > (This error seems to only be in the 64-bit ABI, not 32-bit.)
>>
>> Yeah, this is pretty bad. I wonder how we managed not to notice
>> this for so long... :-(.
>>
>> Andrew, could you please write a patch documenting this (both in
>> the UAPI headers and in the documentation)?
>>
>
> Will do. I'll try to get to it this week.

Thanks a lot.

         M.
-- 
Jazz is not dead. It just smells funny...
