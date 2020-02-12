Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6977189lfp;
        Wed, 12 Feb 2020 15:50:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqxdiLy8IW1K8q/u5a7T4Q4nQVqkeJntrHpcNuoeGjLa6GWYbGOk1yGHjrELB9NG380xOZpX
X-Received: by 2002:ac8:1ae5:: with SMTP id h34mr5482212qtk.323.1581551441648;
        Wed, 12 Feb 2020 15:50:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581551441; cv=none;
        d=google.com; s=arc-20160816;
        b=IyP/hj3tBXTmmjHVVxt82vMjDCz1vM8ajVzjW+cvvrpJ9XuDzc+4ZwGNCy4J4tot7q
         v92Ua2Enxx3ZQGygu98JLhkhVx2HWY7zDGer7pTIRJKetHVHEdswHf/OcxL0sClM1ohH
         lrUj36x42fKtQRYjbgoWIKnWMSE2D0UON9jChwzaU65K7MJ5QYSjXExq5vvLDPF9mZES
         FVQoM1jtpoHeVamFkPUPhtCudA0r4mxpCop012oAOnL7I/oq/rCsnDAiuoW41nKkSkPn
         U9uQPyTreQ25fQrZoMUb4yIPRx/lhnzXQ+wnz44x0y2ROVfs71uvC8T5LiCpULQvPS6S
         xFGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hoVDmVj7tf/3I9f5qv34pu2bsqPu8fzOGSr0NtbiWQU=;
        b=XVRqKWokC4yCbzSZv1aNr4qhvRH6n+GhTRQkZurJfXpD3H3MesLTkmHsykZEvPyQUB
         Bn0ermh+JPUEQjuwN62qzEv1lHXK8KkJILXKWo1XJ6cbHwiC8Wy05H97oqWWvNhTelhP
         a/13+SaIGPx2G3wTlshJXm3PklEQDu301jMDzcNAFGU5zm2B5gRhRwMMMyx+J2gp8s3C
         IoRs0/koSO8qQT5lhzJTwsxRLdJ4hiP2jaje3Tc0XLxCwzf6P4JL/8O3PNLiV9O5oMgk
         q5VEYyevkQ/Z7tYSokgMwyT7TR1sxp1M4JwxmHqd72w0zPYdP/vicDaEuCJ8ja/NkoWd
         22KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BFIplAEw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20si229721qvw.19.2020.02.12.15.50.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2020 15:50:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BFIplAEw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j21mD-0008Cx-1z
	for alex.bennee@linaro.org; Wed, 12 Feb 2020 18:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60527)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j21m1-00087y-VS
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 18:50:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j21m0-0004Lm-EF
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 18:50:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29715
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j21m0-0004I0-AD
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 18:50:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581551427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hoVDmVj7tf/3I9f5qv34pu2bsqPu8fzOGSr0NtbiWQU=;
 b=BFIplAEw992N+Q6dvzq/nTFeQm75c14SrhrSJnHd2GtbN28vWq931ngy7exTHC8qI7/uwk
 TVDEma+kqF08y+pH6gNOQw2oAX7Nk/6CvHZqdruCm9nCHQp9BjUyKDKbfseTNHa0v2t20z
 R0Ym49ZfAybCW+tPsBTrv5nMV8rtUms=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-IBbc3lL9N5iF0BDGIRfUWA-1; Wed, 12 Feb 2020 18:50:23 -0500
Received: by mail-wr1-f70.google.com with SMTP id c6so1513330wrm.18
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2020 15:50:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3e9tHzcBpymr9ZVFlcWUS9SfB7AP8b+B0HxesLBu11M=;
 b=lXD6AinIfnYz0RPnm5GtDv/0JpuzGY2UH9ZtRCvlBL3IvQiwO1V3HrkIL/OxKyLvqP
 WzYUYNOfSNJFRGNR4phY+uZB2NZow3h11fsw32n91kxNrcK6MlioQJq8zCqtVWaFpgbt
 CwEA1Lv44fEuXViAoyCJTzvlEeWt2o9RelrMPpCbh6q4dm8YfsE7os2apHPUQZ/4CiI9
 nv7qlVoXcjR1fJForRxEHaHdRUt3rxn4LGhNAMiJgP1qabGXA2Og8J7lzwAMEhpVozBj
 o87C5V9OV2WX1LroXirv+UJUUKlZ7HCexWvq7rbceV76GYV/nfq4UMrI3M8+JHEUMeOs
 saKw==
X-Gm-Message-State: APjAAAVWlarJSpmZn3bz3uLyvecU04QDuR8NRusugZ0OyaBdlVWhga2l
 TftJmIz2Zq/ND1VvLvNJfWr62tSG78p3Tga2FHJ+nu3pZd11a+YxOVoDi3uqS3RE4xOkuTlSfsu
 EzwEJwubUKbh0
X-Received: by 2002:a1c:2747:: with SMTP id n68mr1577725wmn.14.1581551422555; 
 Wed, 12 Feb 2020 15:50:22 -0800 (PST)
X-Received: by 2002:a1c:2747:: with SMTP id n68mr1577688wmn.14.1581551422240; 
 Wed, 12 Feb 2020 15:50:22 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id m68sm467847wme.48.2020.02.12.15.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2020 15:50:21 -0800 (PST)
Subject: Re: Question about (and problem with) pflash data access
To: Guenter Roeck <linux@roeck-us.net>
References: <20200212184648.GA584@roeck-us.net>
 <504e7722-0b60-ec02-774d-26a7320e5309@redhat.com>
 <20200212230918.GA27242@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <560224fe-f0a3-c64a-6689-e824225cfbb9@redhat.com>
Date: Thu, 13 Feb 2020 00:50:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200212230918.GA27242@roeck-us.net>
Content-Language: en-US
X-MC-Unique: IBbc3lL9N5iF0BDGIRfUWA-1
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C7RIOSHLPjVm

Cc'ing Paolo and Alexey.

On 2/13/20 12:09 AM, Guenter Roeck wrote:
> On Wed, Feb 12, 2020 at 10:39:30PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> Cc'ing Jean-Christophe and Peter.
>>
>> On 2/12/20 7:46 PM, Guenter Roeck wrote:
>>> Hi,
>>>
>>> I have been playing with pflash recently. For the most part it works,
>>> but I do have an odd problem when trying to instantiate pflash on sx1.
>>>
>>> My data file looks as follows.
>>>
>>> 0000000 0001 0000 aaaa aaaa 5555 5555 0000 0000
>>> 0000020 0000 0000 0000 0000 0000 0000 0000 0000
>>> *
>>> 0002000 0002 0000 aaaa aaaa 5555 5555 0000 0000
>>> 0002020 0000 0000 0000 0000 0000 0000 0000 0000
>>> *
>>> 0004000 0003 0000 aaaa aaaa 5555 5555 0000 0000
>>> 0004020 0000 0000 0000 0000 0000 0000 0000 0000
>>> ...
>>>
>>> In the sx1 machine, this becomes:
>>>
>>> 0000000 6001 0000 aaaa aaaa 5555 5555 0000 0000
>>> 0000020 0000 0000 0000 0000 0000 0000 0000 0000
>>> *
>>> 0002000 6002 0000 aaaa aaaa 5555 5555 0000 0000
>>> 0002020 0000 0000 0000 0000 0000 0000 0000 0000
>>> *
>>> 0004000 6003 0000 aaaa aaaa 5555 5555 0000 0000
>>> 0004020 0000 0000 0000 0000 0000 0000 0000 0000
>>> *
>>> ...
>>>
>>> pflash is instantiated with "-drive file=3Dflash.32M.test,format=3Draw,=
if=3Dpflash".
>>>
>>> I don't have much success with pflash tracing - data accesses don't
>>> show up there.
>>>
>>> I did find a number of problems with the sx1 emulation, but I have no c=
lue
>>> what is going on with pflash. As far as I can see pflash works fine on
>>> other machines. Can someone give me a hint what to look out for ?
>>
>> This is specific to the SX1, introduced in commit 997641a84ff:
>>
>>   64 static uint64_t static_read(void *opaque, hwaddr offset,
>>   65                             unsigned size)
>>   66 {
>>   67     uint32_t *val =3D (uint32_t *) opaque;
>>   68     uint32_t mask =3D (4 / size) - 1;
>>   69
>>   70     return *val >> ((offset & mask) << 3);
>>   71 }
>>
>> Only guessing, this looks like some hw parity, and I imagine you need to
>> write the parity bits in your flash.32M file before starting QEMU, then =
it
>> would appear "normal" within the guest.
>>
> I thought this might be related, but that is not the case. I added log
> messages, and even ran the code in gdb. static_read() and static_write()
> are not executed.
>=20
> Also,
>=20
>      memory_region_init_io(&cs[0], NULL, &static_ops, &cs0val,
>                            "sx1.cs0", OMAP_CS0_SIZE - flash_size);
>                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^
>      memory_region_add_subregion(address_space,
>                                  OMAP_CS0_BASE + flash_size, &cs[0]);
>                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> suggests that the code is only executed for memory accesses _after_
> the actual flash. The memory tree is:
>=20
> memory-region: system
>    0000000000000000-ffffffffffffffff (prio 0, i/o): system
>      0000000000000000-0000000001ffffff (prio 0, romd): omap_sx1.flash0-1
>      0000000000000000-0000000001ffffff (prio 0, rom): omap_sx1.flash0-0

Eh two memory regions with same size and same priority... Is this legal?

(qemu) info mtree -f -d
FlatView #0
  AS "memory", root: system
  AS "cpu-memory-0", root: system
  Root memory region: system
   0000000000000000-0000000001ffffff (prio 0, romd): omap_sx1.flash0-1
   0000000002000000-0000000003ffffff (prio 0, i/o): sx1.cs0
   0000000004000000-0000000007ffffff (prio 0, i/o): sx1.cs1
   0000000008000000-000000000bffffff (prio 0, i/o): sx1.cs3
   0000000010000000-0000000011ffffff (prio 0, ram): omap1.dram
   0000000020000000-000000002002ffff (prio 0, ram): omap1.sram
   ...
   Dispatch
     Physical sections
       #0 @0000000000000000..ffffffffffffffff (noname) [unassigned]
       #1 @0000000000000000..0000000001ffffff omap_sx1.flash0-1 [not dirty]
       #2 @0000000002000000..0000000003ffffff sx1.cs0 [ROM]
       #3 @0000000004000000..0000000007ffffff sx1.cs1 [watch]
       #4 @0000000008000000..000000000bffffff sx1.cs3
       #5 @0000000010000000..0000000011ffffff omap1.dram
       #6 @0000000020000000..000000002002ffff omap1.sram
       ...
     Nodes (9 bits per level, 6 levels) ptr=3D[3] skip=3D4
       [0]
           0       skip=3D3  ptr=3D[3]
           1..511  skip=3D1  ptr=3DNIL
       [1]
           0       skip=3D2  ptr=3D[3]
           1..511  skip=3D1  ptr=3DNIL
       [2]
           0       skip=3D1  ptr=3D[3]
           1..511  skip=3D1  ptr=3DNIL
       [3]
           0       skip=3D1  ptr=3D[4]
           1       skip=3D1  ptr=3D[5]
           2       skip=3D2  ptr=3D[7]
           3..13   skip=3D1  ptr=3DNIL
          14       skip=3D2  ptr=3D[9]
          15       skip=3D2  ptr=3D[11]
          16..511  skip=3D1  ptr=3DNIL
       [4]
           0..63   skip=3D0  ptr=3D#1
          64..127  skip=3D0  ptr=3D#2
         128..255  skip=3D0  ptr=3D#3
         256..383  skip=3D0  ptr=3D#4
         384..511  skip=3D1  ptr=3DNIL

So the romd wins.

>      0000000002000000-0000000003ffffff (prio 0, i/o): sx1.cs0
>=20
> I thought that the dual memory assignment (omap_sx1.flash0-1 and
> omap_sx1.flash0-0) might play a role, but removing that didn't make
> a difference either (not that I have any idea what it is supposed
> to be used for).
>=20
> Thanks,
> Guenter
>=20

