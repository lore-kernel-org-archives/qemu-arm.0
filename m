Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1807291ejb;
        Fri, 16 Dec 2022 16:13:48 -0800 (PST)
X-Received: by 2002:a17:902:f283:b0:189:7d30:7623 with SMTP id k3-20020a170902f28300b001897d307623mr29815878plc.30.1671236028047;
        Fri, 16 Dec 2022 16:13:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671236028; cv=none;
        d=google.com; s=arc-20160816;
        b=gVO5sENRDH2kmBdSf9pHLgiGvySvb7VNDltHBsI9qq7dLeZl9jGPzEBUGBS9ZxGpPF
         bRQ0Z7hR8KEnlj9MwsDXDS3Lf0CR+WGiEgdGPyGvuHyYvSHAzPicpZGvfGvGWNazYapR
         /zwvRN6ECmJbjGS3uaZ2xW+L+n7zWJ8mG1yGc+Py68kcnfmqtYdz2qdv4Sd4CZu87YYk
         FXqG63efy1AVI5Z7+d69RYDdos/lSNy3vjoBNlfZmFYS/Kxp43ijHF3lOA5spYr8ixvV
         RhRQOMcxsN+77NsCC6jDmzbJF0H1KmBsZ92aCCuiQsLqF9SbM1t40GFT5Kt1oqA46a0+
         Fd6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DRsluQlTEZM4Vyr/Nq91RokMTh2BjVg3+hSA+9YDHoI=;
        b=Zv62fUBK3fxQyqPeN9Z5eNAZO6KQR/smYh7qB8cM+2YXgx0oozjVnE5pNJ2KoJ0eH5
         PD3Rr2aCBlF4ugV4KnjeSQRZPu+2btqNX6LBE28dINJauhnDERlz2641lDdR8ScsFUcW
         uppGPkmERhJ7guq1Tjk2zFY0eoInhx4OZNtedN2HCAGyBnl7KLOF1OwPOIIzubd2J0DF
         fziq4QUnWEaHJLJd/8xgS04sUz2pmX1LU3GAc2HV0I67neldycqBNs0G2XfiBjEF1Gd8
         NqN9XxpTyY5MEP2b9yaAAAr6u4v6JGOT9Lte/HMx49PH0SzsCwggwTqDJpgctRUy8+W1
         3Gew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M2uCjiib;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p12-20020a170902ebcc00b001893e915b0fsor1734076plg.88.2022.12.16.16.13.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Dec 2022 16:13:48 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M2uCjiib;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DRsluQlTEZM4Vyr/Nq91RokMTh2BjVg3+hSA+9YDHoI=;
        b=M2uCjiib+LocLCKTfvvtochERJPIQT6JoOLMEh6WtgkFKOyVCU0eLIFPUeqaHZbm1a
         TPWLG1uHvdKC50mZfAz2whvsfZFUghaaQDZiTUaUgWFv93TcJaasVLKd+0z4Pr6l9R01
         D0/aIUekNC1ltApXkmI07Pfycd3ukGRF9RK6ZHCjYyZNJtjUM55suOQz963hiQWuFXPn
         3hPrqkV0vqJpmAHhzCWqRzfcmyIAGs/CRhj3BVNMJpqnTwLli1jPiilmpaIuFV37CTcN
         tsq9BDfBp1pj9jesXHJGotDydrSxi72eU8fwOano2sFpNjFum/eETxu5nARUdpdhMIzt
         qyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRsluQlTEZM4Vyr/Nq91RokMTh2BjVg3+hSA+9YDHoI=;
        b=Omfg9T/pdj+6CxS6e82uLnHugVl3uFnnUdQug0cHC3B0PSyQuQpwljVaH1CE9/4i1B
         P4oq9vr9ouQHh+R4J+xqNdc5num/49rVPcTazjTQbmXXx0ElW08OavhPMl/7UM41oU2Q
         eh7gplefBcQK8vIk2GEk2YaBKVteonc0xjZiJ1+hP7Yabbni2M2A8h+raomI2RerrSgM
         N7ma2/fbC2KB2nQLql8GaxoONmosm31uUOj01OXUBH4Qu80GnhuzUqlWevv+5qXA3aYw
         WTWeUi3COdRKQU9k/RrZ2QWXTe6wo+AL2evz8wOBpLIIWKp7r7IKo50u93Ly15AAkOzz
         WFzg==
X-Gm-Message-State: AFqh2kqohNWhOSgb5RrzpxDBupd/7lzj7PmWC9J+wxoy/3ZBkrm2iaW6
	qLYQi70kBKL987XPA+P8Q18Qm7KShnWD06FSWn0=
X-Google-Smtp-Source: AMrXdXvFfvz6PEBZsrGDU83/ycPsmui3vYyK1MdSVRpwhkA8JEHyznGCb7OcHB4S6XxsDWqt2HbTfw==
X-Received: by 2002:a17:903:285:b0:191:3c6:1748 with SMTP id j5-20020a170903028500b0019103c61748mr4147078plr.11.1671236027395;
        Fri, 16 Dec 2022 16:13:47 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b? ([2602:47:d48c:8101:c606:9489:98df:6a3b])
        by smtp.gmail.com with ESMTPSA id b1-20020a170903228100b001867fdec154sm2181773plh.224.2022.12.16.16.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 16:13:46 -0800 (PST)
Message-ID: <7f555a78-1533-7be6-f627-6e594a19c04d@linaro.org>
Date: Fri, 16 Dec 2022 16:13:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/5] target/arm: wrap semihosting and psci calls with
 tcg_enabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20221216212944.28229-1-farosas@suse.de>
 <20221216212944.28229-4-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216212944.28229-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: anZU7zCjj/r/

On 12/16/22 13:29, Fabiano Rosas wrote:
> -    if (arm_is_psci_call(cpu, cs->exception_index)) {
> -        arm_handle_psci_call(cpu);
> -        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
> -        return;
> -    }
> +    if (tcg_enabled()) {
> +        if (arm_is_psci_call(cpu, cs->exception_index)) {

This could be

     if (tcg_enabled() && arm_is_psci_call(...))

because...

> -    /*
> -     * Semihosting semantics depend on the register width of the code
> -     * that caused the exception, not the target exception level, so
> -     * must be handled here.
> -     */
> +        /*
> +         * Semihosting semantics depend on the register width of the code
> +         * that caused the exception, not the target exception level, so
> +         * must be handled here.
> +         */
>   #ifdef CONFIG_TCG
> -    if (cs->exception_index == EXCP_SEMIHOST) {
> -        tcg_handle_semihosting(cs);
> -        return;
> -    }
> +        if (cs->exception_index == EXCP_SEMIHOST) {

If you were able to replace the ifdef, that would be one thing, but since you aren't I 
don't think this requires a separate check.  There is no way to generate EXCP_SEMIHOST 
except via TCG.

I guess I don't insist, since you're working toward Claudio's much larger patch set, so

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
