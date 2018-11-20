Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp960497wrt;
        Tue, 20 Nov 2018 11:34:33 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UtFRdfAObPrWjbXF/UjEXGzvdj2vhosa3f5m65jiyLG5os3xX5yxdluZMT4DT1QiaM7Wvk
X-Received: by 2002:a25:9703:: with SMTP id d3-v6mr3210448ybo.306.1542742473593;
        Tue, 20 Nov 2018 11:34:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542742473; cv=none;
        d=google.com; s=arc-20160816;
        b=TJrAlpLXrzmKAxRqUY3kyPkEjIYNAyRpm8qMwuqYghy9C59rimhH48SgFn8rOKWjTz
         W/zaWl+gulGe1+Dr/dX1MIVO0dtHaRG+GsaxYTQk76l4W1PGmNOjOstCQQ2QkL9JoI/3
         ljctb3ByIVs2RNz9MOSOun0W22L6vAuyEfgxEtMp7w7J8q6N+0+sVKwcyf+QmRKI8ERR
         DHE5gxG7t9p7sljJL8/hOeyPjyEYT8blYsDIBsqlXJsdD4ImlzdsTFP/gbpEzyDgUpG7
         ErZlihpkHSiQTeH7qgju70QFdV9ROYS5eEZb1Gh1EFGi9AZmljTTUwx0OgNE+TIQu0us
         4s2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=+UW26rhSVXAW/lwczbDg8WPvlLENyaBsNow5YWfk7yA=;
        b=ecWYKIpljynMivhKRbN0LqE+WwiJnjcsWnr5ieX21FvxeckSLTceaj34GWwpZXmdFB
         +R/UTa/Vbvr9hpviFC3bc3RXEPdTarwahB/RrIS1XAMWpUfYm8iXI+Iv3jNzkEbLqLPK
         uTa+3leFCIcFNrtywHqcMcZk7z38eLBwuEQA9CoArIXL/Kaljn+SPHlYBmE3SR8Ccuug
         xUYyNnfoAsp1PJcy7JbCMAP78EmnKixtTrBHAOSxj3i/9XArAADQaKxQlZyKqjI6D929
         mE6PGMrtVZcWDtTEoAtXqdIiGwIenJvQgZborJ3URb5dsN7Dorm7ShiFgaOWnfgpoG+f
         gEFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c201si7605937ywb.163.2018.11.20.11.34.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 11:34:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35545 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPBn6-0006Td-Vj
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 14:34:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gPBmi-0006Az-F6
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 14:34:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gPBfW-0002ZI-QF
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 14:26:46 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36203)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gPBfW-0002VD-HJ
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 14:26:42 -0500
Received: by mail-wm1-f67.google.com with SMTP id s11so3459225wmh.1
	for <qemu-arm@nongnu.org>; Tue, 20 Nov 2018 11:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+UW26rhSVXAW/lwczbDg8WPvlLENyaBsNow5YWfk7yA=;
	b=PQ6fnFhLbO52y6xvt2LHpawG6EkqhCsaxOotT0m53nCqM52t9HRjKl1juRR0K6gM0t
	cx4IRKgZRy21T3i9RSFMVZ3NtDfp0mixTGz56CERCET49+ZEiNlB9F72R6yGP16EjCkm
	lAEHCfnmQk6x3AUvsret7Kr4gAnc2Namj7YpO3vu5ZiuXXyPNcr8Tnf0/1vsJCvTQ+tT
	31yJN78L8GaeBLQLJhrpCgA0ZLUv7OpfNBfK7PGAotIKgma4mIgqyZzHLdkg4hLKmPEh
	jNQ7tgcelJPWA6M8KgLfnELo4euuFaanjpgEe4UzcajflBuLGCWLPrAGcGcfceNIpk60
	+23w==
X-Gm-Message-State: AGRZ1gJzZuLZ7VnQeKUHwWLlKHA7XqocIt+9ggBg+0LOYK1Xxxe/L2vx
	NeCCkHvBixa8GxSzDNVJH6vW13qitJw=
X-Received: by 2002:a1c:88c7:: with SMTP id k190mr3027498wmd.97.1542741995658; 
	Tue, 20 Nov 2018 11:26:35 -0800 (PST)
Received: from [192.168.1.36] (35.red-88-21-102.staticip.rima-tde.net.
	[88.21.102.35]) by smtp.gmail.com with ESMTPSA id
	z192-v6sm25385568wmc.37.2018.11.20.11.26.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 11:26:35 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
	Samuel Ortiz <sameo@linux.intel.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-4-sameo@linux.intel.com>
	<CAFEAcA98so9yyJN=qAhD=Kr6pi1xxfrxt28atqZ8ATVJYXTaMg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a145c571-b5d9-1ef4-de8b-fad7dc7855c7@redhat.com>
Date: Tue, 20 Nov 2018 20:26:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA98so9yyJN=qAhD=Kr6pi1xxfrxt28atqZ8ATVJYXTaMg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [PATCH 03/13] target: arm: Move all v7m helpers into
 their own file
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m78wsfMwHZjl

On 20/11/18 14:54, Peter Maydell wrote:
> On 13 November 2018 at 16:52, Samuel Ortiz <sameo@linux.intel.com> wrote:
>> In preparation for supporting TCG disablement on ARM, we move all TCG
>> related v7m helpers and APIs into their own file (m_helper.c for all
>> v*-m helpers).
>> arm_v7m_cpu_do_interrupt pulls a large number of static functions
>> out of helper.c into m_helper.c because it is TCG dependent.
>>
>> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Reviewed-by: Robert Bradford <robert.bradford@intel.com>
>> ---
>>   target/arm/internals.h   |   37 +
>>   target/arm/helper.c      | 2209 +++-----------------------------------
>>   target/arm/m_helper.c    | 1892 ++++++++++++++++++++++++++++++++
>>   target/arm/Makefile.objs |    2 +-
>>   4 files changed, 2086 insertions(+), 2054 deletions(-)
>>   create mode 100644 target/arm/m_helper.c
> 
>> +/* Function used to synchronize QEMU's AArch64 register set with AArch32
>> + * register set.  This is necessary when switching between AArch32 and AArch64
>> + * execution state.
>> + */
>> +void aarch64_sync_32_to_64(CPUARMState *env)
>>   {
>> -    uint32_t new_ss_msp, new_ss_psp;
>> +    int i;
>> +    uint32_t mode = env->uncached_cpsr & CPSR_M;
>>
>> -    if (env->v7m.secure == new_secstate) {
>> -        return;
>> +    /* We can blanket copy R[0:7] to X[0:7] */
>> +    for (i = 0; i < 8; i++) {
>> +        env->xregs[i] = env->regs[i];
>>       }
>>
>> -    /* All the banked state is accessed by looking at env->v7m.secure
>> -     * except for the stack pointer; rearrange the SP appropriately.
>> +    /* Unless we are in FIQ mode, x8-x12 come from the user registers r8-r12.
>> +     * Otherwise, they come from the banked user regs.
>>        */
>> -    new_ss_msp = env->v7m.other_ss_msp;
>> -    new_ss_psp = env->v7m.other_ss_psp;
>> -
>> -    if (v7m_using_psp(env)) {
>> -        env->v7m.other_ss_psp = env->regs[13];
>> -        env->v7m.other_ss_msp = env->v7m.other_sp;
>> -    } else {
>> -        env->v7m.other_ss_msp = env->regs[13];
>> -        env->v7m.other_ss_psp = env->v7m.other_sp;
>> -    }
>> -
>> -    env->v7m.secure = new_secstate;
>> -
>> -    if (v7m_using_psp(env)) {
>> -        env->regs[13] = new_ss_psp;
>> -        env->v7m.other_sp = new_ss_msp;
>> +    if (mode == ARM_CPU_MODE_FIQ) {
>> +        for (i = 8; i < 13; i++) {
>> +            env->xregs[i] = env->usr_regs[i - 8];
>> +        }
>>       } else {
>> -        env->regs[13] = new_ss_msp;
>> -        env->v7m.other_sp = new_ss_psp;
>> +        for (i = 8; i < 13; i++) {
>> +            env->xregs[i] = env->regs[i];
>> +        }
>>       }
>> -}
>>
>> -void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
>> -{
>> -    /* Handle v7M BXNS:
>> -     *  - if the return value is a magic value, do exception return (like BX)
>> -     *  - otherwise bit 0 of the return value is the target security state
>> +    /* Registers x13-x23 are the various mode SP and FP registers. Registers
>> +     * r13 and r14 are only copied if we are in that mode, otherwise we copy
>> +     * from the mode banked register.
>>        */
>> -    uint32_t min_magic;
>> -
>> -    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
>> -        /* Covers FNC_RETURN and EXC_RETURN magic */
>> -        min_magic = FNC_RETURN_MIN_MAGIC;
>> +    if (mode == ARM_CPU_MODE_USR || mode == ARM_CPU_MODE_SYS) {
>> +        env->xregs[13] = env->regs[13];
>> +        env->xregs[14] = env->regs[14];
>>       } else {
>> -        /* EXC_RETURN magic only */
>> -        min_magic = EXC_RETURN_MIN_MAGIC;
>> +        env->xregs[13] = env->banked_r13[bank_number(ARM_CPU_MODE_USR)];
>> +        /* HYP is an exception in that it is copied from r14 */
>> +        if (mode == ARM_CPU_MODE_HYP) {
>> +            env->xregs[14] = env->regs[14];
>> +        } else {
>> +            env->xregs[14] = env->banked_r14[bank_number(ARM_CPU_MODE_USR)];
>> +        }
>>       }
> 
> This part of the patch is a mess to read. I suspect this is a
> combination of (a) your git not being configured to use a better
> diff algorithm than the default (try "algorithm = histogram"
> in the [diff] section of your .gitconfig), and it doing an effective
> revert of 593cfa2b637b92d37 by accident.

I did the review offline, applying the series then looking at each 
commit with gitk, this is why I did not notice this.

> It's also an absolutely enormous patch, even for a "just
> moving code" patch, which makes it hard to review even
> with diff --color-moved. Maybe it would be better in two
> pieces ("helper routines for various insns" and "exception
> handling functions" seems like a workable split).

Good idea.

Regards,

Phil.
