Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp811054njc;
        Fri, 9 Aug 2024 02:59:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWPrgjRA0oCv6ywqT2d0bZEu4g7uRdOgv24quiIaAFbmVOFch/jbUaCGKLz+P9nDz5F4Qvm0iOPCSAQzgnXTEkfZgrcbxZg
X-Google-Smtp-Source: AGHT+IGsgq5iF3IJtWgb9t18jEjeZCdmomLJR7EkmBPniGAPgG8nPH/m9fnlemTm3eKujN3Ui3FF
X-Received: by 2002:a05:6214:4a82:b0:6b5:fa20:9b3d with SMTP id 6a1803df08f44-6bd78e58db9mr12689586d6.46.1723197599547;
        Fri, 09 Aug 2024 02:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723197599; cv=none;
        d=google.com; s=arc-20160816;
        b=WCulGRebvubb7BUnpT4zHPSNdioVvgdzLRv7WwPKP3LXwp2uKEX3ACQ2Zv9BvRmsBZ
         WNuv1O/w2waeT1dLnASTgFkde+ZssXfWXwhy/JEUidXzbxXvsoZVHYp6C5ZznwZpLhqE
         JuwqOLHO7JcWclthjsjkDc9fmozYoWrZpbkZMp2IPoq6i1Wp5c1ghJhC545spqm3TyOB
         cJYatdEEGYTD7y166jb9at89fy41WPlf5VqWHgJ8VjRcrhG2dnLwWx+y7CO+hqraNBaJ
         viM/DvyrKfyEuI7IQB+ANS5SLsJKh/taqe/QcIjYdVete8arlBFIKvWvyIReAtaWtPJk
         1xzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=408B7Rgl2doHbjup/9Fd6YOYEhE0YB1FzGa1vPpC/UQ=;
        fh=b560sH9blYEj47xotWOuKCmgnyeLLSwipw30AIgNP9Q=;
        b=A6asLYV2dY8FsK8zgHcoqMDxQ9PbSmDYKvv5QzbsxNtJzObCnunv377Iw6fXSHzMIR
         Zb4IIFkCCwPh4Asg8hlPPSw6Jkc1x/18xAtXdBj5p8swoUyyep8lkfte2BGUEWCc6Dzn
         DUZmmmo1GguGd3AMSbOHDIWAUhxLteZ2bCZZ4QhjLCpP/VX+vUSdgaQ2iny2tceaZGyr
         S03i9j5kHiC0Oywoe9darTr/os+Hg5Y1Ga44aXzuHA3l4Qair4lg3i57eltUCXX4BDQc
         c3iuMFxBBQ9mMwOBbfpozpU4dV/yak4UADTMqV9sd9XawkJWgCjs2C8mlxoL8rc37p01
         MQtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WdTTPUw/";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb8edab2si66095636d6.326.2024.08.09.02.59.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 02:59:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WdTTPUw/";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723197599;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=408B7Rgl2doHbjup/9Fd6YOYEhE0YB1FzGa1vPpC/UQ=;
	b=WdTTPUw/kBvQM3g21J8rVSCPkTWAoD5gPAr/EedoWzECpsJEvkntxInnkA3YyFqWOgAyTN
	swzlrKqwtGra8b0q/BaZCkIcw2vvO6JqLGbAac5d75Lvp5FObylgDAbbmxx/1M4iOZZAkf
	0aHG3FE28oYz/GahxCkh+dBF5T5/BOk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-265-wa1lcUNjMRGQUSYK-MkcKw-1; Fri,
 09 Aug 2024 05:59:56 -0400
X-MC-Unique: wa1lcUNjMRGQUSYK-MkcKw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 424381944B29;
	Fri,  9 Aug 2024 09:59:54 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.27])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3332419560A3;
	Fri,  9 Aug 2024 09:59:48 +0000 (UTC)
Date: Fri, 9 Aug 2024 10:59:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Octavian Purdila <tavip@google.com>, John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com,
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org,
	marcandre.lureau@redhat.com, alistair@alistair23.me,
	crosa@redhat.com, bleal@redhat.com
Subject: Re: [RFC PATCH 03/23] scripts: add script to generate C header files
 from SVD XML files
Message-ID: <ZrXokj7du0YgRHpz@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240805201719.2345596-1-tavip@google.com>
 <20240805201719.2345596-4-tavip@google.com>
 <CAFn=p-abeXP+dUtp_gwH3dcD5DT-sTAFg=udVugrzcU1r8fXpA@mail.gmail.com>
 <CAGWr4cQL_LMWmEUdoPprRSp2k=CkQ0UJp5Q45qbAtUvvE6fDHg@mail.gmail.com>
 <9080f7e5-a40d-4cbd-a734-74578dd27894@linaro.org>
 <CABgObfY1hGKhBjwjDeKSSd5uxbe8Lc5=hVL6psB0NLbnX1bJ0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgObfY1hGKhBjwjDeKSSd5uxbe8Lc5=hVL6psB0NLbnX1bJ0g@mail.gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: YSgo08xPPKod

On Fri, Aug 09, 2024 at 11:42:38AM +0200, Paolo Bonzini wrote:
> On Fri, Aug 9, 2024 at 11:30 AM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
> >
> > On 9/8/24 00:30, Octavian Purdila wrote:
> > > On Thu, Aug 8, 2024 at 2:56 PM John Snow <jsnow@redhat.com> wrote:
> >
> >
> > >>> diff --git a/configure b/configure
> > >>> index 5ad1674ca5..811bfa5d54 100755
> > >>> --- a/configure
> > >>> +++ b/configure
> > >>> @@ -956,7 +956,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
> > >>>   # Finish preparing the virtual environment using vendored .whl files
> > >>>
> > >>>   $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
> > >>> -     ${source_path}/pythondeps.toml meson || exit 1
> > >>> +     ${source_path}/pythondeps.toml meson svd-gen-header || exit 1
> > >>
> > >
> > > Hi John,
> > >
> > > Thanks for reviewing!
> > >
> > >>
> > >> I haven't read the rest of this series; I'm chiming in solely from the build/python maintainer angle. Do we *always* need pysvd, no matter how QEMU was configured? Adding it to the meson line here is a very big hammer.
> > >>
> > >
> > > I think the minimum we can do is to install it only if CONFIG_ARM is
> > > enabled. That might change in the future if the models we create with
> > > pysvd are enabled for other architectures.
> >
> > Similarly on how we manage libfdt, you can have meson defines
> > SVDGEN as:
> >
> >    config_host_data.set('CONFIG_SVDGEN', svd_gen_header.found())
> >
> > Then declare SVDGEN in Kconfig.host, and finally use in the Kconfigs:
> 
> That would force people to install pysvd on the host, which is a pity
> for such a small and little-known library.  We have used submodules
> in the past for much larger and common dependencies, for example
> capstone.

As mentioned elsewhere in thsi threads, IMHO we shoud not be running
this generator during the build at all. It should be run once to
create the headers needed for a particular device & the output committed
to QEMU. There after any changes to the header (if any) need reviewing
to ensure they don't imply an impact on guest ABI. This avoids having
the 8.6 MB XML file in QEMU git too, as well as the pysvd dep on the
host. Only the very rare times when we create a new device would need
to have the pysvd code & XML.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
