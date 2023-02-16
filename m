Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp815595ejb;
        Thu, 16 Feb 2023 11:44:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+PMSz8LD/Ef7f24d4t+Z+znhTBLP8v34uQWxYsmrOFAcZnWnD2qI+5AtdF8xGkYKZijs2E
X-Received: by 2002:a05:6402:31f3:b0:4ac:be83:2044 with SMTP id dy19-20020a05640231f300b004acbe832044mr6783575edb.3.1676576662699;
        Thu, 16 Feb 2023 11:44:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676576662; cv=none;
        d=google.com; s=arc-20160816;
        b=QoxVppqNm/w8P1vtfx7sh7BFSl7ki6uKLz724HvyyML+44o3kGy7saY29iRKg6ZQ5q
         AGBDp17NHx93BhEsMEWY9OcAVgNJZsveM9nKBX8FgMvqVVDnojzmZ0go5VMT+C3u1qI5
         1HXTqfV2PNvVm3io5/8U0AdKHTstMQCB9GzCD1vd7PwaHwzm7ypicFQR+gCH5bQrOmkP
         VJD3qFV3J0lYe41rv2vv4mYUlQs9vGzmaDOrLhGaG5u7Jb3lvZnIdxxMX6/aj38ws9/d
         uaDjKLCmukjRYnihhPA3xlrw9tUx6t9PUj1CAEi+kR4lMwnVvf/08JlphQTBfEj4RypG
         PMCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=aMxQhRywysUB1TnkFTq5WNnEt3G5wTNy/MeL/cHvKeg=;
        b=L5+/B/K8KLAveqT65b67ZegjvDkoVGhZNnFOaA5DdlWFlbzooSCkjf5ZlJvHXU3BTk
         85YdzlxCALgyQ6fybzklw1Qxc97RveNelE3YkaDa1r8B1b6atBCPAf9i2C2lKiUMshWy
         xzZMGWOfeXtpP5n3obeUG3fqgYR59nnNVcXwPmO2JZzn16jptWsHOpOjGkIaaSoTuL2I
         6vY/NVkpxPPZElMoIPY5KvtzcP55fTYOJPMNkvWo2LaMfozpCxXZ5CLJsSq+PoZta5ZB
         b58iCSIG8Cg6hrC6uki/oYvqZ49xCqSEnRyRRpgOU05fFKUMysHmCQwrDYNm/t/5qZSx
         Jqpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UyIAAb3Y;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id y7-20020a50e607000000b004ad7c470e8esi164435edm.143.2023.02.16.11.44.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 11:44:22 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UyIAAb3Y;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676576661;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aMxQhRywysUB1TnkFTq5WNnEt3G5wTNy/MeL/cHvKeg=;
	b=UyIAAb3YnMKUM4bssQkhORkxUv1ogdpRE8y/ideD8E5GT5T8/yKRLCyTj+xGzqytVnhBK+
	NAb2Ir/9FQaJVNyXCpF8X6pSOWMm2oVD1CyWFbWu0STg64TU2hIV/YVKBEZQxs+JCNeinY
	LEeVMTTYeJQoQWpN51XWNfj4Jl2brrw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-L_2GMbj9NyGK4o827Vc5nA-1; Thu, 16 Feb 2023 14:44:18 -0500
X-MC-Unique: L_2GMbj9NyGK4o827Vc5nA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2B3C29DD999;
	Thu, 16 Feb 2023 19:44:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.164])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 725FF40C10FA;
	Thu, 16 Feb 2023 19:44:14 +0000 (UTC)
Date: Thu, 16 Feb 2023 19:44:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
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
Message-ID: <Y+6HjEUG2fpalQWv@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-8-alex.bennee@linaro.org>
 <CAFn=p-b18P0oOhiYPkoQvVzQfqVu4XLprp4-JMbPRF4y72-svQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFn=p-b18P0oOhiYPkoQvVzQfqVu4XLprp4-JMbPRF4y72-svQ@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-TUID: kM6CTOiFOAiJ

On Thu, Feb 16, 2023 at 01:15:30PM -0500, John Snow wrote:
> On Wed, Feb 15, 2023 at 2:25 PM Alex Bennée <alex.bennee@linaro.org> wrote:
> >
> > The 22.04 LTS release has been out for almost a year now so its time
> > to update all the remaining images to the current LTS. We can also
> > drop some hacks we need for older clang TSAN support.
> 
> We still support Ubuntu 20.04 until 2024 though, don't we? Is it safe
> to not test this platform?
> 
> I've long been uncertain about what our policy actually is for docker
> tests, if we want to test every platform we support or only some of
> them; and if it's only some of them, when do we choose the older and
> when do we choose the newer?

Ideally we would test both the oldest & newest versions of each
distro we support. Practically though, we're compromised by the
limited CI resources available.

Dropping older Ubuntu images is a reasonable tradeoff, since we
still have Debian images covered in CI. Debian can be thought
of as an older version of Ubuntu to some extent, giving coverage
that will mitigate the risks of dropping 20.04.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
