Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp6981767wrx;
        Thu, 11 Apr 2019 02:54:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyqfWHSksyelXKmj0eclLLDU4OIxrY6O8sJ6hYj2eQOihrUCSezo/y+j9GHYptuIMaEbW7n
X-Received: by 2002:a1c:c00b:: with SMTP id q11mr6252984wmf.38.1554976449258;
        Thu, 11 Apr 2019 02:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554976449; cv=none;
        d=google.com; s=arc-20160816;
        b=uZ4ddia89OrdeANarpZbaxHpDsYuvm9ZAyq6V8e5Uu3sO123e2o8fbCjHKL5AHGe0+
         Yn3KjidcEJpwA42fENON2MXf5WSFS8O8RpItpMDOkfvTBYoz9fauBw0fKS6p59xy1Vkn
         jeVBeBTENoOFz82gKmsXg/plOW6SqFaq8sqk6cebIbi3Ng0IYS46BXaH4JKrUqjsdpKx
         WdxM38f3RcBMXEAvxAvvgwUwzErB7spSqiTpFghBwH/bD4tngE7OcoDwVY8qPAR/QGnj
         Hv1F3eZpr8jJNo5UmTcK/aJKHbfeA95k15ych0/LRvMRHg6i4e5jdmwjtcsF3JWyb5F+
         p0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=GhnvdPW8Kyb3+ZbpoR5J5xfFLEXwWw09MX0axWHfGao=;
        b=x4pVMsE94KAKV82MF1NZh/uz71QNqK55co93MIt/LJKIr93n8FzsTkNt+8OSA/Fwy0
         R0f3ucxbGg4yIp7thjI5N5bpiK7vV52O08OOE6KU7Vs6PGJXkR78KGUOYfuZVGr0wQ+c
         x77Bvtc7GHEMwrxkueZG2aT4w6jdl8/9UNHSMsTIMHLfyvFsRpkjBmWcFQn//nuxm43M
         GsWeli/d0oOHN/60M6CmCH39LSxlsmkQtG+u7fIsgmub93JCnthJCX90TcPQsR2LU4N4
         tzPwnSoxYSlcyqDiUYThtAivV2DgO7gR6HJPH5Jt6j6tijyIWPGk+lqhd+IFnZbzEpOy
         dn1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t65si2900579wmt.74.2019.04.11.02.54.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 02:54:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEWPI-0003s8-6P
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 05:54:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEWP3-0003q7-Is
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 05:53:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEWP2-0007NQ-J1
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 05:53:53 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35835)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hEWP2-0007N8-Ci
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 05:53:52 -0400
Received: by mail-wm1-f65.google.com with SMTP id y197so5845170wmd.0
	for <qemu-arm@nongnu.org>; Thu, 11 Apr 2019 02:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GhnvdPW8Kyb3+ZbpoR5J5xfFLEXwWw09MX0axWHfGao=;
	b=rFC62xYcvT+ESJl4sc1lOU+NUk9rB89vIi3H8vxrzp7cSEdhlNO+Zikgigm8WkuXQR
	/P0T3g0KQgjzG7zCXDUG106Y69FTojvEOsK2Xaj14ylvhBBSoE8mFL6pHUdIszPFqYMY
	zYHHoAaOL3a1XmemRQF0UxvTQW7xwNENyyA/E4VMNqvil9zSovNXaidW+u17nCSHkWbm
	OtggAdBcKO2jTNOqsHU4FMapfsJoJihdf+c0H2NWJPb/AbVX/os626bPbEB+eRxbQ+xT
	taZ5xYX2Bbuz2RjgsNQ+BelPwAKxoqLQZRuWbZd23lVgWrkipGPtEnvs2jT84JUauryH
	K3vw==
X-Gm-Message-State: APjAAAVDqU7f95qNC9NAl0vs+Yk/ONlVzwBRZQFn9e4CauEsGzK3RoZc
	I5x+p9ll+6BuFPO4If7ytgUozQeasik=
X-Received: by 2002:a1c:4e04:: with SMTP id g4mr6223073wmh.127.1554976431329; 
	Thu, 11 Apr 2019 02:53:51 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	j22sm115724087wrd.91.2019.04.11.02.53.50
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Apr 2019 02:53:50 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190315032629.21234-1-richard.henderson@linaro.org>
	<20190315032629.21234-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2d327473-8763-f277-9bcf-4a77d2c3698b@redhat.com>
Date: Thu, 11 Apr 2019 11:53:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190315032629.21234-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 19/23]
 hw/misc/exynos4210_rng: Use qemu_guest_getrandom
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BcPhZZPIAYmw

On 3/15/19 4:26 AM, Richard Henderson wrote:
> The random number is intended for use by the guest.  As such, we should
> honor the -seed argument for reproducibility.
> 
> Cc: qemu-arm@nongnu.org
> Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/misc/exynos4210_rng.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/misc/exynos4210_rng.c b/hw/misc/exynos4210_rng.c
> index 4ecbebd2d7..0e70ffb404 100644
> --- a/hw/misc/exynos4210_rng.c
> +++ b/hw/misc/exynos4210_rng.c
> @@ -18,10 +18,10 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "crypto/random.h"
>  #include "hw/sysbus.h"
>  #include "qapi/error.h"
>  #include "qemu/log.h"
> +#include "qemu/guest-random.h"
>  
>  #define DEBUG_EXYNOS_RNG 0
>  
> @@ -109,7 +109,6 @@ static void exynos4210_rng_set_seed(Exynos4210RngState *s, unsigned int i,
>  static void exynos4210_rng_run_engine(Exynos4210RngState *s)
>  {
>      Error *err = NULL;
> -    int ret;
>  
>      /* Seed set? */
>      if ((s->reg_status & EXYNOS4210_RNG_STATUS_SEED_SETTING_DONE) == 0) {
> @@ -127,13 +126,11 @@ static void exynos4210_rng_run_engine(Exynos4210RngState *s)
>      }
>  
>      /* Get randoms */
> -    ret = qcrypto_random_bytes((uint8_t *)s->randr_value,
> -                               sizeof(s->randr_value), &err);
> -    if (!ret) {
> +    if (qemu_guest_getrandom(s->randr_value, sizeof(s->randr_value), &err)) {
> +        error_report_err(err);
> +    } else {
>          /* Notify that PRNG is ready */
>          s->reg_status |= EXYNOS4210_RNG_STATUS_PRNG_DONE;
> -    } else {
> -        error_report_err(err);
>      }
>  
>  out:
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
