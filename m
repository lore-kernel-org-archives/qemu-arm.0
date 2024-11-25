Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1199985njc;
        Mon, 25 Nov 2024 03:06:32 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCX4NKnuR2AiijhhKigtLkDvaNqTDfTdjMDqOK6Ny/VQpISGdaLu8xorSmfjRI0fNmy7x3TQdUGqk6CJ7g==@linaro.org
X-Google-Smtp-Source: AGHT+IH3xsPxoqrjX5tTdb27n+pse5aQio3Khr06+Uilw6J4PY8je1gGiMZ+85DT1QalKIhpaVnr
X-Received: by 2002:a17:90b:4c41:b0:2ea:9cd6:985d with SMTP id 98e67ed59e1d1-2eb0e8881d8mr16267477a91.35.1732532792188;
        Mon, 25 Nov 2024 03:06:32 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732532792; cv=pass;
        d=google.com; s=arc-20240605;
        b=aJM/CU7sI6oW+1L+v72+CR0LaY9DbZzdOPzDCLLVNng1zn0XxazuCxvk/TxCJPiy4/
         UzVX+itJSCZCZYLqnvmEM7cHnpXjZxRhpqjc9S7J/yMnODI/RFliytLBQ1QMm4Bs5W/8
         qV2k22YJ/De6yDR1XeAl5nQ/+I32GalsVrZTSg5wLHJm2L1YsFtPip5gBuRMJ72uLcZ9
         sklcw9RxSyW6B/qa0HBrhQrgsB96jCMC2+Wjz9Od7D5nIJalTr2uRJbLPleSpytT4EJx
         jGUClVTmhYpCOHPPSK5spWtTy0PBUKInpgBJgj5Na9slEyOBVJ8MmeKRt1ps9MidsLDQ
         +15A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=EMTrG1WI8PFTGyF11hLJHW/10OznDFGp6d2gVJjI0oo=;
        fh=AJ8hn4ioKJA5lsG3NCMNx8yhntdFUmRi9f6dN5eYbeg=;
        b=PTMQCq7hrWBVht6u9yx4NneWzp7dqyifeZTV4goCV895Og++73KjL9Y3CsrwuSzna8
         80UZt7o7P56BObOR6zbhrf5pg4AUJOLB5TJZJMQOl36R76Eg2b+Rf6Y9eFuRvY6DXEyp
         7CB9Jkpp/Nh1Zdq9sNXsiRtsZcx70Tmp+mhcCeJ7PO6+KKwgKaGnchiXNEpMVruy86EI
         k8hxrW7YSFcArT8b1Q+/rciEDsybPnlra/RDoAZF1bEBrtzFH8UhotrB8tazz0Dn343P
         WMCmFLCyy4umi3quDWk/V8t5h9D5GWX/zM3QHnz3zO2YRFR88Qpvle5+ZdCX+kpU3tTP
         0LZw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=suuCWMJg;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-420892-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-420892-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-420892-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2ead02eb162si13497571a91.17.2024.11.25.03.06.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 03:06:32 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-420892-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=suuCWMJg;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-420892-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-420892-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B62EB28391E
	for <alex.bennee@linaro.org>; Mon, 25 Nov 2024 11:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18353194AD1;
	Mon, 25 Nov 2024 11:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="suuCWMJg"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8A3192589
	for <linux-kernel@vger.kernel.org>; Mon, 25 Nov 2024 11:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732532787; cv=none; b=W6YXBHSl/HXAaHTGYFS/D65nqJ2lek0hPhiFb6wfIK0JLb7nrowM+kppcyBSCZ61irQQ+ktfiooqQi+3P15DNEclJ4R1/zLYJBktXyHBzEfNNetQi8sbqyEisM6SgSqNMqr5yWB6rIIfL2nTabnhqp6S/EYE4RgLVgD5A/glGDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732532787; c=relaxed/simple;
	bh=ncD7qidOGaWs7u0h7m5tQWNFFQUyTY10tZvsB2EhAV4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ka2AxtqTi5ic6bCCMQC8e6H5qKu2IbvvfEx8JQhaSpZgWruEAYFC8FzuQpGBK2m2CfqunOagDcxH3xZV327qWIQ/TKrelPXkepj8PcmpllefSTrWPE1NezKZcEC6gxvxTmdX8RLB8/3kJN+4iLZ+GcnJth3XH+woZq8oGsmVX+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=suuCWMJg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B13C4CECE;
	Mon, 25 Nov 2024 11:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732532787;
	bh=ncD7qidOGaWs7u0h7m5tQWNFFQUyTY10tZvsB2EhAV4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=suuCWMJg+WsQiT/et+/msfBICzWy2l89YiRFzvyLqlXufgwMA9kYoudvDV7Jz9my8
	 LNLhHvEGpMgoF3iYY1V8i2DDR+gkvLf+kKb5ya8D+ga0ZtHYXw/SJuKBsYW2Ci0E2M
	 FArecBcxXY3efH8aHsehy6MPo4ESVVMHNHCSHrlvifGA7eQgAlWLPwaJlnn7cKpEge
	 IQclRtgqrenDmDPDaWbuqDB2R6lssc4JKwWFVLgcLV43zYP34uWGeI+0bSIVAm17+A
	 +k+M7EaOsewRoFViNVKB+Oo/PcEJFcTOt8Lw64wt9Wm8HyFzpC2mYgCzR5AIuMO6U4
	 apnf5tqc9q38A==
Date: Mon, 25 Nov 2024 12:06:16 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 08/15] acpi/ghes: make the GHES record generation
 more generic
Message-ID: <20241125120616.6b89a1fe@sal.lan>
In-Reply-To: <20241122171944.4b5ac367@imammedo.users.ipa.redhat.com>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
	<b3845a8c78ef36c633d5e20af868de4ed16650a4.1732266152.git.mchehab+huawei@kernel.org>
	<20241122171944.4b5ac367@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: gV1rkuBT4Kc3

Em Fri, 22 Nov 2024 17:19:44 +0100
Igor Mammedov <imammedo@redhat.com> escreveu:

> > +
> > +    if (!physical_address) {
> > +        error_report("can not find Generic Error Status Block for source id %d",
> > +                     source_id);  
> 
> isn't it a copy paste error from somewhere, perhaps it's mixed up with something else?
> Granted, the check was there before patches but error message seems bogus.
> 
> Also 'physical_address' is a faulty page here, and 0 is as valid as any other value.
> I'd say we should drop the check, and if from ARM/KVM pov 0 addr shouldn't exist
> then it should be up to caller to filter it out and not call  acpi_ghes_record_errors()
> in the 1st place.

I'll add a patch just before this one removing the physical_address check,
and remove it from the moved function on this patch.

I'll submit a v5 once you review patches 13-15 from this series.

Regards,
Mauro
