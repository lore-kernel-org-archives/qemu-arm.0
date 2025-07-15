Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D3CC83F17
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 10:57:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubdL6-0005RV-Dr; Tue, 15 Jul 2025 06:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ubdKz-0005ND-0r
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 06:56:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ubdKw-0001nu-RF
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 06:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752576997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZK/uFmsRyudIXIHixNTQDsyO6NqE+RIlJ2+HHvDXveQ=;
 b=NUNxuP6XO/TOlgbjnKRHfhU2DdzMHa4EPjmXmvUXurcsgsLC3txi3L2Qx9k+b0Ms+LYH0y
 p00inHli4tmI2nQZJYnF2cTWw16Bj5fULcK3UF5XbBoVbs5Cc7Qi30I1Cdot97MbM5sv3X
 7ORDyAllWGTPuMdc2NrnlixEkUyx64I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-mqAbzqVxMKqc1S2Yl7jL7A-1; Tue, 15 Jul 2025 06:56:36 -0400
X-MC-Unique: mqAbzqVxMKqc1S2Yl7jL7A-1
X-Mimecast-MFC-AGG-ID: mqAbzqVxMKqc1S2Yl7jL7A_1752576995
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43e9b0fd00cso31414825e9.0
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 03:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752576995; x=1753181795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZK/uFmsRyudIXIHixNTQDsyO6NqE+RIlJ2+HHvDXveQ=;
 b=IFq+26pWNRI72q8wW+2KGzDK/YtgP0DKr485VnqoHb3sino+bcfSvRH9TxLaqDxohk
 I4RbC3593Bd1wKmq2ez3tdTcwusVNj0Aakg9sywQwHxfsCKrzYfJGyrW54ByuMHfXSAB
 1LuM5bx04f6E9ScFfIatNZ/bvLsgujICT+189OKvw0MuI4OeiaSTTAzka2r9VzaUjH95
 v7khFqqXpnwNib22yi5JBWxaw3KdOPkcDGeHcjicvDjq11UAS57a3qDQ+Qb6FlePSlKx
 dncVDQeZxl+eGmYmFGhafM/160xJYSzhtvPE8OwLq5zM0+IPzQDidVLh7p8Mv8ZDbM4R
 9cMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCExVvxo6JLmSQIYj8Eh0xh4emVcqmGkG8h7L5loATi5cWvGeW63W2f6Pqe8tLgG8+c0ZqfpY2Qw==@nongnu.org
X-Gm-Message-State: AOJu0YxwTqguK8/jM4jU1qy/2SUKW4XWPNdxQ9C6WnPo+h9O+8qOW7aw
 ilEsFdmby1yMU/rsseDZpI+9ioZvAD703M6W3dVVZ2TPY6CPpxa3ktsd6sT8oBr4yYHkjNS3ilj
 8pbxHD0IVOtDxOiIifDMGbHz0zgavuLwscIDGElyEEjV1f8XtovSPvw==
X-Gm-Gg: ASbGncsGa56/A/E60IrkhLMcMDR5Swhld3uKzHos8sDLoTCzEl+rnOTKxtTO5sBR68h
 P9NwR1B51HHP1EMPVqg169N3WXRUc6/O5y793WwrxuoGH4SZFt9sa1qPg8SJR6Zgk/UDnj9zdt8
 YDsAT3wgoviSB3QaWh+AYfMgxvkvlbhZSDBjCtv2LnW5s+ao1jrvp+GF3ODZ4zyRD/88KOgMuZ+
 yRmH4KZqJLusH4n3bjF2CIBOCNQ809UXUSOiLviBErVSihPPRhBKNIonsR8/lFzKKbfO3oBjVqi
 yfUZMTv7z6efo2GISl1cPm+b/qXnhw==
X-Received: by 2002:a05:600c:46cd:b0:456:1146:5c01 with SMTP id
 5b1f17b1804b1-45625e72bdamr30340905e9.12.1752576995147; 
 Tue, 15 Jul 2025 03:56:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxPjoqzF/UxmLk9O1q5Wherqs5Uf5lOyq4vb0vIeExr8VKZOMl+v7qnm2xEutwZmanzsbH/w==
X-Received: by 2002:a05:600c:46cd:b0:456:1146:5c01 with SMTP id
 5b1f17b1804b1-45625e72bdamr30340715e9.12.1752576994737; 
 Tue, 15 Jul 2025 03:56:34 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45614aeba29sm72913475e9.11.2025.07.15.03.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:56:34 -0700 (PDT)
Date: Tue, 15 Jul 2025 12:56:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v10 (RESEND) 00/20] Change ghes to use HEST-based
 offsets and add support for error inject
Message-ID: <20250715125631.4231c850@fedora>
In-Reply-To: <CAFEAcA-f03Ua=eipArDKrvWS5SCeeMiXkuhJAQsQ46cNTPdtFw@mail.gmail.com>
References: <cover.1749741085.git.mchehab+huawei@kernel.org>
 <20250715104425.7a6835a6@fedora>
 <CAFEAcA-ry+zydpTnAi40+drtL8b-eMrVWjh=0jv3Uk2NJGuuEQ@mail.gmail.com>
 <CAFEAcA-f03Ua=eipArDKrvWS5SCeeMiXkuhJAQsQ46cNTPdtFw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0drUVo6xv90y-QsRRXwTbmPstgAamvtLR_kPH0LKV1k_1752576995
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 15 Jul 2025 10:01:02 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 15 Jul 2025 at 09:59, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 15 Jul 2025 at 09:45, Igor Mammedov <imammedo@redhat.com> wrote:  
> > >
> > > On Thu, 12 Jun 2025 17:17:24 +0200
> > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > >  
> > > > Hi Michael,
> > > >
> > > > This is v10 of the patch series, rebased to apply after release
> > > > 10.0. The only difference against v9 is a minor confict resolution.  
> > >
> > > Michael,
> > >
> > > it's been on the list for a while and there are another GHES
> > > related patches in queue which depend on this series.
> > >
> > > Can you pick it up?
> > >  
> >
> > This series was only sent to qemu-arm, not qemu-devel, which
> > is probably part of why nobody looked at it. You should
> > probably resend it to qemu-arm + qemu-devel

I'm fine with merging it even now (it was through so much testing
that I feel it's low risk). But as always, it's all up-to maintainers.
I'm just pinging so that series wouldn't get lost.

With latest Michael's pull, binary blobs likely need to be regenerated.

> 
> ...no, sorry, that's wrong -- the series *was* sent to -devel,
> but this branch of the email thread has had -devel dropped
> for some reason. Apologies for the noise.

I guess it was my mistake while removing folks to avoid
spamming just for process thingy.

> 
> -- PMM
> 


