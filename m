Received: by 2002:a05:7022:fe04:b0:85:21:bd5b with SMTP id vc4csp979736dlb;
        Thu, 1 Aug 2024 07:34:23 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVqytoJXm6+n7lse958K/iOIeo3ouXrR0WmcQtKj0fl8w8m4itatP6aofpbMaWLvy5NcVrrfU7J1XPmAXuiAou9D/XzhiNF
X-Google-Smtp-Source: AGHT+IGLP28aYUHo5BLwSq1Q0D0c/0gvHEBI4GycMpYbHXdaHRlYGO48AfI3cPWOvEKVJREJLcYk
X-Received: by 2002:a17:903:228b:b0:1fa:2b89:f549 with SMTP id d9443c01a7336-1ff57250fbbmr4662425ad.10.1722522863658;
        Thu, 01 Aug 2024 07:34:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722522863; cv=pass;
        d=google.com; s=arc-20160816;
        b=pfohRelDen2HFDmPlzItPmO9MaFrMsI2oEct2DNHDQGG9WwhpA9cgaYuXodqZoxato
         0TbrPEJDnPtj4iuaauA4j9uuQsEa5X8xVAvMUCTW65J/5TZd5Vft0Ns32kzibZyuETud
         7qicqwSm57NXSRTz4a8pvljCMkg16CCeGBfofO7iaQPC/9Tf/IukB1EGXFb2QGct4+PV
         L34XDCFazC5FvGGbDnUinUpPSkJdm5Cgk+P/ZPqIirbfSK/eGmCtwMGLi5vRfA0TKM1e
         FM1TYR6WmhJKhV0LjxxzrY1QA2mKKqdfRYpnhScM1eSQB84uVq20WIvmZslTQUXC97ma
         X6Wg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=3bSmw71LH8431rfZkSviN5PmmfnqC8POnf5tWTKjpM0=;
        fh=ztu+7y0Pc0MGlFkdBUqcRJ8TIWQg+rF9cUr9MoKbAk4=;
        b=MlAhpK/ox7ckV8bsU6eFs1FAstunxR7ium5Si0qLOErZk7mV1WjkF4ZkUbMQvJgliz
         HCKlch3KG/zuOltYBkoXukuH8JNVhfhMKg7T4T8OwCENRE8TXy/39aiG0+m9TqXqg4wu
         S+sidREkUga6VyFie4YccvzblEVDdWllg8CM7rkRTVigZLDVindIexQulWgO6iJD1bw6
         J8unZwkWdKi7GRPE0OLi5ujkJDV4CQcy4chb9yqEIEt4m9qBbLz3CwSOEKA+6AUByngc
         N9hxjoh7Q0IlajthtBDHdnIW3f0dcWivO3KiBfWcB4zanDGLpvkQckM5VaSldHOKi5ar
         xnfQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=n2AIQLJJ;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-271430-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-271430-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-271430-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d9443c01a7336-1fed7fa4dd9si171489815ad.462.2024.08.01.07.34.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 07:34:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-271430-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=n2AIQLJJ;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-271430-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-271430-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AC09285132
	for <alex.bennee@linaro.org>; Thu,  1 Aug 2024 14:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3981A4F31;
	Thu,  1 Aug 2024 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2AIQLJJ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFFF1A4887
	for <linux-kernel@vger.kernel.org>; Thu,  1 Aug 2024 14:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722522858; cv=none; b=MsZI5G9Cg0gNz6R2I4IcUoZhCBrKZ/V3XI2YX9mX2u1j+E8SgCWHUiT+K7XBZecHCbVe/fj9i/KmZpu6fs9zX5SePX/GiH+A5sGzbcSXQ5x7dsFp/fnNrysOLhL8WrgwPKdp6paFnYTfoMJS6EWQqxtvDog9FwD9bxE5KgaG5PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722522858; c=relaxed/simple;
	bh=pCLks0KKkjWtBuTbXUEEAzmun/Ei05ls4gs/i/vnJkA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VlPuHrZXD/9prYkE904xjNPI/i1VMb6L6EEilXLrKSLstIfrEX1yc39fA/5J43FMCXzYxYYCgjggqJGMuA7JvCXpfEv/gXLeTFUvHPnYqO1CLXOA1C12R2qPPR505hD1CZnR7hd7yb/oUQ2C/QvfePII01u2NfaveguvAK9zbYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2AIQLJJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F49C32786;
	Thu,  1 Aug 2024 14:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722522858;
	bh=pCLks0KKkjWtBuTbXUEEAzmun/Ei05ls4gs/i/vnJkA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n2AIQLJJf5bEF80+we21wlGogYviVoZsrJTtML8CzYbHiFT+ORLqStGsFzUVHepmr
	 bYejuNe5A81NwCH+QMWgFRKAVBHVZQjEMHxsVJTNb/zTnk0dmQrs1RWuGvNtKbzGBW
	 BIPYND2tmJ2hnwU6vNQHUuYDIimSt8Q+eSq+5TPjfVlnfUOCM7287ln85SmfFDIV4C
	 NvY2k4sBq/YgT3Sdmk0vNKggUFOo1iQIt+HxPw59mZ8bl2byN47cXVz1wl7yxlooeF
	 LJennGKlTygqwvoHoaFkrbvK87Q7R1oem1ibFwkLF2nUAR0UkAHotbx32GMT845yeD
	 YX8szBWN6mcHQ==
Date: Thu, 1 Aug 2024 16:34:12 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Eric Blake
 <eblake@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 4/7] acpi/ghes: Add a logic to handle block addresses
 and FW first ARM processor error injection
Message-ID: <20240801163412.48740ddb@foz.lan>
In-Reply-To: <87zfq0b75i.fsf@pond.sub.org>
References: <cover.1721630625.git.mchehab+huawei@kernel.org>
	<6a3542a7d8acfbf88c906ec6f6dc5a697257b461.1721630625.git.mchehab+huawei@kernel.org>
	<87bk2lreeb.fsf@pond.sub.org>
	<20240729142154.44d484c4@foz.lan>
	<87zfq0b75i.fsf@pond.sub.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: mIk8zYPSH4L2

Em Mon, 29 Jul 2024 16:32:41 +0200
Markus Armbruster <armbru@redhat.com> escreveu:

>  Yes, as this CPER record is defined only for arm. There are three other
> > processor error info:
> > 	- for x86;
> > 	- for ia32;
> > 	- for "generic cpu".
> >
> > They have different structures, with different fields.  
> 
> A generic inject-error command feels nicer, but coding its arguments in
> the schema could be more trouble than it's worth.  I'm not asking you to
> try.
> 
> A target-specific command like this one should be conditional.  Try
> this:
> 
>     { 'command': 'arm-inject-error',
>       'data': { 'errortypes': ['ArmProcessorErrorType'] },
>       'features': [ 'unstable' ],
>       'if': 'TARGET_ARM' }
> 
> No need to provide a qmp_arm_inject_error() stub then.

I tried it, but it generates lots of poison errors. Basically, QAPI
generation includes poison.h, making it to complain about on
non-ARM builds.

Anyway, the new version I'm about to submit is not dependent on
ARM anymore (as it is a generic GHES error injection that can be used
by any arch).

Still, as I added a Kconfig symbol for it, I still needed a stub.

It would be cool not needing it, but on the other hand it doesn't
hurt much.

> >> If we encode the the error to inject as an enum value, adding more will
> >> be hard.
> >> 
> >> If we wrap the enum in a struct
> >> 
> >>     { 'struct': 'ArmProcessorError',
> >>       'data': { 'type': 'ArmProcessorErrorType' } }
> >> 
> >> we can later extend it like
> >> 
> >>     { 'union': 'ArmProcessorError',
> >>       'base: { 'type': 'ArmProcessorErrorType' }
> >>       'data': {
> >>           'bus-error': 'ArmProcessorBusErrorData' } }
> >> 
> >>     { 'struct': 'ArmProcessorBusErrorData',
> >>       'data': ... }  
> >
> > I don't see this working as one might expect. See, the ARM error
> > information data can be repeated from 1 to 255 times. It is given 
> > by this struct (see patch 7):
> >
> > 	{ 'struct': 'ArmProcessorErrorInformation',
> > 	  'data': { '*validation': ['ArmPeiValidationBits'],
> > 	            'type': ['ArmProcessorErrorType'],
> > 	            '*multiple-error': 'uint16',
> > 	            '*flags': ['ArmProcessorFlags'],
> > 	            '*error-info': 'uint64',
> > 	            '*virt-addr':  'uint64',
> > 	            '*phy-addr': 'uint64'}
> > 	}
> >
> > According with the UEFI spec, the type is always be present.
> > The other fields are marked as valid or not via the field
> > "validation". So, there's one bit indicating what is valid between
> > the fields at the PEI structure, e. g.:
> >
> > 	- multiple-error: multiple occurrences of the error;
> > 	- flags;
> > 	- error-info: error information;
> > 	- virt-addr: virtual address;
> > 	- phy-addr: physical address.
> >
> > There are also other fields that are global for the entire record,
> > also marked as valid or not via another bitmask.
> >
> > The contents of almost all those fields are independent of the error
> > type. The only field which content is affected by the error type is
> > "error-info", and the definition of such field is not fully specified.
> >
> > So, currently, UEFI spec only defines it when:
> >
> > 1. the error type has just one bit set;
> > 2. the error type is either cache, TLB or bus error[1].
> >    If type is micro-arch-specific error, the spec doesn't tell how this 
> >    field if filled.
> >
> > To make the API simple (yet powerful), I opted to not enforce any encoding
> > for error-info: let userspace fill it as required and use some default
> > that would make sense, if this is not passed via QMP.
> >
> > [1] See https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html#arm-processor-error-information  
> 
> I asked because designing for extensibility is good practice.
> 
> It's not a hard requirement here, because feature 'unstable' gives us
> lincense to change the interface incompatibly.

IMO keeping it as unstable makes sense, as this QAPI is specific for
error injection, which is hardly a feature widely used. Also, with the
script approach, the actual CPER record generation happens on a script.

If we provide it together with QEMU, if the QAPI ever changes, the
changes inside the script will happen altogether. So, IMO, no need to
make it stable.

Thanks,
Mauro
