Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp309187dlb;
        Wed, 7 Aug 2024 06:24:10 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVJ9XyIKzd2Qw0vBu9nDc1PIgKuOeFcEJ4HdHT77s4Hm0GxYzmQtt2tS7Lz5SaZpZ8i3v+AdM8Cbm8HhP+aWFfOgEjC6AN3
X-Google-Smtp-Source: AGHT+IF5hoUfYXTNYv70B/IvBfaJsQBvU15RdoCvVOsmtwwY8P8brzTs/nn90RvH5u2+kQkfmNrl
X-Received: by 2002:a05:6a00:22d6:b0:710:5825:5ba0 with SMTP id d2e1a72fcca58-7106cf8fc5dmr19430900b3a.3.1723037049750;
        Wed, 07 Aug 2024 06:24:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723037049; cv=pass;
        d=google.com; s=arc-20160816;
        b=ec/n6pAEzllsSk8dNxldjX7cFtCGkeaUB/VmDJy7syb0DSW8GuPsm4BkDdaVoNbSQK
         w5qOWFcVne7Bd5SRfNNVs2pMkf979kv45ieM6JAfCio2UF7BKrTXtNUtTg/jChTmWh0v
         2TAX92bm4t0nsJg2LoOkI95JClhf07H7ExLweVI6dSP9Z52t9WhD68HK2iDt1Njhsb6t
         HCXSLWdmEAxvkhd6+10XXq10VPQYdrWduzuOp/QeJdWTBcr9rX2LIYCBGDgtszK/sIfN
         VY2c1ClWTCsNS9+UFX16wby9Sq5THwR8I4PVhvbOt9Skf9JN+ZCqzgBVDHfAf3LKD++Y
         nvjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=DQor3aH4sO66H4ueb7IgfEeIOiyiOtgQ7dyotC0ucWQ=;
        fh=j7GA3EfRet1H7jTzv9UDgZNjw8MUZeXqIU5NskuDe5w=;
        b=VKHs6KR0jpVoqs0VqgL9jzCFcJg7InpBApuEWk5lqUA0XPil9pnYesD7Bk63OXMII4
         y4M+4lmziz/DrjGIXsYtRFJitHg8F62t+bIWQIWq40O90PcxH+HZPqinB2K9gwsmL9pz
         F07PpZ1GZJnCwEtgafb7rGWeYuSXXzteo2JZIoNR6+6zwrE7NvUvWO0tGWgwZiu2+len
         p1e4rSJlTN1uRwkzGUYJNaQHtgSoZzhYOm2R7ydAGzVAROhRaT8nt629cJLvYZIrQrji
         h6jUL+hSvwOP5pxA5GrkCM3hYfpyHE6Wv9zhvSynJjCBtXYTUOL2vQtflsL36YIIi0aX
         DR8Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="SF+ZF/7T";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-277943-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-277943-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-277943-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-710bc44eb98si1413669b3a.252.2024.08.07.06.24.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 06:24:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-277943-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="SF+ZF/7T";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-277943-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-277943-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A24CBB23853
	for <alex.bennee@linaro.org>; Wed,  7 Aug 2024 13:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392C11E6754;
	Wed,  7 Aug 2024 13:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SF+ZF/7T"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5EA1BC08C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Aug 2024 13:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037043; cv=none; b=EwMLMtY0lLYWlvNhUrB0jsQrPSAyGt/g3WWeGWw7hhySABU1eFqecPx5XhZxAeeOkGJk46birmfeIdBRz55gYmQxOrG8YwbzPNq621aPL1q/aE9zwYsp1+1Az8nQkwfy6T9sJ0snuGOGPLEwHyfkVuwJUS96FgIh7MKOoeZ+Wcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037043; c=relaxed/simple;
	bh=IJWsnY/NFxnESGFOLGzPavd3GqiqGQL1qkUbbESjJaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h7kP9MlQsci2XVTLo3wAvB41gfGEdhHhvHE0u8tcLNCSQXmUn2/d5fkWOhhDqieYSdiZvS8Hv3w+gt1YceuSnRZDMlx6qvlrqXBvd7gxJwA2gVy6KyjI98V1hgN1wQJLpWCqdCgpH0fnY/0vzJ2CYEb04jvgs1hH5BcQbbBPOOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SF+ZF/7T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAA8C32782;
	Wed,  7 Aug 2024 13:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723037042;
	bh=IJWsnY/NFxnESGFOLGzPavd3GqiqGQL1qkUbbESjJaQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SF+ZF/7T0ixwlBKAQctHdY+NLgJLFBBrgwBjoyzZuVq2OMWttiwJX2pCvZF+wGFiW
	 PT730MaCfbYhUqasVtP4WvtEt13DvxcBgZkegjJo8tX/xa0WgcifvuRPIdKS2ycnIE
	 J+zty3zM7tuZudJ9DFoG9PpkG5K9vHlCBKnWsX5RdXxJczvWXe8l494Yt8u7pj213E
	 1wgfDf11xXhd11ccvMsgbYrzxQHSwztTOOseWMa1krTfFjot31EiqJMF+gXSQ0GHei
	 s7h+6mXScDFikvSN7HPkTwZf22bfanSbL6m1FyYvtTvAGBAOByXbAKMmIxWnAu4rWD
	 ra8rfKYHo86kw==
Date: Wed, 7 Aug 2024 15:23:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v5 6/7] acpi/ghes: add support for generic error
 injection via QAPI
Message-ID: <20240807152357.0d2dc466@foz.lan>
In-Reply-To: <20240807103436.000013fc@Huawei.com>
References: <cover.1722634602.git.mchehab+huawei@kernel.org>
	<20c491e357340e0062b6ff09867c1661ed4d2479.1722634602.git.mchehab+huawei@kernel.org>
	<20240806163113.3bdc260a@imammedo.users.ipa.redhat.com>
	<20240807094750.6414fb2f@foz.lan>
	<20240807103436.000013fc@Huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: maRlZFD31Tes

Em Wed, 7 Aug 2024 10:34:36 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:

> On Wed, 7 Aug 2024 09:47:50 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Em Tue, 6 Aug 2024 16:31:13 +0200
> > Igor Mammedov <imammedo@redhat.com> escreveu:
> >   
> > > PS:
> > > looking at the code, ACPI_GHES_MAX_RAW_DATA_LENGTH is 1K
> > > and it is the total size of a error block for a error source.
> > > 
> > > However acpi_hest_ghes.rst (3) says it should be 4K,
> > > am I mistaken?    
> > 
> > Maybe Jonathan knows better, but I guess the 1K was just some
> > arbitrary limit to prevent a too big CPER. The 4K limit described
> > at acpi_hest_ghes.rst could be just some limit to cope with
> > the current bios implementation, but I didn't check myself how
> > this is implemented there. 
> > 
> > I was unable to find any limit at the specs. Yet, if you look at:
> > 
> > https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html#arm-processor-error-section  
> 
> I think both limits are just made up.  You can in theory log huge
> error records.  Just not one does.

If both are made up, I would sync them, either patching the
documentation or the ghes driver.

> 
> > 
> > The processor Error Information Structure, starting at offset
> > 40, can go up to 255*32, meaning an offset of 8200, which is
> > bigger than 4K.
> > 
> > Going further, processor context can have up to 65535 (spec
> > actually says 65536, but that sounds a typo, as the size is
> > stored on an uint16_t), containing multiple register values
> > there (the spec calls its length as "P").
> > 
> > So, the CPER record could, in theory, have:
> > 	8200 + (65535 * P) + sizeof(vendor-specicific-info)
> > 
> > The CPER length is stored in Section Length record, which is
> > uint32_t.
> > 
> > So, I'd say that the GHES record can theoretically be a lot
> > bigger than 4K.	  
> Agreed - but I don't think we care for testing as long as it's
> big enough for plausible records.   Unless you really want
> to fuzz the limits?

Fuzz the limits could be interesting, but it is not on my
current plans.

Yet, 1K could be a little bit short for ARM CPER.

See: N.26 ARMv8 AArch64 GPRs (Type 4) has 256 bytes for
registers, plus 8 bytes for the header. So, a total size of
264 bytes, for a single context register dump. I would expect
that, in real life, type 4 to always be reported on aarch64,
on BIOS with context register support. Maybe other types could
also be dumped altogether (like context registers for EL1, 
EL2 and/or EL3).

If just one type 4 context is encoded, it means that, 1K has 
space for 23 errors (of a max limit of 255).

Just looking at the maximum number, my feeling is that 1K
might be too short to simulate some real life reports,
but that depends on how firmware is actually grouping
such events.

So, maybe this could be expanded to, let's say, 4K, thus
aligning with the ReST documentation.

Regards,
Mauro
