Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp2816155ejb;
        Tue, 30 Apr 2024 02:45:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWyj95ccZD5eJlbXiO3oMajN52GAImqX/7EZexFL2WjXf+bopxJF5i2dY2qi6h+XVpNFJ9pTnE5zKGNLHK9h8bV9uLrbSZQ
X-Google-Smtp-Source: AGHT+IHU8vnYhqbWynGi1PUXWoHoA4SAa/7Lad+i05o6OoU6V4Ot66QTmejtcSbIKZOl9cKvuVeT
X-Received: by 2002:ac8:5807:0:b0:43a:c9de:3509 with SMTP id g7-20020ac85807000000b0043ac9de3509mr8632900qtg.60.1714470348968;
        Tue, 30 Apr 2024 02:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714470348; cv=none;
        d=google.com; s=arc-20160816;
        b=lDFftZ/NNjDr5rW99OGO3qlsYF5AjVmyE2/npkroJf5/vLXzpuX65brJx6z4lAc2hg
         CXIGxsul9ou5UcAkHqwt1N7wQbi40OE/9WslKVNzL42SKDHEfSMh3dFN82s4AlmL5opT
         +rArCDkqbIGE72wAlHN+1DqQQPqIS3TNf7FXBBy4Sxhn6NiOMn8rEPBlJaSYCo/BedVy
         9V8IpU5hK8a/O8KYRxHrBleMBSaZGl58v/LU+CKflNzdi4G2Dvn8QQUuXfxjBzdIfNXV
         0tanFe6tCLd3KrtbbHLbSUrxGajH1Kv46Px2LY4QGjzIExTDm7LLsE2IPAJo1yXwjGak
         /p1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=pfCsWb/zmNYlBQiIioOGwzePlc1xWrUHDqv72TBkkAM=;
        fh=kZPypYlo8KnTPo+YK6MuaW3fuUhwrYMOQYaAiRshy4I=;
        b=psdEeafyiw8HpTesQA+gc5w2lNaQiT5bSaMghe2tIQlno88UMArqrv6sFnexxqVPwa
         03Heal4Gkb3cvAQJR4qNupGGU7QGgz0GQvrSnKnQHd0Kt/yLZ6rodpVUhsCbyuKIDmMg
         s4LOptVKCva0Ocz6h6Qf9kiXtAwyF0HAy/zzeKP64O1iwXo7sTZ9rIbkvWIllJRCZ2xX
         iupqNa7BKLfhvDw8peEolRj/iqrsxu6qQ7yDJQ3cL2v1J6i4jC/aprLkKQhwP/yj9Ph+
         yGCp9l+CUtrZ/YBs2sFMudxznpnAdtnS5pEoagq0h4Fu2moTtfVEldaOB2NHBrzFK0zm
         5d9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SDpoYR2J;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id eh25-20020a05622a579900b00431819d4ebfsi19963059qtb.521.2024.04.30.02.45.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 02:45:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SDpoYR2J;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714470348;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=pfCsWb/zmNYlBQiIioOGwzePlc1xWrUHDqv72TBkkAM=;
	b=SDpoYR2JIq0G5gQVdBDv0bB9GXm4624dAcjPo4aLJ404wd2Ja2rkI1NrGw55c65VnEuRPT
	mkvB+GiIkK5Qy/LYqB3Wff+eTehvX1wZZA2XwJua7M36zIkneEqR96npGxFlzvTpiP5WfC
	Eka50GVfm3WBK6hNfj8I15jY4kOf5MU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-19-si34PYgmOFKsNlGUNRmtKw-1; Tue,
 30 Apr 2024 05:45:45 -0400
X-MC-Unique: si34PYgmOFKsNlGUNRmtKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 811E41C29EA0;
	Tue, 30 Apr 2024 09:45:43 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.59])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0FC31C060D0;
	Tue, 30 Apr 2024 09:45:41 +0000 (UTC)
Date: Tue, 30 Apr 2024 10:45:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	devel@lists.libvirt.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH] docs/about: Automatically deprecate versioned machine
 types older than 6 years
Message-ID: <ZjC9w0A_VQlsY46p@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240430064529.411699-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430064529.411699-1-thuth@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-TUID: uETO77T1RW2s

On Tue, Apr 30, 2024 at 08:45:29AM +0200, Thomas Huth wrote:
> Old machine types often have bugs or work-arounds that affect our
> possibilities to move forward with the QEMU code base (see for example
> https://gitlab.com/qemu-project/qemu/-/issues/2213 for a bug that likely
> cannot be fixed without breaking live migration with old machine types,
> or https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg04516.html or
> commit ea985d235b86). So instead of going through the process of manually
> deprecating old machine types again and again, let's rather add an entry
> that can stay, which declares that machine types older than 6 years are
> considered as deprecated automatically. Six years should be sufficient to
> support the release cycles of most Linux distributions.

If anyone thinks 6 years is not very long, consider that this implies
QEMU will be maintaining *18* versions for each versioned machine type.

So across aarch64 'virt', x86 'pc' & 'q35', ppc 'spapr', s390x 'ccw',
and m68k 'virt', that's upto 108 machines we're keeping ABI preserved
for in the worst case...

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 6d595de3b6..fe69e2d44c 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -220,6 +220,17 @@ is a chance the code will bitrot without anyone noticing.
>  System emulator machines
>  ------------------------
>  
> +Versioned machine types older than 6 years
> +''''''''''''''''''''''''''''''''''''''''''
> +
> +Starting with the release of QEMU 10.0, versioned machine types older than
> +6 years will automatically be considered as deprecated and might be due to

How about:

  s/6 years/6 years (equivalent to 18 releases)/

Also

  s/as deprecated/deprecated/
  s/due to/liable for/

> +removal without furthor notice. For example, this affects machine types like
> +pc-i440fx-X.Y, pc-q35-X.Y, pseries-X.Y, s390-ccw-virtio-X.Y or virt-X.Y where
> +X is the major number and Y is the minor number of the old QEMU version.
> +If you are still using machine types from QEMU versions older than 6 years,

Again

  s/6 years/6 years (equivalent to 18 releases)/


> +please update your setting to use a newer versioned machine type instead.

s/setting/configuration/

> +
>  Arm ``virt`` machine ``dtb-kaslr-seed`` property (since 7.1)
>  ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
