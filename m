Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp66157njk;
        Thu, 23 Jan 2025 02:56:47 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVBEEfZwUcOnTAgIr6QlxjHqbaQ228Ic+DhHX1Arv/0yLKCKb50NHktJaGEwLCPbLgs5ok5Ii33FdE23w==@linaro.org
X-Google-Smtp-Source: AGHT+IFcHTcUtCIwj0xn+cTuQ50Yglfnv5M6lfoBuEW3QQoxvZP3BlAj9HqgwChhyEVsqJ5nf8gx
X-Received: by 2002:a05:6a20:8424:b0:1e0:c56f:7daf with SMTP id adf61e73a8af0-1eb2144d508mr36863595637.6.1737629807496;
        Thu, 23 Jan 2025 02:56:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737629807; cv=pass;
        d=google.com; s=arc-20240605;
        b=jpmNOOKFpsYxJgHcQFBXAipI5Sk9+1Iq7aA/AL0eTdSykAI6ZK18eyCLFiDC/JutV6
         JBvqYcqJwIXypnCdBP8BjGSns6ik75DL332Mycsk2JfCEIWPWWMQXvZ7LIytFTUk86Qn
         O/pZA54RkmASKPIuC0YO5OBkc6F+gD78wZEt87oMJCRshAAAhEEishe5r5DXrucIVgwQ
         vSin/iM0ZHTEHwwI2qZ4JaT7sZC0tAJ5vceD1+RH/1sVPoNrzCfAi+roxTep6Ic8OAJx
         EWb8V9EUVoPNkGAPfY0HBt0FWfL1lQAhGYO6Tmeh9XmOymXE7OAkVSUweZKsElf4UFAf
         W9PA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=DX5ynsZDmGzBA1jc4+z6GoXheeqWxZCf5OBwkq8QOHA=;
        fh=2LiX398xdcISWgxg18G65pqKf4R46cFasj+lMeqo2eY=;
        b=NEZ5uMvk1UgfB9hJBjOdYVGpGr3EHpl9nwKt5tnDfErGSwtaKmsxyHvhC5pOlvr9Ur
         chtT8fUQTOIs6lfpOuScLTk3BXJctE7YAb0oRScg1Dop2kcap7iQIpF/F9LPB9aUedte
         Mth5S9Oqt8LYiGOh9VMc9CK4TY5Z3YfOi3Wwmp+eBS7sq5oe2HXRuMDDaxyA0OBPknoA
         1g5Y99tWn55fwuOs2DdyBNA0QG9/jXJUM8sYlVjyDT7gt0IU8+urt4Wk/WTVziVSmS3T
         pJTiQCim8PThcozuJvgTxf9+Yl/pb6yGwP32ssQ+Sf13vJkXc4vokk0CHP1vGWiALaRz
         iYAg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486551-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486551-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-486551-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id 41be03b00d2f7-a9bddc9dc89si18667987a12.559.2025.01.23.02.56.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 02:56:47 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-486551-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486551-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486551-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98CD87A3BE4
	for <alex.bennee@linaro.org>; Thu, 23 Jan 2025 10:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92F920DD64;
	Thu, 23 Jan 2025 10:56:39 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F041C5F14
	for <linux-kernel@vger.kernel.org>; Thu, 23 Jan 2025 10:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737629799; cv=none; b=uzi5eieQ/gdxG7DwOmPAMWlqxNBhOOUQRwwDMYxQCxRwkTB0Dxk9w9ngYgVz8GXdls5eo/jhgDzo/zV7SX3KYs5hBPnl1fU+VbxMHOorOgJ7rBRjMfuOG2knOPAI84K5MFAmON+DwFT/Mun92wQKONy5pW/SdKpBSyGhGutDxAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737629799; c=relaxed/simple;
	bh=KU5IP6K2+roSCDFHc0Dgt+N3Hh/L8O8GYuDDOHxLIGI=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j7vImThAvfDfQ8+QiEASNmj0Dv6cnpiIpT2ov9YqoLsqJb3vtYJPkxoXefSJta3fo0SFiwoO6YBAG9ZLjPcTDcGUVSQuXeHiQyrOsiKNEUT2PJvWRiWxVEpNK/cUlXh2Od5apTuxu4jPy5veYbZeMOOEgH05awmcehpGefBa380=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YdyYC3khTz6JB7h;
	Thu, 23 Jan 2025 18:56:15 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 059091404C4;
	Thu, 23 Jan 2025 18:56:34 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 23 Jan
 2025 11:56:33 +0100
Date: Thu, 23 Jan 2025 10:56:32 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>, Peter Maydell
	<peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 09/11] arm/virt: Wire up a GED error device for ACPI /
 GHES
Message-ID: <20250123105632.00007d7a@huawei.com>
In-Reply-To: <c3f4777e308492a8b5a2c27a9ffada3a01df9680.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<c3f4777e308492a8b5a2c27a9ffada3a01df9680.1737560101.git.mchehab+huawei@kernel.org>
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
X-TUID: 2YOBIUptz8Li

On Wed, 22 Jan 2025 16:46:26 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Adds support to ARM virtualization to allow handling
> generic error ACPI Event via GED & error source device.
> 
> It is aligned with Linux Kernel patch:
> https://lore.kernel.org/lkml/1272350481-27951-8-git-send-email-ying.huang@intel.com/
> 
> Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Acked-by: Igor Mammedov <imammedo@redhat.com>
> 
> ---
> 
> Changes from v8:
> 
> - Added a call to the function that produces GHES generic
>   records, as this is now added earlier in this series.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Another bonus.

LGTM otherwise.
