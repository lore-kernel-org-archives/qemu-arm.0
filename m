Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2027568njb;
        Mon, 3 Feb 2025 03:09:48 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUAMmR3xLPDI5RCf4pKhIATT3gDh+RGEzzoxdDUX9ooJ43DxaCRk39oPHucL3VAFtHluSS+QHSBEyfAsQ==@linaro.org
X-Google-Smtp-Source: AGHT+IERSetb5uU18Lt8NxG711Ex1UmZa5sksRHarNpfOlrf0EacMfjfqeA8nTN7op6CxCo6tdoj
X-Received: by 2002:a05:620a:2848:b0:7b1:12f5:7af5 with SMTP id af79cd13be357-7bffccca567mr2920021885a.3.1738580987809;
        Mon, 03 Feb 2025 03:09:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738580987; cv=pass;
        d=google.com; s=arc-20240605;
        b=Z3AJCyjcZRL/RgMzGHefsfEXKo0UXZu4AxmSGSaAxXcA30DzKn5sxGM1wwgAsXDtSv
         xakQ1+x9cmoKlxZrMH6skBUsZ+NzAFC1E0IVpvletfoJ/JBt1JYdiepUONM6wOW067CB
         bCxW9IgvwX+rEpo4TLMlE4baT4eyWCY7mkkSEXzyr78XxDqOZKgtaYN7yo/P/QDymizO
         PYRWuRa0IgNDJVcIYMPGACru7sT8kCdy+s8nz33GX+RkYuLPnVVmL3/qULoy+2KuNsAF
         3F5YW73LmGetg9Q49/c0kp8n8FSM8mBxAdao3XMYCtPJYG5vb8Q7RTPHmPMLwYUmyy2o
         lJMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=C7zM+8af4T99S8fqUcVv6ljtkBg2KiZlM5j15XT7qwc=;
        fh=eZCBP7L04dt+2kko+/C3/mgY8GtACAxKJoLY00aUXqo=;
        b=D9DQrCR7dNvlqSkWCMl8ajXsCtPr4abBPvj/oorxoYN23e1R62cuoyMlie/LUJmR//
         1vLhOwUxlQlAMGELnCUG62+BtWRfnZHJrATar3pzaGTDxOj0JgHgVsDySIVGFDl36YUo
         oJH3FwTlyuwuILzbwD/KgwkY9eUROUF1LaaLvOq6CZaUSjMLwDBZHUdSC0lWmoBygAah
         apE+YtllCGznmCS830Wgcs5vaP3+kee5ChDQze4iOUaLYYJOWcALihcdwrEbi9vsIXB2
         lst29LldiolZE1/VnmjZW3Lp/ft6HyfuTeSyIM8zqn9MnNSq+G0+sbfsQpm7msoMalXI
         HAFA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-496389-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-496389-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-496389-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id af79cd13be357-7c02d3a76f6si7356485a.25.2025.02.03.03.09.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:09:47 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-496389-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-496389-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-496389-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4C48166E9A
	for <alex.bennee@linaro.org>; Mon,  3 Feb 2025 11:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4ED202C2A;
	Mon,  3 Feb 2025 11:09:41 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD17200BA9;
	Mon,  3 Feb 2025 11:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580981; cv=none; b=OHW7M/3AQha2gDSP7Ll6Crmmc7CJs7WEv2vVeG+DRnzdUbJ8XNObArailei1mprxHkYEK5gxOR68p9yEHyfNkg2FujQ+LyGHxPZdUAvIYySSXVxN0WaRfjC3Yg8bouFsJPfv3hflDZETFVlMLOg5m/fF42rhqNPouxfwsjVMRh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580981; c=relaxed/simple;
	bh=Soq1uLZt3ko9Dff3dPj50jjbJTQ3V9DCd0zHsJThs3U=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=agL4dvVpFdeN+jR5FSq/sNJbYIUY7xtc0YL8FMUTLy+M+KsgP3FMP2juo7eK8TH57ufCDPy9kaC79fzG6d/9VEgZiECriR8CQ/cYTlDu9j1yX81uqcBvi+GWSsuI9zCIKbHqmI1OIBGb4Yrno+gwoH5A4aQebrK+wyDgtAnMjWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YmkH01cnbz6M4S4;
	Mon,  3 Feb 2025 19:07:24 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id D421A140A34;
	Mon,  3 Feb 2025 19:09:36 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 3 Feb
 2025 12:09:35 +0100
Date: Mon, 3 Feb 2025 11:09:34 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
	<philmd@linaro.org>, Ani Sinha <anisinha@redhat.com>, Cleber Rosa
	<crosa@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Eduardo Habkost
	<eduardo@habkost.net>, Eric Blake <eblake@redhat.com>, John Snow
	<jsnow@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Markus
 Armbruster" <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
	Zhao Liu <zhao1.liu@intel.com>, <kvm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 00/14] Change ghes to use HEST-based offsets and add
 support for error inject
Message-ID: <20250203110934.000038d8@huawei.com>
In-Reply-To: <cover.1738345063.git.mchehab+huawei@kernel.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: GHNfIP9ynBX1

On Fri, 31 Jan 2025 18:42:41 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Now that the ghes preparation patches were merged, let's add support
> for error injection.
> 
> On this series, the first 6 patches chang to the math used to calculate offsets at HEST
> table and hardware_error firmware file, together with its migration code. Migration tested
> with both latest QEMU released kernel and upstream, on both directions.
> 
> The next patches add a new QAPI to allow injecting GHESv2 errors, and a script using such QAPI
>    to inject ARM Processor Error records.
> 
> If I'm counting well, this is the 19th submission of my error inject patches.

Looks good to me. All remaining trivial things are in the category
of things to consider only if you are doing another spin.  The code
ends up how I'd like it at the end of the series anyway, just
a question of the precise path to that state!

Jonathan
