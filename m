Received: by 10.25.208.211 with SMTP id h202csp2701971lfg;
        Thu, 3 Mar 2016 05:38:43 -0800 (PST)
X-Received: by 10.140.20.183 with SMTP id 52mr3024114qgj.38.1457012323283;
        Thu, 03 Mar 2016 05:38:43 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c191si10465706qka.29.2016.03.03.05.38.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 05:38:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abTSk-0003r3-PS
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 08:38:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cov@codeaurora.org>) id 1abTSK-0003Wf-Ay
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 08:38:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cov@codeaurora.org>) id 1abTSJ-00046I-3u
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 08:38:16 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:33662)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cov@codeaurora.org>)
	id 1abTSE-00045e-BY; Thu, 03 Mar 2016 08:38:10 -0500
Received: from smtp.codeaurora.org (localhost [127.0.0.1])
	by smtp.codeaurora.org (Postfix) with ESMTP id DE0F560DA8;
	Thu,  3 Mar 2016 13:38:08 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id CBCFC60D78; Thu,  3 Mar 2016 13:38:08 +0000 (UTC)
Received: from [10.228.68.87] (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: cov@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 8CB3A6024C;
	Thu,  3 Mar 2016 13:38:07 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <1457007078-31387-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA_+dZYr=m3ZYOR+qfwFsXn3QuLyMxgrcAR2_FfX8RFTrg@mail.gmail.com>
From: Christopher Covington <cov@codeaurora.org>
Message-ID: <56D83E3E.1070007@codeaurora.org>
Date: Thu, 3 Mar 2016 08:38:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:43.0) Gecko/20100101
	Thunderbird/43.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_+dZYr=m3ZYOR+qfwFsXn3QuLyMxgrcAR2_FfX8RFTrg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 198.145.29.96
Cc: Andrew Jones <drjones@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-arm <qemu-arm@nongnu.org>, Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] linux-user: arm: Remove
 ARM_cpsr and similar #defines
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: r1rMMlC+1IkH

On 03/03/2016 07:18 AM, Peter Maydell wrote:
> Typoed qemu-devel email address again, sorry. I must figure out a
> way to automate "cc the usual suspects"...
> 
> thanks
> -- PMM
> 
> On 3 March 2016 at 12:11, Peter Maydell <peter.maydell@linaro.org> wrote:
>> The #defines of ARM_cpsr and friends in linux-user/arm/target-syscall.h
>> can clash with versions in the system headers if building on an
>> ARM or AArch64 build (though this seems to be dependent on the version
>> of the system headers). The QEMU defines are not very useful (it's
>> not clear that they're intended for use with the target_pt_regs struct
>> rather than (say) the CPUARMState structure) and we only use them in one
>> function in elfload.c anyway. So just remove the #defines and directly
>> access regs->uregs[].
>>
>> Reported-by: Christopher Covington <cov@codeaurora.org>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> Christopher, can you check that this resolves your compile issues, please?

It does. Thanks Peter!

Tested-by: Christopher Covington <cov@codeaurora.org>

>> NB that I have not touched the similar code in bsd-user/elfload.c because
>> that's clearly dead code, since there's no bsd-user/arm support anyway.
>>
>>  linux-user/arm/target_syscall.h | 20 +-------------------
>>  linux-user/elfload.c            | 19 ++++++++++---------
>>  2 files changed, 11 insertions(+), 28 deletions(-)
>>
>> diff --git a/linux-user/arm/target_syscall.h b/linux-user/arm/target_syscall.h
>> index ea863db..11077b7 100644
>> --- a/linux-user/arm/target_syscall.h
>> +++ b/linux-user/arm/target_syscall.h
>> @@ -4,29 +4,11 @@
>>  /* this struct defines the way the registers are stored on the
>>     stack during a system call. */
>>
>> +/* uregs[0..15] are r0 to r15; uregs[16] is CPSR; uregs[17] is ORIG_r0 */
>>  struct target_pt_regs {
>>      abi_long uregs[18];
>>  };
>>
>> -#define ARM_cpsr       uregs[16]
>> -#define ARM_pc         uregs[15]
>> -#define ARM_lr         uregs[14]
>> -#define ARM_sp         uregs[13]
>> -#define ARM_ip         uregs[12]
>> -#define ARM_fp         uregs[11]
>> -#define ARM_r10                uregs[10]
>> -#define ARM_r9         uregs[9]
>> -#define ARM_r8         uregs[8]
>> -#define ARM_r7         uregs[7]
>> -#define ARM_r6         uregs[6]
>> -#define ARM_r5         uregs[5]
>> -#define ARM_r4         uregs[4]
>> -#define ARM_r3         uregs[3]
>> -#define ARM_r2         uregs[2]
>> -#define ARM_r1         uregs[1]
>> -#define ARM_r0         uregs[0]
>> -#define ARM_ORIG_r0    uregs[17]
>> -
>>  #define ARM_SYSCALL_BASE       0x900000
>>  #define ARM_THUMB_SYSCALL      0
>>
>> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
>> index 19dc7f5..ad014da 100644
>> --- a/linux-user/elfload.c
>> +++ b/linux-user/elfload.c
>> @@ -273,19 +273,20 @@ static inline void init_thread(struct target_pt_regs *regs,
>>      abi_long stack = infop->start_stack;
>>      memset(regs, 0, sizeof(*regs));
>>
>> -    regs->ARM_cpsr = 0x10;
>> -    if (infop->entry & 1)
>> -        regs->ARM_cpsr |= CPSR_T;
>> -    regs->ARM_pc = infop->entry & 0xfffffffe;
>> -    regs->ARM_sp = infop->start_stack;
>> +    regs->uregs[16] = ARM_CPU_MODE_USR;
>> +    if (infop->entry & 1) {
>> +        regs->uregs[16] |= CPSR_T;
>> +    }
>> +    regs->uregs[15] = infop->entry & 0xfffffffe;
>> +    regs->uregs[13] = infop->start_stack;
>>      /* FIXME - what to for failure of get_user()? */
>> -    get_user_ual(regs->ARM_r2, stack + 8); /* envp */
>> -    get_user_ual(regs->ARM_r1, stack + 4); /* envp */
>> +    get_user_ual(regs->uregs[2], stack + 8); /* envp */
>> +    get_user_ual(regs->uregs[1], stack + 4); /* envp */
>>      /* XXX: it seems that r0 is zeroed after ! */
>> -    regs->ARM_r0 = 0;
>> +    regs->uregs[0] = 0;
>>      /* For uClinux PIC binaries.  */
>>      /* XXX: Linux does this only on ARM with no MMU (do we care ?) */
>> -    regs->ARM_r10 = infop->start_data;
>> +    regs->uregs[10] = infop->start_data;
>>  }
>>
>>  #define ELF_NREG    18
>> --
>> 1.9.1
>>
>>


-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
