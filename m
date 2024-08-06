Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1104320njb;
        Mon, 5 Aug 2024 23:09:52 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUiqMhe6EIWMy9gMV8COZrZ1nnFpG5LZKRTv8MKqBqeLuN3Q7BCsrxN6a5IVhfD4obMIeH2gs/v14Kp1jhetoBqw5VX19GY
X-Google-Smtp-Source: AGHT+IF/s/U9UHqSI/EHAX30MZRfkIQ6VRS+y4gOVFUIn7UjAznQhi0bm9qFu7KMXZlO9iUyYlVP
X-Received: by 2002:a05:6a20:9148:b0:1c0:eba5:e192 with SMTP id adf61e73a8af0-1c69958619amr15351317637.27.1722924592502;
        Mon, 05 Aug 2024 23:09:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722924592; cv=pass;
        d=google.com; s=arc-20160816;
        b=tabeU5rDFtFY+WSEX4C6yHMwuaPMf4An7CG1//UIdMay/mhc0Gn+SpFYf3/MolSYPA
         Rxl7l1qzzWSqmCxYcAuFrnd5e9duPZQzvQI1dpadKRKMz4v3hLvEL7odqSHhpZtjVuIe
         25OiBAXRLf38KOzqMUhZPl8Koiq93mCDGw1gf+n2cHnRLiSrL3mq1eJxzfCRyLw5wkY2
         FOG+BoN+T3zm84J+wYbhJfBGAYttpANl7KOaRP4hj98XTtomCeMpsaU8E+mKihV6iOhv
         SAfQFR+RR8p97DVPJ6sKGpeWYmfSa+09pQ+CRJYnXZ6HOQf0vP/hn1jr4EEjAPrMzn0p
         /7yQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=BH1sScnNqMNyX1AbylN0b93bavptjei+M59HnTNew28=;
        fh=WnQIg7PXk8dbduQRU8/0B2CcknhyYQZi/RwroJryHPY=;
        b=sOCisR208kccyu0ggasWEmG0ZeqsEy6koiA7OxvxK8vKEwVBokBTLxSfQX6nXpOLCX
         Kr/ENXxTzID5AYVUh3IDo5YjP0MRIxbwE3Q9vqVbnA0B4I6K3IYqRQvETgeqrkB8bgwZ
         ZnMP3bwGvkRn4/pXr2h8wXMcdDt/6rHipBbjwGTKyXzrUPT6KDPy2E3eB8RuKiiHye6V
         jqgMzfUnyoB9+2imueDn31peDAk3uo7kH0whcX461soiut9HGPqZgezc/eC/EjPF6CWH
         v1HdXZsPMKJ+MsMVtv4NCm5o0T3fIeQg0dH9pkmPZMsf8gZRDoWnVf4I/n3hXQW9gkoy
         KkGA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=OSzKUNwy;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-275734-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-275734-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-275734-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7b7654bfc4bsi8896005a12.544.2024.08.05.23.09.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 23:09:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-275734-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=OSzKUNwy;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-275734-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-275734-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BB96B20DE5
	for <alex.bennee@linaro.org>; Tue,  6 Aug 2024 06:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F89B1BC9F2;
	Tue,  6 Aug 2024 06:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSzKUNwy"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509E91BC9ED
	for <linux-kernel@vger.kernel.org>; Tue,  6 Aug 2024 06:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722924574; cv=none; b=gkl61hHB/JvjZoEyXOGRRJAy1WM/ifXAfCD7N0YYKlkncekfm6a4+KwWskk2Z63x08Uf6hLBvim+c8qajBz+vv4L1ehS1ASYVBBAzjIvZO+u+z2Ak0Y0ogxf4la/j2U7W0ka/MRBnPZZu/1qyYDv4yxW6QXigzOtu6eivJTUT5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722924574; c=relaxed/simple;
	bh=WdUQXtCTwgFQAc0kxtSdRM0UmI9ZDfDvqTso1AuHq4I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JdXteDFBvAQRpYE7AakaekUK+XahqMM+QJ6o3az8UnLvat69WMt9lg5bv4v9O/4flnjNh5cXS6eWj6iCyIv991Ab3f7qdaIG6wqacL3iZ8aG1Sp90Wc9vIMmEyh2lY7cOH3MeU3UKNVQguXQajQHt3ANdXcNfgcNBUT9N4vSNSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSzKUNwy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38BAC32786;
	Tue,  6 Aug 2024 06:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722924573;
	bh=WdUQXtCTwgFQAc0kxtSdRM0UmI9ZDfDvqTso1AuHq4I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OSzKUNwynmDwBT77gK1GM8p0fXbTxR0IULEdL5T9b0U6fy5Wg7cEisPBWbUQfnU96
	 5cBgNyFVd2YfbHFKQKNyGXnCvPSiwpUGha9dg8wKTayJIr6v/8PbISV7TTWc28u/Nz
	 shI24RkQqr/yU+uwSlSu08flS36BB4zVcjohiOkj+uW3HaL0tsle4I1HE3sBMkZ2oK
	 sUPd5MdB0/YWgDOBmyXnVWuaLq1BqV2lPAUJS08OekqOPsH7uvBKNx3dkXqn5IoZ58
	 hGEmH/2+RRIXH2/03lY8o05eNxSLar7nC6ds2cLA82CsSLf4xjPlv3FbvercrK/bls
	 8BuzLx9GZb2bQ==
Date: Tue, 6 Aug 2024 08:09:28 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Shiju Jose <shiju.jose@huawei.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 <linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v5 4/7] acpi/ghes: Support GPIO error source
Message-ID: <20240806080928.5a04c550@foz.lan>
In-Reply-To: <20240805175617.000036ce@Huawei.com>
References: <cover.1722634602.git.mchehab+huawei@kernel.org>
	<5d53042ebc5bc73bbc71f600e1ec1dea41f346b9.1722634602.git.mchehab+huawei@kernel.org>
	<20240805175617.000036ce@Huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: Mw4QC5gwbXba

Em Mon, 5 Aug 2024 17:56:17 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:

> On Fri,  2 Aug 2024 23:43:59 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > 
> > Add error notification to GHES v2 using the GPIO source.  
> 
> The gpio / external interrupt follows through.

True. As session 18.3.2.7 of the spec says:

	The OSPM evaluates the control method associated with this event 
	as indicated in The Event Method for Handling GPIO Signaled Events 
	and The Event Method for Handling Interrupt Signaled Events.

E. g. defining two methods:
	- GED GPIO;
	- GED interrupt

I'm doing this rename:

	ACPI_HEST_SRC_ID_GPIO -> ACPI_HEST_SRC_ID_GED_INT

To clearly state what it is implemented there.

I'm also changing patch description to:

    acpi/ghes: Add support for General Purpose Event
    
    As a GED error device is now defined, add another type
    of notification.
    
    Add error notification to GHES v2 using the GPIO source.
    
    [mchehab: do some cleanups at ACPI_HEST_SRC_ID_* checks and
     rename HEST event to better identify GED interrupt OSPM]

    Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
    Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Regards,
Mauro
