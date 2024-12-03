Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3616126njk;
        Tue, 3 Dec 2024 03:56:33 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUIxm/Tz7ENdcy0yIcssKclbDNsoxccLOq05NOYNfwyzv3U2M15+bLhdpTMXfu5/Y0Ie4oUNed9YYBs2g==@linaro.org
X-Google-Smtp-Source: AGHT+IEuNce/yDQR36M5OEdu7VTLb6hKNzQ7hiVfgHHFD99bC/7Xuc1wUIbjXtrSfRddIusW3OMh
X-Received: by 2002:a05:620a:4486:b0:7b1:3f88:48ef with SMTP id af79cd13be357-7b6a617f631mr221792385a.46.1733226993332;
        Tue, 03 Dec 2024 03:56:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733226993; cv=pass;
        d=google.com; s=arc-20240605;
        b=E3Js585LgyGG74E6CR+iYQ8NO2nEA8ZZ6GkLI8QPbqBjce4WTsBWxhjBsNxsUXMrgW
         YFlmvWCYCslQiPT/JuCXybspo9Ga4pItnNA8r6LwI78lzFXDYh01CgVmD6PdNJrbC5lQ
         bBF9T2sGGuFa4bFsQvGYTcrOo0amFlu4gP4ECDZzxXV+Fv8NtTrgRszAew1esf87Rlms
         wDkaKhxXqsoyp/WW82cFt3/X2EDgMFXl0uQxbgIKQaZSJJ+n9Nqv/SWN+p7/J1HTiu7f
         OPmOTcdMTb3tGZ5DsZgDkaXwQLjmkQKf8DBysjgt/56+B1rp6pNHHOvPbEYnb6VKrw9F
         1TOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=+O57SI+41dnb6fLcPWqR/WRjF0vrSeymdRk0UogJ2tY=;
        fh=L98O+aQcy8jk+z8fh5bbRAHSwPeKTOqp4L7oGVPrlXs=;
        b=Z8knBQTWbunebVC9mMQEFo9AgDDUZ3N+jlxISqHs4uPGNs0TyvojMlWgqq2nE34gt4
         kAIXA4BwYZN26emNBTas4Z6aYJoTf36nlfyT8GTNhSjhtTo2I5/gAb8x2kFZx8sNLTb/
         iCNSwUv/fleYpTyTH1vzwsUuAMA81eRV0BDcSbgP3i3HDXLyffxSRfZ+wB1YVIGTcfjO
         V/cBn0Fhg4zkKgu8pQr/K1NLqCmpdQdFd2ARIHsjpI/TcN+E1gNN+rr51AktFmy6uuU9
         8L+IcjQ3W2Pl+Q6+kTNX8eKOzF0vYdyzH1MkzFdoY5X+mdZ5+RJw2j8f4ipPAZRjF6BJ
         Rnrg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OTlO9k+e;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-429392-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-429392-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-429392-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849b1fa8si1740450885a.348.2024.12.03.03.56.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:56:33 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-429392-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OTlO9k+e;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-429392-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-429392-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A78741645E4
	for <alex.bennee@linaro.org>; Tue,  3 Dec 2024 11:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CF11E47BD;
	Tue,  3 Dec 2024 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OTlO9k+e"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A1B1DD0FF
	for <linux-kernel@vger.kernel.org>; Tue,  3 Dec 2024 11:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733226990; cv=none; b=HNcjRZj+uNXmtR/QT8LRj66c/46OYJY7YFTbTvwumWHagwzR/Ejz3vH0tKog4vxZAJwPWwsuRcLtqRBjDIDC4Ivitamrs1wGqTXLK5V2rIaagBzaRALsNPDrDuvLdHoNnznmJ5LzxgQ/WIpFQaWXbfopdFS30KL3mmJqHSiK4+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733226990; c=relaxed/simple;
	bh=z18ZVQThjRUp4dbViIda6zsLr4dfzoahaVIxd3AwPPY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZX6g3IOgZp2romxwDj5JR2KRN/HbfSg4ZcwOWhOrCQ71n2H8/N8PU7Ixx82A2QYiPR8T//s/qp33g7v5gM1fh3MZGd/jTm4WwqJ1AxyUHVRvMnr3gelwlfMPDuhxtEPm3Y3Jk+bLMrn+du37goYpGsWbpMRydfcjnzUDO/i6/HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OTlO9k+e; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733226987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+O57SI+41dnb6fLcPWqR/WRjF0vrSeymdRk0UogJ2tY=;
	b=OTlO9k+eUW2HipfJ+Xkr0UaygxebxfsllW8nm0W1iW0PZ8B0obdmyTSZ6HTHgigiAKo04L
	zB5FidkJkeT9BPod7jWhbS2tC3is2t17qQQqhAeuvbc1vJASOBrxvj24ZO2KBgfxbPw5/6
	+DVPxL2nKrFeBr6SlWl+4NbDIK716sM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-CPe9vROBNoOARtMyM8YzCw-1; Tue, 03 Dec 2024 06:56:26 -0500
X-MC-Unique: CPe9vROBNoOARtMyM8YzCw-1
X-Mimecast-MFC-AGG-ID: CPe9vROBNoOARtMyM8YzCw
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-434ad71268dso30090085e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Dec 2024 03:56:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733226985; x=1733831785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+O57SI+41dnb6fLcPWqR/WRjF0vrSeymdRk0UogJ2tY=;
        b=P1IpH/EbFwZ20xr/gBz2znD/wVWKml/3C9W/s4d5YUY/R77hwRn8NbtNt6E5nNbsi0
         8u8FuQwTDPuHpgI2Ze04iZ0u8OLA1rVqP7dcPESbntWe+0ZHWdtM+UvF+Ay6QP9Knu2V
         HuB2Pfb9ZT+5rS1fEAzX7Uhli17P624+bCixjQIx0uEbkJ40z9qDG2lBOcZC7gxXGnEv
         9bJxZHY7jbfFQx6JhkXLoKLC8NXQf/fqYYig6uiH16rINVfafSzc6iCARxfhg0s2R9CT
         94/6k9bGTi2DjJuQ+aLNq53oeUwm7pVgLLl1flntth++cKXoCp13lzkeDNYzZjZjv6LQ
         7yfw==
X-Forwarded-Encrypted: i=1; AJvYcCVU0aY7SgbBjKF8A9+9kIsQmU7FBuXTJ24scSjsVN9euGYktV1IBAOpiKa0vlXnLIntNZAgnPXHZiEeZnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJZN6cetYOW0cPG/XyQIs2g7fq4zmAqMX6CCFH7PZ+UxCUAB7I
	p+/bDOLDd8YyJ7uZK7Q2yjDCumWIOslArK14k9HBQjLqLyr+Lm1pYkXP+PBoThr01K2V4HXGoEL
	Gs8bYA6lfUgqoGyQ01I3t0mYbJNxFXzioVYEo7iZVBZMxkJPHThe6DuCC9E/Dvg==
X-Gm-Gg: ASbGncurRWtowRFHuFry5FDN6tMNcYflUqKAxP/sr9ypYIBUpJayoFF+U4+ucR6UAAQ
	dW0jKdkoVsAHj0mIji6Zkb/triYYlOzJ+6yWn0AvcOh4MvAU7RRv2AvQahvnjJNoFvF5jfGu/M5
	xpOkBvlz/qJCLr/UGSB9jh68l/5hYR8rIYQ9n+yPLpPNSPXmhRIUaHpaBIil0m2S5eYwYkX9sox
	ZADPLiEqVU9ZCh/9ZPya3lrGYOgS48DiZQiOtRWn887NJbhiGsNYHdkNC9m3KXHaEaqAIygYXbr
	Is5CsPyoaINHl5mmvooEvA==
X-Received: by 2002:a05:600c:5593:b0:434:a33d:ba44 with SMTP id 5b1f17b1804b1-434afc44167mr193433615e9.15.1733226984777;
        Tue, 03 Dec 2024 03:56:24 -0800 (PST)
X-Received: by 2002:a05:600c:5593:b0:434:a33d:ba44 with SMTP id 5b1f17b1804b1-434afc44167mr193433395e9.15.1733226984491;
        Tue, 03 Dec 2024 03:56:24 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dc6352sm186849345e9.21.2024.12.03.03.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:56:24 -0800 (PST)
Date: Tue, 3 Dec 2024 12:56:23 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 15/15] docs: acpi_hest_ghes: fix documentation for
 CPER size
Message-ID: <20241203125623.3b47103e@imammedo.users.ipa.redhat.com>
In-Reply-To: <3bfe6c991d187f48b9c34500be106296b9480059.1732266152.git.mchehab+huawei@kernel.org>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
	<3bfe6c991d187f48b9c34500be106296b9480059.1732266152.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: pK5tbjR1EB5l

On Fri, 22 Nov 2024 10:11:32 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> While the spec defines a CPER size of 4KiB for each record,
> currently it is set to 1KiB. Fix the documentation and add
> a pointer to the macro name there, as this may help to keep
> it updated.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Acked-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  docs/specs/acpi_hest_ghes.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
> index 68f1fbe0a4af..c3e9f8d9a702 100644
> --- a/docs/specs/acpi_hest_ghes.rst
> +++ b/docs/specs/acpi_hest_ghes.rst
> @@ -67,8 +67,10 @@ Design Details
>  (3) The address registers table contains N Error Block Address entries
>      and N Read Ack Register entries. The size for each entry is 8-byte.
>      The Error Status Data Block table contains N Error Status Data Block
> -    entries. The size for each entry is 4096(0x1000) bytes. The total size
> -    for the "etc/hardware_errors" fw_cfg blob is (N * 8 * 2 + N * 4096) bytes.
> +    entries. The size for each entry is defined at the source code as
> +    ACPI_GHES_MAX_RAW_DATA_LENGTH (currently 1024 bytes). The total size
> +    for the "etc/hardware_errors" fw_cfg blob is
> +    (N * 8 * 2 + N * ACPI_GHES_MAX_RAW_DATA_LENGTH) bytes.
>      N is the number of the kinds of hardware error sources.
>  
>  (4) QEMU generates the ACPI linker/loader script for the firmware. The

