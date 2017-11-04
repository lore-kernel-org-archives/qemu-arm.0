Received: by 10.223.150.237 with SMTP id u100csp1221765wrb;
        Sat, 4 Nov 2017 14:21:25 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RBTRf97bc8HM1myIpQwlsb2oUSgQFK8TwvCAAvEYf3QS+CYL0omdSMlfe2zQhUWGwthaHy
X-Received: by 10.13.224.197 with SMTP id j188mr7413646ywe.47.1509830485050;
        Sat, 04 Nov 2017 14:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509830485; cv=none;
        d=google.com; s=arc-20160816;
        b=yTHHglbekNplXPvvZvhcACVIrt/CnE4NzQXdgTDv0m22Mt9gkaiMxZuL5RJSKaJ9Ww
         +LZ7yzdy9aFs1Yf2JN/+cbl3k5RIcyuAJ2LvQpAgF6kPey3Mf0iVWgIFnXwVyIhmilsF
         4XAQAfEn7Ad6Abf1fToxWnzRXskQfF08/zjlKF+pAr2P4Za5JMfEs8L00n2RI+87ZUiY
         ERc/J9ezFT6ThaMCDamg5j+D9l5suioh3J2EIhNWPG2EmTUTFgKZKEMrPy4itCQoNF1H
         4bInzjyuMQWIyTQQYW+Jl9oftYqTLQp7+nPpMSJRLp1axeYh4FyvmUPO+qZgZKXyBGB1
         ELIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=rZqUtCCdt9FqQ4kFE6x2PGL+UUkE7G2mdL/kTchsbJo=;
        b=E1s7dXPXHsiw1w8RutIH/a2agwsbH8I/YmaDZYFbO/cqmsMiZf14G7Yql6q48OOGqz
         wOWKiNxtzWAruGDanqrX8iG3JGDYFn3YkZTgEnEPwDgrdWlt3QyqkiCMAEuvsiO0cUgC
         ViMjEodGKRAl8Us1nA/SXBCN3ANVpxEg381xEL9+5P/MsQVeu/i8z4qKYPae1OjWoe0s
         VP9exZ0WD6Rc6DuGU4Slu+Se3rRlWrhKrf5cd/ubqi5ZOcHJ53zTYmQ3QOTM2se7X5qp
         Y44MNJurAxht40qLeRNkvZeEXZyx/cC4I7X63iGkuSkcZxdjSMzaR8fL8H8UDLxq9y1z
         MNHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o8J1Cf4G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a3si1938002ybc.716.2017.11.04.14.21.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 04 Nov 2017 14:21:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o8J1Cf4G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eB5sa-0004cF-FU
	for alex.bennee@linaro.org; Sat, 04 Nov 2017 17:21:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1eB5rY-0004FW-3K
	for qemu-devel@nongnu.org; Sat, 04 Nov 2017 17:20:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1eB5rU-0004Ai-Io
	for qemu-devel@nongnu.org; Sat, 04 Nov 2017 17:20:19 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:55706)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shorne@gmail.com>)
	id 1eB5rU-000490-92; Sat, 04 Nov 2017 17:20:16 -0400
Received: by mail-pg0-x241.google.com with SMTP id 15so5249794pgc.12;
	Sat, 04 Nov 2017 14:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=rZqUtCCdt9FqQ4kFE6x2PGL+UUkE7G2mdL/kTchsbJo=;
	b=o8J1Cf4GEoA9F7KVTMWrsaqD/cWG2DAyWGlKfG5BQOljccLRmEJwsBk2vesnB/quXO
	hDc0HySccajBp/7iaGf0FHIOl65WGBNf4cpr6wcyRqAEA+mVNjujjoyHg3NbSOXASaHl
	DACkXN1emiTMX3v2ixmSp7Zu2r81bEDHbAElS/u1W6W6BKluc726dqUfRCVcX+yF132W
	aIBzWuHNYo5+nWOS5o9Z6uEruB0NXSDFgUFTSNAOnJwZ3DKz3jkYCtXgcMA33uosTBa2
	34bX1vRgBRZ7aSyKCZPO+1wBNVoazdz+dVb4QmTJ4lx/2PKAI/kZQn7ZdCMhNOf/bzWi
	8+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=rZqUtCCdt9FqQ4kFE6x2PGL+UUkE7G2mdL/kTchsbJo=;
	b=Mt9sgDJc0ok1ZlXcv7DWzZ5GV4HAnq3qlfOxcLoctyyJ8RFozElei0Pkb+kbGItZGj
	5J8XkXe4LWECOQN1fI3Q90BnyOuD73SvKjT0JUNSwSzea3KMNZCrTmS6hjfSllrNOBz9
	aiLwDp8eM38ru3ZP1LxaJR6m9Dlt3C6zGqvozTRBhCqa4FPVckpRRP4kdQH284gTZlPS
	G3dLKXQ6MNWrwDtnHXsF31320N+O+SXJVQMBpJLC6papMo1s0ofstFnYD7STd2qmvFNY
	x6oMcuq5lW4lF/7i57eZUPucR0oz7TmL+PALWJGuzo/yPIB139ebPLrsDSNs5I+leAmt
	fMDQ==
X-Gm-Message-State: AMCzsaUwgd10Od3btk5n93kWLhW2d9Qxpdyx5kLp3ubm4vIlCWarvjO3
	h/K3fT4J07D35dOU7EI8mOk=
X-Received: by 10.99.43.71 with SMTP id r68mr11251341pgr.348.1509830414722;
	Sat, 04 Nov 2017 14:20:14 -0700 (PDT)
Received: from localhost (g183.61-45-92.ppp.wakwak.ne.jp. [61.45.92.183])
	by smtp.gmail.com with ESMTPSA id
	j6sm18220374pfk.159.2017.11.04.14.20.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 04 Nov 2017 14:20:14 -0700 (PDT)
Date: Sun, 5 Nov 2017 06:20:11 +0900
From: Stafford Horne <shorne@gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20171104212011.GK29237@lianli.shorne-pla.net>
References: <20171103202624.5956-1-laurent@vivier.eu>
	<20171103202624.5956-3-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171103202624.5956-3-laurent@vivier.eu>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: Re: [Qemu-devel] [PATCH 2/4] openrisc: fix float32 and float64
 helper definitions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W2FM5lwly5rI

Hello,

On Fri, Nov 03, 2017 at 09:26:22PM +0100, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

There is no commit body here, do we need one?  I can see in your cover letter
its mentioned this was revealed after enabling "USE_SOFTFLOAT_STRUCT_TYPES".

However, I'm just being curious why is this an issue?  In softfloat I assume we
pack our own floats so having the type that goes into a uint32 register wouldnt
make much difference right?

-Stafford

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
> -- 
> 2.13.6
> 
