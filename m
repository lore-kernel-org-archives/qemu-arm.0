Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp885101lfg;
        Thu, 20 Feb 2020 10:55:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqz5hDzwG7vUPcTtJZdI4xFINcMrFYcdDxTQOQ5cXiY6JfqiSZb5g2hLlaurUZzeewL2ht9C
X-Received: by 2002:a0c:fa4b:: with SMTP id k11mr26400268qvo.55.1582224922775;
        Thu, 20 Feb 2020 10:55:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582224922; cv=none;
        d=google.com; s=arc-20160816;
        b=KTHVgQE/RnKVKt8JXNK/ZFULM+ysKkGQJ+LQxWV0fcWNLi+NjdrLyZWfjiDAiMRNhK
         3DmxET+esBaH7kYkBE1Lr3Ba06NaMeQA8W2E6f0wgqbAV/bXWnWxelgZ8fWxkss7dCxb
         pjQga8AkLJJPRLN8f+SyOeXFI+S86L59YDMN3B6Kuvn6ANgzDD9azk/qkJKHmE0YDdsw
         VI1Z3LRcRCTqhxIcuSzdUAoVrwKqH/xPwMtdJaEzUB4vP31yuyl7PXxecoXkZRpDyJUy
         GKOgb8SKfs2fPpqYYBumA9JD6r24odkDNUOlpetuGxYXdXE8OBQnFZNZd/+Q9EccAHui
         7tyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=E/ISRqWUQ9crFu8+Rj92wrQO2n/nJhQkjiD6L0oia/0=;
        b=s0+cAf8ZqUcFglVyUxl+JdmWdAuW2F586qj27FLalMycppQ7qsSkwHqAzSr6gTfhQw
         Q3UOXSlTVknvMi8coxQcfwtgeOxs5uZgsGhX9LRsxsJFfTAlcb9jfzFgXgcSw99kuw4+
         IZgKr3u9TRSuBH76yMDTLRX2AEozdcdahQqlX9jK06ty5R92oSl3UZA3WU3oLgW8658S
         kaON1xEZgL0BVnDmcIeemKMiok6AhyXFpAHt8Mi1TM8qvjcrsdUnrnDW4GdKHTiCCEhf
         pI+zFaXPqvzLFqTsE1neTXdCzeNtDD8h4+zgxM3hetgRpdpACppqc19omVYfmJCOmsVu
         uyZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CAk1ih3x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4si190346qka.369.2020.02.20.10.55.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 10:55:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CAk1ih3x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4qyo-0002tM-7I
	for alex.bennee@linaro.org; Thu, 20 Feb 2020 13:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53390)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j4qyh-0002sj-Mb
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 13:55:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j4qyg-0000Ch-KK
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 13:55:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55977
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j4qyg-0000CA-Go
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 13:55:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582224913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E/ISRqWUQ9crFu8+Rj92wrQO2n/nJhQkjiD6L0oia/0=;
 b=CAk1ih3x+YKlkMvHU/o3Drp/hKxdTMMpki/F8BsNGH60/VcChusnl86fl0xlPHD5CTuqC2
 OoX4yN0Wl91bqii5WPhZOSY/gYGOkz85vZoc7IuI1eZ6fbTtRnaAt+O+eJx4I6eOVoJHo1
 Nhu3m65jPgks70kDYkEm4C5gcoK1tHE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-e8QTmIyfPjCGhm18K6pSQw-1; Thu, 20 Feb 2020 13:51:40 -0500
Received: by mail-wm1-f69.google.com with SMTP id b205so1206493wmh.2
 for <qemu-arm@nongnu.org>; Thu, 20 Feb 2020 10:51:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+PtlgtaIhxq7h+o4lI5bSBjKgkyOqgUBIzSUB2rcEfo=;
 b=uUciW9PWoAP704iJRT3oqcQOXP/xtfgFWocRLvKTqzED2U+y1IIwGrAGwe5CSbdd8e
 +YYrlokGdUlvBItWA3Ab/qikeCTOXZreannS+xeSXaINR5H5OlmBOCdvUmoiN3EqAdAc
 GPwWDUlUnNK5ORsBHsNmJqDYFzvS6NQ9MHlqW/JvYx+rehGbyH34EcKo/ao4hgL+3qtT
 nNG7aWlGo0lUI2su3btj2gaWhU2HRkMM3LYolmuXsCMmKE8WLGp8DP+ULaINedg4sWHQ
 EIsRiqUB48XFGd21TRiNMqy4fkkdmqCiODd9YgbS+nX97Vcj/s9IhJZUy4QCa0p1b6v1
 HIMA==
X-Gm-Message-State: APjAAAXrCVLCLGW2dpCJ/CqTIg/6nifkH6FCcCTeZg5Bki/N7X4p/JB5
 5Y/sYBumO7RYKr4X7O0s13q2dG7FWSHunU9+nXoQZ8eijodvOlhcbwRjnbfDNo5MPVuRVpBEuVH
 8vS8zWYVA2ilj
X-Received: by 2002:a5d:534d:: with SMTP id t13mr45856220wrv.77.1582224697546; 
 Thu, 20 Feb 2020 10:51:37 -0800 (PST)
X-Received: by 2002:a5d:534d:: with SMTP id t13mr45856194wrv.77.1582224697238; 
 Thu, 20 Feb 2020 10:51:37 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id n3sm268218wmc.27.2020.02.20.10.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 10:51:36 -0800 (PST)
Subject: Re: [PATCH v2 2/2] hw: move timer_new from init() into realize() to
 avoid memleaks
To: Peter Maydell <peter.maydell@linaro.org>,
 Pan Nengyuan <pannengyuan@huawei.com>
References: <20200217032127.46508-1-pannengyuan@huawei.com>
 <20200217032127.46508-3-pannengyuan@huawei.com>
 <CAFEAcA_AxCVaAgho3g2q=kCifSdhz9Qi72eoVAM9gRjb3-_Sog@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <747a3358-09af-d4fa-9150-57ad3e349f24@redhat.com>
Date: Thu, 20 Feb 2020 19:51:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_AxCVaAgho3g2q=kCifSdhz9Qi72eoVAM9gRjb3-_Sog@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: e8QTmIyfPjCGhm18K6pSQw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, mav2-rk.cave-ayland@ilande.co.uk,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Euler Robot <euler.robot@huawei.com>, andrzej zaborowski <balrogg@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: us+8DL/CAZIs

On 2/20/20 6:56 PM, Peter Maydell wrote:
> On Mon, 17 Feb 2020 at 03:22, <pannengyuan@huawei.com> wrote:
>>
>> From: Pan Nengyuan <pannengyuan@huawei.com>
>>
>> There are some memleaks when we call 'device_list_properties'. This patc=
h move timer_new from init into realize to fix it.
>> Meanwhile, do the null check in mos6522_reset() to avoid null deref if w=
e move timer_new into realize().
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
>=20
>> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
>> index 19e154b870..980eda7599 100644
>> --- a/hw/misc/mos6522.c
>> +++ b/hw/misc/mos6522.c
>> @@ -465,11 +465,15 @@ static void mos6522_reset(DeviceState *dev)
>>       s->timers[0].frequency =3D s->frequency;
>>       s->timers[0].latch =3D 0xffff;
>>       set_counter(s, &s->timers[0], 0xffff);
>> -    timer_del(s->timers[0].timer);
>> +    if (s->timers[0].timer) {
>> +        timer_del(s->timers[0].timer);
>> +    }
>>
>>       s->timers[1].frequency =3D s->frequency;
>>       s->timers[1].latch =3D 0xffff;
>> -    timer_del(s->timers[1].timer);
>> +    if (s->timers[1].timer) {
>> +        timer_del(s->timers[1].timer);
>> +    }
>>   }
>=20
> What code path calls a device 'reset' method on a device
> that has not yet been realized ? I wasn't expecting that
> to be valid...

This is not valid. What I understood while reviewing this patch is on=20
reset the timer is removed from the timers list. But this patch miss=20
setting timer =3D NULL in case the device is reset multiple times, here=20
can happen a NULL deref.

>=20
> thanks
> -- PMM
>=20

