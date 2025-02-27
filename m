Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp54268njb;
        Wed, 26 Feb 2025 23:26:49 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWinetiRiT4PXLrzj4SE30x0HkfJnHgEP8ElIU4zGKKn8B1vkDKTcynGIgMulO72/7T9cJqS5QQL4Grbg==@linaro.org
X-Google-Smtp-Source: AGHT+IHfIwn5trCaQ0S8L10cHabK7248h4h2KHbLFYcSw005Zi1TsxWNTbCJEtXj/MQsb7sgO76x
X-Received: by 2002:a17:902:f681:b0:21f:859a:9eab with SMTP id d9443c01a7336-22307e65a94mr154203285ad.37.1740641209363;
        Wed, 26 Feb 2025 23:26:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740641209; cv=pass;
        d=google.com; s=arc-20240605;
        b=bk0PWtchm3q6lTlcI6jQudKJKssDq2d4Hzzn1RGanoJ4Y8tWna1oW+wqw2HsPNKi+i
         MiZS6Iauy3dhSjSP3INZzLbDDJf2AcTbT62i1shvjv9dGgmnn12zdAzDGfAEODRZUE6M
         lmwUypI++kl7FOLza/nk+wqe9DtP0r4LG7k4O+KLjkOOVz0rCQ8Bw0bNnkDgm7290luH
         bZQIV2DVFXdvn/1pvlagX+NkRmHmHr2BtV3DBzxQygb91JUaQCqRZoxlAmGJ1IGlV5Pt
         Q7oSgVb/u8v5PtR1oxhiiyOKgSMUFvqH8Ppl13YwSPWpW4dy7T1xusTW1SIWJTUunjjI
         fEVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=7kKEbq8odCvFdOwAVRSr2tTQXfeqQtNuHOYm/tFLsVY=;
        fh=LybFDCeXXfjyAUbiJdEDqHywud85HqFqHBRtNKx36pk=;
        b=SQWD8afhGyYPV+Tkus85Y8WCyCX54MAw3dgYkiZZ45m915+Uf93ZQYfHjiv5R9Fs/G
         gWkYJzJ7V1nkfDCGqXs3SeclapoZNB0jIXO3wSHT0bcAXpGBTsEtiYuE52IW+rknlbFq
         5ts8f+0ctdY3zWTL6N4FtwipHjMdlZPhSPuK3K9HEp/6ryy0IuzLNU9usQfSxppACEtv
         rrtAjKI3oV2ZjqMRyCKYcdOURtkzhqybDXoZ2EDP669hDZKx46/3EAM0+UUEFx9SoCHD
         4zmpWpxAJG+hjyKbdVkODRHnvPz8QHQMk0DgwhzaEqa1ykN5RfCJCuRvX/ZbtSUYJmvw
         8nfg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=dNuiow7F;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-535727-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-535727-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-535727-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d9443c01a7336-223501d6cf1si14863245ad.22.2025.02.26.23.26.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 23:26:49 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-535727-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=dNuiow7F;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-535727-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-535727-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 319A23B01E5
	for <alex.bennee@linaro.org>; Thu, 27 Feb 2025 07:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AA321D3EB;
	Thu, 27 Feb 2025 07:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNuiow7F"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A772B13777E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Feb 2025 07:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740641205; cv=none; b=KVCnGkkSxIQVb4PNf5Qcp8pan+h1WcW01mBLQqnE9gBFO82+iNLhu05QG+4NpOJ3jqhFAl5dI+PWAJ6TRITYvri1nwLI3JixQPHcik35MWIIrNm9J3j7eAsoUzZjGEaGTCm/O1/aAU5Es6n+68NPJP20MX3RNw15/3BK/uDyhRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740641205; c=relaxed/simple;
	bh=41nmpp5KDbERU9SbSANLYVIk9B28KAHdXRn1eUEpQ6k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTj51D4e39NjUZYGwUtpMCZMSs7r3PBH7M9ikaTfyjgniPiJZQ1dlyJ+l/6IMQeWg/hR6gxW5DXPW/o9yJcpKLl9cCDPRjm2fQE/fKCYstBnv6T5k61dUmV82mDzeIR6YFCKC5gdGTkxPK1eAtZZ9cdbuTpZw116jNX4O+h8pDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNuiow7F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED916C4CEDD;
	Thu, 27 Feb 2025 07:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740641205;
	bh=41nmpp5KDbERU9SbSANLYVIk9B28KAHdXRn1eUEpQ6k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dNuiow7FIYRNbE/filmO2qq1r5obkAwoY+YUY+n5iXQZ+yOAV5/qpFn5T45fII7/c
	 IKWiHUPOEJmZVeNoTiOOYD426DXuEz2cxlv6XgBUd8fpFUmfkUQRCxrMkyGfszqHKh
	 v0FheXupVnu0NyTy6wyq1QCR4ks/ydF3Ea9qtauQYh9oJD1JEZv1rP5VtXOsV7rhxq
	 8PTIFRqQ+V+7cr6ap0qewi9ye77u/bxU9wLbubRBeDE3CYnYFUjbVZDec1+oiWOFs1
	 zUJHo4TsE9DXBp3RMPgECzehRGotqHCqvZpuEPR/HrPphI4QKyVUrySypmxn6vULr7
	 ZAc87g8prv8rw==
Date: Thu, 27 Feb 2025 08:26:38 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?UTF-8?B?TWF0aGll?=
 =?UTF-8?B?dS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>, Yanan
 Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/14] acpi/generic_event_device: add logic to detect
 if HEST addr is available
Message-ID: <20250227082638.7db90257@foz.lan>
In-Reply-To: <20250227081927.726a1938@foz.lan>
References: <cover.1740148260.git.mchehab+huawei@kernel.org>
	<e9e0aafd7cc8613709171ec5d8a6d9d9be62d7c1.1740148260.git.mchehab+huawei@kernel.org>
	<20250226165226.49b88429@imammedo.users.ipa.redhat.com>
	<20250227081927.726a1938@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: Af1oqsmyCHhn

Em Thu, 27 Feb 2025 08:19:27 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Wed, 26 Feb 2025 16:52:26 +0100
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > On Fri, 21 Feb 2025 15:35:17 +0100
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
> 
> > > diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> > > index 5346cae573b7..14d8513a5440 100644
> > > --- a/hw/acpi/generic_event_device.c
> > > +++ b/hw/acpi/generic_event_device.c
> > > @@ -318,6 +318,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> > >  
> > >  static const Property acpi_ged_properties[] = {
> > >      DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
> > > +    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.use_hest_addr, false),    
> > 
> > you below set it for 9.2 to false, so
> > shouldn't it be set to true by default here?  
> 
> Yes, but it is too early to do that here, as the DSDT table was not
> updated to contain the GED device.
> 
> We're switching it to true later on, at patch 11::
> 
> 	d8c44ee13fbe ("arm/virt: Wire up a GED error device for ACPI / GHES")

Hmm... too many rebases that on my head things are becoming shady ;-)

Originally, this was setting it to true, but you requested to move it
to another patch during one of the patch reorder requests.

Anyway, after all those rebases, I guess it is now safe to set it
to true here without breaking bisectability. I'll move the hunk back
to this patch.

Thanks,
Mauro
