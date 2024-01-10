Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp885970ejs;
        Wed, 10 Jan 2024 00:10:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXsKhuA92YRnSJq1bNY3lIWXKNLD4e0rWYsdYuwFRZ7q6De9PZvQz5HUPzZ5nNM2gneOEi
X-Received: by 2002:a05:620a:a45:b0:783:37fa:cd07 with SMTP id j5-20020a05620a0a4500b0078337facd07mr283802qka.83.1704874200909;
        Wed, 10 Jan 2024 00:10:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704874200; cv=none;
        d=google.com; s=arc-20160816;
        b=aAt5MwkP5Iwg1Y95iQ9zSN9ALKwEmCOKUKotu7wsN3qNT5fRxwLFD5U6Q+2Z+M3DBp
         llbWibaMaS9cmgnHShQhAOsPn4xYbHWrKoVbV34gVjPLqN15qEIsi1HsTwwpkxl2LVM3
         3RsQqNtGMy3cfGOmfThIgOv+H9Os5wTOGN/4zOKD0dAaplxhkYGFQ8xg0su5Pl0pztR+
         uVKQrybb0XUGMTTu8tMrxXkwXf+hU4Z92j+cCxxTplmQRyFHWRfGZkfmYup+GNA8DLsq
         lhYwUD3E5f3fCuLpGPruxJOycrxxBDCy2MJzg0ytgFXkndBkCUK7hMoANo0pYE4Iahu4
         I/vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=6HC1mmrR/hNPTO8t9wijLNFaNcSLwsWEDAclfCoIYZ8=;
        fh=DnjtovuCqoxcquEhV0NAW0XkbxSt8oSV/Q95Re698V8=;
        b=HLoHV4kPBF43Cl6ufXNxjZvOa4pdcJ0iW9WEn3nwOkAJyuV4/uvCx36MaQGG2WS8O9
         rTWl2ks2818LoABX77NFlfXemnJoC/g4aIDy7KZttOeec3IKN0X3kAHxb2226VWDBQ/V
         NC71aSJhyEDvTgElPsc+a2tFg6UOihf8QUkmpHtU1E9N3IcfFfN4ZfcWvNups4Zht/Ox
         7xQhiF8tmOtutR/VX8Y8vHDDvz+w3dv4azcIsKz8bKIBLL6CV1OJkQwvVqTr5gcwIGgq
         gcpCcjp7h+tYgm1LKPAzX5haxAfZIXAsNi42ZEwK4nYPHS/lRMYHPyKyKm3h1GUUAe2a
         VpMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kre2d7q0;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id p18-20020a05620a113200b007815f7168e6si3647147qkk.35.2024.01.10.00.10.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 00:10:00 -0800 (PST)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kre2d7q0;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704874199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6HC1mmrR/hNPTO8t9wijLNFaNcSLwsWEDAclfCoIYZ8=;
	b=Kre2d7q0pT6vd81cIZKg0AbqgFBveh1Z+QJR+uvgRnhjcRiuiJId5mXGQMYISemWPTbYYK
	zXHGbGozP4Yy5KVzEASeb800nLdlaoM2aRWIAazMAHxTwIguVbmgluix8+pDni/Be0sVS/
	xb+I2yIC/mp9CMhJ/hPlmtrILafQgYU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-QaRung1SOSueSZ8ZBTGplQ-1; Wed, 10 Jan 2024 03:09:55 -0500
X-MC-Unique: QaRung1SOSueSZ8ZBTGplQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB91B185A782;
	Wed, 10 Jan 2024 08:09:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 013BDC15E6A;
	Wed, 10 Jan 2024 08:09:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id ECCC921E6806; Wed, 10 Jan 2024 09:09:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Fabiano
 Rosas
 <farosas@suse.de>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
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
In-Reply-To: <ZZ44iQRPrdDpfov7@x1n> (Peter Xu's message of "Wed, 10 Jan 2024
	14:26:17 +0800")
References: <38cfa9de-874b-41dd-873e-5ad1f5a5805e@kaod.org>
	<fe4d463f-b646-4b7b-9063-d16ad5dbb128@linaro.org>
	<87y1d6i47m.fsf@suse.de>
	<597186d9-af21-46e8-8075-f21d36c01c07@kaod.org>
	<87plya76cu.fsf@suse.de>
	<d5c0b9fb-8b09-4f68-b3ab-c8adffd484a9@kaod.org>
	<87bk9u8dhs.fsf@suse.de>
	<2fa344b7-ccd2-4e6a-8c32-5ad7e4c960d6@linaro.org>
	<ZZ4Qrfis4XHWGN0j@x1n> <87cyu9hgit.fsf@pond.sub.org>
	<ZZ44iQRPrdDpfov7@x1n>
Date: Wed, 10 Jan 2024 09:09:51 +0100
Message-ID: <87sf35ehio.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-TUID: xfu96f9yfPCg

Peter Xu <peterx@redhat.com> writes:

> On Wed, Jan 10, 2024 at 07:03:06AM +0100, Markus Armbruster wrote:
>> Peter Xu <peterx@redhat.com> writes:
>>=20
>> > On Tue, Jan 09, 2024 at 10:22:31PM +0100, Philippe Mathieu-Daud=C3=A9 =
wrote:
>> >> Hi Fabiano,
>> >>=20
>> >> On 9/1/24 21:21, Fabiano Rosas wrote:

[...]

>> >> > No one wants
>> >> > to be policing QOM hierarchy changes in every single series that sh=
ows
>> >> > up on the list.
>> >> >=20
>> >> > Anyway, thanks for the pointers. I'll study that code a bit more, m=
aybe
>> >> > I can come up with some way to handle these cases.
>> >> >=20
>> >> > Hopefully between the analyze-migration test and the compat tests w=
e'll
>> >> > catch the next bug of this kind before it gets merged.
>> >
>> > Things like that might be able to be detected via vmstate-static-check=
er.py.
>> > But I'm not 100% sure, also its coverage is limited.
>> >
>> > For example, I don't think it can detect changes to objects that will =
only
>> > be created dynamically, e.g., I think sometimes we create objects after
>> > some guest behaviors (consider guest enables the device, then QEMU
>> > emulation creates some objects on demand of device setup?),
>>=20
>> Feels nuts to me.
>>=20
>> In real hardware, software enabling a device that is disabled by default
>> doesn't create the device.  The device is always there, it just happens
>> to be inactive unless enabled.  We should model the device just like
>> that.
>
> It doesn't need to be the device itself to be dynamically created, but so=
me
> other sub-objects that do not require to exist until the device is enable=
d,
> or some specific function of that device is enabled.  It is logically doa=
ble.
>
> Is the example Cedric provided looks like some case like this?  I am not
> sure, that's also why I'm not sure the static checker would work here.  B=
ut
> logically it seems possible, e.g. with migration VMSD needed() facilities.
> Consider a device has a sub-function that requires a sub-object.  It may
> not need to migrate that object if that sub-feature is not even enabled.
> If that object is very large, it might be wise to do so if possible to not
> send chunks of junk during the VM downtime.
>
> But then after a 2nd thought I do agree it's probably not sensible, becau=
se
> even if the src may know whether the sub-object will be needed, there's
> probably no good way for the dest QEMU to know.  It can only know in
> something like a post_load() hook, but logically that can happen only aft=
er
> a full load of that device state, so might already be too late.
>
> Thanks,

If an object has state that needs to be migrated only sometimes, and
that part of the state is large enough to bother, we can put it in an
optional subsection, can't we?

Destination: if present, take it.  If absent, initialize to default.

Source: send unless (known to be) in default state.
