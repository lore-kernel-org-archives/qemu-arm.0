Received: by 10.25.0.6 with SMTP id 6csp175721lfa;
        Fri, 2 Jun 2017 05:02:20 -0700 (PDT)
X-Received: by 10.237.48.105 with SMTP id 96mr7104052qte.218.1496404939937;
        Fri, 02 Jun 2017 05:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496404939; cv=none;
        d=google.com; s=arc-20160816;
        b=iL7UK9djNaPMS4XlOFWzkT7vOP8+tJnDlZztu2h6HhLOJDtZ9sl6fL0aITIOTkC706
         PQiJZKOJ3v+ZXLGStJc+4/kN5fsYIQfRzb/jri06xqpxIDvhB1gkan7ZBBmQYlfWW9nO
         XApjrndfmoFelPIViEcu9CbXZf1p4tirYpUljmPu0UGam2KoVoFoNYH0F3jXbWXbtRCh
         iZ7lGo17oWTmpmSM2LPbzwKylCvo9YE5/1EhDeTQy2NLBu2+IPRobn/7/Z7sQQsmOfCx
         XgNmLDowEamhGyk0imCEA3a41Rk8YzkHsreZROr3KFd7Kejqg12HjjEMYGK/OadDo43F
         1iqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=+lM2rJxQfM+uRrKEO8OgEPdHXVhWB5wI7qygH90ay9w=;
        b=eQxQmt7mMOKlEieWYSYA+ap90PfUr65Z/FZ6PTzQLySsL0//sPnauoy2yBmVbrSkWc
         iFhiqBJrUy1Rtk2oVaLZztC8DGcuTNFrS1OV+J1c4RPsT09lTXCTUSMjncsK/bKyF2P6
         8PJ3ERxp4rMt/aET+3TUttigEgA0PcWoPcxpIfWMP2mRV7E2TBmCNks53uY0uuqj/FrW
         FkRuSU8Sgi3VYTho7otRl7ZZOVq7Q0TxSvrclVf0ui2f6t/WP3bednrh4bycNY7U0tzQ
         1jywR6rUKW7roeHbx37B4A58fdQ6FqR9LiyzakoZBv4k7SGPYT2+TTWEzlZtg08wvzvv
         pWlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 41si18369800qky.135.2017.06.02.05.02.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 05:02:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49498 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGlHV-0004T6-8Z
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 08:02:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dGlHO-0004Qs-5V
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 08:02:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dGlHK-0004Rq-A7
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 08:02:10 -0400
Received: from 20.mo3.mail-out.ovh.net ([178.33.47.94]:53038)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1dGlHK-0004ND-1k
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 08:02:06 -0400
Received: from player158.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 9403EDE7CF
	for <qemu-arm@nongnu.org>; Fri,  2 Jun 2017 14:01:57 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
	[90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
	by player158.ha.ovh.net (Postfix) with ESMTPSA id 39EE762007C;
	Fri,  2 Jun 2017 14:01:55 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1494827476-1487-1-git-send-email-clg@kaod.org>
	<1494827476-1487-6-git-send-email-clg@kaod.org>
	<CAFEAcA915cbt97g9f1iyTJ8CjZ96c1hbwHK2E-_57311dHSEuw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2f880c89-2548-b6b9-2ddd-f99e975bb208@kaod.org>
Date: Fri, 2 Jun 2017 14:01:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA915cbt97g9f1iyTJ8CjZ96c1hbwHK2E-_57311dHSEuw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 6031727278949174080
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrhedugdeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.47.94
Subject: Re: [Qemu-arm] [PATCH 5/6] hw/misc: add a TMP42{1, 2,
 3} device model
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CvjX4FE4cTMr

On 06/02/2017 12:51 PM, Peter Maydell wrote:
> On 15 May 2017 at 06:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> Largely inspired by the TMP105 temperature sensor, here is a model for
>> the TMP42{1,2,3} temperature sensors.
>>
>> Specs can be found here :
>>
>>         http://www.ti.com/lit/gpn/tmp421
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> This turns out to segfault on OSX and BSD...
>=20
>> +static void tmp421_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +    I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
>> +    TMP421Class *sc =3D TMP421_CLASS(klass);
>> +
>> +    k->init =3D tmp421_init;
>> +    k->event =3D tmp421_event;
>> +    k->recv =3D tmp421_rx;
>> +    k->send =3D tmp421_tx;
>> +    dc->vmsd =3D &vmstate_tmp421;
>> +    sc->dev =3D (DeviceInfo *) data;
>=20
> ...because this write to sc->dev is off the end of a
> malloced block. You can see this with valgrind on Linux:
>=20
> $ valgrind ./build/x86/aarch64-softmmu/qemu-system-aarch64
> =3D=3D14009=3D=3D Memcheck, a memory error detector
> [...]
> =3D=3D14009=3D=3D Invalid write of size 8
> =3D=3D14009=3D=3D    at 0x67D3D9: tmp421_class_init (tmp421.c:374)
> =3D=3D14009=3D=3D    by 0x80CD51: type_initialize (object.c:334)
> =3D=3D14009=3D=3D    by 0x80CABC: type_initialize (object.c:286)
> =3D=3D14009=3D=3D    by 0x80DF49: object_class_foreach_tramp (object.c:=
805)
> =3D=3D14009=3D=3D    by 0x1B7AE33F: g_hash_table_foreach (in
> /lib/x86_64-linux-gnu/libglib-2.0.so.0.4800.2)
> =3D=3D14009=3D=3D    by 0x80E028: object_class_foreach (object.c:827)
> =3D=3D14009=3D=3D    by 0x80E1F7: object_class_get_list (object.c:881)
> =3D=3D14009=3D=3D    by 0x5500A8: find_default_machine (vl.c:1488)
> =3D=3D14009=3D=3D    by 0x554039: select_machine (vl.c:2745)
> =3D=3D14009=3D=3D    by 0x55730E: main (vl.c:4091)
> =3D=3D14009=3D=3D  Address 0x2b4e7cd0 is 0 bytes after a block of size =
224 alloc'd
> =3D=3D14009=3D=3D    at 0x4C2FB55: calloc (in
> /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
> =3D=3D14009=3D=3D    by 0x1B7C4770: g_malloc0 (in
> /lib/x86_64-linux-gnu/libglib-2.0.so.0.4800.2)
> =3D=3D14009=3D=3D    by 0x80CA8A: type_initialize (object.c:282)
> =3D=3D14009=3D=3D    by 0x80CABC: type_initialize (object.c:286)
> =3D=3D14009=3D=3D    by 0x80DF49: object_class_foreach_tramp (object.c:=
805)
> =3D=3D14009=3D=3D    by 0x1B7AE33F: g_hash_table_foreach (in
> /lib/x86_64-linux-gnu/libglib-2.0.so.0.4800.2)
> =3D=3D14009=3D=3D    by 0x80E028: object_class_foreach (object.c:827)
> =3D=3D14009=3D=3D    by 0x80E1F7: object_class_get_list (object.c:881)
> =3D=3D14009=3D=3D    by 0x5500A8: find_default_machine (vl.c:1488)
> =3D=3D14009=3D=3D    by 0x554039: select_machine (vl.c:2745)
> =3D=3D14009=3D=3D    by 0x55730E: main (vl.c:4091)
> =3D=3D14009=3D=3D
>=20
>> +}
>> +
>> +static const TypeInfo tmp421_info =3D {
>> +    .name          =3D TYPE_TMP421,
>> +    .parent        =3D TYPE_I2C_SLAVE,
>> +    .instance_size =3D sizeof(TMP421State),
>> +    .instance_init =3D tmp421_initfn,
>> +    .class_init    =3D tmp421_class_init,
>=20
> ...which is because this TypeInfo doesn't set the
> .class_size field, so only sizeof(I2CSlaveClass) is
> allocated, not sizeof(TMP421Class).
>=20
> (http://wiki.qemu.org/Documentation/QOMConventions
> lists this as one of the things you need to do for a class
> that has a class struct).
>=20
>> +};
>> +
>> +static void tmp421_register_types(void)
>> +{
>> +    int i;
>> +
>> +    type_register_static(&tmp421_info);
>> +    for (i =3D 0; i < ARRAY_SIZE(devices); ++i) {
>> +        TypeInfo ti =3D {
>> +            .name       =3D devices[i].name,
>> +            .parent     =3D TYPE_TMP421,
>> +            .class_init =3D tmp421_class_init,
>> +            .class_data =3D (void *) &devices[i],
>=20
> This TypeInfo is a bit odd too, looking more closely at it.
> It defines a type that's a subclass of TYPE_TMP421, but which
> has a class_init method that's the same function as TYPE_TMP421's
> class_init method. That means we call it twice for the same
> class, which doesn't seem right.
>=20
>> +        };
>> +        type_register(&ti);
>> +    }
>> +}
>> +
>> +type_init(tmp421_register_types)
>> --
>> 2.7.4
>=20
> I'm going to drop this patch and the next one from my arm
> queue, but leave 1-4 in.

OK. I should be able to fix it before 2.10.=20

I would also like to spend some time on the rx8900 model Alastair=20
wrote. It would give an RTC to the romulus machine.=20

Thanks for the tests and analysis.=20

C.

