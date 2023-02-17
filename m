Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1691108ejb;
        Fri, 17 Feb 2023 09:14:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8Z/HF/Ka5daes2QYCQgOCA/CmIPeFU5uB0I2yqM+hp5oNE74pPj1cteVa6P0LBYa3llTN1
X-Received: by 2002:ad4:5d61:0:b0:53a:151:b650 with SMTP id fn1-20020ad45d61000000b0053a0151b650mr2404688qvb.35.1676654092122;
        Fri, 17 Feb 2023 09:14:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676654092; cv=none;
        d=google.com; s=arc-20160816;
        b=FvrkvZA6dWNu8xAiavIpR8ejEBEDKB1/tSgsR8xEO/hqlNFr5dsweH9BevJ3yKN1N/
         2ibsNlj34+xN0BemVpJSwVWbHZ7nYylQfoMna91mOYy2s8k4tKws8pLPTcSBfDMWvTjH
         b9PkochQAUWv49KEVgyZRG8rynRBlSKt7iJDe1kcbB3+RclQIg4X9SfLHmrBUyuxenBt
         aS3wF1WmEv1WuZp/pDzHTLU8epoc7MVeF5r/r1ao0Xq5KuuUi0HkPdpZpvZYbUW5+8sD
         X6/T+ELCjob+jQROczP1HCrNFFHCYoiDw/lyJTadhBexmfGfVBIsEX+bLqULpfFTSfy4
         6v4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=44whwVuQ8INZ1y0un8+xW8R/aiFeomeUjf/BvjBW09M=;
        b=Kcyb9p8wKZ2iY4Omid+lHZ3gld/rKNUijzDLUdZyoFByLGh9qVCREdssquidtAXP/L
         7eyMb4WHDrMeZx7Clx7vqaTFvRYOLmiE8X0kkx8aRWKMuHWNbim4naoGERZW8K8fe3ip
         DF6ROy42vTeIgS551P95MjPMRedPvhfcSD9KgGQqLCgoqHWxOxAqRm1tmxNhkw87I6HB
         E3QrCcmqXBaaYFx69nf/7+3vtL4TbTxbPNWkuumtgUTx1pM8160Kye/8Ksk//bxPfMvU
         0zyIzB8AfRiFUZAxBKSgHM+BYCcTgktH73MzEVBNEET/jJKv6ScmuWk7sYVl6RYwLVU0
         DKtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Q+Ejx/TX";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id j10-20020a05620a288a00b00705de7c6879si3922948qkp.321.2023.02.17.09.14.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 09:14:52 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Q+Ejx/TX";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676654091;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=44whwVuQ8INZ1y0un8+xW8R/aiFeomeUjf/BvjBW09M=;
	b=Q+Ejx/TXoYpZSjZKfpFj8UU6ZxL/Dsw60vOU8kZJdBhwVuLKObCKwjqGAKdAEJsv8XcAkz
	pVnbs15YqdUjDxX7XVAIgNcchB4AkB2YmG/U5pGH8Xlmaers5iT6k+lHvz4QCLR67aywUQ
	5PJ+9v2qgTO3qZ2Bh70M0XD53nUM9ss=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-QygbOJLsPmOP30XMezLGFA-1; Fri, 17 Feb 2023 12:14:48 -0500
X-MC-Unique: QygbOJLsPmOP30XMezLGFA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 612CD85A5B1;
	Fri, 17 Feb 2023 17:14:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0729140EBF6;
	Fri, 17 Feb 2023 17:14:42 +0000 (UTC)
Date: Fri, 17 Feb 2023 17:14:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>,
	Michael Roth <michael.roth@amd.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Darren Kenny <darren.kenny@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>, Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 07/12] testing: update ubuntu2004 to ubuntu2204
Message-ID: <Y++2AK5cDgCGkpVN@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-8-alex.bennee@linaro.org>
 <CAFn=p-b18P0oOhiYPkoQvVzQfqVu4XLprp4-JMbPRF4y72-svQ@mail.gmail.com>
 <Y+6HjEUG2fpalQWv@redhat.com>
 <CAFn=p-b8nK8pNWk3WZgVqjUMx27E4ekeypjGpyk2nrRz=UmNJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFn=p-b8nK8pNWk3WZgVqjUMx27E4ekeypjGpyk2nrRz=UmNJg@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: l9XJU0KFhXEz

On Fri, Feb 17, 2023 at 11:35:44AM -0500, John Snow wrote:
> On Thu, Feb 16, 2023, 2:44 PM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Thu, Feb 16, 2023 at 01:15:30PM -0500, John Snow wrote:
> > > On Wed, Feb 15, 2023 at 2:25 PM Alex Bennée <alex.bennee@linaro.org>
> > wrote:
> > > >
> > > > The 22.04 LTS release has been out for almost a year now so its time
> > > > to update all the remaining images to the current LTS. We can also
> > > > drop some hacks we need for older clang TSAN support.
> > >
> > > We still support Ubuntu 20.04 until 2024 though, don't we? Is it safe
> > > to not test this platform?
> > >
> > > I've long been uncertain about what our policy actually is for docker
> > > tests, if we want to test every platform we support or only some of
> > > them; and if it's only some of them, when do we choose the older and
> > > when do we choose the newer?
> >
> > Ideally we would test both the oldest & newest versions of each
> > distro we support. Practically though, we're compromised by the
> > limited CI resources available.
> >
> 
> Yes, understood.
> 
> 
> > Dropping older Ubuntu images is a reasonable tradeoff, since we
> > still have Debian images covered in CI. Debian can be thought
> > of as an older version of Ubuntu to some extent, giving coverage
> > that will mitigate the risks of dropping 20.04.
> >
> 
> Okay, I'll take your word for that. I am not personally familiar with how
> much those distros diverge; I know Ubuntu is debian-based but that's the
> extent of my knowledge as I don't daily-drive either.
> 
> So, firstly:
> 
> Reviewed-by: John Snow <jsnow@redhat.com>
> 
> because I suspect we all have our reasons and I also agree testing newer is
> generally of higher value than testing older.
> 
> However, would it be possible to keep the older Ubuntu test as a manual
> execution that we could invoke at will, only during RC testing phase? If
> it's not a lot of work, I could even check that in myself as a follow-up if
> it isn't unwanted.
> 
> I find that "oldest version of x" is quite useful to me for testing Python
> stuff in particular, as that ecosystem moves pretty fast. It'd be mighty
> convenient to me in particular to keep an old Ubuntu test around to run
> manually as needed.
> 
> (Heck, even if it wasn't on CI at all but was just a container I could run
> locally, that would still be quite useful.)
> 
> Whaddaya think?

It would be pretty trivial to have tests/docker/dockerfiles contain
Dockerfiles for *every* supported distro version we have, and then
only build & test a subset in CI. It would merely suggest that we
change our naming convention so the dockerfiles in that dir include
the version. Basically adopting the standard libvirt-ci naming
convention for targets of $OSNAME-$OSVERSION:

$ lcitool targets
almalinux-8
almalinux-9
alpine-315
alpine-316
alpine-edge
centos-stream-8
centos-stream-9
debian-10
debian-11
debian-sid
fedora-36
fedora-37
fedora-rawhide
freebsd-12
freebsd-13
freebsd-current
macos-12
macos-13
opensuse-leap-153
opensuse-leap-154
opensuse-tumbleweed
ubuntu-1804
ubuntu-2004
ubuntu-2204

Contributors can then use 'make docker-XXXX' to run build tests
locally on specific distros when they need to test something
that isn't covered by default in out gating CI


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
