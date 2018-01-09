Received: by 10.28.173.206 with SMTP id w197csp3930534wme;
        Tue, 9 Jan 2018 09:17:22 -0800 (PST)
X-Google-Smtp-Source: ACJfBotFPEdPlyvWq7doN7IPcOvhub/6hVLQO8kE1Cl8xmpqu0dfu2Y7+PjUN9vlKWyfRBpKVkhb
X-Received: by 10.101.68.75 with SMTP id e11mr12721876pgq.68.1515518242345;
        Tue, 09 Jan 2018 09:17:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515518242; cv=none;
        d=google.com; s=arc-20160816;
        b=c2ZaxxCGiZ7M3y0ErHHPlYG0yDtMkQRvSEunTzCAUbOayXCzUoNuu2i0AgdgfutKcl
         eyiZHhSkIv9ZhgG8AkZcrZxzPHQ6XoziqaxIAYlnds4yasoepsSTM2qW0nmcohY3ue7E
         rHtIZ6rSRxPf+oZpXTyiHFqRD2+8O9PQIamP8IZAJ4sGKsnNzJIvoYx03ij+mESVNuhT
         nax4FOO0+kjbaIN0rN5sGGX5Vo9yGFidHQOo8UBr9EY2qboGBoiVyBpzvtybMZXfIQxh
         qCT0br5poQoAWbC06NuL5jeQHUDbkYtLqpyz0BYD9KSS9Xui0FZ0HOEg29JUrSrmSGBs
         frFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=o/Fqua6vORMmjRi9J/I4y4X/4rnJJ2CNRR2fGqykeAs=;
        b=0USdv8NHHxrO6oSrKtD3nncpH1h/a54pSITIq61RuOPgEELkWKanscJ+RlxtPpuqmF
         wXY4kSrmM4vhXjGtNtF0iyn+JUjcHLkYoVW3ukVbw05sCx7ztfa2gFRLfCP+Gegg/1Vf
         XRRKJ5j6b5y0CVEAOcZ3rv3shLuc13zK5NzCaaPG2NsB/J9VKWXSHyzu+tZBrCUTkUYO
         W3AGNgLFOZVd/KI6AhBsDPtSjswK0vFQEmpoCg7FuoEzK9iLr1OXF2jQx3sDV885HJG9
         EcyEeWp9QL4HUlsEPqI14l7mdPHHBU8U4rLfZ8jZd3t+h69l7bb6rO5BfZa6wED4SvAX
         gKKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BVrQLzRa;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id ay8si10652533plb.198.2018.01.09.09.17.22;
        Tue, 09 Jan 2018 09:17:22 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BVrQLzRa;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755450AbeAIRRS (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Tue, 9 Jan 2018 12:17:18 -0500
Received: from mail-oi0-f67.google.com ([209.85.218.67]:35287 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754848AbeAIRRP (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 9 Jan 2018 12:17:15 -0500
Received: by mail-oi0-f67.google.com with SMTP id 184so11001211oii.2
        for <kvm@vger.kernel.org>; Tue, 09 Jan 2018 09:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=o/Fqua6vORMmjRi9J/I4y4X/4rnJJ2CNRR2fGqykeAs=;
        b=BVrQLzRaa128pljSu2feSNcwxE3RZSEZVECSK5vA5CZqF21GGSvttYcDjzH6v6rxN7
         2/ImnB8aCakV/yOXNmK7choq9AQu5Gzsm0SVtK4/sPcyq7irmY1CzfUjvbm74XFCa+5O
         hrcssawC/7Yp4/VACAD2di4/nM8Bx9qRt5l1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=o/Fqua6vORMmjRi9J/I4y4X/4rnJJ2CNRR2fGqykeAs=;
        b=EtWxMrhZZErv0TrtZRBFNGdcipdhoDvr9HB7yzmeMkSkbkwiCVFkgm4Srp6CFbQTdh
         IZR/jMAMca3hpKNJd0UuKQksjOwr+ud6UuAS6SvX7O8nswCDlzvr2RVjlXNgK4N68DTc
         hsK+FdVvtm3Ak5fZP5trBcIgDhzK7CTiTh/3CwMEgCJLc1ziYtJ+IO8pUJzm5nBDzR33
         B/+9Em7kzkNPQviEA60X+3KWp/d6BiMw+0K+tFvkst8Zlqsf4Q/BVVqLTiVtU+3GMgzO
         BDYnKU4epBHRVSH3735dUI2GKedd8tNSYk1VC3NYLhf/6H4FcwlXE+FNd3DXKjcs+2Ug
         fi/w==
X-Gm-Message-State: AKwxytc8v7TOdxuIUI12IfsCNxoZAk2fCHi6m96/kSMeXuDyKE6YeYJW
        PB4S2OR7FFOmD+3kisQomYMn6K5PDUjuJmP5bBI82w==
X-Received: by 10.202.244.131 with SMTP id s125mr1026113oih.327.1515518234972;
 Tue, 09 Jan 2018 09:17:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 9 Jan 2018 09:16:54 -0800 (PST)
In-Reply-To: <1514440458-10515-5-git-send-email-gengdongjiu@huawei.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com> <1514440458-10515-5-git-send-email-gengdongjiu@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 9 Jan 2018 17:16:54 +0000
Message-ID: <CAFEAcA-sZrr71e0KtTYXao7WQzDoAGtdDqVL1Swjqqs2jUWtWw@mail.gmail.com>
Subject: Re: [PATCH v14 4/9] ACPI: enable APEI GHES in the configure file
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <zhaoshenglong@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        James Morse <james.morse@arm.com>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        kvm-devel <kvm@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>,
        Huangshaoyu <huangshaoyu@huawei.com>,
        "Zhengqiang (turing)" <zhengqiang10@huawei.com>,
        Xu Wei <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: gaNJO2T39UJV

On 28 December 2017 at 05:54, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> Add CONFIG_ACPI_APEI configuration in the arm-softmmu.mak
> and add build choice in the Makefile.objs.
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
>  default-configs/arm-softmmu.mak | 1 +
>  hw/acpi/Makefile.objs           | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index bbdd3c1..c362113 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -129,3 +129,4 @@ CONFIG_ACPI=y
>  CONFIG_SMBIOS=y
>  CONFIG_ASPEED_SOC=y
>  CONFIG_GPIO_KEY=y
> +CONFIG_ACPI_APEI=y
> diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
> index 11c35bc..bafb148 100644
> --- a/hw/acpi/Makefile.objs
> +++ b/hw/acpi/Makefile.objs
> @@ -6,6 +6,7 @@ common-obj-$(CONFIG_ACPI_MEMORY_HOTPLUG) += memory_hotplug.o
>  common-obj-$(CONFIG_ACPI_CPU_HOTPLUG) += cpu.o
>  common-obj-$(CONFIG_ACPI_NVDIMM) += nvdimm.o
>  common-obj-$(CONFIG_ACPI_VMGENID) += vmgenid.o
> +common-obj-$(CONFIG_ACPI_APEI) += hest_ghes.o
>  common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o

You should include this in the patch which first adds the
new host_ghes.c file. Otherwise that patch won't compile.

thanks
-- PMM
