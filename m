Received: by 10.25.0.147 with SMTP id 141csp365178lfa;
        Fri, 3 Mar 2017 10:10:25 -0800 (PST)
X-Received: by 10.223.178.205 with SMTP id g71mr3642267wrd.158.1488564625932;
        Fri, 03 Mar 2017 10:10:25 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com. [2a00:1450:400c:c09::22d])
        by mx.google.com with ESMTPS id e203si3867929wmf.29.2017.03.03.10.10.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Mar 2017 10:10:25 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) client-ip=2a00:1450:400c:c09::22d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x22d.google.com with SMTP id t193so21558717wmt.1
        for <alex.bennee@linaro.org>; Fri, 03 Mar 2017 10:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5VE6QeQCBrehcijjVQQn6zlfWbaV3Scrw11HTNaXRLs=;
        b=Cf4/jJr5lDaZ3dqznws+IuNP2Dw/8s+DCMIAj7m+pTAEI86THphU1TNekughWYi/Hk
         S8cDOeS6BYioE9qh/lPwZIQfRqHCbd0VsZIJN91KaTBbKsc2Fz4NXW1zKHvahK6qT+/L
         KqUVV4GJx7cwtZ5cw+qC03TJ4NvDtwu8JCLI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5VE6QeQCBrehcijjVQQn6zlfWbaV3Scrw11HTNaXRLs=;
        b=oGboWOL6ozzQgvbmioGuh5vwSIflPqmyb6E4eDSbXKGgZ7oPGbV3XlT2qEy9N0XUkZ
         DdIsrQ2/LMsBhRufp//QTESBhjFXHCfWv5rq7hMIl428tlp04fqjHFbptqFHl/Y9jKrv
         lCwB3n6xhiWq55ZSmaIXVMjmw4Gb4UPRCZanQL/PTA2lH9I4xYXisMTnw6XN0C8d0CAi
         X2yM93MaWyRE96vwYsgxpR4t7aN3hJAL4ppbmgHWGu1RrKK+zlcL0rq2ETiD657FJ2pB
         0MPCSdpSGxR4ZV9xGeppWw4+74uucqB5KppON2r4wtn42H6f1ROrsEAAdyiTWueZ7wpX
         KulA==
X-Gm-Message-State: AMke39lLsK4vmJCn6D5ZCPBM0s5qsbZ5Mtmid+/LwnxUhDlO+MoVeiuq6RlfTUm7ZjOGpADD1w/NJlMPDhez2wL8MWc=
X-Received: by 10.28.157.67 with SMTP id g64mr4087704wme.111.1488564625701;
 Fri, 03 Mar 2017 10:10:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Fri, 3 Mar 2017 10:10:05 -0800 (PST)
In-Reply-To: <20170302195337.31558-11-alex.bennee@linaro.org>
References: <20170302195337.31558-1-alex.bennee@linaro.org> <20170302195337.31558-11-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2017 18:10:05 +0000
Message-ID: <CAFEAcA_BwXYnPfb36pXGd1u3dnyQce6Wm4M+1UqgJkpMFpDddw@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] target/arm/helper: make it clear the EC field is
 also in hex
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, MTTCG Devel <mttcg@listserver.greensocs.com>, 
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	Alvise Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, 
	"open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: eN8aBTqer/4B

On 2 March 2017 at 19:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> ..just like the rest of the displayed ESR register. Otherwise people
> might scratch their heads if a not obviously hex number is displayed
> for the EC field.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 3f4211b572..76b608f0ba 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6857,7 +6857,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
>                    new_el);
>      if (qemu_loglevel_mask(CPU_LOG_INT)
>          && !excp_is_internal(cs->exception_index)) {
> -        qemu_log_mask(CPU_LOG_INT, "...with ESR %x/0x%" PRIx32 "\n",
> +        qemu_log_mask(CPU_LOG_INT, "...with ESR 0x%x/0x%" PRIx32 "\n",
>                        env->exception.syndrome >> ARM_EL_EC_SHIFT,
>                        env->exception.syndrome);
>      }
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
