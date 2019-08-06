Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5733951wrv;
        Tue, 6 Aug 2019 14:41:56 -0700 (PDT)
X-Received: by 2002:adf:e8cb:: with SMTP id k11mr6262101wrn.244.1565127716117;
        Tue, 06 Aug 2019 14:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565127716; cv=none;
        d=google.com; s=arc-20160816;
        b=kaH8Gak+OT4TvcSigr2BixtRuHD6JY/JmrVfeLigrgUTKv2WtiDu4e1xcbnglHzvOI
         URUiKvW62+lRnkAcrqskqFQa+Q3hKY2bhy0XshdvwDyyvqT49S6bEFqaZX+iNVdNqUzX
         FXbPF0+gVip2VQ7kONYcHqnfIy3bsCmAtmKlnb6vwgp7Iq1x7/aGMItHsAVsYLu/Ygfy
         K4pqnd6u3MaQ0RkOhdbPCNLfyD5hblhMz9wq8cfBKDZ753CMWaOY1AK44/JhqIbBMgtG
         OvxcoXyXMH35KD0tsqHhVXrgNt0kPOsoDaqTcjooS08LprRtHX+09XYVhRSldbuv926C
         qlRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=1CYu7Mek86EfTJ9NgPT/fCj9NUcIOu8Sf7iL3Hlb4jM=;
        b=xWP2Ruwb4oPJiKQm5hbk9IexXdmXtiSSmw/5ML0vDCKWneJEatn3NzKIasy4K1YDXU
         UBTfcgn8x/gqJeioPKv+8enctH/dbn7WFdBent9he+A+f97ECoF5HEOZmkz7z8Kp6dqF
         roWl7LsAyR8aDEw9WILQVo2lg3AMtB8/bWDDhO4zRNfyA6y73cYG+QMVSbcXYSlRXOPO
         gBwgTtq3wUcF/aBIApeeb28o6DbP1/fhFARjLBjA5zBihfuHUxpZ3fD76Y+SrUcWCMSb
         Fh7N92pEZY3kEDaSts80MBhVWHNC2YKraoojNnI+i7cqDAJMdEJdoZ1T16s9YeTSaTxx
         DmTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a15sor68848480wrn.12.2019.08.06.14.41.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Aug 2019 14:41:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1CYu7Mek86EfTJ9NgPT/fCj9NUcIOu8Sf7iL3Hlb4jM=;
        b=Z1qZU3Vv+HgP3nOyo23/T1NbZIi+K1kgMU7nuvxjEPUWEOu2hsKkPqwMH8jCmXfvGL
         PZ9nrTSoIJqf2/1TGd+qOm/gpRMcFP0eJq9EdyxkxuNroWkVw/gaXlElVqiWvm7XbhDE
         faSPfqNW9MDwepHf/P55KGzOkPA+cSHepP/Hr4Ae2AfOkN+E9VizslCFX3DoxznAuuQd
         FVEl8uG5Nqifww5ySE/Ynuh+LiyPl7SoRMR9w9y+oB6Vc+7siJkwGfT53LTJ1y9Hp70I
         5Gnb6zQ6gWG7gyr8fr95tyD+RxD0VQfUwfrwSaxoUR1LDhIsIEUzG/zcbWrcC/eX9CDr
         3Uhg==
X-Gm-Message-State: APjAAAXQr3L/rW6e5aDkuOrpke1aEkqyqejXuzcfdMjX60lamXktZilU
	pFz7xidZT1jjOPifbrDbmi5+X+RpTjU=
X-Google-Smtp-Source: APXvYqxV11UyCJh3O+WojDYq3LEro0A0l+sN3bPVMBNuAvyBUFSaScmHNCeUuQv0tOt0VXYF/9CSWQ==
X-Received: by 2002:adf:82c3:: with SMTP id 61mr5339774wrc.150.1565127715697;
        Tue, 06 Aug 2019 14:41:55 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [10.0.0.124] ([185.102.219.36])
        by smtp.gmail.com with ESMTPSA id l17sm65920071wrr.94.2019.08.06.14.41.54
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 14:41:55 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 11/67] target/arm: Add stubs for aa32
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <38e14303-9ae6-437b-5875-4e6d930834ed@redhat.com>
Date: Tue, 6 Aug 2019 23:41:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190726175032.6769-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: uBYvZhb7C7xQ

On 7/26/19 7:49 PM, Richard Henderson wrote:
> Add the infrastructure that will become the new decoder.
> No instructions adjusted so far.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c       | 45 +++++++++++++++++++++++++++++++++++-
>  target/arm/Makefile.objs     | 18 +++++++++++++++
>  target/arm/a32-uncond.decode | 23 ++++++++++++++++++
>  target/arm/a32.decode        | 23 ++++++++++++++++++
>  target/arm/t32.decode        | 20 ++++++++++++++++
>  5 files changed, 128 insertions(+), 1 deletion(-)
>  create mode 100644 target/arm/a32-uncond.decode
>  create mode 100644 target/arm/a32.decode
>  create mode 100644 target/arm/t32.decode
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 36419025db..4738b91957 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -7715,6 +7715,33 @@ static void arm_skip_unless(DisasContext *s, uint32_t cond)
>      }
>  }
>  
> +/*
> + * Include the generated decoders.
> + * Note that the T32 decoder reuses some of the trans_* functions
> + * initially declared by the A32 decoder, which results in duplicate
> + * declaration warnings.  Suppress them.

Ah! This has been bugging me with the various MIPS ISA for some time
too... Which makes me wonder if this shouldn't be "generated" using some
option when calling the decodetree script. Or have it notice the target
has dup declarations and automatically emit the guard.

> + */
> +
> +#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
> +# pragma GCC diagnostic push
> +# pragma GCC diagnostic ignored "-Wredundant-decls"
> +# ifdef __clang__
> +#  pragma GCC diagnostic ignored "-Wtypedef-redefinition"
> +# endif
> +#endif
> +
> +#include "decode-a32.inc.c"
> +#include "decode-a32-uncond.inc.c"
> +#include "decode-t32.inc.c"
[...]
