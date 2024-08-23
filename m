Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp366583njb;
        Fri, 23 Aug 2024 16:28:28 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVufYvLGDALDsre4yNnhFt2POYtsnF+GAuUdM/bBRuVAwLO2AOpjrDx1Z1I5BK5Y00dnO3NU/UuL4aUYQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFXCCqr6lVtQF5H/j1CPu4byoUS2MXR8FtzD9V+816MGx8T2AuiBQ9qss1rtFdvIB2bDOh1
X-Received: by 2002:a05:6808:2dce:b0:3da:9fc5:56ea with SMTP id 5614622812f47-3de2a7a76ffmr4971337b6e.0.1724455708454;
        Fri, 23 Aug 2024 16:28:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1724455708; cv=pass;
        d=google.com; s=arc-20160816;
        b=JAghWQCpX1nmoR7y1BjwPECwwIrYYmq0OfnqvuQMYEJhfcMEXlNrN3yRFF8aSefLxm
         WdbEHfhvHqen+6RDjQdj9AkkygLhWyBNsaCdkY3PW7Qx2STRvt69MuaWD07VMMhwGMkV
         ahdcbEvpLC7R/vvD8wKHHlVj+nMxd+AjjBhLhnRz/eW5jETh3zbDvGpFXdO2bTqppbPH
         EC2YvuMF3CDJOtMCtZPpswpRtN64+++gbTJ3rsCRJM55SzG6kkk+ne5Yf75ihrzqAWgt
         BHN8oQKgH2RLOY4VGcpTqF0YXVVFDso63NLUbsjmyxBEVYcE8neraMybRD4CteOrccOA
         kYXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=dXnGO7ESLRR/+Nl9KrUibo9fmG+C4uWneGcOlhh01Bo=;
        fh=AJ8hn4ioKJA5lsG3NCMNx8yhntdFUmRi9f6dN5eYbeg=;
        b=zlTXDLjX1S8U6uohInii04YhHlQmCt1LeyQhZpv83nsebSW1J2YuUz33KOKr2qTvP+
         Nhdw3iA7G7WX+4AQNhfvE4OT827k0uqP2iwRD1yzKBOeePawu+xTJwIcvahAISrcX+eV
         9U/hOmy6FQK0hUzo0mPRkp+9cuTowVamD+0wzvAI/61ci01j5p3NIV+/uTZo6/h3/2mk
         DkSFu85egfA3DieRjFBPYbkxNR1VkyMf40gE5xTl7htHocvzzeOKo6R4Vxk5Ot65Fh6o
         jAc/yuw+46xhr0agBzG/pwo7ZeX086sdavZ5xsSlj9AqujqzSuQqSwMLOHIBqZaax/yY
         glXg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=vORTuiKb;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-299757-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-299757-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-299757-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7cd9ad87952si5003399a12.696.2024.08.23.16.28.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 16:28:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-299757-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=vORTuiKb;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-299757-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-299757-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0551F28613E
	for <alex.bennee@linaro.org>; Fri, 23 Aug 2024 23:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08381C8FCE;
	Fri, 23 Aug 2024 23:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vORTuiKb"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FAD61FFC
	for <linux-kernel@vger.kernel.org>; Fri, 23 Aug 2024 23:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724455702; cv=none; b=JsvmkBajAsys3m6urZRoYsAkY0rSYrZ0ZOfcFSuCwYDKn7CxRRh9hTn38u62Ko0NI097OUlxj1ojl4tcy8OXMHEj4gM3Qezim0gsBLuYTIdDoBq4UE93iRfvJrENxdGcidM2Jt2jDIik4P9KEAprcm2+uWK/2y01ylvVYPuUtJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724455702; c=relaxed/simple;
	bh=qUWlsVBaCvs/ScOoZEuc4eDAUzoBoNdCnkHyMXoBP0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dZDDj4JhiyzoSP7qkJwZ2fidj50TLwZy0E5cC5VtATTsiBAu8cVCMR3ErGI25boNKp+5S/OxJ/0wAX6zRbd3xuW0ybY7VLWrfYF7VC54IzWRlzyIcCnp40sDrLHztBC1YQXP0R0J7TubIH1ncHNZEUlUoIGV531DFpDu06YBDy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vORTuiKb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57787C32786;
	Fri, 23 Aug 2024 23:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724455701;
	bh=qUWlsVBaCvs/ScOoZEuc4eDAUzoBoNdCnkHyMXoBP0Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vORTuiKbLxZNPOEQ0PzthnF0YH6X3D3t02uOkqzxXEq3ydhuflVlK3Waov1PUgvD3
	 7cF8XEuVzOfd9feh4tnCeA5ZFXAep0b31PKMPFr1s0danzrge9wOW0+haFLp1CCj/S
	 lQOizMv3uah49tKyOFUH8fpRFmgXA9loFR6Pa+w8xkdzzHG6hqcj9josDJwMI6JLjy
	 JZk0F/3AUmy4xUbjEERKYoPRKj8ckzWxQfe1WsNR+bzzR9u3BObxclWpPquTBY5tns
	 MNvjEK8mV5/IxshEJXM62Wjf9e9cUjTXPuZtMJkwbgdpizZSn0w1f6hMAPFWAv6x0R
	 IOMmxMh68Yg1g==
Date: Sat, 24 Aug 2024 01:28:06 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v8 03/13] acpi/ghes: Add support for GED error device
Message-ID: <20240824012806.6189d0a4@sal.lan>
In-Reply-To: <20240819134304.68c54eae@imammedo.users.ipa.redhat.com>
References: <cover.1723793768.git.mchehab+huawei@kernel.org>
	<ba1864f1aa7073abe090eec0c31915f187967140.1723793768.git.mchehab+huawei@kernel.org>
	<20240819134304.68c54eae@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: ubUSgwtblKjY

Em Mon, 19 Aug 2024 13:43:04 +0200
Igor Mammedov <imammedo@redhat.com> escreveu:

> On Fri, 16 Aug 2024 09:37:35 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > 
> > As a GED error device is now defined, add another type
> > of notification.
> > 
> > Add error notification to GHES v2 using
> >a GED error device GED triggered via interrupt.  
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This is hard to parse, perhaps update so it would be
> more clear what does what
> 
> > 
> > [mchehab: do some cleanups at ACPI_HEST_SRC_ID_* checks and
> >  rename HEST event to better identify GED interrupt OSPM]
> > 
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > ---  
> 
> in addition to change log in cover letter,
> I'd suggest to keep per patch change log as well (after ---),
> it helps reviewer to notice intended changes.
> 
> 
> [...]
> > +    case ACPI_HEST_SRC_ID_GED:
> > +        build_ghes_hw_error_notification(table_data, ACPI_GHES_NOTIFY_GPIO);  
> While GPIO works for arm, it's not the case for other machines.
> I recall a suggestion to use ACPI_GHES_NOTIFY_EXTERNAL instead of GPIO one,
> but that got lost somewhere...

True, but the same also applies to SEA, which is ARMv8+. After having
everything in place, I confined the source ID into this code inside
ghes.c:

	enum AcpiHestSourceId {
	    ACPI_HEST_SRC_ID_SEA,
	    ACPI_HEST_SRC_ID_GED,

	    /* Shall be the last one */
	    ACPI_HEST_SRC_ID_COUNT
	} AcpiHestSourceId;

	static bool ghes_notify_to_source_id(enum AcpiGhesNotifyType notify,
	                                     enum AcpiHestSourceId *source_id)
	{
	    switch (notify) {
	    case ACPI_GHES_NOTIFY_SEA:             /* ARMv8 */
	        *source_id = ACPI_HEST_SRC_ID_SEA;
	        return false;
	    case ACPI_GHES_NOTIFY_GPIO:
	        *source_id = ACPI_HEST_SRC_ID_GED;
	        return false;
	    default:
	        /* Unsupported notification types */
	        return true;
	    }
	}

The only place where the source ID number is used is at
ghes_notify_to_source_id() - still we use ACPI_HEST_SRC_ID_COUNT on other
places to initialize and fill in the HEST table and its error source 
structures.

On other words, the source ID field is filled from the notification types as
defined at include/hw/acpi/ghes.h:

    ACPI_GHES_NOTIFY_POLLED = 0,
    ACPI_GHES_NOTIFY_EXTERNAL = 1,
    ACPI_GHES_NOTIFY_LOCAL = 2,
    ACPI_GHES_NOTIFY_SCI = 3,
    ACPI_GHES_NOTIFY_NMI = 4,
    ACPI_GHES_NOTIFY_CMCI = 5,
    ACPI_GHES_NOTIFY_MCE = 6,
    ACPI_GHES_NOTIFY_GPIO = 7,
    ACPI_GHES_NOTIFY_SEA = 8,
    ACPI_GHES_NOTIFY_SEI = 9,
    ACPI_GHES_NOTIFY_GSIV = 10,
    ACPI_GHES_NOTIFY_SDEI = 11,

(please notice that ACPI already defines "EXTERNAL" as being something 
else)

Now, if we want to add support for x86, we could either add some ifdefs
inside ghes.c, e. g. something like:

	enum AcpiHestSourceId {
	#ifdef TARGET_ARM
	    ACPI_HEST_SRC_ID_SEA,
	    ACPI_HEST_SRC_ID_GED,
	#endif
	#ifdef TARGET_I386
	   ACPI_HEST_SRC_ID_MCE,
        #endif

	    /* Shall be the last one */
	    ACPI_HEST_SRC_ID_COUNT
	} AcpiHestSourceId;

and something similar at ghes_notify_to_source_id():
	static bool ghes_notify_to_source_id(enum AcpiGhesNotifyType notify,
	                                     enum AcpiHestSourceId *source_id)
	{
	    switch (notify) {
	#ifdef TARGET_ARM
	    case ACPI_GHES_NOTIFY_SEA:             /* ARMv8 */
	        *source_id = ACPI_HEST_SRC_ID_SEA;
	        return false;
	    case ACPI_GHES_NOTIFY_GPIO:
	        *source_id = ACPI_HEST_SRC_ID_GED;
	        return false;
	#endif
	#ifdef TARGET_I386
	    case ACPI_GHES_NOTIFY_MCE:
	        *source_id = ACPI_HEST_SRC_ID_MCE;
	        return false;
	#endif
	    default:
	        /* Unsupported notification types */
	        return true;
	    }
	}

An alternative would be to move source id/notification code out, placing
them at hw/arm, hw/i386, but a more complex binding logic will be needed.

If we're willing to do something like that, I would prefer to not do such
redesign now. Better to do such change when we'll be ready to add some 
notification support that works on x86 (MCE? SCI? NMI?).

Regards,
Mauro
