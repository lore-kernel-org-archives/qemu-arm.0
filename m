Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp847039ejs;
        Tue, 9 Jan 2024 22:26:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFM5k4tv/ToqZGz+Uz59tGpaKbpWQsCOD0Pjn4e7nH0/zNGNED0O/y+kAHPa5UaBzzuGxhr
X-Received: by 2002:ac8:7d49:0:b0:427:edba:238 with SMTP id h9-20020ac87d49000000b00427edba0238mr653068qtb.76.1704868005689;
        Tue, 09 Jan 2024 22:26:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704868005; cv=none;
        d=google.com; s=arc-20160816;
        b=IJVSh51wIO22Hg0SKuGAM9AGxy8UZRfBRu+tl9r0pFVylETNcYsGkwtK79Uq13RjDq
         n/BxUDX80RTIYE4TSNZG0gM7RRYn+X+MYrK7eEihRut3Z2wH8R6iTEdiCqX129dBSG47
         6g2sNh89lKKjh9bpUY4QTwOFv90lIM7jISKGCRB2IalxQYQh66ZntxVrI2g8tJ/YGCBu
         q02WjT+Zztud1XtlbvqF7OzuI9HTeS4c1xYHBZsnPNn1LohHzmJRdFi1nUiz0w50OzJN
         nuDEvj1V+Aeok/PENhLUHi4J8FeyxBUviQ45eqsZfQLBxOM0dF/HrDJULnJyeaiNH1Dc
         DsVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=GSBkUcgNCSBjY6U3vHPbVrlY0wCbao82Fb5YTqfAByI=;
        fh=Kis5pzYxYX9ZASkT8rajCHfSMMnzBjKVV/vODd71G44=;
        b=bB12CUl8fp1j2PoRcfNyJBmVZAf88AzYSyP639/NJ23XGpcyhOePkHOwj9OoBiB8OS
         E/iaSjd7f6qMdHNc+vlCsilnihDRDD88P7B5BWmDgLB3H5Ee+rv6ywxf0pd9arTl2kKg
         FcPcS0Ve22GOYsToRn/McXnZgcgKlK/I0OPzQwNVt7Nr+ih0niDB22STah89TeeekvFp
         HLmTfvjUT4WKFQ/VJU5q02Y2Nn/gxJ1u/exJfrgIROvbSLXakkSErX1/MHwg0kLf98Tg
         0tkhp3wMRPVCv5w6FWgJ2a7XDOqAKlIGIkOGm3wmORqQdWAru8Rx6lQTr0LYlieZyGf8
         n5uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UAXDP8CK;
       spf=pass (google.com: domain of peterx@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <peterx@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id o19-20020a05622a045300b0042994f3d55asi3537342qtx.611.2024.01.09.22.26.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 22:26:45 -0800 (PST)
Received-SPF: pass (google.com: domain of peterx@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UAXDP8CK;
       spf=pass (google.com: domain of peterx@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704868005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GSBkUcgNCSBjY6U3vHPbVrlY0wCbao82Fb5YTqfAByI=;
	b=UAXDP8CKQHMEZ5IPeEnBkpbniz613iT6sbiQtIfr84UvuBfRYD6gwajhGfxBjFU+82OWup
	b863rs+2XGlmmzzWOtIc/Lm4LphT93IKqBmvd3dCEKcOuLr2X0FZ+mU4lccKDF70IXi8Vc
	8D0cHtlTbtElwQm3+tb14eRTBQEnmO4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-6TM80AZiNZeyOr6uz0BiCg-1; Wed, 10 Jan 2024 01:26:39 -0500
X-MC-Unique: 6TM80AZiNZeyOr6uz0BiCg-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-28b62a4d139so1027147a91.0
        for <alex.bennee@linaro.org>; Tue, 09 Jan 2024 22:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704867997; x=1705472797;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSBkUcgNCSBjY6U3vHPbVrlY0wCbao82Fb5YTqfAByI=;
        b=RS5xG8ODN9e4/cySX9dvmUqIIr18RLUhUAkvNchrcQMG8Elu1tCWCPfHmG8+WJwTZY
         UGcumz11vseaztW07OJJ/gxWSTpwqaBtprgVu63rTP3LY2cqaeUtXbznk60ebqmsk2dH
         frEhIE/EnJjtMOBBWOYeO3aI0ctZIMNY1xHlzCMdV2IFHsxL+4uR+2FJZN60GsbjtgrS
         EAkpgwIkz9I9xWoWKOjAgo9NWmalzaV9oJ8jr5gqSWaX3BW8gUXV1tiA1+pVHe6Dn6zU
         f5cseaCZgJNglMW2CbKof5MnnTCpgXZieA/dCy/GbBiXixxtum6/bQPHfUZ8GVP4EjYr
         9sfw==
X-Gm-Message-State: AOJu0Ywn9vTePHEQrOrNY7Oacv1LIoq4TzxGIrqvjdbU+vomwRKwbHq0
	zORDrAQRImVCZ7p/m1dWBbHwqxtZrO81aMURxee576I5oJk4eOQK7yCBfCL235kKjCnmTpdE+b2
	zIbpSN4SzgVEqsH3MYEBcSRa5
X-Received: by 2002:a17:902:8a92:b0:1d4:3abc:29e2 with SMTP id p18-20020a1709028a9200b001d43abc29e2mr1086800plo.0.1704867997122;
        Tue, 09 Jan 2024 22:26:37 -0800 (PST)
X-Received: by 2002:a17:902:8a92:b0:1d4:3abc:29e2 with SMTP id p18-20020a1709028a9200b001d43abc29e2mr1086783plo.0.1704867996745;
        Tue, 09 Jan 2024 22:26:36 -0800 (PST)
Return-Path: <peterx@redhat.com>
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id w7-20020a1709029a8700b001d56f8f0e10sm551756plp.26.2024.01.09.22.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 22:26:36 -0800 (PST)
Date: Wed, 10 Jan 2024 14:26:17 +0800
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	qemu-devel@nongnu.org,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 00/33] hw/cpu/arm: Remove one use of qemu_get_cpu() in
 A7/A15 MPCore priv
Message-ID: <ZZ44iQRPrdDpfov7@x1n>
References: <38cfa9de-874b-41dd-873e-5ad1f5a5805e@kaod.org>
 <fe4d463f-b646-4b7b-9063-d16ad5dbb128@linaro.org>
 <87y1d6i47m.fsf@suse.de>
 <597186d9-af21-46e8-8075-f21d36c01c07@kaod.org>
 <87plya76cu.fsf@suse.de>
 <d5c0b9fb-8b09-4f68-b3ab-c8adffd484a9@kaod.org>
 <87bk9u8dhs.fsf@suse.de>
 <2fa344b7-ccd2-4e6a-8c32-5ad7e4c960d6@linaro.org>
 <ZZ4Qrfis4XHWGN0j@x1n>
 <87cyu9hgit.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87cyu9hgit.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: 4eVa+tURyrxu

On Wed, Jan 10, 2024 at 07:03:06AM +0100, Markus Armbruster wrote:
> Peter Xu <peterx@redhat.com> writes:
> 
> > On Tue, Jan 09, 2024 at 10:22:31PM +0100, Philippe Mathieu-Daudé wrote:
> >> Hi Fabiano,
> >> 
> >> On 9/1/24 21:21, Fabiano Rosas wrote:
> >> > Cédric Le Goater <clg@kaod.org> writes:
> >> > 
> >> > > On 1/9/24 18:40, Fabiano Rosas wrote:
> >> > > > Cédric Le Goater <clg@kaod.org> writes:
> >> > > > 
> >> > > > > On 1/3/24 20:53, Fabiano Rosas wrote:
> >> > > > > > Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> >> > > > > > 
> >> > > > > > > +Peter/Fabiano
> >> > > > > > > 
> >> > > > > > > On 2/1/24 17:41, Cédric Le Goater wrote:
> >> > > > > > > > On 1/2/24 17:15, Philippe Mathieu-Daudé wrote:
> >> > > > > > > > > Hi Cédric,
> >> > > > > > > > > 
> >> > > > > > > > > On 2/1/24 15:55, Cédric Le Goater wrote:
> >> > > > > > > > > > On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
> >> > > > > > > > > > > Hi,
> >> > > > > > > > > > > 
> >> > > > > > > > > > > When a MPCore cluster is used, the Cortex-A cores belong the the
> >> > > > > > > > > > > cluster container, not to the board/soc layer. This series move
> >> > > > > > > > > > > the creation of vCPUs to the MPCore private container.
> >> > > > > > > > > > > 
> >> > > > > > > > > > > Doing so we consolidate the QOM model, moving common code in a
> >> > > > > > > > > > > central place (abstract MPCore parent).
> >> > > > > > > > > > 
> >> > > > > > > > > > Changing the QOM hierarchy has an impact on the state of the machine
> >> > > > > > > > > > and some fixups are then required to maintain migration compatibility.
> >> > > > > > > > > > This can become a real headache for KVM machines like virt for which
> >> > > > > > > > > > migration compatibility is a feature, less for emulated ones.
> >> > > > > > > > > 
> >> > > > > > > > > All changes are either moving properties (which are not migrated)
> >> > > > > > > > > or moving non-migrated QOM members (i.e. pointers of ARMCPU, which
> >> > > > > > > > > is still migrated elsewhere). So I don't see any obvious migration
> >> > > > > > > > > problem, but I might be missing something, so I Cc'ed Juan :>
> >> > > > > > 
> >> > > > > > FWIW, I didn't spot anything problematic either.
> >> > > > > > 
> >> > > > > > I've ran this through my migration compatibility series [1] and it
> >> > > > > > doesn't regress aarch64 migration from/to 8.2. The tests use '-M
> >> > > > > > virt -cpu max', so the cortex-a7 and cortex-a15 are not covered. I don't
> >> > > > > > think we even support migration of anything non-KVM on arm.
> >> > > > > 
> >> > > > > it happens we do.
> >> > > > > 
> >> > > > 
> >> > > > Oh, sorry, I didn't mean TCG here. Probably meant to say something like
> >> > > > non-KVM-capable cpus, as in 32-bit. Nevermind.
> >> > > 
> >> > > Theoretically, we should be able to migrate to a TCG guest. Well, this
> >> > > worked in the past for PPC. When I was doing more KVM related changes,
> >> > > this was very useful for dev. Also, some machines are partially emulated.
> >> > > Anyhow I agree this is not a strong requirement and we often break it.
> >> > > Let's focus on KVM only.
> >> > > 
> >> > > > > > 1- https://gitlab.com/farosas/qemu/-/jobs/5853599533
> >> > > > > 
> >> > > > > yes it depends on the QOM hierarchy and virt seems immune to the changes.
> >> > > > > Good.
> >> > > > > 
> >> > > > > However, changing the QOM topology clearly breaks migration compat,
> >> > > > 
> >> > > > Well, "clearly" is relative =) You've mentioned pseries and aspeed
> >> > > > already, do you have a pointer to one of those cases were we broke
> >> > > > migration
> >> > > 
> >> > > Regarding pseries, migration compat broke because of 5bc8d26de20c
> >> > > ("spapr: allocate the ICPState object from under sPAPRCPUCore") which
> >> > > is similar to the changes proposed by this series, it impacts the QOM
> >> > > hierarchy. Here is the workaround/fix from Greg : 46f7afa37096
> >> > > ("spapr: fix migration of ICPState objects from/to older QEMU") which
> >> > > is quite an headache and this turned out to raise another problem some
> >> > > months ago ... :/ That's why I sent [1] to prepare removal of old
> >> > > machines and workarounds becoming a burden.
> >> > 
> >> > This feels like something that could be handled by the vmstate code
> >> > somehow. The state is there, just under a different path.
> >> 
> >> What, the QOM path is used in migration? ...
> >
> > Hopefully not..
> >
> >> 
> >> See recent discussions on "QOM path stability":
> >> https://lore.kernel.org/qemu-devel/ZZfYvlmcxBCiaeWE@redhat.com/
> >> https://lore.kernel.org/qemu-devel/87jzojbxt7.fsf@pond.sub.org/
> >> https://lore.kernel.org/qemu-devel/87v883by34.fsf@pond.sub.org/
> >
> > If I read it right, the commit 46f7afa37096 example is pretty special that
> > the QOM path more or less decided more than the hierachy itself but changes
> > the existances of objects.
> 
> Let's see whether I got this...
> 
> We removed some useless objects, moved the useful ones to another home.
> The move changed their QOM path.
> 
> The problem was the removal of useless objects, because this also
> removed their vmstate.
> 
> The fix was adding the vmstate back as a dummy.
> 
> The QOM patch changes are *not* part of the problem.
> 
> Correct?

[I'd leave this to Cedric]

> 
> >> > No one wants
> >> > to be policing QOM hierarchy changes in every single series that shows
> >> > up on the list.
> >> > 
> >> > Anyway, thanks for the pointers. I'll study that code a bit more, maybe
> >> > I can come up with some way to handle these cases.
> >> > 
> >> > Hopefully between the analyze-migration test and the compat tests we'll
> >> > catch the next bug of this kind before it gets merged.
> >
> > Things like that might be able to be detected via vmstate-static-checker.py.
> > But I'm not 100% sure, also its coverage is limited.
> >
> > For example, I don't think it can detect changes to objects that will only
> > be created dynamically, e.g., I think sometimes we create objects after
> > some guest behaviors (consider guest enables the device, then QEMU
> > emulation creates some objects on demand of device setup?),
> 
> Feels nuts to me.
> 
> In real hardware, software enabling a device that is disabled by default
> doesn't create the device.  The device is always there, it just happens
> to be inactive unless enabled.  We should model the device just like
> that.

It doesn't need to be the device itself to be dynamically created, but some
other sub-objects that do not require to exist until the device is enabled,
or some specific function of that device is enabled.  It is logically doable.

Is the example Cedric provided looks like some case like this?  I am not
sure, that's also why I'm not sure the static checker would work here.  But
logically it seems possible, e.g. with migration VMSD needed() facilities.
Consider a device has a sub-function that requires a sub-object.  It may
not need to migrate that object if that sub-feature is not even enabled.
If that object is very large, it might be wise to do so if possible to not
send chunks of junk during the VM downtime.

But then after a 2nd thought I do agree it's probably not sensible, because
even if the src may know whether the sub-object will be needed, there's
probably no good way for the dest QEMU to know.  It can only know in
something like a post_load() hook, but logically that can happen only after
a full load of that device state, so might already be too late.

Thanks,

-- 
Peter Xu
