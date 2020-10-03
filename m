Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2628032lfq;
        Sat, 3 Oct 2020 10:38:57 -0700 (PDT)
X-Received: by 2002:a7b:c418:: with SMTP id k24mr8376629wmi.118.1601746737874;
        Sat, 03 Oct 2020 10:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601746737; cv=none;
        d=google.com; s=arc-20160816;
        b=dMUImQ3CNGb0fK3Yf4zYsnbW2kaBelSXPmgJ8d7CM1zS2utM5ASuk/KzvXcBNyymtw
         yCgWbr4ztBy+icrNQqXgy387BNbYyPilzpqPK4o/+h70tTv9w2RsR+y5sUl1hfHLO0Cv
         cp20x+lcVLm83/p3dHH9vfG+uPYHna1v/33ixTGb4cDAHXs7HF7VgAlR72gIQAm+r/ED
         xYMZ6KxEmHSwOx4QSx8f5/AtWdxm8Ffzw/NrmdJpHNhkwvnLDP/mDc7xCRKruRLxOcXz
         aIvqcdD7wVxryBg4yTveEGhVRQhQp1QfPuXR+56gsuaU6U5BqhGVtCJLgqd3FC/yn1yD
         TmKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=NC3bF7aZX0Iu7vf2d5DjorTTdZbvXMK7gB/TFhdzfGs=;
        b=K9aSlH7fwHGilK3svBldcYiBU6gLp+T+3hWuP7dzbQ/qh0PVJnvRBZDCJzj4kS0N8c
         eEI7RjUvvEdWxq/QjqpyWya4IFc7JXLzscxB8ts1QqQHCNa3wSamEn2tFvfvkYWUE4y5
         ysqNYpQw7ruzw2RoE/Z6XjqEIxPemvZNrv//uS/mM8hmfOmR4QGNokjKS4xrjmcWbljT
         P/uNZG11pclYdVliAnbH3LQnbimGON4qz3qiis/u/ZEax+qopykWPdUJ0sAuyHCb/r7h
         rErOqBZKsZVESFzE5BJ0Fruv2+L9OxSFyT2nND9DIwiHsT9XlGAk/jEmoDCzokJ5w3FN
         h/bA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qqqk7Meg;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a14sor2613496wme.2.2020.10.03.10.38.57
        (Google Transport Security);
        Sat, 03 Oct 2020 10:38:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qqqk7Meg;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NC3bF7aZX0Iu7vf2d5DjorTTdZbvXMK7gB/TFhdzfGs=;
        b=Qqqk7MegygPxzUMcAP4JeynFlXV4t0xN9qkvvA6MVi0AJFXysXT2aJTB/M1dFXU+4A
         DNVZAnRaiVCv3us+ESN5u8VwVPdcvNxPxdOxAetFsGCnSpzKwYnFAbd8DH5H2xL3l5Ms
         kvqDX0g3EQYWGNEgTqBnyWQQPyl2PhDmOlzcinfNPDKPvK99mPLipu/S+hkVwrnAkxmN
         4WW1U0qASu9gvHJsyq+NW5xh6FSAxT/qOWy2Y31RObYCazbPeKzBEVeWC9uSYTSF1Jan
         6cYpT0MJSg+iFwyiJ2cHj0KwzkPNITtADrMF4LpZp71hiTPdRc17zNm78XxHrR/nj36+
         evRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NC3bF7aZX0Iu7vf2d5DjorTTdZbvXMK7gB/TFhdzfGs=;
        b=ksyB1VOjjW0myoGxuAA/gWGVtMk4bQRfhnnG0c3XuO9a04G/g29rFQGhB0XH029Ez2
         yhT4XvMdeWz+g6uBBwiqKQwlT4GfjZLDgK0zmr8fJKxKB0qULXZV0vyof7UJc91QQ+9L
         oNBNno7/UKEMgxa65pfjifXfpqg5jJJs2tKrJ2eHnlIn6zJOdrQgwkb+c98Ej87Szmeh
         FxZ8d/ELNzcwdQZGNKWQ0J81/OG04qDWGz1Ni+GmOiCxK/yz8z35mEf4ZhQq5ePQNvV6
         ntLKvkmcSbnUQsdrMPUkfDAV5MO+bqoxId7eFNmo7bw3R+R7lCwkVsxYGUOUGrlhfKNo
         6xAw==
X-Gm-Message-State: AOAM530hDWDuHcjEeuW48Sb1qMPL4dRcP7PD39+T/U3rAwGGnSmoPSwc
	T6+zJg4oV9k7oq+x/VbcZpEcToHplSg=
X-Google-Smtp-Source: ABdhPJx2GRRqUU2+Cr7yJ5YBhc6a0I5jNMyBZCulKu/nM79DyvyGoqI9sZDCK3pfgieyEPrSo8O/4g==
X-Received: by 2002:a7b:c345:: with SMTP id l5mr8509428wmj.123.1601746737573;
        Sat, 03 Oct 2020 10:38:57 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id f5sm5863555wmh.16.2020.10.03.10.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 10:38:56 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v10 6/8] linux-user/elfload: Move PT_INTERP detection to
 first loop
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 laurent@vivier.eu
References: <20201002215955.254866-1-richard.henderson@linaro.org>
 <20201002215955.254866-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b5a451fa-2f1f-17af-fadc-218eab051329@amsat.org>
Date: Sat, 3 Oct 2020 19:38:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201002215955.254866-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: nDUrYjy6Sf5w

On 10/2/20 11:59 PM, Richard Henderson wrote:
> For BTI, we need to know if the executable is static or dynamic,
> which means looking for PT_INTERP earlier.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/elfload.c | 60 +++++++++++++++++++++++---------------------
>  1 file changed, 31 insertions(+), 29 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 735ebfa190..6b422990ff 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2421,8 +2421,10 @@ static void load_elf_image(const char *image_name, int image_fd,
>  
>      mmap_lock();
>  
> -    /* Find the maximum size of the image and allocate an appropriate
> -       amount of memory to handle that.  */
> +    /*
> +     * Find the maximum size of the image and allocate an appropriate
> +     * amount of memory to handle that.  Locate the interpreter, if any.
> +     */
>      loaddr = -1, hiaddr = 0;
>      info->alignment = 0;
>      for (i = 0; i < ehdr->e_phnum; ++i) {
> @@ -2438,6 +2440,33 @@ static void load_elf_image(const char *image_name, int image_fd,
>              }
>              ++info->nsegs;
>              info->alignment |= eppnt->p_align;
> +        } else if (eppnt->p_type == PT_INTERP && pinterp_name) {
> +            char *interp_name;
> +
> +            if (*pinterp_name) {
> +                errmsg = "Multiple PT_INTERP entries";
> +                goto exit_errmsg;
> +            }
> +            interp_name = malloc(eppnt->p_filesz);
> +            if (!interp_name) {
> +                goto exit_perror;
> +            }
> +
> +            if (eppnt->p_offset + eppnt->p_filesz <= BPRM_BUF_SIZE) {
> +                memcpy(interp_name, bprm_buf + eppnt->p_offset,
> +                       eppnt->p_filesz);
> +            } else {
> +                retval = pread(image_fd, interp_name, eppnt->p_filesz,
> +                               eppnt->p_offset);
> +                if (retval != eppnt->p_filesz) {

Preexisting, free(interp_name)?

> +                    goto exit_perror;
> +                }
> +            }
> +            if (interp_name[eppnt->p_filesz - 1] != 0) {
> +                errmsg = "Invalid PT_INTERP entry";

Ditto, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +                goto exit_errmsg;
> +            }
> +            *pinterp_name = interp_name;
>          }
>      }
>  
> @@ -2590,33 +2619,6 @@ static void load_elf_image(const char *image_name, int image_fd,
>              if (vaddr_em > info->brk) {
>                  info->brk = vaddr_em;
>              }
> -        } else if (eppnt->p_type == PT_INTERP && pinterp_name) {
> -            char *interp_name;
> -
> -            if (*pinterp_name) {
> -                errmsg = "Multiple PT_INTERP entries";
> -                goto exit_errmsg;
> -            }
> -            interp_name = malloc(eppnt->p_filesz);
> -            if (!interp_name) {
> -                goto exit_perror;
> -            }
> -
> -            if (eppnt->p_offset + eppnt->p_filesz <= BPRM_BUF_SIZE) {
> -                memcpy(interp_name, bprm_buf + eppnt->p_offset,
> -                       eppnt->p_filesz);
> -            } else {
> -                retval = pread(image_fd, interp_name, eppnt->p_filesz,
> -                               eppnt->p_offset);
> -                if (retval != eppnt->p_filesz) {
> -                    goto exit_perror;
> -                }
> -            }
> -            if (interp_name[eppnt->p_filesz - 1] != 0) {
> -                errmsg = "Invalid PT_INTERP entry";
> -                goto exit_errmsg;
> -            }
> -            *pinterp_name = interp_name;
>  #ifdef TARGET_MIPS
>          } else if (eppnt->p_type == PT_MIPS_ABIFLAGS) {
>              Mips_elf_abiflags_v0 abiflags;
> 
