Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3818064njk;
        Wed, 29 Jan 2025 06:58:47 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVSlIQJ+OYkJIU7ofTdihPyWNOQ6yFUvePNEUt7gz1xSfDxgwkzhaP/1pSuwYso6XcwZ7RFmpT9k/j/SQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFaaymE9t+zJMeSelwtYuPwpFCjVjrdIld3eDwqWVC3r+om4lvDytt7p8XjTLjLp0b/Q5Ww
X-Received: by 2002:a4a:e849:0:b0:5f7:3654:4595 with SMTP id 006d021491bc7-5fc0040feffmr1969656eaf.5.1738162727761;
        Wed, 29 Jan 2025 06:58:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738162727; cv=pass;
        d=google.com; s=arc-20240605;
        b=G5QWNL7c7ndYh+ogUDlgtONn30XXD0tVF9f8ML0ufWMHV2YPLQbjcdNt8sNBNelz0h
         1Q+T4v/MDRK/ZZ8SFhlBa5wnegn4DzyB4o33ehGj1l3YmXE1xNOjEP0IOm0H30TdE396
         fb51pXzg19dCULwDv3hY8e5vAbwj4Ff4Br2nO2Bldut7EGdaS2Y9+Whkk9Z79yKzzGaf
         ldcQ+B9rc5cwglte6olQTskLcqml6rP2Ubxs6n8UQEEcIjIVWlC/KOS8wNZwoRu9BVvx
         yMJOdFjDCdFDHLone8kB1RwAiVbPJ3E0XAfJlGyzn0WnTdRHYuTu7exGhMDQPMugd6De
         nr7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=7YLxCHNiZuZEqkH4nDxSXBuSmKHhos6mZS0Qg9rUlAY=;
        fh=ltb2oYwXuk9pEQgJKjbdBh5gy3ySuIjQ+P2abPFXOIQ=;
        b=k+U1Oewrs8JtP1aSCsiulGhS2v37UDt5LhxfX//R9AJOLJ6bRKOGxHwDtac6i2EkLo
         hEscdpqpDq6mSG8hrxwg5N1oNlM+f9rHhn3hisPH5SqBpTgJ4Uw173rk1/fJrJea/Lnj
         4qj2nOAlyuW5wet9A/UI0g4Cri9w6efNlFOYQyFVjXwJtKqnt33SA9hoHGvtMxdOh8f+
         XLTmL9kGa1NQYtffgiKINcQifIImV0FvpfVmD7yWfulxJM1c4oRw1sOQ/iBihDhYGxZS
         KwcEaiDvq821WB1HiZTCb2GI4GbcnokhvFlxs77IJr2V/wVrgKqL0Wee72r0b8DFFN0m
         g4XQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ci6b+R1Z;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-492642-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492642-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-492642-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 46e09a7af769-724ecf93d82si10871007a34.186.2025.01.29.06.58.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 06:58:47 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492642-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ci6b+R1Z;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-492642-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492642-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C3263A57FD
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 14:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD501B4F15;
	Wed, 29 Jan 2025 14:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ci6b+R1Z"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B17A7E9
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162723; cv=none; b=FnXf05a3RWrH908rFY1clGe9HrTLd8FQopRqGE3n5iO64OyLI5VvvHr70Ekw303F/KnoWlhIHiJjtAWeQqJFRzel93CKc260fcwtgP4ixrf7+9PUcvS/O6sY9g7FDQjamTSo+xqvAP5OoY1O5wzpM9vYabhJXleo4bBt0d1L5jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162723; c=relaxed/simple;
	bh=ofVwal9D3biOAGM4SyMRv+LqYBaP6rhN2WvOlnxFv88=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D7ASZK9XfuW1+pIkDVKyQJ7yNUVn/1YtoNfDm1h7+wqEJq5Nf7pembv+vyNrwM9clkBWLAORqLFOywaJCZfflA4Uq/KoFb3AWvsFMiiCpSlBIxHAsPLz2wsE67lXmoB59S0z+q51vrEvZknugZowmPJtSXADDWmCfS8EiD7bWS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ci6b+R1Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738162720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7YLxCHNiZuZEqkH4nDxSXBuSmKHhos6mZS0Qg9rUlAY=;
	b=ci6b+R1Z99L0UHYzDwlGYqe8tAqT1wNWDQonWK2xExButVel9mT4gwSWaOr1GB+nO+MzTJ
	Uua4AqJQiuAtfSprMo8WPgapvBTln3PrH6fADFmWyRWW6Cos44IsnchadeeasaVQqRDOOC
	Hm6q+sSJ7aHVr47svrmlVkMQa1ZANf0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-tDpedNi_OVy9aUtGHjApJg-1; Wed, 29 Jan 2025 09:58:39 -0500
X-MC-Unique: tDpedNi_OVy9aUtGHjApJg-1
X-Mimecast-MFC-AGG-ID: tDpedNi_OVy9aUtGHjApJg
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38a684a096eso3106651f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 06:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738162717; x=1738767517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YLxCHNiZuZEqkH4nDxSXBuSmKHhos6mZS0Qg9rUlAY=;
        b=UvPsjAbkmwIzycsxRfoPwbSJrlf/AUV8OltOrjmeCqqpZwanRvD1Epokv8aa0U60/c
         lsfo8X74tOOzpbDSyFrsnrdtbyKPZ5J4UEsteazexKJEvPmYTPY4NumfZnHtYeR/iaJY
         TpBjc+3jdUUFjeIZ+lMHaTIqdcpp1xUbZhNuIy0pvrDdhyNUmP33fn5ClpHP/2qx75VV
         exddyUUtP7IGZZY2EANmzyZpmGU5a4vCvvP2yRWlJosPnG7Pbdip/VSud6jFNZiupn1/
         DKtDiP0elIQEIP8yIjxnONAjuOSe9W+cDv9cX4mdXLVn45SJbcYmVIXDj+zHk7fEYyGM
         8g/A==
X-Forwarded-Encrypted: i=1; AJvYcCW4ZqZtkGI+rMlR+vHLJOiFRub1BDyfE4pVxfvZsgk4xI1jAjz8wxLKRLyWuD1Tr80CyLK10H0ryUj6Knk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmRSkHOaNm8nGTEfxhq3G4SP3t85Te5AOwmH052fpaREEvWL73
	Mo9RtjSNrqkNz4geySuyU3FkDTWqmmBTxpagebXdH7UNtopCUkvZ3U+ED0pfC70ua/gjRtwpPr5
	P3lxLbT8bq4nR+uMJ12k2zUUpT8Ol2dTJBY8Ksdutb+9X7YTRLHSpiBTKqksczV/mLAfZQg==
X-Gm-Gg: ASbGnct55MP4tpgxas0htx2pCYCoKKUUXsUblKlQbsqjuBMagE885egnEBbYj9K/Rng
	wqx/+N8J34gVfuzp9J15ycdgAhuc0qHieejDrdSo8tcZXLxLjjL7mgM/Kb7cgaP2iSV6wxvwc3H
	jgafJtSMHV+AVtb/30U4Y0xkeuc9bP41jmgYjdbV+O9HSypKAn3BGEyvCAM3aYHZSxO8fv6UUSA
	Yo+gfPCO0He5wsg/3Dl2pDTIvXXLOcQbeJgm8GkeQLt7kPfpN6O8s716mDKE683CjkG9qKdlGus
	Ha2fm5RFypMKdaJacNK+bC7lgiXwSJe107ep7fSaMwK5qq6dD17x
X-Received: by 2002:a5d:6da7:0:b0:385:de67:2269 with SMTP id ffacd0b85a97d-38c520a3857mr2398031f8f.36.1738162716863;
        Wed, 29 Jan 2025 06:58:36 -0800 (PST)
X-Received: by 2002:a5d:6da7:0:b0:385:de67:2269 with SMTP id ffacd0b85a97d-38c520a3857mr2398004f8f.36.1738162716474;
        Wed, 29 Jan 2025 06:58:36 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d7bfsm17421061f8f.35.2025.01.29.06.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 06:58:35 -0800 (PST)
Date: Wed, 29 Jan 2025 15:58:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/13] acpi/generic_event_device: add an APEI error
 device
Message-ID: <20250129155835.77cdcfb0@imammedo.users.ipa.redhat.com>
In-Reply-To: <897c1eb4fcec527891301c9243ac8ce84a182187.1738137123.git.mchehab+huawei@kernel.org>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
	<897c1eb4fcec527891301c9243ac8ce84a182187.1738137123.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: LUgIMM4qapP5

On Wed, 29 Jan 2025 09:04:15 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Adds a generic error device to handle generic hardware error
> events as specified at ACPI 6.5 specification at 18.3.2.7.2:
> https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html#event-notification-for-generic-error-sources
> using HID PNP0C33.
> 
> The PNP0C33 device is used to report hardware errors to
> the guest via ACPI APEI Generic Hardware Error Source (GHES).
> 
> Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/aml-build.c                    | 10 ++++++++++
>  hw/acpi/generic_event_device.c         | 14 ++++++++++++++
>  include/hw/acpi/acpi_dev_interface.h   |  1 +
>  include/hw/acpi/aml-build.h            |  2 ++
>  include/hw/acpi/generic_event_device.h |  1 +
>  5 files changed, 28 insertions(+)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index f8f93a9f66c8..e4bd7b611372 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2614,3 +2614,13 @@ Aml *aml_i2c_serial_bus_device(uint16_t address, const char *resource_source)
>  
>      return var;
>  }
> +
> +/* ACPI 5.0b: 18.3.2.6.2 Event Notification For Generic Error Sources */
> +Aml *aml_error_device(void)
> +{
> +    Aml *dev = aml_device(ACPI_APEI_ERROR_DEVICE);
> +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C33")));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +
> +    return dev;
> +}
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 70729b6238a5..50313ed7ee96 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -26,8 +26,15 @@ static const uint32_t ged_supported_events[] = {
>      ACPI_GED_PWR_DOWN_EVT,
>      ACPI_GED_NVDIMM_HOTPLUG_EVT,
>      ACPI_GED_CPU_HOTPLUG_EVT,
> +    ACPI_GED_ERROR_EVT,
>  };
>  
> +/*
> + * ACPI 5.0b: 5.6.6 Device Object Notifications
> + * Table 5-135 Error Device Notification Values
> + */
> +#define ERROR_DEVICE_NOTIFICATION   0x80

drop 1-off macro as Michael suggested, and move value/comment into
the place where it's used


> +
>  /*
>   * The ACPI Generic Event Device (GED) is a hardware-reduced specific
>   * device[ACPI v6.1 Section 5.6.9] that handles all platform events,
> @@ -116,6 +123,11 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
>                             aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
>                                        aml_int(0x80)));
>                  break;
> +            case ACPI_GED_ERROR_EVT:
> +                aml_append(if_ctx,
> +                           aml_notify(aml_name(ACPI_APEI_ERROR_DEVICE),
> +                                      aml_int(ERROR_DEVICE_NOTIFICATION)));
> +                break;
>              case ACPI_GED_NVDIMM_HOTPLUG_EVT:
>                  aml_append(if_ctx,
>                             aml_notify(aml_name("\\_SB.NVDR"),
> @@ -295,6 +307,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>          sel = ACPI_GED_MEM_HOTPLUG_EVT;
>      } else if (ev & ACPI_POWER_DOWN_STATUS) {
>          sel = ACPI_GED_PWR_DOWN_EVT;
> +    } else if (ev & ACPI_GENERIC_ERROR) {
> +        sel = ACPI_GED_ERROR_EVT;
>      } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
>          sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
>      } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
> diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
> index 68d9d15f50aa..8294f8f0ccca 100644
> --- a/include/hw/acpi/acpi_dev_interface.h
> +++ b/include/hw/acpi/acpi_dev_interface.h
> @@ -13,6 +13,7 @@ typedef enum {
>      ACPI_NVDIMM_HOTPLUG_STATUS = 16,
>      ACPI_VMGENID_CHANGE_STATUS = 32,
>      ACPI_POWER_DOWN_STATUS = 64,
> +    ACPI_GENERIC_ERROR = 128,
>  } AcpiEventStatusBits;
>  
>  #define TYPE_ACPI_DEVICE_IF "acpi-device-interface"
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index c18f68134246..f38e12971932 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -252,6 +252,7 @@ struct CrsRangeSet {
>  /* Consumer/Producer */
>  #define AML_SERIAL_BUS_FLAG_CONSUME_ONLY        (1 << 1)
>  
> +#define ACPI_APEI_ERROR_DEVICE   "GEDD"
>  /**
>   * init_aml_allocator:
>   *
> @@ -382,6 +383,7 @@ Aml *aml_dma(AmlDmaType typ, AmlDmaBusMaster bm, AmlTransferSize sz,
>               uint8_t channel);
>  Aml *aml_sleep(uint64_t msec);
>  Aml *aml_i2c_serial_bus_device(uint16_t address, const char *resource_source);
> +Aml *aml_error_device(void);
>  
>  /* Block AML object primitives */
>  Aml *aml_scope(const char *name_format, ...) G_GNUC_PRINTF(1, 2);
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index d2dac87b4a9f..1c18ac296fcb 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -101,6 +101,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
>  #define ACPI_GED_PWR_DOWN_EVT      0x2
>  #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
>  #define ACPI_GED_CPU_HOTPLUG_EVT    0x8
> +#define ACPI_GED_ERROR_EVT          0x10
>  
>  typedef struct GEDState {
>      MemoryRegion evt;

