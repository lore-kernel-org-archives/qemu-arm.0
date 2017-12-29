Received: by 10.223.134.117 with SMTP id 50csp6970831wrw;
        Fri, 29 Dec 2017 09:22:52 -0800 (PST)
X-Google-Smtp-Source: ACJfBouXxYZuvgEG02eTrL/uLAmvuHXmvMBtFOU1AXrX+fY8zZCeT9KB+YHX1mOv1gpveblzJe0Z
X-Received: by 10.37.118.20 with SMTP id r20mr12496622ybc.381.1514568172109;
        Fri, 29 Dec 2017 09:22:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514568172; cv=none;
        d=google.com; s=arc-20160816;
        b=Ej7ZIkPGNuEc2QtL6lsRZOb45lXvdICMmTfdD/F+DfMKNwiJ96nCT5F1uSL4pc2xkr
         p78zoOpKFiQwNSOKwM7M8QYEDiEhJQq8+W8v2On3UHzhUMCG1UNU+j0ajVrPtL9XkZJ8
         nLT9v2TL33pxHQ+TOwn/d3OG1YZJ/2lstDsHBgteolvvlJ+6gWzuP5lQEiKFk27758HC
         GbxkdAzRDB8hIwSWFSCwgczWr/cMD2226/wbK7Pjp0MRDugUQV91EitCsgo8JpSTdHXA
         s6sNhrAMUXmj6XJVu3HqONRKl9lxHUbIRKc6aaz2zUrhXgHL+uUouCHDm/2xn2csmL1v
         Ge9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=zobN2IcZP5ZyixgXi+XVkNOuZGV4j+kLh3G08PtBc5g=;
        b=Tvsws5vnEUvVnYceJ+J8wNSOcxncyD/YVIBmmwpGuthyycr68wBXk/qvafORxO0RLb
         6MyYTS3KHjU/837Qi9fXuJYidNOfOeNrJci0RV7NQjstmBqaGmKGiFkG9i4pqW+rT2ET
         R1oIiitInxDHIktOYQ0Ul52SDdZbk0TByHNbZ34aHLzEMnN7vreS56yyx4+fAV92YHsa
         DCzBq9H8M6O2KaRSnWtNXkfPeyx+c8+48b+LcAS52POkpopatt7vJneO3hbOaZLPHp23
         UEafYfZMHfGeyCWOpPBPAJuvHNbg4SugpZvPla2TAuWSlhjjovmar7zmHtvFQlPL+Rl1
         +PLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=BchF93iM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v20si4554533ywv.599.2017.12.29.09.22.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Dec 2017 09:22:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=BchF93iM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eUyMt-0003zi-EA
	for alex.bennee@linaro.org; Fri, 29 Dec 2017 12:22:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyLd-0003YG-C5
	for qemu-devel@nongnu.org; Fri, 29 Dec 2017 12:21:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyLc-0003FD-63
	for qemu-devel@nongnu.org; Fri, 29 Dec 2017 12:21:33 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:44950)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyLX-000390-Av; Fri, 29 Dec 2017 12:21:27 -0500
Received: by mail-qk0-x241.google.com with SMTP id v188so26059503qkh.11;
	Fri, 29 Dec 2017 09:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=zdqho3fu9JPnjjA99hJEiGQh8faLXZOl4OFLZ9lgATw=;
	b=BchF93iMMp+GgTVLdHBJF1+kCRfmxkmBwkbjkwFwWNnxeozSyshrl7nCObEJuuQ62u
	1kdMuXUPIOXI6pjwaLSpiJI337hotdk5SjXZuL/AygE4lZP8Ixh95fGEmXNmtj2Yee/b
	AhM4ZJkqqPWa8z0Op60YvPFnFxR579V3ll0U7I7DNcZ84dsXCFjSb9OSP3M9o5f9qKbu
	ca4/JSpimXqUvyzJEzZpAayKWdPNIPQOCLqtabEYBhFGGgudTsosvVN6mX+J5JYDNPkw
	/JgA6Ku/6+aMr5JmyQtjx03Tan4ktpZxpLmbPAKdw4D8XFkWSXgRjiEFsIhe4B4lOBzG
	WBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=zdqho3fu9JPnjjA99hJEiGQh8faLXZOl4OFLZ9lgATw=;
	b=MqSRTuPMcSnUOfDoOn08q0xkVuLcFa/7bZlDW4lKpDaZ7XA3m+NusZhyzEvVXztlg9
	DUa6tr3wt5NKVQ7ujCHSLqC6uCNn0gPzqS/7UrOdCyIsRuIFZU8mBlzHi1VFk0M0LAQo
	Ygg7IsfytEWygr6ne3h25VQFiqsZYfeu00JxBoyVM0UB0uuuGlZX5Ok8/ea22jTv48mI
	AhvoRBDWK/3c6mQ4wEQJLjA/wtGIcG87hPb5vh+4jQqpjVdOGoUaee3ElFp6nJus9eWi
	+Ia71spQxhzEi/DyxirXod6Wzm8Y9PL6ZBa320wFMU90K7fohfYhfpePgACqt+VsFW5D
	m8Rg==
X-Gm-Message-State: AKGB3mI0TQVkh69drSY8GiA+lp2ENynbDHaH7oQ2UJGlTXt3OT38N8rF
	d4fYtXjgY3FbvcWLq+qTBhMCTPo8
X-Received: by 10.55.154.213 with SMTP id c204mr47988662qke.327.1514568086387; 
	Fri, 29 Dec 2017 09:21:26 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	q63sm18683968qke.41.2017.12.29.09.21.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Dec 2017 09:21:25 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Fam Zheng <famz@redhat.com>,
	Xiaoqiang Zhao <zxq_yx_007@163.com>
References: <20171215031547.31006-1-f4bug@amsat.org>
	<20171215031547.31006-5-f4bug@amsat.org>
	<CAKmqyKM-Ar=Ld=6KBvJ1D1T0z2wPhvFR52tvKXKp=SEWoFJ=XQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <f261cae0-9026-9ef0-65c5-fb24076564d8@amsat.org>
Date: Fri, 29 Dec 2017 14:21:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAKmqyKM-Ar=Ld=6KBvJ1D1T0z2wPhvFR52tvKXKp=SEWoFJ=XQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="WTNMl5JGKpcdBTAgBclkGxkFWzepowXab"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v2 04/20] sdhci: refactor same sysbus/pci
 properties into a common one
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pZWM0Fwa3aBh

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WTNMl5JGKpcdBTAgBclkGxkFWzepowXab
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Fam Zheng <famz@redhat.com>,
 Xiaoqiang Zhao <zxq_yx_007@163.com>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>, Prasad J Pandit
 <pjp@fedoraproject.org>, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>
Message-ID: <f261cae0-9026-9ef0-65c5-fb24076564d8@amsat.org>
Subject: Re: [Qemu-devel] [PATCH v2 04/20] sdhci: refactor same sysbus/pci
 properties into a common one
References: <20171215031547.31006-1-f4bug@amsat.org>
 <20171215031547.31006-5-f4bug@amsat.org>
 <CAKmqyKM-Ar=Ld=6KBvJ1D1T0z2wPhvFR52tvKXKp=SEWoFJ=XQ@mail.gmail.com>
In-Reply-To: <CAKmqyKM-Ar=Ld=6KBvJ1D1T0z2wPhvFR52tvKXKp=SEWoFJ=XQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Alistair,

On 12/18/2017 10:13 PM, Alistair Francis wrote:
> On Thu, Dec 14, 2017 at 7:15 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
>> add sysbus/pci/sdbus separator comments to keep it clearer
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
> I'm still unsure about this. Won't this leave us with properties that
> have no impact on the device? That seems very confusing to me.

(from previous series)
> [...] but aren't we now going to
> have device properties that aren't actually connected to anything?

I'm also confused :)

My understanding is the "pending-insert-quirk" worries you.
This property is dependent of the HCI IP, so regardless the HCI is
accessed through a MMIO sysbus or a PCI bus the quirk might exists (for
this property, only the BCM implementation).

With v3 series applied, the monitor 'qtree' output is:

$ qemu-system-aarch64 -M xlnx-zcu102 -monitor stdio -S
(qemu) info qtree
  dev: generic-sdhci, id ""
    gpio-out "sysbus-irq" 1
    sd-spec-version =3D 3 (0x3)
    timeout-freq =3D 0 (0x0)
    freq-in-mhz =3D true
    clock-freq =3D 0 (0x0)
    max-block-length =3D 512 (0x200)
    dma =3D true
    sdma =3D true
    adma1 =3D false
    adma2 =3D true
    suspend =3D true
    high-speed =3D true
    3v3 =3D true
    3v0 =3D false
    1v8 =3D true
    64bit =3D true
    slot-type =3D 0 (0x0)
    bus-speed =3D 7 (0x7)
    driver-strength =3D 7 (0x7)
    maxcurr =3D 0 (0x0)
    pending-insert-quirk =3D false
    dma-memory =3D ""
    mmio 00000000ff170000/0000000000000100
    bus: sd-bus
      type sdhci-bus
      dev: sd-card, id ""
        drive =3D ""
        spi =3D false

Are you worried about this output?

>> ---
>>  hw/sd/sdhci.c | 21 ++++++++++-----------
>>  1 file changed, 10 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
>> index 2823da00da..dbdfd54350 100644
>> --- a/hw/sd/sdhci.c
>> +++ b/hw/sd/sdhci.c
>> @@ -1265,13 +1265,17 @@ const VMStateDescription sdhci_vmstate =3D {
>>
>>  /* Capabilities registers provide information on supported features o=
f this
>>   * specific host controller implementation */
>> -static Property sdhci_pci_properties[] =3D {
>> +static Property sdhci_properties[] =3D {
>>      DEFINE_PROP_UINT32("capareg", SDHCIState, capareg,
>>              SDHC_CAPAB_REG_DEFAULT),
>>      DEFINE_PROP_UINT32("maxcurr", SDHCIState, maxcurr, 0),
>> +    DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_inse=
rt_quirk,
>> +                     false),
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>
>> +/* --- qdev PCI --- */
>> +
>>  static void sdhci_pci_realize(PCIDevice *dev, Error **errp)
>>  {
>>      SDHCIState *s =3D PCI_SDHCI(dev);
>> @@ -1304,7 +1308,7 @@ static void sdhci_pci_class_init(ObjectClass *kl=
ass, void *data)
>>      k->class_id =3D PCI_CLASS_SYSTEM_SDHCI;
>>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>>      dc->vmsd =3D &sdhci_vmstate;
>> -    dc->props =3D sdhci_pci_properties;
>> +    dc->props =3D sdhci_properties;
>>      dc->reset =3D sdhci_poweron_reset;
>>  }
>>
>> @@ -1319,14 +1323,7 @@ static const TypeInfo sdhci_pci_info =3D {
>>      },
>>  };
>>
>> -static Property sdhci_sysbus_properties[] =3D {
>> -    DEFINE_PROP_UINT32("capareg", SDHCIState, capareg,
>> -            SDHC_CAPAB_REG_DEFAULT),
>> -    DEFINE_PROP_UINT32("maxcurr", SDHCIState, maxcurr, 0),
>> -    DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_inse=
rt_quirk,
>> -                     false),
>> -    DEFINE_PROP_END_OF_LIST(),
>> -};
>> +/* --- qdev SysBus --- */
>>
>>  static void sdhci_sysbus_init(Object *obj)
>>  {
>> @@ -1359,7 +1356,7 @@ static void sdhci_sysbus_class_init(ObjectClass =
*klass, void *data)
>>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>>
>>      dc->vmsd =3D &sdhci_vmstate;
>> -    dc->props =3D sdhci_sysbus_properties;
>> +    dc->props =3D sdhci_properties;
>>      dc->realize =3D sdhci_sysbus_realize;
>>      dc->reset =3D sdhci_poweron_reset;
>>  }
>> @@ -1373,6 +1370,8 @@ static const TypeInfo sdhci_sysbus_info =3D {
>>      .class_init =3D sdhci_sysbus_class_init,
>>  };
>>
>> +/* --- qdev bus master --- */
>> +
>>  static void sdhci_bus_class_init(ObjectClass *klass, void *data)
>>  {
>>      SDBusClass *sbc =3D SD_BUS_CLASS(klass);
>> --
>> 2.15.1
>>
>>


--WTNMl5JGKpcdBTAgBclkGxkFWzepowXab
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlpGeZAACgkQ4+MsLN6t
wN4dag/+JcEj5WOb0sWgIV99ufP9i0CXSgZMgysISdeUaNF4WVvfXGBpwzqDhua1
UMiZzj/wTrJNiaSYFGeI1lGxz3WGeKRLtiAweaXN61ZKMHt2XGArO4VcXIyLzsad
p7pTzcVeRqNiFyYG2aGHIdx7SZCXNkiftS1C0WkkurNcagmqCWSb2MIhXtt+D4u0
S8dzypDUNkLnxYu+QueJhX1Sqi7bMY5GCibpr3ueaVl6C8m4cYmQS9vqXwJASiV1
kQg780lfl8iexH/C6vwhTCIlGEleuYL1LGgFcz+ja+HjS2W4rFqVvwvIvZfK4lUi
4KHUZME1rGtL0TV8SqI4V1xSjPJV6iSDWuTEEcSV3h8GUPuYonXBNALleIqeYY43
S5Q5Okejf4zov+lIeLUonb9GwnnuMS1Y/YSGCgUh6vHcZU0kyEuNhfnRdgexDwNq
V+VyAGTcfIb9te4G+HsPkvkkGSN3M5FC2uTE6J+Bxg9QbdvRc0Ilpu0nFLxRerFX
Quhrhz5eo4MCkfY/irdtPG/QZ11/V5x1VEIFvZOzeeEAQCn8XL7tRIEAiW7Aeh3s
ClM4RsC7l1ioQjPlwfmGmkhIb7JAm94mvi51ysWqEEICciJOeOnn6akg72cvKqkd
sVFmaHEoGiDSLdWX4Px7fIQJOhMwo8A7NM9h/igGSjA8WU0qOQ0=
=Rv4j
-----END PGP SIGNATURE-----

--WTNMl5JGKpcdBTAgBclkGxkFWzepowXab--
