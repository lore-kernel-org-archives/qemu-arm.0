Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1324053ejm;
        Fri, 22 Sep 2023 06:46:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzImBhCOYiKfEwsPRwuY09d7Qsh+lL+rGSrCHZs+IFDOm6zMzpP7eKltiVDj1oRQYr6pQa
X-Received: by 2002:a05:6902:c8:b0:d0a:353b:b939 with SMTP id i8-20020a05690200c800b00d0a353bb939mr8154167ybs.52.1695390385601;
        Fri, 22 Sep 2023 06:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695390385; cv=none;
        d=google.com; s=arc-20160816;
        b=ZlSt4KEtdRIszDsGCIEczqlJHEiICl7xGpBHTOvOMnpO4Dylu+AYzfdXeHhXwqwy03
         VSWGLAEKi/NtPH4rNJNxP9gOMsqMNl3oEYPRqPB8oyr6R+JpcZcFRTVfNNk5Xm4TjSPc
         PADbDpuWP/EYNU0YqxNfbGQSGEobPWnEXdwXA8CNWSOO73FswM8C+/3AbgayO086HOXW
         RaGB7O4INuXtTNfbFa3nS61z/sJA/KN7uMn00k9OaRmKkYpk4H5KykQdIGkEZ8NoRMFy
         aKybQVjUDGfzJRxLdo7rNSjyW1elw9p11sFZdHIY8HXZIBCNbyi1s+QfUF6ufQ4Z0wAO
         efSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=t4HTSU6Q5HrLKFQMqCA8piV7mEUFQ/7TzeL9PPjMor0=;
        fh=ACk+PBC/P8Ce6garD3iFhzYIkDurVIJusmhKeqY0/Vk=;
        b=STl2HvJPhIRsMqsMk/NRMGl+FxJt5Rsa7RJuVpnn5zx1TtBbNp2U4eqlvMYE1/EUZ+
         V7rCBYFd3fL/v/DZ/YK6gQ4g8ULQGmURsPLTCtZdFx3wfwrpc4m6okOTRjVGGK4+uceY
         wunehYz0WOEK6bBr0kKXZ9HRMq+ConL52nJPmGdBbTa1xcJwIZ19aOcmJ1/jNu8du8jF
         YzSjWztlrtGvn7SGHX0CYYMf7lB1axypdHGpkJwOWQKLk5r4Gwhaxn/iei0GN3IorMBD
         G00sxhXvInpMIOl9kodIr0wxgGrGoV9NiIKtKfD0ZIPhT2HiZaL8YKJbbHw9VinzLHK0
         jBUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=JG+Pbo3Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17-20020a05620a441100b00774182478b5si626621qkp.11.2023.09.22.06.46.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 06:46:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=JG+Pbo3Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjgTv-0000NF-By; Fri, 22 Sep 2023 09:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qjgTn-0000M4-Ph
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 09:46:04 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qjgTk-0002fo-PO
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 09:45:58 -0400
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3aca1543608so1337742b6e.0
 for <qemu-arm@nongnu.org>; Fri, 22 Sep 2023 06:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695390353; x=1695995153; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t4HTSU6Q5HrLKFQMqCA8piV7mEUFQ/7TzeL9PPjMor0=;
 b=JG+Pbo3QanGEG1pDn+NJAw6oEDbj0CoPgLsjPceT9TCJxpSyZfGLC1WLdGSUy6fq6P
 4L+CHIS6lCGRfSLzO7LAFng0Sjf4+9Ulp93d2vn+D/ROrZWQQmAbZzpH4IHH10B0kL1S
 SCOGwCKezqnaeueHccmFtF1NNP4y8F1OYTxpYM4IAv6h36N9BPWMGTxhFfaVaRcAPqR7
 BWelgD8Fl9BINrbaQZfxC1vzyotEm+e8bUq0eNgtKwQ/QM3oGywR77ayVUl7bSogP1nE
 d7VOuWOeVC0YER1q/u7rBGwNbPRJKeJ6VkRaaD/L+YKa2iLkNRBGicObqd2MkdotUSTV
 xTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695390353; x=1695995153;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t4HTSU6Q5HrLKFQMqCA8piV7mEUFQ/7TzeL9PPjMor0=;
 b=wbE/fs1zuNBf3gYMep85mNbLMagAa0i4kh+4MyODFSNrVbUXLdbBixNOZLy3fdYYRK
 iFnxB+7rHXNzTEwRu4+us2rRSrfg0Swon+k/EfW+Uhnbr8mWjLR6RnGhvT9/3m6lyXxQ
 BjwccEEwiy8jljkGgs5MVF2GbJRmC9SVhMhK3EObsL3Df/V7oJQPXjGLVqWqMfwnMh5N
 dhij4kxeWpmIR0BVyIihg7XNbvFajLz0Vz5f+1ezq/2TWSb1sGkBqJ7NUf4XB1bjJ5AV
 X7aHeOImBEutkXGlm6tes7zy6i2Pupi9thzSMmYKSKje8OIRqzaUTt9E4g9NqkUR16n6
 fhGg==
X-Gm-Message-State: AOJu0YwPpMc3a4aNz+ciHUcGGLb6sGi1hVCpEHYRc4bf3N3f2KVgqIMS
 aqDNKeTFELsU2X8SFYpZUuP6wM2qGglAC3uw0z4=
X-Received: by 2002:a05:6808:1803:b0:3ab:6910:f5eb with SMTP id
 bh3-20020a056808180300b003ab6910f5ebmr9766935oib.10.1695390353346; 
 Fri, 22 Sep 2023 06:45:53 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.42]) by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b006900cb919b8sm3195111pfo.53.2023.09.22.06.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 06:45:52 -0700 (PDT)
Date: Fri, 22 Sep 2023 19:15:42 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH v2 09/12] hw/pci-host/gpex: Define properties for MMIO
 ranges
Message-ID: <ZQ2ahpNNYoi6o0eC@sunil-laptop>
References: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
 <20230824142942.3983650-10-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824142942.3983650-10-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 3T6DeIli+8Tw

Hi Igor,

On Thu, Aug 24, 2023 at 07:59:39PM +0530, Sunil V L wrote:
> ACPI DSDT generator needs information like ECAM range, PIO range, 32-bit
> and 64-bit PCI MMIO range etc related to the PCI host bridge. Instead of
> making these values machine specific, create properties for the GPEX host
> bridge with default value 0. During initialization, the firmware can
> initialize these properties with correct values for the platform. This
> basically allows DSDT generator code independent of the machine specific
> memory map accesses.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---

Could you please help reviewing these changes? From MAINTAINERS, it is
not clear to me who maintains gpex code.

Thanks!
Sunil
>  hw/pci-host/gpex-acpi.c    | 13 +++++++++++++
>  hw/pci-host/gpex.c         | 12 ++++++++++++
>  include/hw/pci-host/gpex.h | 28 ++++++++++++++++++++--------
>  3 files changed, 45 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index 7c7316bc96..0983af3d9e 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -281,3 +281,16 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>  
>      crs_range_set_free(&crs_range_set);
>  }
> +
> +void acpi_dsdt_add_gpex_host(Aml *scope, uint32_t irq)
> +{
> +    bool ambig;
> +    Object *obj = object_resolve_path_type("", TYPE_GPEX_HOST, &ambig);
> +
> +    if (!obj || ambig) {
> +        return;
> +    }
> +
> +    GPEX_HOST(obj)->gpex_cfg.irq = irq;
> +    acpi_dsdt_add_gpex(scope, &GPEX_HOST(obj)->gpex_cfg);
> +}
> diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
> index a6752fac5e..41f4e73f6e 100644
> --- a/hw/pci-host/gpex.c
> +++ b/hw/pci-host/gpex.c
> @@ -154,6 +154,18 @@ static Property gpex_host_properties[] = {
>       */
>      DEFINE_PROP_BOOL("allow-unmapped-accesses", GPEXHost,
>                       allow_unmapped_accesses, true),
> +    DEFINE_PROP_UINT64(PCI_HOST_ECAM_BASE, GPEXHost, gpex_cfg.ecam.base, 0),
> +    DEFINE_PROP_SIZE(PCI_HOST_ECAM_SIZE, GPEXHost, gpex_cfg.ecam.size, 0),
> +    DEFINE_PROP_UINT64(PCI_HOST_PIO_BASE, GPEXHost, gpex_cfg.pio.base, 0),
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
