Received: by 10.25.159.19 with SMTP id i19csp689664lfe;
        Fri, 12 Feb 2016 00:58:47 -0800 (PST)
X-Received: by 10.140.21.232 with SMTP id 95mr432575qgl.12.1455267527408;
        Fri, 12 Feb 2016 00:58:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w206si14657870qhc.124.2016.02.12.00.58.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 00:58:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aU9Yt-000134-0b
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 03:58:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aU9Yq-00012l-TK
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 03:58:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aU9Yn-000198-Nh
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 03:58:44 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35520)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aU9Yn-000190-Em; Fri, 12 Feb 2016 03:58:41 -0500
Received: by mail-lf0-x243.google.com with SMTP id j99so3820029lfi.2;
	Fri, 12 Feb 2016 00:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=lvzec6Elsqp3GGzocUNWkYyumW7oQSE/wYnU/XpKykc=;
	b=hF3OG98gv4kzzo9XybfM5bhqZWxcI+Fr/3inzcpluOO2BJMdc9fNDemlQ9HakILU/P
	RqhAdjdNls72AMSMY0c5MhW68MYJZTpXi9dBXUQxJWJ3UbX8WhGc3Fm5tRgXhUym/u6O
	ueNTj34h3EcGw0d5PIB4gEXeed8GVHasbnHWA5N+8RL+y4Aj/YrmLZVe4tGQyh34T93F
	YhLClNtfHjDqLw/ZMtcUMCy0wx6MCHF4M3GmvsHA0Tu+o3HbhkcTal+BElZMqCPEJ9OG
	NzYXv+QQvzIIy67L+Egg2P4XUos8M0H+BGhH2Z/d0HKUs8Cl8A0ZveQoDe7CzVeiVAtB
	jeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=lvzec6Elsqp3GGzocUNWkYyumW7oQSE/wYnU/XpKykc=;
	b=AW8riCZZp0B1Tf49JvM81pV6qgDZmqVG/5wLdVWFrInBIr8iivy94M9tdQNeSN3GZS
	RewODKUSGMZkhBYCQAhTN89CfNKsZpjeapCxDyNPbk/SZQKDRvPHGBFGUsweS7RSjRKx
	kgpCPm/wfgW7DDozkTFT7eADQOmdmcIImTILsTtx9T/27Pdkw9u6yuY+ggo8eRZa26dn
	lPgGGd2J+Ps+38ZzsSYPv7JpMkSkyunrPdL728i71yRRpQq9kjq1+qUp/lpTV1E7de84
	ZyZDhnid2FvQiYyYRMJDbxIrpyZpXmR2dA9XE4o+US4RMk6oQpqrq0K79QDJY4it8mN3
	m3vA==
X-Gm-Message-State: AG10YOSmtJObBiHhk+6AZL7Fp1QQWrsLmmFYAMfL6ARihBqReYBVWXtwt4JNg+/qm7P9Lw==
X-Received: by 10.25.160.140 with SMTP id j134mr183658lfe.1.1455267520474;
	Fri, 12 Feb 2016 00:58:40 -0800 (PST)
Received: from [192.168.0.71] (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.googlemail.com with ESMTPSA id
	zk9sm1752546lbb.3.2016.02.12.00.58.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Feb 2016 00:58:39 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
	<1455217909-28317-4-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56BD9EBE.80802@gmail.com>
Date: Fri, 12 Feb 2016 11:58:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455217909-28317-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 3/4] target-arm: Combine user-only and
 softmmu get/set_r13_banked()
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
X-TUID: H/iuELyjjXjp

On 11.02.2016 22:11, Peter Maydell wrote:
> The user-mode versions of get/set_r13_banked() exist just to assert
> if they're ever called -- the translate time code should never
> emit calls to them because SRS from user mode always UNDEF.
> There's no code in the softmmu versions that can't compile in
> CONFIG_USER_ONLY, so combine the two functions rather than
> having completely split versions under ifdefs.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/op_helper.c | 25 ++++++-------------------
>  1 file changed, 6 insertions(+), 19 deletions(-)
>
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 053e9b6..05f97a7 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -457,26 +457,11 @@ void HELPER(set_user_reg)(CPUARMState *env, uint32_t regno, uint32_t val)
>      }
>  }
>  
> -#if defined(CONFIG_USER_ONLY)
> -void HELPER(set_r13_banked)(CPUARMState *env, uint32_t mode, uint32_t val)
> -{
> -    ARMCPU *cpu = arm_env_get_cpu(env);
> -
> -    cpu_abort(CPU(cpu), "banked r13 write\n");
> -}
> -
> -uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
> -{
> -    ARMCPU *cpu = arm_env_get_cpu(env);
> -
> -    cpu_abort(CPU(cpu), "banked r13 read\n");
> -    return 0;
> -}
> -
> -#else
> -
>  void HELPER(set_r13_banked)(CPUARMState *env, uint32_t mode, uint32_t val)
>  {
> +#if defined(CONFIG_USER_ONLY)
> +    g_assert_not_reached();
> +#endif
>      if ((env->uncached_cpsr & CPSR_M) == mode) {
>          env->regs[13] = val;
>      } else {
> @@ -486,13 +471,15 @@ void HELPER(set_r13_banked)(CPUARMState *env, uint32_t mode, uint32_t val)
>  
>  uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
>  {
> +#if defined(CONFIG_USER_ONLY)
> +    g_assert_not_reached();
> +#endif
>      if ((env->uncached_cpsr & CPSR_M) == mode) {
>          return env->regs[13];
>      } else {
>          return env->banked_r13[bank_number(mode)];
>      }
>  }
> -#endif
>  
>  void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
>                                   uint32_t isread)

