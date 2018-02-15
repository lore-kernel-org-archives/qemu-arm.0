Received: by 10.28.71.27 with SMTP id u27csp2964652wma;
        Thu, 15 Feb 2018 10:14:25 -0800 (PST)
X-Google-Smtp-Source: AH8x226cb/HUiwCt97U8PPlpTEYpZltNey3PZKbMrkvDSsdAwkq0BqcZZ/lIO3zqUxsagu+LtAIv
X-Received: by 10.129.93.139 with SMTP id r133mr2731232ywb.422.1518718465757;
        Thu, 15 Feb 2018 10:14:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518718465; cv=none;
        d=google.com; s=arc-20160816;
        b=l1uxjg5eeq+GQu8nGx7iE+YhwV0BQ6atuHLVFbaqLst0VHbVMYAxdFoFoDs1Mxjhwu
         f+wAhykMwRRkakxr6deb9iqHvuARXooQ/Fm8LM5sc6lSh/z3D8TXq6xzpK3E3xoQqJWN
         L2ZD+sfVidWl5Ta/vF/xIKIxLaQKrYKtorBfznQ+Jpf14qmTVE/f9H12yAEu/JXiISY/
         tPZBQoE2q5xcFGkyhUII6Y4rjs6ys8dPzCjXlyUts+jLfUcpTHbRjl535egIBS9Zjhpg
         IM7twT9MB+IMHl7YnAmzOsWxZKVNxdSd5xdCSZkXfRdgzx8duJloD9VEi1APXU4wkHVa
         fDmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=u645YhQFdSd5bOZdTdiUrJHucguacGmEas5zaJK9adI=;
        b=Sur7cgXS1/jSLy8exVDaPOhbTgkXUJhS+gqpb6GVRL7gD+xqFcO8Pepn6NVX5zo8RL
         TchTZpifLFD7oUgh88TuhwW0HrOBV64j/IKL1KWnieMNdD7/wGwM7vTbKnOMTEueJd2h
         A6c9KaQowBPyEMPA8ksipkNIK7e1mlrdcdArrFzBCFlivO215mOdUF14w36bYc+JLGbQ
         bwnZpavZ3D6QkUN8U3Cpwt2NMZW08nL7LeFA1FA5LKivMPSfHGutw1P4+yEvT6Sk6Q4z
         lXWDbaPEyRJerU22ZEsDvqcph6HQU0L4WPfnDRVqTqL1JCB66BXP34Bdomi0nzwcRt8A
         gTyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RP/aJuqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 193si1146108ybn.324.2018.02.15.10.14.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 10:14:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RP/aJuqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emO37-0007wQ-6g
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 13:14:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emO2w-0007tu-Jf
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 13:14:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emO2v-0000lz-Ei
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 13:14:14 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:41517)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emO2q-0000bz-PP; Thu, 15 Feb 2018 13:14:08 -0500
Received: by mail-qt0-x241.google.com with SMTP id a9so736828qtj.8;
	Thu, 15 Feb 2018 10:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=u645YhQFdSd5bOZdTdiUrJHucguacGmEas5zaJK9adI=;
	b=RP/aJuqI5MwGy7SqANOw548ASwLPfXrqahhxm7bWd7iV74+kC3uADf+zB24FRAWqHn
	4ERbRpx53+qnmL4NRQLAjnUnXnl3qwzivwbsY7JCeyD2asKBCIFis4tWeZQF77fmkBfQ
	AY5uwzSst4du4UzJz814zF6fG1//sGII6sRV5lGfufj/ut9JfZsYLn9c8uAXcA2BkUlM
	P25bPBSCRiLf/MwlmgVGtUg81njzGmnY3kJa9iw3fAkc5SeIadqxOOiImmAJUJL/K1hW
	UIStcaUsuT1xmabt4TaFNk0AMHFh6ESIGRm+gUx9Z2F6K9BAZ0ThIpOp9yg6MuAWmOTC
	Ei4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=u645YhQFdSd5bOZdTdiUrJHucguacGmEas5zaJK9adI=;
	b=rKS5SXJk2vb78t68iev0RrtbkigBwEVlmeudgPopvCmXIFX0kJH17hdP0ZriaynvVP
	dvqASIh2jO5fMiOaTuot4npaWKl6w+t6KHAzkCMLMO8MdQVRwzJN2wHTeaYtLS7HxZKP
	DdG9SzFPnVGTIFS6I+3gH5MckD+3fkH1m0KF84N2SFvJDu7uXfZJi7rx4zozJ43R/z6F
	F6vD2iOFzwzxJGmzgvkaM2vo9VQAzv6u/3FWynRC28crxykUdv8ubm5vGPOdigYOvjfS
	Yok1bDhBcUsjAePMIGsbFzQXRBoZ/KfiydTGiP2hCf6VKrK1MaKskSpAXfCuye/tLuMW
	L39g==
X-Gm-Message-State: APf1xPB8OUKYt70edGhg9zmyOYa6/wPfdal6Tl5szHGsgEpCQFHEnamk
	tP8Q2bWeGU/QWdKlcXEos+Q=
X-Received: by 10.200.63.230 with SMTP id v35mr5833343qtk.54.1518718448141;
	Thu, 15 Feb 2018 10:14:08 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	q203sm2518853qke.45.2018.02.15.10.14.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Feb 2018 10:14:07 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
References: <20180215175707.15491-1-peter.maydell@linaro.org>
	<20180215175707.15491-3-peter.maydell@linaro.org>
	<CAFEAcA_UWVgwEsTq2Tebn+yL5Ckd_7_S_wUvsKMDZfEHxr9stQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <04e252ac-0f7f-d045-2484-8793399333cb@amsat.org>
Date: Thu, 15 Feb 2018 15:14:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_UWVgwEsTq2Tebn+yL5Ckd_7_S_wUvsKMDZfEHxr9stQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] hw/arm/boot: Honour CPU's
 address space for image loads
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
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FyGoEsrIv/Ke

On 02/15/2018 03:06 PM, Peter Maydell wrote:
> On 15 February 2018 at 17:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Instead of loading kernels, device trees, and the like to
>> the system address space, use the CPU's address space. This
>> is important if we're trying to load the file to memory or
>> via an alias memory region that is provided by an SoC
>> object and thus not mapped into the system address space.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/arm/boot.c | 119 +++++++++++++++++++++++++++++++++++++---------------------
>>  1 file changed, 76 insertions(+), 43 deletions(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 9b174b982c..0eac655c98 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -35,6 +35,25 @@
>>  #define ARM64_TEXT_OFFSET_OFFSET    8
>>  #define ARM64_MAGIC_OFFSET          56
>>
>> +static AddressSpace *arm_boot_addressspace(ARMCPU *cpu,
>> +                                           const struct arm_boot_info *info)
>> +{
>> +    /* Return the address space to use for bootloader reads and writes.
>> +     * We prefer the secure address space if the CPU has it and we're
>> +     * going to boot the guest into it.
>> +     */
>> +    int asidx;
>> +    CPUState *cs = CPU(cpu);
>> +
>> +    if (arm_feature(&cpu->env, ARM_FEATURE_EL3) && info->secure_boot) {
>> +        asidx = ARMASIdx_S;
>> +    } else {
>> +        asidx = ARMASIdx_NS;
>> +    }
>> +
>> +    return cpu_get_address_space(cs, asidx);
>> +}
>> +
>>  typedef enum {
>>      FIXUP_NONE = 0,     /* do nothing */
>>      FIXUP_TERMINATOR,   /* end of insns */
>> @@ -124,7 +143,8 @@ static const ARMInsnFixup smpboot[] = {
>>  };
>>
>>  static void write_bootloader(const char *name, hwaddr addr,
>> -                             const ARMInsnFixup *insns, uint32_t *fixupcontext)
>> +                             const ARMInsnFixup *insns, uint32_t *fixupcontext,
>> +                             AddressSpace *as)
>>  {
>>      /* Fix up the specified bootloader fragment and write it into
>>       * guest memory using rom_add_blob_fixed(). fixupcontext is
>> @@ -163,7 +183,7 @@ static void write_bootloader(const char *name, hwaddr addr,
>>          code[i] = tswap32(insn);
>>      }
>>
>> -    rom_add_blob_fixed(name, code, len * sizeof(uint32_t), addr);
>> +    rom_add_blob_fixed_as(name, code, len * sizeof(uint32_t), addr, as);
>>
>>      g_free(code);
>>  }
>> @@ -172,6 +192,7 @@ static void default_write_secondary(ARMCPU *cpu,
>>                                      const struct arm_boot_info *info)
>>  {
>>      uint32_t fixupcontext[FIXUP_MAX];
>> +    AddressSpace *as = CPU(cpu)->as;
> 
> Oops. This should be
>     AddressSpace *as = arm_boot_addressspace(cpu, info);

I was stuck there wondering why this one were using the CPU AS :)

> 
>>      fixupcontext[FIXUP_GIC_CPU_IF] = info->gic_cpu_if_addr;
>>      fixupcontext[FIXUP_BOOTREG] = info->smp_bootreg_addr;
>> @@ -182,13 +203,14 @@ static void default_write_secondary(ARMCPU *cpu,
>>      }
>>
>>      write_bootloader("smpboot", info->smp_loader_start,
>> -                     smpboot, fixupcontext);
>> +                     smpboot, fixupcontext, as);
>>  }
>>
>>  void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
>>                                              const struct arm_boot_info *info,
>>                                              hwaddr mvbar_addr)
>>  {
>> +    AddressSpace *as = CPU(cpu)->as;
> 
> ...and so should this.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> thanks
> -- PMM
> 
