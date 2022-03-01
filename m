Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp8200lfo;
        Tue, 1 Mar 2022 08:47:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxS6UGQz6LErl/mBEHrgMrPuFL682ND3HYMVTL0dc8JdgfXPCd702LdDKpk9NJMQqdqaBtZ
X-Received: by 2002:a37:b443:0:b0:649:1d8f:cc37 with SMTP id d64-20020a37b443000000b006491d8fcc37mr14184848qkf.539.1646153241289;
        Tue, 01 Mar 2022 08:47:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646153241; cv=none;
        d=google.com; s=arc-20160816;
        b=gHsw75Hmb9cWgA0j08bmqmHuQK8oEQZOJDlshc57iTmLbcrvsgxGV7URFoLyUd1/i8
         OtUNQuZVjyoYm95fqkXZKJDg7Vjs++6c0K0J2venZDqgRJFI0bxiww/KXFJOQm+la7Ch
         Ryw9I3hxKLzaZ2A7NpaXb9KLgv1kGod9PoC0WduZvO+t60BStEEYifUNWA7W4wiG1EG3
         LAG/AnoA/qKiZRG0fwUyglxwMUKzmJsXDoyvyi6T1R3WhigKnryb22479T8FIx0sU9/P
         4aM+asr2yjVwIliyNRsrNuA0hYs3F1Ji2uIY4l78H6qg0xwkOWFNKZNGjvI/oPtWN6Qj
         wi3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=wKRx8J1v+P6Zds2BdUJ+SAjwMAKFC4V+Bu1chmcFujw=;
        b=iEYfTBZetjZdxFNmk8V+m4ipPVmutp8VRPDM//bvui/X5qA7op5wagiZJOaxCb+fPD
         e1CJ5zOH0PcTaTuvc4R+uAANySijNP9Kc9+o63rrckozM5ZdZd1JtxGyohaPCB2BAN5L
         t9HTf6mSQhRyYm2Q04j04p3sMPsHU3r466GE6L7j/q1toziTTz7WUsf8ZRiYundP66R9
         9DcBb3wKhleLSY0zWnLmAf51dazxPe6ob3WsNLQm1p4n6uZ96LPnGoYsKdeBjJILOTM0
         CC287kKYbOQwxYYR6vUozPES2a4MB7ALkc0jwJBJxDaF7+4EUciiGE4E/0OYE/YqNVMU
         BzKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MwVgLjvi;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id h12-20020ac8568c000000b002de99a6f48csi3934158qta.783.2022.03.01.08.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Mar 2022 08:47:21 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MwVgLjvi;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646153240;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wKRx8J1v+P6Zds2BdUJ+SAjwMAKFC4V+Bu1chmcFujw=;
	b=MwVgLjvibxddARpFKOhxq/caE8jxd8hsuat2vZMuNAPCw+GbUiLpMeZofvUOF7emfhoRzq
	A41wttdtitXH4tgwUxNF41BCPpQkwl2wfzuV0aZswicagjFK5eLQDrWPcM6yCdOuDjd9Wl
	+kQJRjfrMvDFnIA0bGcg6UIDWCg7NYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-7v672GV6OUaD0VIBzrhyxw-1; Tue, 01 Mar 2022 11:47:11 -0500
X-MC-Unique: 7v672GV6OUaD0VIBzrhyxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D9B0800422;
	Tue,  1 Mar 2022 16:47:09 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.101])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAB7886BA0;
	Tue,  1 Mar 2022 16:47:07 +0000 (UTC)
Date: Tue, 1 Mar 2022 16:47:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
	alex.bennee@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 00/17] target/arm: Implement LVA, LPA, LPA2 features
Message-ID: <Yh5OCECGjRMQtxbO@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
 <CAFEAcA84cFnF9EygS6Xun3VorjeGKf+Lw7zRdkBbcRp6YT_OeQ@mail.gmail.com>
 <CAFEAcA_+70hkNaRhbT=ZT457x+cgD-qSad5QoJY8VAEds5UKeA@mail.gmail.com>
 <Yh5Jqg8oDDfPZ2c9@redhat.com>
 <CAFEAcA-6C9XmP_HGwL8CarBrcuvg6n1wbR5Ys0jZBC-RrA0-AA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-6C9XmP_HGwL8CarBrcuvg6n1wbR5Ys0jZBC-RrA0-AA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: ZPlkRZhh1M6r

On Tue, Mar 01, 2022 at 04:30:30PM +0000, Peter Maydell wrote:
> On Tue, 1 Mar 2022 at 16:28, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Mar 01, 2022 at 04:16:25PM +0000, Peter Maydell wrote:
> > > On Tue, 1 Mar 2022 at 16:08, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > >
> > > > On Wed, 23 Feb 2022 at 22:31, Richard Henderson
> > > > <richard.henderson@linaro.org> wrote:
> > > > >
> > > > > Changes for v3:
> > > > >   * Update emulation.rst.
> > > > >   * Split out separate update to ID_AA64MMFR0.
> > > > >   * Hack for avocado.
> > > > >
> > > > > If the avocado hack isn't acceptable, perhaps just drop the
> > > > > last two patches for now?
> > > >
> > > > I think that given that there are Linux kernels out there
> > > > that won't boot if LPA2 is enabled, we should probably have
> > > > a -cpu command line option to disable it. Otherwise we might
> > > > get a bunch of "why did my kernel stop booting" bug reports.
> > >
> > > ...and should using a versioned machine type also default
> > > -cpu max to not enabling that? Not sure what x86 or other
> > > precedent is there.
> >
> > I don't recall us coming across an important scenario where a guest
> > would fail to boot when we /enable/ a given CPU feature on x86,
> > requiring us to hide it from -cpu max/host.
> >
> > Assuming the QEMU/KVM implementation of a CPU feature is correct
> > per the relevant spec, then artificially hiding it by default from
> > -cpu max feels questionable, as that penalizes non-buggy guest OS.
> 
> Yeah. It's just unfortunate that "buggy guest OS" here is
> "every Linux up to 5.11".

Lets say the lpa2 feature was tied so it only gets enabled in the
new 7.0 machine type version, even if KVM/QEMU could supports it
fine with any machine type version. If someone runs a VM with
Linux 5.6 with

  -cpu max -machine virt'

it is going to break.

Our choice is then between telling them to change their QEMU config to

   -cpu max,-lpa2 -machine virt

vs telling them to use

   -cpu max -machine virt-6.2

there's not much practical difference in those scenarios, for someone
deploying a new VM instance.

It would, however, benefit people who had already previously deployed
a VM with QEMU using a explicit versioned machine type. This would
be the case for anyone using libvirt, as libvirt always expands the
user's config to be fully versioned.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
