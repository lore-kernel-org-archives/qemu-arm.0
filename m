Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2835800lfo;
        Tue, 15 Mar 2022 05:31:34 -0700 (PDT)
X-Received: by 2002:a63:d44c:0:b0:380:8c48:e040 with SMTP id i12-20020a63d44c000000b003808c48e040mr24480650pgj.14.1647347493901;
        Tue, 15 Mar 2022 05:31:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647347493; cv=none;
        d=google.com; s=arc-20160816;
        b=HzVDe1E/UU77wyOUpvwsKYCSwdXpb9d5bfriPJ3f2ON3Eg2+5TdCNLLdTwdYTdcNcl
         /FvZhie0yauMKsK6GtxCkegzEVQ6DP2cHdhiKWOCX4HkYhO350QAm0AQepDbr8INODfB
         KL1E4NsxgXe850e/iWCcuYaKdoD9oxGnfdAJBtREfGOrQN0B4yzk5gY33kw7YmOgy0yr
         VwJ1QRZ022W1PE2SBkIfc10z15MVOngCENMazy8qItOGdu1Psxx2vPJAoP3L19DVGdrp
         vInoAqB43721O6GINWWgOlGm895rN3/tY5Xk9nyKldNEdDsAEIJLJhhQ2TUq3873z1qO
         yVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=XxgXFFdysbfYbYzd4ACTJnemyMWhUDbxdBW5pvBAIvM=;
        b=MiECX5EvGPkYzCB03Z7fdIEaZSIC4ox2LgPb9azqWC2GqbYN263YPVcuX3zI41QMZf
         XYvxIa6OUb4SRb7RxJ3lS9bhQTusYWp8/2C5mlyPrDkSdto9YhQPz8vz0w/qoqN+Xcgt
         ogqutx47N/3dazTY/iULfPTBoWaFsrGzeWyMbWVjHgA7Nskh6xGP3fZEowZqbIbvF280
         NuVH5s6LMy4WA2cMWsoLWdHm+AUiuJbqkvcauYSar0kUaRWmUuCNtwRUPK2w3s690gd3
         PhnlKfZ1NW9UcaJYNr8dUD6KL7lqHG1GF7lShwl0pV5EeoHgAPLdaL4iBq3bBVHMjJRB
         wUcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=TyZSvxdm;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y126-20020a626484000000b004f3bc62a687sor7781537pfb.54.2022.03.15.05.31.33
        (Google Transport Security);
        Tue, 15 Mar 2022 05:31:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=TyZSvxdm;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XxgXFFdysbfYbYzd4ACTJnemyMWhUDbxdBW5pvBAIvM=;
        b=TyZSvxdmU0ysT7OTDOKWsfJPPVHBEMNt7tkd4YX7grmK24nnPfm91nA5CJLRU5/+WT
         Jc7KxJIrxWCF+boHKjuoo0VzfYZHGV78FPZbtwBSY+ADFyjJ3ND+Ng2o7oNabWPi0I72
         hNjapYskHSkXpJIgE/up9tj6aisSxo0wJTJR3wlGdW6wB3QyAql5gMkxyRRtRWz2KqUN
         efAiREuu5nDazVDGZQk5UiHFHkfAHTdxbnQvphTZjyrGgQXOW7qCG5ueUm6ryU6u3Y9y
         C0ZNwffvbgxqVAHxEjQc31WeqeFIzb40Hm7enACPP+33iHmn5aEPOraNUyc6lmkhK6x5
         UuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XxgXFFdysbfYbYzd4ACTJnemyMWhUDbxdBW5pvBAIvM=;
        b=6aw1kKwN/OOokQUFwI+ud6z+4wm4icitviejqqjr88wu/NbYySG3mOYtzopMCCMwQL
         rE36m8m+yqtcDvl7H4r8/OEEXNMn2gl/PvE+g94DsDdcc3+4KdnWTTXZsOi5+C+WjmT+
         B6gwNvdjRKoRDa+TUNJNjdY5URSrtoLAlgMy/XdF2E7qeiMn32xRQBikdAZKJesKvFzp
         5rnE67+2zovdh7htfTEDx8j/2GtnSgtWx2B6Za+lDsr8ekXx1Hz2OKn8tno0/llixoVU
         vxzqSh3XT/XIVjOteU2Kbpb/QMDPzEa9b5PG3ldbppRlvmAcREwr5J4mXghePNDaEniQ
         XfTw==
X-Gm-Message-State: AOAM532447TAeLVIVtkL0zT5bIgrvlgnOZsK7WAC77UOnFSQIcHkYuSu
	kyvmUlw0tM0XhcCEHeIdz+gllXiRmrQ=
X-Google-Smtp-Source: ABdhPJxH6BQO9KW262SnIfZcHJH0MeVAmcqYv16KaMJV6H5xnNyAFm6co8ESXxOwalUWnJbQmZP7Ng==
X-Received: by 2002:a63:5051:0:b0:374:5fd0:f131 with SMTP id q17-20020a635051000000b003745fd0f131mr24356679pgl.431.1647347493247;
        Tue, 15 Mar 2022 05:31:33 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id a38-20020a056a001d2600b004f72acd4dadsm24366525pfx.81.2022.03.15.05.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Mar 2022 05:31:32 -0700 (PDT)
Message-ID: <6c7bdb98-ad58-e48e-caa5-a9747b8ad90b@gmail.com>
Date: Tue, 15 Mar 2022 13:31:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v1 7/8] semihosting: clean up handling of expanded argv
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 sw@weilnetz.de
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
 <20220315121251.2280317-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220315121251.2280317-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: VzwWVYuijpg+

On 15/3/22 13:12, Alex Bennée wrote:
> Another cleanup patch tripped over the fact we weren't being careful
> in our casting. Fix the casts, allow for a non-const and switch from
> g_realloc to g_renew.
> 
> The whole semihosting argument handling could do with some tests
> though.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   semihosting/config.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/semihosting/config.c b/semihosting/config.c
> index 137171b717..50d82108e6 100644
> --- a/semihosting/config.c
> +++ b/semihosting/config.c
> @@ -51,7 +51,7 @@ typedef struct SemihostingConfig {
>       bool enabled;
>       SemihostingTarget target;
>       Chardev *chardev;
> -    const char **argv;
> +    char **argv;
>       int argc;
>       const char *cmdline; /* concatenated argv */
>   } SemihostingConfig;
> @@ -98,8 +98,8 @@ static int add_semihosting_arg(void *opaque,
>       if (strcmp(name, "arg") == 0) {
>           s->argc++;
>           /* one extra element as g_strjoinv() expects NULL-terminated array */
> -        s->argv = g_realloc(s->argv, (s->argc + 1) * sizeof(void *));
> -        s->argv[s->argc - 1] = val;
> +        s->argv = g_renew(char *, s->argv, s->argc + 1);
> +        s->argv[s->argc - 1] = g_strdup(val);

Why strdup()?

>           s->argv[s->argc] = NULL;
>       }
>       return 0;
