Received: by 10.25.208.211 with SMTP id h202csp1259845lfg;
        Mon, 29 Feb 2016 11:25:00 -0800 (PST)
X-Received: by 10.140.92.111 with SMTP id a102mr21470610qge.92.1456773900001;
        Mon, 29 Feb 2016 11:25:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f132si27177418qkb.7.2016.02.29.11.24.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Feb 2016 11:24:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aaTRD-0002QA-7y
	for alex.bennee@linaro.org; Mon, 29 Feb 2016 14:24:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aaTR7-0002Na-2D
	for qemu-arm@nongnu.org; Mon, 29 Feb 2016 14:24:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aaTR3-0002xh-LZ
	for qemu-arm@nongnu.org; Mon, 29 Feb 2016 14:24:52 -0500
Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e]:33565)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aaTR3-0002xb-8u; Mon, 29 Feb 2016 14:24:49 -0500
Received: by mail-lf0-x22e.google.com with SMTP id v124so5334486lff.0;
	Mon, 29 Feb 2016 11:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=XC/CyQJrbiMdIRv4radZPTmVIS29rmHGNISjDraxw2c=;
	b=cLd7XFA+ZeLZRO9MXV/qu8Cru8voHi73wkvLfF+7NV4CD4MPNK8fUEiHrvvYULCn2D
	ZbqIL4j+/4OO6svkp6/lJw9T14pejCtFG6Aiq11Z68iF9DMh6ls2D4ELMTbhUh1jiWXh
	uhaNdJ0WiAyyvDd5JhmGZsiC7zvwu7952S28X2cJqXcIBDMjERejWN8vE/u0fgV7hnCc
	27LHILHnQuMd2JaDdWDiUzsVcn6MGjrif3/aEvcmmmEK4qazdz7GUfdF+0jofRZnmLeC
	/YxdKRy1bJPpEjhb9jirJlSb5O0vQ9zU43P7okJzxlEcnr4bMN6OTkXM/eKe02DZDVsN
	1psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=XC/CyQJrbiMdIRv4radZPTmVIS29rmHGNISjDraxw2c=;
	b=gi0mgg0FU1EBInhiH/UvXO+z6No1XKew/tnxWRVcHgA6woH6sBrhJCF+RaHKHf0uBt
	EMFwgceey4B6061UrA+2pzoQEoBUFqWVdV4ZFZyd27hUiFlgk5lN3CvvgPktBp5gTa7q
	sAZVRFww9nsW1dfhTtLgtYt7mfgDv8MGuBlWPBY16Vnj1CELyaqmGpUFFz9gdks0Emwq
	8+w+5KJ2GhVlxKSfyo2KP4LfVrDkTtCnSBXFefl0TwBscSj2tjrUFVk1PJW4NkKLSplV
	HMLhUk8qxMkl+vggW8a0SJNK8SxWX3udtJyiLusFfi4cXFDydB8FGPf1Wz6Gt7K3U+74
	nMGA==
X-Gm-Message-State: AD7BkJLv6MR/qB+hfUfuqg0r1V61qMHlSHRo2h2bCNQuYdFSiu+sd6ZJgF1c19RsOEtgUg==
X-Received: by 10.25.87.149 with SMTP id l143mr6156182lfb.145.1456773887990;
	Mon, 29 Feb 2016 11:24:47 -0800 (PST)
Received: from [192.168.0.65] (broadband-46-188-121-154.2com.net.
	[46.188.121.154])
	by smtp.gmail.com with ESMTPSA id h8sm4233679lfg.10.2016.02.29.11.24.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Feb 2016 11:24:46 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1456764438-30015-1-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56D49AFE.5060002@gmail.com>
Date: Mon, 29 Feb 2016 22:24:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1456764438-30015-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::22e
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH] target-arm: Correct handling of writes to
 CPSR mode bits from gdb in usermode
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
X-TUID: 3QucjyU/demF

On 29.02.2016 19:47, Peter Maydell wrote:
> In helper.c the expression
>    (env->uncached_cpsr & CPSR_M) != CPSR_USER
> is always true; the right hand side was supposed to be ARM_CPU_MODE_USR
> (an error in commit cb01d391).
>
> Since the incorrect expression was always true, this just meant that
> commit cb01d391 had no effect.
>
> However simply changing the RHS here would reveal a logic error: if
> the mode is USR we wish to completely ignore the attempt to set the
> mode bits, which means that we must clear the CPSR_M bits from mask
> to avoid the uncached_cpsr bits being updated at the end of the
> function.
>
> Move the condition into the correct place in the code, fix its RHS
> constant, and add a comment about the fact that we must be doing a
> gdbstub write if we're in user mode.
>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1550503
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>   target-arm/helper.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 18c8296..935f13b 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5490,9 +5490,16 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
>       env->daif |= val & CPSR_AIF & mask;
>   
>       if (write_type != CPSRWriteRaw &&
> -        (env->uncached_cpsr & CPSR_M) != CPSR_USER &&
>           ((env->uncached_cpsr ^ val) & mask & CPSR_M)) {
> -        if (bad_mode_switch(env, val & CPSR_M, write_type)) {
> +        if ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_USR) {
> +            /* Note that we can only get here in USR mode if this is a
> +             * gdb stub write; for this case we follow the architectural
> +             * behaviour for guest writes in USR mode of ignoring an attempt
> +             * to switch mode. (Those are caught by translate.c for writes
> +             * triggered by guest instructions.)
> +             */
> +            mask &= ~CPSR_M;
> +        } else if (bad_mode_switch(env, val & CPSR_M, write_type)) {
>               /* Attempt to switch to an invalid mode: this is UNPREDICTABLE in
>                * v7, and has defined behaviour in v8:
>                *  + leave CPSR.M untouched

