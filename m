Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1492450lfg;
        Sat, 15 May 2021 12:25:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWlFGARWzen9QFxObvQ4hYdl0mr5R/HDOWEtS1/FTqdulzy+YTFFVJrFxS831rtG118h65
X-Received: by 2002:a7b:ca42:: with SMTP id m2mr56258817wml.67.1621106750771;
        Sat, 15 May 2021 12:25:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621106750; cv=none;
        d=google.com; s=arc-20160816;
        b=eyS5heArZzfSqjLoHVw9mAzRuiAt3AxAf1iCBdZGqL5MhTmsNQQvm6a2OKUXT2Bo8s
         zN+NjFvU+pvWnY7sPzukT3vPGL8WZ6a2O8AuzFlEhi9u3g/hSk1+V2Y4GdcatmL2+EEL
         tS2E93rqy1oL7iX0lEA9+/nZthmt2ZyVjbmotVTeZ0MdHAb93GR2yyBxhL+M5VabFI3S
         mXapCttFVvcsVWa3RJE1nSL4b/znNYTsRuZrQoG0pFSDWTTyTLhqcw75ZUhGIc7xOMmI
         XVIFz2WVmq6mFzXCmfwaFDuUfIcd/xYVQn46lF2kfgYXN3NaFryogoXN0QtIx9iEI+gV
         e7jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Hg+dhk712hL71XWdQne8Tp9fkT0sRnAthFo7PXH2TXk=;
        b=J0eiUgCHMqb01WlDnoea5qC3pHlMT5FqqDnClmnx9hqx0BCR/RuDeIkS67/0Ljy2Y6
         K7iYCwOajbEmwqaSKug/6ta4tq5DyfStLEeGzOcppGlGLEeIpic//gR0iww0QX950lTE
         FseBbcAfI+xZv4DNFG6u/wthT5lIb+f+xlRHnR07YGxkLT3fDIfKobXIWKVWKnsePqFU
         5oz186cjstDJGWUlbI2pPoyChfW1loelN3V+bh/6kaXR74LNTeP6BysrZacCjr7rPC/0
         9lhUdWCodIwlFwHXycuWjm96lAT1x4F5gzY0VJbZDP2t2leOW0Ru9MpnJkO14cxdco54
         3jfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.134])
        by mx.google.com with ESMTPS id m13si5063241wrh.11.2021.05.15.12.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 12:25:50 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.134;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from [192.168.100.1] ([82.142.12.230]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MysiI-1lVZhX0LAI-00vwVn; Sat, 15 May 2021 21:25:49 +0200
Subject: Re: [PATCH v4 17/28] linux-user: Remove dead code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
 <20210303214708.1727801-18-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f6b4d61e-5b70-2d9d-1943-a848374f7759@vivier.eu>
Date: Sat, 15 May 2021 21:25:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210303214708.1727801-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kBYrzGuOYGorR32jKX3wzuZFhjzlWIm2J4kEHCGlovAT1p3/66O
 1aUNH3JfSvZDo9DlyBOcspIkZJ0eoIvEVgzP89aUBYtqvf5O0qYGjQ87c6ynw9KVyBCg9Yq
 CHqjiF3T0gdbRMBcFVdWo51V/YK5VdNqVz25Ps2s0sTzPUA3i+dCeT6Ltpx7Tn4nboves0x
 qhKz6afCn/RBdZXhxzwKw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:d5evw8aclaY=:XIaYfFh2dkD4ww/zAnr8Tz
 h84Zv7AJrAYW77u6LjYwoemKXUZublIBuBj6WYLdBZWtIUngWEFmz1k/DE+N3B+pH15kkdfts
 6rm5aD3xQmNe0QCVxXRlABrH6LtRDB30cIbO3VblMmWuvNP7dR2eiyL4/gd3pI070mUg0jfxJ
 IsqkEevGExcMsWojtFopLLIjQI4v/2/vkz4nIkpnzUmMUrXHLwVK6ysZfmXetspcR5OaEIHOl
 qWPl+lek92EQFPa7vatO9etGzvTCYcGL4p1Eh4l/3aDX53epTuiI09HbXIAj2hWPn71g0XvJF
 6ug7qnEZpzChTSAgHpm9i4ZNgGsD0oB+uc7+K8LqDc99VkBfgOSpZXwZJIkO/0paE8HPdrT27
 Q7GxySApHCP4yYS3ALcL+LCeVLJKNu/nZvv/ZwS0Z+gPhcMXnpCagxRHkk9bg4fWo3SUKwWCw
 xELfFZn/fZHeTu8MyMM9wnICnoCxEy+HYRYgdZPKmjMnNtLJAnkSSR+B3Tb1mAxWFMhAH5tEt
 hl4ilueQNp5ac/GW01wrjQ=
X-TUID: dLoVVizqX+qL

Le 03/03/2021 à 22:46, Philippe Mathieu-Daudé a écrit :
> We can not use watchpoints in user-mode emulation because we
> need the softmmu slow path to detect accesses to watchpointed
> memory. This code is expanded as empty stub in "hw/core/cpu.h"
> anyway, so we can drop it.
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/main.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 81f48ff54ed..d7af3ffbc22 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -200,7 +200,6 @@ CPUArchState *cpu_copy(CPUArchState *env)
>      CPUState *new_cpu = cpu_create(cpu_type);
>      CPUArchState *new_env = new_cpu->env_ptr;
>      CPUBreakpoint *bp;
> -    CPUWatchpoint *wp;
>  
>      /* Reset non arch specific state */
>      cpu_reset(new_cpu);
> @@ -211,13 +210,9 @@ CPUArchState *cpu_copy(CPUArchState *env)
>         Note: Once we support ptrace with hw-debug register access, make sure
>         BP_CPU break/watchpoints are handled correctly on clone. */
>      QTAILQ_INIT(&new_cpu->breakpoints);
> -    QTAILQ_INIT(&new_cpu->watchpoints);
>      QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
>          cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
>      }
> -    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
> -        cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, wp->flags, NULL);
> -    }
>  
>      return new_env;
>  }
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent
