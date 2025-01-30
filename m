Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp298383njl;
        Thu, 30 Jan 2025 05:44:54 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWQLtmzWcubk+v7T3aFPmhE+uwfhBARUUH68b5Gu+6LgXBHlCIRfuqkszSHVKPHP0HfJ0biTarY+q79pQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH3dM+xhPSsEuPbpI4euUyocFymQQPMErWd6nkIXzGb8Zd0d8Wq6/F24dXK9k/rUpmc3Wgm
X-Received: by 2002:a05:6214:c67:b0:6d8:f0ba:ea92 with SMTP id 6a1803df08f44-6e243bf3e9fmr133511476d6.21.1738244694569;
        Thu, 30 Jan 2025 05:44:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738244694; cv=pass;
        d=google.com; s=arc-20240605;
        b=AqsPUyM1SzTg09gr8+5V/tTQy8NkQPdGeN1aFuZdemLzZGydSWBbaL14Ex2rmAcC0q
         Sf55biFXYu32loZOpmCBtB1a4LnGZcBW6u0OAnmV+sWSoPVllpiBWLfEpfebuZZ6guzJ
         YEDrwnlroRvDCpRDah+PK1hL3ClPxXO4QRAahTxKIxsA6DWHto5uxf/j6vizNlOBet/m
         qCfliV6rdxrmIGIzQefahcXCDOcyqQuU4CCs0YBjVD8oL1uA6bfnRYsLsf5Uxe6Tp2xs
         oCRNQAbXNj8UKuXVl+J+XPRl+H9+dCWVXNDhNZtWKr4lewGPFfL334EwRwgdWZrFu5id
         P+Lw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=V7XFVH+vg7PjBW4WUX+lBpyAlvDXNu9+lL1Dn96pt0E=;
        fh=dQyKcNiA+TqmPWrar1Faz+p3QNGh3bRVEplxiFI5gEU=;
        b=ebVyLKrqZRpHeLhvXCexAgmFd7J4pefCI5Gg+UZxTWjXQZkz2XNU9sTD/R5cOyBvvW
         8VERACxtBQF0cPajQ2sdfNOtal4OSAeJHonBJ28Vr5PtJi8M0T38kH3y9I5xUKRsInWb
         URi2xfrYbMJJTboYOoJhyF0h7ugYPuSvoLjHgDVEMZFTXBgXDGlfnyTsbu/+eUBnOT2Z
         I74VfZ63mbhz4NQvtNV1qCtLvU6QrlTMB7+kW7WaH8d4oopvQUP0QybRezfMHJajcHVR
         7UD7AiHWRdBKrZuafRrJijHmM80GznaLMME3+DR+PNIdnNHvcv9KZlg62fF8zF3HFR/e
         yGtQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=NPgwlwTM;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-36923-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-36923-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <kvm+bounces-36923-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e2549e2529si14176386d6.475.2025.01.30.05.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 05:44:54 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-36923-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=NPgwlwTM;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-36923-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-36923-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79A19167FF3
	for <alex.bennee@linaro.org>; Thu, 30 Jan 2025 13:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14E21E572A;
	Thu, 30 Jan 2025 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPgwlwTM"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7D51E5020;
	Thu, 30 Jan 2025 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738244688; cv=none; b=ZZXj+1bZ3ZSFTNWFqGOdW124Okj4+KoeZaGZVgcpLfsbXHe8PoA4GapB+6JtptzP5yGJji8TknzwKSszNHaCyZNx1iQZeTy6W2I1I/fu69TE/8GjFZgHkp5gvBTXyk0qxA64cN/tcBrNIvloWqog5w1ZZ42Ekwdri+r/ILR1F7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738244688; c=relaxed/simple;
	bh=pTupQhK3UFmZqalrxJHEzv9Y3Dcs3lrmuxts1lkpQH8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=heMzsff82UOSzkBpdwKNZldEU8oBSGv/jgDoG6yhM99Bxp8v1OfUOOiWcoCgW5bRjh5ueH5vPRPCm/+YYt9E3W0urW+TERiW0kkhCH3CbpB96A1GCkSzpcw+iEqdsMTCApJdQFM+RLxdRTAcnl6sSR4EvbfWaT3O/6ShgtNMXHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPgwlwTM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBBAC4CEE6;
	Thu, 30 Jan 2025 13:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738244688;
	bh=pTupQhK3UFmZqalrxJHEzv9Y3Dcs3lrmuxts1lkpQH8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NPgwlwTMLlMVaG86tUE6kXlJKPHuz+ycfrc9wu6rYHQmumxdTGgNMcnFdeMEPDpXQ
	 UgviBoClF/nPaNrecDnU35J4u+1yTf6FcJ6vj1mRuRyIUO03K8JcoPxsK0a18aJwEn
	 ETvUT3hmURbljx5vhDYCQaL3BF2gzrKZgFfiMPDYCIZX2yypdKZpxH0lCC1kJzmcsG
	 mxneE4mnNMAyMLcZD3IYpOEr83HLFVL9x9gNVh/XDuUqFNvicFFfscKoc+GLJYIYvR
	 M9AolL93xMIkrwdol9WDpP5amvMUdjaBQPiW78UYfcc1paYnqOswZ+5P9blXsi/VHN
	 5C6LT4hUDVbdA==
Date: Thu, 30 Jan 2025 14:44:39 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/13] acpi/ghes: Cleanup the code which gets ghes
 ged state
Message-ID: <20250130144439.161165d4@foz.lan>
In-Reply-To: <20250129155530.29455d45@imammedo.users.ipa.redhat.com>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
	<f40cacd977b9eae69a5b0091d3e7a2746b2892be.1738137123.git.mchehab+huawei@kernel.org>
	<20250129155530.29455d45@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: L4IE+BNut0fi

Em Wed, 29 Jan 2025 15:55:30 +0100
Igor Mammedov <imammedo@redhat.com> escreveu:

> On Wed, 29 Jan 2025 09:04:14 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Move the check logic into a common function and simplify the
> > code which checks if GHES is enabled and was properly setup.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>  
> 
> with nits fixed:
> Reviewed-by:  Igor Mammedov <imammedo@redhat.com>
> 
> > ---
> >  hw/acpi/ghes-stub.c    |  7 ++++---
> >  hw/acpi/ghes.c         | 43 ++++++++++++------------------------------
> >  include/hw/acpi/ghes.h | 15 ++++++++-------
> >  target/arm/kvm.c       |  8 ++++++--
> >  4 files changed, 30 insertions(+), 43 deletions(-)
> > 
> > diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
> > index 7cec1812dad9..40f660c246fe 100644
> > --- a/hw/acpi/ghes-stub.c
> > +++ b/hw/acpi/ghes-stub.c
> > @@ -11,12 +11,13 @@
> >  #include "qemu/osdep.h"
> >  #include "hw/acpi/ghes.h"
> >  
> > -int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
> > +int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> > +                            uint64_t physical_address)
> >  {
> >      return -1;
> >  }
> >  
> > -bool acpi_ghes_present(void)
> > +AcpiGhesState *acpi_ghes_get_state(void)
> >  {
> > -    return false;
> > +    return NULL;
> >  }
> > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > index 38ff95273706..849abfa12187 100644
> > --- a/hw/acpi/ghes.c
> > +++ b/hw/acpi/ghes.c
> > @@ -407,18 +407,12 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> >          fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
> >              NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
> >      }
> > -
> > -    ags->present = true;
> >  }
> >  
> >  static void get_hw_error_offsets(uint64_t ghes_addr,
> >                                   uint64_t *cper_addr,
> >                                   uint64_t *read_ack_register_addr)
> >  {
> > -    if (!ghes_addr) {
> > -        return;
> > -    }
> > -
> >      /*
> >       * non-HEST version supports only one source, so no need to change
> >       * the start offset based on the source ID. Also, we can't validate
> > @@ -447,9 +441,6 @@ static void get_ghes_source_offsets(uint16_t source_id,
> >      uint64_t err_source_entry, error_block_addr;
> >      uint32_t num_sources, i;
> >  
> > -    if (!hest_entry_addr) {
> > -        return;
> > -    }
> >  
> >      cpu_physical_memory_read(hest_entry_addr, &num_sources,
> >                               sizeof(num_sources));
> > @@ -515,27 +506,17 @@ static void get_ghes_source_offsets(uint16_t source_id,
> >  NotifierList acpi_generic_error_notifiers =
> >      NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
> >  
> > -void ghes_record_cper_errors(const void *cper, size_t len,
> > +void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
> >                               uint16_t source_id, Error **errp)
> >  {
> >      uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
> > -    AcpiGedState *acpi_ged_state;
> > -    AcpiGhesState *ags;
> >  
> >      if (len > ACPI_GHES_MAX_RAW_DATA_LENGTH) {
> >          error_setg(errp, "GHES CPER record is too big: %zd", len);
> >          return;
> >      }
> >  
> > -    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> > -                                                       NULL));
> > -    if (!acpi_ged_state) {
> > -        error_setg(errp, "Can't find ACPI_GED object");
> > -        return;
> > -    }
> > -    ags = &acpi_ged_state->ghes_state;
> > -
> > -    if (!ags->hest_addr_le) {
> > +    if (!ags->use_hest_addr) {
> >          get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
> >                               &cper_addr, &read_ack_register_addr);
> >      } else {
> > @@ -543,11 +524,6 @@ void ghes_record_cper_errors(const void *cper, size_t len,
> >                                  &cper_addr, &read_ack_register_addr, errp);
> >      }
> >  
> > -    if (!cper_addr) {
> > -        error_setg(errp, "can not find Generic Error Status Block");
> > -        return;
> > -    }
> > -
> >      cpu_physical_memory_read(read_ack_register_addr,
> >                               &read_ack_register, sizeof(read_ack_register));
> >  
> > @@ -573,7 +549,8 @@ void ghes_record_cper_errors(const void *cper, size_t len,
> >      notifier_list_notify(&acpi_generic_error_notifiers, NULL);
> >  }
> >  
> > -int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
> > +int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> > +                            uint64_t physical_address)
> >  {
> >      /* Memory Error Section Type */
> >      const uint8_t guid[] =
> > @@ -599,7 +576,7 @@ int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
> >      acpi_ghes_build_append_mem_cper(block, physical_address);
> >  
> >      /* Report the error */
> > -    ghes_record_cper_errors(block->data, block->len, source_id, &errp);
> > +    ghes_record_cper_errors(ags, block->data, block->len, source_id, &errp);
> >  
> >      g_array_free(block, true);
> >  
> > @@ -611,7 +588,7 @@ int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
> >      return 0;
> >  }
> >  
> > -bool acpi_ghes_present(void)
> > +AcpiGhesState *acpi_ghes_get_state(void)
> >  {
> >      AcpiGedState *acpi_ged_state;
> >      AcpiGhesState *ags;
> > @@ -620,8 +597,12 @@ bool acpi_ghes_present(void)
> >                                                         NULL));
> >  
> >      if (!acpi_ged_state) {
> > -        return false;
> > +        return NULL;
> >      }
> >      ags = &acpi_ged_state->ghes_state;
> > -    return ags->present;
> > +
> > +    if (!ags->hw_error_le && !ags->hest_addr_le) {  
> 
> should we add a warning here?
> (consider case where firmware hasn't managed to update pointers for some reason)

I don't think so, as this will also return NULL if ras=off. See, the
original goal of acpi_ghes_present(void) were to avoid needing to check
if ras is enabled outside GHES code, like here at target/arm/kvm.c:

	void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
	{
	    ram_addr_t ram_addr;
	    hwaddr paddr;
	    AcpiGhesState *ags;
	
	    assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
	
	    ags = acpi_ghes_get_state();
	    if (ags && addr) {
...

This new logic repurposed acpi_ghes_present() as acpi_ghes_get_state(),
using it to full two situations:

1) ras=on;
2) either hw_err_addr_le or hest_addr_le exists.
	  
Except if some serious issue takes place, (2) is actually equivalent
to check if ras is on or off.

Besides that, Error **errp is not defined yet, so we can't do this:

	error_setg(errp, "HEST/GHES pointer is not available")

> > +        return NULL;
> > +    }
> > +    return ags;
> >  }
> > diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> > index 80a0c3fcfaca..e1b66141d01c 100644
> > --- a/include/hw/acpi/ghes.h
> > +++ b/include/hw/acpi/ghes.h
> > @@ -63,7 +63,6 @@ enum AcpiGhesNotifyType {
> >  typedef struct AcpiGhesState {
> >      uint64_t hest_addr_le;
> >      uint64_t hw_error_le;
> > -    bool present; /* True if GHES is present at all on this board */
> >      bool use_hest_addr; /* True if HEST address is present */
> >  } AcpiGhesState;
> >  
> > @@ -87,15 +86,17 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
> >                       const char *oem_id, const char *oem_table_id);
> >  void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
> >                            GArray *hardware_errors);
> > -int acpi_ghes_memory_errors(uint16_t source_id, uint64_t error_physical_addr);
> > -void ghes_record_cper_errors(const void *cper, size_t len,
> > +int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> > +                            uint64_t error_physical_addr);
> > +void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
> >                               uint16_t source_id, Error **errp);
> >  
> >  /**
> > - * acpi_ghes_present: Report whether ACPI GHES table is present
> > + * acpi_ghes_get_state: Get a pointer for ACPI ghes state
> >   *
> > - * Returns: true if the system has an ACPI GHES table and it is
> > - * safe to call acpi_ghes_memory_errors() to record a memory error.
> > + * Returns: a pointer to ghes state if the system has an ACPI GHES table,
> > + * it is enabled and it is safe to call acpi_ghes_memory_errors() to record
> > + * a memory error. Returns false, otherwise.
> >   */
> > -bool acpi_ghes_present(void);
> > +AcpiGhesState *acpi_ghes_get_state(void);
> >  #endif
> > diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> > index da30bdbb2349..544ff174784d 100644
> > --- a/target/arm/kvm.c
> > +++ b/target/arm/kvm.c
> > @@ -2366,10 +2366,13 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
> >  {
> >      ram_addr_t ram_addr;
> >      hwaddr paddr;
> > +    AcpiGhesState *ags;
> >  
> >      assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
> >  
> > -    if (acpi_ghes_present() && addr) {
> > +    ags = acpi_ghes_get_state();  
> 
> > +  
> I'd drop this newline
> 
> > +    if (ags && addr) {
> >          ram_addr = qemu_ram_addr_from_host(addr);
> >          if (ram_addr != RAM_ADDR_INVALID &&
> >              kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
> > @@ -2387,7 +2390,8 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
> >               */
> >              if (code == BUS_MCEERR_AR) {
> >                  kvm_cpu_synchronize_state(c);
> > -                if (!acpi_ghes_memory_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
> > +                if (!acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SEA,
> > +                                             paddr)) {
> >                      kvm_inject_arm_sea(c);
> >                  } else {
> >                      error_report("failed to record the error");  
> 



Thanks,
Mauro
