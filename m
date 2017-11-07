Received: by 10.223.150.237 with SMTP id u100csp108347wrb;
        Tue, 7 Nov 2017 06:39:25 -0800 (PST)
X-Google-Smtp-Source: ABhQp+STwEUTg3q9QA5ZJo8f6za0keA/AG4QSa//+0hkbBWOY3b+zFE5v4E+5bmKD6Ykz8+skF/S
X-Received: by 10.37.185.15 with SMTP id x15mr12100639ybj.171.1510065565442;
        Tue, 07 Nov 2017 06:39:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510065565; cv=none;
        d=google.com; s=arc-20160816;
        b=U38cu+FLNB07b9xhIxfw8PDXpBoEF5yDNB/XD1PpIxgodHcxGqzgEAiHb5mJWGNm/8
         Yod8S/U7urRgRKfmCHCX46mDmVhTeL6WhEv/Ne1umasUL3H/k6wSs7HIC4Zm118nuKAb
         I/whZmsM5pwoZ4zKpMmep/wk/Hr+Dpx2fK6UdRabZCOaJ8ZQJJFTlG9YpBewn4Pk9EHt
         wGpaZOOtQ+KU0hWbEeyrE0cJAfUitnWkIIO8LAT0pfKUpU1Apw2Ty77sdLiMMfKiW7Vx
         GOTeCGYAUi3C840j0FF+Gw/3Hg5ad/Iu8ZQ9osP6fs69H4Yrcz+WIelrsAbaMJY7NdCd
         W/JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=igQO7rjqX9MuwE8IZ1Rugulxe+OCWECHWVaBY/JTOhI=;
        b=lswA5y4tSZpTbaqiLmbUGQ3ijk/xZnD4cu6W23gh1WT/kE7h3++nB+H88mPBr0uW12
         MWxmjxrzoiMQ5Ob2pO9ugdTauIY7xo3RG/ZI77XZCO8ajvouLT4J/9r1CNPpzR5EwiJE
         63j9CPGTXQlWSY5axAkh6fyM5yAzceH4694ztBrOCkh0zYUrOBxQDfUkVlSXQFD7p/xy
         sjC7mtLhSQug8nTqsGNcsbqpAFjXJOJgtula+0uStLT1IB3UQDzZ05Tydzrdqdri2Xyk
         fiQmVMg2/pWpweAcLyQ2tBgvjLNcwDQ+K3ijxZfuTMY8MPYOiC0O+5J23jIrUuGutr6r
         Yv/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Nc78Nhuw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z190si323794ywd.324.2017.11.07.06.39.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 06:39:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Nc78Nhuw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53721 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eC52C-0003dO-OT
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 09:39:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eC51q-0003Wu-OE
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 09:39:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eC51k-0002hk-Dz
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 09:39:02 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:56999)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eC51k-0002hW-7F; Tue, 07 Nov 2017 09:38:56 -0500
Received: by mail-qt0-x244.google.com with SMTP id z28so15414635qtz.13;
	Tue, 07 Nov 2017 06:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=igQO7rjqX9MuwE8IZ1Rugulxe+OCWECHWVaBY/JTOhI=;
	b=Nc78Nhuw7rg+FBbv+D8BkCx6AZOvdzugy/knUwWc3QCLx+ayXtpDsUJaQV8CRXZp/c
	McLqQxVlwIyvygEVcjnFNBvlANx6Nf4PtMn/QBaJ8WhN8Z5vPS1qA6vHRlPrjNMN+PfF
	7pBOa4ll/UVHZLEFpY8x7m8hmv6E+7zZP2B+oy7tt6pmhQD3uIdGBHKz8BwsSRNMMsbt
	udPul9ohA4/IQpQ+Lftfsg9c2M1wRe3S/gSbWuJhj83XOTJ/HWwscc4kLsZaBIZNvO0b
	3HuChgks6sjr4mrHyf6XGXlY9Y0qw5fyNz+GobR5VgB0H3UlEl6Kc0mbPqKWrXOICwaH
	2i/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=igQO7rjqX9MuwE8IZ1Rugulxe+OCWECHWVaBY/JTOhI=;
	b=H9AeeUhjRPn7QYyf8Gr9CH+bzkOAKrT4QNioMoYpxD099w2Up1vmSj9T3AjPsz0Y+m
	rL9zoGnw4iuqlYcCUIIi+v7gyO9hQm9+G6aLrKA1rL/pWu9XMBdeNtz159Qx54+49v70
	JyOqtgzdXMWHGKW475anVbL6vNtJPwl0FiMcO+xwtJ2vaG541iDv8Getdllj1hM8WE9T
	8Z0RLlvU+DxeieM2Oj+UGJ1S6YzOneGWSFqNVbMrUud5GshdpQGPMeGZYTSRPnlBBtsD
	WC25WP0z00hzZcDiyqe7lL/ljZdAqhGQIze4Js9WBz5VlJYMcTNDLOgtGGq7aPVlWAqe
	DM6w==
X-Gm-Message-State: AJaThX5Akq9LsGy0xGyDhEpEeXmKc/h7+42kiUfXEb5hAAXEyaXaPblh
	HyROO4qR4Zd8JDVPG/Ip9n4=
X-Received: by 10.200.13.70 with SMTP id r6mr26543422qti.303.1510065535468;
	Tue, 07 Nov 2017 06:38:55 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	t188sm961354qkf.12.2017.11.07.06.38.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Nov 2017 06:38:54 -0800 (PST)
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20171103202624.5956-1-laurent@vivier.eu>
	<20171103202624.5956-3-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <05e0db35-da92-cdea-0fd3-131fb989ea6c@amsat.org>
Date: Tue, 7 Nov 2017 11:38:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171103202624.5956-3-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH 2/4] openrisc: fix float32 and float64 helper
 definitions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>,
	qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jA8lE6TjbBL1

On 11/03/2017 05:26 PM, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/openrisc/fpu_helper.c | 52 ++++++++++++++++++++++----------------------
>  target/openrisc/helper.h     | 20 ++++++++---------
>  2 files changed, 36 insertions(+), 36 deletions(-)
> 
> diff --git a/target/openrisc/fpu_helper.c b/target/openrisc/fpu_helper.c
> index 1375cea948..f84f8bf26a 100644
> --- a/target/openrisc/fpu_helper.c
> +++ b/target/openrisc/fpu_helper.c
> @@ -66,9 +66,9 @@ static inline void update_fpcsr(OpenRISCCPU *cpu)
>      }
>  }
>  
> -uint64_t HELPER(itofd)(CPUOpenRISCState *env, uint64_t val)
> +float64 HELPER(itofd)(CPUOpenRISCState *env, uint64_t val)
>  {
> -    uint64_t itofd;
> +    float64 itofd;
>      OpenRISCCPU *cpu = openrisc_env_get_cpu(env);
>  
>      set_float_exception_flags(0, &cpu->env.fp_status);
> @@ -78,9 +78,9 @@ uint64_t HELPER(itofd)(CPUOpenRISCState *env, uint64_t val)
>      return itofd;
>  }
>  
> -uint32_t HELPER(itofs)(CPUOpenRISCState *env, uint32_t val)
> +float32 HELPER(itofs)(CPUOpenRISCState *env, uint32_t val)
>  {
> -    uint32_t itofs;
> +    float32 itofs;
>      OpenRISCCPU *cpu = openrisc_env_get_cpu(env);
>  
>      set_float_exception_flags(0, &cpu->env.fp_status);
> @@ -90,7 +90,7 @@ uint32_t HELPER(itofs)(CPUOpenRISCState *env, uint32_t val)
>      return itofs;
>  }
>  
> -uint64_t HELPER(ftoid)(CPUOpenRISCState *env, uint64_t val)
> +uint64_t HELPER(ftoid)(CPUOpenRISCState *env, float32 val)
>  {
>      uint64_t ftoid;
>      OpenRISCCPU *cpu = openrisc_env_get_cpu(env);
> @@ -102,7 +102,7 @@ uint64_t HELPER(ftoid)(CPUOpenRISCState *env, uint64_t val)
>      return ftoid;
>  }
>  
> -uint32_t HELPER(ftois)(CPUOpenRISCState *env, uint32_t val)
> +uint32_t HELPER(ftois)(CPUOpenRISCState *env, float32 val)
>  {
>      uint32_t ftois;
>      OpenRISCCPU *cpu = openrisc_env_get_cpu(env);
> @@ -117,10 +117,10 @@ uint32_t HELPER(ftois)(CPUOpenRISCState *env, uint32_t val)
>  #define FLOAT_OP(name, p) void helper_float_##_##p(void)
>  
>  #define FLOAT_CALC(name)                                                  \
> -uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
> -                                     uint64_t fdt0, uint64_t fdt1)        \
> +float64 helper_float_ ## name ## _d(CPUOpenRISCState *env,                \
> +                                    float64 fdt0, float64 fdt1)          \
>  {                                                                         \
> -    uint64_t result;                                                      \
> +    float64 result;                                                       \
>      OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
>      set_float_exception_flags(0, &cpu->env.fp_status);                    \
>      result = float64_ ## name(fdt0, fdt1, &cpu->env.fp_status);           \
> @@ -128,10 +128,10 @@ uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
>      return result;                                                        \
>  }                                                                         \
>                                                                            \
> -uint32_t helper_float_ ## name ## _s(CPUOpenRISCState *env,               \
> -                                     uint32_t fdt0, uint32_t fdt1)        \
> +float32 helper_float_ ## name ## _s(CPUOpenRISCState *env,                \
> +                                    float32 fdt0, float32 fdt1)           \
>  {                                                                         \
> -    uint32_t result;                                                      \
> +    float32 result;                                                       \
>      OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
>      set_float_exception_flags(0, &cpu->env.fp_status);                    \
>      result = float32_ ## name(fdt0, fdt1, &cpu->env.fp_status);           \
> @@ -147,11 +147,11 @@ FLOAT_CALC(rem)
>  #undef FLOAT_CALC
>  
>  
> -uint64_t helper_float_madd_d(CPUOpenRISCState *env, uint64_t a,
> -                             uint64_t b, uint64_t c)
> +float64 helper_float_madd_d(CPUOpenRISCState *env, float64 a,
> +                             float64 b, float64 c)
>  {
>      OpenRISCCPU *cpu = openrisc_env_get_cpu(env);
> -    uint64_t result;
> +    float64 result;
>      set_float_exception_flags(0, &cpu->env.fp_status);
>      /* Note that or1ksim doesn't use merged operation.  */
>      result = float64_mul(b, c, &cpu->env.fp_status);
> @@ -160,11 +160,11 @@ uint64_t helper_float_madd_d(CPUOpenRISCState *env, uint64_t a,
>      return result;
>  }
>  
> -uint32_t helper_float_madd_s(CPUOpenRISCState *env, uint32_t a,
> -                             uint32_t b, uint32_t c)
> +float32 helper_float_madd_s(CPUOpenRISCState *env, float32 a,
> +                             float32 b, float32 c)
>  {
>      OpenRISCCPU *cpu = openrisc_env_get_cpu(env);
> -    uint32_t result;
> +    float32 result;
>      set_float_exception_flags(0, &cpu->env.fp_status);
>      /* Note that or1ksim doesn't use merged operation.  */
>      result = float32_mul(b, c, &cpu->env.fp_status);
> @@ -176,7 +176,7 @@ uint32_t helper_float_madd_s(CPUOpenRISCState *env, uint32_t a,
>  
>  #define FLOAT_CMP(name)                                                   \
>  uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
> -                                     uint64_t fdt0, uint64_t fdt1)        \
> +                                    float64 fdt0, float64 fdt1)           \
>  {                                                                         \
>      int res;                                                              \
>      OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
> @@ -187,7 +187,7 @@ uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
>  }                                                                         \
>                                                                            \
>  uint32_t helper_float_ ## name ## _s(CPUOpenRISCState *env,               \
> -                                             uint32_t fdt0, uint32_t fdt1)\
> +                                    float32 fdt0, float32 fdt1)           \
>  {                                                                         \
>      int res;                                                              \
>      OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
> @@ -205,7 +205,7 @@ FLOAT_CMP(lt)
>  
>  #define FLOAT_CMPNE(name)                                                 \
>  uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
> -                                     uint64_t fdt0, uint64_t fdt1)        \
> +                                     float64 fdt0, float64 fdt1)          \
>  {                                                                         \
>      int res;                                                              \
>      OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
> @@ -216,7 +216,7 @@ uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
>  }                                                                         \
>                                                                            \
>  uint32_t helper_float_ ## name ## _s(CPUOpenRISCState *env,               \
> -                                     uint32_t fdt0, uint32_t fdt1)        \
> +                                     float32 fdt0, float32 fdt1)          \
>  {                                                                         \
>      int res;                                                              \
>      OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
> @@ -231,7 +231,7 @@ FLOAT_CMPNE(ne)
>  
>  #define FLOAT_CMPGT(name)                                                 \
>  uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
> -                                     uint64_t fdt0, uint64_t fdt1)        \
> +                                     float64 fdt0, float64 fdt1)          \
>  {                                                                         \
>      int res;                                                              \
>      OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
> @@ -242,7 +242,7 @@ uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
>  }                                                                         \
>                                                                            \
>  uint32_t helper_float_ ## name ## _s(CPUOpenRISCState *env,               \
> -                                     uint32_t fdt0, uint32_t fdt1)        \
> +                                     float32 fdt0, float32 fdt1)          \
>  {                                                                         \
>      int res;                                                              \
>      OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
> @@ -256,7 +256,7 @@ FLOAT_CMPGT(gt)
>  
>  #define FLOAT_CMPGE(name)                                                 \
>  uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
> -                                     uint64_t fdt0, uint64_t fdt1)        \
> +                                     float64 fdt0, float64 fdt1)          \
>  {                                                                         \
>      int res;                                                              \
>      OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
> @@ -267,7 +267,7 @@ uint64_t helper_float_ ## name ## _d(CPUOpenRISCState *env,               \
>  }                                                                         \
>                                                                            \
>  uint32_t helper_float_ ## name ## _s(CPUOpenRISCState *env,               \
> -                                     uint32_t fdt0, uint32_t fdt1)        \
> +                                     float32 fdt0, float32 fdt1)          \
>  {                                                                         \
>      int res;                                                              \
>      OpenRISCCPU *cpu = openrisc_env_get_cpu(env);                         \
> diff --git a/target/openrisc/helper.h b/target/openrisc/helper.h
> index 4fd1a6bb8e..081606527b 100644
> --- a/target/openrisc/helper.h
> +++ b/target/openrisc/helper.h
> @@ -24,17 +24,17 @@ DEF_HELPER_FLAGS_1(ove_ov, TCG_CALL_NO_WG, void, env)
>  DEF_HELPER_FLAGS_1(ove_cyov, TCG_CALL_NO_WG, void, env)
>  
>  /* float */
> -DEF_HELPER_FLAGS_2(itofd, TCG_CALL_NO_WG, i64, env, i64)
> -DEF_HELPER_FLAGS_2(itofs, TCG_CALL_NO_WG, i32, env, i32)
> -DEF_HELPER_FLAGS_2(ftoid, TCG_CALL_NO_WG, i64, env, i64)
> -DEF_HELPER_FLAGS_2(ftois, TCG_CALL_NO_WG, i32, env, i32)
> +DEF_HELPER_FLAGS_2(itofd, TCG_CALL_NO_WG, f64, env, i64)
> +DEF_HELPER_FLAGS_2(itofs, TCG_CALL_NO_WG, f32, env, i32)
> +DEF_HELPER_FLAGS_2(ftoid, TCG_CALL_NO_WG, i64, env, f32)
> +DEF_HELPER_FLAGS_2(ftois, TCG_CALL_NO_WG, i32, env, f32)
>  
> -DEF_HELPER_FLAGS_4(float_madd_s, TCG_CALL_NO_WG, i32, env, i32, i32, i32)
> -DEF_HELPER_FLAGS_4(float_madd_d, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
> +DEF_HELPER_FLAGS_4(float_madd_s, TCG_CALL_NO_WG, f32, env, f32, f32, f32)
> +DEF_HELPER_FLAGS_4(float_madd_d, TCG_CALL_NO_WG, f64, env, f64, f64, f64)
>  
>  #define FOP_CALC(op)                                            \
> -DEF_HELPER_FLAGS_3(float_ ## op ## _s, TCG_CALL_NO_WG, i32, env, i32, i32) \
> -DEF_HELPER_FLAGS_3(float_ ## op ## _d, TCG_CALL_NO_WG, i64, env, i64, i64)
> +DEF_HELPER_FLAGS_3(float_ ## op ## _s, TCG_CALL_NO_WG, f32, env, f32, f32) \
> +DEF_HELPER_FLAGS_3(float_ ## op ## _d, TCG_CALL_NO_WG, f64, env, f64, f64)
>  FOP_CALC(add)
>  FOP_CALC(sub)
>  FOP_CALC(mul)
> @@ -43,8 +43,8 @@ FOP_CALC(rem)
>  #undef FOP_CALC
>  
>  #define FOP_CMP(op)                                              \
> -DEF_HELPER_FLAGS_3(float_ ## op ## _s, TCG_CALL_NO_WG, i32, env, i32, i32) \
> -DEF_HELPER_FLAGS_3(float_ ## op ## _d, TCG_CALL_NO_WG, i64, env, i64, i64)
> +DEF_HELPER_FLAGS_3(float_ ## op ## _s, TCG_CALL_NO_WG, i32, env, f32, f32) \
> +DEF_HELPER_FLAGS_3(float_ ## op ## _d, TCG_CALL_NO_WG, i64, env, f64, f64)
>  FOP_CMP(eq)
>  FOP_CMP(lt)
>  FOP_CMP(le)
> 
