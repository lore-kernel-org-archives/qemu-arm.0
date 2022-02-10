Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1492587lfk;
        Thu, 10 Feb 2022 03:48:29 -0800 (PST)
X-Received: by 2002:a17:90a:be02:: with SMTP id a2mr2360918pjs.113.1644493709662;
        Thu, 10 Feb 2022 03:48:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644493709; cv=none;
        d=google.com; s=arc-20160816;
        b=a6MRoRg1ftPaBR4/uAdxWepNKQVJtIrK/NMvWX2ZV+j5rVKKpBHSnIlg9IXsQrxJZP
         A+pfUdd9OGuikgqmW+LS7fAT9e0Cd5b+vYK6MrjdPmC2ywDgIx5emocL1oK305g19R5y
         adotdD0GgRaVQFJ50vpKj/i62G/szgcof3WCcpDkfw+ThOJl/JvqKjoy67iZshhTj4xB
         dfexRn2UjMX3kaPjE9uULJmjh+X5rs+HRJlVjX3czgxSVQua82Gl2nSbrMgjlWeuQZBb
         cD/FCKuAHkpmsFUjU6BNz9h86dy4ogJFDys4VXF2IrwKh1C9o4TCYQSjBlPApY+itSxn
         m6mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=ig9kZqZZfQ9sqdXBPM1U4qU1I9hGNtkiVI/BPqhhhKc=;
        b=ySJzYSwzQkV3MjLTXqvfR98eJ8Fqwa0RIxMxK8v6hz8nERg4vD5RSjiPPVaeDekfdv
         uXHVpeXdf6MOzrGcw4m+fTrsos3z6i/rqNnBsHj7rQv6bWWPP1LTKa9ZaGyRCvwHwwVu
         H3jOWSPFXqMrKpjKYPZlh3G1ZUUZnk7itzOioqSv/zDZwUuvK2zuW18cc6wAjJfT7Bbi
         y9/xQTMp5+Ed/IxM6UmDmWlcOQ0I3q26OxufhRDvv5gL4PaOpsgm4QWgPaGDgtHOGi3s
         rLpqZ3CI+UyO5F3Rt1aA591PjWmMnUWUjXdL9oLfjHNjQEuMgMn2a9iTDa5shZLknMHT
         Lsyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gHjRR3KM;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 185sor3820315pga.82.2022.02.10.03.48.29
        (Google Transport Security);
        Thu, 10 Feb 2022 03:48:29 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gHjRR3KM;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ig9kZqZZfQ9sqdXBPM1U4qU1I9hGNtkiVI/BPqhhhKc=;
        b=gHjRR3KMMjr4GXyMMVsj3qIoQ3XUIZ2LRHojh/SBKk1/ArKNECiBKc5YaqBzLpyafw
         ctys2nLhQQJGtWNe/3YCjlaj5BbUhLndnm9jW774Y1ZJpyiS2f6a/1DxUQgTNNYJamMP
         Mc03HT5MjPZae88D4Busv49cFPFInz22dvTl+0C77PE1n38BdM8/MhKvt5syZBIA2sxX
         gVBKC79gv+bwdPxd8OH4DOJanVUyWNarHLWtAijgFSgLNsPO/Dr5ziEmdIQNuZUulHyM
         0uhJvvHjo2h8BBqTB1ZEHPSDrtA805xtP7TTNInMHO/BQX85U1iU0EG/xwgnnAhzxmAk
         CCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ig9kZqZZfQ9sqdXBPM1U4qU1I9hGNtkiVI/BPqhhhKc=;
        b=CvyxlDWu6Ut4nWCSBCpcaKy127BqWhPaH0PaJV+q11+tSUB75W+yN/2vbV56nRtG2c
         pvBB4/GJvz5LmCNAjxke/6No7ut0m49GfaoSEzGPMPp3i3jTqS3Gztu88BVBCkquZEtq
         qV5c7ekEX0Fe7cXgGIPZCpQNPrkpwdP4LtybX7OeOWH1nnTNkC7jfi7sk6n0mkccI/1+
         zL8bQX3TkDy4zVysHD1OUESchnQPLcU08Ind2LTAJq7flnoB8uhuFTX9JnCqfSU/waIx
         uVD6ay2Yohi3Zw2Indi2eLB3QALx+IoTcixWnr9GyQQbUeuVHQgB18LFQuBpV/MNGiUY
         ErNQ==
X-Gm-Message-State: AOAM533mNE4Vx7I2ZT6YIkQY0q/z4paJEUw8vLtygvUd/6aLZB9tIoJz
	wfZqR94Pzq1APaiZssxQL/WPNf2F1mA=
X-Google-Smtp-Source: ABdhPJyNmSG1WvX/xGGiQo/Pq5Dam0pcZhc5srG3p4my1VTiE6XGONLTPkpC3kWLf0Vf6ceOEUA/jw==
X-Received: by 2002:a63:28d:: with SMTP id 135mr5934362pgc.517.1644493708996;
        Thu, 10 Feb 2022 03:48:28 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
        by smtp.gmail.com with ESMTPSA id k12sm24462870pfc.107.2022.02.10.03.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 03:48:28 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <8b6fca38-8a4e-af35-f202-86a5a3f98e47@amsat.org>
Date: Thu, 10 Feb 2022 12:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Cc: Andrew Strauss <astrauss11@gmail.com>, Keith Packard <keithp@keithp.com>,
 qemu-arm@nongnu.org
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
 <20220210113021.3799514-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220210113021.3799514-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 5C4XbJfx1I/U

Hi Alex,

On 10/2/22 12:30, Alex Bennée wrote:
> The previous numbers were a guess at best and rather arbitrary without
> taking into account anything that might be loaded. Instead of using
> guesses based on the state of registers implement a new function that:
> 
>   a) scans the MemoryRegions for the largest RAM block
>   b) iterates through all "ROM" blobs looking for the biggest gap
> 
> The "ROM" blobs include all code loaded via -kernel and the various
> -device loader techniques.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Andrew Strauss <astrauss11@gmail.com>
> Cc: Keith Packard <keithp@keithp.com>
> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>

> +static LayoutInfo common_semi_find_bases(CPUState *cs)
>   {
> -    MemoryRegion *subregion;
> +    FlatView *fv;
> +    LayoutInfo info = { 0, 0, 0, 0 };
> +
> +    RCU_READ_LOCK_GUARD();
> +
> +    fv = address_space_to_flatview(cs->as);

Why are we using the CPU view and not address_space_memory?

Does this function really need a CPUState argument?

Trying to find a counter example, if used on the ZynqMP, could a
A-profile core would report one heap layout, and a R-profile core
another layout?

Now if we want the per-CPU AS, shouldn't we pass the CPU AS ID and
call cpu_get_address_space() instead of cs->as?

> +    flatview_for_each_range(fv, find_ram_cb, &info);
>   
>       /*
> -     * Find the chunk of R/W memory containing the address.  This is
> -     * used for the SYS_HEAPINFO semihosting call, which should
> -     * probably be using information from the loaded application.
> +     * If we have found the RAM lets iterate through the ROM blobs to
> +     * workout the best place for the remainder of RAM and split it
> +     * equally between stack and heap.
>        */
> -    QTAILQ_FOREACH(subregion, &get_system_memory()->subregions,
> -                   subregions_link) {
> -        if (subregion->ram && !subregion->readonly) {
> -            Int128 top128 = int128_add(int128_make64(subregion->addr),
> -                                       subregion->size);
> -            Int128 addr128 = int128_make64(addr);
> -            if (subregion->addr <= addr && int128_lt(addr128, top128)) {
> -                return subregion->addr;
> -            }
> -        }
> +    if (info.rambase || info.ramsize > 0) {
> +        RomGap gap = rom_find_largest_gap_between(info.rambase, info.ramsize);
> +        info.heapbase = gap.base;
> +        info.heaplimit = gap.base + gap.size;
>       }
> -    return 0;
> +
> +    return info;
>   }
