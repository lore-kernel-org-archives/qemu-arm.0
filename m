Received: by 2002:a05:7022:e994:b0:85:21:bd5b with SMTP id py20csp2009878dlb;
        Tue, 6 Aug 2024 05:59:10 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWDPPsKpfDLhGafwla0zfOGzpsfXQM2BAGfswIibs9JYapa6bvd+QsvOvKMrRosf6PSxGX1n24eoqfWXq4Yvolx6t/xJ8+R
X-Google-Smtp-Source: AGHT+IH/n04umBMGyoa0DzIVqecMkesnQbRK1occzZUERxPPxlYKBQA6qftV14Csj8CZEKLvfzFO
X-Received: by 2002:a05:6902:13cc:b0:e03:a3ac:fb75 with SMTP id 3f1490d57ef6-e0bde2622dcmr17332972276.23.1722949149786;
        Tue, 06 Aug 2024 05:59:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722949149; cv=pass;
        d=google.com; s=arc-20160816;
        b=L87vjORkJFlOWl6Zqgsppk7axe6PkKRjLpPJyPKPD+/uDIbbybtlOI2tIGFXaxSp34
         9YCm8JDSJcqzha4d6kTZW9hvRba7W+KQGOd9CCYhjWMUhlfr5K1ld+v66EuyyDegxhUl
         bqbjRMvf+8dtbTYRUhJiwK8Ah6IhrHcaD6nlSvcdV6IFOfJb/omkNttoJufkTRpCyNCq
         mc1wVoHg5+CF/AHzG/nyPHYXIAH6pgqpQUEub8HsaUQ7RAdc+kAkR7gtsg+BV3sNqm0m
         AhC/ilv5oXKzobFEAhP04hpfR27XfLXzsCLLfXPrOjN4k6mln/RMQCpjId7jrqTkdL2f
         6Llw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=7cybqaC4Yl+7OCMNP90a6epS8TlLPjVPyKC+UefgheY=;
        fh=cuOXYuT2vxTrAxtAg0B1z7j6kE1f5xHaYl1HcUk8eew=;
        b=fU4EdB8s+wq30/bmLCuIO1wNFLXEU7lIsykULZwA8gFJKOroFXPbdemxQ+SZrrLoJm
         +FXBxmzMJ578t/+3Vzol5tIFTpmzba6jwLLq8WYf/+mykYBkWEYx9e1k783gvy36ozF6
         w61+U7mkPvIW5jhIffb6OJkr7bCh1YvCUhoZTQX7U5YF9fpOn5/lf2JOwULr222K7xvx
         OG7BIYqBn4rIL7plK2OdA2noQJLPgsmxGqywbUrVOEIv4g7hUgrlNcrW635YjLju6RyH
         66KqXnaNUjJZatZSAb7VhmUU1dJ6UpCZKkOkRF4edL/Cv+4N48FXlsGnXKworCXa4Tbj
         2j8A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ep8RaX58;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-276196-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-276196-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-276196-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id af79cd13be357-7a34f78b73asi1231074985a.655.2024.08.06.05.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 05:59:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-276196-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ep8RaX58;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-276196-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-276196-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 713D91C20C9F
	for <alex.bennee@linaro.org>; Tue,  6 Aug 2024 12:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD7E1C4632;
	Tue,  6 Aug 2024 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ep8RaX58"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1851C462C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Aug 2024 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722949145; cv=none; b=rLiBHyPEBMLhUlC7xjm8anyBc9wd/CAyfXHEXPjV3IhtXFgrpJ0J8xvUklxBL81urHntTjE+YxO83EhZyJvJDHU+EoZMXwI9maICRAiw+rXozupxs0froozSaZNqZITvjbVeeLtLQpbOotKfYQDMu0bTf+IRLk+aGEf3EAFNVEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722949145; c=relaxed/simple;
	bh=WRTEl+sMiGldjc/6bXsqZRJ/sl8EcbB0pjjcgi5eOnM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X9RlOqZ+MpiVTm8Ms5+nc1Vf0lnqdmzF2mxBf894oIm6U/oFshl2pJFKYlCYFsZM8YT8YnNbexfFOAZg4DhGdhUYtTVm5F7wLfVdnxqz0bKiB5j5x3ucwVV7Nzzq4Zz0iG80gZU0V8vqxbPam42ommEW+XjvdmTQH/Go8WjLmDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ep8RaX58; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED608C32786;
	Tue,  6 Aug 2024 12:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722949144;
	bh=WRTEl+sMiGldjc/6bXsqZRJ/sl8EcbB0pjjcgi5eOnM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ep8RaX588umdUmUXLx5Ecl9eEvX47YNAmIbVYHbQTjddP7hhN8RESSLm8qBqTxC2a
	 k04/3yPcH8nLyiGq5pVGelazPggWt2NSyeVNfoQ3swNmK33MgaD9ZVCYC2Y6xPPZ0m
	 f5wpcsjveio4ADHrQPIgaHAugiXHmzHhWYBwgV3A/8L/qMKGGBL6Td0f866TjjrY5q
	 9I7Sl2im7O/9/+nDA0Q3dP2yYghsWpfxyTkJduOG5KzpW0Ug9/ddbVCI64akiIQHxZ
	 UhmAixa1/lBNLzqpKl+/OgmbXLzzLAn1+oZ1C7pFSZWvo4szdCO2IsYZD8g89Fu5/0
	 c7VTb9knXrq7w==
Date: Tue, 6 Aug 2024 14:58:56 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Eric Blake
 <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 5/7] qapi/ghes-cper: add an interface to do generic
 CPER error injection
Message-ID: <20240806145856.106c7ebe@foz.lan>
In-Reply-To: <20240806145153.0e1a70a9@imammedo.users.ipa.redhat.com>
References: <cover.1722634602.git.mchehab+huawei@kernel.org>
	<51cbdc8a53e58c69ee17b15c398feeeeeeb64f34.1722634602.git.mchehab+huawei@kernel.org>
	<20240806145153.0e1a70a9@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: XiHbafIjh+kE

Em Tue, 6 Aug 2024 14:51:53 +0200
Igor Mammedov <imammedo@redhat.com> escreveu:

> > +{ 'struct': 'CommonPlatformErrorRecord',
> > +  'data': {  
> 
> > +      'notification-type': 'str',  
> 
> this should be source id (type is just impl. detail of how QEMU delivers
> event for given source id)
> unless there is no plan to use more sources,
> I'd just drop this from API to avoid confusing user.
> 
> Since the patch comes before 5/7, it's not clear how it will be used at this point.
> I'd move the patch after 5/7.

As described at:

> +# @notification-type: pre-assigned GUID string indicating the record
> +#   association with an error event notification type, as defined
> +#   at https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html#record-header

This is actually GUID of the error to be generated. Perhaps the better would
be to change the above to:

	{ 'struct': 'CommonPlatformErrorRecord',
	  'data': {
		'guid': 'str',
		'raw-data': 'str'
	}

Making it even clearer. In any case, this is mandatory, as otherwise
the interface would be limited to a single type.

Thanks,
Mauro
