Received: by 10.25.44.15 with SMTP id s15csp2604247lfs;
        Thu, 27 Jul 2017 17:02:40 -0700 (PDT)
X-Received: by 10.200.41.150 with SMTP id 22mr3190967qts.7.1501200160814;
        Thu, 27 Jul 2017 17:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501200160; cv=none;
        d=google.com; s=arc-20160816;
        b=lCAuKZZZBdjHSIh/j1skEoVDg2QAjX/ZXOjSoN20yiie4K/AOE85WJMkSezSDC+z7g
         cAePEEmJYdsCjA/lpMH8I9MiURt+K0VT9DCiS6KHwA5hPulC9Py5zDn51ESYSV+ayTgH
         l4kfMD/0oqEulmMhbRpqHBycMj4g6yXW41fledObZlf/W7tVKRpoNO7uaRKHBqcfxGda
         0n5Ix1uzwLi2q++OkjP743GhHuZN5JWINvZNuEV24srdIjhyPQ5kk6Fsl/I/Knb6zp6W
         m9nnrht/tsXBOpD/gv4sQgR3gerxsVDyRC8WKm8bHS9wpfFpwAbmRkeVJPS5BYxA6PJf
         G5hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Pjn7jSiIuPYKdglfmQY3WWG0/3pYBM9pP7gvi9DPEVk=;
        b=RM9YFt8717tqw2Iho29+jLdPqtAnl7I1AmDaVinZHMnEekwVC1jjs5EE23KiCQ0O/2
         ZTRM0mahtrnqe0sZPATSRCsw0PzCVmkrYvi9QovA2AbrGNVzjRinHNX1oVNzqYajPoa1
         WA2o07xcqaolTQw3nmeJonjlwR8TVNwgdHM5pZ3DvMFatQj2pyctpM5tvSf+xoAyLQ10
         hjXomfEDLm7h3Tq9QXt4qMBPYkRpjpK72cqzB7q3KrGDJdTSV75+DluoddfqezmptZaY
         zXDRzMwzezRW0qFrnLCq42KT+prU0EiTloaQ1RTokHsdV4fQ1ylaJEEVFA3pWH1xcgk1
         Ku9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=F/yAFHe1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6si13629535qtd.174.2017.07.27.17.02.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 17:02:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=F/yAFHe1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45184 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dasjl-0003bx-TS
	for alex.bennee@linaro.org; Thu, 27 Jul 2017 20:02:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dasjY-0003Za-Cg
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 20:02:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dasjX-0004Wm-B2
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 20:02:24 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:37469)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dasjR-0004QT-2B; Thu, 27 Jul 2017 20:02:17 -0400
Received: by mail-qt0-x243.google.com with SMTP id d10so10173571qtb.4;
	Thu, 27 Jul 2017 17:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Pjn7jSiIuPYKdglfmQY3WWG0/3pYBM9pP7gvi9DPEVk=;
	b=F/yAFHe1dvNKBpjOUEbKDzUet3HxS6T/IF7Kcrps4Mk2iIz2FcSgHyHK24o8H89tKp
	wGG4CzsM8zjj0y2pzvKhqQeKxJIKLojae5bQYGjZK0WRzbbLNm3wwTaxdXGKT3ZwMa8D
	jCOsWHvVFlfsPVvH8LAs30Ooo1AN+roJjhaqydS99ng6lOb5gXNQhRulfpCSpmFAHn2T
	UVdJpYKzYftt/PFbvuME5Mp4WehRwNsPVXcUSgYz2tnET9RcflION+mtBaSFwdpb8aFZ
	gt+LbQXuV0Oy7BuGPh7dRFPIiPhfbxhlaDxEvgp6WXA5C/VNced0YAUV26ODfwoECtbQ
	06Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Pjn7jSiIuPYKdglfmQY3WWG0/3pYBM9pP7gvi9DPEVk=;
	b=Q5YFrmcz4VVWzwgMIrmMx3f7LAnaqRmWtt9btmL4gneEnZuNXgIciFnYr4Iru6LLb1
	bcxNWehJmk4kqIUCnrC0DZrXQD4+GkFqvjAwxO0fFKjE9kCVnXekIK6tR9H4JHtE3hpe
	RzEsn+SlysAh+a+GWxDbfCn+vROglowY7n/mswZDjLpZl31GQW96fUpNSwKeg1TzThNB
	pE7yzo1ptZ6temNf7pShaBsjbxDmBET17D3TUqcly2Agwvak/pbJjeOeRLNzVRWNij+n
	s+K0SrxAQBw3wLzPB+3bnkAA8c+4VM5FwQdMcHErkTdSB/YYdv2aUSTHyHhs0K9qAyEk
	gT5A==
X-Gm-Message-State: AIVw110K8BiaLvPU6/HUdbvBzRzOsjSxpWP1nY48UxqxxxpMWQa6VK0O
	S9Ch37J3NDDdlA==
X-Received: by 10.237.35.10 with SMTP id h10mr8497081qtc.148.1501200136420;
	Thu, 27 Jul 2017 17:02:16 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	x24sm15291450qtx.47.2017.07.27.17.02.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 17:02:15 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
	<1501153150-19984-5-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <241902a8-5942-9ae5-8ac8-41cf08da08ae@amsat.org>
Date: Thu, 27 Jul 2017 21:02:12 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501153150-19984-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [PATCH for-2.10 4/5] target/arm: Move PMSAv7 reset
 into arm_cpu_reset() so M profile MPUs get reset
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0hV+FBXF64VH

On 07/27/2017 07:59 AM, Peter Maydell wrote:
> When the PMSAv7 implementation was originally added it was for R profile
> CPUs only, and reset was handled using the cpreg .resetfn hooks.
> Unfortunately for M profile cores this doesn't work, because they do
> not register any cpregs. Move the reset handling into arm_cpu_reset(),
> where it will work for both R profile and M profile cores.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   target/arm/cpu.c    | 14 ++++++++++++++
>   target/arm/helper.c | 28 ++++++++++++----------------
>   2 files changed, 26 insertions(+), 16 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 96d1f84..05c038b 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -232,6 +232,20 @@ static void arm_cpu_reset(CPUState *s)
>   
>       env->vfp.xregs[ARM_VFP_FPEXC] = 0;
>   #endif
> +
> +    if (arm_feature(env, ARM_FEATURE_PMSA) &&
> +        arm_feature(env, ARM_FEATURE_V7)) {
> +        if (cpu->pmsav7_dregion > 0) {
> +            memset(env->pmsav7.drbar, 0,
> +                   sizeof(*env->pmsav7.drbar) * cpu->pmsav7_dregion);
> +            memset(env->pmsav7.drsr, 0,
> +                   sizeof(*env->pmsav7.drsr) * cpu->pmsav7_dregion);
> +            memset(env->pmsav7.dracr, 0,
> +                   sizeof(*env->pmsav7.dracr) * cpu->pmsav7_dregion);
> +        }
> +        env->pmsav7.rnr = 0;
> +    }
> +
>       set_flush_to_zero(1, &env->vfp.standard_fp_status);
>       set_flush_inputs_to_zero(1, &env->vfp.standard_fp_status);
>       set_default_nan_mode(1, &env->vfp.standard_fp_status);
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 63187de..a9247e9 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2404,18 +2404,6 @@ static void pmsav7_write(CPUARMState *env, const ARMCPRegInfo *ri,
>       *u32p = value;
>   }
>   
> -static void pmsav7_reset(CPUARMState *env, const ARMCPRegInfo *ri)
> -{
> -    ARMCPU *cpu = arm_env_get_cpu(env);
> -    uint32_t *u32p = *(uint32_t **)raw_ptr(env, ri);
> -
> -    if (!u32p) {
> -        return;
> -    }
> -
> -    memset(u32p, 0, sizeof(*u32p) * cpu->pmsav7_dregion);
> -}
> -
>   static void pmsav7_rgnr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                                 uint64_t value)
>   {
> @@ -2433,22 +2421,30 @@ static void pmsav7_rgnr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>   }
>   
>   static const ARMCPRegInfo pmsav7_cp_reginfo[] = {
> +    /* Reset for all these registers is handled in arm_cpu_reset(),
> +     * because the PMSAv7 is also used by M-profile CPUs, which do
> +     * not register cpregs but still need the state to be reset.
> +     */
>       { .name = "DRBAR", .cp = 15, .crn = 6, .opc1 = 0, .crm = 1, .opc2 = 0,
>         .access = PL1_RW, .type = ARM_CP_NO_RAW,
>         .fieldoffset = offsetof(CPUARMState, pmsav7.drbar),
> -      .readfn = pmsav7_read, .writefn = pmsav7_write, .resetfn = pmsav7_reset },
> +      .readfn = pmsav7_read, .writefn = pmsav7_write,
> +      .resetfn = arm_cp_reset_ignore },
>       { .name = "DRSR", .cp = 15, .crn = 6, .opc1 = 0, .crm = 1, .opc2 = 2,
>         .access = PL1_RW, .type = ARM_CP_NO_RAW,
>         .fieldoffset = offsetof(CPUARMState, pmsav7.drsr),
> -      .readfn = pmsav7_read, .writefn = pmsav7_write, .resetfn = pmsav7_reset },
> +      .readfn = pmsav7_read, .writefn = pmsav7_write,
> +      .resetfn = arm_cp_reset_ignore },
>       { .name = "DRACR", .cp = 15, .crn = 6, .opc1 = 0, .crm = 1, .opc2 = 4,
>         .access = PL1_RW, .type = ARM_CP_NO_RAW,
>         .fieldoffset = offsetof(CPUARMState, pmsav7.dracr),
> -      .readfn = pmsav7_read, .writefn = pmsav7_write, .resetfn = pmsav7_reset },
> +      .readfn = pmsav7_read, .writefn = pmsav7_write,
> +      .resetfn = arm_cp_reset_ignore },
>       { .name = "RGNR", .cp = 15, .crn = 6, .opc1 = 0, .crm = 2, .opc2 = 0,
>         .access = PL1_RW,
>         .fieldoffset = offsetof(CPUARMState, pmsav7.rnr),
> -      .writefn = pmsav7_rgnr_write },
> +      .writefn = pmsav7_rgnr_write,
> +      .resetfn = arm_cp_reset_ignore },
>       REGINFO_SENTINEL
>   };
>   
> 
