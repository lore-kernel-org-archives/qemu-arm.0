Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3263882njk;
        Tue, 28 Jan 2025 09:45:29 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUmzHNWbyBrcQDOolbGcOV44JmLtoK7WXltz1mqKhZ1RWns9n3UWe1yLqnX+3nakOovsxG1iFzaoGmhiA==@linaro.org
X-Google-Smtp-Source: AGHT+IFWiJVxy6tayqBwSsjIrhIwe9MuxDXBznp/a6EQW36IP6DtzNxpUHNDmtvX+Y50U8Ix+TTN
X-Received: by 2002:a17:90b:2d88:b0:2ee:964e:67ce with SMTP id 98e67ed59e1d1-2f782c61bddmr61241772a91.3.1738086328021;
        Tue, 28 Jan 2025 09:45:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738086328; cv=pass;
        d=google.com; s=arc-20240605;
        b=Y6Swnrtjh7DaktJaWF2VL9sn/luebJV5PjpIy5WyFEePwchIKS2FcK85TEwW2cbVyY
         f3HWKLVoBrSMlOW4NKnFEksndkAwfbJaxePoX/CS+OoCDI7OcALm6GP3fUSh7h3D0O+q
         2+7VnY4ltMD37iuqtMbNW5SPPrpSvKEvA7p+YOU9XUkC3uLTHZaN+sDvwDTB9oDzWT8Z
         URMH0pToGXfCjueAlgwUsosZihl37YKzfGCjG6A5bkPJtQT+Bkbi5E1p5x8Va8kM+tii
         0GAFZGsuJqT/m+vAMSmnUR2XMP3X/KQ3gJoCR29IH95D0OfYVJYONgB8ZnEsrMbA4bd8
         1PnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=Zfqr89imXWDmMtnNPX5X8QpR+faPY8u+j0Hd9gtBUJ8=;
        fh=/KHmkyWsog5jCyMQiLLfjMnJmPrbyARkA2b1Y7r6tOs=;
        b=Ub3oM0a9auDVcD3m0iX9BlSb8MMkhf+qN3eshtrfkkq2YT8lDsLfSDW0X+91fqZJqK
         9wioK4eTpdEEy9qLzR33iNeHSHh9iS3UfSEco3k6AK/6/IPw4HVpcOTmib8Z9FUhcrP1
         Utg7fjTquJoY59xmGCn9Br4Eqqh44FDOh99bUqmsJFi9ApkGzbbQn5vG4qy7NEyJmKZp
         ZD+d0AKJ3EUdYx843Drf/tRKfTzaEsQ0WG0+tH6KIXJ27NcKJRnue1rCTy8t3Cfu6PVy
         +gioVs4YZoXxX8NuiHDsCa6JjTjtVKkr1pYy4IpdkixxVQngrOErscAf0XkQ5MTlfzCQ
         cryw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O2mQ0val;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-491665-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-491665-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-491665-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2f7ffa4d678si13766101a91.91.2025.01.28.09.45.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 09:45:27 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-491665-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O2mQ0val;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-491665-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-491665-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 114D43A6B48
	for <alex.bennee@linaro.org>; Tue, 28 Jan 2025 17:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C991DB34E;
	Tue, 28 Jan 2025 17:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O2mQ0val"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA4B19E99A
	for <linux-kernel@vger.kernel.org>; Tue, 28 Jan 2025 17:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086324; cv=none; b=bMSNjAdQ+PHGENSaPVK9keDuMf3jy/RyE8rmXDcWK1CpgJyb51R69pr8jA3z9bEBiXi+AUkMA6Hu7VhfcsN6lYMKYk9kbxkPQJbEd4QxRKCkVDs//725iePYje320WXVIPgP+ydl3V5K8DeXPeP5lqbsUyD2LC0rXfd2nFH5fgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086324; c=relaxed/simple;
	bh=OOc22Y782XQ+snFA4CHOKKXwT5HRx2ffyjwWTmLm/Hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gz+IrO5bmOeWcEVJekvM6IbwWBXPPI0gWisxX3AEPdSFVrr8A26EK1OBAurVW+ZZRQ9hCFKFxd7R2o2dlrP714dFSGOwcq8ag/U0S6Y5Wr5fsfBxAdldVcDZpyJmMyIDepzWRDcyqTnE2Bju8CbRqcLW2GjHiN5vpn3t1RbIQ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O2mQ0val; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738086321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zfqr89imXWDmMtnNPX5X8QpR+faPY8u+j0Hd9gtBUJ8=;
	b=O2mQ0valwrEZZDEdVZaE9LGVuoS+eteOs73knZJOiyte0gmd+ygfJQypgfoqSsuaYTyjkn
	j3ubDh8FYwzD6Sg94h4pJPi9hXraOKo8s+o4yd9APij6XI040AsvSIq718D6ZykZyGLnHe
	VSGJoADJvODRrhbnwqgBsfUjMcif0WE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-kSpJLKlKNtKAe5B_mmFPCw-1; Tue, 28 Jan 2025 12:45:19 -0500
X-MC-Unique: kSpJLKlKNtKAe5B_mmFPCw-1
X-Mimecast-MFC-AGG-ID: kSpJLKlKNtKAe5B_mmFPCw
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-388d1f6f3b2so2508827f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 28 Jan 2025 09:45:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738086318; x=1738691118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zfqr89imXWDmMtnNPX5X8QpR+faPY8u+j0Hd9gtBUJ8=;
        b=TR6g4on8RvJjP9qIam5JqiSKrAm07c4Mgs4Seu6SJa3BjRF4s6zh2Q19OrCku72Boy
         ylQttiSvXbjRvnnVlnbPxDoWw2Qqbxyvbif0PMYbpOm26PLFiF4+o/ceNNVHxnpDMyuc
         nATLTTL3VXdmk4ESl+7I1htQ4VgWgcP2IEk125gfWkohMngbz8r+xHZSJzyoBp9PKILU
         NbSb1BG5MhK2LMJJRJgy+wC5qTMCbIkvxvYXPpktKdumqYTnFSS9ehrl6CT2ixJUEbo8
         bdN1dgtZJv10skuudHSu7OR1z721ZeUdU9CVWeOdhAZQ/37UYIvuhbQrm8l/IzHRb2/M
         9D7g==
X-Forwarded-Encrypted: i=1; AJvYcCWI6AC13CkRHvwAlZ/px1ojkbUvM6jfyjINx7g0Bf329JiU+JPDMfWvVbR79dBl/HoExJswM5Rk/kT3NV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6OW5ZWiEpLxvW5/lXbMWIb7Vd4n/csvj/2SZKE8DtN6Regu9V
	LtVNx5DgpcUeq9A4BQa8xW/fVEzlykaiwL1zSqmqfgd+4hlcqWRo1lCIQU8QWi9vhoveQl3U7NE
	GSKdVEW16KaWbat6PDeGiUwJOnj6PdcXwrrSvSNVMn86FUdPYLLkY5bKAvE7FJw==
X-Gm-Gg: ASbGncszGZKuGzxp7+rc2xSyoX3Z9JjKE5/U3ZlHWH8mH/mX28407VyTKc60w7YkyxI
	BUM4+KFritlWPZFptMTmnYuEzS/CwKNrBHxU0Hdr56rcu06McHvVNiIPz1u/pdzahjME+z7er3J
	z4E5p7+rAgEKuuKC+uyvUiXUsdoyG/iZbxE3XfRfY13mwv4RGTNoMhwAW2mhVZoBCzw8OEOXnfr
	h9q2L/vo1i8w5XUOLvA8YhnpDFdtJj3+VdEvfBEzcgiAhxKDoF0DnV1vjhEgtmsWvmkSoZ3dQ==
X-Received: by 2002:a05:6000:1287:b0:38a:4184:151c with SMTP id ffacd0b85a97d-38bf5675482mr37150653f8f.27.1738086318245;
        Tue, 28 Jan 2025 09:45:18 -0800 (PST)
X-Received: by 2002:a05:6000:1287:b0:38a:4184:151c with SMTP id ffacd0b85a97d-38bf5675482mr37150632f8f.27.1738086317802;
        Tue, 28 Jan 2025 09:45:17 -0800 (PST)
Received: from redhat.com ([2a02:14f:1ed:1cfa:28ca:8a9:c621:2a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c4a160ba3sm3010862f8f.18.2025.01.28.09.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 09:45:16 -0800 (PST)
Date: Tue, 28 Jan 2025 12:45:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Igor Mammedov <imammedo@redhat.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Ani Sinha <anisinha@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] acpi/generic_event_device: add an APEI error device
Message-ID: <20250128124438-mutt-send-email-mst@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
 <41b6846394154ddac4d00c3644cd2de577d10115.1737560101.git.mchehab+huawei@kernel.org>
 <20250124133054.1f06579c@imammedo.users.ipa.redhat.com>
 <20250128184202.14778f27@foz.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128184202.14778f27@foz.lan>
X-TUID: bd6mb6kDdzuo

On Tue, Jan 28, 2025 at 06:42:02PM +0100, Mauro Carvalho Chehab wrote:
> Em Fri, 24 Jan 2025 13:30:54 +0100
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > On Wed, 22 Jan 2025 16:46:25 +0100
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > 
> > > Adds a generic error device to handle generic hardware error
> > > events as specified at ACPI 6.5 specification at 18.3.2.7.2:
> > > https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html#event-notification-for-generic-error-sources
> > > using HID PNP0C33.
> > > 
> > > The PNP0C33 device is used to report hardware errors to
> > > the guest via ACPI APEI Generic Hardware Error Source (GHES).
> > > 
> > > Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > > ---
> > >  hw/acpi/aml-build.c                    | 10 ++++++++++
> > >  hw/acpi/generic_event_device.c         |  8 ++++++++
> > >  include/hw/acpi/acpi_dev_interface.h   |  1 +
> > >  include/hw/acpi/aml-build.h            |  2 ++
> > >  include/hw/acpi/generic_event_device.h |  1 +
> > >  5 files changed, 22 insertions(+)
> > > 
> > > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > > index f8f93a9f66c8..e4bd7b611372 100644
> > > --- a/hw/acpi/aml-build.c
> > > +++ b/hw/acpi/aml-build.c
> > > @@ -2614,3 +2614,13 @@ Aml *aml_i2c_serial_bus_device(uint16_t address, const char *resource_source)
> > >  
> > >      return var;
> > >  }
> > > +
> > > +/* ACPI 5.0b: 18.3.2.6.2 Event Notification For Generic Error Sources */
> > > +Aml *aml_error_device(void)
> > > +{
> > > +    Aml *dev = aml_device(ACPI_APEI_ERROR_DEVICE);
> > > +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C33")));
> > > +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> > > +
> > > +    return dev;
> > > +}
> > > diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> > > index fe537ed05c66..ce00c80054f4 100644
> > > --- a/hw/acpi/generic_event_device.c
> > > +++ b/hw/acpi/generic_event_device.c
> > > @@ -26,6 +26,7 @@ static const uint32_t ged_supported_events[] = {
> > >      ACPI_GED_PWR_DOWN_EVT,
> > >      ACPI_GED_NVDIMM_HOTPLUG_EVT,
> > >      ACPI_GED_CPU_HOTPLUG_EVT,
> > > +    ACPI_GED_ERROR_EVT,
> > >  };
> > >  
> > >  /*
> > > @@ -116,6 +117,11 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
> > >                             aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
> > >                                        aml_int(0x80)));
> > >                  break;
> > > +            case ACPI_GED_ERROR_EVT:
> > > +                aml_append(if_ctx,
> > > +                           aml_notify(aml_name(ACPI_APEI_ERROR_DEVICE),
> > > +                                      aml_int(0x80)));  
> >                                                  ^^^^^
> > nit: perhaps add a comment with intent and ref to spec wrt above  value
> 
> Will add this as with a define:
> 
> 	/*
> 	 * ACPI 5.0b: 5.6.6 Device Object Notifications
> 	 * Table 5-135 Error Device Notification Values
> 	 */
> 	#define ERROR_DEVICE_NOTIFICATION   0x80
> 
> (the spec here is the same as we used on this patch for aml_error_device()
> function)

we do not do a lot of defines definetely not for 1 time used constants.

just comment on top of the value.

> > 
> > > +                break;
> > >              case ACPI_GED_NVDIMM_HOTPLUG_EVT:
> > >                  aml_append(if_ctx,
> > >                             aml_notify(aml_name("\\_SB.NVDR"),
> > > @@ -295,6 +301,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> > >          sel = ACPI_GED_MEM_HOTPLUG_EVT;
> > >      } else if (ev & ACPI_POWER_DOWN_STATUS) {
> > >          sel = ACPI_GED_PWR_DOWN_EVT;
> > > +    } else if (ev & ACPI_GENERIC_ERROR) {
> > > +        sel = ACPI_GED_ERROR_EVT;
> > >      } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
> > >          sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
> > >      } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
> > > diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
> > > index 68d9d15f50aa..8294f8f0ccca 100644
> > > --- a/include/hw/acpi/acpi_dev_interface.h
> > > +++ b/include/hw/acpi/acpi_dev_interface.h
> > > @@ -13,6 +13,7 @@ typedef enum {
> > >      ACPI_NVDIMM_HOTPLUG_STATUS = 16,
> > >      ACPI_VMGENID_CHANGE_STATUS = 32,
> > >      ACPI_POWER_DOWN_STATUS = 64,
> > > +    ACPI_GENERIC_ERROR = 128,
> > >  } AcpiEventStatusBits;
> > >  
> > >  #define TYPE_ACPI_DEVICE_IF "acpi-device-interface"
> > > diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> > > index c18f68134246..f38e12971932 100644
> > > --- a/include/hw/acpi/aml-build.h
> > > +++ b/include/hw/acpi/aml-build.h
> > > @@ -252,6 +252,7 @@ struct CrsRangeSet {
> > >  /* Consumer/Producer */
> > >  #define AML_SERIAL_BUS_FLAG_CONSUME_ONLY        (1 << 1)
> > >  
> > > +#define ACPI_APEI_ERROR_DEVICE   "GEDD"
> > >  /**
> > >   * init_aml_allocator:
> > >   *
> > > @@ -382,6 +383,7 @@ Aml *aml_dma(AmlDmaType typ, AmlDmaBusMaster bm, AmlTransferSize sz,
> > >               uint8_t channel);
> > >  Aml *aml_sleep(uint64_t msec);
> > >  Aml *aml_i2c_serial_bus_device(uint16_t address, const char *resource_source);
> > > +Aml *aml_error_device(void);
> > >  
> > >  /* Block AML object primitives */
> > >  Aml *aml_scope(const char *name_format, ...) G_GNUC_PRINTF(1, 2);
> > > diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> > > index d2dac87b4a9f..1c18ac296fcb 100644
> > > --- a/include/hw/acpi/generic_event_device.h
> > > +++ b/include/hw/acpi/generic_event_device.h
> > > @@ -101,6 +101,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
> > >  #define ACPI_GED_PWR_DOWN_EVT      0x2
> > >  #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
> > >  #define ACPI_GED_CPU_HOTPLUG_EVT    0x8
> > > +#define ACPI_GED_ERROR_EVT          0x10
> > >  
> > >  typedef struct GEDState {
> > >      MemoryRegion evt;  
> > 
> 
> 
> 
> Thanks,
> Mauro

