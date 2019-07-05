Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3329691wru;
        Fri, 5 Jul 2019 09:14:41 -0700 (PDT)
X-Received: by 2002:adf:e803:: with SMTP id o3mr4754007wrm.69.1562343281448;
        Fri, 05 Jul 2019 09:14:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562343281; cv=none;
        d=google.com; s=arc-20160816;
        b=NwkOxuG7xGPREK6sOnfxmgtfw2I6+6i27GkEdpweG156TCOcMjlP/FUXJKBMnCOBjp
         r68dGeNhrH51D5nMJoSS5h33WTqnea5dR4iDrE/ih+EYD0dXzHpi/1CNe4RufYws9vQq
         t/xfNcdWhkfDnZ0MyOuObWXFdrXHQupnhFGpyFczFkNvJ+YZTarOxIVk5nAbkF+YZvLi
         lbjnndsLwicjgLnvcLg/u8rrC0NZiDRSr1KrfpH+I3JupO+4f9CWd6QxxR2DHzUAmCkI
         PfbKnnidh2tm2DMuR3rnjs/BOvwTCdRB/Or+0H8YyVLe4Sm3eijfdcVlc8bbYSYG6uk4
         IxRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=1ZZYlzSCLdv4OPWBTYntlE8HOA1NAm6/dTGWgZtWsKI=;
        b=PG8acFhy1deVw5b/HE+yf/WMAf3zRKVSubX1qSGbASASSJg2EXpVu2UfU1eQQ8d5i/
         TJylHnYQMUPGcm3oNsu33ZDWB32eTv6wEqWNo76Ag6vDnn0zztrqX79VLNuHf+f5Q9B3
         VHYT2FV3o+s3orHUXyCrmG3GWySVLnC+v3RFl7v9j8FHsT9IvcjnDevwK2FvXFuDn1kC
         Li3SQSiRCRJagdS+h8DgiHpRX66bqBpgRII6GNn+HGquFquRjkS+WRQFnZ15vlPq0SYe
         ZyXeqGZnRl9edpluplUW0gXOvH97Gi+xeGhkhUOzg3uwuVWkx/hnREEerEABx19JaA63
         FZNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b131sor1072864wmg.27.2019.07.05.09.14.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Jul 2019 09:14:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1ZZYlzSCLdv4OPWBTYntlE8HOA1NAm6/dTGWgZtWsKI=;
        b=EUBiRsK0O+4u2DbnP+BF9OD3rBo/H0J7abffArCP2Rs2hWKJRSvX1/X7YjkGk0zHQU
         cQIb15lMf2iU66BOgkpwEs+pTTHUxE/Ao8URFokBJ0wEF3d0NzRYN07sRBx7cJz7P+vl
         BgRZ6srNGEnZtnshu75piEEwrsFDqb3Vw3BQmLSc+JIJwmnHxb5AhOEv5Jmh4JlelMSk
         zkQLKbQENsz1xEN7d70hXDVyRQ0u26qO3CMYx+6wSdppE6NOwTsPEeWCxmtcDV09h79P
         MiWC+5LZoeO92h/emtdlaAWWHjoFiqPc44qWnFpDJiE4qm2zgSVtc6sup6Zh8Ka5HUPe
         YNMA==
X-Gm-Message-State: APjAAAXeshZLf9sLZwHMhgfNdowlKoyjFbMEjHSCGIq/xMWTr/IYIgYf
	QJuDBYimUM76etHTME9ZCLocv4dUZAg=
X-Google-Smtp-Source: APXvYqwrWx52UrhB1unI9KFv1Ev5C5ygZ327eKMVDxESM82U3TF+DJ5xiGzt8UKASXlCm7FEl/4C1A==
X-Received: by 2002:a1c:6a17:: with SMTP id f23mr3990060wmc.91.1562343281236;
        Fri, 05 Jul 2019 09:14:41 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (56.red-88-18-140.staticip.rima-tde.net. [88.18.140.56])
        by smtp.gmail.com with ESMTPSA id y6sm7002226wrp.12.2019.07.05.09.14.40
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 09:14:40 -0700 (PDT)
Subject: Re: [PATCH v1 4/5] gdbstub: add some notes to the header comment
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20190705160421.19015-1-alex.bennee@linaro.org>
 <20190705160421.19015-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d72546fd-b37d-9175-e871-2c5ad207a060@redhat.com>
Date: Fri, 5 Jul 2019 18:14:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190705160421.19015-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: u7vaTTGlzEE4

On 7/5/19 6:04 PM, Alex Bennée wrote:
> Add a link to the remote protocol spec and an SPDX tag.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  gdbstub.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 8618e34311..ea3349d1aa 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1,6 +1,10 @@
>  /*
>   * gdb server stub
>   *
> + * This implements a subset of the remote protocol as described in:
> + *
> + *   https://sourceware.org/gdb/onlinedocs/gdb/Remote-Protocol.html
> + *
>   * Copyright (c) 2003-2005 Fabrice Bellard
>   *
>   * This library is free software; you can redistribute it and/or
> @@ -15,6 +19,8 @@
>   *
>   * You should have received a copy of the GNU Lesser General Public
>   * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
>   */
>  
>  #include "qemu/osdep.h"
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
