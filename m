Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1044946ejs;
        Wed, 10 Jan 2024 05:55:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeCenyKpDSXJcBkgrQdpODI27AalBQHR71GAC1z5vp2V66KPuQF46a96hCIQmjE1gD4Meu
X-Received: by 2002:ad4:5beb:0:b0:680:f9a2:4c3e with SMTP id k11-20020ad45beb000000b00680f9a24c3emr1344522qvc.38.1704894900895;
        Wed, 10 Jan 2024 05:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704894900; cv=none;
        d=google.com; s=arc-20160816;
        b=Fa0tYCM7fVYaJM0nFGs2F6aW6iw+DvAQZDWwCBNJFMqnQwdvCzRrAvEm3uF2qD8raN
         dOxk9HMtAUzo2+fTrMsqEVzIJtjEoPMEcLeW+HAGUERRoB2/sLB5NeIwpdkuuIBURqzp
         6mZKCiicGuGqDPyVy6Jel7ykaG0vBL194zukNsT358KVBawU2uiZalhHdM96K9qVWLai
         jsryevhXdoycg4W/tJFyACJ179DLxzQOBXORPXRMCMfK0vWYbPpagJctGqTQszaXx4ze
         pLglsqB0Gz3o2gX/GfUfVCck9VOOPyJ+pJDjQoKG1MYVR8/odfyj5BjWPY3dDD4zIbFg
         iNZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=wk07C0QrNxbfu+ZfQjNe5NGRfyFgkwnr48d1D4Mxe+E=;
        fh=aS4USwmi6JJv1Gf+5YdjwDcgBBw+2I1IGrvxAdiP+Dk=;
        b=OICbOnilPQPTrQ2gi01ImHiDmFzkA6nYKDsnGSXM9rPURIlZ/Z4UQzV0swJxGIPesW
         EMT+qYtJSlCzRBFAfifRBKOcTMmhQRiae1wgfL3n+cOh1vgeMDwH5CxZ3oTlgOvOWzBp
         4ZAG0e6956yRs1mx/rHRy+yxJUN4kXfFZeLcxLPTl1mAeNLddiqyHEtL3Ucdyy4yI6Mq
         CIMEAxV7C0+wnmq/43/3XFIpHHh9qhHaAcm45BxMMCWcrB+H6FHB/irnQCaN33ppw+ki
         nodsZVXUEQv6WjVabWgEAFosNf7lK1tFXPHX16mB0sumjLY0YnEzjLEkHnJqF1P6KDt1
         cJow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QkZ7wIlS;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id j3-20020a0c9cc3000000b0068061339975si4261275qvf.286.2024.01.10.05.55.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 05:55:00 -0800 (PST)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QkZ7wIlS;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704894900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wk07C0QrNxbfu+ZfQjNe5NGRfyFgkwnr48d1D4Mxe+E=;
	b=QkZ7wIlS1+RoyCsI71yNLsVCnK5XfDELy/8+babW1tfZ8CTMNhL89C23FYoflSGEYR+JeJ
	WXIbMGaqTCPF/SKJk+QxwfGWKYB6U58Ga6h3Zr/MHnrljKzHmaGPoS4lrlouB52RCt5y0a
	uQ7eHsw3sBf60DUCHERTzF73IU7LAlw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-428-1g23w-L4NHqNyLTHE1BtLA-1; Wed,
 10 Jan 2024 08:54:57 -0500
X-MC-Unique: 1g23w-L4NHqNyLTHE1BtLA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BFC01C05149;
	Wed, 10 Jan 2024 13:54:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C3E0C15880;
	Wed, 10 Jan 2024 13:54:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 92EE321E6682; Wed, 10 Jan 2024 14:54:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: Peter Xu <peterx@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
  qemu-devel@nongnu.org,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Tyrone Ting <kfting@nuvoton.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,  Eduardo Habkost <eduardo@habkost.net>,
  Joel Stanley <joel@jms.id.au>,  Alistair Francis
 <alistair@alistair23.me>,  Anton Johansson <anjo@rev.ng>,  Andrey Smirnov
 <andrew.smirnov@gmail.com>,  Peter Maydell <peter.maydell@linaro.org>,
  Hao Wu <wuhaotsh@google.com>,  Jean-Christophe Dubois
 <jcd@tribudubois.net>,  Igor Mitsyanko <i.mitsyanko@gmail.com>,  "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Rob Herring <robh@kernel.org>,
  qemu-arm@nongnu.org,  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 00/33] hw/cpu/arm: Remove one use of qemu_get_cpu() in
 A7/A15 MPCore priv
In-Reply-To: <874jfl8gwf.fsf@suse.de> (Fabiano Rosas's message of "Wed, 10 Jan
	2024 10:19:44 -0300")
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
	<ZZ4Qrfis4XHWGN0j@x1n> <87cyu9hgit.fsf@pond.sub.org>
	<874jfl8gwf.fsf@suse.de>
Date: Wed, 10 Jan 2024 14:54:53 +0100
Message-ID: <87v88170pe.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-TUID: jJEqiUxhSsha

Fabiano Rosas <farosas@suse.de> writes:

> Markus Armbruster <armbru@redhat.com> writes:
>
>> Peter Xu <peterx@redhat.com> writes:
>>
>>> On Tue, Jan 09, 2024 at 10:22:31PM +0100, Philippe Mathieu-Daud=C3=A9 w=
rote:
>>>> Hi Fabiano,
>>>>=20
>>>> On 9/1/24 21:21, Fabiano Rosas wrote:
>>>> > C=C3=A9dric Le Goater <clg@kaod.org> writes:
>>>> >=20
>>>> > > On 1/9/24 18:40, Fabiano Rosas wrote:
>>>> > > > C=C3=A9dric Le Goater <clg@kaod.org> writes:
>>>> > > >=20
>>>> > > > > On 1/3/24 20:53, Fabiano Rosas wrote:
>>>> > > > > > Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>>> > > > > >=20
>>>> > > > > > > +Peter/Fabiano
>>>> > > > > > >=20
>>>> > > > > > > On 2/1/24 17:41, C=C3=A9dric Le Goater wrote:
>>>> > > > > > > > On 1/2/24 17:15, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> > > > > > > > > Hi C=C3=A9dric,
>>>> > > > > > > > >=20
>>>> > > > > > > > > On 2/1/24 15:55, C=C3=A9dric Le Goater wrote:
>>>> > > > > > > > > > On 12/12/23 17:29, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> > > > > > > > > > > Hi,
>>>> > > > > > > > > > >=20
>>>> > > > > > > > > > > When a MPCore cluster is used, the Cortex-A cores =
belong the the
>>>> > > > > > > > > > > cluster container, not to the board/soc layer. Thi=
s series move
>>>> > > > > > > > > > > the creation of vCPUs to the MPCore private contai=
ner.
>>>> > > > > > > > > > >=20
>>>> > > > > > > > > > > Doing so we consolidate the QOM model, moving comm=
on code in a
>>>> > > > > > > > > > > central place (abstract MPCore parent).
>>>> > > > > > > > > >=20
>>>> > > > > > > > > > Changing the QOM hierarchy has an impact on the stat=
e of the machine
>>>> > > > > > > > > > and some fixups are then required to maintain migrat=
ion compatibility.
>>>> > > > > > > > > > This can become a real headache for KVM machines lik=
e virt for which
>>>> > > > > > > > > > migration compatibility is a feature, less for emula=
ted ones.
>>>> > > > > > > > >=20
>>>> > > > > > > > > All changes are either moving properties (which are no=
t migrated)
>>>> > > > > > > > > or moving non-migrated QOM members (i.e. pointers of A=
RMCPU, which
>>>> > > > > > > > > is still migrated elsewhere). So I don't see any obvio=
us migration
>>>> > > > > > > > > problem, but I might be missing something, so I Cc'ed =
Juan :>
>>>> > > > > >=20
>>>> > > > > > FWIW, I didn't spot anything problematic either.
>>>> > > > > >=20
>>>> > > > > > I've ran this through my migration compatibility series [1] =
and it
>>>> > > > > > doesn't regress aarch64 migration from/to 8.2. The tests use=
 '-M
>>>> > > > > > virt -cpu max', so the cortex-a7 and cortex-a15 are not cove=
red. I don't
>>>> > > > > > think we even support migration of anything non-KVM on arm.
>>>> > > > >=20
>>>> > > > > it happens we do.
>>>> > > > >=20
>>>> > > >=20
>>>> > > > Oh, sorry, I didn't mean TCG here. Probably meant to say somethi=
ng like
>>>> > > > non-KVM-capable cpus, as in 32-bit. Nevermind.
>>>> > >=20
>>>> > > Theoretically, we should be able to migrate to a TCG guest. Well, =
this
>>>> > > worked in the past for PPC. When I was doing more KVM related chan=
ges,
>>>> > > this was very useful for dev. Also, some machines are partially em=
ulated.
>>>> > > Anyhow I agree this is not a strong requirement and we often break=
 it.
>>>> > > Let's focus on KVM only.
>>>> > >=20
>>>> > > > > > 1- https://gitlab.com/farosas/qemu/-/jobs/5853599533
>>>> > > > >=20
>>>> > > > > yes it depends on the QOM hierarchy and virt seems immune to t=
he changes.
>>>> > > > > Good.
>>>> > > > >=20
>>>> > > > > However, changing the QOM topology clearly breaks migration co=
mpat,
>>>> > > >=20
>>>> > > > Well, "clearly" is relative =3D) You've mentioned pseries and as=
peed
>>>> > > > already, do you have a pointer to one of those cases were we bro=
ke
>>>> > > > migration
>>>> > >=20
>>>> > > Regarding pseries, migration compat broke because of 5bc8d26de20c
>>>> > > ("spapr: allocate the ICPState object from under sPAPRCPUCore") wh=
ich
>>>> > > is similar to the changes proposed by this series, it impacts the =
QOM
>>>> > > hierarchy. Here is the workaround/fix from Greg : 46f7afa37096
>>>> > > ("spapr: fix migration of ICPState objects from/to older QEMU") wh=
ich
>>>> > > is quite an headache and this turned out to raise another problem =
some
>>>> > > months ago ... :/ That's why I sent [1] to prepare removal of old
>>>> > > machines and workarounds becoming a burden.
>>>> >=20
>>>> > This feels like something that could be handled by the vmstate code
>>>> > somehow. The state is there, just under a different path.
>>>>=20
>>>> What, the QOM path is used in migration? ...
>>>
>>> Hopefully not..
>
> Unfortunately the original fix doesn't mention _what_ actually broke
> with migration. I assumed the QOM path was needed because otherwise I
> don't think the fix makes sense. The thread discussing that patch also
> directly mentions the QOM path:
>
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg450912.html
>
> But I probably misunderstood something while reading that thread.
>
>>>
>>>>=20
>>>> See recent discussions on "QOM path stability":
>>>> https://lore.kernel.org/qemu-devel/ZZfYvlmcxBCiaeWE@redhat.com/
>>>> https://lore.kernel.org/qemu-devel/87jzojbxt7.fsf@pond.sub.org/
>>>> https://lore.kernel.org/qemu-devel/87v883by34.fsf@pond.sub.org/
>>>
>>> If I read it right, the commit 46f7afa37096 example is pretty special t=
hat
>>> the QOM path more or less decided more than the hierachy itself but cha=
nges
>>> the existances of objects.
>>
>> Let's see whether I got this...
>>
>> We removed some useless objects, moved the useful ones to another home.
>> The move changed their QOM path.
>>
>> The problem was the removal of useless objects, because this also
>> removed their vmstate.
>
> If you checkout at the removal commit (5bc8d26de20c), the vmstate has
> been kept untouched.
>
>>
>> The fix was adding the vmstate back as a dummy.
>
> Since the vmstate was kept I don't see why would we need a dummy. The
> incoming migration stream would still have the state, only at a
> different point in the stream. It's surprising to me that that would
> cause an issue, but I'm not well versed in that code.

Alright, I understand neither the problem nor the fix :)

>> The QOM patch changes are *not* part of the problem.
>
> The only explanation I can come up with is that after the patch
> migration has broken after a hotplug or similar operation. In such
> situation, the preallocated state would always be present before the
> patch, but sometimes not present after the patch in case, say, a
> hot-unplug has taken away a cpu + ICPState.

My head hurts...  Oh, we're talking migration!  Perfectly normal then.
