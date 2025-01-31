Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp529424njb;
        Fri, 31 Jan 2025 08:18:22 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVDbxAqtvBdCzJU9706qQ01BFkHRzoxqXtE7vqENXOIb17mahPrnCqgGCtSIf/BBt52PBvsXi/f3wqXww==@linaro.org
X-Google-Smtp-Source: AGHT+IGMUpCchtOPQYmt3rCifkPXBhe1ZvO3Gwj3NFguITWld2cyoT0v0ABWEkid/Zuh6fEYeM1A
X-Received: by 2002:a17:902:ea06:b0:216:7175:41bd with SMTP id d9443c01a7336-21dd7dde0e0mr149701805ad.39.1738340302537;
        Fri, 31 Jan 2025 08:18:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738340302; cv=pass;
        d=google.com; s=arc-20240605;
        b=i5D4v41ULX7bnplD+KpJoHS8D2MtN88KWP1CE5ky7USvAH3DGGndi2kb2eicd4hgx5
         /948b7xbjCO8x26oqy0givq4WV4OabAyUlWIOI74yuB4eqYBhGkOdBqRSNqfDbB7Yn/R
         UkeRAJkKGjiInvSNpdT7pukf9GruNLGZ+JzHONsTDsOlNQTOF3RN84V5VjkOuT0j0X8O
         Yxc0AKE/2plQbGFN4AZzpCF5vzzqv/65hUzHhr5YoZkb+nEm67aTwHSdjHfVOxZlsoSz
         Cfkjwwpyj9X0W64CGx+6TOYC51N5Tkwc/9yJQNVbburAMU3NulvNvaB5lI5gY3NYw9C0
         7vVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=xN4tlJAeXpTbN5CTSH52hCag/ETwSiaLiFtxtnXgRB0=;
        fh=Qe1Z/MD0vjI9Zl9s5p7E7+jjEbdm3kdir/Riz6VYbdE=;
        b=jVWUAy2GczDnSRJ4fy3re8xC2+Fll5HTFE9aO2qTXR+UW+ALdxUFbXMhVXOcp0RPXn
         DgIE/UE9gBqZFmp89Y9qRQPt5be7iwEks+QG0oYIAv0DU8fMDglpwHxO3sy7wrlpZMed
         /1QVImbVEfRWitsiRrdnKR/CZkOSHLUHSjZlBhwr9aF/fOXf6rhHEnPAr2pw2sqThfBD
         oBuEtN8qCBM6cmsngT9H29cFuYXZVAnm7ToNvslFNA3Zsu8LW4dB8XN4bQJRknVkN8Uz
         yWCEl9PzM7cmOT80zEfbPz4YxZRbc3Q8Ltc1ynp8i3zJua8DEKUgi6zU0sztO1qZj334
         a7sg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=lnLB8DrX;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-494710-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-494710-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-494710-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d9443c01a7336-21de5f71d4esi38146065ad.597.2025.01.31.08.18.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:18:22 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-494710-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=lnLB8DrX;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-494710-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-494710-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B5293A62F1
	for <alex.bennee@linaro.org>; Fri, 31 Jan 2025 16:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B011E1C3A;
	Fri, 31 Jan 2025 16:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnLB8DrX"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6528467
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738340297; cv=none; b=l+HYWs/oZnfFtqWx6+1VQbcdxDrs3R36vwxd0znFpdX15QjUGpXUoaEZTeeZnIOowAXGyD01kktHwBJKwlfKgme6VZdJhtXbW787+Y3FJm0QE0ARTQK7+lrIF5JIti1PlQbVZFqBhzGQZU//cOGb4iRuh5Li77nEpKzka28kGIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738340297; c=relaxed/simple;
	bh=+DKv5p5gtr/qhVvWh4VwKvw+q8ap1xODp8LMl0FjSLA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RU6kilr+BUwXn5wincYGrO+UKrEKGiIj2eesjuvcUSxRqoIEYNiL4cldoh1j5r2HpVoERj9GYbZbVKSqC0IsvB8BejJ6O5LTJWlaf80SJ5Dm8WiYyVWdLfrkqHD2H4DQ81WAYMVFHjEAgPkbEC0jjDomClHB2cNda41ok/OxWs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnLB8DrX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597E5C4CED1;
	Fri, 31 Jan 2025 16:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738340297;
	bh=+DKv5p5gtr/qhVvWh4VwKvw+q8ap1xODp8LMl0FjSLA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lnLB8DrXKJwyzfLcdlDTYUyTZB+XsYmVs1/BWFMCFkQCBUaYmMTPG3LorYW97DY8q
	 x9VtBYrXOMeVPxAs/U/lkP268bqg6WFUr79FymjuCk0u6k79iPxxWeuPakJ7CeBFmt
	 MXhuSMmI5/WpddygbxZlEoqKO0xyiTRb0UZ9fFY4Khz2ubCwGYe7w6yMMDN+WQCXb7
	 uMbx13/O6F9Zs+g7SUV1Spsu3kuxBmbZ5ofnscv0hXADi0wFkPfppa0CgHFiVVz+IL
	 HtefOVT1j9EM49Ee9UAkLdVM/H9BcCfC+l7GN5yft12vwYoyjQYV2B6qW21ktzkM7G
	 0THzba+BGbLoA==
Date: Fri, 31 Jan 2025 17:18:12 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/13] tests/acpi: virt: allow acpi table changes for
 a new table: HEST
Message-ID: <20250131171812.2ad9b1fd@foz.lan>
In-Reply-To: <20250130153830.2e4e081d@imammedo.users.ipa.redhat.com>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
	<1390b46682f2bac3587239d03a0ba22d18a9a044.1738137123.git.mchehab+huawei@kernel.org>
	<20250129160328.2f66584c@imammedo.users.ipa.redhat.com>
	<20250130140324.06cdd4bf@foz.lan>
	<20250130153830.2e4e081d@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: FJGChKZE4FlR

Em Thu, 30 Jan 2025 15:38:30 +0100
Igor Mammedov <imammedo@redhat.com> escreveu:

> On Thu, 30 Jan 2025 14:03:24 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Em Wed, 29 Jan 2025 16:03:28 +0100
> > Igor Mammedov <imammedo@redhat.com> escreveu:
> >   
> > > On Wed, 29 Jan 2025 09:04:08 +0100
> > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > >     
> > > > The DSDT table will also be affected by such change.
> > > > 
> > > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>      
> > > 
> > > move it right before the patch that would actually make changes to tables (10/13)    
> > 
> > Table changes happens on two patches:
> > 
> > - patch 03/13: acpi/ghes: add a firmware file with HEST address  
> 
> this one shouldn't affect bios tables test as it only checks ACPI and SMBIOS tables,
> and hest addr file is not either.

Heh, true.

> Do you really see test failing on this patch?

No. I just misunderstood the instructions, as it was not clear to me there 
that I shouldn't be adding there the HEST table.

> > 	HEST table was added here
> > 
> > - patch 10/13: arm/virt: Wire up a GED error device for ACPI / GHES 
> > 
> > 	DSDT changes happen here.
> > 
> > If the idea is to avoid make check to fail between those two patches,
> > we need either to split them on 4 patches (one before/one after each
> > change) or do like I did on this series: whitelist before patch 3,
> > update after patch 10.  
> 
> It would be better to group patches that should change ACPI tables
> close together so that a pair of whitelist/update could cover it.
> However it depends on how many changes are there, i.e. acpi diff
> should be digestible for a reader. So there is no hard border here,
> just use common sense.
> 
> However when the whitelist is covers all series where only few patches
> actually result in tables change, that miss-leads the reader since
> whitelist patch basically tells 'watch out for changes since this moment'
> and 'update' patch declares no more changes should happen.
> The same applies to bisection, where closer the gap between
> whitelist/update the better if the test case is the trigger.
> No need to be fanatical and do it around each patch,
> just make it observable (i.e. some small range of commits). 

Got it. Yeah, there was just one patch affecting DSDT table: the one
adding an AML representation for the GED notification device.

I fixed it for the next (hopefully the final) version.

Thanks,
Mauro
