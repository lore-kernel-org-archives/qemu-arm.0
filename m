Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp735899njh;
        Mon, 12 Aug 2024 04:27:25 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXt5Ti3mlTWYDA4vARchpyEBMtNXWnDdF6ivzOwNqLJfqqVdDn82C0nvf+EA20fugxmcIIl1GrbBo5AMA==@linaro.org
X-Google-Smtp-Source: AGHT+IEwb7u485266F+OFtqTE5+Y/+Kqv48ujuO0RwhWeXTw7SC1B5sZBSh2pN6rIQaQOrlsje9/
X-Received: by 2002:a17:906:f595:b0:a7a:c256:3cc with SMTP id a640c23a62f3a-a80aa676a0bmr483719066b.67.1723462045016;
        Mon, 12 Aug 2024 04:27:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723462044; cv=pass;
        d=google.com; s=arc-20160816;
        b=WuJ0q8JKAS2ggOJb+ldAi/rH8isGjw5T5N1zRrM6veQELozkshJW91Ixc1WcZLFuCv
         6cRPmdDnL3s8LXnVdKvuX0n8ZMDAUzbJIFQLt8Ncr30E2O0SJ93HcjqCpjkzKt1HUQo1
         MPqaDrjuptTBaYPbaI/3zZwOc7NOdf8/w053TmUisN53g23ojAygqT375C179ZFSGTrW
         sWRSW1kMlScd2HH5pbn4LAz8gE1R11uddpJdEZSO+FWny1U0i+I5mOK/63hsT0aCbsJb
         0MrQRRYMAY0rLsn4uQ7+TdLzWwnxP+ns91Um/r3QFFu72wijFwEbsvHNWjK3VMcIWAPY
         ULNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=FTNEksQrLdisblUVudWNfbeRRd9kGZhHe6HbGnA049s=;
        fh=8KQfBx+JeMT6wLiu0tbnMXk6zFkCJdqgxO2bi/jCF4U=;
        b=Pn62kp2T7+UxoSPXUFIqMCubT0O69qFw29ml+jHcbGAc0mzSewwlrzb/ykygibRaG8
         njuNFDmstXrrgAF5mWuHZsWHWs6Pa328egI6BqsCDJ5CH1p3CeqRoItaUEG2aceW3Y44
         xkI94tUJNdPxgWFQPtSe4Hv4unJ83475mHvfOVBDBmQLmMC93+qBTjxZIvkpr+DlvdPa
         vJf6t375qrbOKL4Bm8n6yxOiN/QhJL3M2FQWaKhTSzttPy/iG80I9d487Y8A6SA5FYUw
         Or0Xyc059gJgd7FWv8W2ZM/mXDVDJfOnZETNwzPjK/d0oqbsLAtohslHaRXsb37NoeW4
         mpuQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U0du5seo;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-283005-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-283005-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-283005-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a80bb2195f3si285037366b.644.2024.08.12.04.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 04:27:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-283005-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U0du5seo;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-283005-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-283005-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B75E1F222EF
	for <alex.bennee@linaro.org>; Mon, 12 Aug 2024 11:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1685171082;
	Mon, 12 Aug 2024 11:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U0du5seo"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1E8130495
	for <linux-kernel@vger.kernel.org>; Mon, 12 Aug 2024 11:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723462039; cv=none; b=gBkyuxh0+10Mq5LoK9V9DjLwJbzyn978HjYsz/pE/rQ6OnMyiqjPEqCz1ahFqqfKF19DpKphjVAA6swlz9NM7zthV+2UzGDdJqCXBJknps4mA8Iig09bVVS7zEcGd9MsZ3PdcY78Id63ufePGxlfOsXHuXtALA5sLM0fx31bS4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723462039; c=relaxed/simple;
	bh=MDFwRXfl9GLq4smBwrBDf5NCvC9gEdI3qQfUM8XKAr4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=khEkKxb2CCacWRSpJuhVJonnMAlsplMFo1eHNW7XMKtfOpGobv4WR6bJwojAqsuvvlRLIkFiLWciX0/aJywFjFDRj/evee1y0O8fbPW8n7MrgMOUGu2FU5h9IZ34lh0g42g9SLPloKGmsG2/Lzn+eB+FNf0y6FC/vFq9xA43tm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U0du5seo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723462036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FTNEksQrLdisblUVudWNfbeRRd9kGZhHe6HbGnA049s=;
	b=U0du5seoF3e8XrSrV84NJliiRHfsT7AO0mmd055l31JUQSaCNMLrzFjZDkOIdFiaI/8Qb2
	Z4+kvVKmiAwrM52YHypON6ieUFABAy0yNippt0h8KwkZXTejZsaxYlgMxVwZzh8wge2LTP
	qjyL/dnbqgYYsM/FWtzmEFrjSzCoALQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-Ww7HZRhGP1SbI-ExpcRQYw-1; Mon, 12 Aug 2024 07:27:15 -0400
X-MC-Unique: Ww7HZRhGP1SbI-ExpcRQYw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3685a5a765fso2557261f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Aug 2024 04:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723462034; x=1724066834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTNEksQrLdisblUVudWNfbeRRd9kGZhHe6HbGnA049s=;
        b=mPgZ+/oa7CuLuCwzfTgA9UFJtUlssgu+ZjT1Fjg78kKVXKJnWE/5irG2EqK7eLFPUn
         ByLqiCVr/TQ4fTR9jPM/lgqDqBybduoCccF+A4+oqk9ROxbN0Fj/NbJ1i/PhcMccIByY
         7nzvRIUGv0bS6oVW1KgaGRifdALJdO1S+e2ehuHsb7SVTL+F6GFfQyjrp1UijjnHeweg
         uhg8ttlOB96T1l1wzOpVbLsgWog56+ibCqMEUDlMwe8Uc+4pesPNH5M/UP/4mXIacBxg
         I4AjbjavqGAwktBMESwvAcSi8RGbnQJedRhUFkdaE1KceUFPY6OW3Q/CZ6XvCNK7wbrp
         QVfw==
X-Forwarded-Encrypted: i=1; AJvYcCWK3QUdhXScP+OH7D6xgSmkh7xVUaHkokBpPtVMn7wEDjyOXssTZJw9PhQVUL52R2ZNNSnL5RhSfuC5yhs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6X3YpApgqFspnBIRYq67fw50UlgfDM4d0fuZzVca1iKyrcvKV
	fVVsdxNixQkEuTwgZWI6IOy/f37WstfhKWrh5hF8mbPsZeVki7ZgktM869f2iEFt9FWVPVIs4/m
	t5BFakBBIu+kya67cEl5jm9NTmkU/pYUU7LlOIciuOyjjzEv5mV8jeoEMWBJtFg==
X-Received: by 2002:a05:6000:bce:b0:366:f041:935d with SMTP id ffacd0b85a97d-36d61cd285cmr6086481f8f.60.1723462033968;
        Mon, 12 Aug 2024 04:27:13 -0700 (PDT)
X-Received: by 2002:a05:6000:bce:b0:366:f041:935d with SMTP id ffacd0b85a97d-36d61cd285cmr6086459f8f.60.1723462033386;
        Mon, 12 Aug 2024 04:27:13 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4ebd35c8sm7152000f8f.107.2024.08.12.04.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 04:27:12 -0700 (PDT)
Date: Mon, 12 Aug 2024 13:27:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 02/10] arm/virt: Wire up a GED error device for ACPI
 / GHES
Message-ID: <20240812132711.7c23df55@imammedo.users.ipa.redhat.com>
In-Reply-To: <5965df0d8c11890d43c66a2be424ac5a82614599.1723119423.git.mchehab+huawei@kernel.org>
References: <cover.1723119423.git.mchehab+huawei@kernel.org>
	<5965df0d8c11890d43c66a2be424ac5a82614599.1723119423.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: bdMknNw+0dUR

On Thu,  8 Aug 2024 14:26:28 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Adds support to ARM virtualization to allow handling
> generic error ACPI Event via GED & error source device.
> 
> It is aligned with Linux Kernel patch:
> https://lore.kernel.org/lkml/1272350481-27951-8-git-send-email-ying.huang@intel.com/
> 
> Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

other than question below mostly to arm/virt maintainers, LGTM
Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/ghes.c           |  3 +++
>  hw/arm/virt-acpi-build.c |  1 +
>  hw/arm/virt.c            | 12 +++++++++++-
>  include/hw/acpi/ghes.h   |  3 +++
>  include/hw/arm/virt.h    |  1 +
>  5 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index e9511d9b8f71..13b105c5d02d 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -444,6 +444,9 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
>      return ret;
>  }
>  
> +NotifierList acpi_generic_error_notifiers =
> +    NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
> +
>  bool acpi_ghes_present(void)
>  {
>      AcpiGedState *acpi_ged_state;
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f76fb117adff..1769467d23b2 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -858,6 +858,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      }
>  
>      acpi_dsdt_add_power_button(scope);
> +    aml_append(scope, aml_error_device());
>  #ifdef CONFIG_TPM
>      acpi_dsdt_add_tpm(scope, vms);
>  #endif
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 687fe0bb8bc9..22448e5c5b73 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -677,7 +677,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>      DeviceState *dev;
>      MachineState *ms = MACHINE(vms);
>      int irq = vms->irqmap[VIRT_ACPI_GED];
> -    uint32_t event = ACPI_GED_PWR_DOWN_EVT;
> +    uint32_t event = ACPI_GED_PWR_DOWN_EVT | ACPI_GED_ERROR_EVT;

given how often error injection would be used, does it make a sense
to make it always enabled? (it after all consumes guest RAM for
error block buffer)

Maybe we need to add a machine property to enable it when desired?
What arm/virt folk think?


>  
>      if (ms->ram_slots) {
>          event |= ACPI_GED_MEM_HOTPLUG_EVT;
> @@ -1009,6 +1009,13 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
>      }
>  }
>  
> +static void virt_generic_error_req(Notifier *n, void *opaque)
> +{
> +    VirtMachineState *s = container_of(n, VirtMachineState, generic_error_notifier);
> +
> +    acpi_send_event(s->acpi_dev, ACPI_GENERIC_ERROR);
> +}
> +
>  static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
>                               uint32_t phandle)
>  {
> @@ -2385,6 +2392,9 @@ static void machvirt_init(MachineState *machine)
>  
>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
>          vms->acpi_dev = create_acpi_ged(vms);
> +        vms->generic_error_notifier.notify = virt_generic_error_req;
> +        notifier_list_add(&acpi_generic_error_notifiers,
> +                          &vms->generic_error_notifier);
>      } else {
>          create_gpio_devices(vms, VIRT_GPIO, sysmem);
>      }
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 674f6958e905..fb80897e7eac 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -23,6 +23,9 @@
>  #define ACPI_GHES_H
>  
>  #include "hw/acpi/bios-linker-loader.h"
> +#include "qemu/notify.h"
> +
> +extern NotifierList acpi_generic_error_notifiers;
>  
>  /*
>   * Values for Hardware Error Notification Type field
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index a4d937ed45ac..ad9f6e94dcc5 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -175,6 +175,7 @@ struct VirtMachineState {
>      DeviceState *gic;
>      DeviceState *acpi_dev;
>      Notifier powerdown_notifier;
> +    Notifier generic_error_notifier;
>      PCIBus *bus;
>      char *oem_id;
>      char *oem_table_id;

