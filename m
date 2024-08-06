Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1101601njb;
        Mon, 5 Aug 2024 22:57:08 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXCH/oMTFww0iqHsCSbIaVzMfX4q5CMPySH4XioOkZ3kH6pWVCzL8EttQC+aWgdLiquGThPSSOzOLlMJTMxJTop6I+Fv+8N
X-Google-Smtp-Source: AGHT+IFIrFjB8HVOPnQfQA99p3qtgkDf+5gmmv+fT8SpdcVLMsiNCNL9Ki2NPCJKHHLiNbKKwNjC
X-Received: by 2002:a05:620a:4548:b0:79f:b34:9edc with SMTP id af79cd13be357-7a34f00b23fmr1801432785a.66.1722923827972;
        Mon, 05 Aug 2024 22:57:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722923827; cv=pass;
        d=google.com; s=arc-20160816;
        b=gTaxvdV7dZfaTDtqkTq/cqEuEUlJNxGOC7tDXJU7TE8iHGnGIcoVSgp77005Oc3Nkf
         J3wCiFKWDn3eo83lqpKmo1FLjlAGrPHobxZouqVKx4YijhwtF82NUChDT5jUgmuI7qPv
         Tcoo8LeWCMJPpDI36HZFuFqDvgk+K2WxAh0MjOTnQhMX+SK2wVoH+3qDLX8Z89z4EtJE
         YLkWLMB7lRPPQfIDLVbZtiGnMAq4Ineh0YWa4rR2VGpLMrEHfJV70x14LX+SNXaBBRWK
         qaBObg/cMBzIRoSJMvFQ/NnvqGAHDYU0aXJ0bZglycJO+Y383UeduoA/jlah9iJzS5Mk
         c5xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=SE08XV/nGsWyzVPkvAuoLR3ZZQTx/lTU2CJ8WLNY6+Q=;
        fh=mgzvW8ALJBA6MyNP2oSYGffBUHo0fZ7g8+ndKcl78ng=;
        b=KiyYjN+etX0hTNA5A4+M6ulqm0+dIk9MPhAdYnyDtF1GjhlOZ2Fa9Rd+WySKxxmOop
         gUCPr2uGAE9mfBwiEgKbUWpxy2zckA8S1z89+wGNDPcD07TLyoWjNEPohXoacVQd2Qqs
         mG1rLWSpu5Ha4do+d20iob1Zl7axwgBBOecP2p9pnXzzhYvUD1w92lH8dbqrvX4HBwmj
         HjDCcGOBYpe1kGAUDq4Q4g1J0208CXnrdVof5Mj3UmNgJLyFLHFrmLENexo3HqLNN/Jh
         c8FBtrfR2rqcj2mMds8HjbyaydrwZxj8mKcnE3HBXppRvsf1EZc6N3ymIjoh7n4D3P3J
         adzw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="Z0b/J6Fp";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-275727-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-275727-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-275727-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id af79cd13be357-7a34f74ab7asi1201749685a.306.2024.08.05.22.57.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 22:57:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-275727-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="Z0b/J6Fp";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-275727-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-275727-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC4471C224EF
	for <alex.bennee@linaro.org>; Tue,  6 Aug 2024 05:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF4D1BB6AF;
	Tue,  6 Aug 2024 05:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0b/J6Fp"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14EF15D1
	for <linux-kernel@vger.kernel.org>; Tue,  6 Aug 2024 05:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722923823; cv=none; b=gxoujVhhv0S+SbDylR8yif+2QM36R882gY4RZAGI5FFTxO/Vq9S4LrcYzzMjjEl60cAYwtNscvu+dQ13hvUUNhuUajrPSgZl8pR6iKU+0gokfzv2CsboaRdKj3B2YRbkkE1EAAtRtbxrVxV3cS6fn6xZWAwYJXk9UM8Fhq0E6k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722923823; c=relaxed/simple;
	bh=0Hejww234DES1PvMhUh245HUseCRhbD8DLK4u6Op7/4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C6vu8VDOt4TlZiKHlMjFpd5oPTNULPTZEeN2mnnyAWFw6KSS/Z0CfvxCp0cdCkWtZalNRqO3Dlnc/R5zgQ5PkuKm2skR2r3DU2rZhn4OLpuepGxZ7KeHnxm2s1JVKMmJs0qAE8NQOhN/6/sDwLVibLB2S25eXqPHJAEHzjKv3L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0b/J6Fp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECCD4C32786;
	Tue,  6 Aug 2024 05:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722923823;
	bh=0Hejww234DES1PvMhUh245HUseCRhbD8DLK4u6Op7/4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z0b/J6Fp6towTBV4MzPGVYXKwddZrXbmJN3lrvlGMnmT5NF0RCvtzDN67nqqbIF8X
	 tpaSL0Zm08Hq1vivs7cp+OMsnhs+0c3ChowrbHZGreE4Ce4Z092Wx2N/cN6dTa27ff
	 BzNSP/nif+rL2JojCCAnE56QfXbcGBeExIh8NfekQkBijJBHTLYjrFYoeFg0X7X3O3
	 O8879yvWMCzc4bPWSU6pcBpC1Siy48WKGo/0Z+E2C75VTTG11+5Ccnaa9dHTFex+8a
	 69CzrO6CN93hRJwnzGZVP1ttwxUheroeQOrYUyIEkm6Y39lhAp6ufzKSC79HdaYi9J
	 eEK1wk7L7gpBQ==
Date: Tue, 6 Aug 2024 07:56:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Shiju Jose <shiju.jose@huawei.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Igor Mammedov <imammedo@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, <linux-kernel@vger.kernel.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v5 3/7] arm/virt: Wire up GPIO error source for ACPI /
 GHES
Message-ID: <20240806075657.2a43abcc@foz.lan>
In-Reply-To: <20240805175400.000028ad@Huawei.com>
References: <cover.1722634602.git.mchehab+huawei@kernel.org>
	<d0607d8f6116ff841b6c6a17d20f6d7077063045.1722634602.git.mchehab+huawei@kernel.org>
	<20240805175400.000028ad@Huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: 6y/s9Nl+/xu9

Em Mon, 5 Aug 2024 17:54:00 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:

> On Fri,  2 Aug 2024 23:43:58 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> Do we need to rename this now there is a GED involved?
> Is it even technically a GPIO any more?
> Spec says in 18.3.2.7 
> HW-reduced ACPI platforms signal the error using a GPIO
> interrupt or another interrupt declared under
> a generic event device (Interrupt-signaled ACPI events)
> and goes on to say that a _CRS entry is used to
> list the interrupt.
> 
> Give the Generic Event Device has a _CRS
> with aml_interrupt() as the type I think we should
> even have the hest entry say it's an interrupt (external?)
> rather than a gpio.

True. I'll change patch description to:

    arm/virt: Wire up a GED error device for ACPI / GHES
    
    Adds support to ARM virtualization to allow handling
    a General Purpose Event (GPE) via GED error device.
    
    It is aligned with Linux Kernel patch:
    https://lore.kernel.org/lkml/1272350481-27951-8-git-send-email-ying.huang@intel.com/

As the spec at
https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html#event-notification-for-generic-error-sources
revers to it as:

	"The implementation of Event notification requires the platform
	 to define a device with PNP ID PNP0C33 in the ACPI namespace, 
	 referred to as the error device."

> > Adds support to ARM virtualization to allow handling
> > a General Purpose Event (GPE) via GED error device.
> > 
> > It is aligned with Linux Kernel patch:
> > https://lore.kernel.org/lkml/1272350481-27951-8-git-send-email-ying.huang@intel.com/
> > 
> > Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>  
> 
> Again, more or less fine with this
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> to go with that co-auth

Thanks!

Mauro
