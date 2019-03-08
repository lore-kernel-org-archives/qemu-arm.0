Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8633531wrx;
        Fri, 8 Mar 2019 09:31:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqzyRKV1ARaZK8PcwfEd/UC54FURly3VgzWSYyVgfWHu7E+2X+ckMYfSBaLhX0TSQWE9GM+P
X-Received: by 2002:a0d:cc08:: with SMTP id o8mr15681184ywd.506.1552066288917;
        Fri, 08 Mar 2019 09:31:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552066288; cv=none;
        d=google.com; s=arc-20160816;
        b=y/OTMpYul8qln4wV172huFfCBLnDnAWlDM3WbxWlOEdZzbFYcc2teMhaD5DUPEifGb
         A5trZDYbUTjWJiBot0Imc5j4h3tOtM6rP2yqnnYjt59qlC7yHzCKtc3AIbQSBgJz7Dtn
         BPR/02wpg/Q/i53k95vaZUR5i9HlV6CWQHRgFItiPSdAOu1L+H8bBYDtttiPP0HgJ5pQ
         5t3tPvAqdYDHY0hgsGifuKxE7tYUXZ3S+xDRg4Fa2gnbKEjgm3ieenJnZ/H/F34QgUkv
         05tDjzxC82FHtuQYAWv6DgaYx9kRUG24V7oNmCK1i6J0u9R1/Mxpb08FX5YmQGrYv5gX
         8vUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=TMwfXqDy/LwCu6kCHwI0RudCcjN1J3W0NYdDSgeMf+w=;
        b=JPqBZxcgvEGYiOSFBIMschMGiuCdpTdpeaFbaRsbTmh4qPbSJiE6qZ0NE22doisRCT
         D7BfOUqo/SiRguyNJ+L8MkwaO2Z6jMJheqH80/AJY9QLIavSKyrxWg2btYeQKoXUuvgw
         pBKngdp0PSH9fWfsqs7Ig1msE3nNXDVguCHaHgc+xLb1+VDIi3rUmD5AdDEoc41y0Jvn
         Bro6JGEvLgTdXkylq2qO3WCAoXbWUy9GBdZqUYaCpWKbvL+Z9cnbkwCFTvs5ZnRh1s7X
         SJq+Zc9M/THTMBAhljBWroX1nmq6tTUWsyYO+6BGjHVZVX7sssvGg5wNZ9j1liNINDrd
         KteA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u130si4982411ywu.30.2019.03.08.09.31.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 09:31:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:47486 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2JLE-0005vM-C5
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 12:31:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1h2JL3-0005v8-QH
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 12:31:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1h2JL2-0004Xw-TJ
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 12:31:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49644)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1h2JL2-0004X7-JN; Fri, 08 Mar 2019 12:31:16 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BED9E81104;
	Fri,  8 Mar 2019 17:31:14 +0000 (UTC)
Received: from [10.3.118.35] (ovpn-118-35.phx2.redhat.com [10.3.118.35])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E69991816A;
	Fri,  8 Mar 2019 17:31:01 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-14-philmd@redhat.com>
	<0e007e09-cf54-312b-9563-59f3994209bf@redhat.com>
	<40319ac6-4545-4e7b-0339-8229727355e3@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
	xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
	xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
	TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
	GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
	sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
	AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
	CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
	RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
	wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
	Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
	gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
	pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
	zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
	pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
	3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
	NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
	cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
	SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
	I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
	mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
	Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
	2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <a3c759a5-73df-f481-ba21-48ece92f1185@redhat.com>
Date: Fri, 8 Mar 2019 11:31:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <40319ac6-4545-4e7b-0339-8229727355e3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 08 Mar 2019 17:31:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 13/18] hw/nvram/fw_cfg: Add QMP 'info
 fw_cfg' command
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2zK3awYKJlRS

On 3/8/19 5:08 AM, Philippe Mathieu-Daud=C3=A9 wrote:

>>> {
>>>     "return": [
>>>         {
>>>             "architecture_specific": false,
>>>             "key": 0,
>>>             "writeable": false,
>>>             "size": 4,
>>>             "keyname": "signature"
>>
>> You could return a base64-encoded representation of the field (we do
>> that in other interfaces where raw binary can't be passed reliably ove=
r
>> JSON).  For 4 bytes, that makes sense,
>>
>>
>>>         {
>>>             "architecture_specific": true,
>>>             "key": 3,
>>>             "writeable": false,
>>>             "size": 324,
>>>             "keyname": "e820_tables"
>>
>> for 324 bytes, it gets a bit long. Still, may be worth it for the adde=
d
>> debug visibility.
>=20
> Until you see values in the next patch...:
>=20
> $ (echo info fw_cfg; echo q) | qemu-system-x86_64 -S -monitor stdio
> Selector  Well-Known Key  Pathname ArchSpec Perm   Size Order Hex Data
> [...]
>  0x0019   file_dir                           RO    2052       0000000b.=
.
>  0x0022   file: etc/acpi/tables              RO  131072  130  46414353.=
.

Yeah, that's a no-go.
>=20
> What about using a 512B limit on this QMP answer?

Seems reasonable. Either omit the field when its size exceeds the limit,
or use the field to give a truncated version (where the size field still
shows the full length, either way).


>>> +# @path: If the key is a 'file', the named file path.
>>> +# @order: If the key is a 'file', the named file order.
>>> +#
>>> +# Since 4.0
>>> +##
>>> +{ 'struct': 'FirmwareConfigurationItem',
>>> +  'data': { 'key': 'uint16',
>>> +            '*keyname': 'str',
>>> +            'architecture_specific': 'bool',
>>> +            'writeable': 'bool',
>>> +            '*data': 'str',
>>> +            'size': 'int',
>>> +            '*path': 'str',
>>> +            '*order': 'int' } }
>>
>> Is it worth making 'keyname' an enum type, and turning this into a fla=
t
>> union where 'path' and 'order' appear on the branch associated with
>> 'file', and where all other well-known keynames have smaller branches?
>=20
> I have no idea about that, I will have a look at QMP flat unions.

Markus can help if you get stuck on what it might look like. But by now,
there are several examples in .qapi files to copy from (look for
'discriminator').

>=20
>>> +
>>> +
>>> +##
>>> +# @query-fw_cfg-items:
>>
>> That looks weird to mix - and _. Any reason we can't just go with
>> query-firmware-config?
>=20
> Way better! I'll use query-firmware-config-items.

Do we need the -items suffix? Also, is there a chance that we might ever
want to extend the command to return more information that is global to
firmware-config rather than per-item?

>>> +{ 'command': 'query-fw_cfg-items', 'returns': ['FirmwareConfiguratio=
nItem']}

As written, this results in:

{ "return": [ { ... }, { ... } ] }

but if you add a layer of nesting, you could have easier extensions:

{ "return": { "global": {}, "items": [ { ... }, { ... } ] } }

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org
