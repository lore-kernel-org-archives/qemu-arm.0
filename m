Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2744386lfq;
        Tue, 1 Mar 2022 08:28:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJEHe6/uweFqsWyL8PFt/lrWS810WtBsW3hJ/bz/yrpaozmHy+/1RqVTtYUDfXwRrbPrTy
X-Received: by 2002:a50:9f8b:0:b0:413:2dbd:8793 with SMTP id c11-20020a509f8b000000b004132dbd8793mr25180407edf.39.1646152120218;
        Tue, 01 Mar 2022 08:28:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646152120; cv=none;
        d=google.com; s=arc-20160816;
        b=CxAed+MUjVxK6K/sXIEmmCbhou46R2DrhTth+Vwj5bJHhRCWBY8ojcG8SEf0DmhLx4
         dJaniONjITnUlOGSgVIR2xlLxvMQdbxwOmgtKgU3551Pm0S3CTh11ZtXQQuGT5X/Gpss
         RZuGhcMRuXzeuQtRmVMPn9PLQWqflTH9gEGxD8xAKgOS39WUO2LUBlf9pYMJ5p9GKl3v
         w1XYvSj8AjWUlKz5CPyh6+gZQ9k/KRbl41VKFxoCAx5/FK0XrTuJ/I71JiUl2OJ1oZ5v
         oxVGm7Kpf0ZoMI2kj9io5FFUiV1ENdZpg4zOan46nwDpQ0nhi5I5ZGzVIK7j16qo2bua
         dOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:user-agent:in-reply-to:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=pjWwgvf8aTavc/p6yP3cyc9HRK8Y5ifOEO3mHfn6LZQ=;
        b=0CE0ZAcgp+Kn2+OvhMOnqrkrRjyIHnsEN7c8c/ypE8SR2CG996x3fBwgBX8cOfoKt9
         XK82jJ++yMpj7cbZP9KCryVYdIWQrxgPMUZXLtcZoxpVyz5qOTnqFdPdcV/d1UYoWpDu
         Bx/ubbnfMmC3gNCs1rXWHLoesIHFlSucc+xTgeLKNHDfpRTkCxigu9wlS1AOXoACY6BL
         4GrgCmgigvZGhb3LsVkHpJ/qRvp8yZy+4qnIQ/NlpI4eIq4mvFOc3ruWluqDvCUxnStP
         m1OOJ98OUE4/4dSYP+kOQo9rHadESbz//KH1lJwkanRGMvp9srfyHfFs2UrS8TKtXmtP
         vNXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c9xgv77e;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bi19-20020a05640221d300b004132ced5365si9899561edb.521.2022.03.01.08.28.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Mar 2022 08:28:40 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c9xgv77e;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646152119;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=pjWwgvf8aTavc/p6yP3cyc9HRK8Y5ifOEO3mHfn6LZQ=;
	b=c9xgv77e/Bozo08kwCZIg/MpVR0wPFaOsY5B62fp5bdrNYZ4HcNITFI7sr7DrxC1Sv1yfO
	6QnUuKT+51ySSGSq385zi+H3hhgbqHrr/S8q/SH/5fvjaCBfWHseaW68A2TGwkMytllwyb
	o1R/dM1jRfiIM74eP3HO+gNkMXsTHzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-_zlMASDNOoibrvPt1A0ONQ-1; Tue, 01 Mar 2022 11:28:32 -0500
X-MC-Unique: _zlMASDNOoibrvPt1A0ONQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34B28180FD73;
	Tue,  1 Mar 2022 16:28:31 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.101])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA7D37A536;
	Tue,  1 Mar 2022 16:28:29 +0000 (UTC)
Date: Tue, 1 Mar 2022 16:28:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
	alex.bennee@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 00/17] target/arm: Implement LVA, LPA, LPA2 features
Message-ID: <Yh5Jqg8oDDfPZ2c9@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
 <CAFEAcA84cFnF9EygS6Xun3VorjeGKf+Lw7zRdkBbcRp6YT_OeQ@mail.gmail.com>
 <CAFEAcA_+70hkNaRhbT=ZT457x+cgD-qSad5QoJY8VAEds5UKeA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_+70hkNaRhbT=ZT457x+cgD-qSad5QoJY8VAEds5UKeA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-TUID: S5TKB5Tn/6mf

On Tue, Mar 01, 2022 at 04:16:25PM +0000, Peter Maydell wrote:
> On Tue, 1 Mar 2022 at 16:08, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Wed, 23 Feb 2022 at 22:31, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> > >
> > > Changes for v3:
> > >   * Update emulation.rst.
> > >   * Split out separate update to ID_AA64MMFR0.
> > >   * Hack for avocado.
> > >
> > > If the avocado hack isn't acceptable, perhaps just drop the
> > > last two patches for now?
> >
> > I think that given that there are Linux kernels out there
> > that won't boot if LPA2 is enabled, we should probably have
> > a -cpu command line option to disable it. Otherwise we might
> > get a bunch of "why did my kernel stop booting" bug reports.
> 
> ...and should using a versioned machine type also default
> -cpu max to not enabling that? Not sure what x86 or other
> precedent is there.

I don't recall us coming across an important scenario where a guest
would fail to boot when we /enable/ a given CPU feature on x86,
requiring us to hide it from -cpu max/host.

Assuming the QEMU/KVM implementation of a CPU feature is correct
per the relevant spec, then artificially hiding it by default from
-cpu max feels questionable, as that penalizes non-buggy guest OS.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
