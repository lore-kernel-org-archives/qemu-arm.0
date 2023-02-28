Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5507004ejc;
        Tue, 28 Feb 2023 00:19:28 -0800 (PST)
X-Google-Smtp-Source: AK7set+mpHRwkEa3hrfW76pewWt7i/ohjKyzEJlZZMJLQ1qw4qZ7M4S3Wmg9OVA3NRGdM/dfQWfj
X-Received: by 2002:a05:6214:ac6:b0:56e:9986:4fa9 with SMTP id g6-20020a0562140ac600b0056e99864fa9mr5236001qvi.7.1677572368228;
        Tue, 28 Feb 2023 00:19:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677572368; cv=none;
        d=google.com; s=arc-20160816;
        b=rNyynrAF+pr7t66wMieQhukGlyQAhQnSWdt3q6cLaPkzWOy0YRvv6pcp/Zghrscfih
         5cw5bOQIohpuVzvJIgBtEztY7OlAn1Y1roaNoQHq0nIktlld1XWBb/X1UJTqx42Oh545
         2EDqqgVADWm9HcgSwJ+2IO5hzdFrMG6sUqUuIQwLsmsPhxaaYFgLvGptB7plu7J+PCC1
         DlE5uDk0MbVPF8jYkD5q1uvSPnAuoLqiU/pU6UhcOyaQPd+Ahll00Q4slM1KOGynQaKn
         MoVAGvNb7tw9OVOO1rUFpzUNidi5ynNLx9XXJe37OsjtpUPeQJzSVgSMCtrKerHOnzQC
         Vo3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=0hz5AGTBN9eryZg3nZeMjxA9itLfbrKU7K0S/m+pqIE=;
        b=Hj3MIZhyLPEUqLIoIOvi0WWg0/nMjlsTiWrx9hkjrc9OUOYVGDYjAkqnvRp9nKdGUy
         UoC5nytLpg/txsG4BSjVBHzqgSnie17EbNJdwjkawR6w8IMnfhOpdP08dWPgAEyitWsu
         rSQzaG6yLOi9pywoUNug62Fm3B7SG4SOnhtC9uExX8gvdThd4dWvKmhZX2VlVeakTsVb
         1EgpwqUnkJrY3QHgD0h/Fsxvtz4NrV4o68N0VUi8K4IVTp+7WOn2OdP4y4Iz+YB6bjza
         ZzBfTxswAV+SDywJa088vevl0wei1zJtvslTlcqA90fKZoXDCJEAXuxXQG2k7t+qMUC6
         Pktw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XdRqLhkr;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id g3-20020a05620a40c300b0071fc1fee8aesi9459587qko.446.2023.02.28.00.19.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 00:19:28 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XdRqLhkr;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677572367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0hz5AGTBN9eryZg3nZeMjxA9itLfbrKU7K0S/m+pqIE=;
	b=XdRqLhkrQsARp4KhV5m2eiLbBZU01R4bdoaHZcnAe6Lcv8aBDJfZX3OHvfQr8z+oj38lIH
	ch79SSNxHqdxL4EerIZTZetzEJdh7qxla8NkogNCClE5tGHjNJzezb0lUzrIcA7NLyEu/N
	nUqr3ROgGiDNcUG3jqjCsuJRrRFe3xQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-417-EBQ43FXBPYihuMm8mRo-4Q-1; Tue, 28 Feb 2023 03:19:26 -0500
X-MC-Unique: EBQ43FXBPYihuMm8mRo-4Q-1
Received: by mail-wm1-f72.google.com with SMTP id e17-20020a05600c219100b003e21fa60ec1so3965113wme.2
        for <alex.bennee@linaro.org>; Tue, 28 Feb 2023 00:19:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677572365;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hz5AGTBN9eryZg3nZeMjxA9itLfbrKU7K0S/m+pqIE=;
        b=rR2stM0UrIOwFQ52l0HZWTXaq3lmU+p86zDuJr7UhZpJwgilgywLZj+LQbi+mpjeLT
         6C5SNc/34GcsUChqIYGJM4vsfv3oPDRexKqQkoz08TewO3a5kI9T8BojdZJWBB6cgzSP
         jnxEosfqMMd/UmZLSNsGbvvJd2u48m/Sx0g+pADmd6YUV12v/pWkKNVxeF0vuL0zFEut
         2dkkVhnsNnUpqSJi96XET55X0OMDrfZM77mF05JOmK92LU4/WThvh6R+Vp5SAdIU8d0O
         7DfWLplL5Vov3rklwtm/IDbvfDuwxo77hxT+vaNd4Vu84ZP9yAfnxW8Nq+7HEz4ycQL9
         iFLw==
X-Gm-Message-State: AO0yUKWKeHh9cu32SZDGkn6/EAOCiVgR7xHmThJeA6+viEHFeVvsj+Cd
	MRoenvMnF0799jxjn+ITSQgfSeL7TTO9RutIoiurM25WhXI9A/F3mNZFCsN5cNFb4d72T2nvYsE
	It6KEHV0N1yhQKfBP
X-Received: by 2002:a05:600c:18a2:b0:3eb:4162:7352 with SMTP id x34-20020a05600c18a200b003eb41627352mr1641550wmp.23.1677572365490;
        Tue, 28 Feb 2023 00:19:25 -0800 (PST)
X-Received: by 2002:a05:600c:18a2:b0:3eb:4162:7352 with SMTP id x34-20020a05600c18a200b003eb41627352mr1641531wmp.23.1677572365194;
        Tue, 28 Feb 2023 00:19:25 -0800 (PST)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.52.141.194])
        by smtp.gmail.com with ESMTPSA id p15-20020a05600c1d8f00b003e20970175dsm15603198wms.32.2023.02.28.00.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 00:19:24 -0800 (PST)
Date: Tue, 28 Feb 2023 03:19:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228031026-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
MIME-Version: 1.0
In-Reply-To: <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: RIRJ2OQOKIw1

On Tue, Feb 28, 2023 at 08:49:09AM +0100, Thomas Huth wrote:
> On 27/02/2023 21.12, Michael S. Tsirkin wrote:
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
> Note: We're talking about 32-bit *x86* hosts here. Do you really think that
> someone is still using QEMU usermode emulation
> to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!

I don't know - why x86 specifically? One can build a 32 bit binary on any host.
I think 32 bit x86 environments are just more common in the cloud.

> > In fact, keeping this support around forces correct use of
> > posix APIs such as e.g. PRIx64 which makes the code base
> > more future-proof.
> 
> If you're concerned about PRIx64 and friends: We still continue to do
> compile testing with 32-bit MIPS cross-compilers and Windows 32-bit
> cross-compilers for now. The only thing we'd lose is the 32-bit "make check"
> run in the CI.
> 
>  Thomas

Yes - fundamentally 32 bit does not seem that different from e.g.
windows builds - we presumably support these but AFAIK CI does not
test these.


-- 
MST
