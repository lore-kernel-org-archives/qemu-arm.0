Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4018796lfc;
        Mon, 31 Aug 2020 14:37:39 -0700 (PDT)
X-Received: by 2002:a17:902:bcc3:: with SMTP id o3mr2482600pls.241.1598909858936;
        Mon, 31 Aug 2020 14:37:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598909858; cv=none;
        d=google.com; s=arc-20160816;
        b=egt/18h/hWO9C2JNDPB8MQ2UYFefhk6yD/MM1gG5jj3pVfszG+pDhX2BFKU+vhauIy
         WBcaIzG4cPcVdbhd5VfMPriTP5XizdVLPfmY3iaNw+qnc0wXd4hQeB56Fws3aHFDeJYj
         IUuclyRtp8zw6tvB4PLnvQT7r+S1CECP8qv7grGBetXB+vMRIgvmf85Ul56GBHkeUNIS
         7Z/NglbYfhfPI1DPPU1b16Luat3MIYLxWvJ0GXX95jgpUD7AMyyfJ2cbkYXG1/0WqsmJ
         ecSBMGEC8xEviUtxuJiuPAJO4FmD5rIigzYiSGXNp2WiNxY8we//abFBCebPrAhsM2T1
         OUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=aF1TYW9+DmXTOxP0rCa7SthEkQoCWC6+zXjV5LlvHMQ=;
        b=owN8VF7Udsyc9mEAxZt6HEzHBUpsOB88XGYNwUrc7n1OcVhMczmHWFCHYzCZ5qHaCE
         U9Fr6q00vl6D9xI+Mabms5boePY/YTpIjN2B/fcGNr0MycEYjkCJbEXBctZ0sA7ZVkOP
         7qVXwepB27vEbVrtwzSOPeQeXsCQezk0kczEuu2XlArshiiyEVe1+YtGtUk49qTmb2Y3
         K3Kmkq0RFVeS13MxtBeOU1kak49GzD/nBu9AxW8WQj74oGVJJ+dVLJFUWBmli4JAsOvL
         dgj71PNefoTiGpWAWGWrXDPtECGtbd3i87amQB8LcZujqEJAYtx0R2kdOJ9e3e1YjIjx
         U00A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x9nepgtx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i124sor3426567pfc.89.2020.08.31.14.37.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Aug 2020 14:37:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x9nepgtx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aF1TYW9+DmXTOxP0rCa7SthEkQoCWC6+zXjV5LlvHMQ=;
        b=x9nepgtxkHBfFxTs3l5K+WI7B4/dG6sa5gTKjEPEGKA1i5vT6JzRQJaSdCrvAj2qcj
         l4AgJLy+SFSEe6+fHkBRVCvjtfGQ74mPaSBEjO6Ch6+EmgbmHf6htxPuY2j6nJalxYn5
         HTw1NQ6UG+mo4m0s7Z3oUNl6YTjT2/nS3VdjRu1iYp0Aiqmq6J+YstIkF0HbaZTkoIst
         WJiO3EuBHTYr4TFqufi+VQ1i6tKkPobaZKkzV+v+JsjyoV45ByZGhAKD8j0kOrW+rHZN
         TJz99ZJ9Bb/z1O8MMzb+2SrIRiUduIdIQIvB1EcEhMN0vEFe0ZLFyxYMi+GjW10eBvjV
         4F9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aF1TYW9+DmXTOxP0rCa7SthEkQoCWC6+zXjV5LlvHMQ=;
        b=c/9I4ulbuvpFJbXiYgXOqdm3HDJ6mCLVzYJOxzcv8LZHlFGRE0vZp1HQ94MKSZOLsz
         4Otz+Ae4JpPIDQopvICaok1ACjYKwJ/xrtPZf3kqJnNIGvOvh7Y5uZTdzbhYNxkbA+zE
         3ui5Dfa3v+OUcfA7BSItz7J/OiR3XAOYcIIWXobJwZUFvhwoULTTJnMgUuRnA4e+hxUw
         ZvDe4bEnArCQzuUEdm4ksGVMa2LchfHxcqTvLykhKC/KRfd9FIZu05hKQNTX8XB2brFR
         25HCUo5r5z+Hh7DEMMTX4T9Jye7/33+mF6/XHpMrAyLl0ZDWKJoKLOUrwPBvlmz8v1C9
         6z/Q==
X-Gm-Message-State: AOAM531/kbaYomntte9ugBZVnHjYbUghoW14Cnjn7HulVxSl1bGqZlnT
	gxvlSfRP61cPcKbcpMMOLbnaUCeJ
X-Google-Smtp-Source: ABdhPJzY9pX9FAI2tHfXc+NCEv0qzRv6gNhJkv6mav6Bw3GJSowl8ysxOYGftSt9JXFwE7ENfBsMbg==
X-Received: by 2002:aa7:9556:: with SMTP id w22mr2885120pfq.245.1598909858396;
        Mon, 31 Aug 2020 14:37:38 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id c1sm7936988pfi.136.2020.08.31.14.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2020 14:37:37 -0700 (PDT)
Subject: Re: [PATCH v2 4/7] target: Push BQL on ->do_interrupt down into
 per-arch implementation
To: Robert Foley <robert.foley@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Eduardo Habkost <ehabkost@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, pbonzini@redhat.com,
 Stafford Horne <shorne@gmail.com>, alex.bennee@linaro.org,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 peter.puhov@linaro.org, Aurelien Jarno <aurelien@aurel32.net>
References: <20200819182856.4893-1-robert.foley@linaro.org>
 <20200819182856.4893-5-robert.foley@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <047fe2b3-c51b-1840-8b93-f747684abea0@linaro.org>
Date: Mon, 31 Aug 2020 14:37:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819182856.4893-5-robert.foley@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: YJQaQQdWCGZu

On 8/19/20 11:28 AM, Robert Foley wrote:
> avr is another exception.  avr, arm and cris all had a similar
> case where their *_cpu_exec_interrupt was calling to
> the CPUClass ->do_interrupt.  This causes an issue when we push
> the lock down since ->do_interrupt will try to acquire the BQL, but
> the calling context already has it.

Alpha is in this lest as well, correct?

> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
> index 4c6753df34..be29bdd530 100644
> --- a/target/alpha/cpu.h
> +++ b/target/alpha/cpu.h
> @@ -276,7 +276,7 @@ struct AlphaCPU {
>  extern const VMStateDescription vmstate_alpha_cpu;
>  #endif
>  
> -void alpha_cpu_do_interrupt_locked(CPUState *cpu);
> +void alpha_cpu_do_interrupt(CPUState *cpu);
>  bool alpha_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
>  hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> diff --git a/target/alpha/helper.c b/target/alpha/helper.c
> index ff9a2a7765..e497dd269e 100644
> --- a/target/alpha/helper.c
> +++ b/target/alpha/helper.c
> @@ -295,7 +295,7 @@ bool alpha_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
>  }
>  #endif /* USER_ONLY */
>  
> -void alpha_cpu_do_interrupt_locked(CPUState *cs)
> +static void alpha_cpu_do_interrupt_locked(CPUState *cs)
>  {
>      AlphaCPU *cpu = ALPHA_CPU(cs);
>      CPUAlphaState *env = &cpu->env;
> @@ -407,6 +407,13 @@ void alpha_cpu_do_interrupt_locked(CPUState *cs)
>  #endif /* !USER_ONLY */
>  }
>  
> +void alpha_cpu_do_interrupt(CPUState *cs)
> +{
> +    qemu_mutex_lock_iothread();
> +    alpha_cpu_do_interrupt_locked(cs);
> +    qemu_mutex_unlock_iothread();
> +}
> +
>  bool alpha_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
>      AlphaCPU *cpu = ALPHA_CPU(cs);

This rename should have been done in patch 1, as with all others.
Moreover, this leaves a bug in alpha_cpu_exec_interrupt in that it should be
calling alpha_cpu_do_interrupt_locked.

That seems to be the only instance of this mistake.


r~
