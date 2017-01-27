Received: by 10.25.77.65 with SMTP id a62csp324881lfb;
        Fri, 27 Jan 2017 08:49:50 -0800 (PST)
X-Received: by 10.202.231.204 with SMTP id e195mr5499386oih.141.1485535790623;
        Fri, 27 Jan 2017 08:49:50 -0800 (PST)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com. [2607:f8b0:4003:c06::243])
        by mx.google.com with ESMTPS id n95si2240774otn.71.2017.01.27.08.49.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Jan 2017 08:49:50 -0800 (PST)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4003:c06::243 as permitted sender) client-ip=2607:f8b0:4003:c06::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4003:c06::243 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: by mail-oi0-x243.google.com with SMTP id j15so21031598oih.0;
        Fri, 27 Jan 2017 08:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=LcyBEvp+Cp3GvNZXtGeCb1uNsYaAu932L6B7th7qVaw=;
        b=AqGGu/TnYcsZZ94PAk9mICtHxkGd/1pXaW4MK85+8baYT95hsjJmFPENs4bYQq1TGA
         E5BlkDbsVJVW1nWR2dTncM8F0QpeP8IXQ5ynm6Pn5YoXt/63LaFjyAxju3eQI1VbYLBu
         mwLw64uaf5HcOW/nYMpfmCMMZtKRrZ0WHVNhBR5248yhqVqe3Ghv2NecfLxhT22kAN+J
         hrQ5vjnUqfGxJ+lEkyZPpRLJ3XbgPrbFYN+fzUPEtnXjpFGpOukmxD/9P2uX42+Bmheg
         OGY0LcaIDX6II9JGScmLRCj7tAAslwyIJ0rZvRYs/WZXQZUaHD05QhlZ3MLa3AX9D19J
         IOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc:content-transfer-encoding;
        bh=LcyBEvp+Cp3GvNZXtGeCb1uNsYaAu932L6B7th7qVaw=;
        b=jMtnRvmwWoDG+z1GllLYHRUCKXb0qcP5V+OoXbjGHPxKagbPjcOzOIgQV5PgyBV8Lt
         PF62x7Y+y3k9xUD3/lp0EMNBUoS6idCV5jOgtNbimu+6S4SUPArhlHeRfwPeO+u4cBDx
         Rc/IwMblBE5yewFvOebfOGG1I9zu6sLtFFKGIkHI2vyRZ6mMpEWnVitdyCtYQwtfT0G5
         /2KNGzVEEpBQWD/SM/Em5Vfa7agbeVIRk3Fk7x4Z46oDHm0VpO8FfDKLgiTjCUe9fUbB
         ejEE0eeEffbl2Sn018gNpQAlfgoheetoA7gaTV3voj6w5ZKR3hRb14u7SGsJWsn7mO1R
         TLjg==
X-Gm-Message-State: AIkVDXJs8ZUTTJpFZlnWcmE4Z74i8nhjoV5ih5XwJLJkZlZQQ8Y41gUBMBl76objFhzUvDURfjqaYVsJ6wJ5qQ==
X-Received: by 10.202.182.198 with SMTP id g189mr5669338oif.180.1485535790114;
 Fri, 27 Jan 2017 08:49:50 -0800 (PST)
MIME-Version: 1.0
Sender: bobby.prani@gmail.com
Received: by 10.157.2.70 with HTTP; Fri, 27 Jan 2017 08:49:19 -0800 (PST)
In-Reply-To: <20170127103505.18606-26-alex.bennee@linaro.org>
References: <20170127103505.18606-1-alex.bennee@linaro.org> <20170127103505.18606-26-alex.bennee@linaro.org>
From: Pranith Kumar <bobby.prani+qemu@gmail.com>
Date: Fri, 27 Jan 2017 11:49:19 -0500
X-Google-Sender-Auth: XG-9CuprnF61y6yc1DFWLG0d-FU
Message-ID: <CAJhHMCDAf8UqjO6m5RM3Hasdsf4_1FPnqibtRwYkips48tQCvw@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v8 25/25] tcg: enable MTTCG by default for ARM
 on x86 hosts
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, "open list:ARM" <qemu-arm@nongnu.org>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: J/UOn4LwVjvr

On Fri, Jan 27, 2017 at 5:35 AM, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:

> diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
> index 21d96ec35c..536190f647 100644
> --- a/tcg/i386/tcg-target.h
> +++ b/tcg/i386/tcg-target.h
> @@ -165,4 +165,20 @@ static inline void flush_icache_range(uintptr_t star=
t, uintptr_t stop)
>  {
>  }
>
> +/* This defines the natural memory order supported by this
> + * architecture before guarantees made by various barrier
> + * instructions.
> + *
> + * The x86 has a pretty strong memory ordering which only really
> + * allows for some stores to be re-ordered after loads.
> + */
> +#include "tcg-mo.h"
> +
> +static inline int get_tcg_target_mo(void)
> +{
> +    return TCG_MO_ALL & ~TCG_MO_LD_ST;
> +}
> +

s/TCG_MO_LD_ST/TCG_MO_ST_LD/?

Thanks,
--
Pranith
