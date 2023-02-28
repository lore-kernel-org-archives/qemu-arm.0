Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6191034ejc;
        Tue, 28 Feb 2023 13:32:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/H5LI2+Fr9SW3MY/uQOCmqGnKR31xk1GHjuoXL8lUGz+p6MaHa5urS32TKOabH1gewq7jR
X-Received: by 2002:a17:906:d9dc:b0:878:50f7:a35a with SMTP id qk28-20020a170906d9dc00b0087850f7a35amr4254845ejb.72.1677619977414;
        Tue, 28 Feb 2023 13:32:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677619977; cv=none;
        d=google.com; s=arc-20160816;
        b=zyq28afEbiLU9HWCL03ZOs3J12pjYNrhq9qzuAs2T+A4XzYN+zwUvuEZGGdGHqo6KP
         +vSYOxbd2hK76aGwGIj3Y1gpZXEkZ5rAj2mPjPrBd4mTTdIaSrXj6RxHEG70IZIUuqF1
         mJ3mYITkJ8Uw7VaiJcKtfrkxFeoou5eFxLN9sLYVPaUOCxERght1mR0+ENiW/UpwDqGr
         EHBoVaIilniw0XDeQCicStASJGbB4G9FWpI5chwh8CMxHC1a6ecHhCgM5OugFOLlZkYf
         +W95tWRyCgmefSw1M2JUIFp4N6TYV6PuFfshdF7d570WVmBRokihHFmj0PrNbJSYY+Si
         W7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=8Pc860YSulk9fikEVG+B4aKAm8X5/+wGLcWnCvldhAU=;
        b=ZeYgByYurZzDC8sBnkx22DQdS2ixMvJxn6p4mkQmOke2qmPcKtqA4gbDaYFa67d1dS
         97M8aC/gf097KP4yqMaq1eQwy0NHX/ngUeo+qQ3BeGOwxDnWdrEvD4OYyHYJcRjaSuXy
         1AftnZUpY1HPcuQocGTk7ygZ9DoAL9y0TWKtzrSyF8nHWV17TvcGJe83dX11D2iLNs9w
         R2f6xmErZhSJnTE1J/hDgcFcccAwID3vuqCl+naFZxWdMPOHw9aZj2jb7IOj5iBU8MoX
         gCyu5kLHxLJnTQ0XM4pdhKchzp+nxU/OYFES5EAJeOhkdT1fFLUTNg2pYNRPFr17x19m
         7bIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dcgaFcgv;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id g21-20020a1709067c5500b008d49082791esi11925983ejp.306.2023.02.28.13.32.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 13:32:57 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dcgaFcgv;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677619973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Pc860YSulk9fikEVG+B4aKAm8X5/+wGLcWnCvldhAU=;
	b=dcgaFcgvC7iGNlpiJl3AHdGutBLQKE/RtdKo0J6YISYdsPiEKQovFIfQJXZMtfQNe5OkF7
	AbAsSo1aKIZiykODrCNtr5M7Wq5Q5mF81AuzAFe6Uyr3dUBHwus8qFq3lriuMINsz9/frK
	ot31gVKToA6O7qPZJ2I8HNqxfLa01+4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-618-m939k37_NHORKlg-9Xt8Qg-1; Tue, 28 Feb 2023 16:32:49 -0500
X-MC-Unique: m939k37_NHORKlg-9Xt8Qg-1
Received: by mail-wm1-f69.google.com with SMTP id az12-20020a05600c600c00b003e8910ec2fdso4080711wmb.6
        for <alex.bennee@linaro.org>; Tue, 28 Feb 2023 13:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677619968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Pc860YSulk9fikEVG+B4aKAm8X5/+wGLcWnCvldhAU=;
        b=AG5ehJRj4nBL6QLpC8R27th3GLi+J3Wlb3ZX20eSUVJqEocJva3fOu8EjSanfFkHon
         sJ7jQf3f0FQetucDarXbEhmUXq0ij+ypvNdFuxlJq8bH34uvZDTkfWdrTR9MXUOUJz+5
         CC/7+XPF/Y9/4ZCq42w6M6Dbx+WtWSO0z4+LuQkjcPD773bEugW4IGgY/LbFdt6KndHH
         1pIZg/sT9TZbnLUV4/RVKsE//b9ok90kXa64n7cVJD0bf3qvVJTqzxlSwnIeEb+2XcVD
         bYxqTFcCfmRhhiUTHlaEJ+LOl2VQPO0t4mnsWLvLJzdcmorbsZMmZef3glv6QYnQBtY1
         xGrQ==
X-Gm-Message-State: AO0yUKX1swjMuV6Rutp57/1/SjPzfUXGVDA2rMLy598oj7v72pxU/3Cz
	nqSaEB7evLU9tcZkL1k4yEapYDRJB1iGjJRizZ79tivGKKgPbHdpqdx2vL03c9zCDFubOYxkMG7
	eQNyFwPb/0hNVC/FK
X-Received: by 2002:a5d:67cc:0:b0:2c6:e827:21c1 with SMTP id n12-20020a5d67cc000000b002c6e82721c1mr3043376wrw.50.1677619968657;
        Tue, 28 Feb 2023 13:32:48 -0800 (PST)
X-Received: by 2002:a5d:67cc:0:b0:2c6:e827:21c1 with SMTP id n12-20020a5d67cc000000b002c6e82721c1mr3043357wrw.50.1677619968315;
        Tue, 28 Feb 2023 13:32:48 -0800 (PST)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.52.141.194])
        by smtp.gmail.com with ESMTPSA id w15-20020adfee4f000000b002be5bdbe40csm10742578wro.27.2023.02.28.13.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 13:32:47 -0800 (PST)
Date: Tue, 28 Feb 2023 16:32:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
Message-ID: <20230228162938-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <Y/z4rwv09Ckhbtfp@redhat.com>
 <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
 <Y/3C+jC3Lk5MJxfu@redhat.com>
 <99a83e65-273a-ea1b-e7d9-bbdd8ca32145@redhat.com>
MIME-Version: 1.0
In-Reply-To: <99a83e65-273a-ea1b-e7d9-bbdd8ca32145@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: vo3XVgr1qbFF

On Tue, Feb 28, 2023 at 09:05:16PM +0100, Thomas Huth wrote:
> Well, without CI, I assume that the code will bitrot quite fast (considering
> that there are continuous improvements to TCG, for example).

We have lots of hosts which we don't test with CI.  They don't bitrot
because people do testing before release. This is what RCs are for.
We did releases before CI - it is a cost/benefit thing.

-- 
MST
