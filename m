Received: by 10.25.0.198 with SMTP id 189csp140923lfa;
        Fri, 5 May 2017 05:05:54 -0700 (PDT)
X-Received: by 10.200.52.27 with SMTP id u27mr46768414qtb.67.1493985954029;
        Fri, 05 May 2017 05:05:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q20si4372621qka.137.2017.05.05.05.05.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 May 2017 05:05:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46692 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6bzb-0001YW-9Z
	for alex.bennee@linaro.org; Fri, 05 May 2017 08:05:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d6bz8-0001Gh-Gd
	for qemu-arm@nongnu.org; Fri, 05 May 2017 08:05:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d6bz5-0000EH-Al
	for qemu-arm@nongnu.org; Fri, 05 May 2017 08:05:22 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:35680)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d6bz5-0000E7-4s; Fri, 05 May 2017 08:05:19 -0400
Received: by mail-qk0-x244.google.com with SMTP id k74so500654qke.2;
	Fri, 05 May 2017 05:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=gQEGFoUUPe0dB6oxVeHoK8IU+XTI3shiXqkcb5HICQg=;
	b=Ky9MRi5Zjn1CTYJmqLXZuYogjbH1ahbBxYHlRiGlgnICRcZ1QHu7MLS/RV1UNvxUUC
	xMHLOM/0iD8YC/hMufWyYbhrkgOFT3EzWMIBkYHapv6djHF9EvOnuP4CiuR0UV66jcIX
	oy8LAoktm7tTvaX++t1zu0/pc//cadRWHMLHuVKsIiVnn6m/NecOOk4TTgQjXAC6GWuv
	OEpOhgXSgYVWZtuR0sH6sfC3KTsiBPoQBgW8ggQERV7OxTYq5WbZCeltnd9h5S/7MYUu
	QyQYlT+T5ZbkKYoysoTaOoxF3ENJYTpOi6oxhVizU7NzjJRXxiZcFit69xY7zWsIUNS+
	RixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=gQEGFoUUPe0dB6oxVeHoK8IU+XTI3shiXqkcb5HICQg=;
	b=jBjFkLcXute/iBFhkqT6Ye1s8bQkuN7wN7M42aEDj/Xh2caTUNGcrEGPNgA4+SR6LM
	+kajhfzLag2ui8fZVbC7b91ZHP2J5a18LXW/IDs8LFgsMk5EWKk6/vzRf581ctqkNVlA
	hjrZtwIfCV6eRlqmQWyh5wx4956t8qTjRy2rFqMcIjU74M39QldV1H/yzjQH3nnNTDWq
	mSAj6gYKkVuy0JnqyeNRrgbuFOvmG8/imLNLpolY7wSqQqyvCJi2LRAD5mnfj8RrQq/K
	tITP+rc0kFvfXCG+XpbJKAl75o5f+fjVrYHZ8OD9fuL3FS6xIUEIlexnLyY2jXidE/fp
	+Isg==
X-Gm-Message-State: AN3rC/4JmokF5Agii8forkPkaBe++FlO537sbvqP7JUZTVh38yCnRPDI
	0y0kdg4ZBIYDMQ==
X-Received: by 10.55.100.200 with SMTP id y191mr12503517qkb.87.1493985918267; 
	Fri, 05 May 2017 05:05:18 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	b23sm3795204qkb.31.2017.05.05.05.05.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 May 2017 05:05:17 -0700 (PDT)
To: Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1434721636-25357-1-git-send-email-peter.maydell@linaro.org>
	<1434721636-25357-8-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <57d182c1-291b-458a-d03c-f920ad8f0f14@amsat.org>
Date: Fri, 5 May 2017 09:05:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1434721636-25357-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL 07/12] target-arm: Add support
 for Cortex-R5
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hW1q8+s2AfIK

Hi Peter,

On 06/16/2015 09:36 PM, Peter Crosthwaite wrote:
> Introduce a CPU model for the Cortex R5 processor. ARMv7 with MPU,
> and both thumb and ARM div instructions.
>
> Also implement dummy ATCM and BTCM. These CPs are defined for R5 but
> don't have a lot of meaning in QEMU yet. Raz them so the guest can
> proceed if they are read. The TCM registers will return a size of 0,
> indicating no TCM.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Message-id: efe213163e6800578494aba864ac30329de4d396.1434501320.git.peter.crosthwaite@xilinx.com
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/cpu.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index eb10f59..b3d07ac 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -856,6 +856,43 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
>      cc->cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
>  }
>
> +static const ARMCPRegInfo cortexr5_cp_reginfo[] = {
> +    /* Dummy the TCM region regs for the moment */
> +    { .name = "ATCM", .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 0,
> +      .access = PL1_RW, .type = ARM_CP_CONST },
> +    { .name = "BTCM", .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 1,
> +      .access = PL1_RW, .type = ARM_CP_CONST },
> +    REGINFO_SENTINEL
> +};
> +
> +static void cortex_r5_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    set_feature(&cpu->env, ARM_FEATURE_V7);
> +    set_feature(&cpu->env, ARM_FEATURE_THUMB_DIV);
> +    set_feature(&cpu->env, ARM_FEATURE_ARM_DIV);
> +    set_feature(&cpu->env, ARM_FEATURE_V7MP);
> +    set_feature(&cpu->env, ARM_FEATURE_MPU);
> +    cpu->midr = 0x411fc153; /* r1p3 */

I'm unable to find the revision r1p3 of the Cortex-R5 Technical 
Reference Manual. Checking on developer.arm.com the last public revision 
is r1p2. Any clue?

Regards,

Phil.

> +    cpu->id_pfr0 = 0x0131;
> +    cpu->id_pfr1 = 0x001;
> +    cpu->id_dfr0 = 0x010400;
> +    cpu->id_afr0 = 0x0;
> +    cpu->id_mmfr0 = 0x0210030;
> +    cpu->id_mmfr1 = 0x00000000;
> +    cpu->id_mmfr2 = 0x01200000;
> +    cpu->id_mmfr3 = 0x0211;
> +    cpu->id_isar0 = 0x2101111;
> +    cpu->id_isar1 = 0x13112111;
> +    cpu->id_isar2 = 0x21232141;
> +    cpu->id_isar3 = 0x01112131;
> +    cpu->id_isar4 = 0x0010142;
> +    cpu->id_isar5 = 0x0;
> +    cpu->mp_is_up = true;
> +    define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
> +}
> +
>  static const ARMCPRegInfo cortexa8_cp_reginfo[] = {
>      { .name = "L2LOCKDOWN", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 0,
>        .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> @@ -1249,6 +1286,7 @@ static const ARMCPUInfo arm_cpus[] = {
>                               .class_init = arm_v7m_class_init },
>      { .name = "cortex-m4",   .initfn = cortex_m4_initfn,
>                               .class_init = arm_v7m_class_init },
> +    { .name = "cortex-r5",   .initfn = cortex_r5_initfn },
>      { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
>      { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
>      { .name = "cortex-a15",  .initfn = cortex_a15_initfn },
>
