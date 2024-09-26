Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp889659njb;
        Thu, 26 Sep 2024 05:04:02 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUb7FwWUpz6o3aYRGosM//zgySkf1ZyIhAB0DYAkf5aqVvcrRfIcTxHN132Biydok9+chU93kQFMGiekg==@linaro.org
X-Google-Smtp-Source: AGHT+IHLlTQznlzR0uXi+ix40r14lwrH4q1YiYDlIrGFAHsHr4pICSpgM37oKivoETwh1iUSXVn0
X-Received: by 2002:a17:902:f70c:b0:205:6114:9628 with SMTP id d9443c01a7336-20afc4078fbmr88786245ad.7.1727352241827;
        Thu, 26 Sep 2024 05:04:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727352241; cv=pass;
        d=google.com; s=arc-20240605;
        b=WBrH01ZmY+r9J9UA3xOPivxcmc+hAd5AdvZXljCyz7TmwBVc77YjZeKok/jnENZw/Z
         i/34dj0Ro+jeCjATQSY8QbvD4z/WRnOnr1BeHrsLA+9H9OoDtnD6/GMBHFAVvfTtO8AB
         bx3BNxwjxL88FE9+KyR45vPkZZCqYrQtudxy8mWywZD6IkgVHyGT79kVauLqA5khxiZe
         WJV1NEbBfOaeeNVajBlMQPf+qiRdv5Ex8GSLQvYkUvjdbRRh3+dUjGzIzWyelxDqyM4U
         j4Wc453x361zDGRAaEF2JdlgzZ6I0sqYi0w9tD9gzx/4m37tMlpkTsDosA82xeEZm5mw
         2faA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=CdSNag5NWLP2XMoLGv4D+I3le2/11NU4O5akvqEkCdI=;
        fh=sk20niJjP+LyGcAC6rY5I61AlgNCIPpR6UIhxIWLYTI=;
        b=V1EYn11XGonrGQ/ui0GeZBE+/7m4bsdD8hk01ZQAcXtYUEU4wmE0/VIWHT/suKBZ7U
         bR0gK/B6NtTJvjKFZcpMYo0MgvZNwDV6EmVX/V5AstkmtlIw5s85HO9SSYP+k+96/t+N
         lzMTiPVo68JZrgrh3P29jL4KuAPDt+XgfrpUAg0gCX+Zw9kN5UgnNeZp6QEoUveoNncU
         FeM6aS0+wWQGAAdgfgglbWnA39y5q+3CZNJH+lawdtzzy912hK22BHhir05UkQowBNnS
         2epDAqQigOKLn4U5kKjSuDMS8p9YMhYFKYT8fsywaw3rT8wNlbDpdbahYy2l0/7+HY4H
         qYsw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-340421-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-340421-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-340421-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7e6c34d8110si3460685a12.750.2024.09.26.05.04.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 05:04:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-340421-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-340421-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-340421-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC71BB221C8
	for <alex.bennee@linaro.org>; Thu, 26 Sep 2024 12:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF4D1547D5;
	Thu, 26 Sep 2024 12:03:55 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF411465A0
	for <linux-kernel@vger.kernel.org>; Thu, 26 Sep 2024 12:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727352234; cv=none; b=jhHYBFyIkA4ZTvB5in6tjsVctnf7f2OGYI0sqrtxCSd2RIXWkanYQVp91r6XoYdzZPPf3b4NoiWYsr8lKpBzfFRTHY/3ED/PB4RNxmIluL+v3JOSOfkv6HKvhspe/z3+EwN61HKycp02oJsSuWybOZiRybkgz54h/75JadxoqIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727352234; c=relaxed/simple;
	bh=YjCgyXyhQaU9OLHEPxfhFpPNeBb3w/VF5k8ldAjuI/4=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ol5N89HhqV1zriL/XJllRHIoDfzWIppN+FTkOTONvGQH7/XQ7nHXrBAzrltpxoZqKSHzA4Zv4V9UFwC4UQjQKXCKJ/rBPdYR+8wZBqrafmN1fbhNe/oswZKnbpa02YAsTMloiCuDTgDzcf1PYZ2zzDcZQNjHHUZRsT7IsFewhBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XDsZk3rZqz6K9kS;
	Thu, 26 Sep 2024 19:59:10 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 5EDE11401F3;
	Thu, 26 Sep 2024 20:03:50 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 26 Sep
 2024 14:03:49 +0200
Date: Thu, 26 Sep 2024 13:03:48 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
	<qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 10/15] acpi/ghes: move offset calculus to a separate
 function
Message-ID: <20240926130348.00005e45@Huawei.com>
In-Reply-To: <5e8c2f0267a21d05ed09c8af616a92d94638c474.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
	<5e8c2f0267a21d05ed09c8af616a92d94638c474.1727236561.git.mchehab+huawei@kernel.org>
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
X-TUID: xiuoPOOXuvBA

On Wed, 25 Sep 2024 06:04:15 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Currently, CPER address location is calculated as an offset of
> the hardware_errors table. It is also badly named, as the
> offset actually used is the address where the CPER data starts,
> and not the beginning of the error source.
> 
> Move the logic which calculates such offset to a separate
> function, in preparation for a patch that will be changing the
> logic to calculate it from the HEST table.
> 
> While here, properly name the variable which stores the cper
> address.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Trivial comment inline.

Given this is a placeholder for more radical refactor I'll not comment on
the maths etc being less flexible than it will hopefully end up!

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

>  void ghes_record_cper_errors(const void *cper, size_t len,
>                               uint16_t source_id, Error **errp)
>  {

> -    /*
> -     * As the current version supports only one source, the ack offset is
> -     * just sizeof(uint64_t).
> -     */
> -    read_ack_register_addr = start_addr + sizeof(uint64_t);
> -
>      cpu_physical_memory_read(read_ack_register_addr,
> -                                &read_ack_register, sizeof(read_ack_register));
> +                             &read_ack_register, sizeof(read_ack_register));
>  

Wrong patch for this alignment tidy up?

Or are my eyes deceiving me and there is more going on here...

J
