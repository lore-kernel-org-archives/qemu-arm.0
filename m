Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp483638njc;
        Thu, 14 Nov 2024 10:57:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUjWWZytM+HnckaBYzPJ97g9bOlXeX9QFl0FUBnd7jwhmCh17vojllJ8W00p1OuRtfhybH3ylwDzqi9og==@linaro.org
X-Received: by 2002:a17:902:e802:b0:211:152:e1e6 with SMTP id d9443c01a7336-211aba03797mr159423535ad.48.1731610414983;
        Thu, 14 Nov 2024 10:53:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731610414; cv=none;
        d=google.com; s=arc-20240605;
        b=jYjWIoYZwOjj0FL9KhjbwY66/PfdjN2fGHRVVIECbw4gGVsdB9IIhrUqMT0PpDjRdo
         A31qqhJ3cWSXPWqMKvwpxWnMdG6PBUYmfKNxpabPn8r+zY9EoXa/ieFvFkpNkm1MGSPn
         0eo1puW8OP3gKKdDSGjKZj2983EUPnWOZ0kKOMb0Q33uAeluuFjrTGMzyl/EeooEgdQh
         34+uW8YDx+GZU4gN8VKwBl4WO9VR5s0XeM9hf3sXxwiQ4AT278QhaImqKGc3VOJeY+cy
         gUJ2OSUtMeX/YnjSglRCQsjfD7IdyB1tKFsJBcMD7+S3YD/X28LYrnQ8WRthx+wn3rst
         kzgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qWe8wdCJtJEE+3wcEIJF57D3KcM68wdsfhWCbx0SLkI=;
        fh=lPTi2hNnAmfNpHSFoynlrfz7Uj8/ShYPzEdY/psqwbM=;
        b=DPzLSNQlw8f9tfy+rZfxMJ7iMPmkf+8OB7/v/w55nXF5oWdE/ifDI0E4ggh+ZHUpyd
         FYOT7FebjVo6FB7mola/m8QScEToPapoZkYjwiu7PJ9BqcdJRAwTkBAZjtZ35AtWLytf
         GxJP1FgIcF6SKSfvdeQGqs9CsBUIegnfcdrfT9WXcteQ0wgFqxmhFF82FAJU1h/nL3uY
         0S57QEizYimkS6op9K7YdrL40qoLTqiWhEpb7CNc5kiGD1YDv69TrrtTmdvaz649R8OU
         7rUX+59TVPxM+y5wFamcZCZjG9nXzYtuthsFxflrC8uPCLAzrNcW/WHdW+5/yCzXYkfh
         ktJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xyFsVv/5";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211c7ea8cf7sor11840455ad.17.2024.11.14.10.53.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 10:53:34 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xyFsVv/5";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731610411; x=1732215211; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qWe8wdCJtJEE+3wcEIJF57D3KcM68wdsfhWCbx0SLkI=;
        b=xyFsVv/5J5mjfwxL0uLT21UZZNxEa1I0zs+Q8dXP/b0qAVLqCg+cNQr+dqA+Bd+BVc
         Cl+EsvBBQNG/353s9ydNV+8DF2LY71o0Nw+jfMNgXUbdSi9dcVuhfYxCq7R3dvFyFpv5
         buyWmvQEqW+3cFbouVCs1zEGxmg2T8kXC1YrpAyrmo+92l8vmoznrQ2AARq8b2ldMEE2
         g0f2LY8Iij7mqea2fzKSw70Oa/+lfukD0nd0AEptAdV1C0tc7+ZA1gpDmDx0ZTg9zFNS
         6v5s/MaCMpDh45ctmIAoT2a3ODpTwukhQM5KPLXStaDab7KnXrJo0ciEiHExsiKWTM5l
         QGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731610411; x=1732215211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qWe8wdCJtJEE+3wcEIJF57D3KcM68wdsfhWCbx0SLkI=;
        b=WLUWvZYcQqcOt2HQbhefuxyTl9DGIvuLjxuWAMoRlYdNiDkzrXicvTry7/zJ14uAol
         l67HjKIh0ocoPOxPUSxrXn4AXnFh63hOlG2XT5sNrsm2QkhsldtO0pP0oOVY/HVn/Qws
         tZyHP1wI6FTz2C0m+cR1pkwUNK+YHng6w5gxRd6ZOIgeTYjD3RPFsxI2UB8oZe98mP8y
         TLM0HDnVB01tYp2lSMzT8n5Mg7b7URPEY53TruTuAXHLBC8LaJ2V9x9ebKVu9XKJDZbP
         FhCWQS/mOIh6tpw7C6qQkWRscyctTwFfoCazzknrv5fQ+fcE+5KbhK0Ofpiiw+P/KI2T
         P06A==
X-Forwarded-Encrypted: i=1; AJvYcCX7dAlTt0NbW8YA71RzhLSvuXol+uotF+KsEBJa+mkw/xuSAJcBDNotDEr5x08TGG7ABC+74B0UbDFf4A==@linaro.org
X-Gm-Message-State: AOJu0YyGioGDyOgoyVfpeiFkBBVLY05neRvEG8RyfcNbmpp7mOOms5ET
	keia10lMeOMOENHhTC9mxkp23kajGC1K91Ypa503qRjFafUT4jPkZRZVTEovbk9WxA==
X-Google-Smtp-Source: AGHT+IFYc+lZ9JR/jOjaOqDgH8QC4Q2CAiEQjpD4OMPTEFNMRZB11/CpHkBA0H2vMWiq2CYxKNepQA==
X-Received: by 2002:a17:902:e802:b0:211:152:e1e6 with SMTP id d9443c01a7336-211aba03797mr159419865ad.48.1731610410876;
        Thu, 14 Nov 2024 10:53:30 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7d219besm13909595ad.225.2024.11.14.10.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 10:53:30 -0800 (PST)
Message-ID: <a49b2d9b-e8d7-4409-a001-af81d722b536@linaro.org>
Date: Thu, 14 Nov 2024 10:53:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/24] system/watchpoint: Include missing 'exec/cpu-all.h'
 header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-8-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 05aWo9cwOvH3

On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
> TARGET_PAGE_MASK is defined in "exec/cpu-all.h".
> Include it in order to avoid when refactoring:
> 
>    system/watchpoint.c:52:24: error: use of undeclared identifier 'TARGET_PAGE_MASK'
>       52 |     in_page = -(addr | TARGET_PAGE_MASK);
>          |                        ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   system/watchpoint.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/system/watchpoint.c b/system/watchpoint.c
> index 2aa2a9ea63..f7366574a3 100644
> --- a/system/watchpoint.c
> +++ b/system/watchpoint.c
> @@ -20,6 +20,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu/error-report.h"
>   #include "exec/exec-all.h"
> +#include "exec/cpu-all.h"

This uses TARGET_PAGE_MASK to choose between flushing one page or the entire tlb.  Better 
would be to use tlb_flush_range_by_mmuidx(..., ALL_MMUIDX_BITS) to flush exactly one or 
two pages.

That said, I've just noticed that tlb_flush_range_by_mmuidx does not properly handle 
addr+len that are not already page aligned.  That can be fixed fairly easily.


r~
