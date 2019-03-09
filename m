Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9567876wrx;
        Sat, 9 Mar 2019 07:11:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxKbSoiuvS4XzvsNvr49jG32usQk8MHq7mFVVZuE253Nzp3WzDKHed31XxopckFNPuNXolN
X-Received: by 2002:a25:9241:: with SMTP id e1mr3733636ybo.135.1552144262425;
        Sat, 09 Mar 2019 07:11:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552144262; cv=none;
        d=google.com; s=arc-20160816;
        b=FuVTpQnpMvM3JDme+oxGRrbojLnkt0C0uxmn8gn6RClAsKocKNjGXx0l95ht746TSh
         CrOWNBmmGqGpFWoNLdeNTPJ5YvUm2e4gEbnEcUBH4aqXMxm/ZkQtaXKZM1XlY9z85TpU
         cZ56JP8kjLnWmgzpm+YKBjmLGQZHu1kDJ8N3XQvLS6o1qay1nZ+oLUU6MMt+BN4ktcbB
         d1Wf/Be+2XKwEUTGsvHUDHPN3JVDAYtqwOByejGCr8dfVehRJS59c3PPqjJN9WaQIX08
         mV45jVB6ysFs4DyTkOxsm0YLjGLiqOSQ2GR2AfeKLvVxA0lODTtf+6awhRV+ESGI6+xx
         BKQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=5SHNhpkcsg0BK4U7+bH4qK9CjgxKCK9r+bJaLho6fck=;
        b=LPo9MD0SFxgilAwxtPTc61nV+OHVhQ+95btm/DJPJZpRicFUnkBDIyvMeqCGtxMF/v
         STbw6p1spDCcpIDW//TR/CmndMyM0NBqXiYyFUl6B/toKCAPeQF6Zpkd4rEb2Caa+XFD
         p2sBY26LGLdiPzYruKcZhED6Re9AZfxhW60Aznbaeho+lkrOw/SrJDV3fzEQeQTTtzzS
         4gK+VDLnn020g34iJVATH1qp7i7P1VYPxsqzgQbwPyVXNMWlWx8Pl0ftJPjCe/n9QQsf
         oP/kAFqxccAZxhp4IH3SSCtoHtJg3UtEdpH7JzRcmhNnqzRzO53+Sj3ZljH/HoLfAlzP
         E0MA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18si322883ybl.347.2019.03.09.07.11.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Mar 2019 07:11:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60147 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2dcr-0007ZE-QH
	for alex.bennee@linaro.org; Sat, 09 Mar 2019 10:11:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h2dcg-0007YN-DG
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 10:10:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h2dcf-00048e-Fk
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 10:10:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52854)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h2dcf-00042v-7F; Sat, 09 Mar 2019 10:10:49 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47DDA118ECD;
	Sat,  9 Mar 2019 15:10:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41D02194AF;
	Sat,  9 Mar 2019 15:10:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id CD9251138660; Sat,  9 Mar 2019 16:04:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-14-philmd@redhat.com>
	<0e007e09-cf54-312b-9563-59f3994209bf@redhat.com>
Date: Sat, 09 Mar 2019 16:04:27 +0100
In-Reply-To: <0e007e09-cf54-312b-9563-59f3994209bf@redhat.com> (Eric Blake's
	message of "Thu, 7 Mar 2019 20:04:09 -0600")
Message-ID: <875zss3x8k.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Sat, 09 Mar 2019 15:10:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 13/18] hw/nvram/fw_cfg: Add
 QMP 'info fw_cfg' command
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
	Eduardo Habkost <ehabkost@redhat.com>, "Michael
	S. Tsirkin" <mst@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Laszlo Ersek <lersek@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hEjtNFa60ZKb

The subject "Add QMP 'info fw_cfg' command" misspells query-fw_cfg-items
:)

Eric Blake <eblake@redhat.com> writes:

> On 3/7/19 7:32 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> When debugging a paravirtualized guest firmware, it results very
>> useful to dump the fw_cfg table.
>> Add a QMP command which returns the most useful fields.
>> Since the QMP protocol is not designed for passing stream data,
>> we don't display a fw_cfg item data, only it's size:
>>=20
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
>
>
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

Ignorant questions, I'm afraid...

What determines the possible values of @key?

What's the difference between a "well-known" and a "not well-known"
value?  Examples?

>> +# @architecture_specific: Indicates whether the configuration setting is
>
> Prefer '-' over '_' in new interfaces.
>
>> +#                         architecture specific.
>> +#                  false: The item is a generic configuration item.
>> +#                  true:  The item is specific to a particular architec=
ture.
>> +# @writeable: Indicates whether the configuration setting is writeable =
by
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
>
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

Discriminator can't be optional.  Obvious solution: add a suitabable
enum value for "other" key values.

Leads to something like this (untested):

    { 'union': 'FirmwareConfigurationItem',
      'base': { 'key': 'uint16',
                'keyname': 'FirmwareConfigurationKey',
                ... more members that make sense regardless of @key ... },
      'discriminator': 'key',
      'data': {
                'file': 'FirmwareConfigurationItemFile',
                ... more variants, if any ... } }

where 'FirmwareConfigurationItemFile' is a struct type containing the
members that make sense just for 'file'.

>> +
>> +
>> +##
>> +# @query-fw_cfg-items:
>
> That looks weird to mix - and _. Any reason we can't just go with
> query-firmware-config?
>
>> +#
>> +# Returns the list of Firmware Configuration items.
>> +#
>> +# Returns: A list of @FirmwareConfigurationItem for each entry.
>> +#
>> +# Since 4.0
>> +##
>> +{ 'command': 'query-fw_cfg-items', 'returns': ['FirmwareConfigurationIt=
em']}
>>=20
