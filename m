Received: by 10.28.71.155 with SMTP id m27csp68845wmi;
        Thu, 22 Mar 2018 01:25:07 -0700 (PDT)
X-Google-Smtp-Source: AG47ELv5bQLmDqqTUEY8Z+9vnYw/z94kZiq4+gdzuhxeUVp/3hjbl1UYxvbUeckD0I/5aj5dWJ+c
X-Received: by 10.237.44.164 with SMTP id g33mr35524964qtd.285.1521707107366;
        Thu, 22 Mar 2018 01:25:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521707107; cv=none;
        d=google.com; s=arc-20160816;
        b=X8fhxuxk/WR2TLrEEHJQxCLDcLhz45Zdj1weHkqNrskdbOggUFLicnQ+U/0U/7I7Qt
         J6Sl6cUYnjG4ofzWMSOxQvAMQ9pogKO/azDHubo8O8YOiHWm4jwX/TGIhQfQkCuQP2Nd
         uWpilGXVYvnx7GCKxx6jfcRrHLQSvnIbRtxRXL9B03FEMTgoa5uHiJbUZ7Dan/AwJy+o
         oV88Z6dHZSSe9v9vpZ3VQDqLaVyz5QechawZTiTaVDDzBebuZHL5C0Nbcg4ElWW6/q2b
         UkGMysp2mHMJyz4c3WrPSt8K6cmTR8XGUnTjPWji1m8RVvehWTaO2BeXuWe+6wk1UfIN
         QuBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=4V2DKEZqUprrYK8YQpP++mm0hwHGjYmEsU9sG05SaQ8=;
        b=cOM0UgfFpihPNsUpVc8CryMQTtRjr4xLoQxJNA3J25VsZsTnVRBqsRkJJ/m6DlNLyW
         DMeX2K3xnrdiHDIaVkaiPfPXpUIxPKJ6uCQrXFpchUni9ICsDO4PnTWeFWkpfL4C5zo7
         Ta8OOIK6NiqE9gDx1/OMGQieI9tZX9T2Zz8+O6ZnwQ1g8ghZfpXv8anJzLX5tkmV1fHH
         sZdmsxmvlXPCnqzQqLQJ2ASUeHwNwWflLVlsBV0I1HzMc/kko1bxArV0XKd1qTceJyMr
         2EuD/Q+61Fh11y/9JWpzWCrsNK3F7ivyQSbaP7OOlBlBTSseu/C2296nBAuTCYbpPDCJ
         0X2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MN68sFyX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l207si7221589qke.277.2018.03.22.01.25.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 01:25:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MN68sFyX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyvX0-0003Ik-LN
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 04:25:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvVj-0002eW-RD
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 04:23:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvVh-0002ow-0I
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 04:23:47 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34687)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvVg-0002og-Rs; Thu, 22 Mar 2018 04:23:44 -0400
Received: by mail-qk0-x243.google.com with SMTP id z184so8331073qkc.1;
	Thu, 22 Mar 2018 01:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4V2DKEZqUprrYK8YQpP++mm0hwHGjYmEsU9sG05SaQ8=;
	b=MN68sFyXXacWKuRh7CXxxwJdPfkWfjwYd6Cmfn8oBLKwtZ34902QoO4yx/O/FWzAUN
	qn9v9TRgy43+KcJ8wl3ChM1658Jt/RJvIG7hSv+SVY1Fmrz+Hsyg7OORNJzxUwVTCh0C
	mdHgx2LDRz8ZdwYGRElnmjr0aH+ygy8S8wA+T6f2rMR546owMpc+55DBcosc6kYY7OsO
	yZYd2sG0MJgiTYvjAjNR359b/CIa+WOy7L7bdWAsS5DqpE9CaNKtv0NTEequHvYqiYJ0
	1lu22iAADHnTZIHdur+ixrW/73fi8DWce5VlNhPvbLvC++qR2d/HnIjMGDaDD8BTccR6
	stfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=4V2DKEZqUprrYK8YQpP++mm0hwHGjYmEsU9sG05SaQ8=;
	b=K0u8LPqtW7BLyObJCTkFJfUNgu25QeMLzhJISIUbAW0jD75bQ294Pay0Zsctv8EV28
	95K1WVep4VRcpl6c0YroMGhaBAkz3wAK9iEhU0xds5ttXbo7e0t00mc4PzY2bYJYDvvs
	lRxuXmlJGJkP4gBd5PImzT+xZEiasJshlvBCAOgZh7LH4HIdoY7ZSGCz0Y+5skbc8tN9
	H4koPKhHr9kJu547ykYMChx/6c/o3VmkUGfS7iw0KuL2+WIPxXSK4vatUQTxaBcBbLuL
	PohZj1gD8GXt7NECtBThyNvV6btTzzTsvZ3KN0AaYKFR3RDYFdegMkVtBGqmvDAyRFla
	s34A==
X-Gm-Message-State: AElRT7GWjbjjyJCpsWlx3NJZgssHtD4rHiyp5FxHjKbl00vMhew6OXqH
	5DVZv7L3xsovi0HKcUNrQ18=
X-Received: by 10.55.102.19 with SMTP id a19mr33937142qkc.75.1521707024350;
	Thu, 22 Mar 2018 01:23:44 -0700 (PDT)
Received: from [10.66.0.177] (host157.181-15-149.telecom.net.ar.
	[181.15.149.157]) by smtp.gmail.com with ESMTPSA id
	y41sm4380846qty.90.2018.03.22.01.23.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Mar 2018 01:23:43 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180320134114.30418-1-peter.maydell@linaro.org>
	<20180320134114.30418-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <a1381141-9f62-7305-aa8c-424d190c446f@amsat.org>
Date: Thu, 22 Mar 2018 05:23:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180320134114.30418-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH for-2.12 3/4] target/arm: Set
 FSR for BKPT, BRK when raising exception
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IBkakuPJ6p0C

On 03/20/2018 10:41 AM, Peter Maydell wrote:
> Now that we have a helper function specifically for the BRK and
> BKPT instructions, we can set the exception.fsr there rather
> than in arm_cpu_do_interrupt_aarch32(). This allows us to
> use our new arm_debug_exception_fsr() helper.
> 
> In particular this fixes a bug where we were hardcoding the
> short-form IFSR value, which is wrong if the target exception
> level has LPAE enabled.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1756927
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/helper.c    | 1 -
>  target/arm/op_helper.c | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 09893e3f72..dcb8476d9e 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7910,7 +7910,6 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
>          offset = 0;
>          break;
>      case EXCP_BKPT:
> -        env->exception.fsr = 2;
>          /* Fall through to prefetch abort.  */
>      case EXCP_PREFETCH_ABORT:
>          A32_BANKED_CURRENT_REG_SET(env, ifsr, env->exception.fsr);
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 75efff9edf..8e1e521193 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -488,6 +488,8 @@ void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
>   */
>  void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
>  {
> +    /* FSR will only be used if the debug target EL is AArch32. */
> +    env->exception.fsr = arm_debug_exception_fsr(env);
>      raise_exception(env, EXCP_BKPT, syndrome, arm_debug_target_el(env));
>  }
>  
> 
