Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1597433ejc;
        Sun, 29 Oct 2023 19:26:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETBu3XkbZYZ0p8MtX6ii9t/l5hauNp/41w6TWqkmSMLIb8o4RJIj04JaxAOXSru4+CUSPM
X-Received: by 2002:a05:620a:29c6:b0:775:9041:73dc with SMTP id s6-20020a05620a29c600b00775904173dcmr9500617qkp.16.1698632787905;
        Sun, 29 Oct 2023 19:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698632787; cv=none;
        d=google.com; s=arc-20160816;
        b=ypkUKD4oKJrXTOyzxwD6x1HBEBXCpw0Klyy5XTj5s78iYLQEHdLGE4lQ4Xg1nonJ0H
         O9pkRIx6IpQ83dVammDKcjfXo9EEfyRuYXxYRVOkSd1nV8zf5Reg8BEp5rpmwOyrhh9W
         AqfulTZn29CwEU4laIqDW3cZZ9VSpyFwsungyd0JYvQf8bhN8sDIeIkKSg0OWXvrriOg
         dvBjVunvcqQ7uXjAWSqLd8MAQMMjmTVgGgmU7dEH0ED9SkVsBFEv1v0EM6ixz4z+VW6N
         QNmoZ7Vd2X+jonRlc/ztevT00XGCpPVafFF2kPG9pLO57tMzDQnB0yyMkYtxDtPsf+j+
         pCQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jn4Z9nUUhPmNYK9F3f8jXsaUoLjAAdjofrlf7RkKUBc=;
        fh=SqNJjHEDtlPLFz1ZadpBH6+TtBgrqxw7gCbH3ncfWh4=;
        b=ArmjakGF2jy1PrMdUPn3MSjTKM5ZQFWmgmTc9PSiG+PbBAXWRyABhcRW3iTp9Z8th2
         7P+lrKCD6l9hwHsBt3hjBZZhO9nA/+XzJ7gyf7HgVcZcefrQLxkpcHId+b+KrG5fZN+A
         HAyrKc031IQExjjawtrB4Dj3NzbBEJekS54nGFgCnt2ywcqiavqlfa+/BeWO+0kZy5mG
         JOk/YXn2EYvJxRA7lHh1B/eLv6DrVgXkci9RCkNZZspEpm6q5UUF2JUfqqfd/5TPauO7
         wSi0W40XqQPDuQtnKtBiWcuYBr0lvCvEi5gQ2/eBQArQ/Ly+YhX4FFOztoxCgGSV6ZKn
         6WBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LRjDVxA0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b20-20020a05620a127400b007759389094esi4631241qkl.82.2023.10.29.19.26.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Oct 2023 19:26:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LRjDVxA0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxHyh-0006nd-FL; Sun, 29 Oct 2023 22:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxHyg-0006nF-3t; Sun, 29 Oct 2023 22:26:06 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxHye-0006fb-EM; Sun, 29 Oct 2023 22:26:05 -0400
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-457c4e4a392so1002256137.0; 
 Sun, 29 Oct 2023 19:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698632762; x=1699237562; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jn4Z9nUUhPmNYK9F3f8jXsaUoLjAAdjofrlf7RkKUBc=;
 b=LRjDVxA0tEHMzwvgQ7Xjfmrrwl8bd/SBJGuvK0/RjAwyEGnWSFyCP3jlsRdDRWWaRg
 N4Tc/gMpCKn+93BNfOa32ElQhovQh1Hz8TABSC3wYNZu5CM4uqzDclJfsxp3QI7ERmIL
 3cmJ4gRnm2gnkhmFW6njiXvh903xM5ISa6upI3bpgAlN9OfzaaIaaqzLAWySP8lnPobM
 UbqC7FjzwM1AFL8jNBaHQ/s0p89guyH8OMrlbDtL2ACjVvUGwe7Jxlvl7Qm8FwpdmiSL
 mEWJ1yb+ofT7zkt06RnRE7uwBmlVMPyLHDO/AvmsxDNoFLjqpp02tnxaJkqZtrC90wTt
 ca7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698632762; x=1699237562;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jn4Z9nUUhPmNYK9F3f8jXsaUoLjAAdjofrlf7RkKUBc=;
 b=OhBNULiUxr4rEP6MIe5HtiTBYVZcx+2ow6VNj7fVLH/uwzl4NOrdc/9JeFebmlNHEO
 ZWrKkhir6K1/nu9E0gYoPjN76+KOIzZQJHruRJim8bu5/6bUvbdcP5QcVmdifIePLroP
 YYenq5LgvmnqX5O+jeJ/rLGETSrhjerLhiiCvIwbMjvYT6Ttb8+IULQKDeg7M3uZRx2V
 EnBqfKiQNr02S74TUxkAFn/SmOU5LL8RZpf0E8v+VImR35MqtE+MGg88kobS30eiMoL5
 vvL1yoRiwegnoCZNCsPRhO50xh54rDgHhz5Xi70dzckfSMThQHEapakJNDundjGTo5YG
 rm8Q==
X-Gm-Message-State: AOJu0YwTik6ATTLbT0pLfyAFkeJSMq+LQEcpLFM54kz2+Xvk37RmPbzS
 KEg8UtXQ3FdBiNcK4CnM7JoqI69Xt8uZIwl0v3UBWK/x3qM=
X-Received: by 2002:a67:ac47:0:b0:45a:a173:ab01 with SMTP id
 n7-20020a67ac47000000b0045aa173ab01mr4364580vsh.12.1698632762448; Sun, 29 Oct
 2023 19:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
 <20231025200713.580814-11-sunilvl@ventanamicro.com>
In-Reply-To: <20231025200713.580814-11-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Oct 2023 12:25:35 +1000
Message-ID: <CAKmqyKNaqR1i47usFYcz3pigyMxRQsssC+229Y1WZu591rhqLg@mail.gmail.com>
Subject: Re: [PATCH v4 10/13] hw/pci-host/gpex: Define properties for MMIO
 ranges
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mXy3u7OaHbWv

On Thu, Oct 26, 2023 at 6:12=E2=80=AFAM Sunil V L <sunilvl@ventanamicro.com=
> wrote:
>
> ACPI DSDT generator needs information like ECAM range, PIO range, 32-bit
> and 64-bit PCI MMIO range etc related to the PCI host bridge. Instead of
> making these values machine specific, create properties for the GPEX
> host bridge with default value 0. During initialization, the firmware
> can initialize these properties with correct values for the platform.
> This basically allows DSDT generator code independent of the machine
> specific memory map accesses.
>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/pci-host/gpex-acpi.c    | 13 +++++++++++++
>  hw/pci-host/gpex.c         | 12 ++++++++++++
>  include/hw/pci-host/gpex.h | 28 ++++++++++++++++++++--------
>  3 files changed, 45 insertions(+), 8 deletions(-)
>
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index 1092dc3b70..f69413ea2c 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -281,3 +281,16 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfi=
g *cfg)
>
>      crs_range_set_free(&crs_range_set);
>  }
> +
> +void acpi_dsdt_add_gpex_host(Aml *scope, uint32_t irq)
> +{
> +    bool ambig;
> +    Object *obj =3D object_resolve_path_type("", TYPE_GPEX_HOST, &ambig)=
;
> +
> +    if (!obj || ambig) {
> +        return;
> +    }
> +
> +    GPEX_HOST(obj)->gpex_cfg.irq =3D irq;
> +    acpi_dsdt_add_gpex(scope, &GPEX_HOST(obj)->gpex_cfg);
> +}
> diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
> index a6752fac5e..41f4e73f6e 100644
> --- a/hw/pci-host/gpex.c
> +++ b/hw/pci-host/gpex.c
> @@ -154,6 +154,18 @@ static Property gpex_host_properties[] =3D {
>       */
>      DEFINE_PROP_BOOL("allow-unmapped-accesses", GPEXHost,
>                       allow_unmapped_accesses, true),
> +    DEFINE_PROP_UINT64(PCI_HOST_ECAM_BASE, GPEXHost, gpex_cfg.ecam.base,=
 0),
> +    DEFINE_PROP_SIZE(PCI_HOST_ECAM_SIZE, GPEXHost, gpex_cfg.ecam.size, 0=
),
> +    DEFINE_PROP_UINT64(PCI_HOST_PIO_BASE, GPEXHost, gpex_cfg.pio.base, 0=
),
> +    DEFINE_PROP_SIZE(PCI_HOST_PIO_SIZE, GPEXHost, gpex_cfg.pio.size, 0),
> +    DEFINE_PROP_UINT64(PCI_HOST_BELOW_4G_MMIO_BASE, GPEXHost,
> +                       gpex_cfg.mmio32.base, 0),
> +    DEFINE_PROP_SIZE(PCI_HOST_BELOW_4G_MMIO_SIZE, GPEXHost,
> +                     gpex_cfg.mmio32.size, 0),
> +    DEFINE_PROP_UINT64(PCI_HOST_ABOVE_4G_MMIO_BASE, GPEXHost,
> +                       gpex_cfg.mmio64.base, 0),
> +    DEFINE_PROP_SIZE(PCI_HOST_ABOVE_4G_MMIO_SIZE, GPEXHost,
> +                     gpex_cfg.mmio64.size, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index b0240bd768..441c6b8b20 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -40,6 +40,15 @@ struct GPEXRootState {
>      /*< public >*/
>  };
>
> +struct GPEXConfig {
> +    MemMapEntry ecam;
> +    MemMapEntry mmio32;
> +    MemMapEntry mmio64;
> +    MemMapEntry pio;
> +    int         irq;
> +    PCIBus      *bus;
> +};
> +
>  struct GPEXHost {
>      /*< private >*/
>      PCIExpressHost parent_obj;
> @@ -55,19 +64,22 @@ struct GPEXHost {
>      int irq_num[GPEX_NUM_IRQS];
>
>      bool allow_unmapped_accesses;
> -};
>
> -struct GPEXConfig {
> -    MemMapEntry ecam;
> -    MemMapEntry mmio32;
> -    MemMapEntry mmio64;
> -    MemMapEntry pio;
> -    int         irq;
> -    PCIBus      *bus;
> +    struct GPEXConfig gpex_cfg;
>  };
>
>  int gpex_set_irq_num(GPEXHost *s, int index, int gsi);
>
>  void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg);
> +void acpi_dsdt_add_gpex_host(Aml *scope, uint32_t irq);
> +
> +#define PCI_HOST_PIO_BASE               "pio-base"
> +#define PCI_HOST_PIO_SIZE               "pio-size"
> +#define PCI_HOST_ECAM_BASE              "ecam-base"
> +#define PCI_HOST_ECAM_SIZE              "ecam-size"
> +#define PCI_HOST_BELOW_4G_MMIO_BASE     "below-4g-mmio-base"
> +#define PCI_HOST_BELOW_4G_MMIO_SIZE     "below-4g-mmio-size"
> +#define PCI_HOST_ABOVE_4G_MMIO_BASE     "above-4g-mmio-base"
> +#define PCI_HOST_ABOVE_4G_MMIO_SIZE     "above-4g-mmio-size"
>
>  #endif /* HW_GPEX_H */
> --
> 2.39.2
>
>
