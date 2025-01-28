Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2993399njk;
        Tue, 28 Jan 2025 02:13:08 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWyGLY3/kpYxo6skmeVOZrcJbWTa3IfjYcXCcBlgWyeIbTTgMybbsEuOqkaH/ykOge0BlCh7v2TexDn1w==@linaro.org
X-Google-Smtp-Source: AGHT+IFrjMMTun2BH1qlz4xgFsrdGMIzmXXEh+p982P4znjG+EoxzptICsxMp/zn787np+hjHPqb
X-Received: by 2002:a17:906:730a:b0:aa6:489e:5848 with SMTP id a640c23a62f3a-ab6bbb66cc9mr220519366b.25.1738059188789;
        Tue, 28 Jan 2025 02:13:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738059188; cv=pass;
        d=google.com; s=arc-20240605;
        b=In2y6LeWdOMzv4IhMMngsux/88SfFTRS2MKf37xfon4CQLJnSQhvQsoPC46U35ojeF
         yPpikEfv+ApOPc8B2uiQ3/YHDLsOwTHTeQ3mZ8173a9e5/39PcXRsorhuA44dPf3SukW
         aXvoopzmy8yBH6sYMxA7sHhBXmqtOlhycl17736rowX3I2xxBaIXEI+Ep58Wo3XwFAhi
         bXoKUE5uki3fR0zW0Wahs5tCE7vtv4fNjnPRIW7eVcvxK/fBdlfeX3ikp+4o4TKnxid1
         cGnhYFHTpXNVez62FNf/19onzuzoCJ26ErpMurtBQaPlM2vtqlyn+pXIONN9Smyx9evg
         T8Wg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=7EsPFGYbJc36wAEgDBsa4Ym+qGvMLcCsw5YXmWX0530=;
        fh=/KGs/ziP4tZyJgyRjKD9S+iLmKzIXlQNmJeNeIlBfj4=;
        b=Qcz4l19i6kjxa10undm+SebhVthUQrKcevyBcfA2nO3r3jJHfxFbwgXln+FkrnZBR8
         vy/CoP4/0uXydvnFUdweTREgrVIfV6KRyAkS18g2BNyoHLYoFKZG4jjFV4zK9HU66Xuy
         JfgKVzZ7a7rkaYByoMsEzAJBTR9KX7FNSny68ahHu2JVTZt3SdB3ZcNyCpYuAotkMiYH
         1lyFKjNMq0OXNzEzwEHwNr3Oiw6bKOWb7lhP+1QEWXhRuR/XsdsJEXglTWVCChaiIQX4
         13bw3ViS247nJrEQ48SJkSfv3U1qwf/OFC4aSA6a/YKTxpaqJEegkcdsTz74HoI4txIm
         VP9A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=FZx6s1eU;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-491220-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-491220-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-491220-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-ab695e4b970si454128566b.870.2025.01.28.02.13.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 02:13:08 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-491220-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=FZx6s1eU;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-491220-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-491220-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0FBE1884961
	for <alex.bennee@linaro.org>; Tue, 28 Jan 2025 10:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8112A199EB2;
	Tue, 28 Jan 2025 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZx6s1eU"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400CB156669
	for <linux-kernel@vger.kernel.org>; Tue, 28 Jan 2025 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738059183; cv=none; b=qV2K6F52SdnvdLTWrPJnSTp2e51ORnsl3xC/E2RQh0CUgQ8an1kDrXmZRI8w7C8i/cIcrklt10Rs8P149mDQs4qC2jSPUBDraJidGwMPcPWrqnlFddLywQ1JJ4HxxlcXkzNXGy1mVL1m2jjItvAdOgj0er9nW1KDY9qnAeH0BmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738059183; c=relaxed/simple;
	bh=q2tkXJnQuqRVsRPzbW4+BGtAR/MbKeqkStZKGVjjDhg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VsyDHKEL0kFiig2f6rbD4zM/znWmzGxtP1jdMi2ErECz0+WCXtBwBx1wOinb2I8nRmMtQesM4KYbjQvZZde3uH9XcF97P/6ELntnHHvFJC2/CXJ1ZkzTeVV3M9wPK39IDZxPi7Fni43a+YGJFzvcGMVtWeONbo2d9HvwKq1MEg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZx6s1eU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B47AC4CED3;
	Tue, 28 Jan 2025 10:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738059182;
	bh=q2tkXJnQuqRVsRPzbW4+BGtAR/MbKeqkStZKGVjjDhg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FZx6s1eUpPWZoplYHOrkhr/qzvpXtRJHTMEvibGRaE0I35+GfokYOCsT0x2PD4EmP
	 6GBEGzM3UWML6T60t+x/hivCNb0dFQ5v1D+Bjgw5H4usRPF+0/9LtwFD7apwSeyWhR
	 tYcw0RY9HcHBS3JMeoboiyQuKa5nY2fNhEJCkjZhG0iAzlCxKbenZsC5Ael8dsyU/8
	 clAz7s7/zjU24aKkQpAe/dWFIpN1ygJ/CI63+ENnBPcsMIL+H4OI3emXrWdDTJbyV3
	 DNlf4WiH9vldzYWOvk4KVeHuwyrqURR3owwGhRbNjiumftrCI1zsV10PyyB+onqfdE
	 6mTNCTFsgZqQw==
Date: Tue, 28 Jan 2025 11:12:57 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 02/11] acpi/ghes: add a firmware file with HEST address
Message-ID: <20250128111257.74766c82@foz.lan>
In-Reply-To: <20250123180135.4f86483f@imammedo.users.ipa.redhat.com>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<a3579f6c2c24e764e544f83b6e1b2dbef730e3e3.1737560101.git.mchehab+huawei@kernel.org>
	<20250123100217.00007373@huawei.com>
	<20250123180135.4f86483f@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: 9yLQRuOMyC/H

Em Thu, 23 Jan 2025 18:01:35 +0100
Igor Mammedov <imammedo@redhat.com> escreveu:

> On Thu, 23 Jan 2025 10:02:17 +0000
> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> 
> > On Wed, 22 Jan 2025 16:46:19 +0100
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
> > > Store HEST table address at GPA, placing its content at
> > > hest_addr_le variable.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > >     
> > A few trivial things inline.
> > 
> > Jonathan
> >   
> > > ---
> > > 
> > > Change from v8:
> > > - hest_addr_lr is now pointing to the error source size and data.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>    
> > Bonus.  I guess you really like this patch :)  
> > > ---
> > >  hw/acpi/ghes.c         | 17 ++++++++++++++++-
> > >  include/hw/acpi/ghes.h |  1 +
> > >  2 files changed, 17 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > > index 3f519ccab90d..34e3364d3fd8 100644
> > > --- a/hw/acpi/ghes.c
> > > +++ b/hw/acpi/ghes.c
> > > @@ -30,6 +30,7 @@
> > >  
> > >  #define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
> > >  #define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
> > > +#define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
> > >  
> > >  /* The max size in bytes for one error block */
> > >  #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
> > > @@ -261,7 +262,7 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
> > >      }
> > >  
> > >      /*
> > > -     * tell firmware to write hardware_errors GPA into
> > > +     * Tell firmware to write hardware_errors GPA into    
> > 
> > Sneaky tidy up.  No problem with it in general but adding noise here, so if there
> > are others in the series maybe gather them up in a cleanup patch.  
> 
> +1

If Ok, I would prefer to keep this here, as there's no other cleanups
anymore, and writing a patch just for this seems overkill. Besides,
it replicates a comment with a similar content on this patch.

So, instead, if OK to you, I would prefer to add a comment about it at
the patch description.

> >   
> > >       * hardware_errors_addr fw_cfg, once the former has been initialized.
> > >       */
> > >      bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, 0,
> > > @@ -355,6 +356,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
> > >  
> > >      acpi_table_begin(&table, table_data);
> > >  
> > > +    int hest_offset = table_data->len;    
> should be unsigned, and better uint32_t
> but we have a zoo wrt type here all over the place.

Changed this one to uint32_t. 

> > Local style looks to be traditional C with definitions at top.  Maybe define
> > hest_offset up a few lines and just set it here?  
> 
> yep, it applies to whole QEMU (i.e. definitions only at the start of the block)

Good to know. That's my personal style too. Yet, I guess I saw somewhere
other places declaring variables in the middle of the code. 

> > > +
> > >      /* Error Source Count */
> > >      build_append_int_noprefix(table_data, num_sources, 4);
> > >      for (i = 0; i < num_sources; i++) {
> > > @@ -362,6 +365,15 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
> > >      }
> > >  
> > >      acpi_table_end(linker, &table);
> > > +
> > > +    /*
> > > +     * tell firmware to write into GPA the address of HEST via fw_cfg,    
> > 
> > Given the tidy up above, fix this one to have a capital T, or was this
> > where you meant to change it?
> >   
> > > +     * once initialized.
> > > +     */
> > > +    bios_linker_loader_write_pointer(linker,
> > > +                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,    
> > 
> > Could wrap less and stay under 80 chars as both lines above add up to 70 something
> >   
> > > +                                     sizeof(uint64_t),
> > > +                                     ACPI_BUILD_TABLE_FILE, hest_offset);
> > >  }    
> >   
> 



Thanks,
Mauro
