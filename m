Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1691815lfk;
        Fri, 12 Nov 2021 05:23:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwF1Q0Unmc+bRSOqIzRxi1HhcpAEKOBlK/10fCmS+ge8TMDIrUtCHPoe8w2/DbF8jk+PKFb
X-Received: by 2002:a05:6402:354e:: with SMTP id f14mr20527553edd.166.1636723400313;
        Fri, 12 Nov 2021 05:23:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636723400; cv=none;
        d=google.com; s=arc-20160816;
        b=e9EEVIcRzb1xAlSeXDFYXC8jtOCY8oOlq8/RIC+e2Kf3WDMqHsb5v9j72NEXSuwZgW
         9iG3yOB/F7CZJaaM33US6kiNJc66Mq0KYn39ntwQMq9iVpo6xdju/Zb+QmImDuqTlME1
         D6U1XTiP2GhF5RC5q2fKPgYT1ys4l4XUsn55J8DRn2KKMZln57gZ/annmRU0bJ6V4HGd
         /iLdOPQoEkK3sLjSm+NQwhJChbq4yJKwiNDbCA8mQFwPT1Cm6j9EtoBWWpyVTyn2h4y+
         rpw6Z1y70n14++EePKki01A24ahohVccMDlShwxaE7cKbdVAltstiRfc2NZaVYVQ0a49
         krxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=dyKHXIHlcMfQZRfkXKprwqg9ZzcuoNJyRdE1idLkbvo=;
        b=n7hSilpTHZe+NpJVV1jyo0LArhuMWryX8BOHZxtQdNWrdGMyehGzqQ3Z3ctr4OrFP0
         rJw1gwkZWyTB6gAQ4eD75gNP1FNIPVe8IsuzA8Dur8Q9aS/NTFRj/KOb2d3DDMhHw1uq
         dipql4joDP2saSD4JHcZ+tdrMnc9djEz3iOezbYqzuS02XA5gia+aNojT8N5TZzpZRho
         eg0D//z0cssBkAc6iF3hLMwyR4+O6DxrFRziWiu1rGua8wmpSUpnFT+nCwB61w2GnC1R
         eiNlOzwWmSuRuRwIHQT5WmPV4poPk9SltlgLJ9GKOIdJX5NWLzKMst4HudajV0MNpApL
         Y0Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="HR/XLVXT";
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id o8si9712818edi.429.2021.11.12.05.23.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:23:20 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="HR/XLVXT";
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636723399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dyKHXIHlcMfQZRfkXKprwqg9ZzcuoNJyRdE1idLkbvo=;
	b=HR/XLVXT7EoDvSnSaIeg9IoHZJyK/2dtVCACjYkM6z2fBmJnci0yrgEXk2zwpZXtzZCY9R
	oPAH7oAM/KRlRWaCSrUtsFlmT3PMVO4vt5mXmE710c5VlJNAToN1hpNNHaVD1g4s5mJDwA
	znJOeybY3hEwfxQ/Mwpu7R6dZWJsI8k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-2OIBLK06OIeZiHr37germg-1; Fri, 12 Nov 2021 08:23:16 -0500
X-MC-Unique: 2OIBLK06OIeZiHr37germg-1
Received: by mail-ed1-f71.google.com with SMTP id f4-20020a50e084000000b003db585bc274so8188743edl.17
        for <alex.bennee@linaro.org>; Fri, 12 Nov 2021 05:23:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dyKHXIHlcMfQZRfkXKprwqg9ZzcuoNJyRdE1idLkbvo=;
        b=YJkNtm7sqVaXUvwsKJQx+uvU4eSwmXdnIVBRlRNyKjYgvi1SVDPoq/daOyMuPq9YwR
         YqohdHuc4py9P5p9CebbrsLuo3fi4orhqYR9cV4vniMhRoY2ObH2bKn/sJo8cqZJKoYy
         7BMLpSJc5+U31eeCUjEHjQCsLZmyV5p27HAZtjBME8nbONsXEq8OJ639nsaDf4C4Pmp6
         3QqzkuqRrJOS/Nvll1i5o+5ysgNB5bxqQIW+M+fxuaMV6r5XcdFLPBnCV/RvlWKPK0eM
         ojUXbtXAe2P3gNMHPi/tF/7TxGZyDn9bSrzfxkcilhVXOM19KLaVe/8tUnVh1nQ5zSlu
         2EBg==
X-Gm-Message-State: AOAM532L67CzZMv9uUolkGpBqFQLL78RbgqbjwDSwvb3iJUYZgNeCKvP
	y4JqzCeuhGzfPfT+NYTGHj/d+OhRhfkP/p5f0weMcVyDRhRrS0dKYs0TOjFTScsdb2UOyA4TVGM
	oBWhohDgcl/dLMY6Jk0JW7bCbzuWmq1N3xp9DtgHxRsUYjLYUyEsdtMg6yugByOceH3s=
X-Received: by 2002:a17:906:3a48:: with SMTP id a8mr19304763ejf.458.1636723395120;
        Fri, 12 Nov 2021 05:23:15 -0800 (PST)
X-Received: by 2002:a17:906:3a48:: with SMTP id a8mr19304728ejf.458.1636723394897;
        Fri, 12 Nov 2021 05:23:14 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from gator.home (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
        by smtp.gmail.com with ESMTPSA id n16sm3041819edv.79.2021.11.12.05.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:23:14 -0800 (PST)
Date: Fri, 12 Nov 2021 14:23:12 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvm@vger.kernel.org, maz@kernel.org, shashi.mallela@linaro.org,
	qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org, eric.auger@redhat.com
Subject: Re: [kvm-unit-tests PATCH v3 0/3] GIC ITS tests
Message-ID: <20211112132312.qrgmby55mlenj72p@gator.home>
References: <20211112114734.3058678-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211112114734.3058678-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: tO3gySgCB4N+

On Fri, Nov 12, 2021 at 11:47:31AM +0000, Alex Bennée wrote:
> Hi,
> 
> Sorry this has been sitting in my tree so long. The changes are fairly
> minor from v2. I no longer split the tests up into TCG and KVM
> versions and instead just ensure that ERRATA_FORCE is always set when
> run under TCG.
> 
> Alex Bennée (3):
>   arm64: remove invalid check from its-trigger test
>   arm64: enable its-migration tests for TCG
>   arch-run: do not process ERRATA when running under TCG
> 
>  scripts/arch-run.bash |  4 +++-
>  arm/gic.c             | 16 ++++++----------
>  arm/unittests.cfg     |  3 ---
>  3 files changed, 9 insertions(+), 14 deletions(-)
> 
> -- 
> 2.30.2
> 
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm

Hi Alex,

Thanks for this. I've applied to arm/queue, but I see that

FAIL: gicv3: its-trigger: inv/invall: dev2/eventid=20 pending LPI is received

consistently fails for me. Is that expected? Does it work for you?

Thanks,
drew
