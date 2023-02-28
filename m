Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5584901ejc;
        Tue, 28 Feb 2023 02:11:28 -0800 (PST)
X-Google-Smtp-Source: AK7set+cEDGZE/vWK+2Mw8vxvQ5AfxTGG/9+8E9Fb6n9KlV7TFGwm6P4DZRdS/dhM/8hVUTg+XsC
X-Received: by 2002:ac8:58d6:0:b0:3b9:bc8c:c217 with SMTP id u22-20020ac858d6000000b003b9bc8cc217mr20272990qta.34.1677579088295;
        Tue, 28 Feb 2023 02:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677579088; cv=none;
        d=google.com; s=arc-20160816;
        b=QI1w59E7zhaeCMO0x4UGrD2zvBZ7aXDgyBaEI+a/8d76em8DVw2ekv2WUC/jvnqBBg
         NvWfXnNMTnpIe/Wv0bum6aIsEgBfTB/sxF6yBp8SfNSYuGkRqz0JVMo/3g6N1ONPT3Nu
         J6eez4CszdCgeVXZb9xKC1HpsLaijkVApjnH0ZXhXhZQDjwbWdN+7V82nLqy1x+Joz3b
         Ix82Ny/AsljIPYHBe2Dm80ZI7K8v4tA5FruDBQoixFJl2NXpxPfgPKqYwxkhl/2GGC/w
         /GhSo3QADLGJpUbhUVJPfmoBTZuADbxAfUVhRRm/RnDASSKgrrXztg7eAV0GC2Nw0Mb6
         DakQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=VUsHXm3vGD11b06eHDzEiEyoV6j+i/reAk8OksRIJe4=;
        b=ib3rvCnvZqofwS1abcMkoJRlF7pXmYmQx0COWLO8WVDENckyFmS2YInbHpM3w3RN8Z
         FUgObMsJp/PryNQlYJ22DJwZ2MYQeV0LkxP90UkQsuHy7U2PqzO0Y0CyNxCZ2/g5UQiQ
         d+7luUiSsPGMXXOy+h/pUZd6ftAXwwD5dTckAeDQ3SxwObT+PO44SsrtFA6wgn2KIzqL
         J40hC7GGicc/F+GbfhFX+G7Re3XL5tOiJHtfyS4XuTFbRxfJ/CUB9JQGFOu2AnOy4HVd
         xVhrvR/KVBGblb07bP7ilXhh7BrnyqoL9hBqKSNPTEGz8lK43QtD+3tEiD7nJ/D1LOVF
         kcrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="X/CYpxpP";
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id u21-20020a05622a011500b003b848d2cbb5si8600514qtw.558.2023.02.28.02.11.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 02:11:28 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="X/CYpxpP";
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677579087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VUsHXm3vGD11b06eHDzEiEyoV6j+i/reAk8OksRIJe4=;
	b=X/CYpxpPq/LfM7C/missCT+1gAYrQ+RXdLgDPEHMDc6ape/c+pcVgt73y/qLMqw+wO3DSJ
	VQuCPAaLWS/w0Csp7PfjTVBUGqUhSkvd90BNkjrq3rFUld8iNlmXO8+A2PeHzxpCvecE4k
	/8EbIcqf2j5qbfincbA9Eu/MSvshciI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-112-hmSki-mLMgefHdn5jvYPJg-1; Tue, 28 Feb 2023 05:11:26 -0500
X-MC-Unique: hmSki-mLMgefHdn5jvYPJg-1
Received: by mail-ed1-f69.google.com with SMTP id cf11-20020a0564020b8b00b0049ec3a108beso13061299edb.7
        for <alex.bennee@linaro.org>; Tue, 28 Feb 2023 02:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677579085;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VUsHXm3vGD11b06eHDzEiEyoV6j+i/reAk8OksRIJe4=;
        b=aPVONzEOdrrz6jrWOutyw+pS9kqr7FNmBnendTKJSjJ3aYi+7E1CYOJwH+PykczNNS
         lzXfcRPnc4XXnPKG+kozJRy4Ux0xUH1hD+ZwUq0DPgKVTUUgwxW0dJn0hlGmXMmbH0lF
         Hvtjc7rqJ4iFy0gHaGUyNjZpOUoKNiHnQm9BkTTIxt14ckdM6MWC80jM8EvGCuD++jh7
         tBQ1MI6XHbqgyXlVLDiwqoK/YJzxuVppT34VKnYbeMDnl7tvhuvMLYeBVFPGh9F+DZLa
         M1kUnZ7b99rW2vlfqrlVeBz5pLe/FFkmw8AicVO1T6KSN39X4m1aIGLmaz62QaevLIhz
         vYaQ==
X-Gm-Message-State: AO0yUKXnNEDpSiH1qBGcZfnkWJ++xSRGqBgNTVIyMCMhkX7RTCfl95Kf
	/TJ7rY040x8fEet83r2Pt6Qxv/cDnPlZj1Eo96KmhKjrkSs8aRRNDepTiCoUSunn3Tqdx+H3eBa
	/VoLH75enVsUI1XdO
X-Received: by 2002:a17:907:cb81:b0:8b0:fbd1:1a61 with SMTP id un1-20020a170907cb8100b008b0fbd11a61mr2776586ejc.52.1677579085707;
        Tue, 28 Feb 2023 02:11:25 -0800 (PST)
X-Received: by 2002:a17:907:cb81:b0:8b0:fbd1:1a61 with SMTP id un1-20020a170907cb8100b008b0fbd11a61mr2776557ejc.52.1677579085382;
        Tue, 28 Feb 2023 02:11:25 -0800 (PST)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.52.141.194])
        by smtp.gmail.com with ESMTPSA id gg4-20020a170906e28400b008b1779ba3c1sm4349246ejb.115.2023.02.28.02.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 02:11:24 -0800 (PST)
Date: Tue, 28 Feb 2023 05:11:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org, Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228050908-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
 <Y/3MIUDRBUSNg6C5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Y/3MIUDRBUSNg6C5@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: a3/tAwlroo/W

On Tue, Feb 28, 2023 at 09:40:49AM +0000, Daniel P. Berrangé wrote:
> On Tue, Feb 28, 2023 at 10:14:52AM +0100, Thomas Huth wrote:
> > On 28/02/2023 10.03, Michael S. Tsirkin wrote:
> > > On Tue, Feb 28, 2023 at 08:59:52AM +0000, Daniel P. Berrangé wrote:
> > > > On Tue, Feb 28, 2023 at 03:19:20AM -0500, Michael S. Tsirkin wrote:
> > > > > On Tue, Feb 28, 2023 at 08:49:09AM +0100, Thomas Huth wrote:
> > > > > > On 27/02/2023 21.12, Michael S. Tsirkin wrote:
> > > > > > > On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
> > > > > > > > I feel like we should have separate deprecation entries for the
> > > > > > > > i686 host support, and for qemu-system-i386 emulator binary, as
> > > > > > > > although they're related they are independant features with
> > > > > > > > differing impact. eg removing qemu-system-i386 affects all
> > > > > > > > host architectures, not merely 32-bit x86 host, so I think we
> > > > > > > > can explain the impact more clearly if we separate them.
> > > > > > > 
> > > > > > > Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> > > > > > > a superset.
> > > > > > > 
> > > > > > > Removing support for building on 32 bit systems seems like a pity - it's
> > > > > > > one of a small number of ways to run 64 bit binaries on 32 bit systems,
> > > > > > > and the maintainance overhead is quite small.
> > > > > > 
> > > > > > Note: We're talking about 32-bit *x86* hosts here. Do you really think that
> > > > > > someone is still using QEMU usermode emulation
> > > > > > to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!
> > > > > 
> > > > > I don't know - why x86 specifically? One can build a 32 bit binary on any host.
> > > > > I think 32 bit x86 environments are just more common in the cloud.
> > > > 
> > > > Can you point to anything that backs up that assertion. Clouds I've
> > > > seen always give you a 64-bit environment, and many OS no longer
> > > > even ship 32-bit installable media.
> > > 
> > > Sorry about being unclear. I meant that it seems easier to run CI in the
> > > cloud in a 32 bit x64 environment than get a 32 bit ARM environment.
> > 
> > It's still doable ... but for how much longer? We're currently depending on
> > Fedora, but they also slowly drop more and more support for this
> > environment, see e.g.:
> 
> FWIW, we should cull our fedora-i386-cross.docker dockerfile and
> replace it with a debian i686 dockerfile generated by lcitool.
> There's no compelling reason why i686 should be different from
> all our other cross builds which are based on Debian. The Debian
> lcitool generated container would have access to a wider range
> of deps than our hand written Fedora one.
> 
> >  https://www.theregister.com/2022/03/10/fedora_inches_closer_to_dropping/
> 
> With regards,
> Daniel

... and is closer to where 32 bit is likely to be deployed which is
systems like e.g. raspberry pi os which until recently was only
32 bit.

-- 
MST
