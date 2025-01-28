Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3118115njk;
        Tue, 28 Jan 2025 06:11:04 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXlk9Grk5EmDMbADLgQTFJ36Infbjm8wt488weU6ILjt/oJjN4FrZ/wd+1FS1XBgtSCwJHzAwNXp6gPGA==@linaro.org
X-Google-Smtp-Source: AGHT+IE256KdBDSg6ddkYuJ557gw98iEHT90Klk9aPOlW6Dd0nLaILLVBsruqD8pdnmJkivPMdKY
X-Received: by 2002:a17:907:60d2:b0:aac:43e:ffa5 with SMTP id a640c23a62f3a-ab38b1ff088mr4039967166b.15.1738073464310;
        Tue, 28 Jan 2025 06:11:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738073464; cv=pass;
        d=google.com; s=arc-20240605;
        b=cd3JlTJVJM+K7fvJLDncKoEQno+xYJvqYi/K1YVAk8B+AzevcVyR7RiAJt5lFtUtkz
         GQtxl3FtSsdOasljicp1IZwK7Yjsb0ZzOy/nP3GvDnsyILbJeHag72EXmx+mZJVIddMY
         hIWGjhKZeES8rUegPyHRoutJZxRENgK/nklptHKxkdk4X1yF7vNcgNsMLYm76UcOYuT+
         5JtsVHVybkELMUbjNbllr2cw6KFB+JxfIzb/UUPiIEh9RzB+iSkOzO+IjhUfeAv7j8yL
         JzqQC/rlcg9IfLJTOXSNG3OOuQtLI9DbVQd6XBQbAohtvE2AW+ZLZQcwVhkh9oQCOdPC
         UjFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=5lXQEbinNnU9t1k5FBtxero/wbDPq+11EpIMSX4NSf8=;
        fh=DjfmP4GuGmv+HIZ6mSuNbs+OASAdIuzO7/WHsW02d/E=;
        b=hY/RezZKTGaEeVyWUlPGjh1taxrI1wUvFSw7zb2x4RgnBjKSTEtcUtqYOZ9H3UXcXV
         RnMs6b1OWZuRnBkrSsBhveQZxKibKi97dFfyyXY0EAUOST69Zn3XRlXakOO4Nysxnacq
         /hB5lbh8mvOoiQ3mlEpNk2fIogV+Dj0VFWt0K7GdMa4PZ93TdS/tMvLUrcq8bsot6tg2
         TzfbSnLmy9jB5tGoBeRu9Ss834rpG+0cROJ8DoahHPLdcmKjoLEb34urO/YzMoTjmIiN
         x/G2x7vopKrrB4ByocKaZyai5xwci8gLJtos79oV659syWRHY0f71BDCsc8g9CSDUfAT
         OHGA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-491444-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-491444-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-491444-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-ab675e24edbsi755495766b.62.2025.01.28.06.11.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 06:11:04 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-491444-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-491444-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-491444-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94DA31888276
	for <alex.bennee@linaro.org>; Tue, 28 Jan 2025 14:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D171A23BD;
	Tue, 28 Jan 2025 14:10:59 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB9719DF61
	for <linux-kernel@vger.kernel.org>; Tue, 28 Jan 2025 14:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738073459; cv=none; b=hXS8fBB++C98b4q/16FkQUzNpqNnSrl3YdEj4fRQE8ar/vZUxrx15vH3DAOqZF8O83LBWTYFR0icje9IRbOgniXv7/MoDqkxAViqkKcFPSzDbY7WBT5bEx/35VffORNmVxKuQarpk9SIJoq/pgEVggCo+3nTHXk1q6Z5PX0SmRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738073459; c=relaxed/simple;
	bh=wR70iL5MUGzD/BMurkUhbK+oUBxdGPQXrL1t4448PlQ=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uiIw7r/ORagXHCL0b3xLB57R5IdcUFuYTcgBeuKxqRkeUGoRPq9pi9hZjgu4Gb9GnQkalzE5WGB1pjXRoTiepR6t8fTfPYd1stK69ll/HjRYJzOB4BRZlyK9V1zP0iV4v5bRGqbWKdYXWXCpKsfyXLtf7QCgbaHxIdMwYI8SUHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Yj6cr5w1Kz6K8kL;
	Tue, 28 Jan 2025 22:10:20 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 164C61402DB;
	Tue, 28 Jan 2025 22:10:54 +0800 (CST)
Received: from localhost (10.195.245.182) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 28 Jan
 2025 15:10:53 +0100
Date: Tue, 28 Jan 2025 14:10:51 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
	<gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 02/11] acpi/ghes: add a firmware file with HEST address
Message-ID: <20250128141051.00000899@huawei.com>
In-Reply-To: <20250128110034.650445fc@foz.lan>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<a3579f6c2c24e764e544f83b6e1b2dbef730e3e3.1737560101.git.mchehab+huawei@kernel.org>
	<20250123100217.00007373@huawei.com>
	<20250128110034.650445fc@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: wz928bAAOqKG

On Tue, 28 Jan 2025 11:00:34 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Thu, 23 Jan 2025 10:02:17 +0000
> Jonathan Cameron <Jonathan.Cameron@huawei.com> escreveu:
> 
> > On Wed, 22 Jan 2025 16:46:19 +0100
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
> > > Store HEST table address at GPA, placing its content at
> > > hest_addr_le variable.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > >     
> > A few trivial things inline.
> > 
> > Jonathan
> >   
> > > ---
> > > 
> > > Change from v8:
> > > - hest_addr_lr is now pointing to the error source size and data.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>    
> > Bonus.  I guess you really like this patch :)  
> > > ---
> > >  hw/acpi/ghes.c         | 17 ++++++++++++++++-
> > >  include/hw/acpi/ghes.h |  1 +
> > >  2 files changed, 17 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > > index 3f519ccab90d..34e3364d3fd8 100644
> > > --- a/hw/acpi/ghes.c
> > > +++ b/hw/acpi/ghes.c
> > > @@ -30,6 +30,7 @@
> > >  
> > >  #define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
> > >  #define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
> > > +#define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
> > >  
> > >  /* The max size in bytes for one error block */
> > >  #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
> > > @@ -261,7 +262,7 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
> > >      }
> > >  
> > >      /*
> > > -     * tell firmware to write hardware_errors GPA into
> > > +     * Tell firmware to write hardware_errors GPA into    
> > 
> > Sneaky tidy up.  No problem with it in general but adding noise here, so if there
> > are others in the series maybe gather them up in a cleanup patch.  
> 
> There are no other cleanups pending. Besides, as you noticed, this
> aligns with the comment below. So, I'm opting to add a note at the
> patch's description.

ok.


> 
> > > +     * once initialized.
> > > +     */
> > > +    bios_linker_loader_write_pointer(linker,
> > > +                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,    
> > 
> > Could wrap less and stay under 80 chars as both lines above add up to 70 something  
> 
> Why? This follows QEMU coding style and lines aren't longer than 80
> columns. Besides, at least for my eyes and some experience doing maintainership
> on other projects over the years, it is a lot quicker to identify function
> parameters if they're properly aligned with the parenthesis.
Ah. I didn't state this clearly enough.
       bios_linker_loader_write_pointer(linker, ACPI_HEST_ADDR_FW_CFG_FILE, 0,    
is also under 80 chars.


> 
> Thanks,
> Mauro

