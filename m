Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5661471ejc;
        Tue, 28 Feb 2023 03:45:10 -0800 (PST)
X-Google-Smtp-Source: AK7set84ZJlWah9uOriNY8X+pBWNOXDeWaYggeRmq1BvIXYYROIbiasXSRAu6Nqcoe+odv0iJZ+s
X-Received: by 2002:ac8:5885:0:b0:3bf:c355:9ad4 with SMTP id t5-20020ac85885000000b003bfc3559ad4mr4603477qta.34.1677584710404;
        Tue, 28 Feb 2023 03:45:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677584710; cv=none;
        d=google.com; s=arc-20160816;
        b=JtTAzipmAYtYAZIGe4m5ttuTqePofv8cM3MkN751oqepMVnjM3O58pvSZEA3I/Sk25
         qVRfXeBslNQJzQBwLHWc16GBp9y0h5oARSM3cyKWudGsuT/gsyLL4gtpwoTs93EDvU+/
         icLuNNII4xNACvaNG6wxSTr/rAAMkVqHc1/4roF6TD17yeTQsRqY6KxEqt4jFFIIIkgs
         k0ZOw27ir76VXYcj+lMzf9Bg40a2r2kW59k1k4zQTyDaTxpiiLDHbaWVgURzDAnu+Nm7
         sGaGMTiE/UvN3dASQLBWwls67iIJ54mN15QkVBrhCPJxfMNr+wWZoVuRKnAlEL14C5uJ
         IUqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=QYJqTrc7Zwyd4661Pi87D7RX7WRY8cXPISR3mo7dQyk=;
        b=Q5RR8CUHDEibaPP2lqkEq15uAdabh30rm1vlCssPMbAX6KP5Cpj/bPpRJ1lnIl4uL+
         DfHv+fRpSPxTYMIpqJzTIOiw06QifbmgEwIfoybjpoKVmIrO+HW0UASYnZydlTn3AzeP
         +BIvIPgnqdwqxDoabOpuwToEoNuraRn6FoEG7adYXq3bCeA7b/3TbepDHr4QlB7fc+D7
         yIpAlOKICsq3JlT5KXgo/4CPgJlS79McavbRuYGr8/4wuWXtp8hdiA462A0KWyUiVviG
         NZyKbQFag6DVwrLfxWghfEuvxKkxBx1tJQlvDW8OL15q62q7IrJ8QvCIh1OBkQpU9z7E
         wxRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IBGDbxq0;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id y7-20020a05622a004700b003bfba1b3622si8717705qtw.671.2023.02.28.03.45.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 03:45:10 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IBGDbxq0;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677584710;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QYJqTrc7Zwyd4661Pi87D7RX7WRY8cXPISR3mo7dQyk=;
	b=IBGDbxq0Gn9MHxblcEzOKU8LuYE8lFVjOUb/0xku2EUraRBlMYJLP07S70vJrRdJGa/dTP
	6dYJkS1NtuKo2KC6F0Al1EY/dke2lh6rk6TdO1sYN2YI1eSF3cY7xWO0+g64eGzBo6GDM/
	wocwAU3cGn6VT/3r3RP4l2eHMzRrQPI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-Xq-4ydFkMqCdhSV-PmMG_A-1; Tue, 28 Feb 2023 06:45:08 -0500
X-MC-Unique: Xq-4ydFkMqCdhSV-PmMG_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDCEB3C0DDA1;
	Tue, 28 Feb 2023 11:45:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 265EF1121315;
	Tue, 28 Feb 2023 11:45:03 +0000 (UTC)
Date: Tue, 28 Feb 2023 11:45:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
	Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>, Ed Maste <emaste@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
	qemu-block@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	John Snow <jsnow@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
	Bandan Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: Re: [PATCH 4/7] tests/docker: add USER stanzas to non-lci images
Message-ID: <Y/3pPAXgnoReOBVi@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-5-alex.bennee@linaro.org>
 <6a0a7246-e9fd-abfc-283e-b591000cfec7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a0a7246-e9fd-abfc-283e-b591000cfec7@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: GtdC+CURHae5

On Tue, Feb 28, 2023 at 12:43:01PM +0100, Philippe Mathieu-Daudé wrote:
> On 24/2/23 19:08, Alex Bennée wrote:
> > These are flat but not generated by lcitool so we need to manually
> > update them with the `useradd` stanza.
> > 
> > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > ---
> >   tests/docker/dockerfiles/debian-all-test-cross.docker     | 5 +++++
> >   tests/docker/dockerfiles/debian-alpha-cross.docker        | 5 +++++
> >   tests/docker/dockerfiles/debian-hexagon-cross.docker      | 5 +++++
> >   tests/docker/dockerfiles/debian-hppa-cross.docker         | 5 +++++
> >   tests/docker/dockerfiles/debian-loongarch-cross.docker    | 5 +++++
> >   tests/docker/dockerfiles/debian-m68k-cross.docker         | 5 +++++
> >   tests/docker/dockerfiles/debian-mips-cross.docker         | 5 +++++
> >   tests/docker/dockerfiles/debian-mips64-cross.docker       | 5 +++++
> >   tests/docker/dockerfiles/debian-native.docker             | 5 +++++
> >   tests/docker/dockerfiles/debian-powerpc-test-cross.docker | 6 +++++-
> >   tests/docker/dockerfiles/debian-riscv64-cross.docker      | 5 +++++
> >   tests/docker/dockerfiles/debian-riscv64-test-cross.docker | 5 +++++
> >   tests/docker/dockerfiles/debian-sh4-cross.docker          | 5 +++++
> >   tests/docker/dockerfiles/debian-sparc64-cross.docker      | 5 +++++
> >   tests/docker/dockerfiles/debian-toolchain.docker          | 5 +++++
> >   tests/docker/dockerfiles/debian-tricore-cross.docker      | 5 +++++
> >   tests/docker/dockerfiles/debian-xtensa-cross.docker       | 5 +++++
> >   tests/docker/dockerfiles/fedora-cris-cross.docker         | 5 +++++
> >   tests/docker/dockerfiles/fedora-i386-cross.docker         | 5 +++++
> >   tests/docker/dockerfiles/python.docker                    | 5 +++++
> >   20 files changed, 100 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
> > index 8dc5e1b5de..981e9bdc7b 100644
> > --- a/tests/docker/dockerfiles/debian-all-test-cross.docker
> > +++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
> > @@ -61,3 +61,8 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
> >   ENV QEMU_CONFIGURE_OPTS --disable-system --disable-docs --disable-tools
> >   ENV DEF_TARGET_LIST aarch64-linux-user,alpha-linux-user,arm-linux-user,hppa-linux-user,i386-linux-user,m68k-linux-user,mips-linux-user,mips64-linux-user,mips64el-linux-user,mipsel-linux-user,ppc-linux-user,ppc64-linux-user,ppc64le-linux-user,riscv64-linux-user,s390x-linux-user,sh4-linux-user,sparc64-linux-user
> > +# As a final step configure the user (if env is defined)
> > +ARG USER
> > +ARG UID
> > +RUN if [ "${USER}" ]; then \
> > +  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
> 
> Is that intended for local image building?
> 
> Personally I only use the image built by gitlab and mount the containers
> with -u $UID -v $HOME/.ccache -v $HOME/source/qemu. Would that still
> keep working, or do I have to map from gitlab user to mine?

The images fetched from gitlab already have this present, as the
current docker.py  adds it to all our containers. So this should
essentially be a no functional change.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
