Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4236486ejb;
        Tue, 13 Dec 2022 05:51:33 -0800 (PST)
X-Received: by 2002:a05:6a20:1395:b0:a9:e225:6f7b with SMTP id w21-20020a056a20139500b000a9e2256f7bmr38208183pzh.0.1670939493395;
        Tue, 13 Dec 2022 05:51:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670939493; cv=none;
        d=google.com; s=arc-20160816;
        b=oUWwZkHpRDT3rdMppPEF+sGJ/pTZptJZj0x0PAGDdjnQVC3W722r2GJ9zTFhEDWuPc
         7Iuv7nqr4OF2Q27Bjq2zqaGrDyWo+/Hs/YXCOD+BP5XgQ4D/0niFOiCzuL4i/KhQImSp
         DXPITlVwvkc2wMgjW8Fns/FBxGdHwcnE8dxlBPxaDy7i6hEbbgvUMDJybeEPjbk0cRjM
         Xpz9TxyCVLaCxXASJyj/cOg5puVmeA8GXI0XC9tb2o4YCGcX55dfUvsX6R3N08Rxv8JC
         OERuWAmDa5yEAC1b/RnyUv4lo2wvaPtY3G+7FhDh2nPRdqo/Y1K/8jRGKIRTjjK0MIVd
         goug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F1lIA09NAE9d9SsQ4BNpuKSFBf1ECvgdOF9Sj0DG1g4=;
        b=n6u/CRjPC5jbUjK5IOKeL9y/CDWjoz6Y8ze2IoKjXscXafEv0mwBbfmnR1mj0fYVrG
         gxXJn2s2XxwV0gtDTO9z+KFCG/nIE+9KXhiFdWa5HK3RO1I4j7KKy02Ulx3PZ6s3qOB1
         4jYCjR3qGO4YbSnMjVM0/a1YgDBE/W6QsYKOmMZ1WS7Y/O7GJTyULhHbJIsuXX1qEd2Q
         phlbnqjQp7d+NXgM83fcWzKI8NczF9mMYtpZXMaq+Hn0ooeNzTHZRFt8536onV7opE+0
         WTrBikYpVpbETN9/orXnws72Re1olAi5HooY3CikKozUaSC1xyVQmeGfNxgZYayastiL
         uKvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kQko6Z/i";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y8-20020a17090a2b4800b0021a0c4cc6f5sor5378903pjc.42.2022.12.13.05.51.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Dec 2022 05:51:33 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kQko6Z/i";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1lIA09NAE9d9SsQ4BNpuKSFBf1ECvgdOF9Sj0DG1g4=;
        b=kQko6Z/isWI4VLd5gh5MuXXb6u926HvhIoKSyaARM3xf6Fv6W8iSyXJ6edLv2yeWkx
         nPrEc6tAgrCRxxm7yBx8S6aPGblx6fJVU1C442d0etZZHh4M4bSGw0fhHdsEMGMc4w2g
         4e7asE5YxAj7PI5i34w50MBa3wZnzJY8oI1U8X3fBXwYRdqrEVbUL8S5jzxvJ3WYkc5J
         c/jNJ8r2ChDbLxG4JRy3sbkx89fG4YQGDN9gb/HX5uBQlN2VMOZY3hRkNeWd+4wBhNA6
         JmmfhUw5Mal4f6mJHvnSZcSOby5vmU3U3dzLynC+zBxPLnPn8qxJDF81fKFHaPwTbQ5P
         r3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1lIA09NAE9d9SsQ4BNpuKSFBf1ECvgdOF9Sj0DG1g4=;
        b=IA5Aa8k+JtS2Jmg9XEGyRNca46d/m6k++hJHVKKw4uLiOqjWFlfmnGRAYHouv9Dudi
         lUo7NDcuvHHTey4O6NPP7BHMTEFC3fx8pe9VNApglAXNC5B/VGqs1GnUC7Z0H5QA2Sui
         WijHaRsrVT5ppjTD3VX73J8CBiSHFi+a2NuPaYgbSiNgG+eFdaa5h+oIb8HbzUDkspS7
         YEbhm8SO0ORnl+ygoW0dbwyaP+5xZ/rYsSJdFWO1X33Lc4gYbBev6OVVp3vE5zhByi7h
         Y/gUmK9g/7NWTmvtFdeWYbARw8j7efQarzaczL/wE0r4jQZfUdsX0BV7UkpD9GLfp9Cz
         T36g==
X-Gm-Message-State: ANoB5pl/FUGrHQ/AHEpkLniIyy6LCp1vw9A51q5iz+5s93SkD/awCiaI
	x4Zj5KBKH0LE2+XN/hVFy5AV6pmp0GyTc4GHNucJkP0D
X-Google-Smtp-Source: AA0mqf7uylvX7hXfgqEMnxiqUXJ5epz2GYKQLkGME/2PHmp3aZuDO1wEt1+YDBXOUE359QlWPMu5Q3fee0B+LCT3sT0=
X-Received: by 2002:a17:90b:3c05:b0:219:e2f1:81ad with SMTP id
 pb5-20020a17090b3c0500b00219e2f181admr338851pjb.19.1670939492906; Tue, 13 Dec
 2022 05:51:32 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org> <20221213125218.39868-3-philmd@linaro.org>
In-Reply-To: <20221213125218.39868-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2022 13:51:21 +0000
Message-ID: <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by cpu_to_be64(HPTE)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alistair Francis <alistair@alistair23.me>, David Gibson <david@gibson.dropbear.id.au>, 
	Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: KBnG8NaQTrkx

On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The tswap64() calls introduced in commit 4be21d561d ("pseries:
> savevm support for pseries machine") are used to store the HTAB
> in the migration stream (see savevm_htab_handlers) and are in
> big-endian format.

I think they're reading the run-time spapr->htab data structure
(some of which is stuck onto the wire as a stream-of-bytes buffer
and some of which is not). But either way, it's a target-endian
data structure, because the code in hw/ppc/spapr_softmmu.c which
reads and writes entries in it is using ldq_p() and stq_p(),
and the current in-tree version of these macros is doing a
"read host 64-bit and convert to/from target endianness wih tswap64".

>  #define HPTE(_table, _i)   (void *)(((uint64_t *)(_table)) + ((_i) * 2))
> -#define HPTE_VALID(_hpte)  (tswap64(*((uint64_t *)(_hpte))) & HPTE64_V_V=
ALID)
> -#define HPTE_DIRTY(_hpte)  (tswap64(*((uint64_t *)(_hpte))) & HPTE64_V_H=
PTE_DIRTY)
> -#define CLEAN_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) &=3D tswap64(~HPTE64_=
V_HPTE_DIRTY))
> -#define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |=3D tswap64(HPTE64_V=
_HPTE_DIRTY))
> +#define HPTE_VALID(_hpte)  (be64_to_cpu(*((uint64_t *)(_hpte))) & HPTE64=
_V_VALID)
> +#define HPTE_DIRTY(_hpte)  (be64_to_cpu(*((uint64_t *)(_hpte))) & HPTE64=
_V_HPTE_DIRTY)
> +#define CLEAN_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) &=3D cpu_to_be64(~HPT=
E64_V_HPTE_DIRTY))
> +#define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |=3D cpu_to_be64(HPTE=
64_V_HPTE_DIRTY))

This means we now have one file that's accessing this data structure
as "this is target-endian", and one file that's accessing it as
"this is big-endian". It happens that that ends up meaning the same
thing because PPC is always TARGET_BIG_ENDIAN, but it seems a bit
inconsistent.

We should decide whether we're thinking of the data structure
as target-endian or big-endian and change all the accessors
appropriately (or none of them -- currently we're completely
consistent about treating it as "target endian", I think).

I also think that "cast a pointer into a byte-array to uint64_t*
and then dereference it" is less preferable than using ldq_p()
and stq_p(), but that's arguably a separate thing.

thanks
-- PMM
