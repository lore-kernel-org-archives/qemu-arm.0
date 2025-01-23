Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp335120njk;
        Thu, 23 Jan 2025 10:24:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXy2od21HNGImbB9WACqUJ/S3yJs3mKf8kiKJMN9ZUFIrpgJEvKTGhl+Oush8H0ig/Za32gfKAEapn95A==@linaro.org
X-Google-Smtp-Source: AGHT+IGmLM6tTki8dfGnvKi3/b9VHDSr1Gcs5vJWwTOOZNNoQnZTr+2i+QW2i6uLVINZycYgk6pl
X-Received: by 2002:a05:6214:628:b0:6d8:8f14:2f5f with SMTP id 6a1803df08f44-6e1b216cc10mr406880156d6.23.1737656664372;
        Thu, 23 Jan 2025 10:24:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737656664; cv=none;
        d=google.com; s=arc-20240605;
        b=N3n9ZROWa9wMt/VDBMO8fYsYDuKeWL3HzCm1AoafhOZQqkVaGqTHZ7dGVrzVfiK+LJ
         zpdo8TBIeFyF2L3jGNFClKBJK/LN0cpHhswc29egFJo/mZnffrC1BnTayCsT+dRIu/w4
         WAolINdjlctdH3jpmEDqNHvq1Drv0KKJYzS4uQjyP284hqI0Osk94nIEojrqYU4V4hSW
         DC1Mm5WJYXn6oUP4GUx8r2kDeFsB7uCNdgXH2sk/uv9x/6yBn2jN//fPgshP7anpDekp
         w1CArrbX3QZU2ZCqm+1FUZtpgOmDe79TugttkeX2FgST2DxvAgvuLImlChiq2GOBGHxG
         7b/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=avqjlVoPMhQ7TM2PPt0RoYvikRAqoZfHfYKhtDf//h8=;
        fh=ga30WJz+AM+zGlkQ58aeLKsNtsPzufzpPtZNXhGYMmI=;
        b=dQ/DIkbKEVyWU3ey3h4XjDnX1J5LOnAd69b9gTXoF3WA6EzTvnE4iYFymzpF6C/qXO
         PuU0z+GkpnDo4I79A7EJmuLnC4kBvAdA/PYmC4jVd/XKF9MxjOK8kniud/Ag4ICFNIyN
         RLf1nc2Vd5vZHgP5ocgFet5ao27xjto1X25YBei6xZPzhmEy9I32MTasR/YC2JrvRJy7
         QZQiHuLYbDYFeOmvUp2BDVKiAukUBBU/xq1Xj2Nt2/qhWHde/HOoL/08qVV61K3+ndN5
         kzTwo91m5dGQkuqBNSg9CVRr2Z3VhpbCV5Ut6ZPbIdsP40OV/04b4Lq9BjvmGFWe4n+E
         Vi4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=PbyuA0Nb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e206022abdsi2039626d6.406.2025.01.23.10.24.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2025 10:24:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=PbyuA0Nb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tb1sG-000582-Jl; Thu, 23 Jan 2025 13:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tb1sE-00057n-44; Thu, 23 Jan 2025 13:24:14 -0500
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tb1s7-0001WX-Cd; Thu, 23 Jan 2025 13:24:13 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 17C6EA40B95;
 Thu, 23 Jan 2025 18:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A8BC4CED3;
 Thu, 23 Jan 2025 18:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737656635;
 bh=G0fFOYrAXU+7LAYxx6cHt4LSpRzFcEGMYHsy36coQP8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PbyuA0NbE1bKXtVfh73hC9bqMV/wtQDSVIFNjPUirwUcBM4SceUx5mDBMQUnFW72H
 oFSgjg/PoiinUdypYpjxwxfERB3tcsdrqje9ipT/dHngv2sw9HjGrpo66w9LkYohxO
 G1PqlsLZJsLJ6l7GqA7UtY8iBw7lKRG16wRj6GxdZydsjPZrB3WoriQuegH5Rzv19s
 KOPHKztx/2WnCPIOFprYRU/UjjKMWzChQspEMt2COy9O/Fp/QOoekWmiiWDEiIFWa1
 5DWosyOsTsKQu53inHNIG2K7GsoPor0pHSv+OUfS7ghW9G9X1c/IbeuKnyHu+dp8YW
 yr9KCc2OMJgYQ==
Date: Thu, 23 Jan 2025 19:23:50 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/11] acpi/ghes: Use HEST table offsets when preparing
 GHES records
Message-ID: <20250123192350.6db42016@foz.lan>
In-Reply-To: <20250123102919.000044c9@huawei.com>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
 <10a8a913862c9cc894235d32b10bbf2f992340ff.1737560101.git.mchehab+huawei@kernel.org>
 <20250123102919.000044c9@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Hb/SceKo6F5d

Em Thu, 23 Jan 2025 10:29:19 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> escreveu:

> On Wed, 22 Jan 2025 16:46:20 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > There are two pointers that are needed during error injection:
> > 
> > 1. The start address of the CPER block to be stored;
> > 2. The address of the ack, which needs a reset before next error.
> > 
> > It is preferable to calculate them from the HEST table.  This allows
> > checking the source ID, the size of the table and the type of the
> > HEST error block structures.
> > 
> > Yet, keep the old code, as this is needed for migration purposes.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> Generally looks good.  A few bits that I think could be made
> easier to follow for anyone with the spec open in front of them.
> 
> Thanks,
> 
> Jonathan
> 
> > ---
> >  hw/acpi/ghes.c | 98 ++++++++++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 88 insertions(+), 10 deletions(-)
> > 
> > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > index 34e3364d3fd8..b46b563bcaf8 100644
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
> 
> Local multiline comment style seems to be always
> /*
>  * ACPI 6.2:...
> 
> So perhaps good to copy that.
> 
> > + * Table 18-382 Generic Hardware Error Source version 2 (GHESv2) Structure
> > + */
> > +#define HEST_GHES_V2_TABLE_SIZE  92
> > +#define GHES_ACK_OFFSET          (64 + 
)  
> 
> Using a GAS offset here to me obscures what is going on.  I'd
> explicitly handle the GAS where you are reading this.
> We probably should sanity check the type as there are
> some crazy options that might turn up one day.

See below.

> Maybe worth using spec term of
> GHES_READ_ACK_...
> 
> Obviously it's a question of who you are for whether it is read or
> write, but maybe still worth using that term for easy checking
> against the specification.
> 
> > +
> > +/* ACPI 6.2: 18.3.2.7: Generic Hardware Error Source  
> same on comment format.
> 
> > + * Table 18-380: 'Error Status Address' field
> > + */
> > +#define GHES_ERR_ST_ADDR_OFFSET  (20 + GAS_ADDR_OFFSET)  
> Maybe STS or spell out status? I found ST a bit confusing below.

Giving names is not an easy task... Removing _ST doesn't sound
right, as everything is GHES_ERR. STS sounds weird to me as well.
Maybe we could name them both as something like:

	GHES_ERR_STATUS_ADDR_OFF
	GHES_READ_ACK_ADDR_OFF
 
> > +
> >  /*
> >   * Values for error_severity field
> >   */
> > @@ -212,14 +229,6 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
> >  {
> >      int i, error_status_block_offset;
> >  
> > -    /*
> > -     * TODO: Current version supports only one source.
> > -     * A further patch will drop this check, after adding a proper migration
> > -     * code, as, for the code to work, we need to store a bios pointer to the
> > -     * HEST table.
> > -     */
> > -    assert(num_sources == 1);
> > -
> >      /* Build error_block_address */
> >      for (i = 0; i < num_sources; i++) {
> >          build_append_int_noprefix(hardware_errors, 0, sizeof(uint64_t));
> > @@ -419,6 +428,70 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
> >      *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
> >  }
> >  
> > +static void get_ghes_source_offsets(uint16_t source_id, uint64_t hest_addr,
> > +                                    uint64_t *cper_addr,
> > +                                    uint64_t *read_ack_start_addr,
> > +                                    Error **errp)
> > +{
> > +    uint64_t hest_err_block_addr, hest_read_ack_addr;
> > +    uint64_t err_source_struct, error_block_addr;
> > +    uint32_t num_sources, i;
> > +
> > +    if (!hest_addr) {  
> I guess it is a question of matching local code, but I'd be tempted
> to name this hest_body_addr as it isn't the start of the table but
> rather the bit after the header.

This is named after hest_addr_le, which in turn was named after ghes_hw_le.

Besides, I guess such name was suggested on a past review. From my side, 
I'm OK with any name you/Igor pick.

> 
> > +        return;
> > +    }
> > +
> > +    cpu_physical_memory_read(hest_addr, &num_sources, sizeof(num_sources));  
> 
> The hest_addr naming thing confused me a tiny bit here because obviously num_sources
> isn't the first thing in the table in the spec!
> 
> > +    num_sources = le32_to_cpu(num_sources);
> > +
> > +    err_source_struct = hest_addr + sizeof(num_sources);
> > +
> > +    /*
> > +     * Currently, HEST Error source navigates only for GHESv2 tables
> > +     */
> > +
> > +    for (i = 0; i < num_sources; i++) {
> > +        uint64_t addr = err_source_struct;
> > +        uint16_t type, src_id;
> > +
> > +        cpu_physical_memory_read(addr, &type, sizeof(type));
> > +        type = le16_to_cpu(type);
> > +
> > +        /* For now, we only know the size of GHESv2 table */
> > +        if (type != ACPI_GHES_SOURCE_GENERIC_ERROR_V2) {
> > +            error_setg(errp, "HEST: type %d not supported.", type);
> > +            return;  
> 
> It's a pity we can't just skip them, but absence of a size field
> makes that tricky...  Can add that later I guess along with sizes
> for each defined type including figuring out the variable length
> ones like IA-32 machine check.  I guess this is why the whole ordering
> constraint for new types was added. Can't find the old ones if
> we don't know the size of the new ones, hence need new definitions
> at the end.

Yes. The variable sizes makes it harder to parse with current GHES
types. It sounds they'll fix it for the next types, as the size of
the record will be stored for types above 11.

So, at the end, we'll need to add a much more complex logic if/when
we add non-GHES records.

> 
> Anyhow, I'm fine with this but maybe a little more description in the comment
> would avoid someone going down same rat hole I just did.
> 
> 
> > +        }
> > +
> > +        /* Compare CPER source address at the GHESv2 structure */
> > +        addr += sizeof(type);
> > +        cpu_physical_memory_read(addr, &src_id, sizeof(src_id));
> > +
> > +        if (src_id == source_id) {
> > +            break;
> > +        }
> > +
> > +        err_source_struct += HEST_GHES_V2_TABLE_SIZE;
> > +    }
> > +    if (i == num_sources) {
> > +        error_setg(errp, "HEST: Source %d not found.", source_id);
> > +        return;
> > +    }
> > +
> > +    /* Navigate though table address pointers */
> > +    hest_err_block_addr = err_source_struct + GHES_ERR_ST_ADDR_OFFSET;  
> 
> So this is a bit confusing. I'd pull the GAS offset down here rather
> than putting it in the define. That way we can clearly see you
> are grabbing the address field.  As above, should we check the type
> is 0x00?  There are many fun things it could be but here I think
> we just want it to be memory space.

In short:

The type was already ensured when HEST table is built. I can't see
any need to add extra checks. If you want this to be better documented,
we could just do:

	hest_err_block_addr = err_source_struct + GHES_ERR_STATUS_ADDR_OFF + GAS_OFFSET;  

It follows a longer rationale:

If I understood well, and after some discussions we had today via chat,
you basically want to add an additional check logic during error inject
to check if the memory type filled at build_ghes_v2() here:

	/* Build Generic Hardware Error Source version 2 (GHESv2) */
	static void build_ghes_v2(GArray *table_data,
	                          BIOSLinker *linker,
       		                  const AcpiNotificationSourceId *notif_src,
                	          uint16_t index, int num_sources)
	{
...
	    /* Error Status Address */
	    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0x40, 0,
...
	    /*
	     * Read Ack Register 
	     * ACPI 6.1: 18.3.2.8 Generic Hardware Error Source
	     * version 2 (GHESv2 - Type 10)
	     */
	   build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0x40, 0,
                     4 /* QWord access */, 0);
...
	}

was not modified and still remains AML_AS_SYSTEM_MEMORY, as otherwise the
code at get_ghes_source_offsets() won't be able to use 
cpu_physical_memory_read/cpu_physical_memory_write. To make it right,
IMO we would need to add something like this to aml-build.c:

	int verify_gas_addr_space(uint64_t addr, AmlAddressSpace as)
	{
		uint64_t gas_header;

		cpu_physical_memory_read(addr, &gas_header, 4);
		gas_header = cpu_to_le64(0);

		if ((gas_header & 0xff) != as)
			return 1;

		return 0;
	}

and at ghes.c do something like:

	// Using current names just to better illustrate the changes
	#define GHES_ACK_OFFSET          64 // don't add GAS_ADDR_OFFSET here
	#define GHES_ERR_ST_ADDR_OFFSET  20 // don't add GAS_ADDR_OFFSET here

	static void get_ghes_source_offsets(uint16_t source_id, uint64_t hest_addr,
	                                    uint64_t *cper_addr,
	       	                            uint64_t *read_ack_start_addr,
	                                    Error **errp)
	{
 
	    /* Navigate though table address pointers */
	    hest_err_block_addr = err_source_struct + GHES_ERR_ST_ADDR_OFFSET;

	    /* EXTRA CHECK LOGIC: Verify if build_ghes_v2() did his job */
	    if (verify_gas_addr_space(hest_err_block_addr, AML_AS_SYSTEM_MEMORY)} {
		error_setg(errp, "HEST firmware is not using system memory!!!");
		return;
	    }
	    hest_err_block_addr += GAS_ADDR_OFFSET;

	    hest_read_ack_addr = err_source_struct + GHES_ACK_OFFSET;

	    /* EXTRA CHECK LOGIC: Verify if build_ghes_v2() did his job */
	    if (verify_gas_addr_space(hest_read_ack_addr, AML_AS_SYSTEM_MEMORY)} {
		error_setg(errp, "HEST firmware is not using system memory!!!");
		return;
	    }
	    hest_read_ack_addr += GAS_ADDR_OFFSET;

	    cpu_physical_memory_read(hest_err_block_addr, &error_block_addr,
	                             sizeof(error_block_addr));

	    cpu_physical_memory_read(error_block_addr, cper_addr,
	                             sizeof(*cper_addr));

	    cpu_physical_memory_read(hest_read_ack_addr, read_ack_start_addr,
	                             sizeof(*read_ack_start_addr));
	}

IMO, this is overkill:
- I can't see how such check will ever be triggered in practice;
- I can't see any reason why the HEST firmware would ever be stored
  on a non-system memory: firmware should always be at 
  AML_AS_SYSTEM_MEMORY;
- As those offsets are related to fw_cfg, any change there would
  require changing the firmware binding logic. Plus, they'll very
  likely also require changes at BIOS code itself, as it would need
  to know how to store firmware files on some other memory type;
- Any change like that will certainly require adding backport support,
  as QEMU would need to check if BIOS would support different types
  of memory to store firmware instead of system memory. Also, QEMU 9.1
  is only compatible with firmware stored on system's memory. 

So, I don't see any benefit of doing that.

> > +    hest_read_ack_addr = err_source_struct + GHES_ACK_OFFSET;  
> 
> Perhaps move this down to above where it is used?
> Same thing about GAS address offset being better found down here
> rather than hidden in GHES_ACK_OFFSET.
> 
> > +
> > +    cpu_physical_memory_read(hest_err_block_addr, &error_block_addr,
> > +                             sizeof(error_block_addr));
> > +
> > +    cpu_physical_memory_read(error_block_addr, cper_addr,
> > +                             sizeof(*cper_addr));
> > +
> > +    cpu_physical_memory_read(hest_read_ack_addr, read_ack_start_addr,
> > +                             sizeof(*read_ack_start_addr));
> > +}
> > +
> >  void ghes_record_cper_errors(const void *cper, size_t len,
> >                               uint16_t source_id, Error **errp)
> >  {
> > @@ -439,8 +512,13 @@ void ghes_record_cper_errors(const void *cper, size_t len,
> >      }
> >      ags = &acpi_ged_state->ghes_state;
> >  
> > -    get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
> > -                         &cper_addr, &read_ack_register_addr);
> > +    if (!ags->hest_addr_le) {
> > +        get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
> > +                             &cper_addr, &read_ack_register_addr);
> > +    } else {
> > +        get_ghes_source_offsets(source_id, le64_to_cpu(ags->hest_addr_le),
> > +                                &cper_addr, &read_ack_register_addr, errp);
> > +    }
> >  
> >      if (!cper_addr) {
> >          error_setg(errp, "can not find Generic Error Status Block");  
> 



Thanks,
Mauro
