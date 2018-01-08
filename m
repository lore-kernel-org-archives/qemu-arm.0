Received: by 10.28.173.206 with SMTP id w197csp2494105wme;
        Mon, 8 Jan 2018 05:52:04 -0800 (PST)
X-Google-Smtp-Source: ACJfBouEYDHencoZAUB1G3Vqi7oJ8R39RtmZQj3V0qkvzVx9KSN4siWFy99OUtaLJPVVZ6kfKCVT
X-Received: by 10.37.94.85 with SMTP id s82mr9968898ybb.336.1515419524078;
        Mon, 08 Jan 2018 05:52:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515419524; cv=none;
        d=google.com; s=arc-20160816;
        b=P/rBbvVzxYDkSVMGSYxh0Kqbi+W3fynvTWsS8uAM07nVYFosEkH16SovdEKAOLaqGC
         XNPe3T0iddaeiWd8R2L/HZ0/eRCFtiMWqWu0KsISXmSfkhrDbwRprkx0wRke/YILh9rZ
         E+DvgSjWYTTeQPh9eRqkdmHh94qEPvrv5Ul5T3ZqjKWgl2jheCBo9fQ33aCVj/5YlZeB
         jgyajy6IPscU+l7Xks5A9f7eplB91KdKV5RRR6xu5ZObIvApvguzB1Ys0Q2BFUTDlyTp
         p7AZAu9HxdUJJgdn3fnG5uyucjtR21iEbo9LuzGpYNtd43f6GejVrI2pV4Pt1iGd2TOW
         +qWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=KM/UDA3t41wrdKXcrFkRUBjYdHVmEU37LpV/SukZtk8=;
        b=fNxzs9Q1h7eYQ682Oo1r5cxpLyrmIO38T+EQDuAOZFYZoltu2HkuVV6LCAC4eYtY3X
         K0j5ecNzUWHSVMuQVKEcrZ1bGaHQ/QOx7APnJ01Df8IA6aQiMhR8voFt9+8tzStwiJQe
         Pusb1Gv97rJiueU5qcphtDdZZRGsJtkHaqO45a14qNxNV7rqQZMc2ohzPQCw5Y9yh/xe
         4QYQxHVJG1+zMLatksb3I+iSni/VVJTamc9rzB7ldIiZ1UE2LBlW1lP9f0TGQeHjDxG7
         t5yZEqO1rwjlzkeknkb5EzQM3dFor/LlVtv+UcR5PQ0v8zJr1B1pByGnsuvhbePDPa0c
         5tTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d+h47/8u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f84si212111ywb.331.2018.01.08.05.52.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 05:52:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d+h47/8u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYXqN-0002eq-Gu
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 08:52:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47477)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYXqB-0002eX-0O
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 08:51:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYXq8-0005MJ-CR
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 08:51:51 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:43564)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYXq8-0005Lu-6u; Mon, 08 Jan 2018 08:51:48 -0500
Received: by mail-qt0-x244.google.com with SMTP id w10so13616720qtb.10;
	Mon, 08 Jan 2018 05:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=KM/UDA3t41wrdKXcrFkRUBjYdHVmEU37LpV/SukZtk8=;
	b=d+h47/8udF/fbPVWtjPIuwPdSY18cHwIEj1Z2khWPv/3Lc1+r4s6fCKUJ40II35O6V
	Dw+JES0XQOvL/kibefxR9K52cijWCvuEb8GOCgvOlNWCElhXgB77bw+yDzWrx6azt5eu
	hf+uY4TCUySp69/rEHVvrlHAf+13TBRotxg0Si1xIrmRucN9ZuwlVIDSJYcuR13wS0Eu
	vvN2p61XUGW2GDG03OXVlZD8am0KFvn8t3a39aZzpdGZJxZQJVOsVTM2Zt5HFWJv7zjF
	ZHcKZxiZCQ/UOw4E0CCKvKChnUfWDK4+dq7vI/5sT7jFigLXoDExIBsiZJhLesfz6JKA
	3Rgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=KM/UDA3t41wrdKXcrFkRUBjYdHVmEU37LpV/SukZtk8=;
	b=pmKQsazghiBsv8B6UkvPHUryoSM2EmJ1c6gTzqCfybWHmgcQvQ/1Qe6ChyJVWYmOLW
	Fv0zQBOHDXmXrDFhvtryi6GkfNBLSwkd8fF5CroMw3y2AaqyPjv/ta8OwLiQJ4tV6L/E
	vKpqfQepuiJtzcwYUtYZjA+y7I+Fbrh26pBU+3zjw4wkPvSUQSJMvSLWDF9pjEpF/dOW
	yzapvNL+ueQCl09f/QZhwfsH8irp+Q3XjBEIcHuPQRz+9a8F4BkOtnKhsERemr7eAJGn
	txYT3UNrXc/6yLTdyUGIuNQUSXBj4ywBAEx2Ys8ExpyTamkLHkoGcBxO+ZnDgqc0qWh8
	wJhw==
X-Gm-Message-State: AKwxytdEPQVf4OnXDv0PZxTLqAmCspMEi76BDalxjZL1Fww80MMCr4vF
	hdtEDCbt6W0gXrfepo2w204=
X-Received: by 10.200.36.51 with SMTP id c48mr16581895qtc.253.1515419507311;
	Mon, 08 Jan 2018 05:51:47 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	e197sm8153606qka.50.2018.01.08.05.51.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 05:51:46 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
	<afaerber@suse.de>
References: <20180104144046.30793-1-f4bug@amsat.org>
	<20180104144046.30793-5-f4bug@amsat.org>
	<20180108135437.4ab656fb@redhat.com>
	<cf14bfc3-3256-575a-fb4b-69f63d5bdb3b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <aaab7bfd-d3ed-aa50-f09e-89d6ccf556ff@amsat.org>
Date: Mon, 8 Jan 2018 10:51:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <cf14bfc3-3256-575a-fb4b-69f63d5bdb3b@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="wSj7HfeiGcq5zx0HWmgNdqc3bnn7jJFdf"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 4/6] arm/xlnx-zynq: use FDT
 names for the Cadence UART
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
	Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0pIGll7tcUqQ

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wSj7HfeiGcq5zx0HWmgNdqc3bnn7jJFdf
Content-Type: multipart/mixed; boundary="xmrqXpSCOFry21104TCLr0fJVta1nxBIB";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <aaab7bfd-d3ed-aa50-f09e-89d6ccf556ff@amsat.org>
Subject: Re: [Qemu-devel] [RFC PATCH 4/6] arm/xlnx-zynq: use FDT names for the
 Cadence UART
References: <20180104144046.30793-1-f4bug@amsat.org>
 <20180104144046.30793-5-f4bug@amsat.org> <20180108135437.4ab656fb@redhat.com>
 <cf14bfc3-3256-575a-fb4b-69f63d5bdb3b@redhat.com>
In-Reply-To: <cf14bfc3-3256-575a-fb4b-69f63d5bdb3b@redhat.com>

--xmrqXpSCOFry21104TCLr0fJVta1nxBIB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 01/08/2018 10:17 AM, Thomas Huth wrote:
> On 08.01.2018 13:54, Igor Mammedov wrote:
>> On Thu,  4 Jan 2018 11:40:44 -0300
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> ---
>>>  hw/arm/xilinx_zynq.c | 1 +
>>>  hw/arm/xlnx-zynqmp.c | 2 +-
>>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
>>> index 1836a4ed45..c45c364583 100644
>>> --- a/hw/arm/xilinx_zynq.c
>>> +++ b/hw/arm/xilinx_zynq.c
>>> @@ -236,6 +236,7 @@ static void zynq_init(MachineState *machine)
>>>      sysbus_create_simple("xlnx,ps7-usb", 0xE0002000, pic[53-IRQ_OFFS=
ET]);
>>>      sysbus_create_simple("xlnx,ps7-usb", 0xE0003000, pic[76-IRQ_OFFS=
ET]);
>>> =20
>>> +    /* "xlnx,xuartps" */
>>>      cadence_uart_create(0xE0000000, pic[59 - IRQ_OFFSET], serial_hds=
[0]);
>>>      cadence_uart_create(0xE0001000, pic[82 - IRQ_OFFSET], serial_hds=
[1]);
>>> =20
>>> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
>>> index 325642058b..38f038786c 100644
>>> --- a/hw/arm/xlnx-zynqmp.c
>>> +++ b/hw/arm/xlnx-zynqmp.c
>>> @@ -155,7 +155,7 @@ static void xlnx_zynqmp_init(Object *obj)
>>>      }
>>> =20
>>>      for (i =3D 0; i < XLNX_ZYNQMP_NUM_UARTS; i++) {
>>> -        object_initialize(&s->uart[i], sizeof(s->uart[i]), TYPE_CADE=
NCE_UART);
>>> +        object_initialize(&s->uart[i], sizeof(s->uart[i]), "xlnx,zyn=
qmp-uart");
>>
>> I don't think that commas are valid symbol in type names
>> (if I recall correctly it should be letters, numbers and '-')
>=20
> At least commas are a real PITA when you try to use such devices with
> the "-device" CLI parameter. We should try to avoid this if possible, I=

> think.

Ok, good to know.

I was following Linux Device Tree names [1] to avoid handling some
fdt_qemu_to_linux[] & fdt_linux_to_qemu conversion arrays.

What about keeping using the QEMU default name for -device CLI param and
allow aliases for FDT parsing?
With this series the cadence_uart_info is now:

static const TypeInfo cadence_uart_info =3D {
    .name          =3D TYPE_CADENCE_UART,
    .aliases       =3D (const char * []) {
                        "cdns,uart-r1p8",
                        "xlnx,xuartps",
                        "cdns,uart-r1p12",
                        "xlnx,zynqmp-uart",
                        NULL
                     },

[1]:
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bi=
ndings/serial/cdns,uart.txt


--xmrqXpSCOFry21104TCLr0fJVta1nxBIB--

--wSj7HfeiGcq5zx0HWmgNdqc3bnn7jJFdf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlpTd2oACgkQ4+MsLN6t
wN70XxAAoh73zsNWBKVajCReWorBZRCcG2ee1SQe3zj95lThiEUnpshaQ4K0qD8b
tSotZvHreUJp/jKBzv2EwdlBge31p24WJjmOixSaqSsWCk3PFDc3AC4xM5Lp/wTr
kK/3WF26tp6i/+na+qJrw+h4m6rR1LUICN81TrQNsxYeKA/M6yjmvxGOKTDYQcRK
joIKI9iAsYmZBqYZngdgfqQwrVHl0RTHarQAkmZrP7deTXWuxn3cRvoZ2wtMeEok
kznOhkRklNhAILZFmAoo02Jeg0eYOWs5GhVhJ5+gM05TqdPxbbZcAjVLZhLylYDs
173ZOzDXlHWVYM5Qb+F+2RrqCFT0WjOng63mFkn8A0l7ehBuTtCY5WKCJxZbVRrb
ltMhos1eBIHlyKjJ9f4hoXtbXRN0GcoMQeLay+XsVL1V3k5nekQ8HZID6J8Wt40V
qG9acJLCBhLD53BZwJR+CwmQsMmR0/OXgZeQEhThHcyFdxKA8KGsSGsV2DkTWQHg
r6YWh/37unntZ2UYvQOw0QkZLcVOSZren1499GDrxwXJ3l8x4qvWIwu1qNoaG/YH
tH9T23XMRh8VQ9eWBT9mIf7STfyEELTjJ9eXE5HZjvTXpZIxv7VV7SnYTlofBp0R
stl/ujNhrYumHNslrD/xo2kJOBXZmqCFpGIKhMUF6zIv3HkVS0E=
=zNCS
-----END PGP SIGNATURE-----

--wSj7HfeiGcq5zx0HWmgNdqc3bnn7jJFdf--
