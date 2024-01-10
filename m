Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp838675ejs;
        Tue, 9 Jan 2024 22:03:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOcsr/fvkyh9JHLzaknV/OE95lU4ySzUlr3l6cWrw2iDdcFENF+aSgXkSWsM6ZDqTds38b
X-Received: by 2002:a05:6214:1252:b0:681:139e:c40e with SMTP id r18-20020a056214125200b00681139ec40emr802631qvv.54.1704866594199;
        Tue, 09 Jan 2024 22:03:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704866594; cv=none;
        d=google.com; s=arc-20160816;
        b=LE5+ahkJNOcbIDCnjx+X6hJCHpVcN7TZLUyfemtKC6AfKL4yGELrR1ZAFQhvtbixOI
         Htl19p2yDsmiN/wV0PHnU3cwbf90fLG57hYJ9nhr937TzGz5FZzXJhETwLSMvUFynvIC
         dU7S/y56xLYczOSaFSlCSKrJysdsC0kly2MpsqS/LNwQO26ca3VKnnrTX43Z0K6sDDT6
         RduV/NCLvPPh/EU51CRDZvt/0GADb1O4BWqmnWf4An2l0Rz2k7QTZYokbbzILw1Fq3fu
         nIIQMgNZd8A0aNqh1ASamSVd8qDk21Af5G95WJlXn21urr0d6tpbXH4NDcPBPXCHAE12
         TxzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=D5RZoGOKOxGnVXcC9uaDFVLRQMnMpiPtzRtI/UC1ngc=;
        fh=0palERaohtrk3dKTo67kS8UVrnOqMsFpnj3HJaYYSJk=;
        b=ixeoToMxsL71rg+k/KA0sYQdappH8RBu32ky590mZmTfSaytVMVLIEhkU2KqusA/D0
         GS5eRYHz5z9dnqiJojtUvEbhljCHrsUfrAHzRM266Kw8sikz9Xrh9BPr+dgO43uwOA0b
         xQbgYKHSAAxH6QKzjKsuIwB4LHHO9wJ1DZMbbRbhUTqxLKU7JEyRNUNCcNxbTgjyoIdI
         scqrrsIZubAVzfgwgXSK6+p4GDPT93gp6JhUoUoNaWUaaEOJSYos0Wy3n8Z9/s5x/awl
         Hjt84yGTBhzLpRb2mMIeK2+MwWzOfu3TuWgC2BDCE4Suw61KOAR7GMYYT7fEXeByg2Fw
         donQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C7LqJXBr;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id g13-20020a0cf08d000000b0067aa3dc3f68si3853712qvk.193.2024.01.09.22.03.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 22:03:14 -0800 (PST)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C7LqJXBr;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704866593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D5RZoGOKOxGnVXcC9uaDFVLRQMnMpiPtzRtI/UC1ngc=;
	b=C7LqJXBrnDiTxevOWcrthPru1JDoiapZCNfXYV4koZ2A+jFRiAuIDuImC5zNjq70EOQMUm
	xFJrHLOg/OKi6TvNiG91EyV65ZiVV+tRewWFMcYVFrB8YdQrFTBts1ZvK72W9dsiw8JM43
	MvSx/e2IgRzrzUVLoM01Yyox3f2nREM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-204-I1FjNc2gO_6ovNOLKohGaA-1; Wed,
 10 Jan 2024 01:03:10 -0500
X-MC-Unique: I1FjNc2gO_6ovNOLKohGaA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E7BB3C025C5;
	Wed, 10 Jan 2024 06:03:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15EDA51E3;
	Wed, 10 Jan 2024 06:03:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 067DC21E6682; Wed, 10 Jan 2024 07:03:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Fabiano
 Rosas
 <farosas@suse.de>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
  qemu-devel@nongnu.org,  Markus Armbruster <armbru@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,
  Tyrone Ting <kfting@nuvoton.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
  Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,  Eduardo Habkost
 <eduardo@habkost.net>,  Joel Stanley <joel@jms.id.au>,  Alistair Francis
 <alistair@alistair23.me>,  Anton Johansson <anjo@rev.ng>,  Andrey Smirnov
 <andrew.smirnov@gmail.com>,  Peter Maydell <peter.maydell@linaro.org>,
  Hao Wu <wuhaotsh@google.com>,  Jean-Christophe Dubois
 <jcd@tribudubois.net>,  Igor Mitsyanko <i.mitsyanko@gmail.com>,  "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Rob Herring <robh@kernel.org>,
  qemu-arm@nongnu.org,  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 00/33] hw/cpu/arm: Remove one use of qemu_get_cpu() in
 A7/A15 MPCore priv
In-Reply-To: <ZZ4Qrfis4XHWGN0j@x1n> (Peter Xu's message of "Wed, 10 Jan 2024
	11:36:13 +0800")
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
	<ZZ4Qrfis4XHWGN0j@x1n>
Date: Wed, 10 Jan 2024 07:03:06 +0100
Message-ID: <87cyu9hgit.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-TUID: mX0ZHKZuMPpF

Peter Xu <peterx@redhat.com> writes:

> On Tue, Jan 09, 2024 at 10:22:31PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> Hi Fabiano,
>>=20
>> On 9/1/24 21:21, Fabiano Rosas wrote:
>> > C=C3=A9dric Le Goater <clg@kaod.org> writes:
>> >=20
>> > > On 1/9/24 18:40, Fabiano Rosas wrote:
>> > > > C=C3=A9dric Le Goater <clg@kaod.org> writes:
>> > > >=20
>> > > > > On 1/3/24 20:53, Fabiano Rosas wrote:
>> > > > > > Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>> > > > > >=20
>> > > > > > > +Peter/Fabiano
>> > > > > > >=20
>> > > > > > > On 2/1/24 17:41, C=C3=A9dric Le Goater wrote:
>> > > > > > > > On 1/2/24 17:15, Philippe Mathieu-Daud=C3=A9 wrote:
>> > > > > > > > > Hi C=C3=A9dric,
>> > > > > > > > >=20
>> > > > > > > > > On 2/1/24 15:55, C=C3=A9dric Le Goater wrote:
>> > > > > > > > > > On 12/12/23 17:29, Philippe Mathieu-Daud=C3=A9 wrote:
>> > > > > > > > > > > Hi,
>> > > > > > > > > > >=20
>> > > > > > > > > > > When a MPCore cluster is used, the Cortex-A cores be=
long the the
>> > > > > > > > > > > cluster container, not to the board/soc layer. This =
series move
>> > > > > > > > > > > the creation of vCPUs to the MPCore private containe=
r.
>> > > > > > > > > > >=20
>> > > > > > > > > > > Doing so we consolidate the QOM model, moving common=
 code in a
>> > > > > > > > > > > central place (abstract MPCore parent).
>> > > > > > > > > >=20
>> > > > > > > > > > Changing the QOM hierarchy has an impact on the state =
of the machine
>> > > > > > > > > > and some fixups are then required to maintain migratio=
n compatibility.
>> > > > > > > > > > This can become a real headache for KVM machines like =
virt for which
>> > > > > > > > > > migration compatibility is a feature, less for emulate=
d ones.
>> > > > > > > > >=20
>> > > > > > > > > All changes are either moving properties (which are not =
migrated)
>> > > > > > > > > or moving non-migrated QOM members (i.e. pointers of ARM=
CPU, which
>> > > > > > > > > is still migrated elsewhere). So I don't see any obvious=
 migration
>> > > > > > > > > problem, but I might be missing something, so I Cc'ed Ju=
an :>
>> > > > > >=20
>> > > > > > FWIW, I didn't spot anything problematic either.
>> > > > > >=20
>> > > > > > I've ran this through my migration compatibility series [1] an=
d it
>> > > > > > doesn't regress aarch64 migration from/to 8.2. The tests use '=
-M
>> > > > > > virt -cpu max', so the cortex-a7 and cortex-a15 are not covere=
d. I don't
>> > > > > > think we even support migration of anything non-KVM on arm.
>> > > > >=20
>> > > > > it happens we do.
>> > > > >=20
>> > > >=20
>> > > > Oh, sorry, I didn't mean TCG here. Probably meant to say something=
 like
>> > > > non-KVM-capable cpus, as in 32-bit. Nevermind.
>> > >=20
>> > > Theoretically, we should be able to migrate to a TCG guest. Well, th=
is
>> > > worked in the past for PPC. When I was doing more KVM related change=
s,
>> > > this was very useful for dev. Also, some machines are partially emul=
ated.
>> > > Anyhow I agree this is not a strong requirement and we often break i=
t.
>> > > Let's focus on KVM only.
>> > >=20
>> > > > > > 1- https://gitlab.com/farosas/qemu/-/jobs/5853599533
>> > > > >=20
>> > > > > yes it depends on the QOM hierarchy and virt seems immune to the=
 changes.
>> > > > > Good.
>> > > > >=20
>> > > > > However, changing the QOM topology clearly breaks migration comp=
at,
>> > > >=20
>> > > > Well, "clearly" is relative =3D) You've mentioned pseries and aspe=
ed
>> > > > already, do you have a pointer to one of those cases were we broke
>> > > > migration
>> > >=20
>> > > Regarding pseries, migration compat broke because of 5bc8d26de20c
>> > > ("spapr: allocate the ICPState object from under sPAPRCPUCore") which
>> > > is similar to the changes proposed by this series, it impacts the QOM
>> > > hierarchy. Here is the workaround/fix from Greg : 46f7afa37096
>> > > ("spapr: fix migration of ICPState objects from/to older QEMU") which
>> > > is quite an headache and this turned out to raise another problem so=
me
>> > > months ago ... :/ That's why I sent [1] to prepare removal of old
>> > > machines and workarounds becoming a burden.
>> >=20
>> > This feels like something that could be handled by the vmstate code
>> > somehow. The state is there, just under a different path.
>>=20
>> What, the QOM path is used in migration? ...
>
> Hopefully not..
>
>>=20
>> See recent discussions on "QOM path stability":
>> https://lore.kernel.org/qemu-devel/ZZfYvlmcxBCiaeWE@redhat.com/
>> https://lore.kernel.org/qemu-devel/87jzojbxt7.fsf@pond.sub.org/
>> https://lore.kernel.org/qemu-devel/87v883by34.fsf@pond.sub.org/
>
> If I read it right, the commit 46f7afa37096 example is pretty special that
> the QOM path more or less decided more than the hierachy itself but chang=
es
> the existances of objects.

Let's see whether I got this...

We removed some useless objects, moved the useful ones to another home.
The move changed their QOM path.

The problem was the removal of useless objects, because this also
removed their vmstate.

The fix was adding the vmstate back as a dummy.

The QOM patch changes are *not* part of the problem.

Correct?

>> > No one wants
>> > to be policing QOM hierarchy changes in every single series that shows
>> > up on the list.
>> >=20
>> > Anyway, thanks for the pointers. I'll study that code a bit more, maybe
>> > I can come up with some way to handle these cases.
>> >=20
>> > Hopefully between the analyze-migration test and the compat tests we'll
>> > catch the next bug of this kind before it gets merged.
>
> Things like that might be able to be detected via vmstate-static-checker.=
py.
> But I'm not 100% sure, also its coverage is limited.
>
> For example, I don't think it can detect changes to objects that will only
> be created dynamically, e.g., I think sometimes we create objects after
> some guest behaviors (consider guest enables the device, then QEMU
> emulation creates some objects on demand of device setup?),

Feels nuts to me.

In real hardware, software enabling a device that is disabled by default
doesn't create the device.  The device is always there, it just happens
to be inactive unless enabled.  We should model the device just like
that.

>                                                             and since the
> static checker shouldn't ever start the VM and run any code, they won't
> trigger.
