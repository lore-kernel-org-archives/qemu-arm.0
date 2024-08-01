Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp908971njb;
        Thu, 1 Aug 2024 05:56:57 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWtnySb44XvQgUS7xOMQk9HA7D6MCllmCtv2yfwsujCNwaHjKm9owAlSyWSRpGgeUIwC8wBFEwTC7MKD1QJ46mAxCRe1FCx
X-Google-Smtp-Source: AGHT+IFrBTZf42Lo/Zu+oI+qr/fVOmwPce1BDEb1LmwYXIFlHIZ0RjOuZuUsn+J0y3j45Uxjwn5e
X-Received: by 2002:a05:6512:b08:b0:52c:e012:efad with SMTP id 2adb3069b0e04-530b619a9f5mr1800109e87.12.1722517017576;
        Thu, 01 Aug 2024 05:56:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722517017; cv=pass;
        d=google.com; s=arc-20160816;
        b=DI1i0fz5v5I+CkQwTmwbEpoWxm4kV60yWYr666u3zAl6CQD8Nb60EXTqvV08Vl6ROF
         fG1fkYVT8Fl9zi3sfMWbaEioIiM1oB15AtFhs2ZI+dIvlwA2dOZ9GmR9fy7tG54wXi1s
         tW0XDiavcwgZtyC4QtuL71d81gYNHJx8nsbgnO3WsZC8TnPxtT6Qmd++9SWHxdpszOu/
         2JoNfpQLYA9n38TPBZ9umpB6mhY6W4IrSx9R+OoIRgTdLLIHcZbeHSCUVDqBKjupKSuv
         cevtxT4pqezbd4AJE51KYpX7rGreeWaIRDvOBrZ3g05A4H2+HsHVNTbE/a1JKMV8wLOU
         sbWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=c5R6M9BBMSzUCqIeqsNrhxVMVdy69HvZXYuRAEzq7Yk=;
        fh=gIr+A3V+p+o7D1Sb9NlmCO84TdQQVi9QUHHtAhbh7+I=;
        b=jk5lmRqOT0k3VfvbjwMfc2Eu0Yx9QS16Cq8T1rUvNmOd7zQJtj/v7QrWqiAG/miB5+
         TDdkTiN/lHOl0LQYCXYNkXbKsrRNDIClj6b/RfbWNm7jXs4dRtZOarIW/IZXritcvYSu
         otny77ORkj8f2l/uBfllv5NDqF2eQLdfCvbHk+pfh2fgB2H2fiRM/KmdgdP0+HAPmc+6
         gwnXfnGPHuTvOZSEiaOWvcFu2PG5ohXDp1NAbsYb/n3P1V11XehOXJs6pdW+sAtoZQ4J
         GZlRIEUBKsgBKXYeoLjuGdbBRIpJpevamPiWXOn3Cnn4XVYIeDOzqM1ale5nC1zlWpil
         Su+Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ZJmYrJzN;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-271267-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-271267-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-271267-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5b4cf091973si3258279a12.453.2024.08.01.05.56.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 05:56:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-271267-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ZJmYrJzN;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-271267-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-271267-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27DF61F210CE
	for <alex.bennee@linaro.org>; Thu,  1 Aug 2024 12:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE29B1A0730;
	Thu,  1 Aug 2024 12:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJmYrJzN"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A002C208D1
	for <linux-kernel@vger.kernel.org>; Thu,  1 Aug 2024 12:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722517003; cv=none; b=uZUMeN8b9lRUlpR956hwsNNEtIksoNiwQhXljTUEWyGkmfv8sm5j95Ye3I04vghR4EDErNOrI2m4ZwCf3CyC1sryfKp4R640+4oMYiWT8xVmRzowBdt79kz1K3+y2msLS9gBFfUStyC7f7ewi5O2I0pn5zkgowzVBFYNh6K0SFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722517003; c=relaxed/simple;
	bh=yUOmIatsa2JxbuH+5SkDj8HGMvb+bCebLi05n30xnAk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dDMIKollwGkxN0bOTchJE1ub6cb65CL7acEW8X3TVOVUUB4CPvwCRv6yW9TgB5UxapTQC93vYbpw7TsZTcMfCDZG5zdkbGnBIST+gEXdBSo4gPVmaH71rTrq8THCTt7rxNoPtOOqYNNm5RMLs9kQpZWyMLmAIvW8YHLeRJuIDLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJmYrJzN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A953C4AF09;
	Thu,  1 Aug 2024 12:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517003;
	bh=yUOmIatsa2JxbuH+5SkDj8HGMvb+bCebLi05n30xnAk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZJmYrJzN4tAnymj5rYqbuo7vESrmbmpWK93FqK7UY+T3aU26iBz1tMvEvtdWu7pKY
	 4X/yWHt8lYHKWrsYo1KkRgrJdjgf8buhYSDnaQXlrKKo6zbugs3y5VigRBUHW51ebi
	 mxRlWMz+PgMR1sXXNSPjEv+Y0GEznSW3qxvgA3BAehJ95JMwUaXTn6kW4Z9VG+4u1x
	 2SMSbY2fRmUT7vAJUEwUqkG5avwLE4gRGo9iIgNC7CPysortKI2QHMxXEwQpIXcNVE
	 pqDo2XyZSu7PbNzke8huMKfs2YIsmEGIdfj5JiHf0MhY+mvr88DR3g5j0WKtLLiikm
	 X9E67YJQ5n8PQ==
Date: Thu, 1 Aug 2024 14:56:37 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>
Cc: Shiju Jose <shiju.jose@huawei.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 3/7] acpi/ghes: Support GPIO error source.
Message-ID: <20240801145637.03c34fd3@foz.lan>
In-Reply-To: <20240730104028.4f503d91@imammedo.users.ipa.redhat.com>
References: <cover.1721630625.git.mchehab+huawei@kernel.org>
	<64a31a09fe6b11bebad1c592ad20071a9d93fee5.1721630625.git.mchehab+huawei@kernel.org>
	<20240730104028.4f503d91@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: yOAuF59RaiFV

Em Tue, 30 Jul 2024 10:40:28 +0200
Igor Mammedov <imammedo@redhat.com> escreveu:

> > diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> > index 674f6958e905..4f1ab1a73a06 100644
> > --- a/include/hw/acpi/ghes.h
> > +++ b/include/hw/acpi/ghes.h
> > @@ -58,6 +58,7 @@ enum AcpiGhesNotifyType {
> >  
> >  enum {
> >      ACPI_HEST_SRC_ID_SEA = 0,
> > +    ACPI_HEST_SRC_ID_GPIO = 1,  
> is it defined by some spec, or just a made up number?

I don't know. Maybe Jonathan or Shiju knows better, as the original patch
came from them, but I didn't find any parts of the ACPI spec defining the
values for source ID.

Checking at build_ghes_v2() implementation, this is used on two places:

1. as GHESv2 source ID:
    /*
     * Type:
     * Generic Hardware Error Source version 2(GHESv2 - Type 10)
     */
    build_append_int_noprefix(table_data, ACPI_GHES_SOURCE_GENERIC_ERROR_V2, 2);
    /* Source Id */
    build_append_int_noprefix(table_data, source_id, 2);
    /* Related Source Id */
    build_append_int_noprefix(table_data, 0xffff, 2);

as an address offset:

    address_offset = table_data->len;
    /* Error Status Address */
    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0x40, 0,
                     4 /* QWord access */, 0);
    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
        address_offset + GAS_ADDR_OFFSET, sizeof(uint64_t),
        ACPI_GHES_ERRORS_FW_CFG_FILE, source_id * sizeof(uint64_t));

So, if I had to guess, I'd say that this was made up, in a way that
the size of the table will fit just two sources, starting from zero.

So, I'll change the code to just:

	enum {
            ACPI_HEST_SRC_ID_SEA = 0,
            ACPI_HEST_SRC_ID_GPIO, 
	    /* future ids go here */
	    ACPI_HEST_SRC_ID_RESERVED,
	};

To remove the false impression that this could be originated from the
spec.

Thanks,
Mauro
