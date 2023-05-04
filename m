Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp368878ejq;
        Thu, 4 May 2023 08:02:41 -0700 (PDT)
X-Received: by 2002:a2e:8713:0:b0:2ac:826e:c5a with SMTP id m19-20020a2e8713000000b002ac826e0c5amr230530lji.1.1683212561825;
        Thu, 04 May 2023 08:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683212561; cv=none;
        d=google.com; s=arc-20160816;
        b=caO8RSbW6Vr9mYQ4e/r9baz5VYTbtF2j/eaMRo1OAjhlHWYWg4/Ot9HV8JTVUL8BAh
         cFPMwsyMVGoXa0Nk0phvnqYqQEcWBQXU4p8m15x2UdCy0gcs2jgV2ewP1faJu60bvPAU
         Z4VeWmk1i6phmABtoLRV4Al0MrXOpXU+HSKwziS12wLMTYLp+LEV2OBi5QOX1lZO8Bw2
         U/mV3pE6Rum9HGlrAbamnqL60IdheFEeSVhtzjk+BUG7yyEX/UYxmR0mywUSsMU0cIXU
         tD1M5VVvbY3t6c9yaQsWjnH77vyQQqgyuBWawW3oW0XoHqmL4RnkEXWSAA+qvfHkB3dk
         Yx8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oAocgrsmEG603ZQnZ5CcZYHrN6ZBFyDbbTu3VCHsd9A=;
        b=szj6XB9GR22IbxIB19yj1dGzcHJCdAXTKx+VPQraCHY9VO9Sis95E+/g9VMrYqYwrk
         V+lKtRk/saZDk4y+O6D6VVP7ItR/bLPOmcAS27FuGQODqny9lta0VOnlgtlgItzTiX7G
         QxrcK+VgwHikFw8g85OGIjjVUli9pZ/YVCxaZxBXfafxIFPRY+49f/zsH1YnwL/70haq
         Q/HLyBrOKl54aVtQnuhNjy62TsXPfp6IMfkdwii9hMOhsNFnx+fizu/bS3NyiAUZbVuk
         K3MKfb8pqEIMiweryZzYZ5jaHdVSqQVujGcCcj59FUtkdQCPgWd5M/q0Wqmm2Ucpf0hl
         FS/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F5Lf4HMj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s26-20020a05651c049a00b002ac82115532sor196849ljc.7.2023.05.04.08.02.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 May 2023 08:02:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F5Lf4HMj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683212561; x=1685804561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAocgrsmEG603ZQnZ5CcZYHrN6ZBFyDbbTu3VCHsd9A=;
        b=F5Lf4HMj5EDCPlBNDdOROkY7rL3tB9dkVfjlF0oq9y/8yhYT+/yhnK2nE0hwkHEV0y
         5J81IkkQfN52l2ARjnvLgau0rCxMM8h2nWkOl0MdRdw21OFixdT4lJ5CNVbBry56mzfb
         yr0Im6nBMdPRvddSuEfWCmGkCTA+AbZZPGCIlQGgb0H+2bOZ5xuw9X0rgQvNvcyVsaqG
         YoSULS1L/3wBePrmXwue0lL9+kA541dX4KoJeTOLJqw2NalzEWjndaPNLSRT0eanCihr
         XCJlUxZZVv+mqd7QbYRL+fueSvCNJ9nb57/sV5qMh6CMWw0SeasWIo/qXP605FRyniw9
         X1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683212561; x=1685804561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAocgrsmEG603ZQnZ5CcZYHrN6ZBFyDbbTu3VCHsd9A=;
        b=lfB72zoPgqwMAMkghYg0xlP6nNHglRmm6EDebyuRRqR7+me7nd4HJ2c97DEXVBsv03
         17GIzZMssa0L2SWVx6VuyI7I0x+6GKiz4MI98/648Gr95ZHYSjWA3ETMDdSFqosKAJOi
         6rwpLtYAu0MAKmJXVDpU+re13NQyhHm9G6NknEp1UarmUtZ1lgOAA8sD99nXztu1lPWC
         Lxdz0925MYCdp/kgEsfrz+eVI9bgEsQbCwk1qvn7GkRzG9RNbHITgDU1H2ALDacF0ss1
         WgHHKXFMoP/Q7xwv/hF25a559iaVpVEY/6cyWwcHWvivMHYB+ANnODs9h6yHb7a0PUiW
         JjTA==
X-Gm-Message-State: AC+VfDzOdgBKzLx9PnwQJkYwR/mxWNR3umOYr7VOyfi8OO8fhyKiSOU4
	l3kh2Oe1SsdScO86rQ1OHKA7A8p2tnnRfbVb8rqWJQBY
X-Google-Smtp-Source: ACHHUZ70ZJ5nS7SJYchXMEhZ86p6VAPNGSHQNuYDTYgMkadcT9NIj+L4y7vdoGyQ5J0eJRWMhP3UN0mLmAY/LPBKWdk=
X-Received: by 2002:a2e:9b84:0:b0:2ac:7e64:ef8 with SMTP id
 z4-20020a2e9b84000000b002ac7e640ef8mr971691lji.16.1683212561375; Thu, 04 May
 2023 08:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org> <20230503070656.1746170-4-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 May 2023 16:02:30 +0100
Message-ID: <CAFEAcA858-D37=MrvYnGxBVkL1V14wZ_JLEzFahbweRUDvPmwg@mail.gmail.com>
Subject: Re: [PATCH v4 03/57] accel/tcg: Introduce tlb_read_idx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
	qemu-s390x@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: YNOairJ2wQ9K

On Wed, 3 May 2023 at 08:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of playing with offsetof in various places, use
> MMUAccessType to index an array.  This is easily defined
> instead of the previous dummy padding array in the union.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> @@ -1802,7 +1763,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, t=
arget_ulong addr,
>      if (prot & PAGE_WRITE) {
>          tlb_addr =3D tlb_addr_write(tlbe);
>          if (!tlb_hit(tlb_addr, addr)) {
> -            if (!VICTIM_TLB_HIT(addr_write, addr)) {
> +            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_STORE,
> +                                addr & TARGET_PAGE_MASK)) {
>                  tlb_fill(env_cpu(env), addr, size,
>                           MMU_DATA_STORE, mmu_idx, retaddr);
>                  index =3D tlb_index(env, mmu_idx, addr);
> @@ -1835,7 +1797,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, t=
arget_ulong addr,
>      } else /* if (prot & PAGE_READ) */ {
>          tlb_addr =3D tlbe->addr_read;
>          if (!tlb_hit(tlb_addr, addr)) {
> -            if (!VICTIM_TLB_HIT(addr_write, addr)) {
> +            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_LOAD,
> +                                addr & TARGET_PAGE_MASK)) {

This was previously looking at addr_write, but now we pass
MMU_DATA_LOAD ?

>                  tlb_fill(env_cpu(env), addr, size,
>                           MMU_DATA_LOAD, mmu_idx, retaddr);
>                  index =3D tlb_index(env, mmu_idx, addr);

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
