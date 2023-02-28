Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5531214ejc;
        Tue, 28 Feb 2023 00:59:52 -0800 (PST)
X-Google-Smtp-Source: AK7set9JAKJrQ3sgv9FcTPirWSJjiujtBP2Q7DNlZrU+PT8gPxiEcxibgpVePBhR2DCOZRZVj067
X-Received: by 2002:a05:622a:1a85:b0:3b6:2e9b:cf2b with SMTP id s5-20020a05622a1a8500b003b62e9bcf2bmr3877710qtc.14.1677574791996;
        Tue, 28 Feb 2023 00:59:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677574791; cv=none;
        d=google.com; s=arc-20160816;
        b=kvwaK1BFuQ2DDQIfSIB6rJVPT5SapH9ByqYEuy5//VBeJMWyi6Skvb/dezkYuJ1+8c
         h1yuEufUgBl0JrH4S+JLXy82nocSGPP/c2ytIpKhA61dUMQBoAQ4khseAKNO1xWArrsM
         R74R+RyQ0MehZ5qNW6eef7zFetAqb/5Wmtmdh6HJWryLDFdCgf2ol+G/+I7RDLLQA8ch
         jBQ5oAaz0LbE2Pj0kOvuou3a+SEkrw2cVYWkXoB5OyBsisaiVSnioqAXVJrNFugVyX+W
         FUkSjFKeSvw0eQApsct5hwSyv/uYR3I0uubM3pSJjNEtzAFCOlKmUKps1xdjXyyw3wBU
         qAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=gh14Q5XVK57GCqNInt9dvGWviONbEUABlkLCEvFo+1A=;
        b=LwHkA+SioJi4kaZxTmNPOltgmGUQV8MNHNRmobAO911xA1Gm7AwL3Oh6PhTrz+yKgn
         P/5/mU10RLNYflZyEpogVWMSbCd9GXvFjl73E5gSmCEvsCabb+oG5YEPB78b+8wVhuDg
         Knux0ywqRKsm4Ric2Eu3fTAZusYhOs8ygQ/Eop5eUDGhWrQ/e93Ala4rh68s1iKjn3bA
         1vQvIgNZiYPj8MEHouomGcOdMcz8Hqft83HgcNpWSFyYxETQGSURnuS9GTXe0lEOH4Eq
         tnKpRTJvqDPsuovV6rRSsp1yq6rAajktdLWERPkQ55n6nLXwJQb0JAWQeuYPxYYm8vgm
         p97w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NgGWSbfY;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id w10-20020a05622a190a00b003b1089eccc7si8545773qtc.582.2023.02.28.00.59.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 00:59:51 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NgGWSbfY;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677574791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gh14Q5XVK57GCqNInt9dvGWviONbEUABlkLCEvFo+1A=;
	b=NgGWSbfYe9XsSyU4Fbm3QviohhQGjoS3hZuEtKh6KOu04ufUFE1KB8/YwDkg43ZtfSpJqo
	dbL1IdhhEIlvXk/kwPfNRLFiFyL8DCBcyQXUsOSscZNFTV87GHt8nS0q08p3i365UOjHeF
	hrhVM9tMvyr8C+hp9QdEV3VtmVa2jkk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-VkdylblbOkGWEi9JMpylhA-1; Tue, 28 Feb 2023 03:59:50 -0500
X-MC-Unique: VkdylblbOkGWEi9JMpylhA-1
Received: by mail-ed1-f69.google.com with SMTP id g33-20020a056402322100b004b0e54e03acso12100949eda.8
        for <alex.bennee@linaro.org>; Tue, 28 Feb 2023 00:59:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677574789;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gh14Q5XVK57GCqNInt9dvGWviONbEUABlkLCEvFo+1A=;
        b=AT94FeCcvAqxUayzwKtEQ1HbZ+6v6oa/lxPn3Yyli0A6QtddLuE4xxEQqkEQIrzdZp
         ccDcbtf1I/yCu2JCNUbwfsQvxEUc+AkhX3UcaQYXSBZUFW+76t3WBTNJ/RGuh0f/x6L8
         YMYlQ15+mTN/iBB4itOt2eCPwSzFIxveXjkPIC9q4SxEtCGu0ZNhZpD43oOYn3XGWou5
         aK6cXqdJrFDVVm1hvlueJrjE2KLMkX+PUiQ0H7cCljptQlaCDaMpduOH1dCoiYJr2Pqw
         MchgMTEKDK+jtN77mKrp0QIPgW3B+qvn5sQAk+TSOHm/fvHdkh8yPN1BN+dhG52IPSbN
         ztHA==
X-Gm-Message-State: AO0yUKW6f1sdDE+KEoLVm4/dDEr6HZd096ucQYDq13vTHomRSpMbDDL1
	sX1LcewYdijSJ8AL8v/wgdIPk7WyMql06ikFsNei8vgmEsIdM+/4flNkM/6alY5e9gAPRMmQI/B
	c8ihEeJwLvl06UAGP
X-Received: by 2002:a17:906:264d:b0:8b1:79d0:bc58 with SMTP id i13-20020a170906264d00b008b179d0bc58mr1697104ejc.16.1677574789514;
        Tue, 28 Feb 2023 00:59:49 -0800 (PST)
X-Received: by 2002:a17:906:264d:b0:8b1:79d0:bc58 with SMTP id i13-20020a170906264d00b008b179d0bc58mr1697089ejc.16.1677574789259;
        Tue, 28 Feb 2023 00:59:49 -0800 (PST)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.52.141.194])
        by smtp.gmail.com with ESMTPSA id ha14-20020a170906a88e00b008c405ebc32esm4229508ejb.28.2023.02.28.00.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 00:59:48 -0800 (PST)
Date: Tue, 28 Feb 2023 03:59:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com, xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228035917-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
MIME-Version: 1.0
In-Reply-To: <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: LXNm/XN5kRJN

On Mon, Feb 27, 2023 at 10:21:14AM -1000, Richard Henderson wrote:
> On 2/27/23 10:12, Michael S. Tsirkin wrote:
> > On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
> > > I feel like we should have separate deprecation entries for the
> > > i686 host support, and for qemu-system-i386 emulator binary, as
> > > although they're related they are independant features with
> > > differing impact. eg removing qemu-system-i386 affects all
> > > host architectures, not merely 32-bit x86 host, so I think we
> > > can explain the impact more clearly if we separate them.
> > 
> > Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> > a superset.
> > 
> > Removing support for building on 32 bit systems seems like a pity - it's
> > one of a small number of ways to run 64 bit binaries on 32 bit systems,
> > and the maintainance overhead is quite small.
> 
> It's not that small.  It only works for single-threaded system mode.  It
> silently does not honor atomicity for user-only mode, which is perhaps worse
> not working at all.

We should probably block multi-threading on 32 bit then.

-- 
MST
