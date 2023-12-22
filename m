Received: by 2002:a17:906:3017:b0:a26:c056:f233 with SMTP id 23csp16455ejz;
        Thu, 21 Dec 2023 20:37:34 -0800 (PST)
X-Received: by 2002:a05:6808:3847:b0:3bb:74a5:4774 with SMTP id ej7-20020a056808384700b003bb74a54774mr1067476oib.20.1703219853839;
        Thu, 21 Dec 2023 20:37:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703219853; cv=none;
        d=google.com; s=arc-20160816;
        b=HVC0jqii1mF7zXwNFvYOEEaqWFztZHGEoIguPHNfhUFulJURPMBhN4CO4fYqEXzEAY
         anvhYM+ydb2WQhhnXFSiiWY+r6yt6o6f1O8SHinC5Yo7LZlpu70VRT91A571sVKTkaXZ
         DGq5OTVWBBHA+6787Lic03DOlDsCHvKPjY7IuqSPn7d58TAv79FtD9EWwr2NM1xYm4z5
         aVdkaF5tJTaCZBahIcDVXHoxoegiaoeUJ8nLS1ewjVwst9BjQ9OxxsGD8/uaSYFhon0X
         5VysuwGuK02JNPqcI0uHSwIMlkH9HRWdrf/EiCsZFT96/mSLkqG+WRfH0CkixzzW7GrR
         x7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=6vCrTpKSPPE7AfY3YWMhSKqdsTSH0jQJ5wDqlM3mFIs=;
        fh=hy0XZNBjKm8+nfYjz+Vu5MJu7wlLZT1L9ZH4fkol/uk=;
        b=zEODIwc1810vF5sidw3ywRxhvXrfepNT9gnFdoe1mjgbN1caUEi6SqAIl5kFB86+o2
         R2IJrT2p/jBW4tC365VdIl26mezUupv9tR25mLw4nqAS3HTNaJK5antcvfgrYNtI7nxI
         BvhkZIa461zv5FOvTOUDiAg/uhFCMUbZDHN/T4Hu9Mt/UMq9H7uXJN29fy2q/Nb0j4qa
         eqo6mkjltkTiV9y8m3ioJ9N7tm+amrnClKexwtpIN2weobtkf+KSvVfNKsJTa1YfjZcm
         ClIEDxeSCfYf/Vj56umQCrmCyrxX2B9J9HuKOA1DaDIs9D3GinwVoK6aEI1kR44Jwd9b
         jIKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=WjL9Obk8;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <npiggin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t27-20020a056808159b00b003bb787237a9sor1880430oiw.11.2023.12.21.20.37.33
        (Google Transport Security);
        Thu, 21 Dec 2023 20:37:33 -0800 (PST)
Received-SPF: pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=WjL9Obk8;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703219853; x=1703824653; darn=linaro.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vCrTpKSPPE7AfY3YWMhSKqdsTSH0jQJ5wDqlM3mFIs=;
        b=WjL9Obk86EHPFK5bYKJSzw32lWIJrl9nXftpBdNDE385/Mybd1RjkvoQfO+KLPHF8k
         4OFoWu01ByhbROzJwyhSxi4N2WSW/tvu41kcfte3bH4+4ItYkz3KZCEKmQ0D+kHbnffT
         D65mPHmClBpkOQooBUAd8rLebSe1PlGOHcwrFYiYrF82cU4sjEuTMy3sqwm7CafTsl9E
         M0M6YEhQn/N4Z7T/yAJqESRCAEzjNB7W9M3/hGpj4HI/GJBoZWMenZgUOdBIva5/RKVu
         rawBqmalYpgKzHnuCXOcgwfZ4T4J1BZGFiC73mxG2GXQIohJ3mAaJzeQD5G3gfhALDvo
         7k8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703219853; x=1703824653;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6vCrTpKSPPE7AfY3YWMhSKqdsTSH0jQJ5wDqlM3mFIs=;
        b=BmDL+xRCG3Fddyv3k2s0WtZEjaUwZkr8awgUP+Ywbk4Dlu1Olh3l+T8U+gbZFUQxY1
         3wmpKyQKzcqoOM1PNYz1n7FfBo7ZE04yQi/Uyz7rh8F+oD1nXXMb/78BE+RBUsCeBr1o
         vmrzNejXPaDrHbn2ZvT58SqTudM9Uw3Dhg7aas1qJ/hVw1iVyx6bm8SKiKjFrY9MeQ1I
         1Xi19km8ebaNgy05NoEYump15liLrk2ztZNtDoG7JRsgOH1OJkjUzqwKrVo7iFjaRwmQ
         yxEJ/uV7RJE4xirME5bsgs6DaaDHiJk4r9rx5g51DSxKnG3HIpT34zfeshz+VOLUX7YA
         CrWA==
X-Gm-Message-State: AOJu0Yyx7AnovkteFUvvWzcX3vC4RdHuW1DUkxIarR7wsjDTgV81UW0s
	HMVOMlEdlJgHmi4H9G3y6/+AyO4Z2e8=
X-Google-Smtp-Source: AGHT+IHyqKiLgDwap+e6Ff1oyWMkk2SvYahvVlCSei8SjPQGCsfhaHRHE2GxXfgIrKsVJYfS3tj9YA==
X-Received: by 2002:a05:6359:4c19:b0:170:ec2e:4367 with SMTP id kj25-20020a0563594c1900b00170ec2e4367mr1074635rwc.1.1703219852827;
        Thu, 21 Dec 2023 20:37:32 -0800 (PST)
Return-Path: <npiggin@gmail.com>
Received: from localhost ([1.146.126.39])
        by smtp.gmail.com with ESMTPSA id d18-20020a17090b005200b0028b2ff2208esm6384674pjt.19.2023.12.21.20.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 20:37:32 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Dec 2023 14:37:19 +1000
Message-Id: <CXUL1KDTLCWC.3N2HSO3O5U9LM@wheely>
Cc: "Ilya Leoshkevich" <iii@linux.ibm.com>, "Peter Xu" <peterx@redhat.com>,
 "Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>, "Peter Maydell"
 <peter.maydell@linaro.org>, "Mark Cave-Ayland"
 <mark.cave-ayland@ilande.co.uk>, "Eduardo Habkost" <eduardo@habkost.net>,
 <qemu-arm@nongnu.org>, "Paolo Bonzini" <pbonzini@redhat.com>,
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>,
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?utf-8?b?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 <qemu-riscv@nongnu.org>, "David Hildenbrand" <david@redhat.com>, "Warner
 Losh" <imp@bsdimp.com>, "Claudio Fontana" <cfontana@suse.de>, "Brian Cain"
 <bcain@quicinc.com>, "Daniel Henrique Barboza" <danielhb413@gmail.com>,
 "Richard Henderson" <richard.henderson@linaro.org>, "Thomas Huth"
 <thuth@redhat.com>, =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "David Gibson" <david@gibson.dropbear.id.au>, "Harsh Prateek Bora"
 <harshpb@linux.ibm.com>
Subject: Re: [PATCH 09/24] hw/ppc/spapr_hcall: Remove unused
 'exec/exec-all.h' included header
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
X-Mailer: aerc 0.15.2
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-10-philmd@linaro.org>
In-Reply-To: <20231211212003.21686-10-philmd@linaro.org>
X-TUID: hz+VAxUyw9XK

On Tue Dec 12, 2023 at 7:19 AM AEST, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  hw/ppc/spapr_hcall.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 522a2396c7..fcefd1d1c7 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -8,7 +8,6 @@
>  #include "qemu/main-loop.h"
>  #include "qemu/module.h"
>  #include "qemu/error-report.h"
> -#include "exec/exec-all.h"
>  #include "exec/tb-flush.h"
>  #include "helper_regs.h"
>  #include "hw/ppc/ppc.h"
