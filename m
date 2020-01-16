Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7725770lff;
        Wed, 15 Jan 2020 17:46:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqzpZDfOlcf376V3BlLaKNlaUWlY4N/7T0EnoHsq1BbqKy+fVO1sCqzj8CWuAZjEhwf4ZCDB
X-Received: by 2002:a50:f982:: with SMTP id q2mr32879350edn.55.1579139179834;
        Wed, 15 Jan 2020 17:46:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579139179; cv=none;
        d=google.com; s=arc-20160816;
        b=j/HKb/xd7pfGUeTNBG6/OuMiVVfRfG12+YcaH03GMNSDy4ziP9vttujKgeUc6b/hWI
         c1Y+8GCHLIm7K2QiLuX1t+q+dzdWEMOHGJtLrMmNkN+uZM/kDb1nuM0s2923XrDf76ui
         9u2XKqbq3JekZMnaotQhPz3PfUK1ohDgu68DIKbD74MYNgQeDzNBH3cOtUT/3QJSS9eT
         D6qesP5iR/EjmRcSZmGLQ9U6/sGbAD1F+IxDIamhwujhEtlL5B6UYu8d34PS0r6rx6d/
         z1YQbGpyhWtuiBu/hZpuwEKx4JtINFfFuSdD5SGVoQDZWYdt+Fn3ZpLMSHUHYqMGB3MB
         upFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ua8duYP8yA9XTvJJ75SbTiBbb4oyC0VTSk6idRgcdRc=;
        b=J9V4/VMmFZ5EFG1SYinXJjK3lITZ/Gj4TRSCwJpuxa1rlazEWVCHfqSnNCRm27Y8d4
         CMxhcpD3s++7y+pTqPHqU8BDuYMO8I1BKOz6Gban+ssYyeeNRDkMUSmWc9lDO4X4eLbm
         HnhZOX/L8Xo8McOoDkX0lXB7f6i+dFGjTMtVWMjtFF8MuIRX2KNnmQ0DQ/TnQ3x7Ubsh
         dTSkhgUUHzYFtV5ZuZXrsvBfF+DHYdFiTZ+l1VB7OiQhSQYE0nqgld/fu87fURv1HZNM
         lT8XWDWwJsjqxClxFHLYQ6AHdjJbxzcKerCSvr551i47oXIYQFNkic4dhffpnFfMGZb8
         7kIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=aWr3SRO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pw3si12499216ejb.244.2020.01.15.17.46.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 17:46:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=aWr3SRO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iruEk-0004y1-B9
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 20:46:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39457)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iruED-0004vX-R6
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 20:45:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iruEB-0001KM-Ju
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 20:45:45 -0500
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44]:36348)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iruE5-0001HD-VU; Wed, 15 Jan 2020 20:45:38 -0500
Received: by mail-qv1-xf44.google.com with SMTP id m14so8372733qvl.3;
 Wed, 15 Jan 2020 17:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ua8duYP8yA9XTvJJ75SbTiBbb4oyC0VTSk6idRgcdRc=;
 b=aWr3SRO3XG1R+GPRfzKkZoE5YCouEgAf/F3RVdHXHXHpFQwUR5Qia/+mBHMzK+IWVZ
 8cqEXpfB3KT/1kGP7nQz7tGn19+JcZ9FnwgQBFcDaepzJem2rj4hTjYB2MvbvEInoO5T
 HHVowSTSVyKVgfrB4ZTMh36HzMGw871Mv5iu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ua8duYP8yA9XTvJJ75SbTiBbb4oyC0VTSk6idRgcdRc=;
 b=fEhPeYqtpqS4R+IrB/LUpqmxjy1ORpXEx2qaGZwK4iCoWRTxcxmmedSdPrRAR9k3f4
 XLVJbrBuRWAJmDe6lHngDfOzG7LiPyZf12Zke4z6NwVdAHE1taBCpz0UqIMgDL7nIynd
 lsHfFLshLbLcX/tyvpoTYhHhjUqhWKsaoCPadcML54i5Wo+PNVXrhZcNO1QIzHw85IVE
 ZfDLWfwStCriH7DTJrpf0Ni52Tb1ssrBMAbed3iTKEczGDiFZbjXHTXrcwVoY3baJCvo
 7oFix00WNndYOniMHH2K0yn6ggPSQoyFN6U5uKh/bXpTbtWR7tkScsUurboHyo+OInMe
 PImg==
X-Gm-Message-State: APjAAAX0jc3UGMpZUPZmDr7fP1+PP6xrI0MGxhInAnP/KqRZrwVoc8B+
 mfGE0q2WmBmca9O6VgcpmfxeuZSniPLWnsvWZrU=
X-Received: by 2002:a0c:b2c7:: with SMTP id d7mr286380qvf.111.1579139136269;
 Wed, 15 Jan 2020 17:45:36 -0800 (PST)
MIME-Version: 1.0
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-8-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-8-git-send-email-imammedo@redhat.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Jan 2020 01:45:24 +0000
Message-ID: <CACPK8XfqZQ+6D=XJ8h2jb_LCPW=8OVSqnrRWVAUXGywJManA9g@mail.gmail.com>
Subject: Re: [PATCH v2 07/86] arm:aspeed: convert valid RAM sizes to data
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::f44
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NYV3358Vd3ju

On Wed, 15 Jan 2020 at 15:10, Igor Mammedov <imammedo@redhat.com> wrote:
>
> various foo_rambits() hardcode mapping of RAM sizes to RAM feature bits,
> which is hard to reuse and repeats over and over.
>
> Convert maps into GLib's hash tables and perform mapping using
> common mapping function.

Thanks for the patch.

I find the existing code straight forward to understand, and for this
reason I would prefer to leave it as it is. Would you mind dropping
this patch from your series?

>
> Follow up patch will reuse tables for actually checking ram-size
> property.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: clg@kaod.org
> CC: peter.maydell@linaro.org
> CC: andrew@aj.id.au
> CC: joel@jms.id.au
> CC: qemu-arm@nongnu.org
> ---
>  include/hw/misc/aspeed_sdmc.h |   2 +
>  hw/misc/aspeed_sdmc.c         | 116 ++++++++++++++++--------------------------
>  2 files changed, 47 insertions(+), 71 deletions(-)
>
> diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.h
> index 5dbde59..de1501f 100644
> --- a/include/hw/misc/aspeed_sdmc.h
> +++ b/include/hw/misc/aspeed_sdmc.h
> @@ -39,6 +39,8 @@ typedef struct AspeedSDMCState {
>  typedef struct AspeedSDMCClass {
>      SysBusDeviceClass parent_class;
>
> +    GHashTable *ram2feat;
> +    int fallback_ram_size;
>      uint64_t max_ram_size;
>      uint32_t (*compute_conf)(AspeedSDMCState *s, uint32_t data);
>      void (*write)(AspeedSDMCState *s, uint32_t reg, uint32_t data);
> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
> index 2df3244..3fc80f0 100644
> --- a/hw/misc/aspeed_sdmc.c
> +++ b/hw/misc/aspeed_sdmc.c
> @@ -148,72 +148,6 @@ static const MemoryRegionOps aspeed_sdmc_ops = {
>      .valid.max_access_size = 4,
>  };
>
> -static int ast2400_rambits(AspeedSDMCState *s)
> -{
> -    switch (s->ram_size >> 20) {
> -    case 64:
> -        return ASPEED_SDMC_DRAM_64MB;
> -    case 128:
> -        return ASPEED_SDMC_DRAM_128MB;
> -    case 256:
> -        return ASPEED_SDMC_DRAM_256MB;
> -    case 512:
> -        return ASPEED_SDMC_DRAM_512MB;
> -    default:
> -        break;
> -    }
> -
> -    /* use a common default */
> -    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 256M",
> -                s->ram_size);
> -    s->ram_size = 256 << 20;
> -    return ASPEED_SDMC_DRAM_256MB;
> -}
> -
> -static int ast2500_rambits(AspeedSDMCState *s)
> -{
> -    switch (s->ram_size >> 20) {
> -    case 128:
> -        return ASPEED_SDMC_AST2500_128MB;
> -    case 256:
> -        return ASPEED_SDMC_AST2500_256MB;
> -    case 512:
> -        return ASPEED_SDMC_AST2500_512MB;
> -    case 1024:
> -        return ASPEED_SDMC_AST2500_1024MB;
> -    default:
> -        break;
> -    }
> -
> -    /* use a common default */
> -    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 512M",
> -                s->ram_size);
> -    s->ram_size = 512 << 20;
> -    return ASPEED_SDMC_AST2500_512MB;
> -}
> -
> -static int ast2600_rambits(AspeedSDMCState *s)
> -{
> -    switch (s->ram_size >> 20) {
> -    case 256:
> -        return ASPEED_SDMC_AST2600_256MB;
> -    case 512:
> -        return ASPEED_SDMC_AST2600_512MB;
> -    case 1024:
> -        return ASPEED_SDMC_AST2600_1024MB;
> -    case 2048:
> -        return ASPEED_SDMC_AST2600_2048MB;
> -    default:
> -        break;
> -    }
> -
> -    /* use a common default */
> -    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 1024M",
> -                s->ram_size);
> -    s->ram_size = 1024 << 20;
> -    return ASPEED_SDMC_AST2600_1024MB;
> -}
> -
>  static void aspeed_sdmc_reset(DeviceState *dev)
>  {
>      AspeedSDMCState *s = ASPEED_SDMC(dev);
> @@ -257,11 +191,14 @@ static Property aspeed_sdmc_properties[] = {
>  static void aspeed_sdmc_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedSDMCClass *asc = ASPEED_SDMC_CLASS(klass);
> +
>      dc->realize = aspeed_sdmc_realize;
>      dc->reset = aspeed_sdmc_reset;
>      dc->desc = "ASPEED SDRAM Memory Controller";
>      dc->vmsd = &vmstate_aspeed_sdmc;
>      dc->props = aspeed_sdmc_properties;
> +    asc->ram2feat = g_hash_table_new(g_direct_hash, g_direct_equal);
>  }
>
>  static const TypeInfo aspeed_sdmc_info = {
> @@ -273,10 +210,28 @@ static const TypeInfo aspeed_sdmc_info = {
>      .abstract   = true,
>  };
>
> +static int aspeed_get_ram_feat(AspeedSDMCState *s)
> +{
> +    AspeedSDMCClass *asc = ASPEED_SDMC_GET_CLASS(s);
> +    int ram_mb = s->ram_size >> 20;
> +    gpointer val;
> +
> +    if (g_hash_table_contains(asc->ram2feat, GINT_TO_POINTER(ram_mb))) {
> +        val = g_hash_table_lookup(asc->ram2feat, GINT_TO_POINTER(ram_mb));
> +        return GPOINTER_TO_INT(val);
> +    }
> +
> +    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default %dM",
> +                 s->ram_size, asc->fallback_ram_size);
> +    s->ram_size = asc->fallback_ram_size << 20;
> +    val = g_hash_table_lookup(asc->ram2feat, &asc->fallback_ram_size);
> +    return GPOINTER_TO_INT(val);
> +}
> +
>  static uint32_t aspeed_2400_sdmc_compute_conf(AspeedSDMCState *s, uint32_t data)
>  {
> -    uint32_t fixed_conf = ASPEED_SDMC_VGA_COMPAT |
> -        ASPEED_SDMC_DRAM_SIZE(ast2400_rambits(s));
> +    int ram_f = aspeed_get_ram_feat(s);
> +    uint32_t fixed_conf = ASPEED_SDMC_VGA_COMPAT | ASPEED_SDMC_DRAM_SIZE(ram_f);
>
>      /* Make sure readonly bits are kept */
>      data &= ~ASPEED_SDMC_READONLY_MASK;
> @@ -298,6 +253,9 @@ static void aspeed_2400_sdmc_write(AspeedSDMCState *s, uint32_t reg,
>      s->regs[reg] = data;
>  }
>
> +#define REGISTER_RAM_SIZE(h, k, v) \
> +    g_hash_table_insert(h->ram2feat, GINT_TO_POINTER(k), GINT_TO_POINTER(v))
> +
>  static void aspeed_2400_sdmc_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -307,6 +265,11 @@ static void aspeed_2400_sdmc_class_init(ObjectClass *klass, void *data)
>      asc->max_ram_size = 512 << 20;
>      asc->compute_conf = aspeed_2400_sdmc_compute_conf;
>      asc->write = aspeed_2400_sdmc_write;
> +    asc->fallback_ram_size = 256;
> +    REGISTER_RAM_SIZE(asc, 64, ASPEED_SDMC_DRAM_64MB);
> +    REGISTER_RAM_SIZE(asc, 128, ASPEED_SDMC_DRAM_128MB);
> +    REGISTER_RAM_SIZE(asc, 256, ASPEED_SDMC_DRAM_256MB);
> +    REGISTER_RAM_SIZE(asc, 512, ASPEED_SDMC_DRAM_512MB);
>  }
>
>  static const TypeInfo aspeed_2400_sdmc_info = {
> @@ -317,10 +280,10 @@ static const TypeInfo aspeed_2400_sdmc_info = {
>
>  static uint32_t aspeed_2500_sdmc_compute_conf(AspeedSDMCState *s, uint32_t data)
>  {
> +    int ram_f = aspeed_get_ram_feat(s);
>      uint32_t fixed_conf = ASPEED_SDMC_HW_VERSION(1) |
>          ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
> -        ASPEED_SDMC_CACHE_INITIAL_DONE |
> -        ASPEED_SDMC_DRAM_SIZE(ast2500_rambits(s));
> +        ASPEED_SDMC_CACHE_INITIAL_DONE | ASPEED_SDMC_DRAM_SIZE(ram_f);
>
>      /* Make sure readonly bits are kept */
>      data &= ~ASPEED_SDMC_AST2500_READONLY_MASK;
> @@ -360,6 +323,11 @@ static void aspeed_2500_sdmc_class_init(ObjectClass *klass, void *data)
>      asc->max_ram_size = 1024 << 20;
>      asc->compute_conf = aspeed_2500_sdmc_compute_conf;
>      asc->write = aspeed_2500_sdmc_write;
> +    asc->fallback_ram_size = 512;
> +    REGISTER_RAM_SIZE(asc, 128, ASPEED_SDMC_AST2500_128MB);
> +    REGISTER_RAM_SIZE(asc, 256, ASPEED_SDMC_AST2500_256MB);
> +    REGISTER_RAM_SIZE(asc, 512, ASPEED_SDMC_AST2500_512MB);
> +    REGISTER_RAM_SIZE(asc, 1024, ASPEED_SDMC_AST2500_1024MB);
>  }
>
>  static const TypeInfo aspeed_2500_sdmc_info = {
> @@ -370,9 +338,10 @@ static const TypeInfo aspeed_2500_sdmc_info = {
>
>  static uint32_t aspeed_2600_sdmc_compute_conf(AspeedSDMCState *s, uint32_t data)
>  {
> +    int ram_f = aspeed_get_ram_feat(s);
>      uint32_t fixed_conf = ASPEED_SDMC_HW_VERSION(3) |
>          ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
> -        ASPEED_SDMC_DRAM_SIZE(ast2600_rambits(s));
> +        ASPEED_SDMC_DRAM_SIZE(ram_f);
>
>      /* Make sure readonly bits are kept (use ast2500 mask) */
>      data &= ~ASPEED_SDMC_AST2500_READONLY_MASK;
> @@ -413,6 +382,11 @@ static void aspeed_2600_sdmc_class_init(ObjectClass *klass, void *data)
>      asc->max_ram_size = 2048 << 20;
>      asc->compute_conf = aspeed_2600_sdmc_compute_conf;
>      asc->write = aspeed_2600_sdmc_write;
> +    asc->fallback_ram_size = 512;
> +    REGISTER_RAM_SIZE(asc, 256, ASPEED_SDMC_AST2600_256MB);
> +    REGISTER_RAM_SIZE(asc, 512, ASPEED_SDMC_AST2600_512MB);
> +    REGISTER_RAM_SIZE(asc, 1024, ASPEED_SDMC_AST2600_1024MB);
> +    REGISTER_RAM_SIZE(asc, 2048, ASPEED_SDMC_AST2600_2048MB);
>  }
>
>  static const TypeInfo aspeed_2600_sdmc_info = {
> --
> 2.7.4
>
