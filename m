Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp790574ejs;
        Tue, 9 Jan 2024 19:36:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmV6xGU4Ps/rtOv0MIT+gvp1FXAk7K8gcYT2qI4Ikwz5n52RzPmD+RVaA8SewHqbwRWg5J
X-Received: by 2002:a05:6214:496:b0:67f:27be:51ec with SMTP id pt22-20020a056214049600b0067f27be51ecmr645230qvb.100.1704857788994;
        Tue, 09 Jan 2024 19:36:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704857788; cv=none;
        d=google.com; s=arc-20160816;
        b=X+zykiU5PVHWGMZWd6zhxYkBCvgH6wyKYyfWukYrtFEseukhsVyEm5tkpT+4j91ey/
         kUvQSo406hOMjUG9KeAj8LR8myPuc84ktKPjKy9PiLaDFTDHhOeXfJ7mu7eHklJZQL04
         qUyYQxU+SKB6s4BoWf/PJtuIzlqRN3YBGP0UE0VyH1LUCWWg2eUCtQ8ly5IaN527rKXe
         L2T/MBLMw2rIH0HaFR2KVwpEktQWoG+Aabc8XitDKGUEHQRfkib81QCuryVrQOLiDNyh
         MqSQfkcIiDTgrZWd4nwioEDyXEXXUi+elwcyvu4adTRmFnUlmBZTlae6MYTb66oPLf1G
         BRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Z6wNPZVyTsb6/Il0PjvU4wZq4/+5curYOG/Y/WmD2Kw=;
        fh=2b0EAWi4V4ThSXBgfVAhfFHJgcf0QU7QdXzIMqKhwWQ=;
        b=EScWsIwvr5fEtAAKgkhvwp3murTI8BOc34CT4J1Ow2duoSfkXu+LXr8qsaLWw9iXfP
         f5JLKqs7M8L28wns88IYgMk+6FREjI6U9fQN+RgAkHYbYeoCzyFG/lOtD1RIO5LVL/yJ
         kldS3e/Qo8Tvlhe2rh2FPBRRuPxadTMwag+c5LUOyxlf0iTuGnZezvc40B4BnrFoRUZd
         B9uzFINzqEZRrK7T4zVqwWTbgv8Hdam03san+QpwWgpd9+cTJA/Bd1vCUfQ4YXyBzRfe
         1pj76npdOUC6dn6cXD+m+Cbv3CoEBKeS7dwF1B7sw9xWFUFeo+3SlwlC+s+cjxljAqqG
         18YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZUEbOoxD;
       spf=pass (google.com: domain of peterx@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <peterx@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d17-20020a0ce451000000b006805f61541csi3625465qvm.177.2024.01.09.19.36.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 19:36:28 -0800 (PST)
Received-SPF: pass (google.com: domain of peterx@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZUEbOoxD;
       spf=pass (google.com: domain of peterx@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704857788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z6wNPZVyTsb6/Il0PjvU4wZq4/+5curYOG/Y/WmD2Kw=;
	b=ZUEbOoxDVAAnZFAUqVEiEHlTv001R0UHX3OhsaLkOci6iRjFpog5OEz6i0PjCJdYzn6nEI
	1aOGLUNFsEeQrtPFTpX6YcR4X1oKjT/o0QK5iw7v80mK7fK87ccV8fSESf0KDYqRnYZUzQ
	amVTAecrYfnILc3t6HSwC/7HVoPjwCM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-OIvFTpuhPviXEQGY816wqQ-1; Tue, 09 Jan 2024 22:36:27 -0500
X-MC-Unique: OIvFTpuhPviXEQGY816wqQ-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1d44608e379so5783025ad.1
        for <alex.bennee@linaro.org>; Tue, 09 Jan 2024 19:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704857784; x=1705462584;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6wNPZVyTsb6/Il0PjvU4wZq4/+5curYOG/Y/WmD2Kw=;
        b=hQsUhf6jRP9H4sBBu37SZGbfFxqjt7ARjqfeiJ/cQfi+pD5bzBHG2ZSkHf4e1vc2oH
         UAYGxZNOQqSE/hbmjrhMMBNnzpl/GeSkeN0Sr9ytGXYjsE2o48oRA2dMzu0Ny2HTJboo
         iVhFiqvltiQ9vtbsTHLtdOuVXT0bkqujhiqg6BTAb8qV4tmrlj4Npmoc80tUkA/HNenm
         InEy3ofEpzRzR7VpYSVgCpkbPgHFr9UgGB+Q6BWNUhtTrslysGODUuSHZUjvGnAbgYwI
         +xs6aWXtii1j3RDfJFi/kt5aAcrEaUdpTQfqxA2P/9rVVcy8HAQrTobexQgrUYL94uIp
         xKIQ==
X-Gm-Message-State: AOJu0YzG4Pi43MF6gZpAQbLF7JwsHvBrbcVT3faBSdHmpzKGs6gnlTxP
	AQM6LRJDCznstQ8JIRbwmiIfFcZ47gZaBSh7817zPvoDYa05lbYHlqocGSCHXdTdRnCPiUsPWdC
	fs11ArrpTVYsg42YldRvkFwbO
X-Received: by 2002:a17:902:8a92:b0:1d4:3abc:29e2 with SMTP id p18-20020a1709028a9200b001d43abc29e2mr817094plo.0.1704857784425;
        Tue, 09 Jan 2024 19:36:24 -0800 (PST)
X-Received: by 2002:a17:902:8a92:b0:1d4:3abc:29e2 with SMTP id p18-20020a1709028a9200b001d43abc29e2mr817078plo.0.1704857784094;
        Tue, 09 Jan 2024 19:36:24 -0800 (PST)
Return-Path: <peterx@redhat.com>
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id t10-20020a1709028c8a00b001d1d27259cesm2510389plo.180.2024.01.09.19.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 19:36:23 -0800 (PST)
Date: Wed, 10 Jan 2024 11:36:13 +0800
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
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
Message-ID: <ZZ4Qrfis4XHWGN0j@x1n>
References: <03b969d3-1947-4186-b3ee-15e3cddc5f34@kaod.org>
 <18a38b88-8f20-420c-9916-a03d1b4930a7@linaro.org>
 <38cfa9de-874b-41dd-873e-5ad1f5a5805e@kaod.org>
 <fe4d463f-b646-4b7b-9063-d16ad5dbb128@linaro.org>
 <87y1d6i47m.fsf@suse.de>
 <597186d9-af21-46e8-8075-f21d36c01c07@kaod.org>
 <87plya76cu.fsf@suse.de>
 <d5c0b9fb-8b09-4f68-b3ab-c8adffd484a9@kaod.org>
 <87bk9u8dhs.fsf@suse.de>
 <2fa344b7-ccd2-4e6a-8c32-5ad7e4c960d6@linaro.org>
MIME-Version: 1.0
In-Reply-To: <2fa344b7-ccd2-4e6a-8c32-5ad7e4c960d6@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: Gl81b77EchZm

On Tue, Jan 09, 2024 at 10:22:31PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Fabiano,
> 
> On 9/1/24 21:21, Fabiano Rosas wrote:
> > Cédric Le Goater <clg@kaod.org> writes:
> > 
> > > On 1/9/24 18:40, Fabiano Rosas wrote:
> > > > Cédric Le Goater <clg@kaod.org> writes:
> > > > 
> > > > > On 1/3/24 20:53, Fabiano Rosas wrote:
> > > > > > Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> > > > > > 
> > > > > > > +Peter/Fabiano
> > > > > > > 
> > > > > > > On 2/1/24 17:41, Cédric Le Goater wrote:
> > > > > > > > On 1/2/24 17:15, Philippe Mathieu-Daudé wrote:
> > > > > > > > > Hi Cédric,
> > > > > > > > > 
> > > > > > > > > On 2/1/24 15:55, Cédric Le Goater wrote:
> > > > > > > > > > On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
> > > > > > > > > > > Hi,
> > > > > > > > > > > 
> > > > > > > > > > > When a MPCore cluster is used, the Cortex-A cores belong the the
> > > > > > > > > > > cluster container, not to the board/soc layer. This series move
> > > > > > > > > > > the creation of vCPUs to the MPCore private container.
> > > > > > > > > > > 
> > > > > > > > > > > Doing so we consolidate the QOM model, moving common code in a
> > > > > > > > > > > central place (abstract MPCore parent).
> > > > > > > > > > 
> > > > > > > > > > Changing the QOM hierarchy has an impact on the state of the machine
> > > > > > > > > > and some fixups are then required to maintain migration compatibility.
> > > > > > > > > > This can become a real headache for KVM machines like virt for which
> > > > > > > > > > migration compatibility is a feature, less for emulated ones.
> > > > > > > > > 
> > > > > > > > > All changes are either moving properties (which are not migrated)
> > > > > > > > > or moving non-migrated QOM members (i.e. pointers of ARMCPU, which
> > > > > > > > > is still migrated elsewhere). So I don't see any obvious migration
> > > > > > > > > problem, but I might be missing something, so I Cc'ed Juan :>
> > > > > > 
> > > > > > FWIW, I didn't spot anything problematic either.
> > > > > > 
> > > > > > I've ran this through my migration compatibility series [1] and it
> > > > > > doesn't regress aarch64 migration from/to 8.2. The tests use '-M
> > > > > > virt -cpu max', so the cortex-a7 and cortex-a15 are not covered. I don't
> > > > > > think we even support migration of anything non-KVM on arm.
> > > > > 
> > > > > it happens we do.
> > > > > 
> > > > 
> > > > Oh, sorry, I didn't mean TCG here. Probably meant to say something like
> > > > non-KVM-capable cpus, as in 32-bit. Nevermind.
> > > 
> > > Theoretically, we should be able to migrate to a TCG guest. Well, this
> > > worked in the past for PPC. When I was doing more KVM related changes,
> > > this was very useful for dev. Also, some machines are partially emulated.
> > > Anyhow I agree this is not a strong requirement and we often break it.
> > > Let's focus on KVM only.
> > > 
> > > > > > 1- https://gitlab.com/farosas/qemu/-/jobs/5853599533
> > > > > 
> > > > > yes it depends on the QOM hierarchy and virt seems immune to the changes.
> > > > > Good.
> > > > > 
> > > > > However, changing the QOM topology clearly breaks migration compat,
> > > > 
> > > > Well, "clearly" is relative =) You've mentioned pseries and aspeed
> > > > already, do you have a pointer to one of those cases were we broke
> > > > migration
> > > 
> > > Regarding pseries, migration compat broke because of 5bc8d26de20c
> > > ("spapr: allocate the ICPState object from under sPAPRCPUCore") which
> > > is similar to the changes proposed by this series, it impacts the QOM
> > > hierarchy. Here is the workaround/fix from Greg : 46f7afa37096
> > > ("spapr: fix migration of ICPState objects from/to older QEMU") which
> > > is quite an headache and this turned out to raise another problem some
> > > months ago ... :/ That's why I sent [1] to prepare removal of old
> > > machines and workarounds becoming a burden.
> > 
> > This feels like something that could be handled by the vmstate code
> > somehow. The state is there, just under a different path.
> 
> What, the QOM path is used in migration? ...

Hopefully not..

> 
> See recent discussions on "QOM path stability":
> https://lore.kernel.org/qemu-devel/ZZfYvlmcxBCiaeWE@redhat.com/
> https://lore.kernel.org/qemu-devel/87jzojbxt7.fsf@pond.sub.org/
> https://lore.kernel.org/qemu-devel/87v883by34.fsf@pond.sub.org/

If I read it right, the commit 46f7afa37096 example is pretty special that
the QOM path more or less decided more than the hierachy itself but changes
the existances of objects.

> 
> > No one wants
> > to be policing QOM hierarchy changes in every single series that shows
> > up on the list.
> > 
> > Anyway, thanks for the pointers. I'll study that code a bit more, maybe
> > I can come up with some way to handle these cases.
> > 
> > Hopefully between the analyze-migration test and the compat tests we'll
> > catch the next bug of this kind before it gets merged.

Things like that might be able to be detected via vmstate-static-checker.py.
But I'm not 100% sure, also its coverage is limited.

For example, I don't think it can detect changes to objects that will only
be created dynamically, e.g., I think sometimes we create objects after
some guest behaviors (consider guest enables the device, then QEMU
emulation creates some objects on demand of device setup?), and since the
static checker shouldn't ever start the VM and run any code, they won't
trigger.

-- 
Peter Xu
