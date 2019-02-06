Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5804149wrt;
        Wed, 6 Feb 2019 03:01:07 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbiprptYNoUdS4dWKh1KCorH6uQWouFctMqF7Si/nSknv4e6Jzy7T/Wq3Fw+Y31Lyiy5CAA
X-Received: by 2002:a25:8246:: with SMTP id d6mr7733846ybn.270.1549450867544;
        Wed, 06 Feb 2019 03:01:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549450867; cv=none;
        d=google.com; s=arc-20160816;
        b=mp0tcfGBOBy2gknnHB5oRY2trwre972NVu+QEASoVOG2pHajBE57L69IXkp9uPDjuV
         dL70xlp/eDT2KLUZ0cJImEPH2tZFhC0Ck0Jdpvf7WL+0gTlhXTCBRKX4aMm/+yBKdGle
         DUDGhYmOiXZENfMsSWPNXICMHxsxK8zpYDjJzsOIW0erHHgjUy2f8MsrrlgGnd817+cJ
         Cpwre9/HFDa5F6wcw+O8itAgHh4+btwZiFyt4htQRzIG1YdIVQUtOG2PLlpjEyiUhrRj
         /ZO/hHri+82EQP+Q++uUYql6TxbcHgdvpOH2h2z00is9j6fXKxENl9zUObG2WzKA5Ppz
         aCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=kPovAOuyZai6f/c6pR3JvPe9VKc4Isn3KHRyLLu6U+E=;
        b=nu8OBbsnkjdwR7aZtyTvjr7X0t1D3R1JYSErX+Jv/EH2eSE+AArhJoYIB8aqSUV4SL
         1pUEacrsLLxLkbQuaFcmp9iYY/JP2NkUIMl1Mjm0mr69Fp/GKGIrgTIjieGPoOmIubYB
         Gn5s6r3Io07p1Cv6dXV1wWrBY8OVJjAdT71AwprF6Vk/wWFl+76rVWuUQ9RIalZG1mgu
         9KnQ2FYP7t5zKCXZxDWC06ICE+DCJpIhbuN9U6Z6Sp8Z6LmqJNd/ssKgC9sgv3CUnLxo
         2iVHf91iv4Z/VyqFmsabacAQGqjGydIczOHGDreHsSMJBj87Q33bdr5h8R3sRK700rDY
         5E1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si3432810ybd.132.2019.02.06.03.01.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Feb 2019 03:01:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:48527 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grKx1-0007jG-0R
	for alex.bennee@linaro.org; Wed, 06 Feb 2019 06:01:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1grKwm-0007hj-Hl
	for qemu-arm@nongnu.org; Wed, 06 Feb 2019 06:00:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1grKwk-0003XQ-4N
	for qemu-arm@nongnu.org; Wed, 06 Feb 2019 06:00:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47388)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1grKwf-0003Qk-0i; Wed, 06 Feb 2019 06:00:46 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 805C4C074110;
	Wed,  6 Feb 2019 11:00:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-96.ams2.redhat.com [10.36.116.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C9D963BAF;
	Wed,  6 Feb 2019 11:00:06 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	kumar sourav <sourav.jb1988@gmail.com>, qemu-trivial@nongnu.org
References: <20190127101836.15451-1-sourav.jb1988@gmail.com>
	<33a499ed-6f6a-ccd2-a1f8-48646b6be6c9@redhat.com>
	<05c9ef91-39d7-0579-b007-443748559007@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <fd1de933-9547-3ccb-97e4-090820d2ff31@redhat.com>
Date: Wed, 6 Feb 2019 12:00:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <05c9ef91-39d7-0579-b007-443748559007@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 06 Feb 2019 11:00:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/input/lm832x: set device
 category of lm832x
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: keJMg6V0dOAP

On 2019-01-28 12:10, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Thomas,
>=20
> On 1/28/19 9:37 AM, Thomas Huth wrote:
>>  Hi,
>>
>> On 2019-01-27 11:18, kumar sourav wrote:
>>> Sets the category of lm832x as DEVICE_CATEGORY_INPUT
>>> Devices should be assigned to one of DEVICE_CATEGORY_XXXX
>>>
>>> Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
>>> ---
>>>  hw/input/lm832x.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
>>> index cffbf586d4..07ae5e0aee 100644
>>> --- a/hw/input/lm832x.c
>>> +++ b/hw/input/lm832x.c
>>> @@ -509,6 +509,7 @@ static void lm8323_class_init(ObjectClass *klass,=
 void *data)
>>>      k->recv =3D lm_i2c_rx;
>>>      k->send =3D lm_i2c_tx;
>>>      dc->vmsd =3D &vmstate_lm_kbd;
>>> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>>>  }
>>
>> This device already has DEVICE_CATEGORY_MISC set since it is derived
>> from TYPE_I2C_SLAVE. If you now set another category bit here, the
>> device shows up twice in the output of "-device help". That's not so n=
ice.
>>
>> I see multiple options here:
>>
>> 1) Drop this patch since the device already has a category
>>
>> 2) Make sure to clear_bit() the MISC category here again
>>
>> 3) Remove the set_bit(DEVICE_CATEGORY_MISC, k->categories) in
>>    hw/i2c/core.c - it does not make that much sense to set the
>>    MISC category for an abstract parent class.
>>
>> 4) Introduce a new DEVICE_CATEGORY_I2C which could be used
>>    instead of the DEVICE_CATEGORY_MISC in hw/i2c/core.c
>>
>> One of the last two options sound most appealing to me.
>=20
> Can we go with 0/3/4 together? 0 being this patch:
>=20
>   0) This devices inherited DEVICE_CATEGORY_I2C from his
>      abstract parent, also select the DEVICE_CATEGORY_INPUT
>      bit.

Yes, I guess... Thinking about this again ... dc->categories is a
bitfield, so there is or at least was the original intention that a
device can go into multiple categories. Question: Is this what we want,
and if yes, is everybody fine with the fact that a device shows up
multiple times in the output of "-device help" ? If not, shall we change
the bitfield into a normal enum value?

Anyway, a DEVICE_CATEGORY_I2C is likely a good idea, at least it's
better than MISC here (and we already have DEVICE_CATOGORY_USB, too).
Anybody want to send a patch?

 Thomas
