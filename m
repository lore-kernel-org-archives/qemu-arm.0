Received: by 10.25.159.19 with SMTP id i19csp559839lfe;
        Sat, 6 Feb 2016 10:43:56 -0800 (PST)
X-Received: by 10.140.174.2 with SMTP id u2mr25892339qhu.85.1454784236365;
        Sat, 06 Feb 2016 10:43:56 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c13si22389284qkj.48.2016.02.06.10.43.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Feb 2016 10:43:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55828 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aS7pr-0001m4-Tv
	for alex.bennee@linaro.org; Sat, 06 Feb 2016 13:43:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aS7pL-00018z-Hl
	for qemu-devel@nongnu.org; Sat, 06 Feb 2016 13:43:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aS7pK-0003w5-J1
	for qemu-devel@nongnu.org; Sat, 06 Feb 2016 13:43:23 -0500
Received: from mail-lb0-x243.google.com ([2a00:1450:4010:c04::243]:35001)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aS7pD-0003vh-Md; Sat, 06 Feb 2016 13:43:16 -0500
Received: by mail-lb0-x243.google.com with SMTP id dx9so3432230lbc.2;
	Sat, 06 Feb 2016 10:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:to:references:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=Z1MUMo8z2rkUG03z1t7UovaM5bjyYctygRBl0fQcQKI=;
	b=rY1FG+nkkQuSxxD8ftt2hW4mxS2U+YrK+GKkN3+ZXOyqi8TGNUQO9uKXCjlFOyqo5u
	horf7NkJZhAgA2s3UJHekqXxj4ZhyQ/eK1dVS6LxDSVLddcmjhZaXs3Vf6DBqGED3yjG
	NB+hBhj6er7qyepwFpkV98a/E+tgNyD5iNxh7u+N8KOy/+sTtxiOtjuPlV3UjiAvLBN7
	bp7/T8EUREPd3Ca4Zy3dZaLeAiJiIH0P8tbwY7nVg4UwCcKV54vDkJhZs3OJUrhQS7EU
	CA2Lo6Dv9PKz+UYIOgeWjTuiyOWb3f1pcmtbvV41fLE8Y8UT04q1DH/MsMWGIvqyFXQP
	LOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:to:references:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Z1MUMo8z2rkUG03z1t7UovaM5bjyYctygRBl0fQcQKI=;
	b=MSVtISLw6NxPU0sY1vGPricyaskpri+xIkLOCPZ5g9FKa1AwnkvciMFkg0FCewWvfb
	BAWIuwSN8Wj9VI3a7gJdIN+pMVsFVy4w25mbFfcxVeHXM7wbO6YS0WEFU1wC4QuyXWcI
	3LTS1tCiOa2Zkh9G0tzUxbDNAPepS7AZ1iDKxwRnD5jc6Y1ZCoBnfKvt6PoKPjYreu2f
	lZ4xl9KGM+BvoSBx229YozBlB5YgFJiGaOuSJFtZPrUbdJDWxtw5KKzWIvIk6jYnvr5U
	Ovc9/uP/0X9sbnEEvd6UUyJJFv+lAk5hiBw0UsticMAU73LNCFjGbXtwbBJllD7POgM8
	t8GA==
X-Gm-Message-State: AG10YOTDKRrbGtc1Rli9pirElEF4iY3SBAMg0CK2MZwHgamjeQ6gYjaIRtKNYc2/BnfgAw==
X-Received: by 10.112.181.196 with SMTP id dy4mr8378007lbc.42.1454784194878;
	Sat, 06 Feb 2016 10:43:14 -0800 (PST)
Received: from [192.168.0.71] (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.googlemail.com with ESMTPSA id
	l189sm2921740lfd.30.2016.02.06.10.43.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Feb 2016 10:43:13 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
	<1454506721-11843-5-git-send-email-peter.maydell@linaro.org>
Message-ID: <56B63EC1.1070805@gmail.com>
Date: Sat, 6 Feb 2016 21:43:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454506721-11843-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::243
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-devel] [PATCH 4/7] target-arm: Update
 arm_generate_debug_exceptions() to handle EL2/EL3
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
X-TUID: O/IjYWZXsQi6

On 03.02.2016 16:38, Peter Maydell wrote:
> The arm_generate_debug_exceptions() function as originally implemented
> assumes no EL2 or EL3. Since we now have much more of an implementation
> of those now, fix this assumption.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/cpu.h | 48 +++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 43 insertions(+), 5 deletions(-)
>
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index cf2df50..0fb79d0 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -1742,9 +1742,7 @@ typedef enum ARMASIdx {
>      ARMASIdx_S = 1,
>  } ARMASIdx;
>  
> -/* Return the Exception Level targeted by debug exceptions;
> - * currently always EL1 since we don't implement EL2 or EL3.
> - */
> +/* Return the Exception Level targeted by debug exceptions. */
>  static inline int arm_debug_target_el(CPUARMState *env)
>  {
>      bool secure = arm_is_secure(env);
> @@ -1767,6 +1765,14 @@ static inline int arm_debug_target_el(CPUARMState *env)
>  
>  static inline bool aa64_generate_debug_exceptions(CPUARMState *env)
>  {
> +    if (arm_is_secure(env)) {
> +        /* MDCR_EL3.SDD disables debug events from Secure state */
> +        if (extract32(env->cp15.mdcr_el3, 16, 1) != 0
> +            || arm_current_el(env) == 3) {
> +            return false;
> +        }
> +    }
> +
>      if (arm_current_el(env) == arm_debug_target_el(env)) {
>          if ((extract32(env->cp15.mdscr_el1, 13, 1) == 0)
>              || (env->daif & PSTATE_D)) {
> @@ -1778,10 +1784,42 @@ static inline bool aa64_generate_debug_exceptions(CPUARMState *env)
>  
>  static inline bool aa32_generate_debug_exceptions(CPUARMState *env)
>  {
> -    if (arm_current_el(env) == 0 && arm_el_is_aa64(env, 1)) {
> +    int el = arm_current_el(env);
> +
> +    if (el == 0 && arm_el_is_aa64(env, 1)) {
>          return aa64_generate_debug_exceptions(env);
>      }
> -    return arm_current_el(env) != 2;
> +
> +    if (arm_is_secure(env)) {
> +        int spd;
> +
> +        if (el == 0 && (env->cp15.sder & 1)) {
> +            /* SDER.SUIDEN means debug exceptions from Secure EL0
> +             * are always enabled. Otherwise they are controlled by
> +             * SDCR.SPD like those from other Secure ELs.
> +             */
> +            return true;
> +        }
> +
> +        spd = extract32(env->cp15.mdcr_el3, 14, 2);
> +        switch (spd) {
> +        case 1:
> +            /* SPD == 0b01 is reserved, but behaves as 0b00. */
> +        case 0:
> +            /* For 0b00 we return true if external secure invasive debug
> +             * is enabled. On real hardware this is controlled by external
> +             * signals to the core. QEMU always permits debug, and behaves
> +             * as if DBGEN, SPIDEN, NIDEN and SPNIDEN are all tied high.
> +             */
> +            return true;
> +        case 2:
> +            return false;
> +        case 3:
> +            return true;
> +        }
> +    }
> +
> +    return el != 2;
>  }
>  
>  /* Return true if debugging exceptions are currently enabled.

