Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3142641njc;
        Tue, 19 Nov 2024 01:30:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU6ZlZNMsAQmA2lNaBpCWUvYMRrvYUVl+5M9n8+rB7lQT3gyPuEbmutSP0RrjcY0g0sobKwwXzPysBAhA==@linaro.org
X-Google-Smtp-Source: AGHT+IGOd6ccOL8uG8l4FuIk3keYLWr/0fjfqjhJLYuT/uFNzmOA4VhPMu5qEY0U3GqdJVBqd8kr
X-Received: by 2002:a05:622a:6186:b0:462:b7c9:10e with SMTP id d75a77b69052e-46392d8853cmr45563221cf.13.1732008627103;
        Tue, 19 Nov 2024 01:30:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732008627; cv=none;
        d=google.com; s=arc-20240605;
        b=CJm1MJX7wLn1JNYc5H664piYHDu10qCJq7B3azbmAtPo4HpYqzwTI2+Y637RJSdPoy
         gaCrJG85bTcJAhMUImqaTuOeTKdoDKAUAQLS3++d8quu/cXfzNAx/ZZeOp11XrhX1lUh
         5oIfQZIOHLW23MwLI+uOi8lRJWzzzNIdcJ9VCfXvuxsZIrBTO3UdDs8wS8GbRqDeXHM0
         K+pAu7Od8FMWK4mVTtz+vmNNItJWFGT0D4vvgPKVoPbitQCt7C7Zge2nHhh2sT9+m18F
         gFyBav7e0BreAy1Li/lFrlznZZOFVqA6laJnqH6DkTKzva2I1KXd3vNar/QmVIankjWL
         UXbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=pbrFuRvlSoBrax+dNrdrJ+i1Nm/UCsWKgPqZajRJrd0=;
        fh=WJz52vBu+3z+gNkVlP3Z86wMXoTAqIijq+liUzcSZqA=;
        b=ai2RbvFuNHJFx15axPBaYDfJmfHiz3/w1UeNagHzltq7qdPE4d2s5mIGJxOmOqgLoz
         4sDxWlI7q/zB6KfsZLzkbAbz13aJGJVcR8ioyr2EU0dP9sOFHGtU571JUPSGNj9ZAuEa
         +UYabLblR1dwwVUJo7z7ZMaoG/DifyWyHakQ/x+6dWS6QvtsaCCrXIuctswN09qNR29c
         Vr2HjRlyzWcumYw2K2qVc7vWSzOApvQlYKTE3D79qVztrkKPCt6K9oEgYEeq+mF0w2lu
         TksTSbz9yHxmg5elhEbFkvwR4Pz+IH9tZwsJJQSvu+BpQX4aeoxTKBYDz/hSKdS5I4uK
         eORA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OxgASJas;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46392baf6d0si20088681cf.209.2024.11.19.01.30.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 01:30:27 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OxgASJas;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732008626;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=pbrFuRvlSoBrax+dNrdrJ+i1Nm/UCsWKgPqZajRJrd0=;
	b=OxgASJaseM4AjzJxoss9Xaz3/wD5Cs9OjUnjfoYBrwqYPYxU8CHmSmsD85G3U+KGrn6Z/5
	grdWcFMJ9+4ub/wuwlhG/pk8J+bgGlnNVQVNARRvL1+u3OjUqgSEbW3XrZx/c6x/ZP45KK
	juQ8kgQ7IZYKt6AzZC+el2jpmvxf7QY=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-P4sedATyOqGyw-LItvtS2A-1; Tue,
 19 Nov 2024 04:30:21 -0500
X-MC-Unique: P4sedATyOqGyw-LItvtS2A-1
X-Mimecast-MFC-AGG-ID: P4sedATyOqGyw-LItvtS2A
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F34319540F0;
	Tue, 19 Nov 2024 09:30:19 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.110])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 344341956054;
	Tue, 19 Nov 2024 09:30:00 +0000 (UTC)
Date: Tue, 19 Nov 2024 09:29:52 +0000
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
Subject: Re: [PATCH 7/7] docs: add a how to section
Message-ID: <ZzxakHNsVA9cKIyA@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-8-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118172357.475281-8-pierrick.bouvier@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: gneLKMtw4YNY

On Mon, Nov 18, 2024 at 09:23:57AM -0800, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  docs/devel/build-system.rst |   2 +
>  docs/how-to/index.rst       | 146 ++++++++++++++++++++++++++++++++++++
>  docs/index.rst              |   1 +
>  3 files changed, 149 insertions(+)
>  create mode 100644 docs/how-to/index.rst
> 
> diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
> index d42045a2325..db444787e37 100644
> --- a/docs/devel/build-system.rst
> +++ b/docs/devel/build-system.rst
> @@ -1,3 +1,5 @@
> +.. _build:
> +
>  ==================================
>  The QEMU build system architecture
>  ==================================
> diff --git a/docs/how-to/index.rst b/docs/how-to/index.rst
> new file mode 100644
> index 00000000000..3a9d4d777df
> --- /dev/null
> +++ b/docs/how-to/index.rst
> @@ -0,0 +1,146 @@
> +.. _how-to:
> +
> +------
> +How to
> +------
> +
> +This section of the manual will give you some commands to do various tasks with
> +QEMU. It does not intend to be complete, but to be simple.
> +
> +Build
> +-----
> +
> +First you need setup your `build environment <setup-build-env>`.
> +
> +Then, you can build QEMU using:
> +
> +::
> +
> +    git clone https://gitlab.com/qemu-project/qemu
> +    cd qemu
> +    ./configure
> +    ninja -C build
> +    # all binaries are in ./build
> +
> +By default, QEMU build is optimized. You may want to switch to debug builds
> +instead (non optimized, and with more runtime checks enabled):
> +
> +::
> +
> +    ./configure --enable-debug
> +
> +It's recommended to use sanitizers to catch issues when developing your change.
> +
> +::
> +
> +    ./configure --enable-asan --enable-ubsan
> +    # Of course, you can combine debug and sanitizers if needed
> +
> +You can find more information on `build page <build>`.
> +
> +Test
> +----
> +
> +QEMU has a lot of tests, mainly in 4 categories:
> +
> +::
> +
> +    # run tests related to TCG. They are based on Makefiles.
> +    make check-tcg
> +    # run system tests, running a full VM, with avocado framework
> +    make check-avocado
> +    # run functional tests, running a full VM, integrated with Meson
> +    make check-functional
> +    # run all other tests, integrated with Meson
> +    make check
> +
> +You can find more information on `testing page<testing>`.
> +
> +Use QEMU
> +--------
> +
> +To create a 20 gigabytes disk image usable with qemu-system:
> +
> +::
> +
> +    qemu-img create system.img 20g
> +
> +To run an x86_64 system emulated, with 4 cpus, 8G of memory and an install iso:
> +
> +::
> +
> +    qemu-system-x86_64 -smp 4 -m 8G system.img -cdrom install.iso
> +
> +To boot directly a Linux Kernel:
> +
> +::
> +
> +    qemu-system-x86_64 -kernel bzImage -hda system.img -append "root=/dev/hda"
> +
> +To boot an aarch64 system emulated, you need to specify a UEFI and associated
> +pflash. Once started, you can switch to Serial output by clicking on View ->
> +Serial0.
> +
> +::
> +
> +    # UEFI can be obtained from debian package qemu-efi-aarch64.
> +    # First, we need to copy a file to save UEFI variables:
> +    # cp /usr/share/AAVMF/AAVMF_VARS.fd .
> +    qemu-system-aarch64 \
> +        -m 8G \
> +        -smp 4 \
> +        -M virt \
> +        -cpu max \
> +        -device virtio-blk-pci,drive=root \
> +        -drive if=none,id=root,file=system.img \
> +        -drive if=pflash,readonly=on,file=/usr/share/AAVMF/AAVMF_CODE.fd \
> +        -drive if=pflash,file=AAVMF_VARS.fd \
> +        -cdrom install.iso
> +
> +To run git using QEMU user-mode:
> +
> +::
> +
> +    qemu-x86_64 /usr/bin/git --version
> +
> +Contribute
> +----------
> +
> +We recommend using `git-publish <https://github.com/stefanha/git-publish>`_ for
> +contributing. You need to configure `git send-email
> +<https://git-send-email.io/>`_ first.
> +
> +::
> +
> +    git checkout -b my_feature
> +    ... # edit, build, test
> +    # When ready to send the series...
> +
> +    # Add upstream QEMU repo as a remote.
> +    git remote add upstream https://gitlab.com/qemu-project/qemu
> +    # Fetch all new content.
> +    git fetch -a upstream
> +
> +    # Rebase your branch on top of upstream master, and include a signoff.
> +    git rebase -i upstream/master --signoff
> +    # Check your patches are correct.
> +    ./scripts/checkpatch.pl $(git merge-base upstream/master HEAD)..HEAD
> +
> +    # Send your series, you'll be given a chance to edit cover letter for it.
> +    git-publish
> +
> +    # After review, and other changes, you can send a v2 simply by using:
> +    git-publish
> +
> +If you need to apply locally an existing series, you can use `b4
> +<https://github.com/mricon/b4>`_ (installable via pip) to retrieve it:
> +
> +::
> +
> +    b4 shazam <series_msg_id>
> +    # message id is an identifier present in email sent.
> +    # when using patchwork, it is the last part of a series url (2024...):
> +    # https://patchew.org/QEMU/20241118021820.4928-1-joel@jms.id.au/
> +
> +More complete information is available on our `Submit a patch page
> +<submitting-a-patch>`.

I'm far from convinced any of the above content is a good idea, given
it is duplicating stuff we've already got elsewhere in our manual.
This gives us the extra burden of ensuring different parts of the
manual are consistent in what they're recommending which is something
we are historically bad at doing.

I think there is scope for having a "how-tos" section, but this particular
choices of examples are not the best place to kick it off with IMHO. Also,
for the sake of scalability, I'd suggest that each "how to" is a standalone
file in the how-tos/ sub-directory, otherwise the index.rst will quickly
become enourmous.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
