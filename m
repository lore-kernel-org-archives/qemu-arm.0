Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1641698njc;
        Mon, 30 Sep 2024 22:29:24 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUNTL78x263xIqs0fcH6GqZWaodujuxyjniZhhWitpBZdA+9QJaxtc6AiFVpoXAdj7S+S7g8Gl1hyttjw==@linaro.org
X-Google-Smtp-Source: AGHT+IFbUOU5LqcbtBouHqk8UJXu5BgSJOtx1RxQ/OM4SqM0do5C5NJNDvmZaNCNtRpzb1KKRsI9
X-Received: by 2002:a17:902:e841:b0:20b:898b:ec18 with SMTP id d9443c01a7336-20b898bef08mr78679225ad.43.1727760564642;
        Mon, 30 Sep 2024 22:29:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727760564; cv=pass;
        d=google.com; s=arc-20240605;
        b=SssMBJpto044VDVYtRG7FUukJ18aXxZwEK4OMVS0b5cSFDP/2iP/1mvaZ9o2WPoIgL
         2HsvxM60seXUlleJS9KRo//sddJQoFawrqBZgHHRKcY5kPBvMtBjpduwk9Sk01pTDNzu
         XOwuXMWsSG1p36l8MqA3QMs3QCdpleLoNV5nwrAC1GCWJS15yOievcIimy1Lsa6EmRcE
         4j7WAdrLDPbWQwln09oO9Z92Akhh8TWcqYPwudiawOiFP4FjtkUzWzOohdzedCNm48ec
         VwosIogrkYu4ZcQjEAl54bujPg6thbo8gWGrCuIWMGepQ8F54wx/XTL7hNZYeWNaA186
         P3Tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=3e1Adr3n9yIhD8SVUt3dyz8GAdiBgkj9C3nGh4ueC6A=;
        fh=4F3icJOjDA3hqWfLxQJP4N6/UlrYJqbYzCAlesd2ztI=;
        b=ASSDajxS4i6m6t65+Dz3Rnj6B4PL3/d2czZBL4HoUw6+FPIpQAqVlSYCWMNXeE+b2y
         qSzNKBEkRkLNLhsOUhluDDXgVgfZElPmuQjn9eW0n+m2LwyapQSyuvM2OIeXmvZsaVrv
         AVc1ViD6O77wSodJ3AX5CTR5dqVaUuElaVuzj1GtMfKDJ0XbQeton7wLQlt0GLBHt1CH
         wN4aTEAdMafwAYfzXAH7PvAWubOy41M9CDpsBAjYFFqdHImoZfxvlYdDlXflshsRGRTQ
         +PjnQZgnyOpmEym5o4ZpVvpnhq/+jaUazt5gDn1aI2NA8Ikt+EREUJ2E66JzeQE6Rxr5
         YGQw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=YBFFONSB;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345249-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345249-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-345249-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d9443c01a7336-20b37e38d13si101821585ad.285.2024.09.30.22.29.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 22:29:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-345249-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=YBFFONSB;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345249-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345249-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29D23282DFE
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 05:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3717193429;
	Tue,  1 Oct 2024 05:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBFFONSB"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF66653
	for <linux-kernel@vger.kernel.org>; Tue,  1 Oct 2024 05:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727760559; cv=none; b=cfv772rdZSuFasPbDMR3tqBPuZlRto+ofW0PND06Go7dDaYjy6ziXaNSsH2VyKOSMkPvzBzN9ME3Gmu03kxgfa0xvSHSITO8g0k+hJrRO76chp3tZV/RuHXRkJWMEIpD0CPYzsx9ihRnaT6FX992mtyJ1hZ2pMS61bIL/aJAMbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727760559; c=relaxed/simple;
	bh=tuLz94NqQ0hls7myXaXA23/ISr3v1CUTbd7LWGCd4io=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ElMh+Ei6smz0F3GXrKYV4BIcWLjx8DJYbW7GafztTueQ5dnFVK3CS5XSPQn67lndhTf/TV9Mmw+s5sm3r/4ZgTUr/lQIEFtCuos02JEaLNTSzeDlfv4GLsQYGzjAyylvvK7h2OzlLP9HwHfSF2C65Vmt+P1mJUVed3Y5tM0TxuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBFFONSB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABB8C4CEC6;
	Tue,  1 Oct 2024 05:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727760559;
	bh=tuLz94NqQ0hls7myXaXA23/ISr3v1CUTbd7LWGCd4io=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YBFFONSBtvJJFQ8iKLKuuaV4H9YYl59U0QKPr6g1Iyn4qPsTKZFnhnECkM7TMeCQ3
	 1HV1ROY3v9Z3rAco2EsYCwlKVzqkC31f5XgWvhkKYUaHZXxSXtwSyGTtoGOcgpreNu
	 OZjGDxAqB/DCCqwTyKzfiFqZbyj2iP0bQTgtF4rNWGF0u1Y216Mh88w1XlKQsWCJsS
	 XmTxNKBMiwQGSruXWIysbyCY4QJGqKLQaEdzVRLZeYX4rMhJze1xs8B49A++xgz1XN
	 oypw8BLl1vABYo3B93reJG4AOdBeJ3wT4lHqPANUyvqFHygTXPmIJrNssik4+/7RJb
	 G4tVBOW6CbcSw==
Date: Tue, 1 Oct 2024 07:29:13 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 <linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH 08/15] acpi/ghes: Prepare to support multiple sources on
 ghes
Message-ID: <20241001072913.09f82e9f@foz.lan>
In-Reply-To: <20240925152333.0000110d@Huawei.com>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
	<05fb5c6a7d26eeb730bf5fe1f67bb6581ec6d730.1727236561.git.mchehab+huawei@kernel.org>
	<20240925152333.0000110d@Huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: hJS3+Mt+0UQC

Em Wed, 25 Sep 2024 15:23:33 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:

> On Wed, 25 Sep 2024 06:04:13 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > The current code is actually dependent on having just one
> > error structure with a single source.
> > 
> > As the number of sources should be arch-dependent, as it
> > will depend on what kind of synchronous/assynchronous
> > notifications will exist, change the logic to dynamically
> > build the table.  
> Not really arch dependent.  Depends on both arch and some
> firmware implementation choices, but I guess that detail
> doesn't matter here.
> 
> > 
> > Yet, for a proper support, we need to get the number of
> > sources by reading the number from the HEST table. However,
> > bios currently doesn't store a pointer to it.
> > 
> > For now just change the logic at table build time, while
> > enforcing that it will behave like before with a single
> > source ID.
> > 
> > A future patch will add a HEST table bios pointer and
> > change the logic at acpi_ghes_record_errors() to
> > dynamically use the new size.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> Trivial comment inline
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> > @@ -335,9 +346,10 @@ static void build_ghes_v2(GArray *table_data,
> >      build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0x40, 0,
> >                       4 /* QWord access */, 0);
> >      bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
> > -        address_offset + GAS_ADDR_OFFSET,
> > -        sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE,
> > -        (ACPI_GHES_ERROR_SOURCE_COUNT + source_id) * sizeof(uint64_t));
> > +                                   address_offset + GAS_ADDR_OFFSET,  
> 
> I'd prefer if we avoided realigning unless absolutely necessary or
> that it is split into a separate patch.
> Makes things a tiny bit harder to review.

Heh, Igor nacked a patch doing the alignment change on a separate patch,
so let's do it at the patches that are actually changing the code.

At least for me, it is a low easier to review patches that are properly
aligned with parenthesis. So, yeah it may be a little more painful to
review a patch changing alignments, but IMO it pays off on future
revisions, specially if we place one argument per line, like in this
function.

> 
> > +                                   sizeof(uint64_t),
> > +                                   ACPI_GHES_ERRORS_FW_CFG_FILE,
> > +                                   (num_sources + index) * sizeof(uint64_t));
> >    
> 



Thanks,
Mauro
