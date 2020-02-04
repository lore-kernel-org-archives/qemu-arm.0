Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5300896lfp;
        Tue, 4 Feb 2020 04:28:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqwTNU2GCUgMHbt9GqbU5zAZ0GBz63x6OpmsDWwgPd0ID4N7Dd64rOn3ej+Jwef77UhLVcBm
X-Received: by 2002:ac8:76d7:: with SMTP id q23mr20685750qtr.198.1580819293802;
        Tue, 04 Feb 2020 04:28:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580819293; cv=none;
        d=google.com; s=arc-20160816;
        b=CjKDMEN+CjGB3SbLeHASUO5Zd6W9K7/W0joJ1QPJkGoH0wTn5jUzbNpf0OxlgNp7AD
         7pBE2CUJRabe/doF6acLa/b4jXmHbKe/oN53OWS1VhuwViGFF+WfMY+kCxjk/OImwKqd
         jnpPAiNzTUlov9/1a+eMErdjiqJqFzjIJH2rx0cbIYPwvDM/VDg+4n3C10wKHGEopG9b
         N9YX4gXj5rcheG8RY8+dWLTXekXKD9KQew7ns+vP2oSKEiI04VCsuCKMOGEMKeZ0Rodt
         hrswYYmgO4AajjeyEwyFZOO4EPbjRgpaiCAHClHAC73SLo1O1jN2iWpwvVLLfYPVU+Ca
         0PPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NMrQ2FqiJxtXMoywPmShxbp0CDoQFF8TiGnGLfh3VL0=;
        b=qVYPQONPwA0UVID9ur1JbrkPFdz7lU5TwHX3JKlsiyONT2ihFoGZPa52276cIXYzOi
         t8t7ykHfZqgazu0WjuxpyW7kwwAsCyRH615ggFDUlYPtT50bJdKSOO4GaiPs80crsZtr
         8T71yIiBBLFgVtztc9j249hCoPprn2pXvV/FGPaDQhPHJ/iq8sTtfDzkCMjdIGA7Mkfw
         jAC6zo9oqVl8I7AX7FN02PA9pqpaCyDsYiVHnLELSrMyxVBEDXjT/rhHAWWY1R3CQZIl
         ie939rhBJzZl8z6fs+AqWBpiWoch0y8781Mt5/YvbuB+c1+COtBpuYOLhAsnI3ePO1LF
         N7Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J2V79SaJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si12703737qvx.171.2020.02.04.04.28.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 04:28:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J2V79SaJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyxJN-000078-7y
	for alex.bennee@linaro.org; Tue, 04 Feb 2020 07:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38734)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iyxJF-00006f-H5
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 07:28:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iyxJE-0003bx-F0
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 07:28:05 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27552
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iyxJE-0003Zs-Ae
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 07:28:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580819284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NMrQ2FqiJxtXMoywPmShxbp0CDoQFF8TiGnGLfh3VL0=;
 b=J2V79SaJtNUrUqpqHRscojBliEBJweUJJ4U0WDeVDSXDSe+lzTQdR+UKc1ZKIMTxPVxElm
 6bRvotpdbCs8fUdzVnxEAI4+VVuBttsJqXULmF68NGuOAqsT2F1/uBS5hYgAxURaKIN0rH
 IwBLak91WF23eZn9wpVdQ2LwxYVoBoA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-wvqDXyISOR6QaU5Bt63vhg-1; Tue, 04 Feb 2020 07:28:02 -0500
Received: by mail-wr1-f71.google.com with SMTP id s13so10034712wru.7
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2020 04:28:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cPt9M0d6iDtsqmwQp6NOAbnKeDl8EVjT5esYR0OjJQU=;
 b=KJ9RjIbLiJCUKlDCJV1VfDFQ9oKSMH0EsTTt5QBHbfZcECGS4TosVSclaPyPYjxuly
 VuZpwhwDTZXvlmdcbaATKTnxPEU1Ugcg0NBIZAc8IPOTPfveCM485y44NeTq0f96ASiI
 sdKC9cSk29Ow3N9T40NEKRhRb8uukNuTNUGePIuxErS/hroe92AGALBzmqOwjBwgYpB9
 MUeaMPcaamutBpk7yQXvZyQETeZUkP9rXO3WcR+X+fGuKcOwBS/qvDLBFtV+BsMLawDe
 WwppbTCv/MpF4Wd3ncnIB9UBHAbNDG6M/TbJlzwob2FCrfTLmFWaTVbn8I54SmYdAj7g
 9IjQ==
X-Gm-Message-State: APjAAAWBiuoS5UG6hyGHHMk45Ay4+w8cJcrvG4JysbFIwLot0EEkQTD5
 gyUn8/G40fHddQ3453K2owAvVjnAGFZGF8W7gJ50nu19HNF7HrSJP2H114LfswnUfHsxeeSROZb
 F3w69r/yL2YIF
X-Received: by 2002:a1c:a752:: with SMTP id q79mr5315074wme.64.1580819281366; 
 Tue, 04 Feb 2020 04:28:01 -0800 (PST)
X-Received: by 2002:a1c:a752:: with SMTP id q79mr5315054wme.64.1580819281160; 
 Tue, 04 Feb 2020 04:28:01 -0800 (PST)
Received: from [192.168.1.35] (162.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.162])
 by smtp.gmail.com with ESMTPSA id l15sm29370822wrv.39.2020.02.04.04.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2020 04:28:00 -0800 (PST)
Subject: Re: [PATCH 2/3] m25p80: Improve command handling for Jedec and
 unsupported commands
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Guenter Roeck <linux@roeck-us.net>, Alistair Francis <alistair@alistair23.me>
References: <20200203180904.2727-1-linux@roeck-us.net>
 <20200203180904.2727-2-linux@roeck-us.net>
 <accf297f-0c54-7475-8817-c1014999a57d@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4ac29597-25f8-5bf3-ef67-8bb846295de2@redhat.com>
Date: Tue, 4 Feb 2020 13:27:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <accf297f-0c54-7475-8817-c1014999a57d@kaod.org>
Content-Language: en-US
X-MC-Unique: wvqDXyISOR6QaU5Bt63vhg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gL87bH6vBCWs

On 2/4/20 9:53 AM, C=C3=A9dric Le Goater wrote:
> On 2/3/20 7:09 PM, Guenter Roeck wrote:
>> Always report 6 bytes of JEDEC data. Fill remaining data with 0.
>>
>> For unsupported commands, keep sending a value of 0 until the chip
>> is deselected.
>>
>> Both changes avoid attempts to decode random commands. Up to now this
>> happened if the reported Jedec data was shorter than 6 bytes but the
>> host read 6 bytes, and with all unsupported commands.
>=20
> Do you have a concrete example for that ? machine and flash model.
>=20
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   hw/block/m25p80.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>> index 63e050d7d3..aca75edcc1 100644
>> --- a/hw/block/m25p80.c
>> +++ b/hw/block/m25p80.c
>> @@ -1040,8 +1040,11 @@ static void decode_new_cmd(Flash *s, uint32_t val=
ue)
>>           for (i =3D 0; i < s->pi->id_len; i++) {
>>               s->data[i] =3D s->pi->id[i];
>>           }
>> +        for (; i < SPI_NOR_MAX_ID_LEN; i++) {
>> +            s->data[i] =3D 0;
>> +        }
>=20
> It seems that data should be reseted in m25p80_cs() also.

I am not sure, since a guest can queue various requests in a single=20
frame. Guenter patch seems correct to me.

All the others uses in decode_new_cmd() fill data[] up to the correct=20
length, so are safe.

In complete_collecting_data() the access to data[] should be protected=20
by STATE_COLLECTING_VAR_LEN_DATA (state only changes when enough data).

>>  =20
>> -        s->len =3D s->pi->id_len;
>> +        s->len =3D SPI_NOR_MAX_ID_LEN;
>>           s->pos =3D 0;
>>           s->state =3D STATE_READING_DATA;
>>           break;
>> @@ -1158,6 +1161,11 @@ static void decode_new_cmd(Flash *s, uint32_t val=
ue)
>>           s->quad_enable =3D false;
>>           break;
>>       default:
>> +        s->pos =3D 0;
>> +        s->len =3D 1;
>> +        s->state =3D STATE_READING_DATA;
>> +        s->data_read_loop =3D true;
>> +        s->data[0] =3D 0;
>>           qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", val=
ue);
>>           break;
>>       }
>>
>=20
>=20

