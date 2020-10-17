Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2253435lfa;
        Sat, 17 Oct 2020 02:19:45 -0700 (PDT)
X-Received: by 2002:adf:f3d2:: with SMTP id g18mr8949976wrp.367.1602926385812;
        Sat, 17 Oct 2020 02:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602926385; cv=none;
        d=google.com; s=arc-20160816;
        b=BAvVKo1zDmPBeHiaTOrbXl3rf4QolGd8H3QjD4XNTg8wj1gbMgC9D3fiv/3tpwjwmx
         fA2IO4l4/OVP0RgKXPw7xrCB1e0Ot5d+BLvip1GHAmhk5DMy2fN62cqqz4zMPsnhxt+b
         Sihnd4GtCIeV3wCTAqonVi8uaEDxXGO7caUZ63BbbIuF3aJ3gwU1VArZt7fciah2Iojw
         +mUBLIPgAaIsAt9Q3nWcsA7L+XpEV7M8TNLZmVyK52VLqdYe+GOnzeu1b0xPYUKqZWIW
         PZY44hQufZWn7NzJpcPGxkBxOA53XDc9YU9SWyozlctgyM3viKDCcIqBVtc9BZVg2FRC
         tgOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=VTvoe59wzRhzK/TvwlO5dqaQllVgc1n8AcpMP05DVd8=;
        b=O6oR5uKct7gtt7KDaouQXe/aRulm6v1tYNSTDnzHei5v/lXV3Xw2ob4unHSfx33c4d
         DG2wF731YOsi03DosZ+4yVJvaiTsy2ENtrXUUF0KgW3YJggfDHmkklLnc0yGsbmBHN9V
         6NORnvXvufVW0oPkjxB4vs2nl4J/+POryPA6sNQk2Svzf7+XUOQJHalA+YzSSPX/HeJq
         sDkpm9RHp3wSOeAvxy/MsgXKJTkdOJ2DMjZtcEAVW7Xx8IMwEdrXW3vMQN7l1ipeu8OD
         qGBMTzuDSZ9PfrqbKdCBFiPXYuBVAAHtvzImvbosagucUuNZUxfpftMCAnyR6JiDFpwn
         wORQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=G52KfXnw;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s10sor2685584wri.7.2020.10.17.02.19.45
        (Google Transport Security);
        Sat, 17 Oct 2020 02:19:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=G52KfXnw;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VTvoe59wzRhzK/TvwlO5dqaQllVgc1n8AcpMP05DVd8=;
        b=G52KfXnwfpKdsw0NzUJoQ6sMFl7a2ytGrxh/PjB2njeVfkJXs6hk6+EoINxv/fGKDI
         IeYF5xvbWMI6PhmNy7EfjePk8pF2aKIqajyXJ/3ymr9X/pXKHKkkTYKii4ZdXNe34Te+
         JcwdZ8/b18bvcR087mMqjPkLe0uZos4eJpTPvMXBuozZCOcIZw1jG4CLeoZD8Kx/SVw2
         fYrlNTwSDqEZhiSC0ZDTRw25cbEIuS/VRHienBTKMfHtz4GSZuComctO86KY00WyiXbB
         eNWEp4XIbn5/Mi8GRzPcZh/WHXaLX1Ag1b7hHkoigVjh12odb3ISItCCmjl7ev6mmmEa
         VQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VTvoe59wzRhzK/TvwlO5dqaQllVgc1n8AcpMP05DVd8=;
        b=O4T/fSUVwOQ0odwYuTGvUFP6rtZFIrf8SvC1Jz45GIDmgb3WSSjGaYx5y1Lvr8ykUi
         tHZa415h/8pQIXP0h1mjmFI19KZ7gLhPqsNpF3WX4y0UdvTH/MtC61I3lAeIyDAlo8A7
         0FlArYZ7eL+xK/tDyrS64KyBxzDyN/244FR5sh+4KFUrBV8sjrpU/dSFapiYBX6QC0aZ
         YYh9sFuzfT7eAPeEQbwL0fyU5/cXWifNuCMmpNw6LFtuDGHYrE4+rSpAk7ffutY0N4E0
         DZ+Nmnj5YPP9jtktCxLQxdJULIb86WqTYHNx1Fg6MujD84oP3dSSh0SJ0aT2dEA/AaK7
         mwCA==
X-Gm-Message-State: AOAM533Yfx5pcV22d4WBoPKV6e78IjvKhBUgExDM3h5ahOourFmlvJhz
	1axKfITpUbWLOXgUr1fLhIpX2Y1nD7o=
X-Google-Smtp-Source: ABdhPJyX8BKdzK1m4cOlORgkh8fP5ZCS/R+1iJn2QNpVFlWF94RDtveW2phIQGUWMozRI3iva9wmBA==
X-Received: by 2002:a5d:40d2:: with SMTP id b18mr9256540wrq.155.1602926385536;
        Sat, 17 Oct 2020 02:19:45 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (117.red-83-52-172.dynamicip.rima-tde.net. [83.52.172.117])
        by smtp.gmail.com with ESMTPSA id p11sm7743195wrm.44.2020.10.17.02.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2020 02:19:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v11 06/12] linux-user/elfload: Adjust iteration over phdr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 laurent@vivier.eu
References: <20201016184207.786698-1-richard.henderson@linaro.org>
 <20201016184207.786698-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3510d5df-b61e-383a-3858-a0e1d486bfdb@amsat.org>
Date: Sat, 17 Oct 2020 11:19:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201016184207.786698-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: uKOOcMH9DPiZ

On 10/16/20 8:42 PM, Richard Henderson wrote:
> The second loop uses a loop induction variable, and the first
> does not.  Transform the first to match the second, to simplify
> a following patch moving code between them.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   linux-user/elfload.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 290ef70222..210592aa90 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2426,17 +2426,18 @@ static void load_elf_image(const char *image_name, int image_fd,
>       loaddr = -1, hiaddr = 0;
>       info->alignment = 0;
>       for (i = 0; i < ehdr->e_phnum; ++i) {
> -        if (phdr[i].p_type == PT_LOAD) {
> -            abi_ulong a = phdr[i].p_vaddr - phdr[i].p_offset;
> +        struct elf_phdr *eppnt = phdr + i;
> +        if (eppnt->p_type == PT_LOAD) {
> +            abi_ulong a = eppnt->p_vaddr - eppnt->p_offset;
>               if (a < loaddr) {
>                   loaddr = a;
>               }
> -            a = phdr[i].p_vaddr + phdr[i].p_memsz;
> +            a = eppnt->p_vaddr + eppnt->p_memsz;
>               if (a > hiaddr) {
>                   hiaddr = a;
>               }
>               ++info->nsegs;
> -            info->alignment |= phdr[i].p_align;
> +            info->alignment |= eppnt->p_align;
>           }
>       }
>   
> 
