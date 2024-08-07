Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp350248dlb;
        Wed, 7 Aug 2024 07:26:03 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVYRUdmdQlv2aDbL1dHuuN08tMMVJmVBSBw0SUC2tD1C5kXcC7GjT2gJOHn2kUjUbFWaP3P1dX6K5eSIHYMrAiz1B3pn1DN
X-Google-Smtp-Source: AGHT+IEwIeEk776GagFjNrY8bmn+k11CvVaiqCce7c1GNmftb9KEW2uua6LKgg3rzZ9K6uoHoKAe
X-Received: by 2002:a05:6512:1243:b0:52c:df6f:a66 with SMTP id 2adb3069b0e04-530bb3b189cmr10071601e87.58.1723040762832;
        Wed, 07 Aug 2024 07:26:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723040762; cv=pass;
        d=google.com; s=arc-20160816;
        b=Mk9HAcomtrk7vuzx9h22GhC+tsd93QW1cUKRmq4El8lhwpFL6wf6kST9tCxOnbBKhi
         of0uzVnxyg8mJPJet//XuYaWz6uZP+BMICQ0NEJ2cNN4SlEJ8Z3LAv70EFQJOq3X3sVg
         P/J/K7OBlMiBCwOqkEB2kHnvv1fGvAo1fQO34qRtiCxZYOVaaq+1pcxScoWBAO+jReUA
         zyQ7tqYG7nRjVW0sQXBtHYinSi5+PMCCq+yHWlf4KRp7j6lMZk3SlR9K4TTvbNWYkmKG
         UxLek75KUZo4tn970b3+wwX5n9EFvrCj17C7mpYUWFTkgGNjzNyd0QVCa8WuiwwCwq7U
         rKFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=HVSPuqSsNJa7R+uOtKbLe0lD4YKHxwLmDV/ClpoVeXg=;
        fh=D9C6Fi9/7hj7lBAsCHWNuHQ9wJ4bXwCyR67eaqZtF88=;
        b=WU7Cl3o12wmaT5TMM8g6IlgiPDN/hT8i3qS/y1OwI3Zdd+IdekUu2XrxWPf65dBg51
         Gp0LZBbCJvw4rRrm90t3c33mokjR0hmI2Ata+xrd1iBTK7eqEgM9WS3DNU+BCLGHdoDb
         FwNVTMHYmQJt+VJzpodbbVvwLD7i2QSXApyrDTfkPOumulvMj1rVSsrc8O1pBSx14PX0
         8lDFtsrm1zAUhIxb4LuERTOshGfplUsCZNXryxoJQYcLnlX8uVlVmUMwYzcb3KLf/Oia
         VOukSc5KdnX+47YHvadxfHUFhGEKD5msHlJtgHWBw92UULuOCxm7cEVSV+xnS773VUdj
         ng2Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-278045-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-278045-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-278045-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5ba482281absi5360843a12.110.2024.08.07.07.26.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 07:26:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-278045-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-278045-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-278045-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 145D81F2520F
	for <alex.bennee@linaro.org>; Wed,  7 Aug 2024 14:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F746F2F0;
	Wed,  7 Aug 2024 14:25:56 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4925456458
	for <linux-kernel@vger.kernel.org>; Wed,  7 Aug 2024 14:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723040756; cv=none; b=r/eaICdEvgfw7uYLVqYNWTcLnuVKvXkWxgXpWaKuGpvRUUDP1vbugRjSwFV4x2fpOcy7O1UmtJWNy60dv6lrF4rb5FD2JQWqBdb5xZYWjwTU7xhyhhkhIokIeiHmjuRW/xFvllmYVLKDGcl+7j3vA0WYv3gnfkkChOehhpCbBd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723040756; c=relaxed/simple;
	bh=jW4eBRDjiyEBvtx2/oCOXrGyM+xYe7d8BQZcdpmDHME=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eZuPZak9Lx8jnXdLatVDCrQK+YHubELB+rSXHrC2oxPrVDo0zKfrR6AH1+tNEtA7y36JSnn8Chr2bm53teVDbNhxSnjxdRDPg2yzeT2uGq78jEPswa1p3/hs9kLNWTUSnCOCJcdvMyIqsNsnLpu3cmcWV0DHf8TYVX7dTpSWwVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WfC8K6R0Vz6K5nm;
	Wed,  7 Aug 2024 22:23:29 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 242E6140B35;
	Wed,  7 Aug 2024 22:25:49 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 7 Aug
 2024 15:25:48 +0100
Date: Wed, 7 Aug 2024 15:25:47 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Shiju Jose
	<shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
	<anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
	<linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
Subject: Re: [PATCH v5 6/7] acpi/ghes: add support for generic error
 injection via QAPI
Message-ID: <20240807152547.000058fd@Huawei.com>
In-Reply-To: <20240806163113.3bdc260a@imammedo.users.ipa.redhat.com>
References: <cover.1722634602.git.mchehab+huawei@kernel.org>
	<20c491e357340e0062b6ff09867c1661ed4d2479.1722634602.git.mchehab+huawei@kernel.org>
	<20240806163113.3bdc260a@imammedo.users.ipa.redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: Do2r4XdUtFFy

On Tue, 6 Aug 2024 16:31:13 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Fri,  2 Aug 2024 23:44:01 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Provide a generic interface for error injection via GHESv2.
> > 
> > This patch is co-authored:
> >     - original ghes logic to inject a simple ARM record by Shiju Jose;
> >     - generic logic to handle block addresses by Jonathan Cameron;
> >     - generic GHESv2 error inject by Mauro Carvalho Chehab;
> > 
> > Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Co-authored-by: Shiju Jose <shiju.jose@huawei.com>
> > Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Cc: Shiju Jose <shiju.jose@huawei.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  hw/acpi/ghes.c         | 159 ++++++++++++++++++++++++++++++++++++++---
> >  hw/acpi/ghes_cper.c    |   2 +-
> >  include/hw/acpi/ghes.h |   3 +
> >  3 files changed, 152 insertions(+), 12 deletions(-)
> > 
> > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > index a745dcc7be5e..e125c9475773 100644
> > --- a/hw/acpi/ghes.c
> > +++ b/hw/acpi/ghes.c
> > @@ -395,23 +395,22 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> >      ags->present = true;
> >  }
> >  
> > +static uint64_t ghes_get_state_start_address(void)  
> 
> ghes_get_hardware_errors_address() might better reflect what address it will return
> 
> > +{
> > +    AcpiGedState *acpi_ged_state =
> > +        ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED, NULL));
> > +    AcpiGhesState *ags = &acpi_ged_state->ghes_state;
> > +
> > +    return le64_to_cpu(ags->ghes_addr_le);
> > +}
> > +
> >  int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
> >  {
> >      uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
> > -    uint64_t start_addr;
> > +    uint64_t start_addr = ghes_get_state_start_address();
> >      bool ret = -1;
> > -    AcpiGedState *acpi_ged_state;
> > -    AcpiGhesState *ags;
> > -
> >      assert(source_id < ACPI_HEST_SRC_ID_RESERVED);
> >  
> > -    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> > -                                                       NULL));
> > -    g_assert(acpi_ged_state);
> > -    ags = &acpi_ged_state->ghes_state;
> > -
> > -    start_addr = le64_to_cpu(ags->ghes_addr_le);
> > -
> >      if (physical_address) {
> >          start_addr += source_id * sizeof(uint64_t);  
> 
> above should be a separate patch
> 
> >  
> > @@ -448,9 +447,147 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
> >      return ret;
> >  }
> >  
> > +/*
> > + * Error register block data layout
> > + *
> > + * | +---------------------+ ges.ghes_addr_le
> > + * | |error_block_address0 |
> > + * | +---------------------+
> > + * | |error_block_address1 |
> > + * | +---------------------+ --+--
> > + * | |    .............    | GHES_ADDRESS_SIZE
> > + * | +---------------------+ --+--
> > + * | |error_block_addressN |
> > + * | +---------------------+
> > + * | | read_ack0           |
> > + * | +---------------------+ --+--
> > + * | | read_ack1           | GHES_ADDRESS_SIZE
> > + * | +---------------------+ --+--
> > + * | |   .............     |
> > + * | +---------------------+
> > + * | | read_ackN           |
> > + * | +---------------------+ --+--
> > + * | |      CPER           |   |
> > + * | |      ....           | GHES_MAX_RAW_DATA_LENGT
> > + * | |      CPER           |   |
> > + * | +---------------------+ --+--
> > + * | |    ..........       |
> > + * | +---------------------+
> > + * | |      CPER           |
> > + * | |      ....           |
> > + * | |      CPER           |
> > + * | +---------------------+
> > + */  
> 
> no need to duplicate docs/specs/acpi_hest_ghes.rst,
> I'd just reffer to it and maybe add short comment as to why it's mentioned.
> 
> > +/* Map from uint32_t notify to entry offset in GHES */
> > +static const uint8_t error_source_to_index[] = { 0xff, 0xff, 0xff, 0xff,
> > +                                                 0xff, 0xff, 0xff, 1, 0};
> > +
> > +static bool ghes_get_addr(uint32_t notify, uint64_t *error_block_addr,
> > +                          uint64_t *read_ack_addr)
> > +{
> > +    uint64_t base;
> > +
> > +    if (notify >= ACPI_GHES_NOTIFY_RESERVED) {
> > +        return false;
> > +    }
> > +
> > +    /* Find and check the source id for this new CPER */
> > +    if (error_source_to_index[notify] == 0xff) {
> > +        return false;
> > +    }
> > +
> > +    base = ghes_get_state_start_address();
> > +
> > +    *read_ack_addr = base +
> > +        ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t) +
> > +        error_source_to_index[notify] * sizeof(uint64_t);
> > +
> > +    /* Could also be read back from the error_block_address register */
> > +    *error_block_addr = base +
> > +        ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t) +
> > +        ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t) +
> > +        error_source_to_index[notify] * ACPI_GHES_MAX_RAW_DATA_LENGTH;
> > +
> > +    return true;
> > +}  
> 
> I don't like all this pointer math, which is basically a reverse engineered
> QEMU actions on startup + guest provided etc/hardware_errors address.
> 
> For once, it assumes error_source_to_index[] matches order in which HEST
> error sources were described, which is fragile.
> 
> 2nd: migration-wive it's disaster, since old/new HEST/hardware_errors tables
> in RAM migrated from older version might not match above assumptions
> of target QEMU. 
> 
> I see 2 ways to rectify it:
>   1st: preferred/cleanest would be to tell QEMU (via fw_cfg) address of HEST table
>        in guest RAM, like we do with etc/hardware_errors, see
>             build_ghes_error_table()
>                ...
>                tell firmware to write hardware_errors GPA into
>        and then fetch from HEST table in RAM, the guest patched error/ack addresses
>        for given source_id
> 
>        code-wise: relatively simple once one wraps their own head over
>                  how this whole APEI thing works in QEMU
>                  workflow  is described in docs/specs/acpi_hest_ghes.rst
>                  look to me as sufficient to grasp it.
>                  (but my view is very biased given my prior knowledge,
>                   aka: docs/comments/examples wrt acpi patching are good enough)
>                  (if it's not clear how to do it, ask me for pointers)

Hi Igor, I think I follow what you mean but maybe this question will reveal
otherwise.  HEST is currently in ACPI_BUILD_TABLE_FILE.
Would you suggest splitting it to it's own file, or using table_offsets
to get the offset in ACPI_BUILD_TABLE_FILE GPA?
