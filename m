Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2505471njb;
        Mon, 9 Dec 2024 03:36:52 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVC7eSxOaf7+oF0tnYUfzrdlICkoZutZ0NeTEZvmCgtfydkT70sRCktWMjBhvVUJkTyHtY+9Zsu6CB1Lw==@linaro.org
X-Google-Smtp-Source: AGHT+IFDhIV5hFH8KWKvhbnCQt921qfo5N28kgSTTY/4QZTbixLXB8l+OOYcLNhvO8urY2Y1d5Yc
X-Received: by 2002:a05:6402:518f:b0:5d1:22d9:1b39 with SMTP id 4fb4d7f45d1cf-5d3bdcae053mr12992152a12.11.1733744211777;
        Mon, 09 Dec 2024 03:36:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733744211; cv=pass;
        d=google.com; s=arc-20240605;
        b=Zn+xuLbTeYH9d+MOCXixt5mx6dm7vbtnVC9f90bsmWWus43khKpxCYJ7/oZhYAxYMv
         Js/y0gqF2huei76sRbPn1JnaCNAdgBlGTsKBeRv63QqaxiQfhVSL4cqDEBc5yS1gOjjz
         SCl3fiRj2VFqN5QjusKqTS9HEdBVP3GMUoyn8cvs2vYnIKqyrdGJdiiVEfSvlY4+x6yf
         nPWccd7cwVcDvuQpBLJVCGL71jg5W1SwhIGHpum1WHm33UgxM5vrDw4DsKif87TLBo/o
         dL1xEiNmW/gEiQQZgSDzhmZ5Ke2bpVriz8f3YkH2jNmkv7LAbxEergQOQaiUzjgfW16m
         y3RA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=h/ws4M3mvj5iddNMkxj0bvP9WgTgCX7Eca2qhbKnmc0=;
        fh=+feeONKKhfj4Xu3umI+ZvCmxCiaV8JYRivnFs1FxxQw=;
        b=hGwR9jlMhVawdoOEZ8qfTuElgd9yA8fqid0BWCWzbedWWhfwfdKVbPJp03rWNePHwE
         dD72ROXMOz1Dyh+8uQP1MEG2bmvgaMYn8W6u4WtWuLsbFMA+VmTOitgIcRUww+JljE45
         ErSRir2FvOq28zfAoVb00fIrP9xanw6CEzrJd9H35XuzesweSDZUEjio9uZdC5r1b/lv
         aTeXOIrh9q48CqGBzFdseXtPSiGcGvynJXt6mJEEIALvmm9Fw5woXTv2TBg7ZQC7HdGm
         /Ta9Hlo6HcY3Jy3lbDqoptsH/Tjn/A1k613VEn2HuVxmKz3GdUmEyNkmlcQDY7kgh/31
         QaAQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-437386-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-437386-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-437386-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5d158d659cbsi5690040a12.631.2024.12.09.03.36.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:36:51 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-437386-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-437386-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-437386-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD56F188208C
	for <alex.bennee@linaro.org>; Mon,  9 Dec 2024 11:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97BCB21D00B;
	Mon,  9 Dec 2024 11:36:47 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A9621B90B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Dec 2024 11:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733744207; cv=none; b=gJKdmPHHL14sIqSP61EluWw/0tiBd72CN0Oq+o6554tC3vyOCZyL1ZnEAQd7yOGw6g+i8Lg8F7nz781jLI9xrilJq2gSgiJucaZoApaVNEnCjy5cydEgCgzaz91FGHdl2+HOhXAJRouQuUwKHR+Jn2MQq0XyVBKQozRmO9Urrwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733744207; c=relaxed/simple;
	bh=/nXVfqekSVFVXoQO2Pr9MejwxdTWqjJT7U2S7WLvWBw=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sUAg88N1KKKg7Ke670beZTMbLZrwgXxY9/4/LTX8oj4hI9fLSWSLVF1rYi3c1zOXjESOxPXgd/XQbXfFjaqxTl+TFLMs01JFYX0toOOrZZHW4j531HTsLEHgTesbuH5uWeJC/A9Y0c5SwuJeVP8vOgevUss9VplnTQJHcfvQbG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Y6KTR5qh1z6GC63;
	Mon,  9 Dec 2024 19:32:11 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 9D6AE1400DD;
	Mon,  9 Dec 2024 19:36:42 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 9 Dec
 2024 12:36:42 +0100
Date: Mon, 9 Dec 2024 11:36:40 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: "Michael S . Tsirkin" <mst@redhat.com>, Shiju Jose
	<shiju.jose@huawei.com>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
	<gengdongjiu1@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
	<linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
Subject: Re: [PATCH v6 08/16] acpi/ghes: don't check if physical_address is
 not zero
Message-ID: <20241209113640.000055ab@huawei.com>
In-Reply-To: <95c0fa3fc2969daf3b6bc1f007733f11b715a465.1733561462.git.mchehab+huawei@kernel.org>
References: <cover.1733561462.git.mchehab+huawei@kernel.org>
	<95c0fa3fc2969daf3b6bc1f007733f11b715a465.1733561462.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
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
X-TUID: MehvHTz5SU8S

On Sat,  7 Dec 2024 09:54:14 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The 'physical_address' value is a faulty page. As such, 0 is
> as valid as any other value.
Still not sure on what faulty pages are :)

Given I tagged previous (after you'd sent this)
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/acpi/ghes.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index edc74c38bf8a..a3dffd78b012 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -400,10 +400,6 @@ int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
>  
>      start_addr = le64_to_cpu(ags->ghes_addr_le);
>  
> -    if (!physical_address) {
> -        return -1;
> -    }
> -
>      start_addr += source_id * sizeof(uint64_t);
>  
>      cpu_physical_memory_read(start_addr, &error_block_addr,

