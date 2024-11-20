Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3978297njc;
        Wed, 20 Nov 2024 06:23:00 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVBWjoJ7bBW9xRgRQroGlEeGILediOaZn/ihUM4P3Gc1IZXjsHevUgagvOOWen6wdsie0if+DSYLC/wfg==@linaro.org
X-Google-Smtp-Source: AGHT+IEFD9AFB6/P7d3M9ku1MI8NPeqW3wlXQZ2YicDmx5GCwCh/B0r0lukCHaOAJtHulrhHMsnY
X-Received: by 2002:a17:902:da8d:b0:212:b2b:6f10 with SMTP id d9443c01a7336-2126ae5b86bmr39214425ad.8.1732112579787;
        Wed, 20 Nov 2024 06:22:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732112579; cv=pass;
        d=google.com; s=arc-20240605;
        b=PMnTbeU117QYx96LH5Mw+qSa6VfZFcdgBYtApD9mXjmr2RKTEsebSxqiExZddguq3O
         RM8nzxYtkMRbG6It0LzFvUrMKJHCuMqKRJQZD//EaZkOHZv/W6viSqRcfHBismPbX+9E
         g3Hqrabqg+eLZI41neBmd/tBClqjNjlxi8WwScApwORwbni941TqcOBaoo+N7ajmayGL
         6R/SP5vwOFb4fvy81bWsLftMgBQnD/UrtSeBfV4dvaobbPGyqHCl0u6d8AN9CmNnAw/T
         KuC8M6jXisMqQOLTGXHDuSxvmGSs+htTY4nysmCNN6Kp35al4wzRKqwhMbrULdH1iQ6Z
         DOYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=o7bYiaPMQNMbx1STUVudPbqe/Jf1tpecLDo5bQEts2k=;
        fh=sk20niJjP+LyGcAC6rY5I61AlgNCIPpR6UIhxIWLYTI=;
        b=i/EJo1+DfVYw21E5Fu1jmdNG9Gh6yol98hhh9MWocvqZnquJ42yxDP8Y68b5Wd6f3e
         UlSipOshMpmHlvk91cU7VOFqaH6QBq4w+fU/ufUr9mfL8DckaLNdZ/68iI/lQSSZt+KH
         q2epcIHiH0nT5a13+wI4TRQQ1LbS63qiaVo5ElcYEGu7vs3NSnb+6D44K+PROT3p2hmG
         jKKa3iBF9KHAlLgLvbnMUr0QWXJhkj02D9ZFSNjNWBbmutVeywBHVeyqoFrEk4sJ9ciu
         OLQHgua7327Tm30ckl0uneJht6BnLlzN7zdyo0EUsTUNSQp0Mg2q9s8G4QfAhfL8pdUM
         tbCw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-415875-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-415875-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-415875-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d9443c01a7336-2125d5f4cefsi33811405ad.416.2024.11.20.06.22.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 06:22:59 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-415875-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-415875-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-415875-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55341281AF9
	for <alex.bennee@linaro.org>; Wed, 20 Nov 2024 14:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472DC1684B0;
	Wed, 20 Nov 2024 14:22:55 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B1B174EDB
	for <linux-kernel@vger.kernel.org>; Wed, 20 Nov 2024 14:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732112575; cv=none; b=pR0lPHAqcFd/qTvrXWlHFq8rhhbrpnOdxAlOwgLMbr89XukenV35iu4j8KrFGjE+YaKHGuTAvKT+0khJn+x+LWLpymA1xcIMBP/CokCZy9piHcwvWfC+O1eNItOxBGqIuRVX9Q8aJjPxulYXgxUVE1EaW3HPLvgxcNG4vxWNyEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732112575; c=relaxed/simple;
	bh=MGmw32eEGq+7TLv6QFL3xCj0QrlYRMg4JAm/geqNPvM=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sb6zlFV4esu57GDtLTOt3Gau8Cus2QzPlppykE+fuRnls4EnUl9urE0V1nojC4B2i1tQOeuopkNZTpc+Ct71vkCV1gzRbrLETQ7xEog+2lBgIIkwpnNBOJmylm31LAhorJaSGwGA9idhrF9M8PqvBPc4gh03GWKAy4iZ7DYZcFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xtk6V4ktMz6GD2T;
	Wed, 20 Nov 2024 22:20:34 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id D0E2A140AB8;
	Wed, 20 Nov 2024 22:22:51 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 20 Nov
 2024 15:22:51 +0100
Date: Wed, 20 Nov 2024 14:22:50 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
	<qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 10/15] acpi/ghes: don't crash QEMU if ghes GED is not
 found
Message-ID: <20241120142250.00006ae2@huawei.com>
In-Reply-To: <f8dcc9e65bd6a348f2448ceaf2ccbd624d388043.1731406254.git.mchehab+huawei@kernel.org>
References: <cover.1731406254.git.mchehab+huawei@kernel.org>
	<f8dcc9e65bd6a348f2448ceaf2ccbd624d388043.1731406254.git.mchehab+huawei@kernel.org>
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
X-TUID: nciPIdeBqR+w

On Tue, 12 Nov 2024 11:14:54 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Make error handling within ghes_record_cper_errors() consistent,
> i.e. instead abort just print a error in case ghes GED is not found.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Fair enough.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  hw/acpi/ghes.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 1dbcbefbc2ee..e15a411b47e1 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -377,7 +377,10 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>  
>      acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
>                                                         NULL));
> -    g_assert(acpi_ged_state);
> +    if (!acpi_ged_state) {
> +        error_setg(errp, "Can't find ACPI_GED object");
> +        return;
> +    }
>      ags = &acpi_ged_state->ghes_state;
>  
>      start_addr = le64_to_cpu(ags->ghes_addr_le);

