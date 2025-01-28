Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3262025njk;
        Tue, 28 Jan 2025 09:42:14 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXDHDj7IsvRrkv1V9r0T4SA+hUVOyNlfnsW3hpnlCgYpp5py18/S+8BaJeLDsGGTviZQePDuj6fQoKAiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFOxmv6Fdqjyvxhrw35LIr169qvCzbzV3R+E+jrMyUMrAv5NURzADl3gHKE+V/ZVmvcQ3nC
X-Received: by 2002:a05:620a:2947:b0:7b6:d6ff:86ba with SMTP id af79cd13be357-7be6325de3emr6980843985a.52.1738086134297;
        Tue, 28 Jan 2025 09:42:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738086134; cv=pass;
        d=google.com; s=arc-20240605;
        b=GbNkBQ7uKODU4WMOs9J/7suX5A/iPPjlESxTdCeqkgShHS/DzUjIa7bu/9Lqm13fcw
         fgAjykl52OgFYPwZi1jnL7qu2h43vCETSYwY8Sn5kdgq6kzcmSzw5E9/Rsaok2PtLUUm
         cut6cmV5sDKJyFQ7UVO2zDQlI06ssoFH8/Tyko292rQnnhfrpJatzttSwEX36A7IdztH
         eKJoJ12MT8yrudGsHeSzWzRV3SEYOQQfXRPP37u4vLwQpzpz2MuGNrz9EtEq1MI2P/cS
         M7pdZo68d91qKd0aAiLE2hSaVQWwfoGLLUCfnCst6uIMrjglbl7kTd2RdEnWi+5FcM3X
         hE1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=SbOizmaq2Itag9OFyDgtWRS9GcnmsAhHCO7QS/OVSYw=;
        fh=Qe1Z/MD0vjI9Zl9s5p7E7+jjEbdm3kdir/Riz6VYbdE=;
        b=T6gacJ2Xb4/7Umb/ELdcZddFZG06XDIoe2XkRHorm71hipmYuQqHv6CD9yxkeLKHbg
         vfs3+iiP0Or2VLfjabeUHR5pvkPKyq/UZxnWnax6URr2//j0usqPWPZs33VgRInbE2sP
         4ZLah62s1KoF74roElMCsAAKu1jzmmK/q7M/4f6dZ9jCyWJ5JwEeThTbNUUgRT/8c1wR
         5krtR4k9kf8q81qSi56pK+RmnvdsuhFnfBfRC5ByB8qF5MDy+dp4fvAHA9t72ZgouGSz
         9TI0NhnxQwFH4aTfnr97nOb8cwpQAhnZviCtDD1h6brcv9lbHYrAbYnYDuJSryERFHxU
         WOaA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=OtzDeN+t;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-491664-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-491664-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-491664-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id af79cd13be357-7be9ae81c02si1268236185a.40.2025.01.28.09.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 09:42:14 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-491664-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=OtzDeN+t;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-491664-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-491664-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E310166EFA
	for <alex.bennee@linaro.org>; Tue, 28 Jan 2025 17:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29031DE4C8;
	Tue, 28 Jan 2025 17:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtzDeN+t"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF5B1D9329
	for <linux-kernel@vger.kernel.org>; Tue, 28 Jan 2025 17:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086127; cv=none; b=jtVky/8wamkeaVurAGVDsaWzfTMxdzQZBI/jb9S3d+0Vq/MMIStE7lN99fzUWYvIUp/5qmuqU6xPVxklqu511XYV9Oy8ujHRSBgBBEA63G3xVEO0GxeTzv6BEKx/nDADMXG3tWWAqZY/6+DheQ9UEQIQOtPSYeWGyxtNYZ5OqaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086127; c=relaxed/simple;
	bh=z1BdFeZ4d7sRp2EmhOMcvkxfaEkv55R0sRcng+D6Nss=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ssxhOSTaT9Ux3XBjQxXq27gVId3nn0g9XbOBY94HaInxP2cM2GEbaNucqDFkl+V0R29jaaiOyZW1tzjX5rbUj9Jybd0KoDTnYAKTiRQeRRt6qOldgm3puUx11vLjv87dp1XXMtJoQQJ5CwxPrzK/bpDUZEWfww7hrmd+RtUbJQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtzDeN+t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FC7C4CEE2;
	Tue, 28 Jan 2025 17:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086126;
	bh=z1BdFeZ4d7sRp2EmhOMcvkxfaEkv55R0sRcng+D6Nss=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OtzDeN+tWKBDXmZ5dMoIqJyvUOMmHLNxngL5IqhlgIOpU+CdYN716KlB28b6l7EYu
	 cQ2JZU+9lGYXLZFX0gVIbcA3L3bJkdzSuoevHoXcZuU2a6aqwQDQqPmFD5pyCkbfen
	 zIayipibZBk8tZQ2/yk0jKBvpbIBbDF5mbJDI4Rwkx3eqb8SBabwr1U8RJHk76eVxr
	 t+ahaB9vrqysvaCE0kGTPe0Csn50V8phGCvgvjNgeFSEtTwYQ1W4/RBECE0jcn6P6c
	 Baf0N8aVOs0S4K3Y2mFLFq4LLQepQg/CrEKqmRevbdL9w6P/RO7osu6EP0UVzs5pYJ
	 FWVh5PacadEIw==
Date: Tue, 28 Jan 2025 18:42:02 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] acpi/generic_event_device: add an APEI error
 device
Message-ID: <20250128184202.14778f27@foz.lan>
In-Reply-To: <20250124133054.1f06579c@imammedo.users.ipa.redhat.com>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<41b6846394154ddac4d00c3644cd2de577d10115.1737560101.git.mchehab+huawei@kernel.org>
	<20250124133054.1f06579c@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: HpG/X2slQ8RB

Em Fri, 24 Jan 2025 13:30:54 +0100
Igor Mammedov <imammedo@redhat.com> escreveu:

> On Wed, 22 Jan 2025 16:46:25 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Adds a generic error device to handle generic hardware error
> > events as specified at ACPI 6.5 specification at 18.3.2.7.2:
> > https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html#event-notification-for-generic-error-sources
> > using HID PNP0C33.
> > 
> > The PNP0C33 device is used to report hardware errors to
> > the guest via ACPI APEI Generic Hardware Error Source (GHES).
> > 
> > Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  hw/acpi/aml-build.c                    | 10 ++++++++++
> >  hw/acpi/generic_event_device.c         |  8 ++++++++
> >  include/hw/acpi/acpi_dev_interface.h   |  1 +
> >  include/hw/acpi/aml-build.h            |  2 ++
> >  include/hw/acpi/generic_event_device.h |  1 +
> >  5 files changed, 22 insertions(+)
> > 
> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > index f8f93a9f66c8..e4bd7b611372 100644
> > --- a/hw/acpi/aml-build.c
> > +++ b/hw/acpi/aml-build.c
> > @@ -2614,3 +2614,13 @@ Aml *aml_i2c_serial_bus_device(uint16_t address, const char *resource_source)
> >  
> >      return var;
> >  }
> > +
> > +/* ACPI 5.0b: 18.3.2.6.2 Event Notification For Generic Error Sources */
> > +Aml *aml_error_device(void)
> > +{
> > +    Aml *dev = aml_device(ACPI_APEI_ERROR_DEVICE);
> > +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C33")));
> > +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> > +
> > +    return dev;
> > +}
> > diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> > index fe537ed05c66..ce00c80054f4 100644
> > --- a/hw/acpi/generic_event_device.c
> > +++ b/hw/acpi/generic_event_device.c
> > @@ -26,6 +26,7 @@ static const uint32_t ged_supported_events[] = {
> >      ACPI_GED_PWR_DOWN_EVT,
> >      ACPI_GED_NVDIMM_HOTPLUG_EVT,
> >      ACPI_GED_CPU_HOTPLUG_EVT,
> > +    ACPI_GED_ERROR_EVT,
> >  };
> >  
> >  /*
> > @@ -116,6 +117,11 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
> >                             aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
> >                                        aml_int(0x80)));
> >                  break;
> > +            case ACPI_GED_ERROR_EVT:
> > +                aml_append(if_ctx,
> > +                           aml_notify(aml_name(ACPI_APEI_ERROR_DEVICE),
> > +                                      aml_int(0x80)));  
>                                                  ^^^^^
> nit: perhaps add a comment with intent and ref to spec wrt above  value

Will add this as with a define:

	/*
	 * ACPI 5.0b: 5.6.6 Device Object Notifications
	 * Table 5-135 Error Device Notification Values
	 */
	#define ERROR_DEVICE_NOTIFICATION   0x80

(the spec here is the same as we used on this patch for aml_error_device()
function)

> 
> > +                break;
> >              case ACPI_GED_NVDIMM_HOTPLUG_EVT:
> >                  aml_append(if_ctx,
> >                             aml_notify(aml_name("\\_SB.NVDR"),
> > @@ -295,6 +301,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> >          sel = ACPI_GED_MEM_HOTPLUG_EVT;
> >      } else if (ev & ACPI_POWER_DOWN_STATUS) {
> >          sel = ACPI_GED_PWR_DOWN_EVT;
> > +    } else if (ev & ACPI_GENERIC_ERROR) {
> > +        sel = ACPI_GED_ERROR_EVT;
> >      } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
> >          sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
> >      } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
> > diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
> > index 68d9d15f50aa..8294f8f0ccca 100644
> > --- a/include/hw/acpi/acpi_dev_interface.h
> > +++ b/include/hw/acpi/acpi_dev_interface.h
> > @@ -13,6 +13,7 @@ typedef enum {
> >      ACPI_NVDIMM_HOTPLUG_STATUS = 16,
> >      ACPI_VMGENID_CHANGE_STATUS = 32,
> >      ACPI_POWER_DOWN_STATUS = 64,
> > +    ACPI_GENERIC_ERROR = 128,
> >  } AcpiEventStatusBits;
> >  
> >  #define TYPE_ACPI_DEVICE_IF "acpi-device-interface"
> > diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> > index c18f68134246..f38e12971932 100644
> > --- a/include/hw/acpi/aml-build.h
> > +++ b/include/hw/acpi/aml-build.h
> > @@ -252,6 +252,7 @@ struct CrsRangeSet {
> >  /* Consumer/Producer */
> >  #define AML_SERIAL_BUS_FLAG_CONSUME_ONLY        (1 << 1)
> >  
> > +#define ACPI_APEI_ERROR_DEVICE   "GEDD"
> >  /**
> >   * init_aml_allocator:
> >   *
> > @@ -382,6 +383,7 @@ Aml *aml_dma(AmlDmaType typ, AmlDmaBusMaster bm, AmlTransferSize sz,
> >               uint8_t channel);
> >  Aml *aml_sleep(uint64_t msec);
> >  Aml *aml_i2c_serial_bus_device(uint16_t address, const char *resource_source);
> > +Aml *aml_error_device(void);
> >  
> >  /* Block AML object primitives */
> >  Aml *aml_scope(const char *name_format, ...) G_GNUC_PRINTF(1, 2);
> > diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> > index d2dac87b4a9f..1c18ac296fcb 100644
> > --- a/include/hw/acpi/generic_event_device.h
> > +++ b/include/hw/acpi/generic_event_device.h
> > @@ -101,6 +101,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
> >  #define ACPI_GED_PWR_DOWN_EVT      0x2
> >  #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
> >  #define ACPI_GED_CPU_HOTPLUG_EVT    0x8
> > +#define ACPI_GED_ERROR_EVT          0x10
> >  
> >  typedef struct GEDState {
> >      MemoryRegion evt;  
> 



Thanks,
Mauro
