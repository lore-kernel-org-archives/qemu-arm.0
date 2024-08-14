Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp462030njf;
        Wed, 14 Aug 2024 05:36:04 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCW1Y9PkO/sfAyJuzPVssTXpf+MA9Rd3ofzyDjxUKV3TWjQmb5t6SdekKRL1e69TJhu8d9zlwBlWRwaaul4+pe4Fp0KNyUYA
X-Google-Smtp-Source: AGHT+IFWXu53McOjfgqnwPNHjU6RjNtctAJVaKJHtRRz5VTx8qVsB1NGP4IyLVjnB9yYnm9SELXg
X-Received: by 2002:a17:907:9629:b0:a7a:bb54:c852 with SMTP id a640c23a62f3a-a8367058e9dmr163448866b.61.1723638964584;
        Wed, 14 Aug 2024 05:36:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723638964; cv=pass;
        d=google.com; s=arc-20160816;
        b=g8cGddBRqNm78FUc9vChwsq35HQEhSrfx+DuzZwlHPXYD7YFhWpSBuBuagyucrmAnQ
         m+paMjNpKWKqLijforIyF02TJcMCWmA/LocxXjMH/tdf1VxSFcAUc6fNmyvnQTtLIAlE
         7CYtTTZqqfuVK5kU1wIE9+orsLk89rvKILlmuhFgxop2U4+nu+mlKVXq5z6bmrZ6QGyO
         jUPuNS8xPwebjODqLwbnU1qY0KJb5bgIWaMsdwJExUCydfvxV79u5VGxZUUW2mu0ereU
         yC9Te82zvRfIBXmDEyN6wKZ96tYf4UHkSgIIjwK+lJkiZRUqv4fMcEHEmHcsSIXxpQ3A
         NWoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=FDQE8L/HXAOQ7U4VU6nFK2bsSb1KkFt//uuj4xhhILk=;
        fh=AnhOPK4R4NLeeBDYdO2NNJvYbFR0oQLdj66r/ooBqcc=;
        b=P759EB977JI5XV/ImzvP4VPGW0JX2+YAhpbd9sTQerqqQTyqxJocnrhPw2SI8lsuFK
         YyHEOCpmTOK8J+YZAVJAHo8KoKkeWXzjQIgnH4gPlo798gdkzGrA47aW5xtLElaxT5I1
         HE2fEuC38eHdx5CRxo3FSRuOD5pVGDxxMOWlJ4E0nD46sQfZupzjU+XapBJY1lRbnZmP
         sZrE5/CnDjJzwvS4RBkJp0nolE61JzH1f6qI3N7b/N5PyHHJf7tOgo/qNF2tY/ZbEYkF
         5d5BHIuFC8kl9RzzlCPEE6uyOnJKwEEQmFBb2yR333gElzcO+tFdMWnBE8qGRSxs8sZA
         +b3w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-286437-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-286437-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-286437-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a80f41990f1si206894766b.897.2024.08.14.05.36.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 05:36:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-286437-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-286437-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-286437-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29AC61F21922
	for <alex.bennee@linaro.org>; Wed, 14 Aug 2024 12:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4E81AE049;
	Wed, 14 Aug 2024 12:36:00 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183481A00F3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Aug 2024 12:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723638960; cv=none; b=pBAIUbxSbkbDnugTFOmk27g1Z3jt+t6xdl1o01VX/3YvmhaKc22nxPqusdA7PqoikU8McNYhonWMfawqKM+RPoA5h2DTgVP6MQ9frdo59z1sq12rNjzuBuKqNMmDgs1gDbGXrlg0YdxsWxr4UOfDFbQaTyyXfpzYpCFXAucnzxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723638960; c=relaxed/simple;
	bh=9A1dC+U34Fj6mcTl77qfGMMR3YANBJ5yWXuXiFk4Tfw=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s42EdjfAdmVmwygI3egNEQVcBFDZsW+X7B9OSi5pbqMFDVq9gbhnfAHkg3om5UP/HZk5psK7M0FtkhClARd3hmm+EAZh9S8XIPBYO+O2laWcM859VVX5qAv0LZgg1Th23TzF4dV+xEuPaNKoNFv3j9Hm9i1CdYVi6K/2dmgnpIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WkSMC2sfzz6K6Wy;
	Wed, 14 Aug 2024 20:32:39 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 6C65B140DAF;
	Wed, 14 Aug 2024 20:35:55 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 14 Aug
 2024 13:35:48 +0100
Date: Wed, 14 Aug 2024 13:35:47 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Shiju Jose <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Igor
 Mammedov <imammedo@redhat.com>, "Peter Maydell" <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, <linux-kernel@vger.kernel.org>,
	<qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v7 02/10] arm/virt: Wire up a GED error device for ACPI
 / GHES
Message-ID: <20240814133547.00002385@Huawei.com>
In-Reply-To: <41d72570cc4e1fa3239ebf61d91240ebbaba838f.1723591201.git.mchehab+huawei@kernel.org>
References: <cover.1723591201.git.mchehab+huawei@kernel.org>
	<41d72570cc4e1fa3239ebf61d91240ebbaba838f.1723591201.git.mchehab+huawei@kernel.org>
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
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: BCKV4ruRQfcc

On Wed, 14 Aug 2024 01:23:24 +0200
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
Not sure I said, but this is much neater than what I had so
I like this a lot.

Jonathan
