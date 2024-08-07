Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp56953njc;
        Wed, 7 Aug 2024 00:48:01 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWNkrlL4MoP5w9TUxN/sIiOtwsup4cWwUsppNUWjs3fH/P5X+FUB1y/sQyqdUBMvublcNDn5kypyRGoZnHNXqHsrLzUK6Dt
X-Google-Smtp-Source: AGHT+IFyT+v+FVXYhhOZrkklOR8DhKlYPswnKCAN6a1J7Ltpg1ni3ATH2L2NL/AnpjIkjN0xiA5C
X-Received: by 2002:a05:620a:4541:b0:7a2:275:47c0 with SMTP id af79cd13be357-7a34ef3a480mr1981973085a.32.1723016880995;
        Wed, 07 Aug 2024 00:48:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723016880; cv=pass;
        d=google.com; s=arc-20160816;
        b=h998BXujb7l6CbqQnoLwGxDXMcCdAiByvxwF+Sf9q1ZKKEzuMRF7a+vBa7S1/WNCNu
         jDpBQLor/j0H/zEorJ+3a+ezSDei6HF7xAwQjWSh+QE74MC2HGAE8/rub1zBW8OVfh1Q
         f0lV90bBoZMxc3Vu/ejgEREheo2CrAR7C6JH4nOccC5wZpjkAzjMa6R6VvXXkG0OxCDu
         BcNGndfO+iD6jYKnCSzaF3HiWUEXEaqLEVnViltsyCjOPJhDN1IAgXf0SbAcpRDEooze
         MGIQABwbsYmYNLg6ajlhi2575+PBJNq1lm/O0LSDGacL/fknVyQuJqvY2wIdbhLAIc9h
         tagQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=yhwaQpxofjX/qiBJ4hulyZYqn61B0H2uV602E9v9K1w=;
        fh=gIr+A3V+p+o7D1Sb9NlmCO84TdQQVi9QUHHtAhbh7+I=;
        b=AVI0qFZxCwNN9Hx470h/G36ACXUlp48P0JgNM/TOPNUobfvsAUfaKjaPumgl0zcgzF
         wbHiVp0cMw2KpIrSFtzTeN6CFV/9eFEgbzHKeWzK4xuugk8U50RH2W1L0OIs14paEeg9
         h+llCqpRw5eb8k0aAS93h9gz679T8V5eNaerA9l0YDQedl1gsQn3uitXiP5PYHgHxjK1
         ACRRAjUQFIoa8y3r2UZgXxk+GKOhGHKeqgTaL+alOVWmgvlTRXTIf8FS5ApOb9meVGRr
         ymQ984jgVeiCyQiBZVP+G+Ph7xMo1ThJ3Jof6y4EQzoFwesS8zWQRA1yv8JgGs3Nl6LI
         o8jw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=k9hnoPSN;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-277479-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-277479-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-277479-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id af79cd13be357-7a3785f8a84si100441385a.85.2024.08.07.00.48.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 00:48:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-277479-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=k9hnoPSN;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-277479-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-277479-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B12AE1C23152
	for <alex.bennee@linaro.org>; Wed,  7 Aug 2024 07:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6D61B86D9;
	Wed,  7 Aug 2024 07:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9hnoPSN"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6BC18D651
	for <linux-kernel@vger.kernel.org>; Wed,  7 Aug 2024 07:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723016876; cv=none; b=m7V+5Ikd8H9WhlFE9GPIXPfGXtx+Cd9p025SCUYqawSyppvdo9Rl4E4dJYqaKZSKV8lTIG+RXQHbNdCBxsAgPThqoEoLujyrV4zmghi6a/qJaOL3W4AMaRtSpkJtZjEbSEBShen1xlmnazZaVRCu2HFPLsEUtuutyOm/de57Kgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723016876; c=relaxed/simple;
	bh=vMJRjUr+IGJwQB4Bc82HwUmW7kTM7dx26RqISOvFuQg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jfRBGB6UZwX+ovnuYshB1Ux5bzQLK1Xapu03Ncau4OCMBy+2UVVqSPeYyPXt2TzSFskzA5us6EC+vTd+s3ikuY+dybP0x3eqwddEdJ4c4QhofN3QXo/5VcIfBS6aMlzcgNqlLcqY9sw/wt1eey3v3makCx6O0ssPBxcdtMPXUzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9hnoPSN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12BD6C32782;
	Wed,  7 Aug 2024 07:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723016876;
	bh=vMJRjUr+IGJwQB4Bc82HwUmW7kTM7dx26RqISOvFuQg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k9hnoPSNWVEgoVVKxSjZQBXnWpmRUrvBduGM/EgPlF2EEX3STtKbgQShMkvk2IPxh
	 +gdV+81avdU0j2Aka6I2ymQ44Tsa9b5HRgU+eckgGpJf4SuZYPHZTisaZbzaaXDwD9
	 fmCYme9+2g88ZebMPJ0NYdGdndmo+Q3aaaP2dxKIsiopWkmAeG4Gam5pC7NKFBa573
	 mcjEZ+B+iSCV9xGalM2LDUxa0HuesYBtM5vQoDLN8P8oo8vITlMh/VlE+9hFKojREV
	 H2nsuQoEK98S1/Tr1rTnIKURbjWQOG0gYLY72mMNQ7cLdsYMPtx97X3Wj6gKYhmrt2
	 +/aohjP/se5xA==
Date: Wed, 7 Aug 2024 09:47:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>
Cc: Shiju Jose <shiju.jose@huawei.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 6/7] acpi/ghes: add support for generic error
 injection via QAPI
Message-ID: <20240807094750.6414fb2f@foz.lan>
In-Reply-To: <20240806163113.3bdc260a@imammedo.users.ipa.redhat.com>
References: <cover.1722634602.git.mchehab+huawei@kernel.org>
	<20c491e357340e0062b6ff09867c1661ed4d2479.1722634602.git.mchehab+huawei@kernel.org>
	<20240806163113.3bdc260a@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: 63gg4N9pagDE

Em Tue, 6 Aug 2024 16:31:13 +0200
Igor Mammedov <imammedo@redhat.com> escreveu:

> PS:
> looking at the code, ACPI_GHES_MAX_RAW_DATA_LENGTH is 1K
> and it is the total size of a error block for a error source.
> 
> However acpi_hest_ghes.rst (3) says it should be 4K,
> am I mistaken?

Maybe Jonathan knows better, but I guess the 1K was just some
arbitrary limit to prevent a too big CPER. The 4K limit described
at acpi_hest_ghes.rst could be just some limit to cope with
the current bios implementation, but I didn't check myself how
this is implemented there. 

I was unable to find any limit at the specs. Yet, if you look at:

https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html#arm-processor-error-section

The processor Error Information Structure, starting at offset
40, can go up to 255*32, meaning an offset of 8200, which is
bigger than 4K.

Going further, processor context can have up to 65535 (spec
actually says 65536, but that sounds a typo, as the size is
stored on an uint16_t), containing multiple register values
there (the spec calls its length as "P").

So, the CPER record could, in theory, have:
	8200 + (65535 * P) + sizeof(vendor-specicific-info)

The CPER length is stored in Section Length record, which is
uint32_t.

So, I'd say that the GHES record can theoretically be a lot
bigger than 4K.	

Thanks,
Mauro
