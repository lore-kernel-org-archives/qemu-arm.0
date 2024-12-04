Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp53623njb;
        Wed, 4 Dec 2024 00:58:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWTkWt3cI+GYX7cf4IlLhA0iEXUoMRonFd1bFEFn1xf8ihUuzCBDjNyUxXLI7P+UiHpEDp
X-Received: by 2002:a05:622a:1b1f:b0:461:304:c676 with SMTP id d75a77b69052e-466c1b067f5mr422146981cf.5.1733302725662;
        Wed, 04 Dec 2024 00:58:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733302725; cv=none;
        d=google.com; s=arc-20240605;
        b=DY/slttEqIewDXGzMfkuA3WQE0GEto6HRYKk53WBqoORM750wXr4hsWETD4pZV02Rq
         rvFo8Cn1ilxZA/arnhyWuQJ6mrkmGlJ3tnf4K+hJDuUn+iI3UoT0eshc0ZSdQZryHamm
         TQRyFM3XksyhvRwjKJ+31tZKaNbtEQMI6sHZSwmGfJm1+NIenQ0lYACguCJasYOTq66S
         Rf1I8zuqXbcsmZ6P0fqq04kPWYIgEHKnOdLyMebiaTpCsEeVnuWo8UBS+Uk9IcoaV+nq
         lGFs3B1AIQDQ0LhRw3/GRy/BfDy+BEYyQaMOrTHtVIXye48SGgmlyHIOsa7L3v1cbGIa
         X72A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=oz0CHp/g7LcfMMxQkjHBEWKwTD70Vh2TEYeJy5vrgOI=;
        fh=89n9M27yhkzw5AGQnj0NZ4W8B5xrLlgPRFycBNE2kxA=;
        b=NN6CZlBgAJSU2swXO041rdng87f0wxcdEEBfaLcFN6Lk3bubkGlxHj3pV0O0Amr/sz
         G7YC96CAwtuAsb3SawkYzV5vnrrK5UXpsyhoIkyNQ0ycFGXjZuax+DvlsnE5oGJb/gX5
         A8hAadgwAZrCKYLX6gQslio0bQLL+1Nnya0gLvx5/dN9DlQr8cQkx9vRwja88Vyt2mLC
         xlBVvRqel5rpsDsDCftdcRVojRB3ZH/muN+FIqF1KfKJpRmXW2SGG+0rtkwuw3+Y5TXJ
         Wn6fVty9V7+6jqdYBrT30zGKsKsTaOzw0yszMtBHlli3MK3B2MEu7jZ2MNhPefzC12tD
         dyLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QPwiCx4K;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b684924721si1643029585a.37.2024.12.04.00.58.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 00:58:45 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QPwiCx4K;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733302725;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oz0CHp/g7LcfMMxQkjHBEWKwTD70Vh2TEYeJy5vrgOI=;
	b=QPwiCx4KUjvULBI+iFjUCBaA3iby3QjQHfu1mxKQ8RsgiwyFycav8BHw1clL/nfpjptY69
	RHJ2BEdHIkre73/AE4EOv7PRMMM+ubdPIaGfp0lgKXAFcYnPF4+kwu4EwVp52+sOa9J3Zx
	bXCnFaphd9Blki9T5ZmrkU9QAA3qifc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-mxoMLOZpMJaiKuXo4z-fsQ-1; Wed,
 04 Dec 2024 03:58:42 -0500
X-MC-Unique: mxoMLOZpMJaiKuXo4z-fsQ-1
X-Mimecast-MFC-AGG-ID: mxoMLOZpMJaiKuXo4z-fsQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BC8A719560A5;
	Wed,  4 Dec 2024 08:58:39 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.92])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 44EE31956089;
	Wed,  4 Dec 2024 08:58:30 +0000 (UTC)
Date: Wed, 4 Dec 2024 08:58:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-devel@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Melnychenko <andrew@daynix.com>,
	Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	manos.pitsidianakis@linaro.org, qemu-block@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
	gustavo.romero@linaro.org
Subject: Re: [PATCH 5/7] docs: add a codebase section
Message-ID: <Z1AZs50I-7oxGhlb@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-6-pierrick.bouvier@linaro.org>
 <CAFEAcA-UkmPvyNW_6o22-WhaLxnnji55UsBp3UcPA-gYH7kvVg@mail.gmail.com>
 <87zflcbs0l.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zflcbs0l.fsf@draig.linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: F9lMURjT2DHL

On Tue, Dec 03, 2024 at 05:22:50PM +0000, Alex Bennée wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > On Mon, 18 Nov 2024 at 17:24, Pierrick Bouvier
> > <pierrick.bouvier@linaro.org> wrote:
> >>
> >> Present the various parts of QEMU and organization of codebase.
> >>
> >> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> >
> > I like this; it's something I've thought for a while would
> > be good to have, but which I never got round to trying to
> > put together. Thanks for doing this!
> >
> > Mostly my comments below are spelling/typo nits and
> > other minor stuff.
> >
> >> ---
> >>  docs/about/emulation.rst               |   2 +
> >>  docs/codebase/index.rst                | 211 +++++++++++++++++++++++++
> >>  docs/devel/decodetree.rst              |   2 +
> >>  docs/devel/ebpf_rss.rst                |   2 +
> >>  docs/devel/index-internals.rst         |   2 +
> >>  docs/devel/migration/main.rst          |   2 +
> >>  docs/devel/qapi-code-gen.rst           |   1 +
> >>  docs/devel/testing/main.rst            |   9 +-
> >>  docs/devel/testing/qtest.rst           |   2 +
> >>  docs/index.rst                         |   3 +
> >>  docs/interop/qemu-ga.rst               |   2 +
> >>  docs/system/qemu-block-drivers.rst.inc |   2 +
> >>  docs/tools/qemu-storage-daemon.rst     |   2 +
> >>  docs/user/main.rst                     |   6 +
> >>  14 files changed, 247 insertions(+), 1 deletion(-)
> >>  create mode 100644 docs/codebase/index.rst
> >>
> <snip>
> >> +  Block devices and `image formats<disk images>` implementation.
> >> +* `bsd-user <https://gitlab.com/qemu-project/qemu/-/tree/master/bsd-user>`_:
> >> +  `BSD User mode<bsd-user-mode>`.
> >> +* build: Where the code built goes!
> >
> > The built code doesn't have to be in 'build'. We could say:
> >
> >  * build: You can tell the QEMU build system to put the built code
> >    anywhere you like. By default it will go into a directory named
> >    ``build``. Sometimes documentation will assume this default
> >    for convenience when describing command lines; you can always
> >    replace it with the path to your build tree.
> >
> > ?
> 
> I always recommend creating a builds directory and having multiple build
> trees under it:

I can understand why you do that, but I'm doubtful the need to have
many parallel build directories is the common case. IOW, I expect
that for the majority of contributors the default single 'build'
directory is sufficient.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
