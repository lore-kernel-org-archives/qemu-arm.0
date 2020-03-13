Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2612051lfc;
        Fri, 13 Mar 2020 13:03:12 -0700 (PDT)
X-Received: by 2002:a67:71c3:: with SMTP id m186mr10666737vsc.6.1584129792726;
        Fri, 13 Mar 2020 13:03:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584129792; cv=none;
        d=google.com; s=arc-20160816;
        b=VjJlOJ3MpBxbSb7F9JdXvOO83b3Z4YyHbqszBOVTisFtXEEU5Fkhm+qu8qmdJTPeph
         wQRQJPbi0mKOs4VUv0TyeHGmabLWVixb/Zz/5vlnbgLGFoazFnNkh/XDxsywfAvHKRu6
         kUVXAvZdB+otk4CRzB7tHNT4CKDbSBj/kvJMY2xzaZvQRIUZvFZMmTz4ZkfGkZytQT/Y
         jvx0BAlqGqfWV2Y2MeeNLuRdox2au8Y4isxYlA8SR1i7jrjxz05qh/FL0IoZNiuI3058
         jPLjsXeYKICd2rcLctg+nNLDrnfoSKbgMc3VGNj9ccXNc6u3rLOWNegaoy8KYp/oTjwZ
         7uRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+AMKrNV8pQ5JeLYHHAPiXeeRhvz9n2pjmBLgaO+ouSw=;
        b=K+dfqzdmGu3nlLqzKpSPnUZpaa9lion/lQFWvr/px996c4MWT9D5V761J/AD5xaXpZ
         3xFLbKb3c2J6uCrRbTia6LnR+BI+/apLLOvvaRuuPXODOEoogjrRYORwI7hHrVU8k8bw
         zjriHf931JSg0Ksq/fY8tTNBtmlzNzt8vWcvdnBidWuXZp4x/PScFko7YXOlIVexyf2m
         lO66efpk7X/IK6mOr2FjJaPDCoO+uu1NVA6Vqq2xF0rZ4uylwTpobq42YBEcwcq8KfaQ
         S2VDsZ5NhZz9Ji3XkOlmEw1jkmJJZRPXPyjl3SwfR9p7rWa+YQncaxQ7Y8WW/DLuGgkf
         fzpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=N40Qzfdd;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f76sor4621214vka.29.2020.03.13.13.03.12
        (Google Transport Security);
        Fri, 13 Mar 2020 13:03:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=N40Qzfdd;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+AMKrNV8pQ5JeLYHHAPiXeeRhvz9n2pjmBLgaO+ouSw=;
        b=N40Qzfddch3qZyldQfuH1n680Y219RPZaxfIjp65f8hHZfZB/5w53nU1s1pep7Y/yo
         ZDjE0xcwmhb2hudLix0JvLUolOFOX2NihEXIrToBw/y/An8x+LXqPZU3hnCl9YdxMK0E
         ArzpsoSPrfHz1FBZ1N+KuR/ezoVhXQK7yrsZIEgwErqy3LYWSreWBjXQegU6vj58eXL0
         O/eWNCDuBE6h/VlukC1nbwKGw4NMqk2IaE9gHY/MK/jrAtcc4wIdja64DkfnukWnZSg/
         0NVTjt35/Q98vk4aZTSeVKmPhymU0Tl5ysw5bw2i7sXmmW9wqCtJ7ymtZVn8eRRz8ZLd
         v+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+AMKrNV8pQ5JeLYHHAPiXeeRhvz9n2pjmBLgaO+ouSw=;
        b=njh72oDQmgWf+QpahhqvUXjdpcWJDISq9bZp5EHTHcrzjBo9UJDvWKQydRTptCsBKV
         UAG+HIh/0shqDuLWOgUv2+Ks0YIooKhbU8hZjG/5zc2D6GlCF2Az4+nEZ0lUUuHkJ5Cz
         y+2cPaOW8Pz1P4qJJ2JC3thHvlMMidqQt7e8pTXLeExZxMGUWkXdS6v+pvkRt5fF/JI8
         fUJLjJqblgPCQbhhoxXbG1QrI1lZ+oFrgCErKlGokrEMuPcWf+v+FgQ/cB6dAWxhXt6p
         CjEM2RqMH6RVHXPA+/N7eoYyJMSqC4hTrLgfFrwaHJfTMEM+D5LIUKb3rrWVNsdNL1CF
         ga/g==
X-Gm-Message-State: ANhLgQ3Y+dCakCCsTxgmrcv2dSp/aYGoV5iq+m2A2OCbq8xeJIhCFkVf
	jiMbKJEma6nJOFR+j9n4cILQ8p++AGyor2J/yCg=
X-Google-Smtp-Source: ADFU+vvhsWbz1sUVQQ83PHvkTJKNsllisjVhdd/dXDv8tkh5teOi4R5U12lngcxs0+xv5SZidzy7V0PkpZCut0lL/WE=
X-Received: by 2002:a1f:5806:: with SMTP id m6mr9995562vkb.37.1584129792299;
 Fri, 13 Mar 2020 13:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200313183652.10258-1-philmd@redhat.com> <20200313183652.10258-11-philmd@redhat.com>
In-Reply-To: <20200313183652.10258-11-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Mar 2020 13:02:46 -0700
Message-ID: <CAKmqyKPcUFuwoGaYFruUFe7=0uxZPykRpsGA1e+Os0APLZ-jjw@mail.gmail.com>
Subject: Re: [PATCH 10/14] arch_init: Remove unused 'qapi-commands-misc.h' include
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, David Hildenbrand <david@redhat.com>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Cornelia Huck <cohuck@redhat.com>, 
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x <qemu-s390x@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, "open list:New World" <qemu-ppc@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: eSuEvXpVb1QN

On Fri, Mar 13, 2020 at 11:44 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Commit ffaee83bcb2 moved qmp_query_target but forgot to remove
> this include.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  arch_init.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch_init.c b/arch_init.c
> index 705d0b94ad..074fa621b6 100644
> --- a/arch_init.c
> +++ b/arch_init.c
> @@ -27,7 +27,6 @@
>  #include "sysemu/arch_init.h"
>  #include "hw/pci/pci.h"
>  #include "hw/audio/soundhw.h"
> -#include "qapi/qapi-commands-misc.h"
>  #include "qapi/error.h"
>  #include "qemu/config-file.h"
>  #include "qemu/error-report.h"
> --
> 2.21.1
>
>
