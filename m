Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8766324wrx;
        Fri, 8 Mar 2019 12:00:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqzwFyGRJbGjUCYXWBnKGnwO559zDAwDcnwDi/aJmLAXhD52JwfuCSsob2EttKF6tbY/9i0R
X-Received: by 2002:a25:7357:: with SMTP id o84mr16980260ybc.450.1552075244444;
        Fri, 08 Mar 2019 12:00:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552075244; cv=none;
        d=google.com; s=arc-20160816;
        b=paxBZ6RLteoY/iYAQgKKsjZGTz67KGZNB5XYdf3mmlI2ZhASnnJrBMMeW80fVaDe0F
         iX+lsMX8p/sgCj0xV5bDylCGAFGnfOjdrYMz9ZOYeAkhg3fb/T/1SvezIBmzeETtjxpL
         pDWX5E6Hyy5sVZS+9DgfcDfXzzMA9YVP7OAII+19P9bxItuR7cB13KqgbPunei+HTQv2
         1DqVyWx2MhHdOGvpknGCG6zvhL6ZKEjVhHe1bnDjjZfSORF3paqFSJkQby1qRMH11gPO
         gLU/uQUIxpawSuGtDNcDD6PndIk0Aaby9vzvtowHV7okOl/JaPSFlR/rEuPvacuuNvjC
         tjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=3jNMpBL4ZuNWvhcpe9pVAH1DQybvLS3Sk/R/bYVtk1A=;
        b=Ckw1Q3OU98kkT6SYx19tqraN2m3xoiDV4NdQuMPcu/UataLh4PeywmKE7X6L6hRpel
         sGWfkL1thxvOx7t4b6oQPT1UEJZ6vHRERBVxXyDpo3eUM3eMzy5XonxBSgN2RxfNzInB
         12Akbg50wkanCVzxzMbxtuLKJjbpVGs0sPybO/ZE1G3ynqGmRFREC/XT7QfrYEP62MI2
         9O0pWt6r930hrbKMUF7/4HanHXGhg091pc23ZyGZb1xBD5EvsGfrCYId1n8U1h2WquNS
         zpSVPIQ+CK3PueSrbGnX0D+gLmd2do15qkcDSbOzRJLf9RI81pvN/2Du5P8G2extkoQD
         xgqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d139si5457202ywb.251.2019.03.08.12.00.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 12:00:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Lff-00031s-Vt
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 15:00:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2LfR-00031a-Uh
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 15:00:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2LfQ-0007qD-PU
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 15:00:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56422)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1h2LfQ-0007ni-CZ; Fri, 08 Mar 2019 15:00:28 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4EC5C821F1;
	Fri,  8 Mar 2019 20:00:25 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-125-221.rdu2.redhat.com
	[10.10.125.221])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3488607D8;
	Fri,  8 Mar 2019 20:00:04 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-14-philmd@redhat.com>
	<0e007e09-cf54-312b-9563-59f3994209bf@redhat.com>
	<40319ac6-4545-4e7b-0339-8229727355e3@redhat.com>
	<a3c759a5-73df-f481-ba21-48ece92f1185@redhat.com>
	<9f1cdb48-3262-de5e-a500-1dfb3d6372e5@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <f4d5a154-0c9d-0e1c-144c-c6855dadafd6@redhat.com>
Date: Fri, 8 Mar 2019 21:00:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <9f1cdb48-3262-de5e-a500-1dfb3d6372e5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 08 Mar 2019 20:00:25 +0000 (UTC)
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
X-TUID: JAmO0DTxtVG6

On 03/08/19 19:07, Philippe Mathieu-Daud=C3=A9 wrote:
> On 3/8/19 6:31 PM, Eric Blake wrote:
>> On 3/8/19 5:08 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>>
>>>>> {
>>>>>     "return": [
>>>>>         {
>>>>>             "architecture_specific": false,
>>>>>             "key": 0,
>>>>>             "writeable": false,
>>>>>             "size": 4,
>>>>>             "keyname": "signature"
>>>>
>>>> You could return a base64-encoded representation of the field (we do
>>>> that in other interfaces where raw binary can't be passed reliably o=
ver
>>>> JSON).  For 4 bytes, that makes sense,
>>>>
>>>>
>>>>>         {
>>>>>             "architecture_specific": true,
>>>>>             "key": 3,
>>>>>             "writeable": false,
>>>>>             "size": 324,
>>>>>             "keyname": "e820_tables"
>>>>
>>>> for 324 bytes, it gets a bit long. Still, may be worth it for the ad=
ded
>>>> debug visibility.
>>>
>>> Until you see values in the next patch...:
>>>
>>> $ (echo info fw_cfg; echo q) | qemu-system-x86_64 -S -monitor stdio
>>> Selector  Well-Known Key  Pathname ArchSpec Perm   Size Order Hex Dat=
a
>>> [...]
>>>  0x0019   file_dir                           RO    2052       0000000=
b..
>>>  0x0022   file: etc/acpi/tables              RO  131072  130  4641435=
3..
>>
>> Yeah, that's a no-go.
>>>
>>> What about using a 512B limit on this QMP answer?
>>
>> Seems reasonable. Either omit the field when its size exceeds the limi=
t,
>> or use the field to give a truncated version (where the size field sti=
ll
>> shows the full length, either way).
>=20
> OK.
>=20
>>>>> +# @path: If the key is a 'file', the named file path.
>>>>> +# @order: If the key is a 'file', the named file order.
>>>>> +#
>>>>> +# Since 4.0
>>>>> +##
>>>>> +{ 'struct': 'FirmwareConfigurationItem',
>>>>> +  'data': { 'key': 'uint16',
>>>>> +            '*keyname': 'str',
>>>>> +            'architecture_specific': 'bool',
>>>>> +            'writeable': 'bool',
>>>>> +            '*data': 'str',
>>>>> +            'size': 'int',
>>>>> +            '*path': 'str',
>>>>> +            '*order': 'int' } }
>>>>
>>>> Is it worth making 'keyname' an enum type, and turning this into a f=
lat
>>>> union where 'path' and 'order' appear on the branch associated with
>>>> 'file', and where all other well-known keynames have smaller branche=
s?
>>>
>>> I have no idea about that, I will have a look at QMP flat unions.
>>
>> Markus can help if you get stuck on what it might look like. But by no=
w,
>> there are several examples in .qapi files to copy from (look for
>> 'discriminator').
>=20
> OK.
>=20
>>>
>>>>> +
>>>>> +
>>>>> +##
>>>>> +# @query-fw_cfg-items:
>>>>
>>>> That looks weird to mix - and _. Any reason we can't just go with
>>>> query-firmware-config?
>>>
>>> Way better! I'll use query-firmware-config-items.
>>
>> Do we need the -items suffix? Also, is there a chance that we might ev=
er
>> want to extend the command to return more information that is global t=
o
>> firmware-config rather than per-item?
>=20
> Laszlo suggested it could be useful to ask for a specific item (with th=
e
> full data encoded?).

It's possible I referred to that a long time ago, but most recently, I
think it has been raised by Dave.

Thanks
Laszlo

>=20
>>>>> +{ 'command': 'query-fw_cfg-items', 'returns': ['FirmwareConfigurat=
ionItem']}
>>
>> As written, this results in:
>>
>> { "return": [ { ... }, { ... } ] }
>>
>> but if you add a layer of nesting, you could have easier extensions:
>>
>> { "return": { "global": {}, "items": [ { ... }, { ... } ] } }
>>
>=20
> Oh I guess I got it, I'll try it.
>=20
> Thanks!
>=20
> Phil.
>=20

