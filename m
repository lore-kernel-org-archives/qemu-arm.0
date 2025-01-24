Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp771281njk;
        Fri, 24 Jan 2025 04:31:05 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVz0xUTvGCCjDjQXSnfmnv/GLK6SL3r9s49x9FDxqr0POF4gS/hbB3noqZtOUNas7uASj3Fkn/t7o/YpQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEsl5yZDIJ4KNyb2H8lLCcYNd6+fpTUOrKzhzDBg0INk6NibsKymkCopivZtKYpdA0ciSSJ
X-Received: by 2002:ad4:5cc7:0:b0:6d8:99cf:d2d0 with SMTP id 6a1803df08f44-6e1f9fd7877mr114412306d6.19.1737721865656;
        Fri, 24 Jan 2025 04:31:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737721865; cv=pass;
        d=google.com; s=arc-20240605;
        b=D4RxRLJ3gTN1J2cjY9dszT03vlBd+2W6DS9p57oJxeYfRx6E+WVK85KOoHY1Hvpgs0
         aJ2tDTj41E/Hjc8bMdt8MMroqOKGnD+CH55AEjGDV/VGH3HV0W160OQgT2GBCLNT4r6h
         B2DZ5SyfmC/bmDRNkGEsVUhl+81+rb35wHhSWy7hvPsg2RxIQShXu0WGHE1KIe1sS8vE
         WwUfndy6zmgSaT/JYeSGI2DnZh9bcS+LcSY9EJA786Wge9DudzPYlqQ9/WDt36zvgUX5
         slkz83CE5QbJO9s+JNPJY+Ld/ajywftoYnFtvYIGPNZ55o/e9oRthnR84W15olAO70qs
         /fYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=tWlnJyAfr5kKrDmYCKt5XJ6CvwgSJ3hG6Bq7urvwigs=;
        fh=83PtX4zqWwKwkhRPJTeXFCwv+qHpnDC1PjnTkpfB11Q=;
        b=Tvlo5hkaugkq3VaAf0V5xxXDLVwofQ1qHz5zS2PU/Ar0lkUhDrTIsnI9O3c2ccdufE
         ib7TPXxgJK3rxNcGdB+505/mYB9e951+C8ihRRsSayIGKSUBh1XaSa2klmpRWqiQaaL3
         eZ4LHtD2KTnHQzZGHGSbKxlLLOZyzxtgBnm1JMqujssr1pVM0DuW7RjDEM/Ac+lN5Rm5
         9xWMnSsVhTrL+8YaE3ThBfgGzjxaimN72zbvPMygWTfxszIsg7TeU4RcsQUgms6UKXPE
         HiZOmbxOBUPIrWB4iWFpPldkGZ9KFD8C8ImKvSzKLrTPxo2MtEiC5/ZsF6MMkh33WSnx
         FkoA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DhCdOSfM;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-487908-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-487908-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-487908-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e20613416csi20887846d6.468.2025.01.24.04.31.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 04:31:05 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-487908-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DhCdOSfM;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-487908-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-487908-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72183165FF8
	for <alex.bennee@linaro.org>; Fri, 24 Jan 2025 12:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B9721A422;
	Fri, 24 Jan 2025 12:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DhCdOSfM"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE18314B956
	for <linux-kernel@vger.kernel.org>; Fri, 24 Jan 2025 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737721861; cv=none; b=FctbkeTJByoDDLhl20k7eTpvuNxtN5sKV4KZJlewRwQVRDyB3fj8vda51FXlbpraG9xmrxJbeiSHNbpoperf8VaFJO6RPjErGS+JJ32rprX/nKuhdJcLQ/jAXkaKa5jt/uH6V88emiHQ2Voz2se+XzRBpzkLgu9u1Mkl8xCG0i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737721861; c=relaxed/simple;
	bh=YUnOv1jgBdX6/Q8ytT0dPdsGRv9pabO3YJp0KLcqssE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WigOt53KcwNRLWYxun4teru9n8hJ7k1o+9IGhpqfLnhbW7asXWAzoj9otplxiwGuXD8CAoRqTI7m5Eoo8XlILa8uojsBmznlsRJU0L6AEWNhdBCEP546jAsmLwECCAwgOJJTVp3wKTGmKoaxhSVCkPTM6skqVpSnDr7QJbkKWFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DhCdOSfM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737721858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tWlnJyAfr5kKrDmYCKt5XJ6CvwgSJ3hG6Bq7urvwigs=;
	b=DhCdOSfMgkiJ0mXqnyHKLlg9NG3nvdo0Lr6vjpb+mPS2LYscT/aJmZSRefROj1hy9/T1uC
	bsP0tRoMUfiBnu/diWeJ5W+W/kjUBDjQuS4r7hUHpNdkk0AEebR8ZklpQn0ur9deUUi4oK
	ozwp5VnxuDsUALtguzjRX9svolS76/k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-gDT1S8u3OO6xagk1PKQ9AA-1; Fri, 24 Jan 2025 07:30:57 -0500
X-MC-Unique: gDT1S8u3OO6xagk1PKQ9AA-1
X-Mimecast-MFC-AGG-ID: gDT1S8u3OO6xagk1PKQ9AA
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4361ac607b6so14598565e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 24 Jan 2025 04:30:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737721856; x=1738326656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWlnJyAfr5kKrDmYCKt5XJ6CvwgSJ3hG6Bq7urvwigs=;
        b=qe0eqrnfC1RTUPFLEvStjQ1qNP7yF5O81Fpw1ynpRgaCh4TJRhJ5H9gI3g8FKzDGe7
         uM8zcdqkEPYifrHY5Eyas/ebRt8MVc/L1ap72JC8G+/j8tyg+grKK5UUkfOjyedrKKs6
         5vH50qF6+qZAlJyAn9fuon3xwXdHb/7pCHqjYfJuT9aFuV4d1lcJmPZh/SRIlzkFVT0b
         T2xSlDmKLEPeFJEB8PDNwK47NwRqEHi4ZFK05cdKj3L0cuSDcY9mnytTxcgM1ZN/Ugf+
         b35KIJyfZlAO9ARni/mCkYCiIN+yDtFbD5IcmdPm6ARj8N09TSJgU9CbPYsKl52AsaLY
         s46g==
X-Forwarded-Encrypted: i=1; AJvYcCVlVZwlFRjuUr4Sq1ZOZH6JQX6SoVhwEwhTLrwpzJiLDiytC4AewXpIXV++PAg6SjVPPy8XOPO5zSXsav8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2MzkGu9HlrpvpS3NZPnaKfNaKE0wEBhehl8mTh1kr3pQd5Bcu
	BZ42NfCgqPQsZl3/EzF4DGz3w683BdBItx+GSd9h7czGgswoXN6McWVV7UhNoh6I1kyRpKtHMNr
	LIlBxMhzzL37vh0Mp/VTblz/N4sHaizC/9BmgM+RKHzN1qOEzG0rREsKqueFSHA==
X-Gm-Gg: ASbGncvf+8ZafhTBsai/NGngHbTvlMmatrIXtbiXOg+D9sPbXtv9kGHNYF+e88Fplhh
	pw234XZCwgIQnl8eUJsLgntPBhqStMtOtrOSJJuW0Z7H1ARRSq1XbIPu6saOFmBqcnVQSW2Ae5r
	rkzuw+pDG0CdzqfewHrmJ2gyMuqJdETaOxpjosD722fKC70yHpaEuOkig13FOql8f28lxBGogTO
	xjve98c5OF0o8VuUBA0x1ikLkM3vFQFX5qNR9rigS8Tm70wuTgLtZX2LSXJriQdZwZiNavpCUbH
	fMQB6Bn8xqDyTGSFTGtQR3B3SBgVPY9p2+0n1SPzQQ==
X-Received: by 2002:a05:6000:188d:b0:38a:418e:f3f with SMTP id ffacd0b85a97d-38bf56567f9mr27907906f8f.3.1737721856091;
        Fri, 24 Jan 2025 04:30:56 -0800 (PST)
X-Received: by 2002:a05:6000:188d:b0:38a:418e:f3f with SMTP id ffacd0b85a97d-38bf56567f9mr27907866f8f.3.1737721855667;
        Fri, 24 Jan 2025 04:30:55 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb040sm2553078f8f.67.2025.01.24.04.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 04:30:55 -0800 (PST)
Date: Fri, 24 Jan 2025 13:30:54 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] acpi/generic_event_device: add an APEI error
 device
Message-ID: <20250124133054.1f06579c@imammedo.users.ipa.redhat.com>
In-Reply-To: <41b6846394154ddac4d00c3644cd2de577d10115.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<41b6846394154ddac4d00c3644cd2de577d10115.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: awjQ5FPsEdE1

On Wed, 22 Jan 2025 16:46:25 +0100
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
>  hw/acpi/generic_event_device.c         |  8 ++++++++
>  include/hw/acpi/acpi_dev_interface.h   |  1 +
>  include/hw/acpi/aml-build.h            |  2 ++
>  include/hw/acpi/generic_event_device.h |  1 +
>  5 files changed, 22 insertions(+)
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
> index fe537ed05c66..ce00c80054f4 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -26,6 +26,7 @@ static const uint32_t ged_supported_events[] = {
>      ACPI_GED_PWR_DOWN_EVT,
>      ACPI_GED_NVDIMM_HOTPLUG_EVT,
>      ACPI_GED_CPU_HOTPLUG_EVT,
> +    ACPI_GED_ERROR_EVT,
>  };
>  
>  /*
> @@ -116,6 +117,11 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
>                             aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
>                                        aml_int(0x80)));
>                  break;
> +            case ACPI_GED_ERROR_EVT:
> +                aml_append(if_ctx,
> +                           aml_notify(aml_name(ACPI_APEI_ERROR_DEVICE),
> +                                      aml_int(0x80)));
                                                 ^^^^^
nit: perhaps add a comment with intent and ref to spec wrt above  value

> +                break;
>              case ACPI_GED_NVDIMM_HOTPLUG_EVT:
>                  aml_append(if_ctx,
>                             aml_notify(aml_name("\\_SB.NVDR"),
> @@ -295,6 +301,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
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

