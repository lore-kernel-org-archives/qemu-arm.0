Received: by 10.25.208.137 with SMTP id h131csp330916lfg;
        Fri, 13 May 2016 13:40:31 -0700 (PDT)
X-Received: by 10.129.146.10 with SMTP id j10mr9639214ywg.39.1463172030911;
        Fri, 13 May 2016 13:40:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o5si5515880ybg.35.2016.05.13.13.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 May 2016 13:40:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b1Jss-0003af-Fb
	for alex.bennee@linaro.org; Fri, 13 May 2016 16:40:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1b1Jsp-0003YQ-Bg
	for qemu-arm@nongnu.org; Fri, 13 May 2016 16:40:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1b1Jso-0006V2-7M
	for qemu-arm@nongnu.org; Fri, 13 May 2016 16:40:27 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:33858)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1b1Jso-0006Uy-3E; Fri, 13 May 2016 16:40:26 -0400
Received: by mail-oi0-x242.google.com with SMTP id d139so19464867oig.1;
	Fri, 13 May 2016 13:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=O4fOqm2L5xjMkP0pP0/XA+gm5uIYyTfdpckyC6S/lfA=;
	b=SHOSm8Pwugp507aFoh0wK/HlJx0UJZ8cBgIiCEsLdpVsprApuAXs0M6K0YJ81N8U8e
	NQScXy6JsMDHmq+WwmgOl2k0FlA6LE7vPyTMLSKvn6tm0hcDtTdcamQhu4KxT1yQKGds
	qT5WIHC5O7DFoMhfCmrr01h1ffw1osxbifYQWydwAVmD7qk0qHUgyjU+FWcexf+1t5IA
	+tU/WKhXuaQuB5Vgti9cfgKx/oPS2GV/ex0y2srknMTHofWAGTc64OgFDOkHKPkV5CCW
	6YnsmptlPCaAo4X28xlCA6HxCySY+0MQAUUEYSnip3ReUmeKsb2japPtzsmwMoylRo1x
	zldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=O4fOqm2L5xjMkP0pP0/XA+gm5uIYyTfdpckyC6S/lfA=;
	b=AmD8s39zrFYZysrhg0Nx/zsu4AwIB87asKCpVhbKNTEXqKsfOTtBULPC+pxweniQqI
	0kIBHCmqqrCznFsNEn98w+rm1wFdlnUc5pvGuE6Ipm2tqpulGTKBxcF3QGcfZIjsAQ39
	lqwgD/q3cYI3Iu0NktAmiqMl/lpdSeNLSplGOnpLxSKuGQZxkIoLB9uuEG6oDMULzdpP
	/uRdLh8mErIKpjRG49MKCFjSiwkbaIeRtybj0Yplr3Y3mImgLxaXJTn2Di0toIe7oSW8
	BFPkQS3Ec2QHV7P29aVGFAB8QZIAYwB69ixeoRNu9W0bHp2dTFwTNAIri+D/RV8PCCJf
	800A==
X-Gm-Message-State: AOPr4FU/kJftYcsWF4trufg9Z/1acLgHm4dUh+rui/wxp9rkOa5b/i88o6phkWDB06+nB5Q2E6DjJhWZn61M0w==
X-Received: by 10.202.98.133 with SMTP id w127mr8820539oib.136.1463172001433; 
	Fri, 13 May 2016 13:40:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.142.193 with HTTP; Fri, 13 May 2016 13:39:32 -0700 (PDT)
In-Reply-To: <CAFEAcA_JKxAZZG+D4NLm-nu6FdFD57GgGVpQsxoEWuMUJJsDQw@mail.gmail.com>
References: <cover.1462557987.git.alistair.francis@xilinx.com>
	<77db20f0411ab4e6c62cc307e390bfd415101282.1462557987.git.alistair.francis@xilinx.com>
	<CAFEAcA_JKxAZZG+D4NLm-nu6FdFD57GgGVpQsxoEWuMUJJsDQw@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 13 May 2016 13:39:32 -0700
X-Google-Sender-Auth: QLZtz82snvcQocXlTGXqJuqEyeU
Message-ID: <CAKmqyKO0p2w4iLettMEk_-Vhk0eFneNGsvS12j5SzDSPr3FDEw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 1/2] target-arm: Add the
 HSTR_EL2 register
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JcYgt5rHrvxU

On Fri, May 13, 2016 at 10:46 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 6 May 2016 at 19:11, Alistair Francis <alistair.francis@xilinx.com> wrote:
>> Add the Hypervisor System Trap Register for EL2.
>>
>> This register is used early in the Linux boot and without it the kernel
>> aborts with a "Synchronous Abort" error.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>
>>  target-arm/helper.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/target-arm/helper.c b/target-arm/helper.c
>> index 09638b2..65e8ff1 100644
>> --- a/target-arm/helper.c
>> +++ b/target-arm/helper.c
>> @@ -3470,6 +3470,9 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
>>        .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
>>        .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
>>        .type = ARM_CP_CONST, .resetvalue = 0 },
>> +    { .name = "HSTR_EL2", .state = ARM_CP_STATE_AA64,
>> +      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 3,
>> +      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
>>      REGINFO_SENTINEL
>>  };
>>
>> @@ -3703,6 +3706,10 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>>        .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
>>        .access = PL2_RW,
>>        .fieldoffset = offsetof(CPUARMState, cp15.hpfar_el2) },
>> +    { .name = "HSTR_EL2", .state = ARM_CP_STATE_AA64,
>> +      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 3,
>> +      .access = PL2_RW,
>> +      .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore, },
>>      REGINFO_SENTINEL
>>  };
>
> Can we have the 32-bit version of the register too, please? (I think
> it should be possible to do this with a STATE_BOTH stanza).

Yep, I think I added it correctly.

>
> Can we have the el2_cp_reginfo implemented to be a reads-as-written
> to a hstr_el2 field in the env->cp15 struct? That way we won't have
> to come back to the regdef struct as and when we actually implement
> the trap bits to do something...

Yep, I have added that as well. Sending V2 now.

Thanks,

Alistair

>
> thanks
> -- PMM
>
