Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp2647476njh;
        Mon, 2 Jun 2025 03:22:52 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCV/qDRItBGtTxGyyI4c7g3wA1WrIs2Tx2qTIsuHfm2bVCnzqV9qSUdbW4mdr3tswxogpL9y+Rn2c792Uw==@linaro.org
X-Google-Smtp-Source: AGHT+IHWkkdYxlCokg+yM3lTjeZ3t6WCoWNnxEJXT9q/xNKuFAhzmAX19iXMxAHRN9u6Kt8bUBxi
X-Received: by 2002:a17:90b:5344:b0:301:9f62:a944 with SMTP id 98e67ed59e1d1-31241e9846dmr20011340a91.33.1748859772664;
        Mon, 02 Jun 2025 03:22:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1748859772; cv=pass;
        d=google.com; s=arc-20240605;
        b=A/UYCMVOZIfscgHNuBm+UDjYoFlv6eg/1Fje6S7el05+S1Od+FmBzxZVuA9/CkXmyA
         OfS+ubYCaWfFYhPtR0BHtB/qBMipaUtR3UHmGDJrnwNFAZpF/OcwvItbf8z34HtmqJsF
         A4LsN/tsjQe/uJip8ojZSjPG3Vjxfp59djKiOzsAiWj2idJJb2GggE3QT3FylqTUn/T8
         HaKEu8fcYA02/UVqt3hxBguu2qAz7pdgMq5FkFkgd2dOZX0zosycHF+1kHk+7xtzEnWC
         p3aEmL0E2orDucHkujbRWFGoi/vX5/03wqn46U/9Ca42StB8z0zD7h9XLP8lAtvx2vWo
         IACQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=CKMj/dmcZFnIoX+/jXJwdMyeYm/ORc0hdxg4CxCECwk=;
        fh=2c9RE8dZcdWnzcFREFq4+dA5YIGFdnTXGy937ffEWAQ=;
        b=BgXwHzoaQlGrtQqaV1IABeoSxoWskLz237s8xR2ArXX99b6EqRhU3GmTEATZhCdHol
         +0OZ37Lwn5d+DJhz+duKL7p5fGMTedV07NziyMk7M0Z2cG2czMOZdilNHOIqFxOga9xM
         FwnITl0AUnSTXcBMgicBNKQBPfa0GREGlGyCFsRAAavcOTeYNsutvfTSD7xqFpaPNoBI
         sZGZ+ABbX+PLNCiQ17J9KN82DTEV0+PiWnLQSJ9VUSpWJk3lgk5pKdLGhuE4RGRQwJKa
         kr4pBEU+qCQg8NTtloeAwlqYQF9qUzIWO/LIUA12oKl78DV2b0Ct94ukdnrvNGl+jK+Y
         ScaQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q0QXgeEH;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-670307-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-670307-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-670307-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-3123b67917asi10919186a91.154.2025.06.02.03.22.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 03:22:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-670307-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q0QXgeEH;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-670307-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-670307-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F7CD3AB4A5
	for <alex.bennee@linaro.org>; Mon,  2 Jun 2025 10:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681771E3DEF;
	Mon,  2 Jun 2025 10:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q0QXgeEH"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877FA1758B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 10:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748859771; cv=none; b=SC9M56MZvPqBws8oW53YLlUp3x0KxxB7N5IyJQx9d9OY0jA+xNR39N0ZVifEayR7Jv2EVqBTpntPbgtnmzSNla/GaAXRi2FR0zyMrz8uhYjUmSvZqXZZN1VoTfsZkM3rYB+ntgtaGTfsiXyMIWv8MqSYdYOgNx0mHJ8y91UWGtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748859771; c=relaxed/simple;
	bh=C9pmjVW0KhwAcy61epjvYTBa4pXDQwO2yV+k8s/fuC4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s0kSPWv3h/ac51WB4h++nAzcxmtlLrh90gMyPclLSebK79DzmBXS4AXpZKNcyFNyTJ1Wd0qS/H5wU82noomHXrk5BxiSCt/fNF7wf/gsuwkssAPnCYfkmbROkwE66vuKVcTHv9w8Y5jIRSYyRv8Nkm+IiENbR42XfadqsqD547U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q0QXgeEH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748859768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CKMj/dmcZFnIoX+/jXJwdMyeYm/ORc0hdxg4CxCECwk=;
	b=Q0QXgeEHE8JrwbFxBCIH2P+xB/V/6ht8I78e6IoB03ZVh9k99z+qasneDXwSkG8HsKDQHP
	jFTDZeS2UIJvQ1F0QyW/SupSHCzEcvl9GJlBBrCOf+t70vzoFnGItp9mmpVCdGpV053WDH
	cCbO5J4RxW6s85uyML6N+ULhg1uTOyc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-2hfh_mI2PPmC-y9yYQxzNA-1; Mon, 02 Jun 2025 06:22:47 -0400
X-MC-Unique: 2hfh_mI2PPmC-y9yYQxzNA-1
X-Mimecast-MFC-AGG-ID: 2hfh_mI2PPmC-y9yYQxzNA_1748859766
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442e0e6eb84so26122365e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 03:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748859766; x=1749464566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKMj/dmcZFnIoX+/jXJwdMyeYm/ORc0hdxg4CxCECwk=;
        b=IiX29bVe7amGhRvlHZ4C+GTsZC3mTExg0cVxToRxwtCOhOpZ1x4FLSwJqyIsQypWKt
         l+NBN89kHqQ5FKmH9juB0s2spNpwkD2gKPmfSChnehpxoVOK03NL+bVmDGMqz+HUzmHz
         CbRZyN4XVMG7i0j9VPQabF2SqFs8kjhyoaJhJRVAmJdf+4H+/GIUqTSrpd5BsLIEOO/y
         Oyl/CjSrv7V4rQ+h/pIFtU8rk0BFi/xY4+QAX5ABxHrdR/qrg1s+tUbioogVqXG3SncT
         knbx/S7TkNJYSWUOm2F/ZryXGe9qw8o8EsbH+E83xGP+emI6cwrVJTn0Qbxv7rVgerlm
         HoYA==
X-Forwarded-Encrypted: i=1; AJvYcCUtKbseB4K6OCtnZah6+/vaK6khG+lGjb2wZy5ZSCMXcpnXhzi3BJbHA2pF7qRd0+b5AjPpCCuVevHCrRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYRTIi8vFSa1ZzF1unadJPq6GGC0dSrSLD+phwTcRol00huH9g
	8cXROxz59T0JVaXCJbvKOCvp6TpiBtfOhea+UTurRw2zEt2SuJiBCdaWs41IQKhFitK7MX7a653
	Cg5ksFpzqyYbBOkLGpDenQOFS8npElmKW6Du2Atoqaic9vKbyAXmFz0WUf2QPWZ9kGA==
X-Gm-Gg: ASbGncvwm4BX1dUgpTmZFMgarztHSU7EPFTTMzPPoilDygDn6x82kANnrtYawmXY9pD
	XhfGduggLwKMc0lN1pvxVaU4HLTPvhyL3KDab9Xjr+ALCSOb7ZUPkZhTH4N6qlC3C+J4Xrdxk6H
	kw3l5jS8L1SG6m3TUgH9Dy2bqbIy4zAfwmTTGXb2Q4SaF+kb/RVUN7EBS8Q1lcFB0XoZWZhEpYp
	f38wyH8efjon3Z8WRVvfgpehmy3cWX2PbVoilZQvnP/jTrfOMuLOo3GqvlBsKQVwzaoxw7WNcDD
	fPb5dxM/ptrBE5OpN8fouOTo+hx1Hd6k
X-Received: by 2002:a05:600c:1c08:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-450d64e2cedmr95031995e9.6.1748859765976;
        Mon, 02 Jun 2025 03:22:45 -0700 (PDT)
X-Received: by 2002:a05:600c:1c08:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-450d64e2cedmr95031585e9.6.1748859765515;
        Mon, 02 Jun 2025 03:22:45 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb80f6sm115820455e9.28.2025.06.02.03.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 03:22:45 -0700 (PDT)
Date: Mon, 2 Jun 2025 12:22:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?UTF-8?B?TWF0aGll?=
 =?UTF-8?B?dS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>, Yanan
 Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 12/20] acpi/generic_event_device: add logic to detect
 if HEST addr is available
Message-ID: <20250602122244.081a1960@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250530221810.694ce02e@foz.lan>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
	<aa74b756f633dbee5442cf4baa2c1d81a669d2f9.1747722973.git.mchehab+huawei@kernel.org>
	<20250528174212.2823d3de@imammedo.users.ipa.redhat.com>
	<20250530080120-mutt-send-email-mst@kernel.org>
	<20250530164903.0f9f8444@imammedo.users.ipa.redhat.com>
	<20250530221810.694ce02e@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: eZMJZa/nU794

On Fri, 30 May 2025 22:18:10 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Fri, 30 May 2025 16:49:03 +0200
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > On Fri, 30 May 2025 08:01:28 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > On Wed, May 28, 2025 at 05:42:12PM +0200, Igor Mammedov wrote:    
> > > > On Tue, 20 May 2025 08:41:31 +0200
> > > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > > >       
> > > > > Create a new property (x-has-hest-addr) and use it to detect if
> > > > > the GHES table offsets can be calculated from the HEST address
> > > > > (qemu 10.0 and upper) or via the legacy way via an offset obtained
> > > > > from the hardware_errors firmware file.      
> > > > 
> > > > 
> > > > it doesn't apply to current master anymore      
> > > 
> > > indeed. Mauro?    
> > 
> > Michael,
> > it's trivial conflict in machine compat,
> > could you fix it up while applying?  
> 
> IMHO, that's the best. The thing is, as code gets merged upstream with
> backports, conflicts happen.
> 
> I can re-send the series, if you prefer, as I'm keeping it rebasing it
> from time to time at:
> 	https://gitlab.com/mchehab_kernel/qemu/-/tree/qemu_submitted?ref_type=heads
> 
> (it is on the top of upstream/master)
> 
> But even that might have conflicts on your test tree if you pick
> other patches touching this backport table:
> 
> > -GlobalProperty hw_compat_10_0[] = {};
> > +GlobalProperty hw_compat_10_0[] = {
> > +    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
> > +};  
> 
> (this was the code when I sent the PR. When applying upstream,
> such hunk is now(*):
> 
>  GlobalProperty hw_compat_10_0[] = {
>      { "scsi-hd", "dpofua", "off" },
> +    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
>  };
> 
> 
> (*) https://gitlab.com/mchehab_kernel/qemu/-/commit/08c4859f8c6f36d7dccf2b773be88847e5d1fe0c
> 
> If you still prefer that I resubmit the entire PR, let me know.

If it's the only patch that needs rebase and doesn't affect the rest,
I'd say there is no need to spam the list with whole series respin, 
just post rebased v10 12/20 as reply here

If it's more than that, respin series.

> 
> Regards,
> Mauro
> 

