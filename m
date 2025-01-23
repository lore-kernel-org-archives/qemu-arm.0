Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp65526njk;
        Thu, 23 Jan 2025 02:55:00 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUfP9XxNlTkRJ3ih09sVPYiuH70NPGIqLPsd4JxgVr4d/t6Eln8pVxnH3sSsj7aJFjPHrr4aNo79UxOaQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHnneLa3jtoyCQ/E3BvQ3alG22yv//kyFudBS4BDFoJhkHeZ/izLZnHVSCyRPGBpQyQMZ05
X-Received: by 2002:a17:90b:2652:b0:2ee:599e:f411 with SMTP id 98e67ed59e1d1-2f782d8cf56mr32181909a91.34.1737629699989;
        Thu, 23 Jan 2025 02:54:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737629699; cv=pass;
        d=google.com; s=arc-20240605;
        b=PmU5MrXYbbXDDWqHiPybqSRZKCILhZZHrqBel8pOGaRkr26FfrSUA4plXh6WobYPxj
         OQLdjlBwNCUzeKoRoWQI0zrcOm67WthiBbzwYwMNU+JBorsd2JWvQEYB8HGI7WNIKXUK
         17rw3dGmRAAm/YNJ6TMPtB1sowPEaB4ELqQwP5EFc3zBxkuQCxLRJjJ/kvYkX2hsTT7h
         WOAssAypJl+btIMpyyR5BFOy4jj3krgqjZ29PYHNnX1sUkMiBptuQe0hqJ/80MYTGZW8
         FRj4+9N/eTyYw7VVrOfNpkQQMkKiACadubQssCy2EsCk47UZ2uSYOKL1H2UOpRN2QsGG
         6A4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=YbatBr5TDlX2sbCqQEWdHYVb8IRq0VhP5bH/+43i4IQ=;
        fh=GElvAtW5krGxQdrJKAP/tnSiBEfXCwHwTSAoO/mYfiU=;
        b=Dd73yeMpwLw/pW3lLkZhxbYVIfNszaJh99iQef4cYCFe+MSPR15mfTydKXvy1Bu1Qe
         3HuKd5I6dK1FPOuDtQ5cnGsDCcpEPot74UPwdafKoWh8ZnMh65Toqa3ZqkW3oacmaD9h
         jYFjV1MaWI+cRNPIVM/ajKt8KOrS7fjPPUMdSVy1Tk7DuNOvxi9LMulADtv5ecbG2WC0
         KyjJaQafTHTDkM8o1Ne5dIl2ozsd6AQFpDobTT5rgHJXsy94EAeHpqTkbbNlbG2uqImm
         RlABVUZ/Ucn3A8Kj0KIPGF0ldcHMsb72I5+oZdfxaVmgc+HkS4eRPhJGrDr3ro7Oca/4
         pnnA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486550-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486550-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-486550-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2f7e6a7aae9si4797410a91.52.2025.01.23.02.54.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 02:54:59 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-486550-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486550-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486550-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 942633A1345
	for <alex.bennee@linaro.org>; Thu, 23 Jan 2025 10:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B36D20DD68;
	Thu, 23 Jan 2025 10:54:54 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430B11C5F14;
	Thu, 23 Jan 2025 10:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737629694; cv=none; b=VHzIDbQ+GLaWKp/QIR5vEqvaO0NPRUMqyBynXbOIVEfy6ah4TQrPWfI2zgnQkT8RATmCWbVQszO4EOvCeR/362pt0WW3WI5h3JvKb7Mqf6/KwiGWjVZFo1j1Y+dmgAl6g4WVeXZt8RW7rkgCbGJpF4plIqCN3tJaIPdPCgUwQtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737629694; c=relaxed/simple;
	bh=L8BSsX4KBPmRfcbrxMBUiEQEaiS0qNJL96y6+8Jhw08=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i86eJoGez5iWV8pGpg1v96/dRmQVmp2ppg3bTWvE3p12u8RfWVahYoCboDR4ySsP77UOtROSTL80Ec0U2moAKIVNkacrmzhrmD7W0pHusN0xghIv9E/qYBKzdo/SvtVSMTOfLY1K6oTXL4UfmhGRkZzRipylSuL3pHYCzopd33w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YdyTJ6wnsz6M4Rv;
	Thu, 23 Jan 2025 18:52:52 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id DE6561404C4;
	Thu, 23 Jan 2025 18:54:49 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 23 Jan
 2025 11:54:49 +0100
Date: Thu, 23 Jan 2025 10:54:47 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
	<gengdongjiu1@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <kvm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 07/11] acpi/ghes: Cleanup the code which gets ghes ged
 state
Message-ID: <20250123105447.0000585a@huawei.com>
In-Reply-To: <200501cb372d5121c44128a79b8775e529dc46e6.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<200501cb372d5121c44128a79b8775e529dc46e6.1737560101.git.mchehab+huawei@kernel.org>
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
X-TUID: 3IBIQ4KzomdG

On Wed, 22 Jan 2025 16:46:24 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Move the check logic into a common function and simplify the
> code which checks if GHES is enabled and was properly setup.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Seems a reasonable cleanup to me.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

