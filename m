Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp56117njk;
        Thu, 23 Jan 2025 02:29:31 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVSALusLCjm7PLAyK76O6GEmH4FaN0sVSZ7NtNdNAWLY5OpgSo2vka8ycL06NMIyDsZBSv7Zi2pOBSzzA==@linaro.org
X-Google-Smtp-Source: AGHT+IHm/fJ6VZ1kr43Q4gv+zT+QDax6DO89K8fmj4aeri6upGKfJttlvM/gvoDuPrnoLAzqW3zO
X-Received: by 2002:a05:6a21:3385:b0:1e1:f281:8cf5 with SMTP id adf61e73a8af0-1eb2114c60amr41564740637.0.1737628171225;
        Thu, 23 Jan 2025 02:29:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737628171; cv=pass;
        d=google.com; s=arc-20240605;
        b=Y3wjvIFfY9B4YE0RMNGtd225WIaNQ7OuFUjOQkb42hUUjkNI/6oC8o/mVHccECMoB2
         tiAnQDgmD2S5CIv63/KGog9c5/HJj8Hc43qoFmUl08KwYq+PvjCIiHn1i/aBMJE+BDK5
         pGvy4DZZQ6QthH8VsrQw2DcRLXeOExFm9CAUvowbKQwSNKroAUZMOfJIK8PqS3+hbR1k
         R0udQw7ykgL097z119l7iOfXY0Z4xsXU7HRb6CJet1i//98cFdrEdcw1gjjvirhn0iEd
         ygc5PRRdAlDLnzXiVGO4qOhy2R3sVnIqaN4IhksZRHzSwhzt5peJnZBbsWGWZdBOFhMx
         yT1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=JuiDSP0F8f/mvJm5N5JsuXUVLWINFISxvIK/jLDojEo=;
        fh=DjfmP4GuGmv+HIZ6mSuNbs+OASAdIuzO7/WHsW02d/E=;
        b=lrrEhy/rxVLzYl2Eusc0J6FhSrCp3MtVk34VbYm4goTJVbzZ/cPXoCWErTyIBGmF3L
         Mi4aA3kIR9lzq6+yXUEIVqRnY/ijHxo3Z639O2JolzUM9u/Hukd5jXxGfHycuUEa8cc/
         sK1pj+IFzTK+zFpiYcuMUFr3Wf+EWTsXoZSsjteBJQ9RxVD+u0uL5meKJfnM4sUQ6G9f
         YQx0MSYWV9xUOpe9/60GBjrf6yHXCqjz1CeCK+T9r7pElb0/NEOz0mLfDEQsct0Ry0j6
         XkNWaO22k8nSVahfaYyuWdSzUVllCxl5T0y/bzJKRxmAwITevjAwNkynv40AmZ3uy0+4
         zQZg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486516-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486516-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-486516-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 41be03b00d2f7-aa5c6f618besi16471360a12.362.2025.01.23.02.29.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 02:29:31 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-486516-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486516-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486516-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE9F83A4234
	for <alex.bennee@linaro.org>; Thu, 23 Jan 2025 10:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDC020D518;
	Thu, 23 Jan 2025 10:29:27 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F91620D4F4
	for <linux-kernel@vger.kernel.org>; Thu, 23 Jan 2025 10:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737628167; cv=none; b=fTeFxVnzIbcXlRe+AcBj3Ex3dN5Uu4buZCHHjr++JTime5jvDvCHiL1Ufj1kd+IFFfaoWVgJZTMGqdH2zMMJOjABjaBiwWbHizxBZbwW4JXk81yqX0tn5cp45f8e79KU5kd0gutNFdVE1I/RuTKnP0UdqeKo38pOKzjWVdL3okM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737628167; c=relaxed/simple;
	bh=w/HYzjiaSfpgMuSr1lVRzUlSsk9FEk3+PeyysVzOThs=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZQDAaszx1yHuVeabbzu1fhq+HU0Rd6bd26ZUJuTwT1RnNXpRaHsLTkUco3sKPaWv+1QYzMZr9EMSWFwLOYxXjcXaDq3hwPV0byslsQyWV7SzNur46sDnrDw5OonpQ3jLvbFMvJOUWnIh/uFXITuMvN2epNUa+ObiKNFP4Iah2Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ydxxq24jgz6K8rx;
	Thu, 23 Jan 2025 18:29:03 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id AFE98140736;
	Thu, 23 Jan 2025 18:29:21 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 23 Jan
 2025 11:29:21 +0100
Date: Thu, 23 Jan 2025 10:29:19 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
	<gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/11] acpi/ghes: Use HEST table offsets when preparing
 GHES records
Message-ID: <20250123102919.000044c9@huawei.com>
In-Reply-To: <10a8a913862c9cc894235d32b10bbf2f992340ff.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<10a8a913862c9cc894235d32b10bbf2f992340ff.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: R3ETLnLfISsc

On Wed, 22 Jan 2025 16:46:20 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> There are two pointers that are needed during error injection:
> 
> 1. The start address of the CPER block to be stored;
> 2. The address of the ack, which needs a reset before next error.
> 
> It is preferable to calculate them from the HEST table.  This allows
> checking the source ID, the size of the table and the type of the
> HEST error block structures.
> 
> Yet, keep the old code, as this is needed for migration purposes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Generally looks good.  A few bits that I think could be made
easier to follow for anyone with the spec open in front of them.

Thanks,

Jonathan

> ---
>  hw/acpi/ghes.c | 98 ++++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 88 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 34e3364d3fd8..b46b563bcaf8 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -61,6 +61,23 @@
>   */
>  #define ACPI_GHES_GESB_SIZE                 20
>  
> +/*
> + * Offsets with regards to the start of the HEST table stored at
> + * ags->hest_addr_le, according with the memory layout map at
> + * docs/specs/acpi_hest_ghes.rst.
> + */
> +
> +/* ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2

Local multiline comment style seems to be always
/*
 * ACPI 6.2:...

So perhaps good to copy that.

> + * Table 18-382 Generic Hardware Error Source version 2 (GHESv2) Structure
> + */
> +#define HEST_GHES_V2_TABLE_SIZE  92
> +#define GHES_ACK_OFFSET          (64 + GAS_ADDR_OFFSET)

Using a GAS offset here to me obscures what is going on.  I'd
explicitly handle the GAS where you are reading this.
We probably should sanity check the type as there are
some crazy options that might turn up one day.

Maybe worth using spec term of
GHES_READ_ACK_...

Obviously it's a question of who you are for whether it is read or
write, but maybe still worth using that term for easy checking
against the specification.

> +
> +/* ACPI 6.2: 18.3.2.7: Generic Hardware Error Source
same on comment format.

> + * Table 18-380: 'Error Status Address' field
> + */
> +#define GHES_ERR_ST_ADDR_OFFSET  (20 + GAS_ADDR_OFFSET)
Maybe STS or spell out status? I found ST a bit confusing below.

> +
>  /*
>   * Values for error_severity field
>   */
> @@ -212,14 +229,6 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
>  {
>      int i, error_status_block_offset;
>  
> -    /*
> -     * TODO: Current version supports only one source.
> -     * A further patch will drop this check, after adding a proper migration
> -     * code, as, for the code to work, we need to store a bios pointer to the
> -     * HEST table.
> -     */
> -    assert(num_sources == 1);
> -
>      /* Build error_block_address */
>      for (i = 0; i < num_sources; i++) {
>          build_append_int_noprefix(hardware_errors, 0, sizeof(uint64_t));
> @@ -419,6 +428,70 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
>      *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
>  }
>  
> +static void get_ghes_source_offsets(uint16_t source_id, uint64_t hest_addr,
> +                                    uint64_t *cper_addr,
> +                                    uint64_t *read_ack_start_addr,
> +                                    Error **errp)
> +{
> +    uint64_t hest_err_block_addr, hest_read_ack_addr;
> +    uint64_t err_source_struct, error_block_addr;
> +    uint32_t num_sources, i;
> +
> +    if (!hest_addr) {
I guess it is a question of matching local code, but I'd be tempted
to name this hest_body_addr as it isn't the start of the table but
rather the bit after the header.

> +        return;
> +    }
> +
> +    cpu_physical_memory_read(hest_addr, &num_sources, sizeof(num_sources));

The hest_addr naming thing confused me a tiny bit here because obviously num_sources
isn't the first thing in the table in the spec!

> +    num_sources = le32_to_cpu(num_sources);
> +
> +    err_source_struct = hest_addr + sizeof(num_sources);
> +
> +    /*
> +     * Currently, HEST Error source navigates only for GHESv2 tables
> +     */
> +
> +    for (i = 0; i < num_sources; i++) {
> +        uint64_t addr = err_source_struct;
> +        uint16_t type, src_id;
> +
> +        cpu_physical_memory_read(addr, &type, sizeof(type));
> +        type = le16_to_cpu(type);
> +
> +        /* For now, we only know the size of GHESv2 table */
> +        if (type != ACPI_GHES_SOURCE_GENERIC_ERROR_V2) {
> +            error_setg(errp, "HEST: type %d not supported.", type);
> +            return;

It's a pity we can't just skip them, but absence of a size field
makes that tricky...  Can add that later I guess along with sizes
for each defined type including figuring out the variable length
ones like IA-32 machine check.  I guess this is why the whole ordering
constraint for new types was added. Can't find the old ones if
we don't know the size of the new ones, hence need new definitions
at the end.

Anyhow, I'm fine with this but maybe a little more description in the comment
would avoid someone going down same rat hole I just did.


> +        }
> +
> +        /* Compare CPER source address at the GHESv2 structure */
> +        addr += sizeof(type);
> +        cpu_physical_memory_read(addr, &src_id, sizeof(src_id));
> +
> +        if (src_id == source_id) {
> +            break;
> +        }
> +
> +        err_source_struct += HEST_GHES_V2_TABLE_SIZE;
> +    }
> +    if (i == num_sources) {
> +        error_setg(errp, "HEST: Source %d not found.", source_id);
> +        return;
> +    }
> +
> +    /* Navigate though table address pointers */
> +    hest_err_block_addr = err_source_struct + GHES_ERR_ST_ADDR_OFFSET;

So this is a bit confusing. I'd pull the GAS offset down here rather
than putting it in the define. That way we can clearly see you
are grabbing the address field.  As above, should we check the type
is 0x00?  There are many fun things it could be but here I think
we just want it to be memory space.

> +    hest_read_ack_addr = err_source_struct + GHES_ACK_OFFSET;

Perhaps move this down to above where it is used?
Same thing about GAS address offset being better found down here
rather than hidden in GHES_ACK_OFFSET.

> +
> +    cpu_physical_memory_read(hest_err_block_addr, &error_block_addr,
> +                             sizeof(error_block_addr));
> +
> +    cpu_physical_memory_read(error_block_addr, cper_addr,
> +                             sizeof(*cper_addr));
> +
> +    cpu_physical_memory_read(hest_read_ack_addr, read_ack_start_addr,
> +                             sizeof(*read_ack_start_addr));
> +}
> +
>  void ghes_record_cper_errors(const void *cper, size_t len,
>                               uint16_t source_id, Error **errp)
>  {
> @@ -439,8 +512,13 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>      }
>      ags = &acpi_ged_state->ghes_state;
>  
> -    get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
> -                         &cper_addr, &read_ack_register_addr);
> +    if (!ags->hest_addr_le) {
> +        get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
> +                             &cper_addr, &read_ack_register_addr);
> +    } else {
> +        get_ghes_source_offsets(source_id, le64_to_cpu(ags->hest_addr_le),
> +                                &cper_addr, &read_ack_register_addr, errp);
> +    }
>  
>      if (!cper_addr) {
>          error_setg(errp, "can not find Generic Error Status Block");

