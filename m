Received: by 10.25.208.211 with SMTP id h202csp443970lfg;
        Sat, 27 Feb 2016 14:22:51 -0800 (PST)
X-Received: by 10.194.123.35 with SMTP id lx3mr7562074wjb.132.1456611771420;
        Sat, 27 Feb 2016 14:22:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2si23609137wjr.171.2016.02.27.14.22.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Feb 2016 14:22:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56559 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZnGB-0002gY-KL
	for alex.bennee@linaro.org; Sat, 27 Feb 2016 17:22:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aZnG8-0002gB-HF
	for qemu-arm@nongnu.org; Sat, 27 Feb 2016 17:22:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aZnG7-0000en-Fs
	for qemu-arm@nongnu.org; Sat, 27 Feb 2016 17:22:44 -0500
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:38213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aZnG7-0000eg-5o; Sat, 27 Feb 2016 17:22:43 -0500
Received: by mail-wm0-x231.google.com with SMTP id l68so15129904wml.1;
	Sat, 27 Feb 2016 14:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=tPSubrvdA9PXd0IKcOkPBao3oWsL56NfrAtYVAQ7JT8=;
	b=yTjNMWZH96qlhbXZ+NwmKs0MTPj1DKcqloGBTTy1+GnnO84GEaZVfT86mVP2/DY9YU
	9QwB7f52p0RUEGM5g8WdP4e/OvWgdG5Qx+DYPQgzTOrtk+zoWO/fPhl2qM8sIl3l91Ag
	lVCunBAoU8jp3OyHTfq6ZlOOsZ5r9gg7iNx023oiR5gO9sORHIWdSLw5qjQYE8K9HLy0
	vybnlqj41cXvi/9j0+oAn4EPpfIncAeaEfEt7tKrH4xfsebRifRgUDRaA138aOoeGN4W
	TJgQapXCYxGOvfbd8VBEpHvFVSHU9PcdiFNQ+o/31FIWAw28IfFapAPQFzeZJlCsG67b
	TOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=tPSubrvdA9PXd0IKcOkPBao3oWsL56NfrAtYVAQ7JT8=;
	b=BtpMywVrXq/NSwAgPRoficCj/9F0THm+BpRnuNHm4XHpy2rB3tEz+bPsh2dLCH45S9
	liNRIzSkvHL8PvGHIhuRICbcT9/FR4R9WM64HFAgzr82XP+cWgS4I2ky/BpXD7TrIC/c
	yRC49+/fj8b2UTgN8ekleo9igwb+GY1Wa+gmOTQKcyPkqF1h/gv2IlzKJIgeoE+sQE1M
	cUCcXHCpENKJUNdEZFwVvExv1NYkR+N559ZdUG64g2DNC6gt9nTXYTWz2iErfasU1oGY
	Pkii+Y0bpCgfP5DxWh6XzmEUYjNAA41wSnCewSfY0eQ7+jaNg4m5uqfnWZdUdJDylT++
	yxFg==
X-Gm-Message-State: AD7BkJLNwBSRbASg9CZatZ0AWkXQTe4WLub+fIwZzhkNOM8JG/XQ+q1mBmahPhLJo9zYadH3F79jzQdukFDmeA==
MIME-Version: 1.0
X-Received: by 10.194.76.161 with SMTP id l1mr7710856wjw.108.1456611762543;
	Sat, 27 Feb 2016 14:22:42 -0800 (PST)
Received: by 10.28.31.12 with HTTP; Sat, 27 Feb 2016 14:22:42 -0800 (PST)
In-Reply-To: <CAFEAcA8OuW=nPJGxEMEFZAos+vpRKRfwBvtH=x3JWT9Gj8J+MQ@mail.gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<cc12cc9e952dc74183cf875c1ae44446067f3236.1453100525.git.crosthwaite.peter@gmail.com>
	<CAFEAcA9QCbp7WQUqpn+OQAeD+TYe5mLv9FZq02b2oov9hLG1bw@mail.gmail.com>
	<CAFEAcA8OuW=nPJGxEMEFZAos+vpRKRfwBvtH=x3JWT9Gj8J+MQ@mail.gmail.com>
Date: Sat, 27 Feb 2016 14:22:42 -0800
Message-ID: <CAPokK=qmxv1Xkzw6EQcjPLcE4AX4-yfy=xsYh9Lkfb00_wJu+g@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::231
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
X-TUID: 5As5kyi1ksLm

On Tue, Jan 19, 2016 at 9:35 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 19 January 2016 at 17:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 18 January 2016 at 07:12, Peter Crosthwaite
>> <crosthwaitepeter@gmail.com> wrote:
>>> Don't set CPSR.E for BE32 linux-user mode. As linux-user mode models
>>> BE32, using normal BE (and system mode will not), a special case is
>>> needed for user-mode where if sctlr.b is set, the CPU identifies as BE.
>>>
>>> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>>> ---
>>>
>>>  linux-user/main.c |  2 --
>>>  target-arm/cpu.h  | 12 +++++++++++-
>>>  2 files changed, 11 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/linux-user/main.c b/linux-user/main.c
>>> index d481458..60375fb 100644
>>> --- a/linux-user/main.c
>>> +++ b/linux-user/main.c
>>> @@ -4496,8 +4496,6 @@ int main(int argc, char **argv, char **envp)
>>>              env->uncached_cpsr |= CPSR_E;
>>>          } else {
>>>              env->cp15.sctlr_el[1] |= SCTLR_B;
>>> -            /* We model BE32 as regular BE, so set CPSR_E */
>>> -            env->uncached_cpsr |= CPSR_E;
>>
>> ...this is undoing what we just did in the previous patch and
>> which I reviewed as being the wrong thing there...
>>
>>>          }
>>>  #endif
>>>      }
>>> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
>>> index 3edd56b..96b1e99 100644
>>> --- a/target-arm/cpu.h
>>> +++ b/target-arm/cpu.h
>>> @@ -1812,7 +1812,17 @@ static bool arm_cpu_is_big_endian(CPUARMState *env)
>>>
>>>      /* In 32bit endianness is determined by looking at CPSR's E bit */
>>>      if (!is_a64(env)) {
>>> -        return (env->uncached_cpsr & CPSR_E) ? 1 : 0;
>>> +        return
>>> +#ifdef CONFIG_USER_ONLY
>>> +            /* In user mode, BE32 data accesses are just modelled as
>>> +             * regular BE access. In system mode, BE32 is modelled as
>>> +             * little endian, with the appropriate address translations on
>>> +             * non-word accesses. So sctlr.b only affects overall
>>> +             * endianness in user mode
>>> +             */
>>> +            arm_sctlr_b(env) ||
>>> +#endif
>>> +                ((env->uncached_cpsr & CPSR_E) ? 1 : 0);
>>>      }
>>
>> This doesn't seem quite right -- for system emulation we currently
>> pick MO_BE or MO_LE based on the TB flag which is set according
>> to (arm_cpu_is_big_endian(env). So if we ignore SCTLR.B in
>> system mode then we'll still try to do LE accesses.
>
> Ah, no, looking at the next patch this is correct, it's just the
> comment is a touch confusing. I suggest
>
>  /* In system mode, BE32 is modelled in line with the architecture
>   * (as word-invariant big-endianness), where loads and stores are done
>   * little endian but from addresses which are adjusted by XORing
>   * with the appropriate constant. So the endianness to use for the
>   * raw data access is not affected by SCTLR.B.
>   * In user mode, however, we model BE32 as byte-invariant big-endianness
>   * (because user-only code cannot tell the difference), and so we
>   * need to use a data access endianness that depends on SCTLR.B.
>   */
>

Comment updated.

Regards,
Peter

> thanks
> -- PMM
