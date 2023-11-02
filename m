Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp364731eja;
        Thu, 2 Nov 2023 05:56:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqG2p8ZChKa+mOuvPJDPvCaeh0A1KUCdg+q+OYS6+vIDxf8ApJr0AZTAqgGp8DwdCKKIuH
X-Received: by 2002:a05:622a:1349:b0:403:f389:5793 with SMTP id w9-20020a05622a134900b00403f3895793mr13093927qtk.32.1698929790991;
        Thu, 02 Nov 2023 05:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698929790; cv=none;
        d=google.com; s=arc-20160816;
        b=FxTDOEP8xKd+ke5OvUSn9+ZD4upA3jBlbJzMYi2hLgA07T2BNuQgwy9zvg6IMG4pkB
         rnHtBVsFJlnIPGhu8K2CXaDFrQPZmzxdNgRRbVffmfNNgYQZeaQTjUDrxmwfCpyNFgta
         vIg6Fuyvc4kUDYOj1mmJWlVc98YiKd0FDQlHIKs2psldkN5rwQ2rU1y8QeF/3qW/QuR1
         EYuZfoo87Pp/Btq+pAZcO9pGQ/Goy9BAUCGQGbCi1RB3T4xTz9Df7Pc1V/Swj+u7KUVx
         ffkRjTNb36/UYV6CadcqoyFoPL4e+fX+qNINmq7k5TW6bHU7kh5dQUMAOcR5koWJXZat
         QEhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=RotDW/GtWu/s795efn/lt+82Q8L5Ej1qyRZIGLQ1Jcs=;
        fh=S/nrsomjrWHzZrnBlwVBwz6fXwRIzJj5+Z7ZBAcL4dI=;
        b=Si/DqF+c/OPon5YQUGtrI0ANAQVv+kvgDooeH9FZg2BgfF1fCC63fTY/H8J0QSubvG
         5VULc4VYN4wNEtgo74kSMM7vs3aQBA5PpFdJRoX4frnBRJcnS8cr8LGRmO2RMoYYWiAB
         QrQbjkqwsOOQG8qpb11iLcO6RZUrboKTYr16R9l5GhaRKWdEYRK4X7jmEalaGg294bgj
         GtmeAhUi6Pfc6zephd647hbdzr+S8mb6MH7VvXXpiAIiLjuidz3vQqR3S/VhD3KH4uQY
         nmphgneGrjg/4/MYvoQiIss1CXk6uNpxOM31aEYiFzgUbm5V0nqBNUdVWmiWQBy3Qfpj
         JIFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=i9zIniQZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15-20020ac85e0f000000b00417db9f37ddsi4586257qtx.732.2023.11.02.05.56.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 05:56:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=i9zIniQZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyXFJ-0000iR-8B; Thu, 02 Nov 2023 08:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyXFH-0000i6-VQ
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 08:56:23 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyXFF-0005cS-VM
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 08:56:23 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6b44befac59so1602368b3a.0
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 05:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698929780; x=1699534580; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RotDW/GtWu/s795efn/lt+82Q8L5Ej1qyRZIGLQ1Jcs=;
 b=i9zIniQZsNL7UPpaeWIWxxxxPCpe2k6dyNKLvTzc0wMZJiBQ8KF1RJE4dYeSKXtxEq
 KQLqHUQnfMbaWk0D6juolCsCd2ZgbczRI3N4UWbCnDPv04tneY7WdYe71t9YdlQ/UG+m
 Me3aWMzlmuQKok99emI4GcWDgASepXR9yms0/ta0NZ6hhcOFG2oBR5euYqk+YJHiKjlI
 lCFtz5tNu3AX3LFrNIuKSWb/QHlsxUI0UZ67Nyr0tEb1ZrXMInn+fZnpOzNCW1gIQKiK
 99LcBOpfOFdPstxmsFpYiuNWy5kNv+9qDUDp8lZdskEFJgrg7hff5ntBbAwf/eHfcKW+
 AJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698929780; x=1699534580;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RotDW/GtWu/s795efn/lt+82Q8L5Ej1qyRZIGLQ1Jcs=;
 b=WayWnHMVVVsaq2DkciGuh6Dgz9BXHZEAcDPZYhHWYipL6+WwoW5qbmtLUogyT6lQ+n
 WawNmbVM2z7Vm5K99WM3eQJBI6Vs6o6nhg5uG9kjVzWRZM0YqwWSVug4zD/BqM+MTTfu
 HsKKg1+/4WpIiqSlESBLuq0/2CFINYTDwJACfCkIwtnElDxUiBl03tf7D+pwmTQNsStP
 UCY+Uirqj8wjyUWM52AebyfV1TDwl0p0iMIuDU8b+4Oy1FuKoxRT9q01VgunvPn+5Jp+
 tNiB/InQx4CDowsOq+rtKOQy4jyDvny8QUUrZN0NwgACN8VG+plQSrGW76sxd/dGUUqZ
 gcRw==
X-Gm-Message-State: AOJu0YyQALYEc1xFCnvs8dxveuTeO+Z/xWP9QtbbVY8Ftw0nWN+TvZSX
 +NDZm1jKsREcMzUdPqjWc/gYvQ==
X-Received: by 2002:a05:6a00:3a1c:b0:6c3:415a:5c05 with SMTP id
 fj28-20020a056a003a1c00b006c3415a5c05mr901292pfb.14.1698929780158; 
 Thu, 02 Nov 2023 05:56:20 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.78]) by smtp.gmail.com with ESMTPSA id
 n27-20020a056a000d5b00b006879493aca0sm2839538pfv.26.2023.11.02.05.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 05:56:19 -0700 (PDT)
Date: Thu, 2 Nov 2023 18:26:07 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v5 02/13] hw/arm/virt-acpi-build.c: Migrate virtio
 creation to common location
Message-ID: <ZUOcZ0CS1njX/OcJ@sunil-laptop>
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
 <20231030132058.763556-3-sunilvl@ventanamicro.com>
 <fea78511-d3fa-4ad4-860f-419cd1845e1f@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fea78511-d3fa-4ad4-860f-419cd1845e1f@ventanamicro.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ryqlgzLS3tUc

On Thu, Nov 02, 2023 at 09:10:05AM -0300, Daniel Henrique Barboza wrote:
> Alistair, Sunil,
> 
> This patch is breaking riscv-to-apply.next build when using 'clang' and
> --enable-debug:
> 
> URCE=600 -DNCURSES_WIDECHAR=1 -DSTRUCT_IOVEC_DEFINED -MD -MQ libcommon.fa.p/hw_virtio_virtio-acpi.c.o -MF libcommon.fa.p/hw_virtio_virtio-acpi.c.o.d -o libcommon.fa.p/hw_virtio_virtio-acpi.c.o -c ../hw/virtio/virtio-acpi.c
> ../hw/virtio/virtio-acpi.c:14:12: error: variable 'virtio_base' set but not used [-Werror,-Wunused-but-set-variable]
>     hwaddr virtio_base = base;
>            ^
> 1 error generated.
> 
> 
> Looking at the code:
> 
> void virtio_acpi_dsdt_add(Aml *scope, const hwaddr base, const hwaddr size,
>                           uint32_t mmio_irq, long int start_index, int num)
> {
>     long int i;
>     hwaddr virtio_base = base;  <------
> 
>     for (i = start_index; i < start_index + num; i++) {
>         uint32_t irq = mmio_irq + i;
>         Aml *dev = aml_device("VR%02u", (unsigned)i);
>         aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
>         aml_append(dev, aml_name_decl("_UID", aml_int(i)));
>         aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> 
>         Aml *crs = aml_resource_template();
>         aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
>         aml_append(crs,
>                    aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
>                                  AML_EXCLUSIVE, &irq, 1));
>         aml_append(dev, aml_name_decl("_CRS", crs));
>         aml_append(scope, dev);
>         virtio_base += size;   <------
>     }
> }
> 
> 'virtio_base' is initialized with 'base', and it is incremented in the loop, but
> nothing else is done with it.
> 
> 
> This solves it:
> 
> 
> $ git diff
> diff --git a/hw/virtio/virtio-acpi.c b/hw/virtio/virtio-acpi.c
> index 682283800f..eaf6028e93 100644
> --- a/hw/virtio/virtio-acpi.c
> +++ b/hw/virtio/virtio-acpi.c
> @@ -11,7 +11,6 @@ void virtio_acpi_dsdt_add(Aml *scope, const hwaddr base, const hwaddr size,
>                            uint32_t mmio_irq, long int start_index, int num)
>  {
>      long int i;
> -    hwaddr virtio_base = base;
>      for (i = start_index; i < start_index + num; i++) {
>          uint32_t irq = mmio_irq + i;
> @@ -27,6 +26,5 @@ void virtio_acpi_dsdt_add(Aml *scope, const hwaddr base, const hwaddr size,
>                                   AML_EXCLUSIVE, &irq, 1));
>          aml_append(dev, aml_name_decl("_CRS", crs));
>          aml_append(scope, dev);
> -        virtio_base += size;

Thanks Daniel for catching this. But proper fix would be to use
virtio_base. Let me send next version with proper fix. Sorry about this.

Thanks,
Sunil
