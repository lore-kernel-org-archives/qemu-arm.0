Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp237779njf;
        Tue, 13 Aug 2024 12:00:00 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCW6vaZPXM47f3f3b2K21j0yqYMMCusuB3++4kKgsi/1DxAkk5RpwuImZbIdxrXBjbZiopymBcZpatCUBA59r0QBmhjuAItB
X-Google-Smtp-Source: AGHT+IHZ4eu6UCLn+LbycWrWpOnLolKO6UB9zdNAxDC6eKyqmb/J+X+RwrF6hZddNrnqCwQauD9O
X-Received: by 2002:a05:6214:3f8b:b0:6b5:40d:c2d9 with SMTP id 6a1803df08f44-6bf5d1809bemr6227676d6.19.1723575600073;
        Tue, 13 Aug 2024 12:00:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723575600; cv=pass;
        d=google.com; s=arc-20160816;
        b=O4kEFbzcdxwg5JVSeLpCLeNAUyLzbJ9e1ep8NJSF/tynOHuEk1ECL7L/P3306AXlyf
         vT00YXO+C9e3inVCMISUd0XxanrImpdjeonrsayxlQq+ydmmiTN1oYJo3PfkTocOWqzA
         5armOTqVpA6zFlHME5MrCS6I92VtNmYRdDoPJ2xty7EV0KssvlSecdIGiH0xAATngYYV
         BOPCryEd5uBZlNNWUDWowM0Fqfa/CVs1jsmpdMI+ktsqZyVoaCCKUsFTp8dBwtngkvKX
         LVjGHlLWRoZ6zCJV/VKpW/HusuEPSDpaFICVWSL6vy61g53rF5MHoF7kHP016rrB43ap
         K0nA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=SsT6KY69sTSQqjRzEq4eaqhUfeYC5jcxWmN7X4r/TW4=;
        fh=33lchV9jbo6F1fNnffP4idbdCIaYCrmc6nnq6V4oNZ0=;
        b=ZceR/S54LlbwX5spLEA4xAftFgLIK2ngq5wNBS4kadhwsy46Mz7gaqYBjPKId/Pq9c
         UgOxVXCk3th2gXZYEAqqYHb1Bj/07+GhkVlhK1pisVUunQR+MfYSWBOiD0DNZ9SlxPwz
         6cyDEuqhvC61Q64XcJD//wIaSsC6Gsn4r5euAB60vdnimchjHClnqaxJy6qXV7Nm67I0
         BfZsnrBeNxxGC0dz+s6/xQe+cgMKz8fG531czAcCIoUXOhhpD0KO+l9tK3zqN8y9JgOR
         JzmJyRRKHE0O3Ftcf1nDmczB+kCwIS5mVzuEZNC/YRKE80n5l2Rs3Sv7hpNfXruMJfRz
         a56g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Mbf0Bgex;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-285374-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-285374-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-285374-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bd82e34eb1si6057596d6.246.2024.08.13.11.59.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 12:00:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-285374-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Mbf0Bgex;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-285374-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-285374-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7AC91C221A1
	for <alex.bennee@linaro.org>; Tue, 13 Aug 2024 18:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4121A3BC7;
	Tue, 13 Aug 2024 18:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mbf0Bgex"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BA61A38EC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Aug 2024 18:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723575556; cv=none; b=HwVvrQET+hRC252DpGQyoZJ9muB5/GJYcfas/6MG3/e7+hiA7eRAYaWxhIW965Dc75HkErL1N5nZgWUbiP0c413LBVgRCFzOOrEmXZxHGST+HlMKkCFkw7KA13UjeUVAXGZ8vFFteNV5JSJ3O0yJy9lhdmO8uDi5XB7oLsdLGKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723575556; c=relaxed/simple;
	bh=WO40j49FkGu+Q8lTsHl/pcFtXmA+HQMmF+nDSE40RQk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NHRJiezF3S542DmJjFqPtU6hncL0asMS6DuQQn+jhDvKRTCKIcZzUp5JPqBtoRuWxxMVx8HQkpb5teT06HvUMgiIhCU6SsqxO8gtxoGbEvx8nzX3kjQAN0XGjeviISabX4+DmbD8sH/04yNfkahYeCHg4PnxzlZSuugXl2GmIFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mbf0Bgex; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F37C32782;
	Tue, 13 Aug 2024 18:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723575556;
	bh=WO40j49FkGu+Q8lTsHl/pcFtXmA+HQMmF+nDSE40RQk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Mbf0Bgex0kjUzIdIRt26tVfsngq7XSfxksXF7oPIKuIoucAo3QrY1RZhxbrMkATsE
	 HGxj4AtZyiv9bqJ/CG+caeC8WZ9BtPBT8PzS3P77EVlR3hgwtcOSm5lBvdmdVYM3dj
	 BXMkHP3wXC5QYvkopT0JhXtKKEuRYbyEqqSmg95z7edaG7HNGJsJOR+DnKMDscbGI2
	 92J6OP4ghGUoH58MoBCEU1oX6aGn4J0omchSqdZ47Bti23cOVjQSgou9G/rYkNV9OU
	 kk/Fgt7TJSTmI7Dwkk1MCyKbeb2jM6Vcg2nW1hyqK1alv4Ae5kRaswmmHWB5lKbbH5
	 5Q6t3XsMuBviQ==
Date: Tue, 13 Aug 2024 20:59:11 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 <linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v5 6/7] acpi/ghes: add support for generic error
 injection via QAPI
Message-ID: <20240813205911.1719db56@foz.lan>
In-Reply-To: <20240812113900.25078ccc@imammedo.users.ipa.redhat.com>
References: <cover.1722634602.git.mchehab+huawei@kernel.org>
	<20c491e357340e0062b6ff09867c1661ed4d2479.1722634602.git.mchehab+huawei@kernel.org>
	<20240806163113.3bdc260a@imammedo.users.ipa.redhat.com>
	<20240807152547.000058fd@Huawei.com>
	<20240808101107.105a124f@imammedo.users.ipa.redhat.com>
	<20240808201903.077093ca@foz.lan>
	<20240812113900.25078ccc@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: gbhymOeKnAXK

Em Mon, 12 Aug 2024 11:39:00 +0200
Igor Mammedov <imammedo@redhat.com> escreveu:

> > We may also store cper_offset there via bios_linker_loader_add_pointer()
> > and/or use bios_linker_loader_write_pointer(), but I can't see how the
> > data stored there can be retrieved, nor any advantage of using it instead
> > of the current code, as, in the end, we'll have 3 addresses that will be
> > used:
> > 
> > 	- an address where a pointer to CPER record will be stored;
> > 	- an address where the ack will be stored;
> > 	- an address where the actual CPER record will be stored.
> > 
> > And those are calculated on a single function and are all stored at the
> > ACPI table files.
> >
> > What am I missing?  
> 
> That's basically (2) approach and it works to some degree,
> unfortunately it's fragile when we start talking about migration
> and changing layout in the future.
> 
> Lets take as example increasing size of 1) 'Generic Error Status Block',
> we are considering. Old QEMU will, tell firmware to allocate 1K buffer
> for it and calculated offsets to [1] (that you've stored/calculated) will
> include this assumption.
> Then in newer we QEMU increase size of [1] and all hardcoded offsets will
> account for new size, but if we migrate guest from old QEMU to this newer
> one all HEST tables layout within guest will match old QEMU assumptions,
> and as result newer QEMU with larger block size will write CPERs at wrong
> address considering we are still running guest from old QEMU.
> That's just one example.
> 
> To make it work there a number of ways, but the ultimate goal is to pick
> one that's the least fragile and won't snowball in maintenance nightmare
> as number of GHES sources increases over time.
> 
> This series tries to solve problem of mapping GHES source to
> a corresponding 'Generic Error Status Block' and related registers.
> However we are missing access to this mapping since it only
> exists in guest patched HEST (i.e in guest RAM only).
> 
> The robust way to make it work would be for QEMU to get a pointer
> to whole HEST table and then enumerate GHES sources and related
> error/ack registers directly from guest RAM (sidestepping layout
> change issues this way).
> 
> what I'm proposing is to use bios_linker_loader_write_pointer()
> (only once) so that firmware could tell QEMU address of HEST table,
> in which one can find a GHES source and always correct error/ack
> pointers (regardless of table[s] layout changes).

Ok, got it. Such change was not easy, but I finally figured out how
to make it actually work.

I'll address tomorrow your comment on patch 5/10 about using raw data also 
for the other parts of CPER (generic error status and generic error data).

If you want to do a sneak peak, I'm keeping the latest development
version here:

	https://gitlab.com/mchehab_kernel/qemu/-/commits/qemu_submission?ref_type=heads

In particular, the patch changing from /etc/hardware_errors offset to
a HEST offset is at:

	https://gitlab.com/mchehab_kernel/qemu/-/commit/9197d22de09df97ce3d6725cb21bd2114c2eb43c

It contains several cleanups to make the logic clearer and more robust.

Thanks,
Mauro
