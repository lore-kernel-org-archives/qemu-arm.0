Received: by 10.223.150.237 with SMTP id u100csp110014wrb;
        Tue, 7 Nov 2017 06:41:08 -0800 (PST)
X-Google-Smtp-Source: ABhQp+SgI87/F9KPKGOcDqG8rD7QlgG2htXB7T9BhcKsvDSfHtfbs6f0O3F3GrJt8Pbm05w+/+ZU
X-Received: by 10.13.214.211 with SMTP id y202mr12403924ywd.344.1510065668461;
        Tue, 07 Nov 2017 06:41:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510065668; cv=none;
        d=google.com; s=arc-20160816;
        b=kjm/yb3hKfyUv1lbYX02y3MctTf66aeLOwslTJm8T8CDLjnUbJzqLtbKeuh4IxYOU9
         jkk8XXm/JO1u4CaWXj2+0H5ZFfn9Qfnw3dCRNZdizUe2P83XRL3jQzeU0x/P6ZSUgnXO
         oGABvVaXIEpJ1qqk9R0s7jR9SDJTt+ogEUP9DkGaiPCI/Ag79IPnfhwoThPRRv8maDOE
         dZqbqs5YZ5/N9OAiugX90v8TL1GNnqB61xZyul/NowADgeghqIgMVIxRfrX1HS0cbnbs
         kofDf/Sdf3bvEBHiZj6h/c0f8RiNDgICMIYIxUTzWz17LlWgxcvkm1oP/GwYw5tdX++6
         e07w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=S8hg2sbnhBev8bfctt+yZZ9ezujqqL8xHLxGcyTxP5E=;
        b=XDtnA4q8W7yt9aF7I/iMna0z2++oa4bCw0GNRpt0ClWz0lq7O63mriskBvCm0tlpWu
         H0AK0vaUhneGudOeZDpIPJjy7rELdvnc+km9n+kIbHaYxOrt5U9hYKWYpjjq2SkRK06Z
         iiZ/hUYN+MBxV/qWGbXonNjcwGJLdHn8KzXZOasJyr+jG0EJ/ct7Nlsfe2hmCWKEaqg6
         pEBHCHCTCxRsRal6V6MzloquspueG7DNdxr1NagyA6J7v0sdOeUMhMJ2kOVsw2wvzPWW
         PjbkEOdeenwixSN8iE/FGsQyeiMMX31zsXTGS94quUWO/CsNRyMVyiGieyqEwVZXScV1
         8Kqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ulmy2grk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n18si190154ybd.178.2017.11.07.06.41.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 06:41:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ulmy2grk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eC53r-0004bn-U1
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 09:41:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eC53h-0004aN-FU
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 09:40:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eC53e-0003uE-Ak
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 09:40:57 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:55286)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eC53e-0003tF-5U; Tue, 07 Nov 2017 09:40:54 -0500
Received: by mail-qt0-x242.google.com with SMTP id z19so15414161qtg.11;
	Tue, 07 Nov 2017 06:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=S8hg2sbnhBev8bfctt+yZZ9ezujqqL8xHLxGcyTxP5E=;
	b=Ulmy2grkFwctDR0lMLDtEviTxYajlIOczP52YmsFqmEVomrFauobPkXk9SC2GOF+td
	+/SrTVG4vaXCKXmrFSSqqvebkJWODdfupPQDa2mc+dPa5ShJAuLIGzM6foIV+h6EUGdp
	vSeLwMN0bhh7eWpbPoAKbs42fEMtULWT2Vyo2rkEt763b4MT61w9YHgKh1nDFOJUjdpC
	uqF0DckvLYcFcCeF0Cl/EUboeWZNFm8aZQgoULd01I9Ymuf4jpHbvLoTyPcMlIIWp03P
	ppd7izpf7kZf8kubdjpjeLoZdxEL5khtfr+a6u0EPp4Wf7Skz43eKKPkpJofx+PR6EFE
	J+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=S8hg2sbnhBev8bfctt+yZZ9ezujqqL8xHLxGcyTxP5E=;
	b=fJ8OUZGMtNF96NZCpUi5AHEMOPcScAJCJfqmhFZ5kvVdVccMa3ul9WR4fRTPoCczYi
	ZzUuJa+u07lyYwCmJ2jEUAt4F9AwkMgJLtpBrnka59ILCQmvWCs3vBzEALG7VffG8aEk
	4B1T4P/lvbH8ZsHSNWfO5/D8SOCqqy3ghRE+OEzJPRjmWkRDGi3nqEILr513Nrx75Tfw
	hlhcAZOioAMh7q1advNaQ96FFcoACgFHlIw9j9grozKeAZhu2m2va2a1ZNnM2+nN3d25
	9wlMtgm2DVsKtJo/1XeATjts5Gbpm2wy/wEZdlgHB2bL3n9EYIDUFS+e2R2slfvLZIbz
	L6Iw==
X-Gm-Message-State: AMCzsaWVhN4ZZWzOFyomj0JCOYQapEk+IsmfVkG2s23Fq8GGuQ4zCtYW
	k/h7oQgbWCYsoG0B6xWtSkqEcQyc
X-Received: by 10.200.46.132 with SMTP id h4mr28811047qta.88.1510065653528;
	Tue, 07 Nov 2017 06:40:53 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f26sm933493qtg.22.2017.11.07.06.40.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Nov 2017 06:40:52 -0800 (PST)
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20171103202624.5956-1-laurent@vivier.eu>
	<20171103202624.5956-4-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <ec77ff1c-91ae-e79a-86fb-69cc9f55c20b@amsat.org>
Date: Tue, 7 Nov 2017 11:40:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171103202624.5956-4-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH 3/4] tricore: use make_float32() and
 float32_val()
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
X-TUID: xXDpBcYSvYNJ

On 11/03/2017 05:26 PM, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/tricore/fpu_helper.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/target/tricore/fpu_helper.c b/target/tricore/fpu_helper.c
> index 7979bb6692..d233d010c5 100644
> --- a/target/tricore/fpu_helper.c
> +++ b/target/tricore/fpu_helper.c
> @@ -21,10 +21,10 @@
>  #include "cpu.h"
>  #include "exec/helper-proto.h"
>  
> -#define QUIET_NAN 0x7fc00000
> -#define ADD_NAN   0x7fc00001
> -#define DIV_NAN   0x7fc00008
> -#define MUL_NAN   0x7fc00002
> +#define QUIET_NAN make_float32(0x7fc00000)
> +#define ADD_NAN   make_float32(0x7fc00001)
> +#define DIV_NAN   make_float32(0x7fc00008)
> +#define MUL_NAN   make_float32(0x7fc00002)
>  #define FPU_FS PSW_USB_C
>  #define FPU_FI PSW_USB_V
>  #define FPU_FV PSW_USB_SV
> @@ -63,13 +63,13 @@ static inline float32 f_maddsub_nan_result(float32 arg1, float32 arg2,
>      } else if (float32_is_zero(arg1) && float32_is_infinity(arg2)) {
>          return MUL_NAN;
>      } else {
> -        aSign = arg1 >> 31;
> -        bSign = arg2 >> 31;
> -        cSign = arg3 >> 31;
> +        aSign = float32_val(arg1) >> 31;
> +        bSign = float32_val(arg2) >> 31;
> +        cSign = float32_val(arg3) >> 31;
>  
> -        aExp = (arg1 >> 23) & 0xff;
> -        bExp = (arg2 >> 23) & 0xff;
> -        cExp = (arg3 >> 23) & 0xff;
> +        aExp = (float32_val(arg1) >> 23) & 0xff;
> +        bExp = (float32_val(arg2) >> 23) & 0xff;
> +        cExp = (float32_val(arg3) >> 23) & 0xff;
>  
>          if (muladd_negate_c) {
>              cSign ^= 1;
> @@ -139,7 +139,7 @@ uint32_t helper_f##op(CPUTriCoreState *env, uint32_t r1, uint32_t r2)          \
>      } else {                                                                   \
>          env->FPU_FS = 0;                                                       \
>      }                                                                          \
> -    return (uint32_t)f_result;                                                 \
> +    return float32_val(f_result);                                              \
>  }
>  FADD_SUB(add)
>  FADD_SUB(sub)
> @@ -166,7 +166,7 @@ uint32_t helper_fmul(CPUTriCoreState *env, uint32_t r1, uint32_t r2)
>      } else {
>          env->FPU_FS = 0;
>      }
> -    return (uint32_t)f_result;
> +    return float32_val(f_result);
>  
>  }
>  
> @@ -193,7 +193,7 @@ uint32_t helper_fdiv(CPUTriCoreState *env, uint32_t r1, uint32_t r2)
>          env->FPU_FS = 0;
>      }
>  
> -    return (uint32_t)f_result;
> +    return float32_val(f_result);
>  }
>  
>  uint32_t helper_fmadd(CPUTriCoreState *env, uint32_t r1,
> @@ -219,7 +219,7 @@ uint32_t helper_fmadd(CPUTriCoreState *env, uint32_t r1,
>      } else {
>          env->FPU_FS = 0;
>      }
> -    return (uint32_t)f_result;
> +    return float32_val(f_result);
>  }
>  
>  uint32_t helper_fmsub(CPUTriCoreState *env, uint32_t r1,
> @@ -247,7 +247,7 @@ uint32_t helper_fmsub(CPUTriCoreState *env, uint32_t r1,
>      } else {
>          env->FPU_FS = 0;
>      }
> -    return (uint32_t)f_result;
> +    return float32_val(f_result);
>  }
>  
>  uint32_t helper_fcmp(CPUTriCoreState *env, uint32_t r1, uint32_t r2)
> @@ -304,7 +304,7 @@ uint32_t helper_itof(CPUTriCoreState *env, uint32_t arg)
>      } else {
>          env->FPU_FS = 0;
>      }
> -    return (uint32_t)f_result;
> +    return float32_val(f_result);
>  }
>  
>  uint32_t helper_ftouz(CPUTriCoreState *env, uint32_t arg)
> @@ -321,7 +321,7 @@ uint32_t helper_ftouz(CPUTriCoreState *env, uint32_t arg)
>          if (float32_is_any_nan(f_arg)) {
>              result = 0;
>          }
> -    } else if (float32_lt_quiet(f_arg, 0, &env->fp_status)) {
> +    } else if (float32_lt_quiet(f_arg, float32_zero, &env->fp_status)) {
>          flags = float_flag_invalid;
>          result = 0;
>      }
> 
