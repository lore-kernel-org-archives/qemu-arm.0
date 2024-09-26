Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp896311njb;
        Thu, 26 Sep 2024 05:13:28 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVlmaMPZ3OvS/EBJILQURT1E6Pyv1xCHMhjMj9Hg7oBrD/I1e5VPSKOqyA9Bj1drdiS67D0bCOGRabWOA==@linaro.org
X-Google-Smtp-Source: AGHT+IERNDzUyTP5Nj2Ehi5W2YmRpl/uoL2hyclcYC39sd0GItLA64oXfskMfJla781i6b+6/oJK
X-Received: by 2002:a17:906:dacd:b0:a7a:9144:e23b with SMTP id a640c23a62f3a-a93a038314bmr604980866b.19.1727352807719;
        Thu, 26 Sep 2024 05:13:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727352807; cv=pass;
        d=google.com; s=arc-20240605;
        b=iPCW7bibiOi/Mt5/tnhoJt35bkJ2Id0X7JVUT6D4VZBaIpAQRJZmZFQRVty/SOaFyc
         uZ51ds+FZPY9dzpC+J3Q5hR8U0LVvkZioIHOYs+YXvTRY8EIs6neU5qdnA8+ZboHMvTY
         GSHoXYuUl72RhwRVeqAVKW2HFl3FRCo7sfhg5glRtL9OWp2THopsgWl2x1gZTH3YTiky
         czYhsQo0Saqx/RlkP2+t8XybFQdb4Ynib4+iAESiva8A3Idvb8bZNlVOi+J6odeJs543
         UHB5Ip0xu3GEJcD3EE1P/Lkl2Fpi1tryNS9tfOqrMd3l/0LRfbPG9JmsrQO9XDwzP/TE
         xP3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=+e+EbCQTyxIB7ODQxClKqgKkjWgIW9lEm2/Xl801hy8=;
        fh=9DSshlg/LTrwrUnaEo6sRgsr5LF6gO3L1JwofJyeiOs=;
        b=YU3/ZNMW7lLcMfSQlHJfobdo3IRM4K8uYxxWLZ0kL0yiaB9bfgiODAPETZBppR+hqH
         HyKGE+j+zp//kumiLBQu/KRlysnY6Q3gpDajIpfX+0no7I8r7aLv3+wYbLXMVK5xJK/U
         gL7q47GiOuU7uS1KlXOU4TzyvqLoeVXABJvdI3xtx8h5x+QRpszChFqX4meSZeewILX9
         ksaxIDYQqpOE2TwkOCMxLy3WzvfQmQfyMr0iXB72y1fkEstnQlqwlYNo2lLYgwKxJDGK
         UPTgfpXmpjc+nsUxyyVcp9DsCubtr1PqiLEqgTt0SdpVxpG6sWfN4W7hyPrA2RMP3IgL
         eOUg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-340433-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-340433-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-340433-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-a9393114372si385663166b.726.2024.09.26.05.13.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 05:13:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-340433-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-340433-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-340433-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F1C71F28615
	for <alex.bennee@linaro.org>; Thu, 26 Sep 2024 12:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC34C171088;
	Thu, 26 Sep 2024 12:13:21 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496A11714B3
	for <linux-kernel@vger.kernel.org>; Thu, 26 Sep 2024 12:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727352801; cv=none; b=WV9sO8POQcNXrir37ZFtYifUnZ31+5qzOOjY2I3mZVRjduV5UfMAszv40EiVlXSR/8EQ1rF3G55jexaouVshq9xIAxHKtvWapfwhAT4fYx5ec9rOklP19GmN+qdt5Ps6ErBIFaMFc7n76UTzwMsE5qFybADmIXw+b1saPddY+tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727352801; c=relaxed/simple;
	bh=GEQZD3LgjwLXHYWqzy2IVXpGgTaJMDyNpjQWKUAObc8=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BS14LtQPQ3IRkCx+e2V8iWYr2vVmBFJJmlCfidM3PijeplIZEolVkLXtuwULTF5BQPFi5jqCuys++UOExgnZBtf63zXoeRUuY9aY58VG7HXJOM+WxATFaFmGFeB4YzckSSphshv/35FDEgiIl1MInvssut5oWEC6/vmo8xga2Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XDsnd1NLCz6K8wf;
	Thu, 26 Sep 2024 20:08:37 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 0C7A314011D;
	Thu, 26 Sep 2024 20:13:17 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 26 Sep
 2024 14:13:16 +0200
Date: Thu, 26 Sep 2024 13:13:15 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
	<qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 15/15] docs: acpi_hest_ghes: fix documentation for CPER
 size
Message-ID: <20240926131315.00000229@Huawei.com>
In-Reply-To: <f6604a9dba8b5dcfe4e21d1f2a8b68ad05b265f4.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
	<f6604a9dba8b5dcfe4e21d1f2a8b68ad05b265f4.1727236561.git.mchehab+huawei@kernel.org>
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
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: vr9ZfB6E9ND6

On Wed, 25 Sep 2024 06:04:20 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> While the spec defines a CPER size of 4KiB for each record,
> currently it is set to 1KiB. Fix the documentation and add
> a pointer to the macro name there, as this may help to keep
> it updated.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thanks,

J
