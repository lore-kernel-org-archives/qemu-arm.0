Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2140026lfc;
        Sun, 15 Mar 2020 13:40:02 -0700 (PDT)
X-Received: by 2002:a17:90a:30c7:: with SMTP id h65mr22682975pjb.44.1584304801840;
        Sun, 15 Mar 2020 13:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584304801; cv=none;
        d=google.com; s=arc-20160816;
        b=vQz8rOknTgMPUB80xWetKLeghquh4u7Y6i6RNFaxF/9yjwUlvI5i3+wET4jDqwRg3T
         +UgcSYFvCNEYbGEh3vi+aeW61V5pHflL1OgewMBpQWj4e2/DA/Y8emRK0dtYC3T3IJEi
         I8rKpTkY0uYkOcpkiOApkxMtWO3CV8I2l5a6+IruNMAaWCUNI7R+LXcR1smTbTNX9ogR
         Ba+oIJelw+T6ZfopqyAre0v7qMOY/fKPI2MWkJrriRcsXJhSEeMDFqeM3XSPj9TDkNcF
         PgRQSR9hUbGgPXFhXgkSxsFwFvYAE0pvk85RQyvVrb0Hg7jHj+lsmdiek1wddwhQih7G
         r+Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=9gLA/pZNjQ+TUALc0hVvV5WrZ8BDZlIZEDjxYRqsuHI=;
        b=aVgq6ebag9DuoUnc6qULsaCca8DPisdbKel9ZzoEjJmCG1YYLc+Kn9LeUyAtixghnb
         IGMkRbp8JOb6bqf4vEq0ch1bZdvSVTl5e1A9jik994KBbEU+04ypalUJ/Er/SLLA4Kj3
         CvoZxs0g0PKumvdQtmFQL/mGGn03t2zAkJnpjGMtY/mP1il2CVUsOB90jyPc2dcwtHPE
         a1gt55QEg5lZdOaZ7phbtlG/a9h1uu8auB8eJNcEvH69zLh87qCiq1GC7cC8qJ87cQtT
         4f3XJJdVO81rF70w2DnP7gwTeSQSV2iNd1WoAqYDodUa2WSpom8a7K3iEF+rON2+nZ6D
         wj/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nRuztsa8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q1sor18872378plr.16.2020.03.15.13.40.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Mar 2020 13:40:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nRuztsa8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9gLA/pZNjQ+TUALc0hVvV5WrZ8BDZlIZEDjxYRqsuHI=;
        b=nRuztsa80DwR5gQPGt2mUZhxzXN+SRoIJNBobx4nRHzIa0fZHOvflO9YKV8ldDUc4Y
         fJczNcGeOBpoknDknsZ5V32QwMtxwH6uha0/tUGQitnsMf/lTu80Q50O4E2bkZX3mnvz
         EvcLXaHzJwhOClgx6EUgMARUuY9I8ZaLMB9l0F9CuGdlvihn7CigC8uYji1iHFdNnN+6
         PqEraSJVh57Ux1ir9sDq/zUp7ua7wJDKyfdZXu8QuMWPN7PJ3LwTRNN/3jmn4ELcq8rz
         NOOY/pFp9Uk3Dv+BMNtu/RwFBXnhMU6sopr9Jc1dikOYfr8mTnLddI9srsRl8E/F3+EL
         BKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9gLA/pZNjQ+TUALc0hVvV5WrZ8BDZlIZEDjxYRqsuHI=;
        b=KrAIj99r44o5R0BeURJUo446NZZU1r7rqzzUUxS8zNSnQymfK14x0jv+V4yzj/9ORH
         X/ljN0xoeraumO88R/KzKjlPEyAa7c/YOgR8wX5QQMvprHrAaSV3UMHPZQCDkUALHxiS
         xcSlK9UaM6a1GLD3TSA6O5rkPxEqz9xf3rXDnO2YwU/wy9Hli0beOMyyNgmSAdxarmzH
         ANG75nXonGLtxbwArrSajSqgwyWI/Nd2KJKC0GWNtXbjyNjjVo4Vkhp8TXngIj9wYhN0
         okOPiKIwy7xeshmxrqjcMTDTVy+Si1+qWXjVXQ+rgEQwEZA/+U4XIouNCY5Bqyc+tdGg
         MO4w==
X-Gm-Message-State: ANhLgQ1Lr9NeFDEqDh7t8YCetaJxxEnQiIe2tEbF7xxnsA7gRA8EsPZZ
	YgwUDPGZDBI25RqoLonITLWeyxA2KRi2rA==
X-Google-Smtp-Source: ADFU+vttMD152WsTeFSMYGGYcAbMGnI0q4g5skx6XoWm5Wvhv6BH0KfgNicSkTJvvY9rMR+iX07B/g==
X-Received: by 2002:a17:902:ab98:: with SMTP id f24mr3028309plr.87.1584304801189;
        Sun, 15 Mar 2020 13:40:01 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id q91sm11269628pjb.11.2020.03.15.13.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 13:40:00 -0700 (PDT)
Subject: Re: [PATCH 09/14] exec: Drop redundant #ifdeffery
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-10-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fdbcdfba-9467-2270-7309-abe8e509edc2@linaro.org>
Date: Sun, 15 Mar 2020 13:39:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-10-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: yUD7oGpU7ide

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  exec.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/exec.c b/exec.c
> index 7bc9828c5b..f258502966 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -185,10 +185,6 @@ struct DirtyBitmapSnapshot {
>      unsigned long dirty[];
>  };
>  
> -#endif
> -
> -#if !defined(CONFIG_USER_ONLY)
> -
>  static void phys_map_node_reserve(PhysPageMap *map, unsigned nodes)
>  {
>      static unsigned alloc_hint = 16;
> 

There's even more than that.  Looking further down,

>     745 #endif
>     746 
>     747 #if !defined(CONFIG_USER_ONLY)

This is the #endif that paired with the one at 190.

Later,

>     988 #if defined(CONFIG_USER_ONLY)
...
>    1000 #else
...
>    1031 #endif
>    1032 
>    1033 #ifndef CONFIG_USER_ONLY

So those three lines are redundant.

Later,

>    1252 #if !defined(CONFIG_USER_ONLY)
...
>    1438 #endif /* defined(CONFIG_USER_ONLY) */
>    1439 
>    1440 #if !defined(CONFIG_USER_ONLY)

Clearly these ifdefs are very hard to follow.  I would thus welcome a split of
this file.

Possibly into exec-common.c (with functions present in both softmmu and
user-only, with ifdefs *inside* functions only), and exec-system.c (with no
/#if.*CONFIG_USER_ONLY/).

But exec.c is over 4000 lines, so if there's another logical split into even
more files, that would be even better.


r~
