Received: by 10.223.134.117 with SMTP id 50csp12831655wrw;
        Thu, 4 Jan 2018 08:35:25 -0800 (PST)
X-Google-Smtp-Source: ACJfBos63A0/J+I6bXOE8ZOEHbF9p7uXLOgHZ34atP3nNkBHJuBYbxB7cMA63EDb5yehLaNdziEr
X-Received: by 10.37.64.75 with SMTP id n72mr113948yba.499.1515083725596;
        Thu, 04 Jan 2018 08:35:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515083725; cv=none;
        d=google.com; s=arc-20160816;
        b=p8MMtJo4mnMgEh2cX/kxZpOYXhL4WV3bleo6MDZImIV9qMyk1vte1Y9iktCoV8R7Fw
         0JC0ahT1PE3iyzGxxrbOoXCr+f4p13F5V57/5DjEpzJgnJKhqUZNiyQVXecwLlspnWhd
         zBci2pyGoqhG9jKTSZt5OloGjLzsjyzZyio66hKlDRdAV+M6Sjc7np1vnmiUNSYYGdaY
         uKYnvChCRYkGH8mG594ZaOaH4+NB1A4L6gwMJIOhD9vCfRR9+BYCBOV5dXp9s30KK9JY
         rxVzYqQcmHj0TIqUpZyQmHpWYLse2NyCCgDubRbRQk88fk00APCthfwa42H+rgeH4XXi
         PYSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=sxeMcSGDBeFqtV1z7x0zATJ8onwVSpty4ARck7/WA+I=;
        b=ltOH/UTf2lgMxJLmt0/UK8KzbIIZSS1APemgBtWIuQuatEB6OG0syfnG1BQhvTCO1c
         f+xrnD1PNbsF94RRoBQn7mPdSyCqmdY/4Tm6bmFUM1CYDErdvjc79N8TDzFgbabOcNll
         wHFvZwrdQx9P+Ia1MuIJml0xibqQ4U5JceOZUdCS/fSoHoJ4fluVEGIsmWLTZzy29ntz
         QXhbKVMJz/PyxmYibk9ySoY5On9h2owRcWEVLW71/FDprnSbF9K/YOdejNabQK/thVdc
         2h++6YXmIkqGAZTw58QkbTvbSguyWQSA2rDlud8KjZmBeWeBKUek/8F4QzN2DrPKWOud
         zZrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Dw821Nla;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z14si761333ybk.699.2018.01.04.08.35.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Jan 2018 08:35:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Dw821Nla;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49315 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eX8UH-0001JQ-2G
	for alex.bennee@linaro.org; Thu, 04 Jan 2018 11:35:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX8U0-0001DA-Iq
	for qemu-arm@nongnu.org; Thu, 04 Jan 2018 11:35:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX8Tu-00067G-Te
	for qemu-arm@nongnu.org; Thu, 04 Jan 2018 11:35:08 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:41429)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX8Tu-00066d-OP; Thu, 04 Jan 2018 11:35:02 -0500
Received: by mail-qk0-x243.google.com with SMTP id a8so2587644qkb.8;
	Thu, 04 Jan 2018 08:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=sxeMcSGDBeFqtV1z7x0zATJ8onwVSpty4ARck7/WA+I=;
	b=Dw821NlaI6D5Eol0wFLvk/u4kBwEoQLooO1LVWMQ+21XIEgmUWjmX3ZlP6XYBxkz2W
	i7QQizwlpzH7W+WwKM286OOWMdjMv7/hU6gkIbI0Byek6JR7ISr4RKhRO4DE9V32IjvI
	xB4eEUUEX8ehaUTkcDUAP6pkyoSsOVRtKJTyD4+ZBpMR0QlEso9Xb6Wp6n+TeJUCvqqW
	4j3mKK++X3/SBAdlCeE26wbegZfBw3TdflwSjXjuwFK1oSdGnJpGaED9WM0ANVQc+935
	VE+rMUqyqq9bA2k7pBeqpz1vbOrRlV9so1apWWw4bZyoBlBrf1B5Sxua0rdVDura9y0f
	r7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=sxeMcSGDBeFqtV1z7x0zATJ8onwVSpty4ARck7/WA+I=;
	b=TBP/rzClNcK1BMpr/f7sLxKFIwfu3ETvadH1TnE0mfWpSAey5sguDX24estoWDwbqz
	Hg/Dt70aGLnCD2niVE1Fapu7uqrrta4lY8KIlRpf6v4O2eQn9h1VI5E0VoKyC15MldWe
	JD4qgEv1utQKvYeH8xT2ZpE8fiZOmIsHLnZF+fHlEJtYzXBwqonHg3doByMpXv44gqw9
	TrxXFFjoqj/twH4p4Kgnau3kFXu0bW5iwJAxRDcwe9n4suyF6z3F/qvaIz2HjhvjfLVU
	0KihWY58PREUmaoy6TGxQQrZAERwAdH/rdrgG5wXocm4G+JpoVT1RHK5PhAFdv/OqLKB
	PBlw==
X-Gm-Message-State: AKwxytdnRtOs5MYBwNWZ9Xre1FEnl89ABSo4jZw2SqbgDaBM0gKaCUB9
	Qd+Iy1JhXpV3GCb4EVztfdw=
X-Received: by 10.55.54.9 with SMTP id d9mr162171qka.33.1515083702074;
	Thu, 04 Jan 2018 08:35:02 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id x3sm2369780qka.77.2018.01.04.08.34.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jan 2018 08:35:01 -0800 (PST)
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20180104144046.30793-1-f4bug@amsat.org>
	<20180104144046.30793-3-f4bug@amsat.org>
	<20180104162400.GB2618@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <44abdde4-4543-f5a4-aca3-d6549497bd7b@amsat.org>
Date: Thu, 4 Jan 2018 13:34:53 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180104162400.GB2618@work-vm>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="IMIMlEpK339LLWUaM8A7z63exhsJNsl39"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 2/6] hw/net/e1000: real
 device name is 'e1000-82540em', 'e1000' is an alias
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Alexander Graf <agraf@suse.de>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	Sascha Silbe <silbe@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p4PEg9w5hoSh

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IMIMlEpK339LLWUaM8A7z63exhsJNsl39
Content-Type: multipart/mixed; boundary="XxeoTP7a3niLQyWJXeGlWnoEBOfMSssAC";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Sascha Silbe <silbe@linux.vnet.ibm.com>, Alexander Graf <agraf@suse.de>,
 Fam Zheng <famz@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <44abdde4-4543-f5a4-aca3-d6549497bd7b@amsat.org>
Subject: Re: [Qemu-devel] [RFC PATCH 2/6] hw/net/e1000: real device name is
 'e1000-82540em', 'e1000' is an alias
References: <20180104144046.30793-1-f4bug@amsat.org>
 <20180104144046.30793-3-f4bug@amsat.org> <20180104162400.GB2618@work-vm>
In-Reply-To: <20180104162400.GB2618@work-vm>

--XxeoTP7a3niLQyWJXeGlWnoEBOfMSssAC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi David,

On 01/04/2018 01:24 PM, Dr. David Alan Gilbert wrote:
> * Philippe Mathieu-Daud=C3=A9 (f4bug@amsat.org) wrote:
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>  hw/net/e1000.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
>> index 05a00cba31..2280f7fdf9 100644
>> --- a/hw/net/e1000.c
>> +++ b/hw/net/e1000.c
>> @@ -1648,6 +1648,7 @@ typedef struct E1000Info {
>>      uint16_t   device_id;
>>      uint8_t    revision;
>>      uint16_t   phy_id2;
>> +    const char **aliases;
>>  } E1000Info;
>> =20
>>  static void e1000_class_init(ObjectClass *klass, void *data)
>> @@ -1695,10 +1696,11 @@ static const TypeInfo e1000_base_info =3D {
>> =20
>>  static const E1000Info e1000_devices[] =3D {
>>      {
>> -        .name      =3D "e1000",
>> +        .name      =3D "e1000-82540em",
>>          .device_id =3D E1000_DEV_ID_82540EM,
>>          .revision  =3D 0x03,
>>          .phy_id2   =3D E1000_PHY_ID2_8254xx_DEFAULT,
>> +        .aliases   =3D (const char * []) {"e1000", NULL},
>>      },
>>      {
>>          .name      =3D "e1000-82544gc",
>> @@ -1725,6 +1727,7 @@ static void e1000_register_types(void)
>> =20
>>          type_info.name =3D info->name;
>>          type_info.parent =3D TYPE_E1000_BASE;
>> +        type_info.aliases =3D info->aliases;
>>          type_info.class_data =3D (void *)info;
>>          type_info.class_init =3D e1000_class_init;
>>          type_info.instance_init =3D e1000_instance_init;
>=20
> Can you just check that this doesn't break migration compatibility
> either way please;  I think there's some alias code somewhere but I
> can't remember the details.

Good point.

Something related to qdev-monitor.c?

> One thing I do remember that broke when it previously changed was
> entries in PC_COMPAT_* tables like the one in hw/i386/pc_piix.c's
> PC_COMPAT_1_3 - so check with an 'info qtree' that the property is OK.

Ok, I'll verify and think about a qtest for that.

I took this device because I wanted to test another arch than ARM (which
strongly use FDT).
If there is an issue migrating this particular device we can drop this
patch for this only device, and the series still stands for the ARM/FDT.

Regards,

Phil.


--XxeoTP7a3niLQyWJXeGlWnoEBOfMSssAC--

--IMIMlEpK339LLWUaM8A7z63exhsJNsl39
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlpOV60ACgkQ4+MsLN6t
wN7r7RAApE+zrGk2w6iVqwut6wBuXlzxOqISa1i0YilJCrd0dNKaWmWjlRwtlXA8
OM3w3Xgnr2+EXFGbVnM3LBn4ZBkARd1pOSEqSI2sovOWiv64z7MY8EmNNHP+9hcE
Yiiiv7xxNCvHrYf9bAe/yBOuAFPKXYOLovtmZDYfkrzKRR1LrifeI1Rr08Ma7IuX
qQkxPrUqtZgvjJFI4Kyvl+VtsU2dH4QdvHnTPMgMku5StQdC++WTm3eGCwTCG8nm
LmUdLFtvweQrsQVgJTzPBXkMQUcQ6X7QE0yQfugKoKczOXinjkKfdoi1bjOILzU1
U/VqZpU9I3QZ8KtI/sr7FZ+uazrP63ijitqe/4Vk2rsZqiqLrUhzldCofJZeH7Tr
NXJabRfHAuWMRJ6TvvesuwcNPHTVg7UQSu58+zyhyoBvbadTgvKj2ZHAc0Ae9I8Q
THxVBIUh+ItuF/9AgfRDVvhEWyc7AqDt3jaBC/saDNIWCqoMxcXp0BcVtESZ+Gjs
LwHgiuTDFqwgKut9kbU0qIbRw37BArCHsbxZKCuGgmA3LP7i943gFeZx5ODKtV4G
+3zQO9IAFzRq1b8X2E/7VmaE5sBgEMLX0a2Sr/gPRh//jbeQgFA9oTngYNTgpDWB
vJBT/Qn0qTDKPYlf4RBd9zD8CNNAn9LC0N/8oLZsYZhonJSM3p8=
=Yfjd
-----END PGP SIGNATURE-----

--IMIMlEpK339LLWUaM8A7z63exhsJNsl39--
