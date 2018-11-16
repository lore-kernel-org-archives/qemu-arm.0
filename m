Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp604192wrw;
        Fri, 16 Nov 2018 08:45:12 -0800 (PST)
X-Google-Smtp-Source: AJdET5dC/XEMXkgkoXL2j3HjPEEfwy1Cg0isAqlWA2dMX8c3DLopHXZVXbEj+vftSdxh5IBFx28a
X-Received: by 2002:a37:6710:: with SMTP id b16mr10745401qkc.42.1542386712392;
        Fri, 16 Nov 2018 08:45:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542386712; cv=none;
        d=google.com; s=arc-20160816;
        b=WTQI+wVKg/xw1dvP2I5Fb05gC62IimG9QDPj6uW6PGhUCyl+36kKOKruhxE3/XcLNO
         wYuX96yjYiM4ZGZ+UsLgmz/Izk/ar9ZF7RycFKcz5jCQnLhtSRoxzZSfjWKfVrwjz5W/
         pFu9euA/qg3w9R4Ca1wV8gm6qmai9xg7TndbVJJHCi5WRyUcBYjxFu3mMS8IKKHYkNbv
         gjG3kZI22e+Fh9oqH0/h7ZZopqGA7Jsx0kPfkK9EaHcr2Eo4LUN5Zb0VzwdMTyTtCBwE
         R21DTkitsNq4RH2JZ2YSx8Ze24qx6husapzAdAF/FN3UJDLka/bm7WWAM1zmL1iTO+G5
         M7Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=y57glKWS4dOlZWQkQdG8+r7AmOv8nzR3Eb9Z9X53xz0=;
        b=ay5y72cUZ58/z/eooLQ/XnAZwjZSWKIyBrhoIE5gfAxLbXh6hHZ1QlCzdF2OpDFm9n
         l8H0W745za39nkKIkIYUcw+8iXPLGMMq9yKYTRdrs3XC5H3DEuVrb4UEtgBVIANkWw4z
         Y8K5Qga6dJaKYyxqhNHEVv0sk3NZjy9jc9oEdB7Ufp7m8dtbi6ug+C1E2hj5Ix0FBgto
         T8vJDmK3uKBd3wDAKtPsEnIrbmm5EukWu4EWVsJTRp/huvhSG1i//Tolv0H4CVjDwyOl
         pIranDsmcIdvg7k86sRR1CV7Ag370VQVW3v6eGpVKNs5rRe/rgmUHE+dgn4xQRD3863O
         csbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N+3ySgSc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m190si5973496qkb.257.2018.11.16.08.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 08:45:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N+3ySgSc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45739 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNhF1-0003aO-RR
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 11:45:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNhEq-0003Xw-PR
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 11:45:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNhEq-0005yT-1X
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 11:45:00 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:39257)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gNhEp-0005y0-F0
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 11:44:59 -0500
Received: by mail-oi1-x242.google.com with SMTP id 192-v6so20147219oii.6
	for <qemu-arm@nongnu.org>; Fri, 16 Nov 2018 08:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y57glKWS4dOlZWQkQdG8+r7AmOv8nzR3Eb9Z9X53xz0=;
	b=N+3ySgScbRc2k6tT3fv8ZDXjknhX9a3Aw4cZq6EcCoaszVN5idq7RyF8+LFpwoKssf
	LGXm8VduhyEF+Gk9LxLmi3a9KaNsNVaeuqjuVgu6AyoQVAro1nbfGFT1zF+NFfKemhpw
	PwxoQLvXpPVNUrSXuwY+HGOamwZvYe8u0S/Sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y57glKWS4dOlZWQkQdG8+r7AmOv8nzR3Eb9Z9X53xz0=;
	b=UZb2tgxW5pBGaua1pbxh3uWzryVctMYUkIcXRcdcPm00e5LWlWka8AYhj15HoNBV79
	FL/YXAZzpdGgQjDyJii5V6UgZPzsgtZoR2xNViGrZD6NwSk604SVvuUOYeDHeGfpVGQL
	4SrzLLr02IFvSlJF0F/1ytFjJzMek1N4SK2aSStohvo5c0mdmDqz8K//v4J+ZwelmJs3
	ZCqUQASgC+ZC7LFQEppxa6P43etGfRUj0KqJJTA2q7nx3yAa0GRGCxfSzjqTo/Mbn0U7
	Pdpa0wixXtiYlxKuWWusdpf/rKi5LBOzIjRQU7S1D3Vg1T+ffJZ6eVZjLkS8nl/QjM6d
	WERg==
X-Gm-Message-State: AGRZ1gIi+b3tXSUYAgvJEqSX6P7ehJo6ldEKO76cW+vM092n2NumN0fc
	BTqWu9USZKRPa7B4TRrR/F+oaVseGHON5idr1sUxZA==
X-Received: by 2002:aca:fd12:: with SMTP id
	b18-v6mr1399503oii.337.1542386698763; 
	Fri, 16 Nov 2018 08:44:58 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Fri, 16 Nov 2018 08:44:38
	-0800 (PST)
In-Reply-To: <20181116160909.GD23658@quinoa.localdomain>
References: <20181105185046.2802-1-aaron@os.amperecomputing.com>
	<20181105185046.2802-4-aaron@os.amperecomputing.com>
	<CAFEAcA9va2QarkMFPWNMf43u_GRDoajM-=E0dwinVEgaqRgjHQ@mail.gmail.com>
	<20181116160909.GD23658@quinoa.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Nov 2018 16:44:38 +0000
Message-ID: <CAFEAcA-FMcrYXfD97G4ezSOpvWExA5s8X+gVzbV1ojYg9vq_gw@mail.gmail.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v7 03/12] target/arm: Swap PMU values
 before/after migrations
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZAw810UT1LOQ

On 16 November 2018 at 16:09, Aaron Lindsay
<aaron@os.amperecomputing.com> wrote:
> On Nov 16 14:53, Peter Maydell wrote:
>> On 5 November 2018 at 18:51, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>> > Because of the PMU's design, many register accesses have side effects
>> > which are inter-related, meaning that the normal method of saving CP
>> > registers can result in inconsistent state. These side-effects are
>> > largely handled in pmu_op_start/finish functions which can be called
>> > before and after the state is saved/restored. By doing this and adding
>> > raw read/write functions for the affected registers, we avoid
>> > migration-related inconsistencies.
>> >
>> > Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
>>
>> > --- a/target/arm/machine.c
>> > +++ b/target/arm/machine.c
>> > @@ -604,6 +604,8 @@ static int cpu_pre_save(void *opaque)
>> >  {
>> >      ARMCPU *cpu = opaque;
>> >
>> > +    pmu_op_start(&cpu->env);
>> > +
>> >      if (kvm_enabled()) {
>> >          if (!write_kvmstate_to_list(cpu)) {
>> >              /* This should never fail */
>> > @@ -625,6 +627,20 @@ static int cpu_pre_save(void *opaque)
>> >      return 0;
>> >  }
>> >
>> > +static int cpu_post_save(void *opaque)
>> > +{
>> > +    ARMCPU *cpu = opaque;
>> > +    pmu_op_finish(&cpu->env);
>> > +    return 0;
>> > +}
>> > +
>> > +static int cpu_pre_load(void *opaque)
>> > +{
>> > +    ARMCPU *cpu = opaque;
>> > +    pmu_op_start(&cpu->env);
>> > +    return 0;
>> > +}
>> > +
>> >  static int cpu_post_load(void *opaque, int version_id)
>> >  {
>> >      ARMCPU *cpu = opaque;
>> > @@ -672,6 +688,8 @@ static int cpu_post_load(void *opaque, int version_id)
>> >      hw_breakpoint_update_all(cpu);
>> >      hw_watchpoint_update_all(cpu);
>> >
>> > +    pmu_op_finish(&cpu->env);
>> > +
>> >      return 0;
>> >  }
>>
>> This will end up calling pmu_op_start() and pmu_op_finish()
>> even if the guest is running KVM and we're not using the
>> TCG code. Is that what you intended?
>
> The counters are still stored in their 'difference' format for KVM, so I
> think this still makes sense. Or is there something I'm missing about
> how this will interact with KVM? I'm much more familiar with TCG.

For KVM the counter values are stored in the kernel, until the
write_kvmstate_to_list() function (which is performed after your
pmu_op_start() call in cpu_pre_save()) writes them from the
kernel into the cpreg_vmstate array. Similarly on load they
go straight from the vmstate array into the kernel registers.
It's not clear to me what the pmu_op_start()/finish() calls
are intended to do in the KVM case, and they look at fields
in the env->cp15 struct which will not have valid values at
this point.

thanks
-- PMM
