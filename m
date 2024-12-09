Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2465853njb;
        Mon, 9 Dec 2024 02:15:17 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCV0KaKMpDW0Q7M/H/795sYKt9xT/nXvm8FilOkf82scqA3x4PWkL1rjqrct35O3D8kJYHNmRcb4sGA0Sg==@linaro.org
X-Google-Smtp-Source: AGHT+IFh/P6Owg2VjXo6A545QfEj8JkdVzUNwHCROWEFO4BK3AwKOeI9atGDT3Tam19AEjMNouvb
X-Received: by 2002:a05:622a:6684:b0:467:4b94:cfaf with SMTP id d75a77b69052e-4674b94d38emr91642611cf.51.1733739317400;
        Mon, 09 Dec 2024 02:15:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733739317; cv=pass;
        d=google.com; s=arc-20240605;
        b=ebpGuwEW8BcJTzhiiliYgfrPI2lcKECyuWehXunl1coTQHM4i1BvCv/stGNkyKcZvx
         nuy5QpQnIvRX8JZ3Ght+V/mkdE8X0kdP/fu0EOwVsWqmIbXIyuJx6GfaIpUC/o5xrv7M
         tFYNKpZ+m0NPPg4Rkov5gwMgngzY3dlcBCGLuasJjoR/V5tuZvOu6mrNVIxt7GfKYxxm
         8lkhKt8O0OlZM33HXjwonM9AvP9mNmY3KhmqwT1HS6DttIwPQbWWAvuRMLQZyLDYlEuH
         MZhzYYlWAdXMnpWdZI9l1KavHwlwQ2I4HWumoswfcLb9PpaAzbiQFlIfWe7kNP3mlen8
         r83w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=gNNnm+tw+FEIijAthT7pHfNvVspmk+z50dHBuMWzUoQ=;
        fh=D9C6Fi9/7hj7lBAsCHWNuHQ9wJ4bXwCyR67eaqZtF88=;
        b=iRFkB7ojSQX9a0v1w1TxCfXQuQlUFaaSN+jOOue3VGaquUD5FD2UhpYW3fUMJTIcTQ
         XF3JqHqRu0gZvtYNKy5PfT3IGhde2ARKWxXRWzERpwRePK3+pyDhbUjaIGVGvPhtxRhf
         sGnPp43YhXfIGhX2Iynt7xJhknYlCvjFoucbIqxH6J+RGfpfSKzg3jXHchAlq5n81uyF
         V5eNm1znq2hk4iXXgF82pOdac0NsZIt0zVoxPXy9cPf38i7dCI8B0mLoUuwpneYe3RPE
         r/BEGnbL67c+EUb415ckt+J1HKKtJ7Iuy0Ww9nfxsleygXLhd/FVnHR/Qfipjnmk+P8V
         mXxg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-437168-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-437168-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-437168-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id d75a77b69052e-4674d3d98ffsi56465171cf.288.2024.12.09.02.15.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 02:15:17 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-437168-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-437168-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-437168-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF0D7164FC6
	for <alex.bennee@linaro.org>; Mon,  9 Dec 2024 10:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BD8216E13;
	Mon,  9 Dec 2024 10:15:16 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5741B14F12D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Dec 2024 10:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733739316; cv=none; b=aA5yfKBDxxW28HDQSFEzPOrjWQCGxKbEVI+trpcqLj2Awc3TcqiAbiE0tPj0dYMex/6mcEgfqM1OI/EW/PHDPIf/7sdKZWBx4fk4XpFrRwiKvAgAr5UtN98GVansRn2cK0F9F3K2m5X2VBQLzvKgXLyBZmwNEYinwxbXj030Shs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733739316; c=relaxed/simple;
	bh=e2BIJ6svlRpJT4zzT6x2Si6sF7SK2oPCINx6ChrmOQQ=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pelYYi6fodSMnB1unUHoe0TpEK38lBhZ8I4GD+S0IC4HtloPdtZ72j3z5jLUV/iW08jTH1UEtCGuYl3Ycn4jiD/1f051iT0ctx35j0z8ElUMcxyOQVph/Gppoxpk3fYeNp/LA7QNP9XG+nnKvrvtud82am3+TucBK1PaPX0tiEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Y6HlV2Zj2z6LDHp;
	Mon,  9 Dec 2024 18:14:14 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 6BE9A1402DB;
	Mon,  9 Dec 2024 18:15:05 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 9 Dec
 2024 11:15:04 +0100
Date: Mon, 9 Dec 2024 10:15:03 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Shiju Jose
	<shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
	<anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
	<linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
Subject: Re: [PATCH v5 08/16] acpi/ghes: don't check if physical_address is
 not zero
Message-ID: <20241209101503.000010b9@huawei.com>
In-Reply-To: <20241204141246.37a7cb9d@imammedo.users.ipa.redhat.com>
References: <cover.1733297707.git.mchehab+huawei@kernel.org>
	<95c0fa3fc2969daf3b6bc1f007733f11b715a465.1733297707.git.mchehab+huawei@kernel.org>
	<20241204141246.37a7cb9d@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: plYcCA5cG+bH

On Wed, 4 Dec 2024 14:12:46 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

> On Wed,  4 Dec 2024 08:41:16 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > The 'physical_address' value is a faulty page. As such, 0 is
> > as valid as any other value.
I'm not sure what a 'faulty page' is. but code looks fine.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> > 
> > Suggested-by: Igor Mammedov <imammedo@redhat.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
> > ---
> >  hw/acpi/ghes.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > index edc74c38bf8a..a3dffd78b012 100644
> > --- a/hw/acpi/ghes.c
> > +++ b/hw/acpi/ghes.c
> > @@ -400,10 +400,6 @@ int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
> >  
> >      start_addr = le64_to_cpu(ags->ghes_addr_le);
> >  
> > -    if (!physical_address) {
> > -        return -1;
> > -    }
> > -
> >      start_addr += source_id * sizeof(uint64_t);
> >  
> >      cpu_physical_memory_read(start_addr, &error_block_addr,  
> 
> 

