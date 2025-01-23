Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp64595njk;
        Thu, 23 Jan 2025 02:52:19 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWMDON1mgnbAVrsUpZ1UmT0RL34Tkk5kQ/FnJE+v2OekByXUMe6uXkxOx8acHj590OUbMFaBCtK/ZJz3w==@linaro.org
X-Google-Smtp-Source: AGHT+IGFKU6c1/cAh7MRSZN8V32Ls2uhSMafQNR8P5q0lrtFa00wA+7FZtPblx599EwdpX1YcgsC
X-Received: by 2002:a05:622a:87:b0:467:7401:ce95 with SMTP id d75a77b69052e-46e12a58fffmr403342281cf.21.1737629539036;
        Thu, 23 Jan 2025 02:52:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737629539; cv=pass;
        d=google.com; s=arc-20240605;
        b=J0B4Rr8mX8SqNPmQvgq4R2yu02o/0Tbc+RCEyDVUGSCJYBT07SPhHYMDtCTw2Q417t
         VwAGpuH5j4dRtZyi/7yQVDL2nBE09sz/3w9tRNzI2sMLt1fXhRHhYGka9uywtmGhtAp5
         GBlVp94k6Qv3rIURn+PfDqc1Ju9gRUGq1uUheBBF+gOX3be+FCJcXq8yMu8nw+SA0GLs
         CDUSMkcUdxNZDVQ9j/8OpPzQpwWidubuMzQHk88fBlTi77RQ5c6NP9O/99WhX2rgA8ko
         pHdsI+aMZpSxsT59JCsxoeDok/1xVQNgAzXb8T0iUYwhjM4CvYES7zTH5iOdF8K9EdB0
         fP9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=SI9gplGhKHs3Rs+5j6Rnh3oilRXzKRv3zXvUyNUzsbQ=;
        fh=WpSDcLP6FO2DmGFL17KedSbnYHzQLVBFiW9uatSOa4s=;
        b=KsID4fcLvJ2i1SzJDDvPak2vmwQODZ0DVwBlkLlDJVClPj92Nd1wDuS0k7YIgWlnDl
         N3osH6MFvYeDiV+sM0jjsFKfZkpp6gyiTtv7XmtowKcrVLZkt2ZlgBRMlBZdKH4i65ud
         WpnRPMZaA+Kuf3HWezxFpBZHNvc0gJajVYC7ZLyPJb1x5zBN4qFxXYZQlTgMaeltPdL/
         bytxVnPDSI6ZsEzfbabsmKiH2OQUcThPQMXZ4se9JPUuiFoEFPdO352Fr6GaEUHbixl2
         k3NieKbPZanKFqKKmGE8sdq7RiCK020UXwuLpTs6nUNteZ7V39pNzMlQs6fC8LUui7NT
         fzmQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486547-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486547-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-486547-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id d75a77b69052e-46e1040a1cfsi187996031cf.233.2025.01.23.02.52.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 02:52:19 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-486547-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486547-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486547-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C15E816D375
	for <alex.bennee@linaro.org>; Thu, 23 Jan 2025 10:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E94D20DD64;
	Thu, 23 Jan 2025 10:52:15 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D352D1C5F14
	for <linux-kernel@vger.kernel.org>; Thu, 23 Jan 2025 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737629534; cv=none; b=Dh6saJX463sT7efHWFedwi0QitT8XDM3Xbo4fo/xp9QglDrHIWd2XaAcgIKnNe9vyNcvc8XPgV+7fjbjHL60xo4wdpAe+Ev2BzdKOt6FFmyjrECmjeUE9dmXzTQPiTNqwJYzN7ZpP0SliIkzqx+9MU+Q/iF59tyIYimqsrb3gPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737629534; c=relaxed/simple;
	bh=MNzOwmmdcXiJ5a9nfR2h/SLjJkFy6wLbqxPlWpv8uD0=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YjDiQFcAKASDPNxI+1pKx5IcPnl4UyWMVHPPLp5221f2LyeEVwBdj7wKIJfrp+Tv/7bptWuVt7B0BdemIH+xu5dgGWJqMbUw/4uGf27l5Kx1yO4Jr5MN90tRyV3NAkz0SAgOzY8ipluxpbCNBiNWbglABJkfnpglhaMTcSlYmUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YdyQD4Rsmz6M4Tp;
	Thu, 23 Jan 2025 18:50:12 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 93D43140119;
	Thu, 23 Jan 2025 18:52:09 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 23 Jan
 2025 11:52:08 +0100
Date: Thu, 23 Jan 2025 10:52:07 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
	<philmd@linaro.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
	<gengdongjiu1@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, Peter Maydell
	<peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>, "Yanan
 Wang" <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 05/11] acpi/generic_event_device: add logic to detect if
 HEST addr is available
Message-ID: <20250123105207.00004d76@huawei.com>
In-Reply-To: <556c19c1f3fa907c6cc13b62e060f6baa6faf2cf.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<556c19c1f3fa907c6cc13b62e060f6baa6faf2cf.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 2RjveT5QdjPK

On Wed, 22 Jan 2025 16:46:22 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Create a new property (x-has-hest-addr) and use it to detect if
> the GHES table offsets can be calculated from the HEST address
> (qemu 9.2 and upper) or via the legacy way via an offset obtained
> from the hardware_errors firmware file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
