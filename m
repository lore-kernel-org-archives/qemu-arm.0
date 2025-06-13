Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp362241njc;
        Fri, 13 Jun 2025 09:07:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXobAwvBbDDaKusN7MNXnQ4/yyWQKzCiOOI/tXYvP88SYxk1czxuhG57h3CkbYxdXHghHUIHT8fOd+REg==@linaro.org
X-Received: by 2002:a05:690c:60c1:b0:70d:ed5d:b4dd with SMTP id 00721157ae682-71163753c7bmr51941277b3.25.1749830856223;
        Fri, 13 Jun 2025 09:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749830856; cv=none;
        d=google.com; s=arc-20240605;
        b=bNSI23P2EHsEQZdMYwhf2LaAHxKZSaAGj8i3VS0WAkQ9Lu7qh3RwC03exITYNG7Z3j
         mXuMNvNKMTmrZW/GkussrrshtLsvOwWbv4ondqfbW/w1DNO9Lk1452rMngkiE1A/HhXR
         4d3GxzjqoXiN+bREmx4rLCzefB0e425jhMOIo1cFJx1zDmRbcVExAX2qLhIWFf4AKwk1
         JkHPCu+olF5gplnCZHaKIaIQhdWnuzi5spgllWatKIQOr85ZJf2efvBJ3lk8WvfUTL1A
         LckCPRklH52ceOJ0ioiHGEKK8uMBV5cpTTkB4t16mJBq+GJueLHDnh0+hvBlh8Yi/MQB
         waSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=runPSHNnAiofURFB4Prnk+4ZgiuQj3pP6BD3srb8FRw=;
        fh=y5YpOBUVZO2w+EDetwKl7Mzk7KQiQoRQY/TL71OpfJc=;
        b=dwudA9qcIu1OJvGTGMMn23CJhNYxIWCEsgW1faHS0Tr41mbDB9Gbg7ygzx5l0s2hxq
         TZcfgjZ1Oi8xr5dLlSSKf3Lw9IQnvOm6B5lXsC6MH+QzRiBn5FHSDPUEdOqehG70wveK
         0OHgchrZ5DEvkAOzq/HuNqsfB/ydnwnKARsZn3Nxza4UssrV0Dfu1wnJ5n+jnbKsR5KF
         m7EfbDYMYXOObvKSWmiAx40nCuK9tdfEn3m4eTWUsTH8ar+ciyzjVYxJfHW6VxEjIq9d
         xipV6hsAk9ZKtrrtm1fX+kGnCeiCwXHlhQ/V7MycZui72gFi4j79hLhoaGzT6cPWGu9V
         vmwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XzrTR611;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-711513daf7esor28189567b3.0.2025.06.13.09.07.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jun 2025 09:07:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XzrTR611;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749830856; x=1750435656; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=runPSHNnAiofURFB4Prnk+4ZgiuQj3pP6BD3srb8FRw=;
        b=XzrTR611Hc2Xuc3o0GN5THGX0tzJV1mWra5TDebtl8jjhUYdW55dPBJyLheH93aoCh
         8A9yKMaPYMYfd7S90hEI2AFOuOQVh9fPTOXpelWwRgRynjKDy5hrYBXC+LG3GfhfVB/a
         LOS2ExRrLYkcftwr1c8IFOBgJi1wSA48c+kkqDYCKqPsv5MKbK0BQZxm53qBnsxSYPFk
         VGYbpJcEiuvA3zwE3Y2fc2fspSurkm82TPWHib3LAKQIseT/GzghX3glDHRDOCWzWYbq
         pp1hFLtzQt0T44eziO3PhclOhm7SWyO/b1iZI2hQtbxIPeueJiGkrs1z2QGVQJgiw9Qi
         SoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749830856; x=1750435656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=runPSHNnAiofURFB4Prnk+4ZgiuQj3pP6BD3srb8FRw=;
        b=oM2uH3jpVdaYnbDE4C7plDGn/EditBdY01TsiuFxepICi0NzwISo+UETkVouUyIHZT
         xx4yIXTedbYa2jd0UJZXgaL13KmBT3bjn4h9XMXqxGcFVjEeokwyJ5dTxV8lSNLaiSNS
         HRLOHvN9zzqgwlW1+cY90fO3CT9OeJ4GfNYKJ9m3wkONjuVUXooowlvdtBe6V30hUWlV
         HIpUHEg/CgUvowa4GhCpsT4yTSzvO6jLeADw4x1KsRrKkRhVE3DjQr+Eykt4AoavariC
         4hxdIyR1HuloEPWlY5m5NzuxNs+SvbadiLhkeHAFrIVryDRU3wWJOCCSgYTlo9yD0soT
         5zpg==
X-Forwarded-Encrypted: i=1; AJvYcCWYVYfawJEWU7bYu1/nMUvh4clKQeE2he+r0IokxSipO7HiNdg2PInwcuH4knk2w8U0NFUwqaK6JFxDeQ==@linaro.org
X-Gm-Message-State: AOJu0YxUYqWIVLNqNhTQz+FjCKEBIgDaVr7DCGpGe8y0Pp5gglkd86qR
	+6KeCV1NpO39SUnSY8UaA+3xXr8VCC5VgVYRD4xA/T25tbXdyXMAf4hLYVQhkuN7TPOTqyP5Jmn
	Clss+Emkagp8j00zJ4aT9Laujp+DRF6JDRTU5iJeOahjJ
X-Gm-Gg: ASbGnctH+sL+iYKHLuMBjF+g97PAzy942+COrh6dJp/aD8vX6drCMENsbsh8L90ZN79
	4V5Wvlgkti3V3SmPxlnkjpYmHgaBUjN3lp1/eUKGM3AyPD012b9lpOE/tIO8JeGqBM+EJgVT7b4
	agrgTazghsarABazGC6vU42vwJU9/5pfqU6oyziOWADXlW
X-Google-Smtp-Source: AGHT+IEt1SN6zbIZVZJ7Z2S/c4snZBWEGwekLPATt6rzh8CCPguf80eGpk0hQhWJ4FCS/m9fqbYDVpyBHmqiFVV4ea4=
X-Received: by 2002:a05:690c:968e:b0:70e:7a67:b4c5 with SMTP id
 00721157ae682-7116377cee5mr52563887b3.36.1749830855766; Fri, 13 Jun 2025
 09:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250612134338.1871023-1-Jonathan.Cameron@huawei.com>
 <20250612134338.1871023-4-Jonathan.Cameron@huawei.com> <CAFEAcA-J+vAGfEV67PezA72rUiqpuqTBT=8hJLc1sw+xo3XHWQ@mail.gmail.com>
 <20250613162054.000003cf@huawei.com>
In-Reply-To: <20250613162054.000003cf@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jun 2025 17:07:24 +0100
X-Gm-Features: AX0GCFsd8mxMT-w2iPsLlVwEKMHjA3lJ8J7CkRV_0qv7wyH083gjLI13UxLyzBI
Message-ID: <CAFEAcA9dHc8werChGk_HzXWsxqv1E4==iDPxRtCmPe9Ndr7nmA@mail.gmail.com>
Subject: Re: [PATCH v15 3/4] hw/arm/virt: Basic CXL enablement on
 pci_expander_bridge instances pxb-cxl
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Fan Ni <fan.ni@samsung.com>, mst@redhat.com, 
	Zhijian Li <lizhijian@fujitsu.com>, Itaru Kitayama <itaru.kitayama@linux.dev>, linuxarm@huawei.com, 
	linux-cxl@vger.kernel.org, qemu-arm@nongnu.org, 
	Yuquan Wang <wangyuquan1236@phytium.com.cn>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Alireza Sanaee <alireza.sanaee@huawei.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: j2+QkOCaU2l+

On Fri, 13 Jun 2025 at 16:20, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Fri, 13 Jun 2025 13:57:39 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Thu, 12 Jun 2025 at 14:45, Jonathan Cameron
> > <Jonathan.Cameron@huawei.com> wrote:
> > >
> > > Code based on i386/pc enablement. The memory layout places space for 16
> > > host bridge register regions after the GIC_REDIST2 in the extended memmap.
> > > The CFMWs are placed above the extended memmap.
> > >
> > > Only create the CEDT table if cxl=on set for the machine.
> > >
> > > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > >
> > > ---
> > > v15: No changes.
> > > ---
> > >  include/hw/arm/virt.h    |  4 ++++
> > >  hw/arm/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
> > >  hw/arm/virt.c            | 29 +++++++++++++++++++++++++++++
> > >  3 files changed, 67 insertions(+)
> >
> Hi Peter,
>
> Thanks for reviewing.
>
> > Can we have some user-facing documentation, please?
> > (docs/system/arm/virt.rst -- can just be a brief mention
> > and link to docs/system/devices/cxl.rst if you want to put the
> > examples of aarch64 use in there.)
>
> Given the examples should look exactly like those for x86/pc, do we need
> extra examples in cxl.rst? I guess I can add one simple arm/virt example
> in a follow up patch without bloating that file too badly..

That's fine too -- if the answer is "all these command lines work
for aarch64 too", then you can just say that in cxl.rst.

> Is the following sufficient for the board specific docs?
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 6a719b9586..10cbffc8a7 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -31,6 +31,7 @@ Supported devices
>  The virt board supports:
>
>  - PCI/PCIe devices
> +- CXL Fixed memory windows, root bridges and devices.
>  - Flash memory
>  - Either one or two PL011 UARTs for the NonSecure World
>  - An RTC
> @@ -189,6 +190,14 @@ ras
>  acpi
>    Set ``on``/``off``/``auto`` to enable/disable ACPI.
>
> +cxl
> +  Set  ``on``/``off`` to enable/disable CXL. More details in
> +  :doc:`../devices/cxl`. The default is off.
> +
> +cxl-fmw
> +  Array of CXL fixed memory windows describing fixed address routing to
> +  target CXL host bridges. See :doc:`../devices/cxl`.
> +
>  dtb-randomness
>    Set ``on``/``off`` to pass random seeds via the guest DTB
>    rng-seed and kaslr-seed nodes (in both "/chosen" and

Looks OK.

> >
> > > @@ -220,6 +223,7 @@ static const MemMapEntry base_memmap[] = {
> > >  static MemMapEntry extended_memmap[] = {
> > >      /* Additional 64 MB redist region (can contain up to 512 redistributors) */
> > >      [VIRT_HIGH_GIC_REDIST2] =   { 0x0, 64 * MiB },
> > > +    [VIRT_CXL_HOST] =           { 0x0, 64 * KiB * 16 }, /* 16 UID */
> >
> > This is going to shuffle the memory map around, even if CXL
> > isn't enabled, which will break migration compatibility.
> > You need to do something to ensure that the CXL region isn't
> > included in the calculations of the base addresses for these
> > regions if CXL isn't enabled.
> >
>
> It doesn't move any existing stuff because these are naturally aligned
> regions so this is in a gap before the PCIE ECAM region.

Is that true even when we have the maximum number of CPUs and
so the max number of redistributors in that VIRT_HIGH_GIC_REDIST2
region ?

> > >      [VIRT_HIGH_PCIE_ECAM] =     { 0x0, 256 * MiB },
> > >      /* Second PCIe window */
> > >      [VIRT_HIGH_PCIE_MMIO] =     { 0x0, DEFAULT_HIGH_PCIE_MMIO_SIZE },
> >
> > If you're OK with having the CXL host region at the end of the
> > list then that's a simpler way to avoid its presence disturbing
> > the layout of the existing regions, but you might not like it
> > being at such a high physaddr.
>
> From what I recall a higher address isn't a problem I just wanted to not waste any
> PA space at all so used the gap.
>
> Chunk of /proc/iomem with a random test case (in first case with the cxl bits
> removed as obvious that doesn't start until this patch is in place).
> Need more than 123 cpus to make the second gicv3 redist appear
> (I've no idea why that number I just printed the threshold where
> it was calculated to find out what I needed to wait for boot on).

It's 123 because that's the most redistributors we can fit into
the lower redistributor region. (We didn't really allow enough
space in the lower memory map, which is why we need this awkward
split setup.

(I have to run now, will look at the rest of the email next week.)

-- PMM
