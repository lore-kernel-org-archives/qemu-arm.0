Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1804764ejt;
        Tue, 28 Nov 2023 03:35:07 -0800 (PST)
X-Received: by 2002:a50:d49a:0:b0:54b:971:f78f with SMTP id s26-20020a50d49a000000b0054b0971f78fmr10253642edi.11.1701171307311;
        Tue, 28 Nov 2023 03:35:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701171307; cv=none;
        d=google.com; s=arc-20160816;
        b=ZpUjfpg3rHIxyCawHemqq86yDRCGu8jdsjZOqDiGAsiM3E+sVrCA/WJ3Y97r9IFTg/
         4eoZnW90CXWFtpI3fG8oNuiybKK3iXNub44wI0B5wah+UvCjv/ELMWA8bRmDwG+B7/Fu
         S0Il8PLPB2KfCSl2G/kwyEfhfRamqubpx14IKTdVhg38qrSVmNEIf1YTRji90lWVzoYw
         9zxfueIWANjiggW1fq8rq5H259/vlNKCaW+53DsgUptsBdsC0y5fldQ/2QkMzBW3eSlL
         CkoehlpeU344C26lZ7Cr8qbdPXja+PuMYo0xVzqOnGJonLc4zTIQC6Nfq+57sDey7GWE
         kGBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8oLUjrcYtg8cs13kkl75yFaPVI6wnMNwlZ8Sc8CMXr0=;
        fh=v4OadFOyOWiU7n42yL/WZEx7nG4esP1RwFrgkYrf6FE=;
        b=WvVJzeefW8sTdtO5EOwS2ozZGL4x6IJy6OfXMHMZ4ug9W3jmKKh88vwk+gqgCXmYlw
         8xZNp5rcVMm/VOBIPUobXQ+xLmA2TZZm+8CLv3ZBLGQdFyhtBl0aNb6t3VYk0tf+WQGA
         K0wdzAuzrnvqkhXDbPSjVccgTs85U/OBa2R77nxi6f6kIsO1Ggd2eOHfRhftdJcQEzqo
         Olj2OhF1ii4j2mf8I3nxJVHFFyAEs+p7CfeNa1V1TknOsZLPnjFWA0Xh0jwVL50CTf13
         kJmipp7uwlWkBHb26tBmnzjToQo18nc4c+nca9ENRD60snmH7p2jMV0fPmqjBQp4GKjF
         iTMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HSLWB57X;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q20-20020a50cc94000000b0054b9ac3e8cdsor548351edi.4.2023.11.28.03.35.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Nov 2023 03:35:07 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HSLWB57X;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701171307; x=1701776107; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oLUjrcYtg8cs13kkl75yFaPVI6wnMNwlZ8Sc8CMXr0=;
        b=HSLWB57Xv+yFSyRMutcYW9o1XHSoOkvxWvnp6biK715BN4ELu2ydyKmnU+CsVSvEFp
         KWWmTTuc/CcRZHr1QrxvnSoA2u59PktuoFAXnBqirT5QnFIMQUMZ7v9vfpm1z/ony992
         OmifnaluGe+QFBAG5Njz9HDjY6ZTTW7bRLJYV/ZeoO7tDCjmxhJPXp1ydnhGN0TfzBQ5
         qp2dtK+dohpa4zL/nf1g8apdqF4YPxg93/KJeF4/B/HFuzWMdexNqB9SIFrs80z6afGZ
         Iohe6rMV4xlMGEQaekjh+2AGisbUnTB+J7C8qSx3BtvnYwa/oyv3Tmt2DMjGOL3g5Lyv
         0xYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701171307; x=1701776107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oLUjrcYtg8cs13kkl75yFaPVI6wnMNwlZ8Sc8CMXr0=;
        b=rHua7OD+xaVUOHSWpzn8Fi6+DsKBvehWuMC9gq8DUNzMpCsBEdiSJdsjQfK5b69m3G
         z+PIccH5fArCpBKNR/rfMRZzf7LEeIOStWBvPnIUQW1y74QZhPgzbShj82BnI7jLl6qu
         RJzl/gj1BOBSELipCEbXZeDKF8P4ZTNYErtC27TOXMQoQyUaScdRZd31GYDF772EpoaT
         zQGGXwkwejWIeKl6wESL3wFjagQXSfbmjVes9nFp5qctNPS1YaFhHmsCRZjZl7I5v5Xm
         dNtiDBEh6ZL5cO2nGtL2PvphjjN72AXtMA8GQ68UDar1JnTJINAKMi0/hmGUT7A7P92+
         2H8A==
X-Gm-Message-State: AOJu0Yy+buTyVLCdvHJdKuv/XDhzuIQaZ7bBaHYO/0JnGwTxJRmG1TAX
	mcf3BKag9X2idHX3Omfe67qP99V8ok4YRD2Id/jMJ7Tx
X-Google-Smtp-Source: AGHT+IHF1hLARiQlaOFV6cDP6l1MUyZoWMl1tTGXQkv2y4liWbkqzPXuhboDn/nDvoaLJHSCALpulEsW/eyVHbU07iE=
X-Received: by 2002:a50:d514:0:b0:54b:6d25:6969 with SMTP id
 u20-20020a50d514000000b0054b6d256969mr4706314edi.5.1701171306920; Tue, 28 Nov
 2023 03:35:06 -0800 (PST)
MIME-Version: 1.0
References: <20191105234100.22052-1-beata.michalska@linaro.org>
 <20191105234100.22052-5-beata.michalska@linaro.org> <95cc7c22-939f-4ce0-aecd-d0ff7b0e7c9c@linaro.org>
In-Reply-To: <95cc7c22-939f-4ce0-aecd-d0ff7b0e7c9c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Nov 2023 11:34:55 +0000
Message-ID: <CAFEAcA-G7hbnRv52btWkpDs-1rgFqyVGgRVx-hG40i7zgsykaQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] target/arm: Add support for DC CVAP & DC CVADP ins
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, quintela@redhat.com, 
	dgilbert@redhat.com, shameerali.kolothum.thodi@huawei.com, 
	eric.auger@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ZQ7I+J0Zrf1n

On Tue, 28 Nov 2023 at 11:24, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi,
>
> On 6/11/19 00:41, Beata Michalska wrote:
> > ARMv8.2 introduced support for Data Cache Clean instructions
> > to PoP (point-of-persistence) - DC CVAP and PoDP (point-of-deep-persist=
ence)
> > - DV CVADP. Both specify conceptual points in a memory system where all=
 writes
> > that are to reach them are considered persistent.
> > The support provided considers both to be actually the same so there is=
 no
> > distinction between the two. If none is available (there is no backing =
store
> > for given memory) both will result in Data Cache Clean up to the point =
of
> > coherency. Otherwise sync for the specified range shall be performed.
> >
> > Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> > ---
> >   linux-user/elfload.c |  2 ++
> >   target/arm/cpu.h     | 10 ++++++++++
> >   target/arm/cpu64.c   |  1 +
> >   target/arm/helper.c  | 56 +++++++++++++++++++++++++++++++++++++++++++=
+++++++++
> >   4 files changed, 69 insertions(+)
>
>
> > +#ifndef CONFIG_USER_ONLY
> > +static void dccvap_writefn(CPUARMState *env, const ARMCPRegInfo *opaqu=
e,
> > +                          uint64_t value)
> > +{
> > +    ARMCPU *cpu =3D env_archcpu(env);
> > +    /* CTR_EL0 System register -> DminLine, bits [19:16] */
> > +    uint64_t dline_size =3D 4 << ((cpu->ctr >> 16) & 0xF);
> > +    uint64_t vaddr_in =3D (uint64_t) value;
> > +    uint64_t vaddr =3D vaddr_in & ~(dline_size - 1);
> > +    void *haddr;
> > +    int mem_idx =3D cpu_mmu_index(env, false);
> > +
> > +    /* This won't be crossing page boundaries */
> > +    haddr =3D probe_read(env, vaddr, dline_size, mem_idx, GETPC());
> > +    if (haddr) {
> > +
> > +        ram_addr_t offset;
> > +        MemoryRegion *mr;
> > +
> > +        /* RCU lock is already being held */
> > +        mr =3D memory_region_from_host(haddr, &offset);
> > +
> > +        if (mr) {
> > +            memory_region_do_writeback(mr, offset, dline_size);
> > +        }
> > +    }
> > +}
>
>
> > +#ifndef CONFIG_USER_ONLY
> > +    /* Data Cache clean instructions up to PoP */
> > +    if (cpu_isar_feature(aa64_dcpop, cpu)) {
>
> Am I correct understanding this is a TCG-only feature?

For KVM, whether the vCPU implements these cache
maintenance instructions is up to it -- like all insns,
QEMU doesn't ever see if the guest executes them or not
(either the host CPU just implements them, or the host
kernel traps and handles them). The code in this patch is
specifically for the QEMU TCG emulation of them.

thanks
-- PMM
