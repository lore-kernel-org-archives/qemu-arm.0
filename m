Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3140520njc;
        Tue, 19 Nov 2024 01:24:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWNWrKyWqRV9Pml77BocPbEaY+tadByE7f07cNT2i1+QuYlQhfgVaK5yoremSKbvTDX+8OHkMVl5x49/A==@linaro.org
X-Google-Smtp-Source: AGHT+IHJfDNp7N3xa5waGG/5nLc6PwjX1+sRFe+LDr3H6rmpQIhPT7RTZmccRvyvBQU71fGE/ewS
X-Received: by 2002:a05:6214:1bcd:b0:6d4:287d:b8d9 with SMTP id 6a1803df08f44-6d42b8818d9mr43873696d6.2.1732008286336;
        Tue, 19 Nov 2024 01:24:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732008286; cv=none;
        d=google.com; s=arc-20240605;
        b=f0sUZ9saKhGQ0In3vRZb1NNQWeWZg2by4uB1o2WU3vEWUFL9DfEhk+BIiUaWT3ZvPc
         kKlgVD/kYMe7bbHQwofHaEP2Ow9phPDlPTMayaucdJYaVucRvku8sM0tPCVjE3pljZcS
         m/gFEgUMleVs+TavW4Yj/sBMMyqWQozRJVvQ5rQSgc3lUKFYnhSYNpJmQPS0y0yN7KWO
         PvWSc5AvfG26R0FNoyV3VQ/jiti2x2gXGqjLHnSkZ9r9dkeo2hhD46RZzCsWven7Q34X
         BBMXsaKF+pJjTs4d582jL1R6RhhPACxRsIXmyhnMeLNOHk9YCYu8nmnawhOY4OuuolI8
         FxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=C3gwaomAu+tL1E6Bh4HokGA+GddCUiSyw2gVDjjrx+M=;
        fh=WJz52vBu+3z+gNkVlP3Z86wMXoTAqIijq+liUzcSZqA=;
        b=X/4Jq/T/ANldmyul+s5yYX2ZQNgxRrI5NiFJpdZwNa6DNswf3ZJKZC7jja3lhwOcYI
         UScV6XndMtnWref7eAB7zzxWPOfvB9DvqVS+E9kDpErrN9BmiLAePzlSz0bnw0rASihE
         1qkWoz3KgmVoBLk+ynpDstoe5yOt7psUeqF6htlQ9XM280ayFbd92f9yuwCTbYtF2Kam
         ryJfu6jJiM3t2HSSj+rI90FnXdwIttMJ2uaDtc1owZFC2tLh9wgSgEwJKMZbfC14W/SN
         hL52ArV0twzrCcmLsLWTX3QialMwYSxTNSIN80Mgqp2Hk89Mo/+/QieYPW5UhAG+CR9n
         YrXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HvWUpeTo;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d41f9a1262si57922066d6.360.2024.11.19.01.24.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 01:24:46 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HvWUpeTo;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732008286;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=C3gwaomAu+tL1E6Bh4HokGA+GddCUiSyw2gVDjjrx+M=;
	b=HvWUpeToMmhzhUtDWHpoYo0e/Bm6xmfQsQzTacNLM49A93i+kjL88AfIhgToszKHfqAUaK
	nbTjLfYOY8VmBH1e3hIWyNTTKmpM5I7iT0FbiSiDvm6c0KHg54aFTuo0jJJ2kdpY27M22O
	9BSsG5h2fevmz8XcpSMqSp4kjxKFXLg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-672-txZ-ifVkMUuEh5ryLgZP5g-1; Tue,
 19 Nov 2024 04:24:42 -0500
X-MC-Unique: txZ-ifVkMUuEh5ryLgZP5g-1
X-Mimecast-MFC-AGG-ID: txZ-ifVkMUuEh5ryLgZP5g
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7393119541A0;
	Tue, 19 Nov 2024 09:24:40 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.110])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E3C311956086;
	Tue, 19 Nov 2024 09:24:29 +0000 (UTC)
Date: Tue, 19 Nov 2024 09:24:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Melnychenko <andrew@daynix.com>,
	Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
	alex.bennee@linaro.org,
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
Message-ID: <ZzxZRwXAIlMt6SNA@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-5-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118172357.475281-5-pierrick.bouvier@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: vWMseGBA/7fA

On Mon, Nov 18, 2024 at 09:23:54AM -0800, Pierrick Bouvier wrote:
> MacOS and Linux are straightforward, but Windows needs a bit more
> details.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  docs/about/build-platforms.rst   |   4 +-
>  docs/devel/build-environment.rst | 114 +++++++++++++++++++++++++++++++
>  docs/devel/index-build.rst       |   1 +
>  3 files changed, 118 insertions(+), 1 deletion(-)
>  create mode 100644 docs/devel/build-environment.rst
> 
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
> index 6102f00aec0..c1ea53db834 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -29,6 +29,9 @@ The `Repology`_ site is a useful resource to identify
>  currently shipped versions of software in various operating systems,
>  though it does not cover all distros listed below.
>  
> +You can find how to install build dependencies for different systems on the
> +:ref:`setup-build-env` page.
> +
>  Supported host architectures
>  ----------------------------
>  
> @@ -130,7 +133,6 @@ Optional build dependencies
>    cross compilation using ``docker`` or ``podman``, or to use pre-built
>    binaries distributed with QEMU.
>  
> -
>  Windows
>  -------
>  
> diff --git a/docs/devel/build-environment.rst b/docs/devel/build-environment.rst
> new file mode 100644
> index 00000000000..d9a66f5fcc6
> --- /dev/null
> +++ b/docs/devel/build-environment.rst
> @@ -0,0 +1,114 @@
> +
> +.. _setup-build-env:
> +
> +Setup build environment
> +=======================
> +
> +QEMU uses a lot of dependencies on the host system. glib2 is used everywhere in
> +the code base, and most of the other dependencies are optional.
> +
> +We present here simple instructions to enable native builds on most popular
> +systems.
> +
> +You can find additional instructions on `QEMU wiki <https://wiki.qemu.org/>`_:
> +
> +- `Linux <https://wiki.qemu.org/Hosts/Linux>`_
> +- `MacOS <https://wiki.qemu.org/Hosts/Mac>`_
> +- `Windows <https://wiki.qemu.org/Hosts/W32>`_
> +- `BSD <https://wiki.qemu.org/Hosts/BSD>`_


We generally suffer from having information spread over multiple sources,
giving us the burden of keeping the different places consistent, which we
pretty consistently fail at.

It is a good think to add build env docs to qemu.git where we actually
have oversight / review to catch mistakes. If we do this though, IMHO,
we should be deleting the wiki pages and making them into 302 redirects
to our new in-tree docs.

> +
> +Linux
> +-----
> +
> +Fedora
> +++++++
> +
> +::
> +
> +    sudo dnf update && sudo dnf builddep qemu
> +
> +Debian/Ubuntu
> ++++++++++++++
> +
> +You first need to enable `Sources List <https://wiki.debian.org/SourcesList>`_.
> +Then, use apt to install dependencies:
> +
> +::
> +
> +    sudo apt update && sudo apt build-dep qemu
> +
> +MacOS
> +-----
> +
> +You first need to install `Homebrew <https://brew.sh/>`_. Then, use it to
> +install dependencies:
> +
> +::
> +
> +    brew update && brew install $(brew deps --include-build qemu)


The downside in recommending the 'build dep' approach is that it misses
out on deps that have been newly introduced in qemu.git, since whatever
old version of QEMU the distros are shipping.  It also misses deps for
any features the distro vendor has decided to exclude.

Can we put a caveat describing this limitation at the top, so that users
have pointer if things don't quite go the way we expected.

> +
> +Windows
> +-------
> +
> +You first need to install `MSYS2 <https://www.msys2.org/>`_.
> +MSYS2 offers `different environments <https://www.msys2.org/docs/environments/>`_.
> +x86_64 environments are based on GCC, while aarch64 is based on Clang.
> +
> +We recommend to use MINGW64 for windows-x86_64 and CLANGARM64 for windows-aarch64
> +(only available on windows-aarch64 hosts).

Does CLANGARM64 really work with QEMU ?   We go out of our way to actively
block the use of CLang for Windows because of its lack of support for
'gcc_struct' attributes, so I would have expected it to fail

> +
> +Then, you can open a windows shell, and enter msys2 env using:
> +
> +::
> +
> +    c:/msys64/msys2_shell.cmd -defterm -here -no-start -mingw64
> +    # Replace -ucrt64 by -clangarm64 or -ucrt64 for other environments.
> +
> +MSYS2 package manager does not offer a built-in way to install build
> +dependencies. You can start with this list of packages using pacman:
> +

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
