Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3584710njk;
        Tue, 28 Jan 2025 22:26:18 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUa7D8VrZeUiGnQWLRPdV4hd0mn5+j1TWvS1dIIwIRkKm2qH4TfSeqqi0tDE9g6lON1/CZQXaKPeQol5A==@linaro.org
X-Google-Smtp-Source: AGHT+IGMGvDWjgZo72tbgnKnh4b3E02nxkfkjrE1kpHqogAXmfKHWA6XckuYMlB0n13aF8Jby6Ir
X-Received: by 2002:a05:6a00:c88:b0:727:3c37:d5fb with SMTP id d2e1a72fcca58-72fd0c70535mr3014832b3a.16.1738131978374;
        Tue, 28 Jan 2025 22:26:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738131978; cv=pass;
        d=google.com; s=arc-20240605;
        b=kNNSUQKIuszcdNQK8JD8BRNeVD0Vk1lY+zNQSGovWM5QkiENfyRvK+h29dMKAZyuOO
         kaY+i+humRjUtjK4nyAJjyPkjr5nrQG4HtMwct3N0T4N5txY5gP1Ai5HJEU7iVcQEBD+
         V5ZACj+RJa5al/6aAg8mh7l37VSg5M+OhE3AhSNEfILHz4aDTsndd5j9kX3K0asqd3Ju
         FOKNqZBMXHJU7ACLzxIwZnaWKbz0jYTxNwDYHuQ2LEnnE9hlEc3s2jPZrsuKnXdtAOcG
         fi+k5WM8tD9es8i82FXy63TPkxmtmVRuFFx6aSYKUkpJaehaFPOiqFJp5+49CEgg23fC
         A6yg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=RyDaNK+oRo+LarnHxDgRP95Yc0YqNxlAx08X5I+J/F0=;
        fh=jy3ctDhNPhSpipFZfFTKSgLonWQac5h6M4gFQDDmX0Y=;
        b=Qjp4vCS0O+CnbZ4pIMNWAiWy2xbDGcQSyV4JgeIBfneyi4FAEpgFUt48DLHIsWp0fx
         Ozg6MCytsRz73O/KbC4X5izRROiEmIr1EwINZkbS4VNjBQJUoJ9KtXPb5eu76gIkx+kY
         ShUpV+s/nUtbl+ts2y0w72PrY9MFpCAQ7KhHL6rT19ZTu0ic1wiHh63Ksi2bFO/jp4nw
         BZjA0vBuzwYp3Mn+svHoSewPuAtZ3Jt+RRcfaoshSVA0NRuLwATEwMXpr+Sr7mzGSqZ+
         5A6hbk5674evMX6fIc+LV0aLqAbI5Mcwxnvp4XRKQr2KpEosyOEQp+7r/tuTtHYzH6IR
         YYNg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=EzxJKEQW;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492124-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492124-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-492124-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-72f8a6a2c57si14564478b3a.22.2025.01.28.22.26.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 22:26:18 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492124-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=EzxJKEQW;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492124-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492124-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A7827A34B2
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 06:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C539D18FDC8;
	Wed, 29 Jan 2025 06:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzxJKEQW"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786FA176FB0
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 06:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738131972; cv=none; b=V7yf41w18x3/4qWpFa+9bG+ccjIRFtTCM7+ETkn9oJX7LQvnZ/9vd7VTJ8fOhRxLlDJ+uwMrW/sGY6ZlnA1dgL51SR0Gga77dLAAtde3gQFjNndtRmAJnPrzJn+FdRaoUnGrzVNpHwZdoLlgJg60gBOGzoPL51uWLwEa/LdSIPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738131972; c=relaxed/simple;
	bh=Vdik5QjUxtGOf3zWCkXL3d1o6WJi+pyGk0bEJ2cgek4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gASWugxrwu2711B7yK8ksjeb58wMpX+GZYptkGKNvI9It8MOYg1LYVcVI4NO32XcXUcCkUzZlKsx8koh/k5Ms3LPRlN0pOMbtZh9wA5LmKlBUF3VqOvkZn+Uj0rHWJlc9vjKSZ9JwrlD3pVJG31/Abpu60822+uqy4Vy0rLQI/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzxJKEQW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC2FC4CEE0;
	Wed, 29 Jan 2025 06:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738131971;
	bh=Vdik5QjUxtGOf3zWCkXL3d1o6WJi+pyGk0bEJ2cgek4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EzxJKEQWTBb9ufFcL4YmfNz9XaLl9kL+/9HuFw7Wusa2a3kLqf6vwJq2fIpbEXQ4Q
	 1HUy84kJXALc+NWGEpzhN20mD8iVoyh64JN549zVT5nT92Z6lfZTUUTU3UD/cwoxaM
	 /Yf1lvlokkDzZhq2cYZL1YJtyVWJGXHY3vo/nw/tUFwgc2PJllHUJPk6X2MRjTUmmZ
	 ryAuXg8zGsSVLk5DoJBQYeC6T31tNfhQ3Jvym/gxlUzW7sD4sPZX+/60Nhxsjk1VlS
	 XUSlJI0Nm1Ix1K5eVsdj3mHiVYaSrviygDDuHgO9aNV8HlUR4FPaZIPd1yMahkho8Z
	 irsMKHUOgFRew==
Date: Wed, 29 Jan 2025 07:26:05 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?UTF-8?B?TWF0aGll?=
 =?UTF-8?B?dS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Yanan Wang
 <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/11] acpi/generic_event_device: add logic to detect if
 HEST addr is available
Message-ID: <20250129072605.4d306d4b@foz.lan>
In-Reply-To: <20250128122951.6bd52b89@foz.lan>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<556c19c1f3fa907c6cc13b62e060f6baa6faf2cf.1737560101.git.mchehab+huawei@kernel.org>
	<20250124112346.4751ccf2@imammedo.users.ipa.redhat.com>
	<20250128122951.6bd52b89@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: VBO5EIgHqUu7

Em Tue, 28 Jan 2025 12:29:51 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Fri, 24 Jan 2025 11:23:46 +0100
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > On Wed, 22 Jan 2025 16:46:22 +0100
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
> > > Create a new property (x-has-hest-addr) and use it to detect if
> > > the GHES table offsets can be calculated from the HEST address
> > > (qemu 9.2 and upper) or via the legacy way via an offset obtained    
> > 
> > 10.0 by now
> >   
> > > from the hardware_errors firmware file.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > >  hw/acpi/generic_event_device.c |  1 +
> > >  hw/acpi/ghes.c                 | 28 +++++++++++++++++++++-------
> > >  hw/arm/virt-acpi-build.c       | 30 ++++++++++++++++++++++++++----
> > >  hw/core/machine.c              |  2 ++
> > >  include/hw/acpi/ghes.h         |  1 +
> > >  5 files changed, 51 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> > > index 5346cae573b7..fe537ed05c66 100644
> > > --- a/hw/acpi/generic_event_device.c
> > > +++ b/hw/acpi/generic_event_device.c
> > > @@ -318,6 +318,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> > >  
> > >  static const Property acpi_ged_properties[] = {
> > >      DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
> > > +    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.hest_lookup, true),    
> > 
> > s/hest_lookup/use_hest_addr/
> >   
> > >  };
> > >  
> > >  static const VMStateDescription vmstate_memhp_state = {
> > > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > > index b46b563bcaf8..86c97f60d6a0 100644
> > > --- a/hw/acpi/ghes.c
> > > +++ b/hw/acpi/ghes.c
> > > @@ -359,6 +359,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
> > >  {
> > >      AcpiTable table = { .sig = "HEST", .rev = 1,
> > >                          .oem_id = oem_id, .oem_table_id = oem_table_id };
> > > +    AcpiGedState *acpi_ged_state;
> > > +    AcpiGhesState *ags = NULL;
> > >      int i;
> > >  
> > >      build_ghes_error_table(hardware_errors, linker, num_sources);
> > > @@ -379,10 +381,20 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
> > >       * tell firmware to write into GPA the address of HEST via fw_cfg,
> > >       * once initialized.
> > >       */
> > > -    bios_linker_loader_write_pointer(linker,
> > > -                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
> > > -                                     sizeof(uint64_t),
> > > -                                     ACPI_BUILD_TABLE_FILE, hest_offset);
> > > +
> > > +    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> > > +                                                       NULL));    
> > 
> > the caller, already did lookup,
> > just pass hest_lookup as an argument and use it here  
> 
> for all the above: OK.
> 
> > > +    if (!acpi_ged_state) {
> > > +        return;
> > > +    }
> > > +
> > > +    ags = &acpi_ged_state->ghes_state;
> > > +    if (ags->hest_lookup) {
> > > +        bios_linker_loader_write_pointer(linker,
> > > +                                         ACPI_HEST_ADDR_FW_CFG_FILE, 0,
> > > +                                         sizeof(uint64_t),
> > > +                                         ACPI_BUILD_TABLE_FILE, hest_offset);
> > > +    }
> > >  }
> > >  
> > >  void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> > > @@ -396,8 +408,10 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> > >      fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
> > >          NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);    
> > 
> > btw shouldn't we disable hw_error_le if hest_lookup is active?  
> 
> Despite not being used, we still need the fw_cfg logic to recalculate the 
> table offsets, solving the bios_linker stuff.
> 
> At the tests I did, not having a callback causes some fw_cfg issue when QEMU
> tries to load the firmware or tries to update it.
> 
> > >  
> > > -    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
> > > -        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
> > > +    if (ags && ags->hest_lookup) {    
> > 
> > why bother with 'ags &&' if we don't do it hw_error_le?  
> 
> Legacy stuff. I'll drop "ags &&".
> 
> > 
> >   
> > > +        fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
> > > +            NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
> > > +    }
> > >  
> > >      ags->present = true;
> > >  }
> > > @@ -512,7 +526,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
> > >      }
> > >      ags = &acpi_ged_state->ghes_state;
> > >  
> > > -    if (!ags->hest_addr_le) {
> > > +    if (!ags->hest_lookup) {    
> > why? !ags->hest_addr_le is sufficient  
> 
> Either checking for "hest_addr_le" or for "use_hest_addr" would
> equally work, assuming that address == 0 is invalid. I opted to use
> the latest one because you requested on a previous review, and also
> because it makes clearer that this comes from the migration logic,
> which dictates what kind of lookup should be done.
> 
> From my side, either way works fine. What do you prefer?

After sleeping on it, IMO checking for !ags->hest_addr_le is better here and will
align with the new code from this patch:

	acpi/ghes: Cleanup the code which gets ghes ged state

that will remove ags->present in favor of checking for both hw_error_le and
hest_addr_le:

	AcpiGhesState *acpi_ghes_get_state(void)
	{
	     AcpiGedState *acpi_ged_state;
	     AcpiGhesState *ags;
 
	     if (!acpi_ged_state) {
	        return NULL;
	     }
	     ags = &acpi_ged_state->ghes_state;

	    if (!ags->hw_error_le && !ags->hest_addr_le) {
	        return NULL;
	    }
	    return ags;
	 }

So, I'll drop this hunk.

> 
> >   
> > >          get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
> > >                               &cper_addr, &read_ack_register_addr);
> > >      } else {
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index 3d411787fc37..ada5d08cfbe7 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -897,6 +897,10 @@ static const AcpiNotificationSourceId hest_ghes_notify[] = {
> > >      { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
> > >  };
> > >  
> > > +static const AcpiNotificationSourceId hest_ghes_notify_9_2[] = {
> > > +    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
> > > +};
> > > +
> > >  static
> > >  void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> > >  {
> > > @@ -950,10 +954,28 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> > >      build_dbg2(tables_blob, tables->linker, vms);
> > >  
> > >      if (vms->ras) {
> > > -        acpi_add_table(table_offsets, tables_blob);
> > > -        acpi_build_hest(tables_blob, tables->hardware_errors, tables->linker,
> > > -                        hest_ghes_notify, ARRAY_SIZE(hest_ghes_notify),
> > > -                        vms->oem_id, vms->oem_table_id);
> > > +        AcpiGhesState *ags;
> > > +        AcpiGedState *acpi_ged_state;
> > > +
> > > +        acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> > > +                                                       NULL));
> > > +        if (acpi_ged_state) {
> > > +            ags = &acpi_ged_state->ghes_state;
> > > +
> > > +            acpi_add_table(table_offsets, tables_blob);
> > > +
> > > +            if (!ags->hest_lookup) {
> > > +                acpi_build_hest(tables_blob, tables->hardware_errors,
> > > +                                tables->linker, hest_ghes_notify_9_2,
> > > +                                ARRAY_SIZE(hest_ghes_notify_9_2),
> > > +                                vms->oem_id, vms->oem_table_id);
> > > +            } else {
> > > +                acpi_build_hest(tables_blob, tables->hardware_errors,
> > > +                                tables->linker, hest_ghes_notify,
> > > +                                ARRAY_SIZE(hest_ghes_notify),
> > > +                                vms->oem_id, vms->oem_table_id);
> > > +            }
> > > +        }
> > >      }
> > >  
> > >      if (ms->numa_state->num_nodes > 0) {
> > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > index c23b39949649..0d0cde481954 100644
> > > --- a/hw/core/machine.c
> > > +++ b/hw/core/machine.c
> > > @@ -34,10 +34,12 @@
> > >  #include "hw/virtio/virtio-pci.h"
> > >  #include "hw/virtio/virtio-net.h"
> > >  #include "hw/virtio/virtio-iommu.h"
> > > +#include "hw/acpi/generic_event_device.h"
> > >  #include "audio/audio.h"
> > >  
> > >  GlobalProperty hw_compat_9_2[] = {
> > >      {"arm-cpu", "backcompat-pauth-default-use-qarma5", "true"},
> > > +    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
> > >  };
> > >  const size_t hw_compat_9_2_len = G_N_ELEMENTS(hw_compat_9_2);
> > >  
> > > diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> > > index 237721fec0a2..164ed8b0f9a3 100644
> > > --- a/include/hw/acpi/ghes.h
> > > +++ b/include/hw/acpi/ghes.h
> > > @@ -61,6 +61,7 @@ typedef struct AcpiGhesState {
> > >      uint64_t hest_addr_le;
> > >      uint64_t hw_error_le;
> > >      bool present; /* True if GHES is present at all on this board */    
> >                         and perhaps reformulate this as well
> >   
> > > +    bool hest_lookup; /* True if HEST address is present */    
> >                                  if device should use HEST addr for error source lookup 
> >   
> > >  } AcpiGhesState;
> > >  
> > >  /*    
> >   
> 
> 
> 
> Thanks,
> Mauro



Thanks,
Mauro
