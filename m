Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8233539wrx;
        Fri, 8 Mar 2019 03:08:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqwN2UZnUMHCW2rj8bcH0UzluXtws1H2Zyqur1UrpgWrKgzlm6udSMteCgsI+Mhp+uVzbPgB
X-Received: by 2002:a81:578e:: with SMTP id l136mr14242576ywb.499.1552043305932;
        Fri, 08 Mar 2019 03:08:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552043305; cv=none;
        d=google.com; s=arc-20160816;
        b=LbSzyJ92u40RNE5kauC+E+fnfm5sIX8n5UvteUZUeovQ/hRVecdtQWg9oUuO4zsUA1
         KwLFII+ONrFwx/FGKpyI2CjbuLpnhWh7AA9Vt1hsKZXlWUpRj6rmC9HP/wqMSjHo97YC
         xy4lKYRNLwn2jveRPh0Tsmb03OcoCWrtpZUn0vanSaO5hmIOUgrFttScjddCWuaH3y93
         KXokqS4Vo3fJw+HvY4MUH4SO5zkGrbW3Wvncfo6Wt5LfE33kX5TJm3xD7E6unoSDx26Y
         G9/FOej7tNQmDqzmn7pLyN03/iccXIJqvkcl2vFUV7U7dimnG1pP1wUBTYlWt1UdcuYX
         YLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=eFMFyt29niOoK2mmhrHtgVlROh9U/O5Y0P7ljGzDu2w=;
        b=xI6wTmPBaDgGNlUqe5OyTXxvMYtOz1tJ+bf3JTRlOTIjEGt/igH7mGblvz83tNeqlZ
         a4+WruzrOfsnhHhIfeEylPVI4Rm3DtnLKv5iSkW3aklumbKRKWhgjoD2KoeSjBT1TOKc
         g5x/9L6wrtkuanA9aRRSTbU2KVvW/yC6f/KypiR8X7r7YEcxcaRAS3JTA04PuY6oPDQd
         lpxodoJpVc9WTGs5WRtYW6r+WZUIyqL8175JjofWsH8H1lKh/u3bnQMfpLJ1rBQLMX2c
         pFDe/cjbLGajWNeBVJ6ffCLt+TkfyiACMh34QYERnSHfZYiIkFSQg150hJNGjLhscTPM
         x8EA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3si4437459ywh.6.2019.03.08.03.08.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 03:08:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41067 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2DMX-0004pM-Cd
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 06:08:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2DMM-0004nr-2R
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:08:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2DML-0008Vy-2I
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:08:14 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35247)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1h2DMK-0008UA-RE
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:08:12 -0500
Received: by mail-wr1-f67.google.com with SMTP id t18so20927407wrx.2
	for <qemu-arm@nongnu.org>; Fri, 08 Mar 2019 03:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eFMFyt29niOoK2mmhrHtgVlROh9U/O5Y0P7ljGzDu2w=;
	b=tXFinTo2ewODsx7A03Bx/+8b5foGMp8vcAaWqLKNtB/1KBExX4Lo331mMmFpFGbDvZ
	Yo5UtC3Xbo8XOs9AB98nV1NxBI5xKTzWXJQVQNB2uYHD+LD9n1G3dZQOVlsI72G2oVzK
	Cnlb9tu/zcPEqBuoHCyDBUh82QiRKSxXv9om9OyCuyxAY5Nl40qHpuZzhL/dDkmXeGXt
	vjW/XdCF3HRM/FpjWtRt0QD7fuv7YgxYS7ohS40JOs4a2ibGMbvFwjc6rmBl3rEHS5FH
	0Thu6XQJ2gQ+J2GzVn/cp2jqJIgc9vD5IInEMA7vwehh50TV8dbgz4LB19Vte125H7eD
	yoSg==
X-Gm-Message-State: APjAAAXR+lfAzn7bgEx/bBRJhhpkC4kxJcoUR43mtjbejyV+XRE7f4CP
	I7w3Il0Ha4Trn0IQ35iRglEk8A==
X-Received: by 2002:adf:f103:: with SMTP id r3mr11407058wro.50.1552043291692; 
	Fri, 08 Mar 2019 03:08:11 -0800 (PST)
Received: from [192.168.1.40] (43.red-88-25-181.staticip.rima-tde.net.
	[88.25.181.43]) by smtp.gmail.com with ESMTPSA id
	y20sm10683034wra.51.2019.03.08.03.08.10
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 03:08:11 -0800 (PST)
To: Eric Blake <eblake@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-14-philmd@redhat.com>
	<0e007e09-cf54-312b-9563-59f3994209bf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <40319ac6-4545-4e7b-0339-8229727355e3@redhat.com>
Date: Fri, 8 Mar 2019 12:08:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <0e007e09-cf54-312b-9563-59f3994209bf@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
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
X-TUID: Won9UR3QzDLo

Hi Eric,

On 3/8/19 3:04 AM, Eric Blake wrote:
> On 3/7/19 7:32 PM, Philippe Mathieu-Daudé wrote:
>> When debugging a paravirtualized guest firmware, it results very
>> useful to dump the fw_cfg table.
>> Add a QMP command which returns the most useful fields.
>> Since the QMP protocol is not designed for passing stream data,
>> we don't display a fw_cfg item data, only it's size:
>>
>> { "execute": "query-fw_cfg-items" }
>> {
>>     "return": [
>>         {
>>             "architecture_specific": false,
>>             "key": 0,
>>             "writeable": false,
>>             "size": 4,
>>             "keyname": "signature"
> 
> You could return a base64-encoded representation of the field (we do
> that in other interfaces where raw binary can't be passed reliably over
> JSON).  For 4 bytes, that makes sense,
> 
> 
>>         {
>>             "architecture_specific": true,
>>             "key": 3,
>>             "writeable": false,
>>             "size": 324,
>>             "keyname": "e820_tables"
> 
> for 324 bytes, it gets a bit long. Still, may be worth it for the added
> debug visibility.

Until you see values in the next patch...:

$ (echo info fw_cfg; echo q) | qemu-system-x86_64 -S -monitor stdio
Selector  Well-Known Key  Pathname ArchSpec Perm   Size Order Hex Data
[...]
 0x0019   file_dir                           RO    2052       0000000b..
 0x0022   file: etc/acpi/tables              RO  131072  130  46414353..
 0x0028   file: etc/table-loader             RO    4096  140  01000000..

What about using a 512B limit on this QMP answer?

>> +++ b/qapi/misc.json
>> @@ -3051,3 +3051,47 @@
>>    'data': 'NumaOptions',
>>    'allow-preconfig': true
>>  }
>> +
>> +##
>> +# @FirmwareConfigurationItem:
>> +#
>> +# Firmware Configuration (fw_cfg) item.
>> +#
>> +# @key: The uint16 selector key.
>> +# @keyname: The stringified name if the selector refers to a well-known
>> +#           numerically defined item.
>> +# @architecture_specific: Indicates whether the configuration setting is
> 
> Prefer '-' over '_' in new interfaces.

OK!

> 
>> +#                         architecture specific.
>> +#                  false: The item is a generic configuration item.
>> +#                  true:  The item is specific to a particular architecture.
>> +# @writeable: Indicates whether the configuration setting is writeable by
>> +#             the guest.
> 
> writable
> 
>> +# @size: The length of @data associated with the item.
>> +# @data: A string representating the firmware configuration data.
> 
> representing
> 
>> +#        Note: This field is currently not used.
> 
> Either drop the field until it has a use, or let it be the base64
> encoding and use it now.

Well, it is used by the HMP command, to pass the hexdump.
I'm rather fine using the base64 encoding.

>> +# @path: If the key is a 'file', the named file path.
>> +# @order: If the key is a 'file', the named file order.
>> +#
>> +# Since 4.0
>> +##
>> +{ 'struct': 'FirmwareConfigurationItem',
>> +  'data': { 'key': 'uint16',
>> +            '*keyname': 'str',
>> +            'architecture_specific': 'bool',
>> +            'writeable': 'bool',
>> +            '*data': 'str',
>> +            'size': 'int',
>> +            '*path': 'str',
>> +            '*order': 'int' } }
> 
> Is it worth making 'keyname' an enum type, and turning this into a flat
> union where 'path' and 'order' appear on the branch associated with
> 'file', and where all other well-known keynames have smaller branches?

I have no idea about that, I will have a look at QMP flat unions.

>> +
>> +
>> +##
>> +# @query-fw_cfg-items:
> 
> That looks weird to mix - and _. Any reason we can't just go with
> query-firmware-config?

Way better! I'll use query-firmware-config-items.

Thanks for the review,

Phil.

>> +#
>> +# Returns the list of Firmware Configuration items.
>> +#
>> +# Returns: A list of @FirmwareConfigurationItem for each entry.
>> +#
>> +# Since 4.0
>> +##
>> +{ 'command': 'query-fw_cfg-items', 'returns': ['FirmwareConfigurationItem']}
>>

