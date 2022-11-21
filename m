Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2624670ejx;
        Mon, 21 Nov 2022 10:32:39 -0800 (PST)
X-Received: by 2002:a63:550e:0:b0:470:5b0d:b5a8 with SMTP id j14-20020a63550e000000b004705b0db5a8mr2657288pgb.152.1669055559228;
        Mon, 21 Nov 2022 10:32:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669055559; cv=none;
        d=google.com; s=arc-20160816;
        b=gVMuqjWgmUqcVS1qqIrPz/mL6B0+EVhGNbJgZjrURwJq42E+T/NLLUIckjy5AH8SG+
         1mol3oV0g+Wa9DfTKc9GSQW7HQko73TNl/fJuhO26YV5IPkow3hn9l6ehM1k18EjJnz7
         u+M7RudOlcvBEJt8cXMXHAsBkWl0JgBK/qrVXZvdtlCZmgypdpGgq4NHwxJecidyeBpE
         Ii9pNJGbK0b6E3HK0n2CQp92w7BA1BNG8RQx+D2dW0+TGlkSl/hmIEizB2VDholBnRyG
         nYfGs83cuECnJwvlcZ8uZpLvJ6vcbYk4oEMOK/OPah2BJBUybq0aB5pxZhexbE7raPjw
         GPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TDCt5JZs7nN7aMjb+43rOTLwlrIATvUH8K0OR0ntUqc=;
        b=PJC0YtYbhlbSfbHj8GeCoA9wY+lE39qUvItJsAXJ05DyiSZsx0iXqyKJmoK4zyjOem
         dYAO4PE+cMLIO3o3ZHZXCzL0iWnKZbMt6vdEDU4oT7nlTwpoHjfZyxPfrHrkQPQHalPu
         T1zeWJosl+Ww7BkUnQDqX7+lnib2xEtYUqK2x8hYgZnYZZ4qDBDOFxGg3ibyTpAMDebL
         kjx1Pp1SOio/wLQ19CeINzbPcy1yzS6WmxgWb/W538H3OEmGnDvH8iEz2h4uVNfWztUb
         jkO5oWrc6HXBTikSsUkwT0VIH63fRfCurMJX2XqGUm18iyuxTM8cBVCkzb2YQ2FKiBpw
         QVUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ID4J0qXk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w1-20020a654101000000b00434dbbc86f4sor5752767pgp.27.2022.11.21.10.32.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 Nov 2022 10:32:39 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ID4J0qXk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDCt5JZs7nN7aMjb+43rOTLwlrIATvUH8K0OR0ntUqc=;
        b=ID4J0qXkmQAfooRBavHV+5Cfju+jFqyTH+Iz0SZNtkagw8I3FmBLnik54fuX3jwIzR
         MM2LW0Nme5k51kCMUddF/mxpRXKb5BT5UAHzV3e/SF+mQV40OvP1sDw6dl0Ul1ltWgqo
         IsWXqw12PnM4uFLd7nLUjd4/44TZ0uD+M9vsiEM96ZclMIWswhomvcno2v3dCObpDv+1
         MYTQGot8R/jHjzqe2YMqA9qVIp1DeNpDU8uZKvpH5VCHPYvFypBuXLXdRvZJLrIlGG8g
         IZ/xYqA7woRK9E3P6dY9gAluV02pyjhXI6+m6L8fK/dNW7UStfdnv+Ggle2P5yrCQZYQ
         rcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDCt5JZs7nN7aMjb+43rOTLwlrIATvUH8K0OR0ntUqc=;
        b=FtC3vN0rLqZ3WtF7xS4NPNtrM+WVotrVKD4BQiwTfXkx5atXartEYpFWChY2sR6Xje
         bZawGiQfXWaLnph5RIhcsDxGfLcl0hVg2jcKkybXkQ1/R5bRe0sjrwFluHewuS86AVe7
         RfGeEns0pZ8yVZZqWrQJXVGV0a4v3DKYwTODm6cIbl61CJmW/DVm0cbf+xp+gmBSTeaf
         NzCmeerGDZyxIqSVweu2mPyeWVgyd/UrpMoWD58PAjMjkPdpDkSOIw6XAhH0EF9hs+K2
         PI4VfQ0LwfODZSiOg6Qpg9Xdvj7xAfx0TXjz30BROCc7SJm2nHHHHbg1wB44UmCkCcak
         YlYQ==
X-Gm-Message-State: ANoB5pnCqpSA3mDu0FU4fJHsaP3cpKhiX7sxOxpoRJPbFo+55VRt/NOs
	IVICZ9tlI06DbFvpEdKzgDtniSASgGHKnb66MPsqSm5oCY+rHQ==
X-Google-Smtp-Source: AA0mqf7FVDMb6nrfIBaoM7JjoqWuhdHXJ9AQ2sVF0HycixvuHJdRJJvXyo8hfJpAKwhSjn88H0WshqddojHGFfIrGWY=
X-Received: by 2002:a63:5146:0:b0:477:86c1:640f with SMTP id
 r6-20020a635146000000b0047786c1640fmr78823pgl.231.1669055558360; Mon, 21 Nov
 2022 10:32:38 -0800 (PST)
MIME-Version: 1.0
References: <20221111182535.64844-1-alex.bennee@linaro.org> <20221111182535.64844-2-alex.bennee@linaro.org>
In-Reply-To: <20221111182535.64844-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Nov 2022 18:32:26 +0000
Message-ID: <CAFEAcA8LjMXWTJvwd2jpa66ww4QTtxUe21G2rCOoWLKPBKExxg@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] hw: encode accessing CPU index in MemTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, 
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, 
	"open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: C5DHDSZjKFyc

On Fri, 11 Nov 2022 at 18:25, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> We currently have hacks across the hw/ to reference current_cpu to
> work out what the current accessing CPU is. This breaks in some cases
> including using gdbstub to access HW state. As we have MemTxAttrs to
> describe details about the access lets extend it so CPU accesses can
> be explicitly marked.
>
> To achieve this we create a new requester_type which indicates to
> consumers how requester_id it to be consumed. We absorb the existing
> unspecified:1 bitfield into this type and also document a potential
> machine specific encoding which will be useful to (currently)
> out-of-tree extensions.
>
> Places that checked to see if things where unspecified now instead
> check the source if what they expected.
>
> There are a number of places we need to fix up including:
>
>   CPU helpers directly calling address_space_*() fns
>   models in hw/ fishing the data out of current_cpu
>   hypervisors offloading device emulation to QEMU
>
> I'll start addressing some of these in following patches.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>  include/exec/memattrs.h | 68 ++++++++++++++++++++++++++++++++---------
>  hw/i386/amd_iommu.c     |  6 ++--
>  hw/i386/intel_iommu.c   |  2 +-
>  hw/misc/tz-mpc.c        |  2 +-
>  hw/misc/tz-msc.c        |  6 ++--
>  hw/pci/pci.c            |  4 +--
>  6 files changed, 60 insertions(+), 28 deletions(-)
>
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 9fb98bc1ef..8359fc448b 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -14,7 +14,32 @@
>  #ifndef MEMATTRS_H
>  #define MEMATTRS_H
>
> -/* Every memory transaction has associated with it a set of
> +/**
> + * typedef MemTxRequesterType - source of memory transaction
> + *
> + * Every memory transaction comes from a specific place which defines
> + * how requester_id should be handled if at all.
> + *
> + * UNSPECIFIED: the default for otherwise undefined MemTxAttrs
> + * CPU: requester_id is the global cpu_index
> + *      This needs further processing if you need to work out which
> + *      socket or complex it comes from
> + * PCI: indicates the requester_id is a PCI id
> + * MACHINE: indicates a machine specific encoding
> + *          This will require further processing to decode into its
> + *          constituent parts.
> + */
> +typedef enum MemTxRequesterType {
> +    MTRT_UNSPECIFIED =3D 0,
> +    MTRT_CPU,
> +    MTRT_PCI,
> +    MTRT_MACHINE
> +} MemTxRequesterType;

This ends up squashing two distinct things into one field:
 (1) what are the semantics of the requester_id field?
 (2) did the caller explicitly specify their attrs, or
     are they using the legacy MEMTXATTRS_UNSPECIFIED macro?

One might reasonably be explicitly specifying tx attrs
and yet not be using any of the 3 listed requester_id field
semantics. (In fact we have various places that do
exactly that, like tulip_desc_read().)

I think that the requester_type field should just be a
discriminator field that tells you how to interpret
requester_id, and nothing more, so the values would
be "CPU", "PCI", "machine" and "none".

I'm not super-enthusiastic about "MACHINE" here, but
I guess we can see how it works out over time.

> +/**
> + * typedef MemTxAttrs - attributes of a memory transaction
> + *
> + * Every memory transaction has associated with it a set of
>   * attributes. Some of these are generic (such as the ID of
>   * the bus master); some are specific to a particular kind of
>   * bus (such as the ARM Secure/NonSecure bit). We define them
> @@ -23,13 +48,12 @@
>   * different semantics.
>   */
>  typedef struct MemTxAttrs {
> -    /* Bus masters which don't specify any attributes will get this
> -     * (via the MEMTXATTRS_UNSPECIFIED constant), so that we can
> -     * distinguish "all attributes deliberately clear" from
> -     * "didn't specify" if necessary.
> -     */
> -    unsigned int unspecified:1;
> -    /* ARM/AMBA: TrustZone Secure access
> +    /* Requester type (e.g. CPU or PCI MSI) */
> +    MemTxRequesterType requester_type:2;
> +    /* Requester ID */
> +    unsigned int requester_id:16;
> +    /*
> +     * ARM/AMBA: TrustZone Secure access
>       * x86: System Management Mode access
>       */
>      unsigned int secure:1;
> @@ -43,8 +67,6 @@ typedef struct MemTxAttrs {
>       * (see MEMTX_ACCESS_ERROR).
>       */
>      unsigned int memory:1;
> -    /* Requester ID (for MSI for example) */
> -    unsigned int requester_id:16;
>      /* Invert endianness for this page */
>      unsigned int byte_swap:1;
>      /*
> @@ -59,12 +81,28 @@ typedef struct MemTxAttrs {
>      unsigned int target_tlb_bit2 : 1;
>  } MemTxAttrs;
>
> -/* Bus masters which don't specify any attributes will get this,
> - * which has all attribute bits clear except the topmost one
> - * (so that we can distinguish "all attributes deliberately clear"
> - * from "didn't specify" if necessary).
> +/*
> + * Bus masters which don't specify any attributes will get this which
> + * indicates none of the attributes can be used.
> + */
> +#define MEMTXATTRS_UNSPECIFIED ((MemTxAttrs) \
> +                                { .requester_type =3D MTRT_UNSPECIFIED }=
)

This isn't the semantics I intended for MEMTXATTRS_UNSPECIFIED --
the recipient of a MEMTXATTRS_UNSPECIFIED is still allowed to look
at the various attribute bits, which should be set to "plausible
defaults". It just means that you can tell, for instance, "non-secure
because sender specifically asked for that" from "non-secure because
sender is an old bit of non-memtxattrs-aware code that doesn't
care to specify". Almost all code that looks at attrs.secure, for
instance, does it without previously checking attrs.unspecified,
because it doesn't have to. There are only a very few places that
do need to check attrs.unspecified:
 * the two places changed in this patch, which are really trying
   to check "is this a PCI transaction with PCI requester_id"
 * tz-mpc.c, which wants to treat MEMTXATTRS_UNSPECIFIED as being
   Secure for the reasons described in the comment in
   tz_mpc_attrs_to_index()

Perhaps what we should do is address the reason that tz-mpc.c
is trying to use attrs.unspecified in a better way. Specifically,
we could add a MemTxAttrs:is_debug bit that indicates debug
writes, and arrange that code like the rom-image-loader sets
that appropriately. Then tz-mpc.c could say "pass through a
debug transaction regardless of its secure bit, but treat
real transactions the way the hardware does", instead of the
current fudge it does.

> +/*
> + * Helper for setting a basic CPU sourced transaction, it expects a
> + * CPUState *
> + */
> +#define MEMTXATTRS_CPU(cs) ((MemTxAttrs) \
> +                            {.requester_type =3D MTRT_CPU, \
> +                             .requester_id =3D cs->cpu_index})
> +
> +/*
> + * Helper for setting a basic PCI sourced transaction, it expects a
> + * PCIDevice *
>   */
> -#define MEMTXATTRS_UNSPECIFIED ((MemTxAttrs) { .unspecified =3D 1 })
> +#define MEMTXATTRS_PCI(dev) ((MemTxAttrs) \
> +                             {.requester_type =3D MTRT_PCI,   \
> +                             .requester_id =3D pci_requester_id(dev)})

Indent looks odd.

>  /* New-style MMIO accessors can indicate that the transaction failed.
>   * A zero (MEMTX_OK) response means success; anything else is a failure
> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index 725f69095b..284359c16e 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -153,9 +153,7 @@ static void amdvi_assign_andq(AMDVIState *s, hwaddr a=
ddr, uint64_t val)
>  static void amdvi_generate_msi_interrupt(AMDVIState *s)
>  {
>      MSIMessage msg =3D {};
> -    MemTxAttrs attrs =3D {
> -        .requester_id =3D pci_requester_id(&s->pci.dev)
> -    };
> +    MemTxAttrs attrs =3D MEMTXATTRS_PCI(&s->pci.dev);
>
>      if (msi_enabled(&s->pci.dev)) {
>          msg =3D msi_get_message(&s->pci.dev, 0);
> @@ -1356,7 +1354,7 @@ static MemTxResult amdvi_mem_ir_write(void *opaque,=
 hwaddr addr,
>
>      trace_amdvi_mem_ir_write_req(addr, value, size);
>
> -    if (!attrs.unspecified) {
> +    if (attrs.requester_type =3D=3D MTRT_PCI) {
>          /* We have explicit Source ID */
>          sid =3D attrs.requester_id;
>      }
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index a08ee85edf..12752413eb 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3517,7 +3517,7 @@ static MemTxResult vtd_mem_ir_write(void *opaque, h=
waddr addr,
>      from.address =3D (uint64_t) addr + VTD_INTERRUPT_ADDR_FIRST;
>      from.data =3D (uint32_t) value;
>
> -    if (!attrs.unspecified) {
> +    if (attrs.requester_type =3D=3D MTRT_PCI) {
>          /* We have explicit Source ID */
>          sid =3D attrs.requester_id;
>      }
> diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
> index 30481e1c90..4beb5daa1a 100644
> --- a/hw/misc/tz-mpc.c
> +++ b/hw/misc/tz-mpc.c
> @@ -461,7 +461,7 @@ static int tz_mpc_attrs_to_index(IOMMUMemoryRegion *i=
ommu, MemTxAttrs attrs)
>       * All the real during-emulation transactions from the CPU will
>       * specify attributes.
>       */
> -    return (attrs.unspecified || attrs.secure) ? IOMMU_IDX_S : IOMMU_IDX=
_NS;
> +    return ((attrs.requester_type =3D=3D MTRT_UNSPECIFIED) || attrs.secu=
re) ? IOMMU_IDX_S : IOMMU_IDX_NS;
>  }
>
>  static int tz_mpc_num_indexes(IOMMUMemoryRegion *iommu)
> diff --git a/hw/misc/tz-msc.c b/hw/misc/tz-msc.c
> index acbe94400b..e93bfc7083 100644
> --- a/hw/misc/tz-msc.c
> +++ b/hw/misc/tz-msc.c
> @@ -137,11 +137,9 @@ static MemTxResult tz_msc_read(void *opaque, hwaddr =
addr, uint64_t *pdata,
>          return MEMTX_OK;
>      case MSCAllowSecure:
>          attrs.secure =3D 1;
> -        attrs.unspecified =3D 0;
>          break;
>      case MSCAllowNonSecure:
>          attrs.secure =3D 0;
> -        attrs.unspecified =3D 0;
>          break;
>      }
>
> @@ -179,11 +177,11 @@ static MemTxResult tz_msc_write(void *opaque, hwadd=
r addr, uint64_t val,
>          return MEMTX_OK;
>      case MSCAllowSecure:
>          attrs.secure =3D 1;
> -        attrs.unspecified =3D 0;
> +        attrs.requester_type =3D MTRT_CPU;
>          break;
>      case MSCAllowNonSecure:
>          attrs.secure =3D 0;
> -        attrs.unspecified =3D 0;
> +        attrs.requester_type =3D MTRT_CPU;
>          break;
>      }

Whatever we do here, the handling of read and write transactions
should be the same, not different.

Forcing the requester_type to "this is the CPU" looks odd,
because the transaction might not be from the CPU (it could
be from a DMA-capable device).

I think probably the right thing here is "set attrs.secure as
required; don't touch any other fields of the attrs".

> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 2f450f6a72..1d0d8d866f 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -319,9 +319,7 @@ void pci_device_deassert_intx(PCIDevice *dev)
>
>  static void pci_msi_trigger(PCIDevice *dev, MSIMessage msg)
>  {
> -    MemTxAttrs attrs =3D {};
> -
> -    attrs.requester_id =3D pci_requester_id(dev);
> +    MemTxAttrs attrs =3D MEMTXATTRS_PCI(dev);
>      address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
>                           attrs, NULL);
>  }
> --
> 2.34.1

thanks
-- PMM
