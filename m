Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp756941njc;
        Tue, 25 Jun 2024 12:15:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNGKuTGl3Hln38R63XazUkASEId56HVxbZlXn0LpQf4gurvccFAEkhb6K5vK5NXf6MMW3jTNxmhfVj92rh1pvpUpS1hM7A
X-Google-Smtp-Source: AGHT+IH8f6/xjA/2ZpGNYRvVPQTEElq3ElS5h8dtJrbXIk9SNqlcb7W49gnSnYSV0eV8dtkKqui2
X-Received: by 2002:ad4:46d0:0:b0:6b2:bb66:14b3 with SMTP id 6a1803df08f44-6b5409ff69bmr84664076d6.38.1719342924922;
        Tue, 25 Jun 2024 12:15:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719342924; cv=none;
        d=google.com; s=arc-20160816;
        b=Ysi8dfLFjHS87csipXdHfwuJQEw+CQk8uBNShJt2p2gAky0dqyP+LDP0b/G1StWuin
         A8FL4jHZjZdxeEaHFMeqm1dXIL02Xs73nPt3eIy/OoPPoIvfknMFA8mEvv+H/3Jur7Qc
         +EjusM9/O3sRF7icCUIvnnVEGtSICllokz5f6+TkFwHrua0wwSk/3+qhabzbGxHUciex
         FLlNRykT79txbZhXhLSTv4dsOFxyqpAad+nTlk7WFLTsawyLfxpCnEMgKg0BnivgC3qg
         Kl7Xw5vZ4+rmhSGNhfiCOk484QtcjRr4JUahCxGc6egAYAnnBNxByRfmeiBePaQ9GKxq
         hAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=AEQjQ8J55hwIzfmoesWqLHpIacoHUj34dmwhha0SGcM=;
        fh=3cXxdQKoZhni0UxukzlZbxnOG4flaMRxOzid+2/JeEU=;
        b=JHFgUryTIlnKXJfeSLe29L71qz2jsyT2G6yjI4NPQiRz5EXYvq9ToxFvP5Zi5HYlrn
         dKfXuz+wLDtTsfvQe0mSwWJFp4tnAlcxdXI4YijCYsEcSt4ns1gY+NG1NxMoO+bAvjh/
         2BirW9FzVBziBRVsn7BDzrLwP76jTdi83zLvbRQTgvI0qTs7z06aJiEwSz5uyvaNOT4o
         WudcP8qIlkPOmNT5Z4PCadBM3G/jZx6WDsgng5v5krq4AAIykrUDU15eKGFcQw+1IXW/
         VhLv9GOGc6ua0SPPQs/4dWVw/276vxicc2la85loYihfLyx4GKExm1tEj7EMB3P3W0Mj
         xkrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="DZF/3dmZ";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b525d89d53si99671636d6.508.2024.06.25.12.15.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 12:15:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="DZF/3dmZ";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719342924;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=AEQjQ8J55hwIzfmoesWqLHpIacoHUj34dmwhha0SGcM=;
	b=DZF/3dmZlA84KrurUbZBRkGPZLw2Befmgr2Gpiv7pc0D5yBDXdp4ax4jZTYU9sTlJXfygG
	sgcnXg/3EBrHlbogyGkxmYtWQabvyyT/9UYTZCIxcDz0qxMba7Z+U3yhEx+xSkfvT2vZQF
	0F6wPxeHWey924Fk9DzCuTW+EFQzuuM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-576-8qYm6tRuOymG68ScYeRX6A-1; Tue,
 25 Jun 2024 15:15:21 -0400
X-MC-Unique: 8qYm6tRuOymG68ScYeRX6A-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1749E19560AE;
	Tue, 25 Jun 2024 19:15:17 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.31])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2BD891956050;
	Tue, 25 Jun 2024 19:15:10 +0000 (UTC)
Date: Tue, 25 Jun 2024 20:15:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	rowan.hart@intel.com,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org
Subject: Re: [RFC PATCH v3 5/5] DO NOT MERGE: replace TYPE_PL011 with
 x-pl011-rust in arm virt machine
Message-ID: <ZnsXOyYJAlae1Ito@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <rust-pl011-rfc-v3.git.manos.pitsidianakis@linaro.org>
 <229703c7f4394691f254b02c012ee0d7dcf57afb.1718827153.git.manos.pitsidianakis@linaro.org>
 <Znrt77XOc2YBNZyM@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Znrt77XOc2YBNZyM@intel.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: FEjaUH9AsDOJ

On Wed, Jun 26, 2024 at 12:18:55AM +0800, Zhao Liu wrote:
> Hi Manos,
> 
> On Wed, Jun 19, 2024 at 11:14:02PM +0300, Manos Pitsidianakis wrote:
> > Date: Wed, 19 Jun 2024 23:14:02 +0300
> > From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> > Subject: [RFC PATCH v3 5/5] DO NOT MERGE: replace TYPE_PL011 with
> >  x-pl011-rust in arm virt machine
> > X-Mailer: git-send-email 2.44.0
> > 
> > Convenience patch for testing the rust device.
> > 
> > Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> > ---
> >  hw/arm/virt.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 3c93c0c0a6..f33b58ae0d 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -912,7 +912,11 @@ static void create_uart(const VirtMachineState *vms, int uart,
> >      int irq = vms->irqmap[uart];
> >      const char compat[] = "arm,pl011\0arm,primecell";
> >      const char clocknames[] = "uartclk\0apb_pclk";
> > +#ifdef CONFIG_WITH_RUST
> > +    DeviceState *dev = qdev_new("x-pl011-rust");
> > +#else
> >      DeviceState *dev = qdev_new(TYPE_PL011);
> > +#endif
> >      SysBusDevice *s = SYS_BUS_DEVICE(dev);
> >      MachineState *ms = MACHINE(vms);
> >
> 
> I realized that if we want to merge the rust pl011 device, then this
> patch or similar enablement support is necessary, otherwise, the rust
> code is only used for compilation and cannot actually be run...
> 
> This is also an open for the devices that are rewrite in Rust.
> 
> I think there should be an option for the user to choose whether to
> enable pl011 in C or pl011 in Rust. What do you think?
> 
> Perhaps the easiest way to enable rust pl011 is to add an option for
> virt machine... But that's certainly not a long-term approach. I think
> the ideal way would be to allow rust pl011 to be specified in the
> command line via -device, but this approach would mean allowing the
> user to create pl011 and would require changes to the current buildin
> pl011's creation logic.

While having both impls present is reasonable for the RFC, IMHO, if
we're to merge this, then the Rust impl of pl011 should fully replace
the C impl. Maintaining 2 different impls of the same device in
parallel is highly undesirable. This would of course impl that the
Rust impls needs to be a feature match for the existing impl. If we
do a full replacement, then the question of how the user chooses
between the 2 impls is then entirely avoided.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
