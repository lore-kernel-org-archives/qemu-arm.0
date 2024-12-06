Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp781177njb;
        Fri, 6 Dec 2024 03:46:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUceKS2E6UoRkh0WwSaG2766RTmMKBPoOZRGd08tB9ERhinNMBF1oYJpUesR9ZaZNGNL4Dk4dhVWc6JrQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGS0fLDzD8sdzT3o9oAVZiVP8Ken8oJAK06nThGTE8m1dArjzAniv+QJE1Mzg2dCkMHreFR
X-Received: by 2002:a05:6102:316e:b0:4af:4902:1599 with SMTP id ada2fe7eead31-4afcaaecf40mr2966330137.21.1733485575489;
        Fri, 06 Dec 2024 03:46:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733485575; cv=none;
        d=google.com; s=arc-20240605;
        b=et08f+KDFXWGVk0yZXm2DfCrP5nxxw952O9Ln4nJR75v0CCtme2+Px6AJydtBHSwb0
         tt0yE6+RV+3ZTttvgIxTWkib/HGoMYIzct5Z9ZI+hX/lVcxu5X/tM7U1K1P2QlVVcahC
         2Wt9B1Rhxoe4l+vyZJjRHBcgWpYTR/cUBPj0YioaLihsYv3MnVyhTkGu9DW/NdndyAFo
         szC6YOrw8iklfLgnLgeX69v2EH1ESlabSmFFbFyP5LQaTsGLigDMCQB9zfCiZcxEfAmG
         vnvXyQWmrR3Y5qhNllPxkUw9DSGMdOttySKn9N/D1BeWpHKXSWrAQHl7gLWjGicOiasK
         LyDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=KBwOpemEBqlNmPB2lZ+/51jaUp+413L5fMNmznOJi1A=;
        fh=K4h7MvRDw0IPZW3lDo29HehuprbNYnBwfakYiRP7UPM=;
        b=Ox0F4XjNzECBkMTUY+1nHug58UM5FuLq73+vQIwwa4eY2UU/GopyfC2h5uUMA++Krm
         iCGpqxU1efo0DyQvEAXo+RS40Jm5LnTOjEvFdNd/sNXoRt8PpKsIkm6wwurq0L/HaXPY
         rjEo9H3M9nNSLyl8BcKB1jhehThqsV0+83cL8O/66Q4YSx2YkUn8dNGz8rfWAH+O339D
         29jhjf8Rc8sl+LU1q0KDXXney5PP8oUQOOeaAFkgF2YeLk3Stw8WD9M6KFn46t7QpflF
         NUBvQ/zlAELBjYf920cGa06wVWJqLlA613wc2xsmzsS+5WUeOeUarqvogLsk+1y6rpdR
         4J7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SQ+U9F0z;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5aaafc2si437810185a.476.2024.12.06.03.46.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:46:15 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SQ+U9F0z;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733485575;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KBwOpemEBqlNmPB2lZ+/51jaUp+413L5fMNmznOJi1A=;
	b=SQ+U9F0ziYDjWeTDHhVd36IpqUHpOrVoD/rNwIRNU7gYQtrJiCDauM5QAQJDk3Kh0HGVkZ
	IAgnl8jhGjHtNpkacmuCYM27U9gzE9uurKxleOLhSahFGRBRPw+t5++PFokG6x4sUNsSYb
	YvM7+xaOCgYAHrA2UqI1wzdB9vGYgI4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-rpDeA9GNNdS-8Wbm2CdB3g-1; Fri,
 06 Dec 2024 06:46:13 -0500
X-MC-Unique: rpDeA9GNNdS-8Wbm2CdB3g-1
X-Mimecast-MFC-AGG-ID: rpDeA9GNNdS-8Wbm2CdB3g
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ADCCE1955F40;
	Fri,  6 Dec 2024 11:46:10 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.160])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 40495300019E;
	Fri,  6 Dec 2024 11:46:02 +0000 (UTC)
Date: Fri, 6 Dec 2024 11:45:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org,
	Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	gustavo.romero@linaro.org, Andrew Melnychenko <andrew@daynix.com>,
	qemu-arm@nongnu.org, alex.bennee@linaro.org,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Jason Wang <jasowang@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	manos.pitsidianakis@linaro.org, qemu-block@nongnu.org
Subject: Re: [PATCH v2 2/6] docs/devel: add git-publish for patch submitting
Message-ID: <Z1Lj9oZvv1FIqRj5@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241205222241.3789437-1-pierrick.bouvier@linaro.org>
 <20241205222241.3789437-3-pierrick.bouvier@linaro.org>
 <Z1LgpKB_J4Df4wcE@redhat.com>
 <CAFEAcA-WadSi-U+Q9MFY_+vhNimJ1HpCcSZE7aVz3PRKuwc+ew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-WadSi-U+Q9MFY_+vhNimJ1HpCcSZE7aVz3PRKuwc+ew@mail.gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: o32aLj4wn2pB

On Fri, Dec 06, 2024 at 11:43:11AM +0000, Peter Maydell wrote:
> On Fri, 6 Dec 2024 at 11:32, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Dec 05, 2024 at 02:22:37PM -0800, Pierrick Bouvier wrote:
> > > Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> > > ---
> > >  docs/devel/submitting-a-patch.rst | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
> > > index 03b2ac298aa..f8b7fc59544 100644
> > > --- a/docs/devel/submitting-a-patch.rst
> > > +++ b/docs/devel/submitting-a-patch.rst
> > > @@ -235,6 +235,25 @@ to another list.) ``git send-email`` (`step-by-step setup guide
> > >  works best for delivering the patch without mangling it, but
> > >  attachments can be used as a last resort on a first-time submission.
> > >
> > > +.. _use_git_publish:
> > > +
> > > +Use git-publish
> > > +~~~~~~~~~~~~~~~
> > > +
> > > +If you already configured git send-email, you can simply use `git-publish
> > > +<https://github.com/stefanha/git-publish>`__ to send series.
> > > +
> > > +::
> > > +
> > > +    $ git checkout master -b my-feature
> > > +    $ # work on new commits, add your 'Signed-off-by' lines to each
> > > +    $ git publish
> > > +    $ ... more work, rebase on master, ...
> > > +    $ git publish # will send a v2
> > > +
> > > +Each time you post a series, git-publish will create a local tag with the format
> > > +``<branchname>-v<version>`` to record the patch series.
> >
> > Lets also mention
> >
> >   "When sending patch emails, 'git publish' will consult the output
> >    of 'scripts/get_maintainers.pl' and automatically CC anyone listed
> >    as maintainers of the affected code. Generally you should accept the
> >    suggested CC list, but there may sometimes be scenarios where it is
> >    appropriate to cut it down (eg on certain large tree-wide cleanups),
> >    or augment it with other interested people"
> >
> > Second, lets say something about pull requests
> >
> >   "When a subsystem maintainer is ready to send a pull request, the
> >    'git publish --pull' command will triggering GPG tag signing,
> >    publish the branch to the git remote name specified by the
> >    'remote.pushDefault' config option, and send the email series'
> 
> We don't do pull requests for the normal "end developer submits
> a patch" process, and given the prevalence of the github/gitlab
> "all contributions go in as pull requests" model, I think that
> talking about pull requests here (except to say "we don't do them")
> would be confusing. If we want to document how you can use git publish
> for pull request submission we can do that in
> docs/devel/submitting-a-pull-request.rst.

Ah yes, I agree with that.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
