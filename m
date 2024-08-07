Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp192384dlb;
        Wed, 7 Aug 2024 02:34:54 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCW4niI5RWUJRd5FCQAQEqo5z4lLLv23+ALOkFxk14+xN+W+67n16jJBez/I1zURgkgSmX9pP2EaK759+QAjsBbTvyUpfmZh
X-Google-Smtp-Source: AGHT+IFcULzvhBwJAaUrOOYAlef9GUCUxNZSUiEM3lltj+8WmCSThEKqaSGO57Mvwr+k9K1TP2gt
X-Received: by 2002:a05:620a:f02:b0:79f:249:9f9f with SMTP id af79cd13be357-7a34efc90cbmr1970365285a.62.1723023293951;
        Wed, 07 Aug 2024 02:34:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723023293; cv=pass;
        d=google.com; s=arc-20160816;
        b=HJCGPBVh6pqEIpWTF7n+rkDyjm6+gB2sbFNY6PefKvrSk4XXfa0snA8QvPmuXBDLkv
         XYoYmMMxXGO9heJZ6uGqFDwUFALEBVxNFUWSH4ViFar8INVnI0IcLjqGiT/wvQInz1hP
         LYif9VRO0TO4xTBP7avGGHB0v8fv3RN6mzbLYJDCUguTGDHRHg63+yKr+Xx4G8Q/aJI4
         DnGG/JMVVH8tlN3z2V7d/XXItkubqwfuLLELaBk0ASfdvFxjcBv/w+XUhcXDwseoJx/Q
         w8W1il8WA9cz0U/l8GSE7q4A/qvh538DHnqM7CUB5drHeSJxVuVM6SHNi0Yg8Pn2+Apo
         OTGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=QoUZPoFKI4LnOEnaDkXOI7oFXCC63mWMGtjqL82qNZc=;
        fh=sk20niJjP+LyGcAC6rY5I61AlgNCIPpR6UIhxIWLYTI=;
        b=XuWZD0R7DBn7AbG3O5yoCzjbBnG0H5xY01CiVZMt/+/5osNrqL/DXtNZar68u7vduG
         pvzxeS0ifZLQtXCRXFJqsr8bO3uixMOTPaXAztNUfEpz3DyNfGYsvWqUFMrVSf9mofl4
         Ciow6fJZYqNhcfrfoGqWp6E7pyzcW3R3jJA0KnLDPDJ3CWEvny+vzvRIPJDAwPv6FpD2
         NeOySff8IpGyj2oT2M28L+fPkFmIANSJsWmW53hMYM7vDUogJwHhGj3zVHs+oAyDfTSU
         40YuQhDHIFDLlfYVrcN95P/SStUAdGu/A/idfFrZ946YW7ZWb0yizyLrbvr/lEAqCR2J
         SFJQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-277662-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-277662-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-277662-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id af79cd13be357-7a37887480asi110658185a.733.2024.08.07.02.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:34:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-277662-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-277662-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-277662-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B7E51C20E27
	for <alex.bennee@linaro.org>; Wed,  7 Aug 2024 09:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE891C9EC8;
	Wed,  7 Aug 2024 09:34:48 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD4B1C9DD1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Aug 2024 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723023288; cv=none; b=ldFdYPQpBuaTkk4CsWIUrGiu1SQZE6DXf77C/NFPTgT7sdhGkbyStKUIyfqUs6bVnIal4J6XxKofYbERT9mKjeoa555d4/gcB+F9MPnwfJruqNk1JScH1zYbhGIbzEt/zYth/oWZ7hszvne5yQCINwkM7q5n6xtg3WPfNG8KExc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723023288; c=relaxed/simple;
	bh=QaM457Vo8MRAqjQK4zcNBFVOASe58GTfQTmvnJjeBY4=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lRydQSKzXqcXWQbRH3YtMmR5jX0g4APSWmUgyBwIGwol/ErKlZx10cOtOhnYPs2F9XpF4TxxipC8IFSa93YcPv4UX0xxWq6XTy6b88FnEYB0UYfb5lGom+ew7BEQAFQm0bZs8QSU8V9JqYWXULhCU8Nll6TdavsuaAjFjM7Uwhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wf4hM1YxKz6K9Hq;
	Wed,  7 Aug 2024 17:32:19 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id C8B8E140A87;
	Wed,  7 Aug 2024 17:34:37 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 7 Aug
 2024 10:34:37 +0100
Date: Wed, 7 Aug 2024 10:34:36 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
	<qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v5 6/7] acpi/ghes: add support for generic error
 injection via QAPI
Message-ID: <20240807103436.000013fc@Huawei.com>
In-Reply-To: <20240807094750.6414fb2f@foz.lan>
References: <cover.1722634602.git.mchehab+huawei@kernel.org>
	<20c491e357340e0062b6ff09867c1661ed4d2479.1722634602.git.mchehab+huawei@kernel.org>
	<20240806163113.3bdc260a@imammedo.users.ipa.redhat.com>
	<20240807094750.6414fb2f@foz.lan>
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
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: KUczShY070n7

On Wed, 7 Aug 2024 09:47:50 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Tue, 6 Aug 2024 16:31:13 +0200
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > PS:
> > looking at the code, ACPI_GHES_MAX_RAW_DATA_LENGTH is 1K
> > and it is the total size of a error block for a error source.
> > 
> > However acpi_hest_ghes.rst (3) says it should be 4K,
> > am I mistaken?  
> 
> Maybe Jonathan knows better, but I guess the 1K was just some
> arbitrary limit to prevent a too big CPER. The 4K limit described
> at acpi_hest_ghes.rst could be just some limit to cope with
> the current bios implementation, but I didn't check myself how
> this is implemented there. 
> 
> I was unable to find any limit at the specs. Yet, if you look at:
> 
> https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html#arm-processor-error-section

I think both limits are just made up.  You can in theory log huge
error records.  Just not one does.

> 
> The processor Error Information Structure, starting at offset
> 40, can go up to 255*32, meaning an offset of 8200, which is
> bigger than 4K.
> 
> Going further, processor context can have up to 65535 (spec
> actually says 65536, but that sounds a typo, as the size is
> stored on an uint16_t), containing multiple register values
> there (the spec calls its length as "P").
> 
> So, the CPER record could, in theory, have:
> 	8200 + (65535 * P) + sizeof(vendor-specicific-info)
> 
> The CPER length is stored in Section Length record, which is
> uint32_t.
> 
> So, I'd say that the GHES record can theoretically be a lot
> bigger than 4K.	
Agreed - but I don't think we care for testing as long as it's
big enough for plausible records.   Unless you really want
to fuzz the limits?

Jonathan

> 
> Thanks,
> Mauro

