Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2625709lfq;
        Sat, 3 Oct 2020 10:34:44 -0700 (PDT)
X-Received: by 2002:a1c:7c1a:: with SMTP id x26mr8942700wmc.112.1601746484435;
        Sat, 03 Oct 2020 10:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601746484; cv=none;
        d=google.com; s=arc-20160816;
        b=TBThKFtBhej0WvKGECCoEByYzbtkneVUEhsZ+mlBGB7y63JC0qEQVnT57Lg2PHK7F7
         s7gDgWC8W9PkVPPQpyLkVcko6cCQUltXEVnbMdhaFDog5782wY1dKIg9eyIGE6eB6gm7
         c0dD9cYi2aAUiWR88LWhANh1lBAM9CQvouGXHvdjV5U6IxcBj9Ozm72bSK3I1MhTa57I
         OwWk/ehZc4d+HOa40/weuih43zGBtXmRhueRaTN1qoCMA4XWnPRUiMjADpUGjITctdTi
         5s2IQBxAl3opZaa8kBRbXxIb+PVKr8CqsNLWoU1LjtwI1xe4WHpSqnmklnf6QUzsMUX5
         zMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=ZJxSGf+k2fRY3+8WPoIY5XuHZfje2g9U1YdaT4hvrTI=;
        b=Vf6zx6U9gVCVFfcPcwfsbWqZ/XMsLcU2HW+kBUrB/aLq8+jjmiFmRJ6gpDN/L4Bf+U
         mGFAZ/Zo+RfCtbSeU5PNNOxMvj0EFkmkkMRgsrC7Is0YIVbonzzufH2wAeCAS4z6Ii7Y
         mEmNsn0ZSk8DOl6escYva19wvkifxqzjlB0+eoX1RthR59Gw4Fsbx6ipRB3F0WWRUL8F
         p4mOMKWqB6vy6Y9IFf1M+UXSajddrwruA2S5X7SLIau0n97KdZ3+Xdv76rnWvq123uCw
         o1g8iW0nAwWkqs6FbwDYZb70g9SDokSCUMCM0ou/yJnY52a5VuQetBXbzS3L0bPk6PBC
         iRag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lw0A0M29;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a12sor2566901wrg.23.2020.10.03.10.34.44
        (Google Transport Security);
        Sat, 03 Oct 2020 10:34:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lw0A0M29;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZJxSGf+k2fRY3+8WPoIY5XuHZfje2g9U1YdaT4hvrTI=;
        b=Lw0A0M299o8nvOY9K+SA5YnHxLbCT2Xicuq2dK7EAbekHshm4QUMKJVH1rYrRPR6Q5
         /QSZjVq+1WjaSv8l+ersaiLga/Hk2i0bixXkRt8id4OWeNPj0LCWCTIvp0pZzh4eCL0g
         L9sJtFSmQ9MoNoagIgmir2uMy6CRPRMNPFTkkF1bsnHbFjmkuQh9yYSsaAbn5LeevCki
         Zha8QynRfRIMyTL6sADbnjdTUS16udVBzuPLkTyzuXcz9O3EUn3+7EYm3C7/YderWBQQ
         vG0aTfEgXY9EDmY0MvmYgUMWIpoZxEoFD6jOr2NpqM/1HRoPRRqptAx2WRec7/uY/RRs
         RVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZJxSGf+k2fRY3+8WPoIY5XuHZfje2g9U1YdaT4hvrTI=;
        b=R84MDyUlaUYlybeATZ24ito0fnDWCTBkqN8Uv129iXGO6+azI3fAisYqkL6OrP2+kn
         DxilN1phUj5Tu7+2EWLlO6GdaDhysYnTgZ1Qe94BrwoUCLyst8rgIr7x07DM3J2icArB
         yIMvavh8P8zDPo57xgw1AOR4paB7PWSl3j1+pH3O8CjIZeYISXxGHt4dr5mI0BRI3FWg
         lZrjRaX2nXjVb6uYcIHVjafEOOTGJX9ItuqGyGnrVHu02HiXDk5D8Z2teCHOalnKXgnx
         nv+hTxWGHGOgutcMijlKANr+0+wU8Cth7oXWP2zSNiWzNEFFEPgescEjliIQ0h2NNcG+
         nxiA==
X-Gm-Message-State: AOAM533aSKacFwxgSdZemkfarYsyHmhpNwq1lpK4D9xWh4fDXayEf5Ns
	chbFr3hOKeondTa9umHs0uNeFlCSLls=
X-Google-Smtp-Source: ABdhPJx4ZGVnd8h3kyZsTfkBc/iCQFIPM4hju5UCCyR9VTkgtlECuGKO4rrNQyr14nnQXlBbmpUuPw==
X-Received: by 2002:adf:f643:: with SMTP id x3mr2022034wrp.180.1601746484193;
        Sat, 03 Oct 2020 10:34:44 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id u15sm5676629wml.21.2020.10.03.10.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 10:34:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v10 4/8] linux-user/elfload: Fix coding style in
 load_elf_image
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 laurent@vivier.eu
References: <20201002215955.254866-1-richard.henderson@linaro.org>
 <20201002215955.254866-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <96bd930b-e11c-150c-b4ab-670cd8f46aa6@amsat.org>
Date: Sat, 3 Oct 2020 19:34:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201002215955.254866-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: l3sB65249UR7

On 10/2/20 11:59 PM, Richard Henderson wrote:
> Fixing this now will clarify following patches.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  linux-user/elfload.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index f6022fd704..7572a32a30 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2531,9 +2531,15 @@ static void load_elf_image(const char *image_name, int image_fd,
>              abi_ulong vaddr, vaddr_po, vaddr_ps, vaddr_ef, vaddr_em, vaddr_len;
>              int elf_prot = 0;
>  
> -            if (eppnt->p_flags & PF_R) elf_prot =  PROT_READ;
> -            if (eppnt->p_flags & PF_W) elf_prot |= PROT_WRITE;
> -            if (eppnt->p_flags & PF_X) elf_prot |= PROT_EXEC;
> +            if (eppnt->p_flags & PF_R) {
> +                elf_prot |= PROT_READ;
> +            }
> +            if (eppnt->p_flags & PF_W) {
> +                elf_prot |= PROT_WRITE;
> +            }
> +            if (eppnt->p_flags & PF_X) {
> +                elf_prot |= PROT_EXEC;
> +            }
>  
>              vaddr = load_bias + eppnt->p_vaddr;
>              vaddr_po = TARGET_ELF_PAGEOFFSET(vaddr);
> 
