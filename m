Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1619288njf;
        Mon, 28 Oct 2024 10:04:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/SccnWXRHNVLb99RhgJ4OmmpTrAhUlJy2RsRSk8/iWk0QrNLJon2RJHSNaKD/uPzC7nd2r6z6NZq8zw==@linaro.org
X-Google-Smtp-Source: AGHT+IGF8O3m38JsI5Ha5hhArVdWiFXyo7/bSFHIJeDY0E//E2s3j3l2oaW46WotB8gbhfXYWFMU
X-Received: by 2002:a05:622a:190a:b0:458:2dba:55a7 with SMTP id d75a77b69052e-4613bfd438emr149084281cf.2.1730135082210;
        Mon, 28 Oct 2024 10:04:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730135082; cv=none;
        d=google.com; s=arc-20240605;
        b=V4CC6004zYdurOG4+jcKXGKujeDCifqR5/NssmPUqFIrzW+xXkdDxlzz2uVPVbrkZj
         tsA4eJ0QLrAn1/SGnNnTDenCBRdXYo7NpIRZArxd0d9YFwE6kli5nn3/kC97NDdhfTwe
         lnCL5D8x+0aMrayolctLI6XJrTXtkTIkCPVWTzONqacb/pABs+726v5U11FGKFcNJnPt
         KwmIe/6tn7jOpoZYXlmavNzwctPUP90B8pMbWhsid07HhESPYENUooGhq9j/XlmF7j7s
         IJtZ3/dgXYvi4C3q82LOcMl/z5ewB00dEct7Jn/uW4FCHNUcTJSGIUbIR+QQwavE4dXp
         O8kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=NQu+8I7Sok3PPSrWFRnNNqhfVgvV3ebDTRz6eG60lgs=;
        fh=Af+j01jgw9a8GO5hOeAC2uRi0z1BP276NqhjltNOU90=;
        b=QpTwla5cEZhFvqzDDponrTQb/3Micj/WmjIKmvyuVz4vy/+gkDngh8Of0KtR818o8Y
         ooBVsSRcCcMx+CiXv5qHPdlnDc5VxY7FuVhRIrZonZTvJnD92K4sdKoJ1hWokYQBepP1
         uOu6bX8T9auMTyppMmbmyUsJ6en/sG8bcuJeGDopdEzEb0PfewygpdCTveVzT3oFXqgQ
         gERuiHv/N/NMU1/hGE0ssTQzUjfHgxt902fqeof4H1MRR665aNtOFeu1YB46j0A5yqnC
         QNvl1HXn2mUuu81ftmoyZGePKawer2m/kPrm52xh1AbdTK/K1VhpilZr7BJFbvK8vOn9
         SNjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bfF/ylEV";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4613235dcd1si84252061cf.376.2024.10.28.10.04.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:04:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bfF/ylEV";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730135081;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NQu+8I7Sok3PPSrWFRnNNqhfVgvV3ebDTRz6eG60lgs=;
	b=bfF/ylEVXAxaSY+WkeuFNyscinLqH84zIDJd4esi9pfaC0qCNibCOOOg6SFF9vJevpxeSr
	t/ZAxUgAkDm60nZBTE/y+yCGBtVv0pfsDGHU2kbJYqv8fCuE7cCXRh1Unr6brmZ5434Gbr
	LMo5At2coWXmeifjxviabveiVRSs9Ho=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-328-jh4yBVELOw2Tk0UapQ0TwQ-1; Mon,
 28 Oct 2024 13:04:40 -0400
X-MC-Unique: jh4yBVELOw2Tk0UapQ0TwQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DF7481955EB5;
	Mon, 28 Oct 2024 17:04:37 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.86])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E381B1956088;
	Mon, 28 Oct 2024 17:04:30 +0000 (UTC)
Date: Mon, 28 Oct 2024 17:04:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	cohuck@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev, richard.henderson@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
	shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
	pbonzini@redhat.com
Subject: Re: [RFC 18/21] arm/cpu: Introduce a customizable kvm host cpu model
Message-ID: <Zx_EGxj2aqc_2-kY@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-19-eric.auger@redhat.com>
 <ZxuX4i9NjVRizB72@redhat.com>
 <cb6c8f62-c5dc-416d-865f-fbdf96164dac@redhat.com>
 <Zxub7ol4p8P_sWF8@redhat.com>
 <CAFEAcA_wQu17y0PyQwxw0wuf2H5y2VE5aX16nLP2-u7QUP2ggA@mail.gmail.com>
 <Zx-9WxXkmkMuGIlQ@redhat.com>
 <CAFEAcA9w0mb5bcU8p+fScQony-=oqLmNurGWpnL_sBneQCzxUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA9w0mb5bcU8p+fScQony-=oqLmNurGWpnL_sBneQCzxUg@mail.gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: r1uMGn+OMT2J

On Mon, Oct 28, 2024 at 04:48:18PM +0000, Peter Maydell wrote:
> On Mon, 28 Oct 2024 at 16:35, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Mon, Oct 28, 2024 at 04:16:31PM +0000, Peter Maydell wrote:
> > > On Fri, 25 Oct 2024 at 14:24, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > On Fri, Oct 25, 2024 at 03:18:25PM +0200, Eric Auger wrote:
> > > > > On 10/25/24 15:06, Daniel P. Berrangé wrote:
> > > > > > Also, is this naming convention really the same one that users
> > > > > > will see when they look at /proc/cpuinfo to view features ? It
> > > > > No it is not. I do agree that the custom cpu model is very low level. It
> > > > > is very well suited to test all series turning ID regs as writable but
> > > > > this would require an extra layer that adapts /proc/cpuinfo feature
> > > > > level to this regid/field abstraction.
> > > > >
> > > > > In /cpu/proc you will see somethink like:
> > > > >  Features    : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp
> > > > > asimdhp cpuid asimdrdm lrcpc dcpop asimddp
> > > >
> > > > Right, IMHO, this is the terminology that QEMU must use in user
> > > > facing APIs.
> > >
> > > /proc/cpuinfo's naming is rather weird for historical
> > > reasons (for instance there is only one FEAT_FP16 feature
> > > but cpuinfo lists "fphp" and "asimdhp" separately).
> >
> > There's plenty of wierd history in x86 too. In this
> > case I might suggest just picking one of the two
> > common names, and ignoring the other.
> >
> > If we really wanted to, we could alias the 2nd name
> > to the first, but its likely not worth the bother.
> 
> Or we could use the standard set of architectural
> feature names, and not have the problem at all, and not
> have to document what we mean by our nonstandard names.
> (cpuinfo names do actually mostly line up with the
> standard names, just not 100%. Similarly gcc/clang command
> line options are mostly the architectural feature name.)

Ah, right, yes. Sorry I mis-understood you originally to be suggesting
the same low level names as this patch.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
