Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp85129njc;
        Thu, 20 Feb 2025 22:02:31 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXoJwrVHRzA3knQR4DhUluU89+TnG3eGSswFcQxrvINPZP6hiDy9tJdelHqkm0y0ddMUrJHcw8Ofb/dCA==@linaro.org
X-Google-Smtp-Source: AGHT+IEI5C/b4n0YaqRCM5+dYMbIQE3BwiMaGC3iXSgfh4Ex5qc6RVN/DF7DK95GnQyn3nYiFzn3
X-Received: by 2002:a05:6214:300e:b0:6d8:ada3:26c9 with SMTP id 6a1803df08f44-6e6ae7f596dmr28404896d6.10.1740117751384;
        Thu, 20 Feb 2025 22:02:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740117751; cv=pass;
        d=google.com; s=arc-20240605;
        b=QpauUgTM4WbOUWCiocdmgb6+0PGpOE7Y4ETeawLaHaI2fYDJMdvRfvu8iGu3oJbh33
         xiyUkhOAyn+yrlcaEwveqg2uqFkK9aYCN9RFJSqx7WqpvFMb1sGR68xoVUExPpiiovFQ
         Pp+HDElk7gpw/2j6KMOHNNJDMNvYI0UBuGX8P4DGZQG8GXvFt1kBKWLCNgak+QNoZjwm
         8owdb8C2BIaP/5f23cECnGQrrRdZvcr+DJI71NUowxFuCvJp6NB/0Zq/CPail8QUzOyT
         8j4fIPjUs9Q4Bq2C/s714U6ri1UzMCihybnhoWfA5Hxkf+IeiXTSpA/mvQCd24dB6LWf
         5Lmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=oggUwi524hobrhBXIFbkMDrqjcnHs4hWHd2k5CWdYpA=;
        fh=+IIZYibM3VqPU5vc5LSAgrCj2PY9BY2dnDrMb9YCvSE=;
        b=GRiyOROn22QOhLgK9yQuDhz7mejrmBVSSJ5Pw+Bjg1bq99t56ZYbLdHmzRlndXnbj2
         cjc02E5Xj2ViCvm5ZoaS3nNr19BWeLXTWw/dOj9Q4NSFI+P9r6LCi5CDzExQzi/s5AOt
         MZ7X4wIUjvC3JQJHAvZpMkSrhGsDS0x64k37/BrXQ+gYLeP18y5BK/OwP9bI9Jno/dUF
         lbhH0TTxRDypsOP4Khkscg6kUmHJAYgPc0Esleolp6jjdIf7jE1JEP1a9X4BRM30goLW
         qOfsAXwTxuJanGV33GlPw6/iwmOgpMS6DOHrPcD0rhYVZCNJm8BZfJRI9idkIjcKdnh7
         tOKw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="PKm/wg2N";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-525211-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-525211-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-525211-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9a0fb4si155828966d6.219.2025.02.20.22.02.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 22:02:31 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-525211-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="PKm/wg2N";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-525211-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-525211-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5D42172472
	for <alex.bennee@linaro.org>; Fri, 21 Feb 2025 06:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C561D88D0;
	Fri, 21 Feb 2025 06:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKm/wg2N"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702A91917E3
	for <linux-kernel@vger.kernel.org>; Fri, 21 Feb 2025 06:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740117747; cv=none; b=GFxO+D8echCr62/DTMQxkT5PjwO2MW+8fRqsPNGyuETOlzvbnqQOYzZdLX52DN1HZwjLtqBuzYaWpwnlsnyr9hQYtwdz4+361tdp9yiw9Yz31tOZBjIX/Nol3OJCn9YBJQU6QT6KsxvLvNIR1tNx9+89AtXQ7aGVH6UY58f5wHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740117747; c=relaxed/simple;
	bh=ZuJRxKQJmNRmvEj2+idQ2Nspe3fIJitS8x63hFXCTOo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G1zhbzqOX64BxRLdSEr6GT2JQ7nNEGnXoZ/Mkv6R6Egkiyh1/jAjc3k+hkB1LYXlHfOUSgy5ico55sGBlmg6JsxSeqMOtmyKMWzV+gn0MRD8a6IYoQsRyvZoRc/6aWie04rXjVNHz0/PK38WOUdLvJK4AJozO7BcbESRSze+C8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKm/wg2N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB70C4CEE2;
	Fri, 21 Feb 2025 06:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740117746;
	bh=ZuJRxKQJmNRmvEj2+idQ2Nspe3fIJitS8x63hFXCTOo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PKm/wg2Nl0nJCSD9dhbsIv/Qv99zhl4dhOHx1o1NZDN9HlCepzsVTqpjSaWY/dt31
	 /v/9TaGgpad39OygRel0Q2XixAF0Zdp8/FwyPUtrPLZDGF0rC4/0K0Fy6UpVRoRxbZ
	 xurFnsvc9G9mUA/2baw1C+pVLsG8+HUOWg/izdBnaeqP31SRRnmPLoIkQ+yQRhIhu+
	 I6HKHkI7sv1HjfSn2h11Xa1u6TJYT6kuE0YbMF316czrdORdJ/0iUnJ3A6DVYEkYQe
	 RLpiuNLhqMm/mHjb36o4j7lIWkRKpFEPjCcYaSoMv+PtAf1CfbDil4Y8VbpimnFcOS
	 rOPXOIBeMeUwg==
Date: Fri, 21 Feb 2025 07:02:21 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/14] acpi/ghes: Use HEST table offsets when
 preparing GHES records
Message-ID: <20250221070221.329bdfb0@foz.lan>
In-Reply-To: <20250203153423.3e4de17c@imammedo.users.ipa.redhat.com>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
	<9610ff88cf6fdc59cbfc8871d653fd890391be1e.1738345063.git.mchehab+huawei@kernel.org>
	<20250203153423.3e4de17c@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: ByVGgdEcPEpp

Em Mon, 3 Feb 2025 15:34:23 +0100
Igor Mammedov <imammedo@redhat.com> escreveu:

> On Fri, 31 Jan 2025 18:42:44 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > There are two pointers that are needed during error injection:
> > 
> > 1. The start address of the CPER block to be stored;
> > 2. The address of the ack.
> > 
> > It is preferable to calculate them from the HEST table.  This allows
> > checking the source ID, the size of the table and the type of the
> > HEST error block structures.
> > 
> > Yet, keep the old code, as this is needed for migration purposes.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  hw/acpi/ghes.c         | 132 ++++++++++++++++++++++++++++++++++++-----
> >  include/hw/acpi/ghes.h |   1 +
> >  2 files changed, 119 insertions(+), 14 deletions(-)
> > 
> > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > index 27478f2d5674..8f284fd191a6 100644
> > --- a/hw/acpi/ghes.c
> > +++ b/hw/acpi/ghes.c
> > @@ -41,6 +41,12 @@
> >  /* Address offset in Generic Address Structure(GAS) */
> >  #define GAS_ADDR_OFFSET 4
> >  
> > +/*
> > + * ACPI spec 1.0b
> > + * 5.2.3 System Description Table Header
> > + */
> > +#define ACPI_DESC_HEADER_OFFSET     36
> > +
> >  /*
> >   * The total size of Generic Error Data Entry
> >   * ACPI 6.1/6.2: 18.3.2.7.1 Generic Error Data,
> > @@ -61,6 +67,25 @@
> >   */
> >  #define ACPI_GHES_GESB_SIZE                 20
> >  
> > +/*
> > + * Offsets with regards to the start of the HEST table stored at
> > + * ags->hest_addr_le,  
> 
> If I read this literary, then offsets above are not what
> declared later in this patch.
> I'd really drop this comment altogether as it's confusing,
> and rather get variables/macro naming right
> 
> > according with the memory layout map at
> > + * docs/specs/acpi_hest_ghes.rst.
> > + */  
> 
> what we need is update to above doc, describing new and old ways.
> a separate patch.

I can't see anything that should be changed at
docs/specs/acpi_hest_ghes.rst, as this series doesn't change the
firmware layout: we're still using two firmware tables:

- etc/acpi/tables, with HEST on it;
- etc/hardware_errors, with:
	- error block addresses;
	- read_ack registers;
	- CPER records.

The only changes that this series introduce are related to how
the error generation logic navigates between HEST and hw_errors
firmware. This is not described at acpi_hest_ghes.rst, and both
ways follow ACPI specs to the letter.

The only difference is that the code which populates the CPER
record and the error/read offsets doesn't require to know how
the HEST table generation placed offsets, as it will basically
reproduce what OSPM firmware does when handling	HEST events.

Thanks,
Mauro
