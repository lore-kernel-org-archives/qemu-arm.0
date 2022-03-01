Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2488007lfq;
        Tue, 1 Mar 2022 02:05:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2gzcgb9eUIqHxLCxHhQRj2MhcW9uXPbfo0B/egbNWlfn55Wm4nJPbGIoXK0FenfKw+/fv
X-Received: by 2002:a17:906:ce54:b0:6d6:e57e:7694 with SMTP id se20-20020a170906ce5400b006d6e57e7694mr1442219ejb.166.1646129150483;
        Tue, 01 Mar 2022 02:05:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646129150; cv=none;
        d=google.com; s=arc-20160816;
        b=uBItdl2JUhz0fLqAsHv2jl7DJTLp5s1wd62UqniXu9tPLJ7Oy+DBordVk4+aF5Bnjx
         QrFw02QIfAGXa+VAvK5cFRYU4zEnCQxz65PMWUba4Oxe23chJw0YILAAuPU0SnSJkvPq
         /i/94Hc2dPni4wNeV4YnIUIUoqvmmicScjTurABlevN94YUAxpdaSyio/7zFTJ/Ox5Bs
         fs2fESP9zn3yrG/z6MBEizTCI+fV58CQ9YxlqzysNRmVgi109PTRxwhZjUjI0Tah7c7X
         O/CVBL1aLjQFPhYwJHBeK6Cqm6j13un9QdlThsa9o+cygosvVNu+K+JPyv8BoN5JvUKv
         txrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=Up+PjZdkxU3TAAZHOOnEpizRqrEqSyoQ5fEdAFgzruI=;
        b=SSd++CXVFcm/L0E0a71XAircRYz+B1VMa9brfCMsIZNvGDcTNWRSYSGnRZZG+BjeUG
         JavPtmseTb2DD/mQFeX7eM1EWlIcnufTBmi4ymeDssTZP1XuuyI0akEcqfgGTpb63A7r
         NaH256FQZgYYEoGP6mdi1vjLuIt0TqhJId2CmDHUYdkl2BVvbdXGlz/MwsPgB8hKgMR0
         iW04UGsbTb9PG/2ynoMilxqqsOkMu2Jo2yagWDcybK5hCVCsvkjmB0iOvilJDO21MCtm
         DUxb1SIIrK07r5eua/otQkbmw86btcSrOWMxefCw/SWSwudpNPZUt62CDz6zTA31Zn8a
         zqiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JVb7TXpN;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id j2-20020aa7de82000000b00403c81e356bsi8190689edv.463.2022.03.01.02.05.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Mar 2022 02:05:50 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JVb7TXpN;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646129149;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Up+PjZdkxU3TAAZHOOnEpizRqrEqSyoQ5fEdAFgzruI=;
	b=JVb7TXpN8+0SzvB0fA0IP61O+uFaYImHefL/ydD4bLGGzv5r0i16zLe9EyVJvRO4P6XnZ2
	mSNzGVAvEdpbi2IeEQSdmDpiCNtL7RDtgFB+p0387tMYajMoiu/aRU3H52f1wOly9QZ2dO
	gPASs50EAfvD3xKa++WX5XQ6NujN1ks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-2O_8UufiNmaAgvsxyQbt-Q-1; Tue, 01 Mar 2022 05:05:33 -0500
X-MC-Unique: 2O_8UufiNmaAgvsxyQbt-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B1A2425CF;
	Tue,  1 Mar 2022 10:05:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.101])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAE9573DA5;
	Tue,  1 Mar 2022 10:04:02 +0000 (UTC)
Date: Tue, 1 Mar 2022 10:03:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, f4bug@amsat.org,
	aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
	crosa@redhat.com, qemu-arm@nongnu.org, richard.henderson@linaro.org,
	sw@weilnetz.de, Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH  v2 04/18] tests/docker: update debian-arm64-cross with
 lci-tool
Message-ID: <Yh3vj/otYYIuLUIz@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-5-alex.bennee@linaro.org>
 <YhyVvAv0M8WwiK2A@redhat.com>
 <87r17nm2au.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87r17nm2au.fsf@linaro.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: 4oiNw3TpZd8U

On Mon, Feb 28, 2022 at 02:39:17PM +0000, Alex Bennée wrote:
> 
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > $SUBJECT  =~ s/lci-tool/lcitool/
> >
> > On Fri, Feb 25, 2022 at 05:20:07PM +0000, Alex Bennée wrote:
> >> Using lci-tool update debian-arm64-cross to a Debian 11 based system.
> >
> > Likewise
> >
> >> As a result we can drop debian-arm64-test-cross just for building
> >> tests.
> >> 
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >> Message-Id: <20220211160309.335014-5-alex.bennee@linaro.org>
> >> ---
> >>  .gitlab-ci.d/container-cross.yml              |  10 +-
> >>  tests/docker/Makefile.include                 |   3 -
> >>  .../dockerfiles/debian-arm64-cross.docker     | 186 +++++++++++++++---
> >>  .../debian-arm64-test-cross.docker            |  13 --
> >>  tests/lcitool/refresh                         |  11 ++
> >>  tests/tcg/configure.sh                        |   2 +-
> >>  6 files changed, 173 insertions(+), 52 deletions(-)
> >>  delete mode 100644 tests/docker/dockerfiles/debian-arm64-test-cross.docker
> >> 


> > This cross dockerfile is a fully self-contained image.
> >
> > Traditionally QEMU has had a split image for Debian cross targets,
> > where there is a base with common native packages, and then a
> > layer for the cross packages.
> >
> > lcitool is capable of generating the image in this split format
> > using the arg
> >
> >    --layers {all,native,foreign}
> >
> > Personally I think it is simpler to just use the fully self
> > contained image, as it would simplify our gitlab pipeline
> > to only need 1 build stage for containers.  The cost is that
> > we'll not be sharing layers for native packages and more wall
> > clock time building since we're installing the same native
> > packages over & over.
> >
> > I'm not saying to change your patch, I just wanted to point
> > out the possibility in case someone cares strongly about
> > keeping a split layer model for cross containers.
> 
> My thinking on our layered approach has evolved over the years. One of
> the problems is when the two layers get out of sync and you run into
> build issues due to different states of cached layers.

Oh, I'd not even thought about that possibility but yes, it makes
sense. We could have cached the base layer and when we do an
'apt-get update' in the cross layer we'll end up pulling in new
copies of packages otherwise present in the base layer, partly
defeating the point of having two layers.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
