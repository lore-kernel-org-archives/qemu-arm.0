Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp771062njb;
        Thu, 4 Jul 2024 11:04:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQ0s5w2Cjw2bMryeQD1qbJZ4nba8hvLDBAcwZaEX8oRsUkaVb3E1EPDpvFORbCNMl6n6/T82oiOomFZZ1B0v6dLv7YZn9G
X-Received: by 2002:a2e:a544:0:b0:2ee:8c8e:b6e7 with SMTP id 38308e7fff4ca-2ee8ed69e1amr21979981fa.2.1720116266176;
        Thu, 04 Jul 2024 11:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720116266; cv=none;
        d=google.com; s=arc-20160816;
        b=hFIcAMa8e7Cz0QItXEcSIvirD7saVPxfP222pUFiWqoDEsvQ7+oapG124FUT+EAuFM
         Kd+qKbJ/ssLGwuVzgcZAgMEJZaikTX6L/M+JdHBqh0uyHBTBkWsfon4+D0EkymRFU/70
         6hSsHTwa3Vg3NcoyXJ1HXyG+Rey+/JOUGGFgzJyEThUL3Rb6nI462nnQLGmyrgy1GuA4
         42tOsS+Rr0IWhlLSB8O2cWz8hKFTA9m3c8OgQi+dEk85XmZW+Td2QGpiucFouvPWILnt
         ypf0nNtQzecyBPDayI+hcr73cYr3ys7SlL9HETmWCeZkUieov6WIIcMYjE9McAsd5GaI
         jRyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Es/jxLkK50VhJEf17n9Xpm/bjPPab2SRedAoqRTJxiU=;
        fh=HBi4loY4DWe3Whu0fJ9mJwu/VoH6wnQyvDA6/UO3ky8=;
        b=XZYu6CKdGtVKlfp3F3ruP6W9V02oKRrLjDQN9CQMJ68mu8cf5iApOq5dKs9MpTiUdD
         11gvg2b436dbLzipQKXPAvBccvp2Q7PRwdTlOAtKnX1BuGCnfOshxktMAwkpWbZf0A9B
         6I5VLJJOvOTF3drOFZz/wB/yGqE/fC4aKjL88181ZuJ39v7Tsk8RzGepdv2U6cvMjS5w
         kT7XtxDXOThLJzSR8Q2QlcvmaH579uC1wfA3otsukN8WuKwoq26gteJVWtOe8ovg6sDz
         /7Cg/CQSUAtyEfoDPgU5JNVvxy4EN47Y2Mh5nSQWR/c3ytaFAAW0/+MyfhO4lW7lpCvU
         AErw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F92uROBQ;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4264f50d16asor912505e9.2.2024.07.04.11.04.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jul 2024 11:04:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F92uROBQ;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720116265; x=1720721065; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Es/jxLkK50VhJEf17n9Xpm/bjPPab2SRedAoqRTJxiU=;
        b=F92uROBQR9mXGV9uALGK2Nt0mSu0DL1wuX8svzmGiK1o5WA4gGiGS3s7KJG4LP4lhj
         tKiVtCwz6Wal01LZOVCtTZhMj5ZumrOJzdXNChUhhKgnIFuZhYXiauiV5ubnb01VTSmD
         wWBxgTkkn3ZdW9kuCXNjrHm76RJeHFEZDz5+5NXNzNDoK4i7Tvn7oZAssl/oVWOJooqW
         f0bephqp6F1Lxsxe8dYHbI8O2hf7NfuYEA2vJ7pttTiq/e7YvA/cpA25nek9hGR2dq1M
         cCGiFABZo+LaOgS5COBQzCqp0kCDaaI3/U2BLr92d+8fPkWklaNSwhrE0IfBZSPYqYtR
         T8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720116265; x=1720721065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Es/jxLkK50VhJEf17n9Xpm/bjPPab2SRedAoqRTJxiU=;
        b=ZHp72nT3flwfiMCF5E58YRa30ppVV6CAI2br1pI8nGUaOP+MOa565kWQ1RKgwOSPjx
         Zekro1nFhRmhLpjEkZ6kRJx9VisPCbkpc2jzhd+QXHjs/FQ98OecHjPTiNdK3RSR6VvB
         ZjnhfGmfWrflCUCENEEiVG8j5hHys8jEpyROPgtBqipzVEAlPPxfm0sl/mswRsHC3+id
         0gLgW5HQpC1bisjPSvvT16V9eeRYe41CpIPAHu8GjzeTf+n2xuECKpq0cXbWSEezq9eg
         i/ycr4zLyaw07j6NhXqyKNP804Sdx7pjVkpxt9+9OAY+RoxGZgAY1WoOtHvyAR6UvB8r
         9s3g==
X-Forwarded-Encrypted: i=1; AJvYcCXaXm/oH1Ca2wLhcBmtaGros74nA35gK8FZ7GP/g2OG3NhS0/Lmhyd58D+mZjsu/fOZmTRQ65E5fsvu/276GyNYYzjWn9ZU
X-Gm-Message-State: AOJu0YxXZaW5Nh7bbGWeBhv39is+kgEFsrhy+qSvbRhnNdm2LMalma4X
	kKrqivDehLfCmP5zafp8Pl+5kH53Id+8MR25KnySoKtp5N1Qv+nS6uKovUYWWlQWlg==
X-Google-Smtp-Source: AGHT+IEJfBPphRVIbf3+hLY41G+08KWfKuKv2n9DJX+keY2Gh5gdkJRrCtstpqEOun2CUE1kWXx8mg==
X-Received: by 2002:a5d:4589:0:b0:367:418d:d4d with SMTP id ffacd0b85a97d-3679dd71faamr1979169f8f.60.1720116265607;
        Thu, 04 Jul 2024 11:04:25 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679224d11dsm5008808f8f.12.2024.07.04.11.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:04:25 -0700 (PDT)
Date: Thu, 4 Jul 2024 19:04:38 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 07/19] hw/arm/smmu: Introduce CACHED_ENTRY_TO_ADDR
Message-ID: <20240704180438.GD1693268@myrica>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-8-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701110241.2005222-8-smostafa@google.com>
X-TUID: w8q7DVg+ZSAU

On Mon, Jul 01, 2024 at 11:02:29AM +0000, Mostafa Saleh wrote:
> Soon, smmuv3_do_translate() will be used to translate the CD and the
> TTBx, instead of re-writting the same logic to convert the returned
> cached entry to an address, add a new macro CACHED_ENTRY_TO_ADDR.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3.c              | 3 +--
>  include/hw/arm/smmu-common.h | 3 +++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index cc61708160..229b3c388c 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -950,8 +950,7 @@ epilogue:
>      switch (status) {
>      case SMMU_TRANS_SUCCESS:
>          entry.perm = cached_entry->entry.perm;
> -        entry.translated_addr = cached_entry->entry.translated_addr +
> -                                    (addr & cached_entry->entry.addr_mask);
> +        entry.translated_addr = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
>          entry.addr_mask = cached_entry->entry.addr_mask;
>          trace_smmuv3_translate_success(mr->parent_obj.name, sid, addr,
>                                         entry.translated_addr, entry.perm,
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 96eb017e50..09d3b9e734 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -37,6 +37,9 @@
>  #define VMSA_IDXMSK(isz, strd, lvl)         ((1ULL << \
>                                               VMSA_BIT_LVL(isz, strd, lvl)) - 1)
>  
> +#define CACHED_ENTRY_TO_ADDR(ent, addr)      (ent)->entry.translated_addr + \
> +                                             ((addr) & (ent)->entry.addr_mask);

nit: maybe wrap this in parenthesis to avoid future usage mistakes and
drop the semicolon 

Thanks,
Jean

> +
>  /*
>   * Page table walk error types
>   */
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 
