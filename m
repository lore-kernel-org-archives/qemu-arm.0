Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp124242njl;
        Tue, 1 Oct 2024 04:58:09 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWj125TgWDZtrbFxrfLzZdvvsRTjS7ekJtEuNDy5F8keqNdKsKPnPuAC1MMidqiIe8g1tY0VLNY/86BAA==@linaro.org
X-Google-Smtp-Source: AGHT+IHpXRO/lt+0cVVl4dyWzAXg3uAmHQJNOGY4dgjFsYG7rS9g1jqyjp24aq9wVpcCEOZCaCei
X-Received: by 2002:a2e:b8d4:0:b0:2f7:4c9d:7a87 with SMTP id 38308e7fff4ca-2f9d417edc4mr83778531fa.21.1727783889734;
        Tue, 01 Oct 2024 04:58:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727783889; cv=pass;
        d=google.com; s=arc-20240605;
        b=GcqnhLAcrwlcc43tUqE+KPGFTTBanLKZacslvNtEqTwckQ9XOx+oUA1cPa4oxMhWdt
         63TNztyb5KtEc52vVNRtSpb9zHZfqQiYZagf3NZ95XvRMQPv6e6IMfoRXkZFnrSJEiZP
         IJ1/h4CtBxrmIux4zUGwYohB4DglMCzvOLP7On78woWz8omjg6Ljp3JjOgd9TrMfIsn1
         f2fZadiG5pqheONfxAtQq7hLaN8RNaJdzTUIX8etTk1jcH7WTvV6/Vb7kqKI+WVoUcHK
         LIFopU5tkIsOGMsIVZFNM23Hgz+ZUH/9E/1RoeY0UUQRD7GuKIOvR9EpN8Kq6hfw2voO
         V1eA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=RpbrQYFBGCd9wEQd/rEmxCPwUajB6SHemMNiIRg6s3Q=;
        fh=AJ8hn4ioKJA5lsG3NCMNx8yhntdFUmRi9f6dN5eYbeg=;
        b=CtAS9v6nCX70wFRsZu+zoVBllOa6S4raqP4C1dURam3miPCYqywIJ88sV72bwnBHuo
         K5IHOcbWNoULxloe9vTmYP8LCoY4yh1bWsoD0BHeJBYthsvfBflHEEs0CjMkH3GtmB2j
         OXM7vJWZxJ8+ClS/bHM6LStJgjmSC5z9HTf4Dq3mt5IwFUEaBrci84uy5qHr2pZHQq0l
         Q29pCYdFYv8mzQeM+BOWDVZ6AAbUQhgaEOG0FgWu7eXY6NgbK8sHmasQkHzVYByZH9zl
         SwTef4nibiSZu9IbG0tizZEtQRrUD1Szs/xhaclIbke1NZjfqXF5hEK8zmn6pJ82X3Cb
         VyMw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=D0Pzf5Dq;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345840-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345840-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-345840-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5c882408102si7178505a12.93.2024.10.01.04.58.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 04:58:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-345840-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=D0Pzf5Dq;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345840-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345840-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3394A1F22F9F
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 11:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D721BFE1A;
	Tue,  1 Oct 2024 11:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0Pzf5Dq"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC42119DF53
	for <linux-kernel@vger.kernel.org>; Tue,  1 Oct 2024 11:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727783884; cv=none; b=ku2yXiMvwsfB6pywdwbfden+JzMr/LLazu6/FzK/dUgPEfrNc1soGVDfmp7mmcmjfkJT07rnp73C8PWd22p3b46RTw5xAv821rGLzZqEGAoSY+6GeQGaj2ia6aYfdHD40MRZZ/WSZfT17HzCKtVqtzTSI1AkbDndy5mNaHHlY9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727783884; c=relaxed/simple;
	bh=X4BU9FGB+bkU7zubIo4o3H52+ywxvOHBI6JVwLEHYeY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u3E2rdWt1+Y9o4OU977yWDUxvVDlo6ahGKU+qyJGnucWlGRMlLHHJZM9LWkJq+xnzTxka2lEv5JGDmnz+eY6DM/gs7zcEMs9VNwMGpojtk7T7Srv4rYVDDK9phe8OBFPhnUDEz41N+oj3uvft301AS0BzLT5iWehjZ7SFK/VZOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0Pzf5Dq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DC5C4CEC6;
	Tue,  1 Oct 2024 11:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727783884;
	bh=X4BU9FGB+bkU7zubIo4o3H52+ywxvOHBI6JVwLEHYeY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D0Pzf5DqpJL+pto9I0cKaAWsD9fdwRz0vGO0fLdW/LGsbr6zOEd6GBCCAKMLlVPF6
	 xqaz9wnGEb0Gs4cpw8PphvMHr4nus6hsyxFwapBMTFEdkbyDL6D5Z2GDnWzYDTAQcp
	 JYMndHvZeNjUkkuGxqok7BtbXtiYuFeLppSOAG+p4911xSkha7nVjuUwvsodZiv7tt
	 N/1nW8nKD9CGO6lZQxXDEdgpD8Hwgzst/Ms3zCLZ9867gfqYyAjYl/vK0V+/d/GBIe
	 gN3Ckobt+gkX0cx6YfzJb37hXJRHEXS5Rm5O0EzjrgYPQ+XiwqrPzDZuwuG8Pxrqe+
	 54T56RdKlQaiA==
Date: Tue, 1 Oct 2024 13:57:59 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v10 07/21] acpi/ghes: rework the logic to handle HEST
 source ID
Message-ID: <20241001135759.474452d8@foz.lan>
In-Reply-To: <20240917135934.38579213@imammedo.users.ipa.redhat.com>
References: <cover.1726293808.git.mchehab+huawei@kernel.org>
	<0dd7081717b23b4c1536bc86abfa926388cf2139.1726293808.git.mchehab+huawei@kernel.org>
	<20240917135934.38579213@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: IQZAZvkNTH1d

Em Tue, 17 Sep 2024 13:59:34 +0200
Igor Mammedov <imammedo@redhat.com> escreveu:

> On Sat, 14 Sep 2024 08:13:28 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > The current logic is based on a lot of duct tape, with
> > offsets calculated based on one define with the number of
> > source IDs and an enum.
> > 
> > Rewrite the logic in a way that it would be more resilient
> > of code changes, by moving the source ID count to an enum
> > and make the offset calculus more explicit.
> > 
> > Such change was inspired on a patch from Jonathan Cameron
> > splitting the logic to get the CPER address on a separate
> > function, as this will be needed to support generic error
> > injection.  
> 
> so this patch switches to using HEST to lookup error status block
> by source id, though nothing in commit message mentions that.
> Perhaps it's time to rewrite commit message to be more
> specific/clear on what it's doing.  
> 
> now, I'd split this on several patches that should also take care of
> wiring needed to preserve old lookup to keep migration with 9.1 machines
> working:
> 
>  1. extract error status block read_ack addresses calculation/lookup
>     into a separate function (just current code, without HEST lookup).

Done. This is at the cleanup series.

>  2. since old lookup code handles only 1 source and won't ever see multiple
>     error sources, simplify that as much as possible to keep old way simple
>     (and mention that in commit message).
>     it basically should take 1st error status block/read ack addresses from
>     hardware_errors

Done there too.

> 
>  3. add to AcpiGedState a callback to with signature of #1 lookup func.
>     (which will be used to switch between old/new code), by default set to
>     old lookup func
> 
>  4. add to GED a bool property x-has-hardware_errors_addr = 1
>     and use it in acpi_ged_realize() to set callback
> 
>           if x-has-hardware_errors_addr == 1
>                callback = old_lookup

Instead of a callback, I opted to define a boolean:

	DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.hest_lookup, true),

That avoided the need of exporting the math logic and deal with
callbacks. It also avoided the need of touching acpi_ged_realize().

> 
>  5. add new HEST lookup func (not used yet with mentioning that follow up patch
>     will use it)
> 
>  6. cleanup fwcfg based on x-has-hardware_errors_addr,
>        i.e. for 'true':
>           ask for write pointer to hardware_errors like it's done in current code
>           and don't register hest_addr write pointer
>        while for 'false'
>           do opposite of above.

This doesn't work. without the fw_cfg logic for both, QEMU/BIOS won't boot 
and/or the hardware_errors won't work, causing ghes to do nothing.

>  7. flip x-has-hardware_errors_addr default to 0 and add to hw/core/machine.c
>       hw_compat_9_1[] = {
>           {ged type,  'x-has-hardware_errors_addr', 'true'},
>       }
>     this will make 9.1 and older machine types to use old lookup callback
>     while newer machines will use default new lookup

I opted to add the changes on machine.c at the same patch.

See the RFC series I posted.

> that should take care of switching between new and old ABI,
> i.e. which code qemu and guest will use/see.

With the new series, both virt-9.1 and virt-9.2 are doing the
right thing using either the legacy or the new math. I double
checked with a small debug patch, and changing the virt-9.1
code to use GPIO, as it is a way easier to inject errors than
via SEA (SEA requires the host OS to generate a bus error on
a hw address used by the VM).

> 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > 
> > ---
> > 
> > Changes from v9:
> > - patch split on multiple patches to avoid multiple changes
> >   at the same patch.
> > 
> > Changes from v8:
> > - Non-rename/cleanup changes merged altogether;
> > - source ID is now more generic, defined per guest target.
> >   That should make easier to add support for 86.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  hw/acpi/ghes.c         | 95 ++++++++++++++++++++++++++++++------------
> >  include/hw/acpi/ghes.h |  6 ++-
> >  2 files changed, 73 insertions(+), 28 deletions(-)
> > 
> > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > index 36fe5f68782f..6e5f0e8cf0c9 100644
> > --- a/hw/acpi/ghes.c
> > +++ b/hw/acpi/ghes.c
> > @@ -61,6 +61,23 @@
> >   */
> >  #define ACPI_GHES_GESB_SIZE                 20
> >  
> > +/*
> > + * Offsets with regards to the start of the HEST table stored at
> > + * ags->hest_addr_le, according with the memory layout map at
> > + * docs/specs/acpi_hest_ghes.rst.
> > + */
> > +
> > +/* ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2
> > + * Table 18-382 Generic Hardware Error Source version 2 (GHESv2) Structure
> > + */
> > +#define HEST_GHES_V2_TABLE_SIZE  92
> > +#define GHES_ACK_OFFSET          (64 + GAS_ADDR_OFFSET)
> > +
> > +/* ACPI 6.2: 18.3.2.7: Generic Hardware Error Source
> > + * Table 18-380: 'Error Status Address' field
> > + */
> > +#define GHES_ERR_ST_ADDR_OFFSET  (20 + GAS_ADDR_OFFSET)
> > +
> >  /*
> >   * Values for error_severity field
> >   */
> > @@ -401,11 +418,13 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> >  
> >  int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
> >  {
> > -    uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
> > -    uint64_t start_addr;
> > -    bool ret = -1;
> > +    uint64_t hest_read_ack_start_addr, read_ack_start_addr;
> > +    uint64_t hest_addr, cper_addr, err_source_struct;
> > +    uint64_t hest_err_block_addr, error_block_addr;
> > +    uint32_t i, ret;
> >      AcpiGedState *acpi_ged_state;
> >      AcpiGhesState *ags;
> > +    uint64_t read_ack;
> >  
> >      assert(source_id < ACPI_GHES_ERROR_SOURCE_COUNT);
> >  
> > @@ -414,44 +433,66 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
> >      g_assert(acpi_ged_state);
> >      ags = &acpi_ged_state->ghes_state;
> >  
> > -    start_addr = le64_to_cpu(ags->ghes_addr_le);
> > +    hest_addr = le64_to_cpu(ags->hest_addr_le);
> >  
> >      if (!physical_address) {
> >          return -1;
> >      }
> >  
> > -    start_addr += source_id * sizeof(uint64_t);
> > +    err_source_struct = hest_addr + ACPI_GHES_ERROR_SOURCE_COUNT;
> >  
> > -    cpu_physical_memory_read(start_addr, &error_block_addr,
> > -                                sizeof(error_block_addr));
> > +    /*
> > +     * Currently, HEST Error source navigates only for GHESv2 tables
> > +     */
> > +    for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
> > +        uint64_t addr = err_source_struct;
> > +        uint16_t type, src_id;
> >  
> > -    error_block_addr = le64_to_cpu(error_block_addr);
> > +        cpu_physical_memory_read(addr, &type, sizeof(type));
> >  
> > -    read_ack_register_addr = start_addr +
> > -        ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
> > +        /* For now, we only know the size of GHESv2 table */
> > +        assert(type == ACPI_GHES_SOURCE_GENERIC_ERROR_V2);
> >  
> > -    cpu_physical_memory_read(read_ack_register_addr,
> > -                                &read_ack_register, sizeof(read_ack_register));
> > +        /* It is GHES. Compare CPER source address */
> > +        addr += sizeof(type);
> > +        cpu_physical_memory_read(addr, &src_id, sizeof(src_id));
> >  
> > -    /* zero means OSPM does not acknowledge the error */
> > -    if (!read_ack_register) {
> > -        error_report("OSPM does not acknowledge previous error,"
> > -            " so can not record CPER for current error anymore");
> > -    } else if (error_block_addr) {
> > -        read_ack_register = cpu_to_le64(0);
> > -        /*
> > -         * Clear the Read Ack Register, OSPM will write it to 1 when
> > -         * it acknowledges this error.
> > -         */
> > -        cpu_physical_memory_write(read_ack_register_addr,
> > -            &read_ack_register, sizeof(uint64_t));
> > +        if (src_id == source_id) {
> > +            break;
> > +        }
> >  
> > -        ret = acpi_ghes_record_mem_error(error_block_addr,
> > -                                            physical_address);
> > -    } else {
> > +        err_source_struct += HEST_GHES_V2_TABLE_SIZE;
> > +    }
> > +    if (i == ACPI_GHES_ERROR_SOURCE_COUNT) {
> >          error_report("can not find Generic Error Status Block");
> > +
> > +        return -1;
> >      }
> >  
> > +    /* Navigate though table address pointers */
> > +
> > +    hest_err_block_addr = err_source_struct + GHES_ERR_ST_ADDR_OFFSET;
> > +    hest_read_ack_start_addr = err_source_struct + GHES_ACK_OFFSET;
> > +
> > +    cpu_physical_memory_read(hest_err_block_addr, &error_block_addr,
> > +                             sizeof(error_block_addr));
> > +
> > +    cpu_physical_memory_read(error_block_addr, &cper_addr,
> > +                             sizeof(error_block_addr));
> > +
> > +    cpu_physical_memory_read(hest_read_ack_start_addr, &read_ack_start_addr,
> > +                             sizeof(read_ack_start_addr));
> > +
> > +    /* Update ACK offset to notify about a new error */
> > +
> > +    cpu_physical_memory_read(read_ack_start_addr,
> > +                             &read_ack, sizeof(read_ack));
> > +
> > +    read_ack = cpu_to_le64(0);
> > +    cpu_physical_memory_write(read_ack_start_addr,
> > +                              &read_ack, sizeof(read_ack));
> > +
> > +    ret = acpi_ghes_record_mem_error(error_block_addr, physical_address);
> >      return ret;
> >  }
> >  
> > diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> > index c9bbda4740e2..7485f54c28f2 100644
> > --- a/include/hw/acpi/ghes.h
> > +++ b/include/hw/acpi/ghes.h
> > @@ -23,6 +23,7 @@
> >  #define ACPI_GHES_H
> >  
> >  #include "hw/acpi/bios-linker-loader.h"
> > +#include "qapi/error.h"
> >  
> >  /*
> >   * Values for Hardware Error Notification Type field
> > @@ -74,7 +75,10 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
> >                       const char *oem_id, const char *oem_table_id);
> >  void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
> >                            GArray *hardware_errors);
> > -int acpi_ghes_record_errors(uint8_t source_id, uint64_t error_physical_addr);
> > +int acpi_ghes_record_errors(uint8_t source_id,
> > +                            uint64_t error_physical_addr);
> > +void ghes_record_cper_errors(const void *cper, size_t len,
> > +                             uint16_t source_id, Error **errp);
> >  
> >  /**
> >   * acpi_ghes_present: Report whether ACPI GHES table is present  
> 



Thanks,
Mauro
