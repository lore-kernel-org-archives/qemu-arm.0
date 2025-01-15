Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2987366njn;
        Wed, 15 Jan 2025 03:09:24 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXx81Wwm8fKtyyzFlRkuWkXBYnoq5zq5KpsOcY6+jE2+TGBvIWLk6xVjkJxv0xYPB5C+EOzxlv3aWVRpA==@linaro.org
X-Google-Smtp-Source: AGHT+IGzqM65u37vURapha93TkBLvWIC/lJBei2KTSAEuaXzIb4XBtklbGfawliMfOT/03URKcIH
X-Received: by 2002:a05:620a:4092:b0:7b6:ee6d:fc09 with SMTP id af79cd13be357-7bcd97a6f98mr4376986485a.43.1736939364248;
        Wed, 15 Jan 2025 03:09:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736939364; cv=pass;
        d=google.com; s=arc-20240605;
        b=cvi9fmB7m2a9gDUExjF1StrtieIVoFqWs6xfIF/xg7FIg2PVEUT5x202FYf79/JHXT
         EtYMzJghLckbishZDUaOUxuFBC+/H6mrhnO2gauSBSpxwhwrqc9m9xGAkaWEGbq7+dcz
         MbfnEfMS+8985u6OPmyPxoWowXItppYrdzjMGmFsTOMRR/g11jhArdTeWgIFzhb5jmeh
         F5rthbtZDCCcCJG2KjDmaf/LBudxgrFEdkPJf1mVJ4kc9mgXJQUNbhFqo0iH5perf33B
         536ShW4EhQ6Gkn6kM/13wYCcMCU/JdzoQkwntlZ1rwuEwCwAk7Moet8JCry9qG3S7AoO
         kgvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=pp3W/euv0r0qhGV6FGZjL/PZ+k8+BYGIfdPd25Fr7yw=;
        fh=qjl+5yRxb5WOb24jUp4wX06GLQBp41BiYikqKWKgOEQ=;
        b=Di8MzOfET/vEOKXg8JibiucHZ137kaQA4GRulhXVzj4eyw/6q04SnltQEiOv51FEa/
         Kmspzs3XJB9L1H9+Swxcp9Z8LZTnUBwouUb/mHBXBJSq12clqLSkYvTXEBzRfmlQ84ks
         3iO2PsDF+w/RB6mA2mjDgbPg3CHoLxeRkv6vun8Jp1NdKGVoG2UvjqzdfWLDtbVBSMdv
         QcQWl+9KCPR1V9IhYENFM6KRvJ/DjPEU7fcvnyESDlMkdiWgAU5AmPR04bNTLiAis1MA
         TTaokf2ocL5htwT0bPe/Fqi8rQt2HKuvIrCippztGPvkAvw2LqDZLc+N8b81oyZBsZAN
         hsvQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AiNQ9ucK;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-477772-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477772-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-477772-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id af79cd13be357-7bce3508e90si1578171585a.544.2025.01.15.03.09.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:09:24 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-477772-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AiNQ9ucK;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-477772-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477772-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D45BB16A8BD
	for <alex.bennee@linaro.org>; Wed, 15 Jan 2025 11:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961F21E98EE;
	Wed, 15 Jan 2025 11:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AiNQ9ucK"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41ED248BDF
	for <linux-kernel@vger.kernel.org>; Wed, 15 Jan 2025 11:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736939362; cv=none; b=ASKyRRKsPPyMZ/40Arlu56VvgQsrDKeNSQexhSVVSl2Olv8NiP5N/SK/VU9v+qJKQeB64KmN2lZFgLw8yOXXQdea3E+QSSsB643bozRIVUzyyDYafMC5deewqNBlZqMigSobwBsDkjpGKn6wBhpwRDmQ0GIk6146qJgHlxc6fw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736939362; c=relaxed/simple;
	bh=PjbU3RZ1UQ8hHYSv91N25YkhJULshLv7+qSUMc1cLvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BikHUipSMsNM6cEMwLOLaXIm+TW//boL+nHKeegAaYYVFTsQEzsoF229mrzfySnlTRtPeWNkz2oyOCZcPxag4UErkp03hYmgj753vV+BIrBoivg4GtZ/jVvefRuNobsyn+6/ggd2NxzHIyWZRhoCb3Fj32k0WRtQOmUn6prmYrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AiNQ9ucK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736939359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pp3W/euv0r0qhGV6FGZjL/PZ+k8+BYGIfdPd25Fr7yw=;
	b=AiNQ9ucKaA8L1oFdglNZ91hTTMPBp4LSzBZ/zaxiAmZ5h3MNN8YGiul7L2cP40RLQtCAkZ
	aUWtCnhbT8rHFPtiaFcSaroyPTaItWkkRWJswWIJU4O8D7yt7kHpMfY/Wr4pkZTN16AbDO
	01nTbAFjrYdQYFvctfIBn98gs7sbHyk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-u-39hevnO9yH15eaLUSdYA-1; Wed, 15 Jan 2025 06:09:18 -0500
X-MC-Unique: u-39hevnO9yH15eaLUSdYA-1
X-Mimecast-MFC-AGG-ID: u-39hevnO9yH15eaLUSdYA
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-386333ea577so2456624f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 15 Jan 2025 03:09:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736939357; x=1737544157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pp3W/euv0r0qhGV6FGZjL/PZ+k8+BYGIfdPd25Fr7yw=;
        b=xBEuzcTCnMQtfO88pLbyh6abs6oMJiWoYbD47tcbJ+SAVitWRpLjMd/Va3UtSoZ/R0
         TEOJ8/Ap5Q0BMTz00Lqu07Io2oKFywNxBB0COsJ+xfzQvAO0YK/bfKOk5rjhLGmbkhFw
         DpOvw+ZqbJn4WKTxenypzd3xaV60GDrpxGgdPSCNFKNA26mNLneiQKaErT1Z9QSb6usa
         xvbZzWFT4i72lhxq0u9dUgCH5P56643HFW6pAwph0eUWKiCXpJeQai3tHTjxVwALzgKA
         qpRgvGkd5HJ3Y1jMN9ZhG2FD5NqUaJHFF4zKeqUBOgk3FDHO+AxLxdFGOb652L8b8bEC
         NFUA==
X-Forwarded-Encrypted: i=1; AJvYcCWkGM1kUur9f3hE/HUpHWg6Bd0wozcv+eF7cmAfhBgAJAQd0FNgguPyNwt4h36gZQH5b+ru8kWIpwJpWfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtwVVRpQEDHTOTwXmA9lV0cdlqp8yI+ggtW9zVwfh1yS4e26A2
	06oOJhPF1TQPUYMh4u4Ck75XCCXlEA4DGVI56pl3CNRHAarhq6Be02WDggxTsmv3f7XnQzGC+Re
	EvswHQOW5BbdRF1c6FwF+AWayOewgbf+WfO5N8gRwqx1pTpgoDBEln/HDz54ROw==
X-Gm-Gg: ASbGncsM7KKKUa0U5eYxD47e0OJ28+jPjwY2c0h1limVAF6Ei1noDBzfG7vW4I/RXfc
	wqaWHmIWoEis8xYuYPpWGEoFOE5xSUjqfT6osS4ObS/kFVvlL4e6rP36VJ5IgJRHeeO39oJOhHl
	W1suJ/WCN7Mzdgz9xz72qbDV5cHLKnQDM537y02uR0kSEQksaHeIlQpHaoa5h/rJkFkugM9hu4Y
	dMR8tKwy3NPK8bq+czPYuOtYkvD/WGI+tdghndJ7qPJsvMxag==
X-Received: by 2002:a5d:6489:0:b0:38b:da32:4f40 with SMTP id ffacd0b85a97d-38bda325049mr10094361f8f.2.1736939357173;
        Wed, 15 Jan 2025 03:09:17 -0800 (PST)
X-Received: by 2002:a5d:6489:0:b0:38b:da32:4f40 with SMTP id ffacd0b85a97d-38bda325049mr10094332f8f.2.1736939356795;
        Wed, 15 Jan 2025 03:09:16 -0800 (PST)
Received: from redhat.com ([2a02:14f:1f5:8f43:2a76:9f8c:65e8:ce7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38be4222dcdsm3342117f8f.51.2025.01.15.03.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:09:16 -0800 (PST)
Date: Wed, 15 Jan 2025 06:09:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>, Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [PATCH v6 00/16] Prepare GHES driver to support error injection
Message-ID: <20250115060854-mutt-send-email-mst@kernel.org>
References: <cover.1733561462.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1733561462.git.mchehab+huawei@kernel.org>
X-TUID: PK/UC22mICXc

On Sat, Dec 07, 2024 at 09:54:06AM +0100, Mauro Carvalho Chehab wrote:
> Hi Michael,
> 
> Please ignore the patch series I sent yesterday:
> 	https://lore.kernel.org/qemu-devel/20241207093922.1efa02ec@foz.lan/T/#t
> 
> The git range was wrong, and it was supposed to be v6. This is the right one.
> It is based on the top of v9.2.0-rc3.
> 
> Could you please merge this series for ACPI stuff? All patches were already
> reviewed by Igor. The changes against v4 are just on some patch descriptions,
> plus the addition of Reviewed-by. No Code changes.
> 
> Thanks,
> Mauro


Still waiting for a version with minor nits fixed.

> -
> 
> During the development of a patch series meant to allow GHESv2 error injections,
> it was requested a change on how CPER offsets are calculated, by adding a new
> BIOS pointer and reworking the GHES logic. See:
> 
> https://lore.kernel.org/qemu-devel/cover.1726293808.git.mchehab+huawei@kernel.org/
> 
> Such change ended being a big patch, so several intermediate steps are needed,
> together with several cleanups and renames.
> 
> As agreed duing v10 review, I'll be splitting the big patch series into separate pull 
> requests, starting with the cleanup series. This is the first patch set, containing
> only such preparation patches.
> 
> The next series will contain the shift to use offsets from the location of the
> HEST table, together with a migration logic to make it compatible with 9.1.
> 
> ---
> 
> v5:
> - some changes at patches description and added some R-B;
> - no changes at the code.
> 
> v4:
> - merged a patch renaming the function which calculate offsets to:
>   get_hw_error_offsets(), to avoid the need of such change at the next
>   patch series;
> - removed a functional change at the logic which makes
>   the GHES record generation more generic;
> - a couple of trivial changes on patch descriptions and line break cleanups.
> 
> v3:
> - improved some patch descriptions;
> - some patches got reordered to better reflect the changes;
> - patch v2 08/15: acpi/ghes: Prepare to support multiple sources on ghes
>   was split on two patches. The first one is in this cleanup series:
>       acpi/ghes: Change ghes fill logic to work with only one source
>   contains just the simplification logic. The actual preparation will
>   be moved to this series:
>      https://lore.kernel.org/qemu-devel/cover.1727782588.git.mchehab+huawei@kernel.org/
> 
> v2: 
> - some indentation fixes;
> - some description improvements;
> - fixed a badly-solved merge conflict that ended renaming a parameter.
> 
> Mauro Carvalho Chehab (16):
>   acpi/ghes: get rid of ACPI_HEST_SRC_ID_RESERVED
>   acpi/ghes: simplify acpi_ghes_record_errors() code
>   acpi/ghes: simplify the per-arch caller to build HEST table
>   acpi/ghes: better handle source_id and notification
>   acpi/ghes: Fix acpi_ghes_record_errors() argument
>   acpi/ghes: Remove a duplicated out of bounds check
>   acpi/ghes: Change the type for source_id
>   acpi/ghes: don't check if physical_address is not zero
>   acpi/ghes: make the GHES record generation more generic
>   acpi/ghes: better name GHES memory error function
>   acpi/ghes: don't crash QEMU if ghes GED is not found
>   acpi/ghes: rename etc/hardware_error file macros
>   acpi/ghes: better name the offset of the hardware error firmware
>   acpi/ghes: move offset calculus to a separate function
>   acpi/ghes: Change ghes fill logic to work with only one source
>   docs: acpi_hest_ghes: fix documentation for CPER size
> 
>  docs/specs/acpi_hest_ghes.rst  |   6 +-
>  hw/acpi/generic_event_device.c |   4 +-
>  hw/acpi/ghes-stub.c            |   2 +-
>  hw/acpi/ghes.c                 | 259 +++++++++++++++++++--------------
>  hw/arm/virt-acpi-build.c       |   5 +-
>  include/hw/acpi/ghes.h         |  16 +-
>  target/arm/kvm.c               |   2 +-
>  7 files changed, 169 insertions(+), 125 deletions(-)
> 
> -- 
> 2.47.1
> 

