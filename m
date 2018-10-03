Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6048543wrt;
        Wed, 3 Oct 2018 02:02:30 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62IQMYDKZ/n1vKBOn878PaviBBrL2QsxGMHw9SENKp3tFUVZB3QKif44lqqs67kolXiVSFO
X-Received: by 2002:ac8:65c9:: with SMTP id t9-v6mr384044qto.260.1538557350727;
        Wed, 03 Oct 2018 02:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538557350; cv=none;
        d=google.com; s=arc-20160816;
        b=AO09/41KwSlwFBaNbVubQ9X+RbfQIxo9WSFiJBN0lmdZwf6wwEIlV1flAd1HadYtMr
         Komz46FDhcSqv2BX8D8LwJdtm4cThIvPgdBwUd8YMJ7nvcPnz2a7dHN1LyG71MpAEFNV
         syGUOmg0ELlK7FDg+AL0eqWj2U6+ABOzQDTnKpYtxFs7pcD5iRSORtFtzf+qBClA9v2J
         Ml+hQKIYhBRt1FnYZBpeC54zz2o4mw6KTRtvx4tk6qHGObE7gtkMhmqKqRtYFsMgg1ez
         YXxGcOaJAy2XXDahcdwUreBHqW3sg/YNNayy38ub1/O+9cKDC/dWrb/j1LDVX1S0RYNJ
         ZT3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=lUWqC3w8U+6HRxft+jUBtNQWfDSPjhGzDzstpRiqv2U=;
        b=XBQIr/04yM+bkj4Hy0KIEioAGqWz1lBXPmPuAZ1taZPt+UkdJ+gTkqXiipgiCef8O7
         Caj83/nbJEJm2dUW1L27aOOZMhH41Y1xoMK1iua+85dOtGV9fUKQD5yONeAKwJp4caKR
         WUrPkuTyY/WpZ1vwTjg/HYWPM6ojcXMXzpGqt3JIWuuG/MG/yhzdEp5hjhlKsqMzNXWE
         gNoIjMqcxASt4bbZOQMaeOzZ+OvYgZUOZRNByW9UoY4Jp1R2u2Fwn2BodJyy6rPWlK6i
         HHdDp9hObtyCeG7Zes6pAPUyALSsZZ0B71fnt70vD4EZINtbWvo1W6i8/KPm3iSZGukG
         7aVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u32-v6si469795qtb.176.2018.10.03.02.02.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 02:02:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47510 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7d38-0004JA-8m
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 05:02:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7d2z-0004CX-W0
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 05:02:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7d2v-0005V5-7p
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 05:02:21 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36712)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g7d2u-0005Um-Uu
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 05:02:17 -0400
Received: by mail-wm1-f67.google.com with SMTP id a8-v6so810258wmf.1
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 02:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lUWqC3w8U+6HRxft+jUBtNQWfDSPjhGzDzstpRiqv2U=;
	b=W6/4zUDwMc3tIO9C+tIxs+SE8l5nUqknJLivfjI2nHMKvx+Y5nEJ2/wkmY9L6WKURS
	lbLIGs6V4O13OLlmILPXthqDpsLrbMHJsc8lTlpeORknpX9YXdZtvsvfsx+omQDfqQ+R
	s5KFanAStDEdYVV/LCXuntCEMVzlAjH5nl6tRf9ups/spaSEy95tA6GWjfA+xC+B1GPM
	j68SYlUk1Quj8Xw/QYuJU2LMBxbFvhr4lLmus3BWb+pMbn/0I7Wgk3SDK796zJP2fwS3
	umoiISoWOKGukFSMD5u57584Nfiz91NO2arFhOcX6jk7lvcNhqMBWBq7fo9FqcIdC+1P
	5DQA==
X-Gm-Message-State: ABuFfojMtVYbvbmln17/1YzGjO4gN4yFukQqL/H1QIBBHCvLhRLnSZO+
	ML0GaVAxPcQdmuWf/mswP+wyIA==
X-Received: by 2002:a1c:8085:: with SMTP id
	b127-v6mr753280wmd.146.1538557335868; 
	Wed, 03 Oct 2018 02:02:15 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	l67-v6sm3074774wma.20.2018.10.03.02.02.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 02:02:15 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7b536462-0b6e-cb70-166c-a1108b15f73a@redhat.com>
Date: Wed, 3 Oct 2018 11:02:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 07/13] target/arm: Add v8M stack
 limit checks on NS function calls
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
X-TUID: 24JcxuOViGFP

On 02/10/2018 18:35, Peter Maydell wrote:
> Check the v8M stack limits when pushing the frame for a
> non-secure function call via BLXNS.
> 
> In order to be able to generate the exception we need to
> promote raise_exception() from being local to op_helper.c
> so we can call it from helper.c.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/arm/internals.h | 9 +++++++++
>  target/arm/helper.c    | 4 ++++
>  target/arm/op_helper.c | 4 ++--
>  3 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 966a8131623..aa124a06a9d 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -94,6 +94,15 @@ FIELD(V7M_EXCRET, RES1, 7, 25) /* including the must-be-1 prefix */
>  #define M_FAKE_FSR_NSC_EXEC 0xf /* NS executing in S&NSC memory */
>  #define M_FAKE_FSR_SFAULT 0xe /* SecureFault INVTRAN, INVEP or AUVIOL */
>  
> +/**
> + * raise_exception: Raise the specified exception.
> + * Raise a guest exception with the specified value, syndrome register
> + * and target exception level. This should be called from helper functions,
> + * and never returns because we will longjump back up to the CPU main loop.
> + */
> +void QEMU_NORETURN raise_exception(CPUARMState *env, uint32_t excp,
> +                                   uint32_t syndrome, uint32_t target_el);
> +
>  /*
>   * For AArch64, map a given EL to an index in the banked_spsr array.
>   * Note that this mapping and the AArch32 mapping defined in bank_number()
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index a10dff01a90..074f7616272 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6710,6 +6710,10 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
>                        "BLXNS with misaligned SP is UNPREDICTABLE\n");
>      }
>  
> +    if (sp < v7m_sp_limit(env)) {
> +        raise_exception(env, EXCP_STKOF, 0, 1);
> +    }
> +
>      saved_psr = env->v7m.exception;
>      if (env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK) {
>          saved_psr |= XPSR_SFPA;
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 38f885b290f..de0d3984ea4 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -28,8 +28,8 @@
>  #define SIGNBIT (uint32_t)0x80000000
>  #define SIGNBIT64 ((uint64_t)1 << 63)
>  
> -static void raise_exception(CPUARMState *env, uint32_t excp,
> -                            uint32_t syndrome, uint32_t target_el)
> +void raise_exception(CPUARMState *env, uint32_t excp,
> +                     uint32_t syndrome, uint32_t target_el)
>  {
>      CPUState *cs = CPU(arm_env_get_cpu(env));
>  
> 
