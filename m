Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1288501njb;
        Fri, 6 Dec 2024 19:38:52 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVXVoxtzuRLFHh6yzhJnIjCtGFhrtpuDQTm5jTjpAfHyLNtqkf3X2MbbQ5ZrxNNcgej66N3RSp2UsZxKA==@linaro.org
X-Google-Smtp-Source: AGHT+IEj0PAeTiQ2PYfn0a5+X5dYsJnP3ZqeWKKwVCwpSk5hfD0M0IlLsVvzWZcHGuuMwqChbAnP
X-Received: by 2002:a05:622a:252:b0:460:e63c:8f6d with SMTP id d75a77b69052e-46734deb10emr114297981cf.39.1733542732709;
        Fri, 06 Dec 2024 19:38:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733542732; cv=pass;
        d=google.com; s=arc-20240605;
        b=dEPcvTUPiOUDrZBwuJM8fMaav8pv8h7hRA7fyc1fZJCn47HNfknIGhEfHbDNF7QW1K
         037xEuS4WTfvMDc598bfw5YPn+zlhul0yhkqJKCAAqkMBF4v3julwd9xXHqij+sZqH5J
         ChjAasAcDwJCkkBHnVNpJCeLP2p58BA9CMe1d2mnY44krsJcr9RFT+hDSCVSuuxNS7co
         JkJ79yCYkAEIKGRs0QRIZWfLXCCVqQtI/Oy006rn94ukQAUgxCi+Mxa3n74mHkjaiQti
         /4T5d58ttbXntTmj80TnWj3vCJ01m0QqeFhw+XIjHrvsDYHujcg181dpJhAKe/uh1bwJ
         y1cQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:list-unsubscribe:list-subscribe
         :list-id:precedence:dkim-signature;
        bh=RFp/fFnnxbfvLePj4dYZIgYWo9EKhOrPAamJCrcM1WQ=;
        fh=yHyiKLu8qClkQXC2ycnfO4CEeqstVM6AHNoaVIdn0Yo=;
        b=Nj4lZMZQC3mvQAT1mSnwgq/tUIuxNAorpF6EQXMuamoKQCT4QIvkq6DloOOrGqDy6A
         I0f9FoKCgEhS6vpnbdACecssqgEmpPZk14btzolDbU/+GQQgjCJSXmZyUJcJxcr1gcPs
         wusBsioqEJR1e6sGx4cvboWNaLCfM3udOEdyDD5Ebv9DMyBY7bCwygtYovqv50rk2ytA
         uxQ+VbHMfwcPeJzFPtE9Y48DLjwcyOS/C68u2f7UX+FH8eIXjTzmguv1vDvydolKBHa3
         9gqfkJnz71oX2XXmkBMNVGIivnqvAGssq3P+O9SdmskEuX9x/Fk/kMH3StmQb2xfcmcn
         jAUQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XSCyo5Ze;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-435870-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435870-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-435870-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id d75a77b69052e-467297baa72si49898101cf.214.2024.12.06.19.38.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 19:38:52 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435870-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XSCyo5Ze;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-435870-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435870-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B95916BA5E
	for <alex.bennee@linaro.org>; Sat,  7 Dec 2024 03:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE3B1CA81;
	Sat,  7 Dec 2024 03:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XSCyo5Ze"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79E717C7C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Dec 2024 03:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733542728; cv=none; b=tov6hWf1WPikSMMenNh6xNKNhRHzSmzXxCoL6az530EfqY03mHF5AnhMGaMvv5mP4ac9W87ESyLkW5M4uBysCp1+7XFDROCDlr3arcw+jygv2IkHt2J/bwnRMPh1c/p1IzI+zsvkzXAv4NJEVIUFZ7pEcTP19TWsZbUVyQ1v+FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733542728; c=relaxed/simple;
	bh=dZ5jVhw0FRrEkCyjfU/utgfXAZv13iP1+qgcvddW/rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UP7rXsSRTb8GtgcWE9nsDSH/pvwqzNh6qPKJxO6bW8wd0RWgWbETdZE1XsxkDmMkjCWmfXsr5Qpdk6MFIG0goKWWRm6/VyKpPa16nQrJjHMaiqnIHX3RqwJE8s0FPICHnR61kYm0tWSjIaNA9EndNtmg4RzaEihcDemykra/oaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XSCyo5Ze; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733542725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RFp/fFnnxbfvLePj4dYZIgYWo9EKhOrPAamJCrcM1WQ=;
	b=XSCyo5ZeskF0Rp7r3AW2Oqne8uaAMoPTM7BClEOg8xVQvXjipzqDiKpKKy2/VLJhgRj3DY
	tj/UBYc3be3LEbA08Tq0bOZL0fp9J8hPxU/SE24CkuZpBsuBhoiPoqdcOFroPYEcsGehQd
	WIQo9sGeQyKDw4wCnxaIEUjytfwBgOg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-BpnVHLD0OCK6fqh1IUtKtQ-1; Fri, 06 Dec 2024 22:38:44 -0500
X-MC-Unique: BpnVHLD0OCK6fqh1IUtKtQ-1
X-Mimecast-MFC-AGG-ID: BpnVHLD0OCK6fqh1IUtKtQ
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5d34c8fbca7so2027394a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Dec 2024 19:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733542723; x=1734147523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFp/fFnnxbfvLePj4dYZIgYWo9EKhOrPAamJCrcM1WQ=;
        b=VxPYZm3iqIwUozxsT7kaTh3CPU2Bz6iYmboBH7jjx44jparimh9XvWDIEx1SbUtHhK
         406NVTBjbI7Cw3XpqTNtLicsIeV7mnFhGU4uIpPFSB+i3W8OV8AFicWM/Nc8iEejJYHh
         eL3gOWufT2qIYXUoCb0Amh6oCPBhTwEYafyTindVNay05DgAQtHh+QZVfgPfAKP2X11S
         nlYgUxfbOP0r0IZDLRAyX2gIpdjgGlMP/pXwMDBBPyCiKA3z8WM1EJDTaVDVzP4B/MyW
         5jS7MvNZsfdBwW5gz4e7DM7CqxQVEiBe7lH1Inrv37NmLsYvLsFXZQ8rI5MulAIq1Xoj
         B4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQKNeYjiqJbvwiBLmKuB3kwpWYbQKmjWeD+RmyFsFx+NzqqfCZJWDGb1fEL58N6lPC7arhhEIR+ZmkHEo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyivjdrw1vwkueHyZw+WVwFtPUII1F/fP9llxd2YZ+LZ6RM9/vj
	WDwnHktJ+HwmjpIx9BotsvE/VNjZqwb1TBf+KniPGbNKczkv74/113CpoXVEQtRaHXuMSUabHQu
	S5RxL4H/J9dnQJ/vuFh5yP5TlOMe4dl4JHJMxxcw1euufeIc618zzaQOXCfvW2D6OZgni2ELdXQ
	i/l7myOemZrG7uvfMzdthziNNW4MEPhHhtE/i1
X-Gm-Gg: ASbGncsJCD6Gis3V7nBuJWOjEtU7s/btoQU16ecU95nz+GLGhVkfMOtedbyC5jYpu20
	StMJekGpQ0wEhdaXwE1Hps1YicLfbc6A=
X-Received: by 2002:a05:6402:254b:b0:5d0:e73c:b7f6 with SMTP id 4fb4d7f45d1cf-5d3be721b71mr5354691a12.31.1733542723372;
        Fri, 06 Dec 2024 19:38:43 -0800 (PST)
X-Received: by 2002:a05:6402:254b:b0:5d0:e73c:b7f6 with SMTP id
 4fb4d7f45d1cf-5d3be721b71mr5354684a12.31.1733542723058; Fri, 06 Dec 2024
 19:38:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1733504943.git.mchehab+huawei@kernel.org> <6f427a02c2c20512d5da178b47c64d553851a60e.1733504943.git.mchehab+huawei@kernel.org>
In-Reply-To: <6f427a02c2c20512d5da178b47c64d553851a60e.1733504943.git.mchehab+huawei@kernel.org>
From: Ani Sinha <anisinha@redhat.com>
Date: Sat, 7 Dec 2024 09:08:31 +0530
Message-ID: <CAK3XEhNNZyRDgjm5Hjes-Xnj4CxtO2eQcs7AyTNOOFcKa3LusA@mail.gmail.com>
Subject: Re: [PATCH 27/31] DEBUG
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Shiju Jose <shiju.jose@huawei.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, 
	Igor Mammedov <imammedo@redhat.com>, linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, 
	qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: V3GOa06jjAYe

On Fri, Dec 6, 2024 at 10:51=E2=80=AFPM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/acpi/ghes.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index abca351b18de..1fe4c536611a 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -534,9 +534,11 @@ void ghes_record_cper_errors(const void *cper, size_=
t len,
>      ags =3D &acpi_ged_state->ghes_state;
>
>      if (!ags->hest_lookup) {
> +        fprintf(stderr,"Using old GHES lookup\n");

I don't like this. If you must please have them under #ifdef DEBUG or
somesuch. See ich9.c

>          get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
>                               &cper_addr, &read_ack_register_addr);
>      } else {
> +        fprintf(stderr,"Using new HEST lookup\n");
>          get_ghes_source_offsets(source_id, le64_to_cpu(ags->hest_addr_le=
),
>                                  &cper_addr, &read_ack_register_addr, err=
p);
>      }
> --
> 2.47.1
>

