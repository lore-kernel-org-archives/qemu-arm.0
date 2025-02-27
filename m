Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp118292njb;
        Thu, 27 Feb 2025 02:11:16 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVZfhJLjLRUXGYG1cfJ0P0fsOOVJCwWYRKyhlsTIR5mA2EVpjE99s6jBj4v+oM7F2Gluck8X9esOLcFwA==@linaro.org
X-Google-Smtp-Source: AGHT+IHRM2+cHV1TWbC962Io22kiP2OCtMe3A/7urxwe87Xj/nsOkP+6MPeK0r+NjooTwGISGfqg
X-Received: by 2002:ac8:5a12:0:b0:472:147f:1db7 with SMTP id d75a77b69052e-47224716757mr324571061cf.11.1740651076723;
        Thu, 27 Feb 2025 02:11:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740651076; cv=pass;
        d=google.com; s=arc-20240605;
        b=DbxZMUP5SwzCQBBxQmZOhKAspw7R3HLHsGOsAaLHHhdCvFbXHa57vuWcf/PlJ3N4Q1
         nfIa3fRnQguLU3yQo5P0jt9E6ai/BEokVUBfxIbnlclUiWHti5zYtaJQO+0TUoK8RWi7
         EfpmI/+N39DptZy6ehipB1ZmE/2nTKl67EhI4L6z09XKYiQb6q3tSRy5msUCJPot15a0
         kqc4hvlflQAgY417c2sIuS9NY/QAq5VlFgcMIiQqI+RkoGO2CwrnysMNknU0x1Igisiz
         QoXrN5ooUv4W44Z34ztXR5IJLRJ/NiwRndOpNURifuMnHpxwZKZP99R/2lkarjB1dMXw
         pxNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=sZ2LhG9Tw+YszoA2KMTzWu2inpY0QAOIkg8x89/NabM=;
        fh=+IIZYibM3VqPU5vc5LSAgrCj2PY9BY2dnDrMb9YCvSE=;
        b=QMRujo3LkQ4OEY3eqOVAPL/kIKf8dnLWKOHpqiFBCKun5vk1//dQIvZ34NGrrKc3Yx
         74n8nsCxZczF1uIqioqtUS2dDQ8F62JtSEdkcObWaNIjAP99ZT9JT9zwp3sWxtUJKY9N
         8CpRSSW1PdvhdIfxRO/eoENAMBxxR3Fz8kl4FWXL9eJPM5nKd2xcYM3gLbIbDjV//1bX
         zAXY0tGJOtLbnlvse5GsajUmBw8pRDhs+ENKkZYhLKdP6Kc/QCYC3ZHDE66eO3L3Cqn0
         9+rlfxGbLSHSmFgA0FhidS4ezH09sofL2L7pAHJh8oJSHZcfD/LVAqoXwONEbYqB5b+H
         ffoA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=eiYV5Xgp;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-535964-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-535964-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-535964-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id d75a77b69052e-474723fe377si9963091cf.216.2025.02.27.02.11.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 02:11:16 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-535964-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=eiYV5Xgp;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-535964-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-535964-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A222516F991
	for <alex.bennee@linaro.org>; Thu, 27 Feb 2025 10:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C99227EAE;
	Thu, 27 Feb 2025 10:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eiYV5Xgp"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469ED227E95
	for <linux-kernel@vger.kernel.org>; Thu, 27 Feb 2025 10:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740651071; cv=none; b=faisQxTndcJFCJh9owA+tTxf2IZ77NUORtF2ePOvG7aleYTvxwPWiqt24GdNEnhfTQ4Nm/Gg0O1LDs3ns3mmgRXBSIUrC/hUaw6FgwKMTayvjb0laFxDo6i0Ahz27gyQu+oCG7IXJYSpuYtfVf/RMXE7l22/B4ECf8TnBbJU8FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740651071; c=relaxed/simple;
	bh=3VbG0f+R5quSXn4piQUIOSAIYO8Kb99nmMmrqQDcbgI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jR0Z7tJGhQo7qquWxB+FckynWDdxW8WtYKcZ/t6cA5cAt8Y0OIPr2puMyPoKLY60IPVRNzbmfB3UHc3Kmp6MfIMOHJnJUCedxl7K3IWG8/UlwjWESZqWeApFuWQ01NR1s6OCPwZd7jwiuR6ibNUoPpHy5uWGzfXA9b1XZ6HC31I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eiYV5Xgp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82F0C4CEE9;
	Thu, 27 Feb 2025 10:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740651070;
	bh=3VbG0f+R5quSXn4piQUIOSAIYO8Kb99nmMmrqQDcbgI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eiYV5XgphA4L9gSM2Liy1EkmaHuBYOrU+Oz6IdWNgqqX1RyDWbpU+95EgZ/R9Nk+H
	 SXGGT1PU/Y6/qVFkWVPJFuLyLzlnJQ+SwMq2ZvB8S8J8p5uUzoa/A7gAvRV32Jkcub
	 ocsEAN3Sywe+P5i247MUC1V4pUS2lPqfX6d9iedWnJNuKNpsvtwXfX1xHYcmOwvXyp
	 mOg4qXUUzRzw3w7I5BDK4e6ZhiWhRWD2/OhQcwYqm7g4gRQtnrzCj28Aes8eXc64q2
	 TKaZi5XKJidI+j2q3zy1KbjQrSBV5yrzK+O5MBXL4+zhC2PbJkb7qdV4MIAALEDov9
	 AzbyKSR92m5gw==
Date: Thu, 27 Feb 2025 11:11:05 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/14] acpi/ghes: Use HEST table offsets when
 preparing GHES records
Message-ID: <20250227111105.194037f1@foz.lan>
In-Reply-To: <20250227102255.6843705e@imammedo.users.ipa.redhat.com>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
	<9610ff88cf6fdc59cbfc8871d653fd890391be1e.1738345063.git.mchehab+huawei@kernel.org>
	<20250203153423.3e4de17c@imammedo.users.ipa.redhat.com>
	<20250221070221.329bdfb0@foz.lan>
	<20250225104327.0a2d1cb4@imammedo.users.ipa.redhat.com>
	<20250226171406.19c2de6b@sal.lan>
	<20250227102255.6843705e@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: WgMhTYdFjb0W

Em Thu, 27 Feb 2025 10:22:55 +0100
Igor Mammedov <imammedo@redhat.com> escreveu:

> On Wed, 26 Feb 2025 17:14:06 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Em Tue, 25 Feb 2025 10:43:27 +0100
> > Igor Mammedov <imammedo@redhat.com> escreveu:
> >   
> > > On Fri, 21 Feb 2025 07:02:21 +0100
> > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > >     
> > > > Em Mon, 3 Feb 2025 15:34:23 +0100
> > > > Igor Mammedov <imammedo@redhat.com> escreveu:
> > > >       
> > > > > On Fri, 31 Jan 2025 18:42:44 +0100
> > > > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > > > >         
> > > > > > There are two pointers that are needed during error injection:
> > > > > > 
> > > > > > 1. The start address of the CPER block to be stored;
> > > > > > 2. The address of the ack.
> > > > > > 
> > > > > > It is preferable to calculate them from the HEST table.  This allows
> > > > > > checking the source ID, the size of the table and the type of the
> > > > > > HEST error block structures.
> > > > > > 
> > > > > > Yet, keep the old code, as this is needed for migration purposes.
> > > > > > 
> > > > > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > > > > ---
> > > > > >  hw/acpi/ghes.c         | 132 ++++++++++++++++++++++++++++++++++++-----
> > > > > >  include/hw/acpi/ghes.h |   1 +
> > > > > >  2 files changed, 119 insertions(+), 14 deletions(-)
> > > > > > 
> > > > > > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > > > > > index 27478f2d5674..8f284fd191a6 100644
> > > > > > --- a/hw/acpi/ghes.c
> > > > > > +++ b/hw/acpi/ghes.c
> > > > > > @@ -41,6 +41,12 @@
> > > > > >  /* Address offset in Generic Address Structure(GAS) */
> > > > > >  #define GAS_ADDR_OFFSET 4
> > > > > >  
> > > > > > +/*
> > > > > > + * ACPI spec 1.0b
> > > > > > + * 5.2.3 System Description Table Header
> > > > > > + */
> > > > > > +#define ACPI_DESC_HEADER_OFFSET     36
> > > > > > +
> > > > > >  /*
> > > > > >   * The total size of Generic Error Data Entry
> > > > > >   * ACPI 6.1/6.2: 18.3.2.7.1 Generic Error Data,
> > > > > > @@ -61,6 +67,25 @@
> > > > > >   */
> > > > > >  #define ACPI_GHES_GESB_SIZE                 20
> > > > > >  
> > > > > > +/*
> > > > > > + * Offsets with regards to the start of the HEST table stored at
> > > > > > + * ags->hest_addr_le,          
> > > > > 
> > > > > If I read this literary, then offsets above are not what
> > > > > declared later in this patch.
> > > > > I'd really drop this comment altogether as it's confusing,
> > > > > and rather get variables/macro naming right
> > > > >         
> > > > > > according with the memory layout map at
> > > > > > + * docs/specs/acpi_hest_ghes.rst.
> > > > > > + */          
> > > > > 
> > > > > what we need is update to above doc, describing new and old ways.
> > > > > a separate patch.        
> > > > 
> > > > I can't see anything that should be changed at
> > > > docs/specs/acpi_hest_ghes.rst, as this series doesn't change the
> > > > firmware layout: we're still using two firmware tables:
> > > > 
> > > > - etc/acpi/tables, with HEST on it;
> > > > - etc/hardware_errors, with:
> > > > 	- error block addresses;
> > > > 	- read_ack registers;
> > > > 	- CPER records.
> > > > 
> > > > The only changes that this series introduce are related to how
> > > > the error generation logic navigates between HEST and hw_errors
> > > > firmware. This is not described at acpi_hest_ghes.rst, and both
> > > > ways follow ACPI specs to the letter.
> > > > 
> > > > The only difference is that the code which populates the CPER
> > > > record and the error/read offsets doesn't require to know how
> > > > the HEST table generation placed offsets, as it will basically
> > > > reproduce what OSPM firmware does when handling	HEST events.      
> > > 
> > > section 8 describes old way to get to address to record old CPER,
> > > so it needs to amended to also describe a new approach and say
> > > which way is used for which version.
> > > 
> > > possibly section 11 might need some messaging as well.    
> > 
> > Ok, I'll modify it and place at the end of the series. Please
> > see below if the new text is ok for you.
> > 
> > ---
> > 
> > [PATCH] docs/specs/acpi_hest_ghes.rst: update it to reflect some changes  
> 
> s/^^^/docs: hest: add new "etc/acpi_table_hest_addr" and update workflow/
> 
> > 
> > While the HEST layout didn't change, there are some internal
> > changes related to how offsets are calculated and how memory error
> > events are triggered.
> > 
> > Update specs to reflect such changes.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > 
> > diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
> > index c3e9f8d9a702..f22d2eefdec7 100644
> > --- a/docs/specs/acpi_hest_ghes.rst
> > +++ b/docs/specs/acpi_hest_ghes.rst
> > @@ -89,12 +89,21 @@ Design Details
> >      addresses in the "error_block_address" fields with a pointer to the
> >      respective "Error Status Data Block" in the "etc/hardware_errors" blob.
> >  
> > -(8) QEMU defines a third and write-only fw_cfg blob which is called
> > -    "etc/hardware_errors_addr". Through that blob, the firmware can send back
> > -    the guest-side allocation addresses to QEMU. The "etc/hardware_errors_addr"
> > -    blob contains a 8-byte entry. QEMU generates a single WRITE_POINTER command
> > -    for the firmware. The firmware will write back the start address of
> > -    "etc/hardware_errors" blob to the fw_cfg file "etc/hardware_errors_addr".
> > +(8) QEMU defines a third and write-only fw_cfg blob to store the location
> > +    where the error block offsets, read ack registers and CPER records are
> > +    stored.
> > +
> > +    Up to QEMU 9.2, the location was at "etc/hardware_errors_addr", and
> > +    contains an offset for the beginning of "etc/hardware_errors".
> > +
> > +    Newer versions place the location at "etc/acpi_table_hest_addr",
> > +    pointing to the beginning of the HEST table.
> > +
> > +    Through that such offsets, the firmware can send back the guest-side  
>        ^^^^^^^^^^^^^^^^^^^^^^^^^ can't parse that, suggest to just drop the phrase
> 
> > +    allocation addresses to QEMU. They contain a 8-byte entry. QEMU generates
> > +    a single WRITE_POINTER command for the firmware. The firmware will write
> > +    back the start address of either "etc/hardware_errors" or HEST table at  
>                 ^^^^ drop this?
> 
> > +    the correspoinding address firmware.
> >  
> >  (9) When QEMU gets a SIGBUS from the kernel, QEMU writes CPER into corresponding
> >      "Error Status Data Block", guest memory, and then injects platform specific
> > @@ -105,8 +114,6 @@ Design Details
> >       kernel, on receiving notification, guest APEI driver could read the CPER error
> >       and take appropriate action.
> >  
> > -(11) kvm_arch_on_sigbus_vcpu() uses source_id as index in "etc/hardware_errors" to
> > -     find out "Error Status Data Block" entry corresponding to error source. So supported
> > -     source_id values should be assigned here and not be changed afterwards to make sure
> > -     that guest will write error into expected "Error Status Data Block" even if guest was
> > -     migrated to a newer QEMU.
> > +(11) kvm_arch_on_sigbus_vcpu() report RAS errors via a SEA notifications,
> > +     when a SIGBUS event is triggered.  
>  
> >       The logic to convert a SEA notification
> > +     into a source ID is defined inside ghes.c source file.  
> that's cheating and not documentation by any means

I'll drop the last paragraph. I guess that (11) were here to document a hack on the
original design:
	"supported source_id values should be assigned here".

The new code doesn't do any assumptions like that. All it needs is that the caller
need to specify the notification type (currently, SEA or GPIO).

So, IMO the only thing eventually useful there is:

	(11) kvm_arch_on_sigbus_vcpu() report RAS errors via a SEA notifications,
	     when a SIGBUS event is triggered.  

Yet, to be frank, I'm not sure if this should be documented. So perhaps
the entire section (11) can be dropped.

Thanks,
Mauro
