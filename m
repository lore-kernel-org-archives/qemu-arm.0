Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3188011njc;
        Tue, 19 Nov 2024 03:16:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGj3RrfAS7q0W2GjzUYnaf5G5w9zw15bpERkrC0iBTt1is0hZkb3+Lj+7zBpT/V9lCY4EMj
X-Received: by 2002:a05:6102:358e:b0:4a5:6f41:2132 with SMTP id ada2fe7eead31-4ad62b4d79amr13233144137.14.1732015010558;
        Tue, 19 Nov 2024 03:16:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732015010; cv=none;
        d=google.com; s=arc-20240605;
        b=KpcN0h6Qd04g1S6990pGwD7FgwDEs/BDFc12Ep6+eEmP1dfUmmLdkP8S94FX1Mlp4z
         vrGJly5Ct3Q3eR7dZhKf5K5ZpEW81SAeQrw4vv8ifqyRtwjgeLFxzI2D4MtGHNJF1AVH
         ZFux34LZEsiG7fMtYKkoMCDv9w91UxFBqburAP8icfjbI4QIhTSTsiyngA4Ez8/e2SuU
         u32mniYkmq6VojEdIKJNILtgPg3lNDN7Q5T8Pkfr0w0GloVP4jRGEVN2ih+wjIeyN9r8
         4psqrVjMyomwvLbxOct65Ni+lTPb5OAgEU2KnenRH1AlQrzKOnn2ycHxV6hLem4QYZaE
         jBSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=RlI2dHnTdLwiGWENeaqW5TiYa4TbToOJ94Qr4o13BN4=;
        fh=cYy/2bmwHN7nr1XQs4ggASuHPtteh16MbkpeGVNkEhI=;
        b=bDYLj7fLCIAdsKFK8ooiwLz4ZaDIja+lp+YXHCpkF8r0zcMQvWh2QKY1ShmhW1BTP+
         7OYyWde0JpuKc7xNO4b4iQBjoXezRnvJMUWRXBZyKS09/tP5VdFuYdgzL1M6w848X8uG
         u84fxkTHkqSE3si4UOqx5kf+FrfWocl5uVRQT34ELO079/HoWRCHtv28nq2Q2iNR8apc
         /B8yvj/VjZrwVoz4FD0BsntaDkCJJ0sxnwhDmH5hd66e7SNtuwS4dr+ZZbBrWx8R4td/
         wD5U43+XrkE+iWVwsGy2AfE0BqAbwoBfztDBCZWbfsAKEL1CqdBmKQMmtIcPlZhtNEL6
         5NuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JnTpsSKh;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46392c1eb26si19543851cf.271.2024.11.19.03.16.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 03:16:50 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JnTpsSKh;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732015010;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RlI2dHnTdLwiGWENeaqW5TiYa4TbToOJ94Qr4o13BN4=;
	b=JnTpsSKhjPWhZ0wcCoWlsMqfT/TqOIFxG+OcXxXYLXx1JoEVmhT9djLHx2b4JS9pJeE6o4
	PMW5I+HsaIL5Bp7nzTVh8Dli90hBBvALWYxVd/VNVY52pK7pKkjA1inQxp8WWKBGN7I8h6
	pLy4QXtjJHtHfjtHz6l6dheGpH7y+7A=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-32y2_H6sOzCj-eLwpvLJRw-1; Tue,
 19 Nov 2024 06:16:46 -0500
X-MC-Unique: 32y2_H6sOzCj-eLwpvLJRw-1
X-Mimecast-MFC-AGG-ID: 32y2_H6sOzCj-eLwpvLJRw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 67BFE1956048;
	Tue, 19 Nov 2024 11:16:44 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.110])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8ABDB1955F40;
	Tue, 19 Nov 2024 11:16:37 +0000 (UTC)
Date: Tue, 19 Nov 2024 11:16:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org,
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
	gustavo.romero@linaro.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 4/7] docs/devel: add information on how to setup build
 environments
Message-ID: <ZzxzkiKX5-qQS_iU@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-5-pierrick.bouvier@linaro.org>
 <ZzxZRwXAIlMt6SNA@redhat.com>
 <87mshvqy5f.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mshvqy5f.fsf@draig.linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: VfzpmETYkbzO

On Tue, Nov 19, 2024 at 11:08:12AM +0000, Alex Bennée wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Mon, Nov 18, 2024 at 09:23:54AM -0800, Pierrick Bouvier wrote:
> >> MacOS and Linux are straightforward, but Windows needs a bit more
> >> details.
> >> 
> >> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> >> ---
> >>  docs/about/build-platforms.rst   |   4 +-
> >>  docs/devel/build-environment.rst | 114 +++++++++++++++++++++++++++++++
> >>  docs/devel/index-build.rst       |   1 +
> >>  3 files changed, 118 insertions(+), 1 deletion(-)
> >>  create mode 100644 docs/devel/build-environment.rst
> >> 
> <snip>
> >> +Fedora
> >> +++++++
> >> +
> >> +::
> >> +
> >> +    sudo dnf update && sudo dnf builddep qemu
> >> +
> >> +Debian/Ubuntu
> >> ++++++++++++++
> >> +
> >> +You first need to enable `Sources List <https://wiki.debian.org/SourcesList>`_.
> >> +Then, use apt to install dependencies:
> >> +
> >> +::
> >> +
> >> +    sudo apt update && sudo apt build-dep qemu
> >> +
> >> +MacOS
> >> +-----
> >> +
> >> +You first need to install `Homebrew <https://brew.sh/>`_. Then, use it to
> >> +install dependencies:
> >> +
> >> +::
> >> +
> >> +    brew update && brew install $(brew deps --include-build qemu)
> >
> >
> > The downside in recommending the 'build dep' approach is that it misses
> > out on deps that have been newly introduced in qemu.git, since whatever
> > old version of QEMU the distros are shipping.  It also misses deps for
> > any features the distro vendor has decided to exclude.
> >
> > Can we put a caveat describing this limitation at the top, so that users
> > have pointer if things don't quite go the way we expected.
> 
> At a recent QEMU workshop I presented I pointed to lcitool as a way to
> list the minimal dependencies QEMU needs:
> 
>   ./tests/lcitool/libvirt-ci/bin/lcitool variables -f yaml debian-12 ./tests/lcitool/projects/qemu-minimal.yml
> 
> It wouldn't be the hardest thing to extend lcitool to generate a pkg
> install line instead of a list. Although I notice it fails with the full
> set of dependancies:
> 
>   ✗  ./tests/lcitool/libvirt-ci/bin/lcitool -d tests/lcitool variables -f shell debian-12 ./tests/lcitool/projects/qemu.yml
>   Package generic name resolution error: Package libcbor not present in mappings

I think your libvirt-ci git submodule might be out of date. The current
generated Dockerfiles include libcbor and its in the mappings.

> I note there is already an "install" action but I'm wary of what it does.

That's related to lcitool functionality for provisioning VMs - kinda like
QEMUs tests/vm/ stuff.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
