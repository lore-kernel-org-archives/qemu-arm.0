Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5563338ejc;
        Tue, 28 Feb 2023 01:41:03 -0800 (PST)
X-Google-Smtp-Source: AK7set9VyE4JHlzuXA2JpyZEj9LENCRXL9P5kxTEeITLafubWLBL8xvVvxTgtPFnws6wO750Enu6
X-Received: by 2002:ac8:4e4a:0:b0:3b8:6c4d:488a with SMTP id e10-20020ac84e4a000000b003b86c4d488amr3514991qtw.37.1677577263455;
        Tue, 28 Feb 2023 01:41:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677577263; cv=none;
        d=google.com; s=arc-20160816;
        b=ThsU22buAVAT981lWkLZVlaT3TwFrD4nQREPyDaKGM+k5xTnoU8zwbiWHPQeWnQgrY
         8dRG4pVjoCsR347y5hHRa5PWmi4cE9+jg1rUCDR+3Fy/9qyDHj6xiMHaYqBP26ajGbTl
         wAl8F4Twr7G8Hko5D/J9i3s5z5opagMFGpaf1XNFTIDTuRuUUp/m37vJ7cgB8snBMBpH
         8dk8gaxZmCgtRJqg4t+K9bI3QJXTKJEStYdpsJ51wE/Q9RqbE3/BGN9ot5s7d+N82C1M
         8uJFTy50dcKtRh+uXE22Rkb7mEqK27tuOQBrxQJ9vLKV1ZD5PYs1BlP+gRCaqbK58sK4
         RhTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=iPwT6LbI6vnTr+kaV/WT6dv1nv2LsgKfksaLe2/+5Co=;
        b=yAcZzqO/yJULfqWp5pa8SCvZd8LFRV3nr8+wSYFtiOz12Kt6umw4xuOIoyXzQtLdwj
         uUqVJoY78DaYzpDlEmh2XsqrBzSkPMllpAQ5IIE9IYfvodtQIbuQWKyj5ZKVDQ+nQ8tu
         AjwN24CTHrgPdRTJnyUEvWcUANXbfhDf7dnJe5YiW39zhjtTB8UNmOskq2ZrIKkHqWxF
         iLUgAej8572zC8Z7ARmuC+8inoSY/d+EYJabyUTMDkBc4b4uqhASotbbmMnW6aIWL/qL
         KzWSOQoxlXerk9sJHq0uHq2JUis+rxVCbZTfxa8Apgo2nRflwoGMYvbSGgd8YsLAt+Zj
         mi0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ikfil3MF;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id x19-20020ac85f13000000b003bd0a5ef178si8648691qta.339.2023.02.28.01.41.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 01:41:03 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ikfil3MF;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677577263;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iPwT6LbI6vnTr+kaV/WT6dv1nv2LsgKfksaLe2/+5Co=;
	b=ikfil3MFIaZ3alS6V+PMmiFZObpXxMcMRw69NWK9CRbWZDwcC5EDeuSm8pSGUzlYOytEyp
	h0X6n+OT99z38LX2+sUKMuMtix/8Y0EzivFY+jZGeCYWvgNRGsqIAN89sbq/E87gkJrNfj
	aCV60EuOsq0FbJhrB1qBdgi7cMHO5T0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-IJDVr2aTPt6RuBqSL0DiIA-1; Tue, 28 Feb 2023 04:41:01 -0500
X-MC-Unique: IJDVr2aTPt6RuBqSL0DiIA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF4002805588;
	Tue, 28 Feb 2023 09:41:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0344F492B12;
	Tue, 28 Feb 2023 09:40:57 +0000 (UTC)
Date: Tue, 28 Feb 2023 09:40:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org, Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <Y/3MIUDRBUSNg6C5@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-TUID: 8GROEBfsLGyb

On Tue, Feb 28, 2023 at 10:14:52AM +0100, Thomas Huth wrote:
> On 28/02/2023 10.03, Michael S. Tsirkin wrote:
> > On Tue, Feb 28, 2023 at 08:59:52AM +0000, Daniel P. Berrangé wrote:
> > > On Tue, Feb 28, 2023 at 03:19:20AM -0500, Michael S. Tsirkin wrote:
> > > > On Tue, Feb 28, 2023 at 08:49:09AM +0100, Thomas Huth wrote:
> > > > > On 27/02/2023 21.12, Michael S. Tsirkin wrote:
> > > > > > On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
> > > > > > > I feel like we should have separate deprecation entries for the
> > > > > > > i686 host support, and for qemu-system-i386 emulator binary, as
> > > > > > > although they're related they are independant features with
> > > > > > > differing impact. eg removing qemu-system-i386 affects all
> > > > > > > host architectures, not merely 32-bit x86 host, so I think we
> > > > > > > can explain the impact more clearly if we separate them.
> > > > > > 
> > > > > > Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> > > > > > a superset.
> > > > > > 
> > > > > > Removing support for building on 32 bit systems seems like a pity - it's
> > > > > > one of a small number of ways to run 64 bit binaries on 32 bit systems,
> > > > > > and the maintainance overhead is quite small.
> > > > > 
> > > > > Note: We're talking about 32-bit *x86* hosts here. Do you really think that
> > > > > someone is still using QEMU usermode emulation
> > > > > to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!
> > > > 
> > > > I don't know - why x86 specifically? One can build a 32 bit binary on any host.
> > > > I think 32 bit x86 environments are just more common in the cloud.
> > > 
> > > Can you point to anything that backs up that assertion. Clouds I've
> > > seen always give you a 64-bit environment, and many OS no longer
> > > even ship 32-bit installable media.
> > 
> > Sorry about being unclear. I meant that it seems easier to run CI in the
> > cloud in a 32 bit x64 environment than get a 32 bit ARM environment.
> 
> It's still doable ... but for how much longer? We're currently depending on
> Fedora, but they also slowly drop more and more support for this
> environment, see e.g.:

FWIW, we should cull our fedora-i386-cross.docker dockerfile and
replace it with a debian i686 dockerfile generated by lcitool.
There's no compelling reason why i686 should be different from
all our other cross builds which are based on Debian. The Debian
lcitool generated container would have access to a wider range
of deps than our hand written Fedora one.

>  https://www.theregister.com/2022/03/10/fedora_inches_closer_to_dropping/

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
