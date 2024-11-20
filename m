Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3985544njc;
        Wed, 20 Nov 2024 06:33:19 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWJrYlWPzRzzwkELM3wLYR7OEQJYNqHldF7TTV5T5jHSDsZw/83JhRwru9lYSLaR2JdSg/Acl4fhkCkTw==@linaro.org
X-Google-Smtp-Source: AGHT+IEwD9XRjIjccX0gJt/qJ459gOpG+WAt7TIhECOnh0AqUoap5IH/CfvHagbeeDjp38Y+nk2B
X-Received: by 2002:a9d:7387:0:b0:710:e667:1ca0 with SMTP id 46e09a7af769-71ab319be52mr2821310a34.21.1732113199481;
        Wed, 20 Nov 2024 06:33:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732113199; cv=pass;
        d=google.com; s=arc-20240605;
        b=jclqNGXfgWscHZMqLYT1fgPozqfeJ66WWAKwtUoRSbdoMNE18Ya2wgsxbTY6I6IHS6
         a2T+b/i8LKRrZFDHBuQrE3ysJ7+gFg5Xh/Ul5+d2yTijjEE7atCcDNJ1X7LmBWXkyIbz
         51tKp9DUnw+8CmGP5JdZFFbY39eydg4kQGEBWTlFrwULiPNtNtiEai4O3z1TXrrHa3VJ
         yPMSop/cJ0NPyqGDdKQd3E5WwSGmIfSw7e+fIDotlqyVbdQ10MHz2x61QqQPqgqhuLNI
         9bi9u5ZQ7dZhoaMiDpE+UEgS/P9g5iRMpgVAMmI2aLZW45o/DeSHx14Qh+R69uBnl7/2
         sEgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=P/j2b6kgkPSw2xX+OTUWKiVbbnCXtQn8Il5viywCT3g=;
        fh=sk20niJjP+LyGcAC6rY5I61AlgNCIPpR6UIhxIWLYTI=;
        b=ck1i4DuUcn5Vja6trYshF4/39V5rRDp/mBnPPinr0/znej8BjOlrGV9Wp3yjQ3QO31
         nrk/j61H8Ox5+2lSCbxzWwmHBacgmOrBGyHvyvVRxCO7OsLPJp4r+d/Cz/eT0e+jhfXR
         9k48SVTU9rqiEtV2Cu9lNJg/Ncoa/YeIZKCnaWtWoRR7wTlhIxql9L1f1LLA0m+bRKQW
         9DgNDG37FOGuJ33cTifgGvU668xKgKdb9R11IJrEPEsrkApvHuD3orKwZVvvH8UBLfmg
         HBYjfLdB4YJ3SoznS3voztzkx/QVpeyn7nFrQ+xGnescq9OSk0tentqyji9tKS8DWjhD
         5ZAg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-415890-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-415890-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-415890-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 46e09a7af769-71abaa8bfc0si72178a34.190.2024.11.20.06.33.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 06:33:19 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-415890-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-415890-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-415890-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 032C22814DE
	for <alex.bennee@linaro.org>; Wed, 20 Nov 2024 14:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C4F1AA783;
	Wed, 20 Nov 2024 14:33:15 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2031BA939
	for <linux-kernel@vger.kernel.org>; Wed, 20 Nov 2024 14:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732113195; cv=none; b=J5+ybhu8rYpmeba30p6EhRDPsuuza0wa9DrqDnDpD4MkXdn1r2teHPEHjuDOmg81ti2qPOUM7WRf1u2TQEKnnkMX8/QYhlbbIRgVryp34h/HNK32tJCwIezJwhmRyQ/1ODB6Jx96tfQTpPOe+bhCBru2qtZRGuJWv16zxe+QfQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732113195; c=relaxed/simple;
	bh=tpwHXt9OjnubS8VGjaLMRiwcCx1f7NKywEcpbcAammk=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uu4Jylg2BZv7OZNsN1V969GNXyZK3Ngp6sFv7ai9UZhuXaAWXAETS/Yx0EVyNC3Rdo4e8HVbAesLUMiJNZWR7i6o8fBEPJA8Wv6t8MiOBkJKRpKCFHN/fzXMnOou4Mdajso69DLohSms8ejG/EupXu4ZKz5ctVAtF8D09qUVU0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XtkJz1qLpz6J6q2;
	Wed, 20 Nov 2024 22:29:39 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id C3633140D1A;
	Wed, 20 Nov 2024 22:33:10 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 20 Nov
 2024 15:33:10 +0100
Date: Wed, 20 Nov 2024 14:33:08 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
	<qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 3/6] acpi/ghes: rename the function which gets hw error
 offsets
Message-ID: <20241120143308.00005c31@huawei.com>
In-Reply-To: <3dccd08b82755bd42ab61408d5d86b2bfe2f2f01.1731486604.git.mchehab+huawei@kernel.org>
References: <cover.1731486604.git.mchehab+huawei@kernel.org>
	<3dccd08b82755bd42ab61408d5d86b2bfe2f2f01.1731486604.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: J/dUbZQ61YP2

On Wed, 13 Nov 2024 09:37:00 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Rename: get_ghes_offsets->get_hw_error_offsets
> to make clear that this function return offsets based on the
> hardware error firmware.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
