Received: by 2002:a05:7022:fe04:b0:85:21:bd5b with SMTP id vc4csp979014dlb;
        Thu, 1 Aug 2024 07:33:14 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXQJdOiVuwqcQvpZP+sqsRFdgiBOGC3QrcV2+xP9CDUq9NNSmgWdo60ZUnuasKe+c1FyxS4yCVMY+gSqATHeJHEiOtrAH3A
X-Google-Smtp-Source: AGHT+IG7X5E1wG6WktXkOuCobHhH5k1bbyi2ttG/BuumGXLHPUIfyjU9UwxaudWeyZZBF4Eafcfh
X-Received: by 2002:a05:6a21:3389:b0:1c4:a7a0:a7d4 with SMTP id adf61e73a8af0-1c699550dd5mr669059637.7.1722522794053;
        Thu, 01 Aug 2024 07:33:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722522794; cv=pass;
        d=google.com; s=arc-20160816;
        b=f+6/ibAcp6hFLjjUB/PVbsbsQGXadXnq+M6ccLxnHlSpGa3KGHcDThA3sIl5JJqR8m
         4u/EiAXYF5ID1zSjrrUos0sqkrCGCAMdwSTF5s8G9zWSt5GfjjhmNb6+fc7tEdMJezIv
         sqT118bfROnM1njGmKg6O+3TYFoXRk/J1HAevKkRY712n+ZqxZ1dVW7iSPEv3KyVLKPr
         rMYEkA42RJ0bKdMk0ufTOtynBQ9b2QtPW0W+uKWyRo9S3uux+SGg+halpmeb+mD3361x
         yv8OdF5YtiLwd+1wicxOPoyWc3SMqILxthYG+Ia6m2SFNra8WKY4haq4Fw8bvzvY89Lu
         QOvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=geSiqP2xkEpj6V/Q/1mwlsfXprzJWoIQ3ZlQrirQDPE=;
        fh=sk20niJjP+LyGcAC6rY5I61AlgNCIPpR6UIhxIWLYTI=;
        b=e4+KsB6a0r0iYgde920rzD0+10bH15GUig3z4KuHwJ8V4ZdbPfBm+yXLpvEFVahcYL
         cKB01VpMr35d6mvG1c9hO4An0Giyqx6PjUMN5nc2eTphsxl/5Gw0LoUmSAyx/1oNc/EM
         rXK/FuD7OKZUzN3HOC4i4To+exCXbPCn9cTtq96iaVYf+5hlhef3d6TOHmwpjaHr1CeN
         D2L81Ui5wVADuXDXxDvQ8XeWwceUN5Gky7jpctVKcVtKp4q3GwKOnX+w4a8fSG3FyOtX
         yM361wwmwSuw+SupIos30gxd03Dto/vyWx2AqAPQrb0a0dP/CuueP71lEPcNBjyYDAtx
         TMDw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-271428-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-271428-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-271428-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2cfdc4df13fsi4032941a91.116.2024.08.01.07.33.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 07:33:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-271428-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-271428-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-271428-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB839B230B5
	for <alex.bennee@linaro.org>; Thu,  1 Aug 2024 14:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896131A4F16;
	Thu,  1 Aug 2024 14:33:04 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F671E4AB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Aug 2024 14:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722522784; cv=none; b=aZ7U66Qfpjeni6KxHTm+UMSCUl2efpaoU2DtyZHj/mVe6BE2K8AAhcD/xRMA/liasZf4Beg7Yd3zz3rMgSUww7uYMBZTghq9+SyuMQ1bUg4utWkWjiWHTgs1NsO2+wPI+NMCby/ktynb2oC5+NgnJnRmR3PtcDA90vGiNERGimU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722522784; c=relaxed/simple;
	bh=Rd0BXWWYsLO4emq1r5gtrd7pXCh+Aat7hf2/5V1xsA8=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jYUZtTg4chyYXeI4xskpklo1LERopvzJJ1TvGDAe2JQVUPAbzqDC5iFkJv6XvQ9qU7O5SvzJUGEQBq1opLyWH9/qYmSWJpFaUQUe8NSIM9kKAxGJppwcF3MX9+UOM48jkhLZuy/gXvEWP+qTSOXs42x1PU6PtNb4rbDikRo1mOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WZWb307f0z687SH;
	Thu,  1 Aug 2024 22:30:22 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id A2E931400F4;
	Thu,  1 Aug 2024 22:32:58 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 1 Aug
 2024 15:32:58 +0100
Date: Thu, 1 Aug 2024 15:32:57 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
	<qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 3/7] acpi/ghes: Support GPIO error source.
Message-ID: <20240801153257.00006e30@Huawei.com>
In-Reply-To: <20240801145637.03c34fd3@foz.lan>
References: <cover.1721630625.git.mchehab+huawei@kernel.org>
	<64a31a09fe6b11bebad1c592ad20071a9d93fee5.1721630625.git.mchehab+huawei@kernel.org>
	<20240730104028.4f503d91@imammedo.users.ipa.redhat.com>
	<20240801145637.03c34fd3@foz.lan>
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
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: o+esiA2PWm2t

On Thu, 1 Aug 2024 14:56:37 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Tue, 30 Jul 2024 10:40:28 +0200
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > > diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> > > index 674f6958e905..4f1ab1a73a06 100644
> > > --- a/include/hw/acpi/ghes.h
> > > +++ b/include/hw/acpi/ghes.h
> > > @@ -58,6 +58,7 @@ enum AcpiGhesNotifyType {
> > >  
> > >  enum {
> > >      ACPI_HEST_SRC_ID_SEA = 0,
> > > +    ACPI_HEST_SRC_ID_GPIO = 1,    
> > is it defined by some spec, or just a made up number?  
> 
> I don't know. Maybe Jonathan or Shiju knows better, as the original patch
> came from them, but I didn't find any parts of the ACPI spec defining the
> values for source ID.

> 
> Checking at build_ghes_v2() implementation, this is used on two places:
> 
> 1. as GHESv2 source ID:
>     /*
>      * Type:
>      * Generic Hardware Error Source version 2(GHESv2 - Type 10)
>      */
>     build_append_int_noprefix(table_data, ACPI_GHES_SOURCE_GENERIC_ERROR_V2, 2);
>     /* Source Id */
>     build_append_int_noprefix(table_data, source_id, 2);
>     /* Related Source Id */
>     build_append_int_noprefix(table_data, 0xffff, 2);
> 
> as an address offset:
> 
>     address_offset = table_data->len;
>     /* Error Status Address */
>     build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0x40, 0,
>                      4 /* QWord access */, 0);
>     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
>         address_offset + GAS_ADDR_OFFSET, sizeof(uint64_t),
>         ACPI_GHES_ERRORS_FW_CFG_FILE, source_id * sizeof(uint64_t));
> 
> So, if I had to guess, I'd say that this was made up, in a way that
> the size of the table will fit just two sources, starting from zero.
> 
> So, I'll change the code to just:
> 
> 	enum {
>             ACPI_HEST_SRC_ID_SEA = 0,
>             ACPI_HEST_SRC_ID_GPIO, 

LGTM.  The naming is perhaps not ideal but the scheme predates my
involvement so I'm not sure of the reasoning.  Could change it
to QEMU_ACPI...
to make it really really clear these aren't an ACPI spec thing, but
may not be worth it.

J

> 	    /* future ids go here */
> 	    ACPI_HEST_SRC_ID_RESERVED,
> 	};
> 
> To remove the false impression that this could be originated from the
> spec.
> 
> Thanks,
> Mauro
> 

