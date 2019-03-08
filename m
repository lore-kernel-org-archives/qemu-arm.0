Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7827654wrx;
        Thu, 7 Mar 2019 18:04:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqx1H6ygNKMhqCm8EoyfeWngLXRgX7931ArvMT+w30K/3R13x57KGMQJi/iX9Wfeylaq0L0q
X-Received: by 2002:a5b:909:: with SMTP id a9mr13714659ybq.316.1552010673722;
        Thu, 07 Mar 2019 18:04:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552010673; cv=none;
        d=google.com; s=arc-20160816;
        b=s8/ruWNXnrZLqXpgXMO8/ud2TDJKOmAx+v51VxM6XHXrcCyb0YSvx0WzLU/MFBa8v8
         0W69ARVM2rMBPe1COu8CqJ9rSfkaio3lYs9/egFbH/yBZ3t9Ooq8jGzdscZ3RDqI2VjZ
         VuWgoiqI7vO2VQJV1tzW9undJvEYOaRoetkns0udCWEZO3YgN6uzee51svpZVnPN5gYl
         DQ0rqaVITla/KOs1WKxh6gNU8+e1ifNO2UZhFFfWdQGgq1a9qZCysGgZi1+QTVldJd7T
         bJq9VNgxzAuhloMv+Nsq7pbJUSkOH8KY0UvGnbsfYhXam65/AawPUNRss8kknrieMA0P
         gnZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=ZvLnrTkiKGfM9R86sFPPIiw277njD5fAOywok18YkAU=;
        b=0kSZETVzdpqFxwBcOjJYGi3BKPMsCbAI303iV6SLKGJnVLmHNDfneTGB12vQUA1ED+
         6tyVDrkUg0l9CQNq5TzM9S+eYtRPxCPAKSkx8wk+MjP2qSHBw2O5uVjB2j2w1BFKIXxn
         iUkLFgPr+MT89FIFBF7nszr9Y8+vmurDp31jvzYWbx/LxO0VZs0m8NghrMaECUTfQCO9
         XqTFuNbwXIAf5en7jkavkvGI5SDg7h1FPsIfChkrjqsYULo2OD3zCyvZFwEerEu/7GbD
         wSM8l+4Oj4/ZDRJmgAxQitCQD04VXAKLpaPQ07doazHB9HsXhg7IVtRY4+CxP6J31jKX
         QtKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h143si3705355ywa.352.2019.03.07.18.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 18:04:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35715 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h24sD-0001Gt-8s
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 21:04:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1h24s3-0001GX-5S
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 21:04:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1h24s1-0005Iq-Pw
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 21:04:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34834)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1h24s0-0005Ek-HB; Thu, 07 Mar 2019 21:04:21 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D8D13091784;
	Fri,  8 Mar 2019 02:04:19 +0000 (UTC)
Received: from [10.3.118.35] (ovpn-118-35.phx2.redhat.com [10.3.118.35])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4884219C65;
	Fri,  8 Mar 2019 02:04:10 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-14-philmd@redhat.com>
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
Message-ID: <0e007e09-cf54-312b-9563-59f3994209bf@redhat.com>
Date: Thu, 7 Mar 2019 20:04:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190308013222.12524-14-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 08 Mar 2019 02:04:19 +0000 (UTC)
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
X-TUID: ty5nfgizyE2I

On 3/7/19 7:32 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> When debugging a paravirtualized guest firmware, it results very
> useful to dump the fw_cfg table.
> Add a QMP command which returns the most useful fields.
> Since the QMP protocol is not designed for passing stream data,
> we don't display a fw_cfg item data, only it's size:
>=20
> { "execute": "query-fw_cfg-items" }
> {
>     "return": [
>         {
>             "architecture_specific": false,
>             "key": 0,
>             "writeable": false,
>             "size": 4,
>             "keyname": "signature"

You could return a base64-encoded representation of the field (we do
that in other interfaces where raw binary can't be passed reliably over
JSON).  For 4 bytes, that makes sense,


>         {
>             "architecture_specific": true,
>             "key": 3,
>             "writeable": false,
>             "size": 324,
>             "keyname": "e820_tables"

for 324 bytes, it gets a bit long. Still, may be worth it for the added
debug visibility.


> +++ b/qapi/misc.json
> @@ -3051,3 +3051,47 @@
>    'data': 'NumaOptions',
>    'allow-preconfig': true
>  }
> +
> +##
> +# @FirmwareConfigurationItem:
> +#
> +# Firmware Configuration (fw_cfg) item.
> +#
> +# @key: The uint16 selector key.
> +# @keyname: The stringified name if the selector refers to a well-know=
n
> +#           numerically defined item.
> +# @architecture_specific: Indicates whether the configuration setting =
is

Prefer '-' over '_' in new interfaces.

> +#                         architecture specific.
> +#                  false: The item is a generic configuration item.
> +#                  true:  The item is specific to a particular archite=
cture.
> +# @writeable: Indicates whether the configuration setting is writeable=
 by
> +#             the guest.

writable

> +# @size: The length of @data associated with the item.
> +# @data: A string representating the firmware configuration data.

representing

> +#        Note: This field is currently not used.

Either drop the field until it has a use, or let it be the base64
encoding and use it now.

> +# @path: If the key is a 'file', the named file path.
> +# @order: If the key is a 'file', the named file order.
> +#
> +# Since 4.0
> +##
> +{ 'struct': 'FirmwareConfigurationItem',
> +  'data': { 'key': 'uint16',
> +            '*keyname': 'str',
> +            'architecture_specific': 'bool',
> +            'writeable': 'bool',
> +            '*data': 'str',
> +            'size': 'int',
> +            '*path': 'str',
> +            '*order': 'int' } }

Is it worth making 'keyname' an enum type, and turning this into a flat
union where 'path' and 'order' appear on the branch associated with
'file', and where all other well-known keynames have smaller branches?


> +
> +
> +##
> +# @query-fw_cfg-items:

That looks weird to mix - and _. Any reason we can't just go with
query-firmware-config?

> +#
> +# Returns the list of Firmware Configuration items.
> +#
> +# Returns: A list of @FirmwareConfigurationItem for each entry.
> +#
> +# Since 4.0
> +##
> +{ 'command': 'query-fw_cfg-items', 'returns': ['FirmwareConfigurationI=
tem']}
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org
