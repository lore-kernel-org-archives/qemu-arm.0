Received: by 10.25.159.19 with SMTP id i19csp2628992lfe;
        Tue, 19 Jan 2016 09:36:12 -0800 (PST)
X-Received: by 10.140.141.138 with SMTP id 132mr41889093qhn.74.1453224971780;
        Tue, 19 Jan 2016 09:36:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u68si26763124qkl.12.2016.01.19.09.36.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 09:36:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLaCR-0003df-9q
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 12:36:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLaCP-0003d5-OH
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 12:36:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLaCO-0000A5-Kp
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 12:36:09 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34022)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLaCN-00006y-CB
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 12:36:08 -0500
Received: by mail-vk0-x236.google.com with SMTP id e185so13137396vkb.1
	for <qemu-arm@nongnu.org>; Tue, 19 Jan 2016 09:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=WCr0ynD8YIZ4oKIT/PlJPSEs1uAtkhzQfgbY4YdR7Zw=;
	b=iFTBc6OSkC88tXzTKqasC8XAQIWDL1HsDlW1d8xZVE2SNGlMbq1/5kuBOUjsUl3Q0a
	Vi11zEXIxIhjvYsehwWRuaT5ecqK9qDYdKd48k/l984gQgmNDtmptn8/hSJXUHEXtRRP
	oWs2lu7xJgfn7wYhkohCI9CfxdNCwIyfvIePc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WCr0ynD8YIZ4oKIT/PlJPSEs1uAtkhzQfgbY4YdR7Zw=;
	b=GMsx6VOGMV2QpgvnujGWu9rJIDMDSKF3wcyqmJ71TBHXZ8x9Op4APp4U/1Z7PQPhKC
	AGSC3bD+bpcBraybtVUMPKlRXU2kQ07uwvvwk5X/JQ9ji1+oZTifXCyxOOF/K/wFdAXq
	Qrsefi/Fg6T8+wSe6a7Cb/ZeAEsGgMAdZ0bBRpiQcs5DBwNFmdT3L0WBuj2ZIZ8bScph
	97I98M1FmK1PI4w7rFOC3WqzdY+dgVbo5/t0qdzkI4phzMTQbKDDLvM3EeVJnlZzaEgj
	dm2DyxtRcd6is7llHRZMj7m3l3PINoFHbs1jHHo3nk0ySLd+RV1buIglYhn3rEW29awn
	DenA==
X-Gm-Message-State: ALoCoQm5MnbjORy4hozywrcgIvTC5TtAjVmQz4E3nElVn03ZycrSmNYBNdPee6v/g8ckemnSJgbBzFWwo+K3WhxXywytTylvOY+IknvRNhBUYmerFAMyYGM=
X-Received: by 10.31.0.136 with SMTP id 130mr19245447vka.139.1453224964545;
	Tue, 19 Jan 2016 09:36:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 09:35:45 -0800 (PST)
In-Reply-To: <CAFEAcA9QCbp7WQUqpn+OQAeD+TYe5mLv9FZq02b2oov9hLG1bw@mail.gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<cc12cc9e952dc74183cf875c1ae44446067f3236.1453100525.git.crosthwaite.peter@gmail.com>
	<CAFEAcA9QCbp7WQUqpn+OQAeD+TYe5mLv9FZq02b2oov9hLG1bw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 17:35:45 +0000
Message-ID: <CAFEAcA8OuW=nPJGxEMEFZAos+vpRKRfwBvtH=x3JWT9Gj8J+MQ@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 13/17] arm: linux-user: don't set CPSR.E
	in BE32 mode
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7inAo9c7/Ls8

On 19 January 2016 at 17:26, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 January 2016 at 07:12, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> Don't set CPSR.E for BE32 linux-user mode. As linux-user mode models
>> BE32, using normal BE (and system mode will not), a special case is
>> needed for user-mode where if sctlr.b is set, the CPU identifies as BE.
>>
>> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>> ---
>>
>>  linux-user/main.c |  2 --
>>  target-arm/cpu.h  | 12 +++++++++++-
>>  2 files changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/linux-user/main.c b/linux-user/main.c
>> index d481458..60375fb 100644
>> --- a/linux-user/main.c
>> +++ b/linux-user/main.c
>> @@ -4496,8 +4496,6 @@ int main(int argc, char **argv, char **envp)
>>              env->uncached_cpsr |= CPSR_E;
>>          } else {
>>              env->cp15.sctlr_el[1] |= SCTLR_B;
>> -            /* We model BE32 as regular BE, so set CPSR_E */
>> -            env->uncached_cpsr |= CPSR_E;
>
> ...this is undoing what we just did in the previous patch and
> which I reviewed as being the wrong thing there...
>
>>          }
>>  #endif
>>      }
>> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
>> index 3edd56b..96b1e99 100644
>> --- a/target-arm/cpu.h
>> +++ b/target-arm/cpu.h
>> @@ -1812,7 +1812,17 @@ static bool arm_cpu_is_big_endian(CPUARMState *env)
>>
>>      /* In 32bit endianness is determined by looking at CPSR's E bit */
>>      if (!is_a64(env)) {
>> -        return (env->uncached_cpsr & CPSR_E) ? 1 : 0;
>> +        return
>> +#ifdef CONFIG_USER_ONLY
>> +            /* In user mode, BE32 data accesses are just modelled as
>> +             * regular BE access. In system mode, BE32 is modelled as
>> +             * little endian, with the appropriate address translations on
>> +             * non-word accesses. So sctlr.b only affects overall
>> +             * endianness in user mode
>> +             */
>> +            arm_sctlr_b(env) ||
>> +#endif
>> +                ((env->uncached_cpsr & CPSR_E) ? 1 : 0);
>>      }
>
> This doesn't seem quite right -- for system emulation we currently
> pick MO_BE or MO_LE based on the TB flag which is set according
> to (arm_cpu_is_big_endian(env). So if we ignore SCTLR.B in
> system mode then we'll still try to do LE accesses.

Ah, no, looking at the next patch this is correct, it's just the
comment is a touch confusing. I suggest

 /* In system mode, BE32 is modelled in line with the architecture
  * (as word-invariant big-endianness), where loads and stores are done
  * little endian but from addresses which are adjusted by XORing
  * with the appropriate constant. So the endianness to use for the
  * raw data access is not affected by SCTLR.B.
  * In user mode, however, we model BE32 as byte-invariant big-endianness
  * (because user-only code cannot tell the difference), and so we
  * need to use a data access endianness that depends on SCTLR.B.
  */

thanks
-- PMM
