Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5163377lfk;
        Tue, 14 Dec 2021 03:54:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3zxTZqD6MoWjx8amL7XHhdzwMWjkzqddlpTKTNmYak4HR1tY+SScwl8/rcy2ZZGym8J15
X-Received: by 2002:a37:6716:: with SMTP id b22mr3387045qkc.123.1639482850585;
        Tue, 14 Dec 2021 03:54:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639482850; cv=none;
        d=google.com; s=arc-20160816;
        b=uZxh8TwdbapksizBG7NfuE/1yy0E9dVpYdrOory6TYoRefWc+POpkEw8zke9g1Gfk0
         /rLyhe+uUjLXlA+h6hmXv4Rec0ti1r82zDKuc72rIoI+X11BIg1QBHrT7R6xU1DngZ6+
         UpLGN1v/te36b488mfrqP2fQN+MXXQHM3uB6EPMpqB3WL6hCUb7xrAebpesu48PHeX1F
         6Yv33zLFog6qkrKLhPdMwnlsglqXyDglFLt5XAy/j92RENu/dqXrKf9bQ/4aPETjxZ4b
         1QIupCGdR0x0JKzjd2vblyJtyWYAC+INAJYpn4P0ENv8WGf8TT2CvnqCyoQ6lL2t0/eW
         4dsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=vFWy//LIJxob/lWiTb+7jlaVoy7eDwB1D/1wX1Vb67M=;
        b=JJuCCJ7BjdrQ1bgAlDrbtuty27LKsWf3yEm4jhfriFO7p1mJtKDUmVz8ml71sNAYlu
         9o8cqKXCfdl+6mJFBeIAAnbkiKjAHtpLUXWdhdrQw0hGXQWeEEhUA+4I79bzB0qzlJOk
         2Y20/xD4DF9wJeMnjSp7aFIwJx5oWTzyojGCa2aH2G8gqyYgrQq6CqD1fJSlCnBhGplh
         dYjM3EbRqdB4n5utypEsJMu898YueIAZr933LM9+FubcyYBM6CGm4KRD1/worHsbDetg
         GYXQz2Q5btluSp0rmvtEQo5TFze4y5F6VEnq7QkBbP1RjZjZ7gwE/s/Efdj2vvWTBy5+
         91BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ihaC3P5p;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id k15si13476049qvc.205.2021.12.14.03.54.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Dec 2021 03:54:10 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ihaC3P5p;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639482850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vFWy//LIJxob/lWiTb+7jlaVoy7eDwB1D/1wX1Vb67M=;
	b=ihaC3P5pAnNf8IFG5hB88HeoSC920UrcXrMD2on98VZ7YhI6BMKsDa2R590b+4lOnmIgF/
	nHOtZnkrrF5ElTe/tdgbEL3fmOI4JI9MxWlNKp9LCRLQY1EiAu2HmoZB7rrgv8O1Ke4IaG
	QpIimFRVsD32Ot0u3/avg1DwRgcQnks=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-y70fcU5vMr6_nRUdwEAzVQ-1; Tue, 14 Dec 2021 06:54:09 -0500
X-MC-Unique: y70fcU5vMr6_nRUdwEAzVQ-1
Received: by mail-ed1-f72.google.com with SMTP id y9-20020aa7c249000000b003e7bf7a1579so16766221edo.5
        for <alex.bennee@linaro.org>; Tue, 14 Dec 2021 03:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vFWy//LIJxob/lWiTb+7jlaVoy7eDwB1D/1wX1Vb67M=;
        b=TclT7gLdxUBc+7BeertQVInAB2ElDt5kTm6RglrGnuHKUDQlcrj27mur8Hbd/WLoJt
         tx0AFp4ytiQ3TK6Z/DVazxoxf/u6/13dYcOInoTIn7zhE1KMLSlany85DjscDvRzXljP
         9CfTiGxWRbP9J1D9M9pDsWpxwsYWMMgTkvfMNrxjo0uek4kN5x3GqB1pt4Gd/OF/dxYR
         APB+kK3bfdIDU9/IXwmvtTAAEU963eRuzZtOvfaDMWyhT9IoYsvmWmfMglxkMkDxLGHp
         aZPjEelrza5xAqYntBXXX+zBtu82zfXRklAgRuwPEXqrOei6zNJi65x3/3dgNKfXC/oz
         a8ew==
X-Gm-Message-State: AOAM532acF+i4mhY8x18ZV1eXpuGlv3dRIoUIIbVd34FiWxK/Rk16pm+
	s3y3ycxAw5lHTg7ryzzmou6+HucnV4e6LI2pdIuSWyNUZGO2QgIPENWBgOKuf6bnN9C5dOF07uA
	33U4mOV2Wo+k1ue+9xuQZZ3ravbOwCC7z+DFS4m2oVvBnmBrd+ox+sqJfSys80ohVMfg=
X-Received: by 2002:aa7:cb48:: with SMTP id w8mr7389248edt.402.1639482847943;
        Tue, 14 Dec 2021 03:54:07 -0800 (PST)
X-Received: by 2002:aa7:cb48:: with SMTP id w8mr7389206edt.402.1639482847698;
        Tue, 14 Dec 2021 03:54:07 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from gator.home (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
        by smtp.gmail.com with ESMTPSA id t5sm7728720edd.68.2021.12.14.03.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 03:54:07 -0800 (PST)
Date: Tue, 14 Dec 2021 12:54:05 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: pbonzini@redhat.com, thuth@redhat.com, kvm@vger.kernel.org,
	qemu-arm@nongnu.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu, christoffer.dall@arm.com,
	maz@kernel.org
Subject: Re: [kvm-unit-tests PATCH v9 0/9] MTTCG sanity tests for ARM
Message-ID: <20211214115405.wt4gazkqsvmhqv6w@gator.home>
References: <20211202115352.951548-1-alex.bennee@linaro.org>
 <20211214115046.kpiboz7uzgymdoci@gator.home>
MIME-Version: 1.0
In-Reply-To: <20211214115046.kpiboz7uzgymdoci@gator.home>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: PC4a4WLqgV0t

On Tue, Dec 14, 2021 at 12:50:46PM +0100, Andrew Jones wrote:
> On Thu, Dec 02, 2021 at 11:53:43AM +0000, Alex Bennée wrote:
> > Hi,
> > 
> > Not a great deal has changed from the last posting although I have
> > dropped the additional unittests.cfg in favour of setting "nodefault"
> > for the tests. Otherwise the clean-ups are mainly textual (removing
> > printfs, random newlines and cleaning up comments). As usual the
> > details are in the commits bellow the ---.
> > 
> > I've also tweaked .git/config so get_maintainer.pl should ensure
> > direct delivery of the patches ;-)
> > 
> > Alex Bennée (9):
> >   docs: mention checkpatch in the README
> >   arm/flat.lds: don't drop debug during link
> 
> >   arm/run: use separate --accel form
> 
> I queued these three to arm/queue[1].
> 
> >   Makefile: add GNU global tags support
> 
> Haven't queued this yet since I think we need .gitignore changes.
> 
> >   lib: add isaac prng library from CCAN
> >   arm/tlbflush-code: TLB flush during code execution
> >   arm/locking-tests: add comprehensive locking test
> >   arm/barrier-litmus-tests: add simple mp and sal litmus tests
> >   arm/tcg-test: some basic TCG exercising tests
> 
> These I've queued to arm/mttcg[2] with a slight change of dropping the
> 'mttcg' group name from any tests that can also run under kvm and
> renaming mttcg to to tcg for the tests that require tcg.

Hmm. I also just noticed that we should rename these tests to something
without the ::  The :: works with standalone, but it isn't all that nice
of a unix file name.

Thanks,
drew

> 
> I haven't pushed everything to arm/queue yet since I'm not yet sure
> I like all the nodefault tests showing up in the logs, even though that
> was my suggestion... I need to play with it some more.
> 
> Thanks,
> drew
> 
> [1] https://gitlab.com/rhdrjones/kvm-unit-tests/-/commits/arm/queue
> [2] https://gitlab.com/rhdrjones/kvm-unit-tests/-/commits/arm/mttcg
