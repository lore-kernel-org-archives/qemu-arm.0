Received: by 10.25.159.19 with SMTP id i19csp554086lfe;
        Sat, 6 Feb 2016 10:25:15 -0800 (PST)
X-Received: by 10.140.167.135 with SMTP id n129mr24815664qhn.73.1454783115302;
        Sat, 06 Feb 2016 10:25:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d66si22305806qkj.38.2016.02.06.10.25.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Feb 2016 10:25:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aS7Xm-00031p-PL
	for alex.bennee@linaro.org; Sat, 06 Feb 2016 13:25:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aS7Xi-0002tq-67
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 13:25:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aS7Xh-00087G-1Z
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 13:25:10 -0500
Received: from mail-lb0-x241.google.com ([2a00:1450:4010:c04::241]:33243)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aS7Xg-000875-LI; Sat, 06 Feb 2016 13:25:08 -0500
Received: by mail-lb0-x241.google.com with SMTP id bc4so3426240lbc.0;
	Sat, 06 Feb 2016 10:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:to:references:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=f+DF9jX7NP2mvwoh3f1DWWdTvZ0pDZIvHIllq+21sm8=;
	b=bHlaWSduGUUcfFio+gKfJKe0BWA3lUz0tRTtRlEUdkshpPvxwEuNljiX6AF/fmE7Kb
	cArK+VPw1a1PZepFSX6xEzVymyoMKOH6mJVYNd8y8m8GDw6o7Hcj69R8hYn1DEj0m7C3
	GE5THu58Zk4H0LgpmNCO35LZfmC9G1+FbZYj7dsWw+njwfc6PJ3hGTvpNnOf9wQ3RewY
	qzMLN5o26L+YFE7fFMzyDU/oR4I1vrqENcEhVxyP4J5iu2CoEtTtflObxh9AqEbUFWvI
	LduEErD7XFRRuqFLyfPG2QoA/UHINqTWWqLRQ4F0tHf43Wo+9sKGY1HsKvy4wD9AD2Os
	Ty7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:to:references:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=f+DF9jX7NP2mvwoh3f1DWWdTvZ0pDZIvHIllq+21sm8=;
	b=erFQWBcvctazdBop13JCg+XIRpXaRLOKrRuAaxyD+KAb07nTtp0OV/0oxKZkHLHL9B
	1D/c5tFId3UiQ1Qq798zzST1jGYjBUb2nNzMPHozsO1hRkjponGDgV5BsEf5sHnTR+Ov
	cogg1iljgbfPZmQN5iXasYV4zXPn5LSJwiwdAEJxU9MkdsLUOUUs15gxJO1UTcY9TeW3
	ywa01tYFaxya85a+lTjDWUGxLds/XVeOtEqooLD/ET/QBVsm+pFFw2mn+0kojepfYdoE
	vHcEDouLEW8fjWDxGh/C9SrnlVZmSgPrU/pFAh3zADAnsbsc98SkKwNLRo3VYAfA/gf2
	yRQg==
X-Gm-Message-State: AG10YOSZvcOHHd+H1dGvMflTybMAziI4PVjmiP20Oyvw8N9emuODqh9s0cuoAiT9GON+FA==
X-Received: by 10.112.145.131 with SMTP id su3mr8336274lbb.19.1454783107910;
	Sat, 06 Feb 2016 10:25:07 -0800 (PST)
Received: from [192.168.0.71] (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.googlemail.com with ESMTPSA id
	h75sm2912266lfi.2.2016.02.06.10.25.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Feb 2016 10:25:06 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1454683067-16001-1-git-send-email-peter.maydell@linaro.org>
	<1454683067-16001-2-git-send-email-peter.maydell@linaro.org>
Message-ID: <56B63A82.6060508@gmail.com>
Date: Sat, 6 Feb 2016 21:25:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454683067-16001-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::241
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 1/3] target-arm: Correct misleading
 'is_thumb' syn_* parameter names
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
X-TUID: Cc2f9Zc3cDLY

On 05.02.2016 17:37, Peter Maydell wrote:
> In syndrome register values, the IL bit indicates the instruction
> length, and is 1 for 4-byte instructions and 0 for 2-byte
> instructions. All A64 and A32 instructions are 4-byte, but
> Thumb instructions may be either 2 or 4 bytes long. Unfortunately
> we named the parameter to the syn_* functions for constructing
> syndromes "is_thumb", which falsely implies that it should be
> set for all Thumb instructions, rather than only the 16-bit ones.
> Fix the functions to name the parameter 'is_16bit' instead.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/internals.h | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/target-arm/internals.h b/target-arm/internals.h
> index d226bbe..a648c1e 100644
> --- a/target-arm/internals.h
> +++ b/target-arm/internals.h
> @@ -270,10 +270,10 @@ static inline uint32_t syn_aa64_smc(uint32_t imm16)
>      return (EC_AA64_SMC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
>  }
>  
> -static inline uint32_t syn_aa32_svc(uint32_t imm16, bool is_thumb)
> +static inline uint32_t syn_aa32_svc(uint32_t imm16, bool is_16bit)
>  {
>      return (EC_AA32_SVC << ARM_EL_EC_SHIFT) | (imm16 & 0xffff)
> -        | (is_thumb ? 0 : ARM_EL_IL);
> +        | (is_16bit ? 0 : ARM_EL_IL);
>  }
>  
>  static inline uint32_t syn_aa32_hvc(uint32_t imm16)
> @@ -291,10 +291,10 @@ static inline uint32_t syn_aa64_bkpt(uint32_t imm16)
>      return (EC_AA64_BKPT << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
>  }
>  
> -static inline uint32_t syn_aa32_bkpt(uint32_t imm16, bool is_thumb)
> +static inline uint32_t syn_aa32_bkpt(uint32_t imm16, bool is_16bit)
>  {
>      return (EC_AA32_BKPT << ARM_EL_EC_SHIFT) | (imm16 & 0xffff)
> -        | (is_thumb ? 0 : ARM_EL_IL);
> +        | (is_16bit ? 0 : ARM_EL_IL);
>  }
>  
>  static inline uint32_t syn_aa64_sysregtrap(int op0, int op1, int op2,
> @@ -308,48 +308,48 @@ static inline uint32_t syn_aa64_sysregtrap(int op0, int op1, int op2,
>  
>  static inline uint32_t syn_cp14_rt_trap(int cv, int cond, int opc1, int opc2,
>                                          int crn, int crm, int rt, int isread,
> -                                        bool is_thumb)
> +                                        bool is_16bit)
>  {
>      return (EC_CP14RTTRAP << ARM_EL_EC_SHIFT)
> -        | (is_thumb ? 0 : ARM_EL_IL)
> +        | (is_16bit ? 0 : ARM_EL_IL)
>          | (cv << 24) | (cond << 20) | (opc2 << 17) | (opc1 << 14)
>          | (crn << 10) | (rt << 5) | (crm << 1) | isread;
>  }
>  
>  static inline uint32_t syn_cp15_rt_trap(int cv, int cond, int opc1, int opc2,
>                                          int crn, int crm, int rt, int isread,
> -                                        bool is_thumb)
> +                                        bool is_16bit)
>  {
>      return (EC_CP15RTTRAP << ARM_EL_EC_SHIFT)
> -        | (is_thumb ? 0 : ARM_EL_IL)
> +        | (is_16bit ? 0 : ARM_EL_IL)
>          | (cv << 24) | (cond << 20) | (opc2 << 17) | (opc1 << 14)
>          | (crn << 10) | (rt << 5) | (crm << 1) | isread;
>  }
>  
>  static inline uint32_t syn_cp14_rrt_trap(int cv, int cond, int opc1, int crm,
>                                           int rt, int rt2, int isread,
> -                                         bool is_thumb)
> +                                         bool is_16bit)
>  {
>      return (EC_CP14RRTTRAP << ARM_EL_EC_SHIFT)
> -        | (is_thumb ? 0 : ARM_EL_IL)
> +        | (is_16bit ? 0 : ARM_EL_IL)
>          | (cv << 24) | (cond << 20) | (opc1 << 16)
>          | (rt2 << 10) | (rt << 5) | (crm << 1) | isread;
>  }
>  
>  static inline uint32_t syn_cp15_rrt_trap(int cv, int cond, int opc1, int crm,
>                                           int rt, int rt2, int isread,
> -                                         bool is_thumb)
> +                                         bool is_16bit)
>  {
>      return (EC_CP15RRTTRAP << ARM_EL_EC_SHIFT)
> -        | (is_thumb ? 0 : ARM_EL_IL)
> +        | (is_16bit ? 0 : ARM_EL_IL)
>          | (cv << 24) | (cond << 20) | (opc1 << 16)
>          | (rt2 << 10) | (rt << 5) | (crm << 1) | isread;
>  }
>  
> -static inline uint32_t syn_fp_access_trap(int cv, int cond, bool is_thumb)
> +static inline uint32_t syn_fp_access_trap(int cv, int cond, bool is_16bit)
>  {
>      return (EC_ADVSIMDFPACCESSTRAP << ARM_EL_EC_SHIFT)
> -        | (is_thumb ? 0 : ARM_EL_IL)
> +        | (is_16bit ? 0 : ARM_EL_IL)
>          | (cv << 24) | (cond << 20);
>  }
>  

