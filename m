Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp84281njg;
        Tue, 17 Sep 2024 03:39:54 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXTzhK02+CBaC98ooIi2K6dw8cUfj2VWSuANUpnD9wYxpghEADSodhQs65KP5jTpz7RcUcjpIK4GQiCdw==@linaro.org
X-Google-Smtp-Source: AGHT+IHt97TT2vmFSyStkSArQuLCTk5lPm9qq8ifB/uXKwZqAweal1Htzn66ED0oZKD4q0yPnvL0
X-Received: by 2002:a05:6214:5d11:b0:6c3:64ed:67b7 with SMTP id 6a1803df08f44-6c57352d235mr249815846d6.23.1726569594168;
        Tue, 17 Sep 2024 03:39:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1726569594; cv=pass;
        d=google.com; s=arc-20240605;
        b=lOIXKBYCDh7GweqDq1hXuQyg6QQ5BrhkfSmI80EYiznaeVZUEFN1MfnOpF9xa5Kl2c
         dcXdJcACuj2/n9K98dOEZG2PEZ9i3wP4tmoE+mmvGCeAakwwZFqwaNpXzA+9iah+sWPf
         G5g/92Hu40QzN3NzbDE1f12b5fodtgF8PGg9/RL609pkUOzk3Q5Nu4Tlto3LNV8OfH/M
         5SdD/G9v67tnL1fJv+MyDq6m8whWQAiEtn2NUrZ8ujkCuHJWBgRvwl6oPN3GPlDP+ZA3
         bhh/tUnRcvfQpkGLBVaEVpqvU92vbTHcSz4MCkaIiaalwUBjYPDNzAUFSVKnfQcGahfI
         2UQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=2Y5o5UIqHFRVGRxSAbGQX8S6o3VCRAhbHIE+pm5uS8k=;
        fh=CTSZTK4myg3Fo1bSdWCVWYBCmTFfYT838LYRH4svyQ0=;
        b=I64KwhHInBbxsIYoK/PfNKtfY5YUqzV41KO/jWGCIwEM9s/NAIfrEGYCvH95etGiWF
         Gy301b7wanflcPhk3cEP20L1ZjhDpdmJ9RacywF1NBzUUAOnYWfThN8TE24hG9K3xAFV
         1gJfjFMMIh7tXZR0mu53E3XWatjzcpYqq/VIX0L7kAtXycOMcRyllkjBWfl1nmZJs6FX
         TrAF+JdcNRELHaHcE+hecufLWJeYvE68Q0NIkRjh4zJdeC3aOIRp+aYlV5Ccqq4v4x/r
         LboKOq1Ia9cdshjbPujp5hzCbAgWJ0iL4OuTetUjLKyOTeMBG7QTB84yrrhu6sbgIOAM
         9y2g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bsxRnJ9e;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-331618-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-331618-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-331618-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c58c68b3dcsi79676856d6.211.2024.09.17.03.39.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 03:39:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-331618-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bsxRnJ9e;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-331618-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-331618-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D711C1C212A0
	for <alex.bennee@linaro.org>; Tue, 17 Sep 2024 10:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5C0165F16;
	Tue, 17 Sep 2024 10:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bsxRnJ9e"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5778915AAD9
	for <linux-kernel@vger.kernel.org>; Tue, 17 Sep 2024 10:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726569588; cv=none; b=QXYoCYf5Ae/Q7FaeHi6A1TPjCMx2bR9TNhyxK/toTbTJ6aXtJVcBgOq3bfgcbuYybHw3J8Rat6teD5svhzVRJCv1tfthjLRNT2p0XnfknCx876cg33lCtIdKFK1T/n/x5vDC2Fjzea9m5TJSUaFJK9c8siWR4hy8Ioidn88wmso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726569588; c=relaxed/simple;
	bh=o/dvB/8ScxWnE0+/oPRipjTDQIWnSSwMEfuWK4hzUAY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XtYpUpLaUNj7LS7O1A/9+PrLiDUWNXepXNnptAjMMR9W8jZ6Jtngtw0bD4YWZI+rtyIaISHb5jmKQLCl2rvuDu0PGWEv/u2zL86J+FAAB04fmp7gmxSH/GAWdtgGadFrhEjeNpalPs8yjp4WuPDeBSx3cw83HVAkP6Ziqsb8orM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bsxRnJ9e; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726569586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Y5o5UIqHFRVGRxSAbGQX8S6o3VCRAhbHIE+pm5uS8k=;
	b=bsxRnJ9eeHISVuemWwycjFEbsPRTUtHC+b7/Sy340pbBOywjoLDisdWiSrTAmrITQR0FtP
	EfppnpTQu2LAiADrtL7wN3vUqPMUk2nbgBu2UKkeCUzAj22XvAkLfbnUu3N3Dttd46Blcc
	fWH7mvHLFufGBDD/XqVjNs+FbiBFcZs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-dIjKqL7QMxGL-ZnlAeMelA-1; Tue, 17 Sep 2024 06:39:45 -0400
X-MC-Unique: dIjKqL7QMxGL-ZnlAeMelA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42cbcf60722so40398525e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Sep 2024 03:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726569584; x=1727174384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Y5o5UIqHFRVGRxSAbGQX8S6o3VCRAhbHIE+pm5uS8k=;
        b=Px8cO3l0tOzx33zFKrNOiSIURDUbW5MSUj7JYJKMczpgN2Z+bd7PJkGrjmcyUvE4Sq
         OD+Qo0Vn0bi6638NA+AdN1AbHJiQfBDIQzATZb85wZ114y2jxLvCmRy+u73DJ6j1aPQE
         33Tq9oKd5mJKDYC6xYd2QNXVPRJkZ96wKofgsq3vI7UEcIYObc2Rp8E59vgpNyHhaG7b
         eaYe0oTeNWoRcBJivKejqug4iFnz96oUwgoYgVEXrMIOsboVo+epyDK5CpryhkuPpQsF
         xr53TnLM5Y8nIx3Js2nx38ySuTtIRXgPn1bwPvYyPlGcDHi/jxbCLcEJV6gCI+h1c2Oi
         yz7w==
X-Forwarded-Encrypted: i=1; AJvYcCVv0scZseVbd+PNPmEz6gLnmKhCHQlvlXPO0TK/iJmY9/qkghwHrO8IIg8EAT7sp0QCe88CzgObej7y6o8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV/4tsD/aSoHdfd/lWy3uxOy+0vz790ztI+gNFs/UupEOcXe+a
	9u/WRSaBms/v5eaWXRRfD+wRn6mU7FNSVPx71QHbbd+V8RqBmG/ImiJEQQnM2xUHWX2FU5jHPF+
	vfHHTiH2I2WldjBnVRql+4z93zuJ6E/jZbJoSdJwj+dWBb1Q6WBz0ACxJFOa8Bg==
X-Received: by 2002:a05:600c:1c28:b0:42c:b187:bdeb with SMTP id 5b1f17b1804b1-42cdb590f1cmr141829015e9.29.1726569583888;
        Tue, 17 Sep 2024 03:39:43 -0700 (PDT)
X-Received: by 2002:a05:600c:1c28:b0:42c:b187:bdeb with SMTP id 5b1f17b1804b1-42cdb590f1cmr141828725e9.29.1726569583356;
        Tue, 17 Sep 2024 03:39:43 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22b8b70sm98685535e9.9.2024.09.17.03.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 03:39:42 -0700 (PDT)
Date: Tue, 17 Sep 2024 12:39:41 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v10 06/21] acpi/ghes: Remove a duplicated out of bounds
 check
Message-ID: <20240917123941.2a5ba7b2@imammedo.users.ipa.redhat.com>
In-Reply-To: <25bdbb971c3f7ccbc0e1964605dfe954193b8fcb.1726293808.git.mchehab+huawei@kernel.org>
References: <cover.1726293808.git.mchehab+huawei@kernel.org>
	<25bdbb971c3f7ccbc0e1964605dfe954193b8fcb.1726293808.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: fkldhiP/aEuV

On Sat, 14 Sep 2024 08:13:27 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> acpi_ghes_record_errors() has an assert() at the beginning
> to ensure that source_id will be lower than
> ACPI_GHES_ERROR_SOURCE_COUNT. Remove a duplicated check.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/ghes.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 939e89723a2f..36fe5f68782f 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -420,9 +420,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
>          return -1;
>      }
>  
> -    if (source_id < ACPI_GHES_ERROR_SOURCE_COUNT) {
> -        start_addr += source_id * sizeof(uint64_t);
> -    }
> +    start_addr += source_id * sizeof(uint64_t);
>  
>      cpu_physical_memory_read(start_addr, &error_block_addr,
>                                  sizeof(error_block_addr));

