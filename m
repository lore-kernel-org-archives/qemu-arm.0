Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1223839njc;
        Mon, 25 Nov 2024 03:56:54 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXUxTBg67aZjbExj4Al0g6sSJ237bX0BIqfvOmJl2WPtTL/o+1f1QqbdxN0ylNQq7eewT4z2uKHrstnTw==@linaro.org
X-Google-Smtp-Source: AGHT+IE83RvAWPR/6ioNXRsO9GgI3V/C3OzycCyywE3GlI/LauoQ01nYDJ/d1pgCCK2dbbCyPfmU
X-Received: by 2002:a05:622a:1b1f:b0:460:9da7:92ff with SMTP id d75a77b69052e-4653d53436bmr228691681cf.4.1732535814489;
        Mon, 25 Nov 2024 03:56:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732535814; cv=pass;
        d=google.com; s=arc-20240605;
        b=NdfjPI1IoGq9LiGCadBZPj1fffoi+msmezyyTNxNGn6MoAvc5T/i9v5iYWSRvFAHYn
         D7POAmr1428jHoTVlYHb1+NIOYCfaBmu3V4Iurld5RGw7m3PQ1lHDrfzPeOFLdOw3YGU
         /8EbeAaE14HWFN1M+84tTJ/PpwcBwfM9bTyRvPGEMtWtPQlx++OeafW/3PI+QsIgEuQ7
         wVe2e3yGgmdmE3r/v/DlGw4yHxyDzOMQscQMmY2gGsixxuQqUUzEvSexWoKWHiOI3+Dy
         0y0yU9TvJzaRTbA0iD9gEBFpt2qvNutiYFkCwfWSxU2lzDPM6ZVLUeiM8zso2run2I3Z
         8jfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=TGykOHBHclxNFZ9ZK+5GD131EofMWwqi7LNOjJFpquY=;
        fh=sk20niJjP+LyGcAC6rY5I61AlgNCIPpR6UIhxIWLYTI=;
        b=SA8VYkJhYF3oRH4a95RAMnUejLygfUp0GHmPsGlEyJI9ocW9qCsYTECB0l154pht4u
         FaR3m+X75VueGswONwYPtC3j2Xvg5zDrY+K4KLImWHAsO1Uc0EgD3n8eRoEBMWiO3pZo
         F1MoBF/NFl+YDMMAu2a9dkOkFvXDybIY5W3kQBJKj7a8RlnoOQhUtFYcToLiELImCCTa
         oAT+Hsqgy+RRn8DONt9lnrex5RDXLUiwIa794uU6psFMtj5mykcgk8KN/yH37DuUZEXP
         t5728q9h9IdnOG9m/ibLUSxr0Ho+VU67nS8xmppAi7cH5E4Ufr57P6XFBXNtRLvgmi8Y
         x4Fg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-420968-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-420968-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-420968-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id d75a77b69052e-4669a1b49fasi10281831cf.163.2024.11.25.03.56.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 03:56:54 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-420968-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-420968-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-420968-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92E1D16921C
	for <alex.bennee@linaro.org>; Mon, 25 Nov 2024 11:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88FE186294;
	Mon, 25 Nov 2024 11:56:50 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095D6376E0
	for <linux-kernel@vger.kernel.org>; Mon, 25 Nov 2024 11:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732535810; cv=none; b=nLh9dg0jQRUg3nzNOB1SbGeuwjK4mWo4kbUWFhSMMO5kPDF1iNE7IAKwh5uv4IKZ1V50y6g8k0DdCHIfrWXe4tDom6UqKw7kxvVvw4n001CrjLsQxJ7mfmhRh7+afxU710ZNSYB3fb1BbVqN2GK7Y2kS2PeorieDXQuG19aiHcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732535810; c=relaxed/simple;
	bh=dyGAREdF6wLZko5THPZ7TK3rOCw1V/U5p4cXPE5bkXE=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qY7+WT9S4zv7IBx0lhgHMJ9i25cKZUdqJ6dc50FmbnS50w/7xjiL76t7PASOcx+8yaVI8U9m58sDSQry2RqZC8QZoMKDr4VC7ZDWeZpM3NYQHaA1Sxx5/Mn4OTnpuaQ/l794kUy6PiXw7mNIEUFulwmZGrJ56uATbE0FJMoibnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xxkgg4lh4z6LDHJ;
	Mon, 25 Nov 2024 19:56:15 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id C523E140C98;
	Mon, 25 Nov 2024 19:56:45 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 25 Nov
 2024 12:56:45 +0100
Date: Mon, 25 Nov 2024 11:56:43 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
	<qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v4 08/15] acpi/ghes: make the GHES record generation
 more generic
Message-ID: <20241125115643.00002923@huawei.com>
In-Reply-To: <b3845a8c78ef36c633d5e20af868de4ed16650a4.1732266152.git.mchehab+huawei@kernel.org>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
	<b3845a8c78ef36c633d5e20af868de4ed16650a4.1732266152.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 0BupIqH93LVZ

On Fri, 22 Nov 2024 10:11:25 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Split the code into separate functions to allow using the
> common CPER filling code by different error sources.
> 
> The generic code was moved to ghes_record_cper_errors(),
> and ghes_gen_err_data_uncorrectable_recoverable() now contains
> only a logic to fill the Generic Error Data part of the record,
> as described at:
> 
> 	ACPI 6.2: 18.3.2.7.1 Generic Error Data
> 
> The remaining code to generate a memory error now belongs to
> acpi_ghes_record_errors() function.
> 
> A further patch will give it a better name.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

One trivial follow up that is enabled by the change you are discussing with Igor.
Up to you that one.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> +
> +int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
> +{
> +    /* Memory Error Section Type */
> +    const uint8_t guid[] =
> +          UUID_LE(0xA5BC1114, 0x6F64, 0x4EDE, 0xB8, 0x63, 0x3E, 0x83, \
> +                  0xED, 0x7C, 0x83, 0xB1);
> +    Error *errp = NULL;
> +    int data_length;
> +    GArray *block;
> +
> +    if (!physical_address) {
> +        error_report("can not find Generic Error Status Block for source id %d",
> +                     source_id);
> +        return -1;
> +    }

With this error check gone (as per discussion with Igor) you could use
g_autofree to deal with freeing block.

That would bring the errp check right next to the call that would result
in errp potentially being set and slightly improve readability.

Mind you there are no uses of this in hw/acpi currently so maybe this
isn't a good time to start :)




> +
> +    block = g_array_new(false, true /* clear */, 1);
> +
> +    data_length = ACPI_GHES_DATA_LENGTH + ACPI_GHES_MEM_CPER_LENGTH;
> +    /*
> +     * It should not run out of the preallocated memory if adding a new generic
> +     * error data entry
> +     */
> +    assert((data_length + ACPI_GHES_GESB_SIZE) <=
> +            ACPI_GHES_MAX_RAW_DATA_LENGTH);
> +
> +    ghes_gen_err_data_uncorrectable_recoverable(block, guid,
> +                                                data_length);
> +
> +    /* Build the memory section CPER for above new generic error data entry */
> +    acpi_ghes_build_append_mem_cper(block, physical_address);
> +
> +    /* Report the error */
> +    ghes_record_cper_errors(block->data, block->len, source_id, &errp);
> +
> +    g_array_free(block, true);
> +
> +    if (errp) {
> +        error_report_err(errp);
> +        return -1;
> +    }
> +
> +    return 0;
>  }


