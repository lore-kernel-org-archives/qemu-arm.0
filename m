Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4992431lfp;
        Mon, 3 Feb 2020 23:21:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqzt2yMQrT0rIfRFlOExHAOoYtLDfNooaDS5HvDz1h50v6xQ+nv8dhGThB1WFsvVnGrFXcHY
X-Received: by 2002:a0c:fe8d:: with SMTP id d13mr26787248qvs.217.1580800861286;
        Mon, 03 Feb 2020 23:21:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580800861; cv=none;
        d=google.com; s=arc-20160816;
        b=U0E8bA4/zSvQJtMWRwUxXBNbKyf8lJVicKeUxeTDm0F3W1uZnGyJdP65GxEKAkvlwG
         rKO/I5pjDrhf1iCF+R1USEck+9k6G3PW1iLn3PaqBpWZtT3TEE3Xu+63vvpSnjwDBqel
         r1YqPrwjaWByDWcfGB/VAzuFqXi3BNzU2d0Lxk3mycGXBMmoN/fgOJSh8HnjQhnB9hkN
         3MNNvCAldPhf9+qhW2mqCD+L6xgk0BgRsQONACpY8cZADnF8vwuGzIsQwGHVQcYP3gzL
         nFxNfKy0TopKB7km8p+gTqK6Mnh2P9uiQiYezSejXekEerRKwpFx+spZTstmfM0y4v79
         Cltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=EOLWci9krfbBgg5aSvBrwrLxELnY8h+iwsTqiErkRF0=;
        b=fg9tsLOADL8lnhlohxjvG1FQVWKMKbWNIPViRQVfqUBWWVQhuHG8eJOy2rbHU22XwC
         5li9Il7yB5PYpxf1ZkqfqrZmv/zLXpM9vLzSPBy2OIdIx8UWr/MDJrMsqSjkhWD3je0i
         qn/i4Ga0Zr3wYfQmiUf+K2aY5Kxm6glXXAIRXAEH/VS0BNFxXIHPiMeg5UIQMhmUG3lL
         C73LLniSMIFJjul0fAXHwZhWu3RL0ACTAIOZoNq8IvgBZz3I8t4ptiX1mLCc+4gv/mZA
         RIFdPv2IT+f+8mhSe5tSJMjTfkB5nANalMbc7IkTMORZzX7gPgnL5PWlSYorx42Ac93R
         VLZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c9TIgrZ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dh15si12172139qvb.26.2020.02.03.23.21.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 23:21:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c9TIgrZ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iysW4-0002jx-Ez
	for alex.bennee@linaro.org; Tue, 04 Feb 2020 02:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48162)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iysVm-0002jH-C5
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 02:20:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iysVk-00018y-Bm
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 02:20:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34960
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iysVi-00011Y-I7
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 02:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580800836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EOLWci9krfbBgg5aSvBrwrLxELnY8h+iwsTqiErkRF0=;
 b=c9TIgrZ3rJzksHzpILSdRQViN9sOIqra5/42V9CfSqKwIUazlNS4v30CyO/mh4TIDEWSRx
 +YFCQeN+QlykqA6DeZcm9Bfn2b84OVkQ4jZPRMO+B04QonX1XljB9INirijbx7IjDVuvae
 ifDpIg0KOC6xVKiT6xjQn1v4daBJjbw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-7FbEzZ_OOLimmvepXB9Omg-1; Tue, 04 Feb 2020 02:20:32 -0500
Received: by mail-wm1-f72.google.com with SMTP id 7so906052wmf.9
 for <qemu-arm@nongnu.org>; Mon, 03 Feb 2020 23:20:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vj6AIQZkANUQLH8G9lzr2VuMGgWh8z7iG0WTZki8HaA=;
 b=Pj+7mHWJbOuNz6K0C3bhPF83tvcOsLIEhWF15S4VwZ4rDtG4kjeDgfg/JtdsROmiD3
 gE/EogQ5ZJFAUN2EmaXqomlYC5VMnIo5aBm0rBowBIzG5mWAtI7OVu/KtaffctlWz/0z
 3ECCmsA5BPI9+T2NL8l9Xhsp54eN5pPGbeo3NAkBTu15595V1qzVHO65IRAr9XvYErgj
 CVmXzIkQiCnigYcQhTJHkBRrdPBZdYXvsJC8A1K7eNA4+5xWyLJC6ILjXC8XuUCfysgu
 uSAY3zGedBNIr8Vg2/srbk1FuAL/KAWrRNiFxFrTC6Xg5yp75Jsr18IXjIrRgtg1FpDw
 q/dQ==
X-Gm-Message-State: APjAAAV8K2NKZ1AZH6u1FakXePbu6Iqi4zigmK/He8dkvXt1Jn9SbLaY
 pDqcJ7xSR4Urc5VbI0uQvRcM02rpHq6ZjPxZ386EUIKmhZmlDHQ5OU96JZz4nu0FwY9s/mm+If/
 S1Erb14RjilgK
X-Received: by 2002:a5d:4ec2:: with SMTP id s2mr19172267wrv.291.1580800831172; 
 Mon, 03 Feb 2020 23:20:31 -0800 (PST)
X-Received: by 2002:a5d:4ec2:: with SMTP id s2mr19172247wrv.291.1580800830946; 
 Mon, 03 Feb 2020 23:20:30 -0800 (PST)
Received: from [192.168.1.35] (162.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.162])
 by smtp.gmail.com with ESMTPSA id n16sm29132607wro.88.2020.02.03.23.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2020 23:20:30 -0800 (PST)
Subject: Re: [PATCH v2] pl031: add finalize function to avoid memleaks
To: pannengyuan@huawei.com, peter.maydell@linaro.org
References: <20200204020554.9380-1-pannengyuan@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5357e046-5e07-bcaa-7731-f619a819ec26@redhat.com>
Date: Tue, 4 Feb 2020 08:20:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200204020554.9380-1-pannengyuan@huawei.com>
Content-Language: en-US
X-MC-Unique: 7FbEzZ_OOLimmvepXB9Omg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, zhang.zhanghailiang@huawei.com,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DdOMbZIvlyMa

On 2/4/20 3:05 AM, pannengyuan@huawei.com wrote:
> From: Pan Nengyuan <pannengyuan@huawei.com>
>=20
> There is a memory leak when we call 'device_list_properties' with
> typename =3D pl031. It's easy to reproduce as follow:
>=20
>    virsh qemu-monitor-command vm1 --pretty '{"execute": "device-list-prop=
erties", "arguments": {"typename": "pl031"}}'
>=20
> The memory leak stack:
>    Direct leak of 48 byte(s) in 1 object(s) allocated from:
>      #0 0x7f6e0925a970 in __interceptor_calloc (/lib64/libasan.so.5+0xef9=
70)
>      #1 0x7f6e06f4d49d in g_malloc0 (/lib64/libglib-2.0.so.0+0x5249d)
>      #2 0x564a0f7654ea in timer_new_full /mnt/sdb/qemu/include/qemu/timer=
.h:530
>      #3 0x564a0f76555d in timer_new /mnt/sdb/qemu/include/qemu/timer.h:55=
1
>      #4 0x564a0f765589 in timer_new_ns /mnt/sdb/qemu/include/qemu/timer.h=
:569
>      #5 0x564a0f76747d in pl031_init /mnt/sdb/qemu/hw/rtc/pl031.c:198
>      #6 0x564a0fd4a19d in object_init_with_type /mnt/sdb/qemu/qom/object.=
c:360
>      #7 0x564a0fd4b166 in object_initialize_with_type /mnt/sdb/qemu/qom/o=
bject.c:467
>      #8 0x564a0fd4c8e6 in object_new_with_type /mnt/sdb/qemu/qom/object.c=
:636
>      #9 0x564a0fd4c98e in object_new /mnt/sdb/qemu/qom/object.c:646
>      #10 0x564a0fc69d43 in qmp_device_list_properties /mnt/sdb/qemu/qom/q=
om-qmp-cmds.c:204
>      #11 0x564a0ef18e64 in qdev_device_help /mnt/sdb/qemu/qdev-monitor.c:=
278
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> ---
> Changes V2 to V1:
> - Delay the timer_new until realize instead of putting it into instance_i=
nit, since the pl031 can't be hotplugged(suggested by Peter Maydell).
> ---
>   hw/rtc/pl031.c | 5 +++++
>   1 file changed, 5 insertions(+)
>=20
> diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
> index ae47f09635..0b9253eb30 100644
> --- a/hw/rtc/pl031.c
> +++ b/hw/rtc/pl031.c
> @@ -190,7 +190,11 @@ static void pl031_init(Object *obj)
>       qemu_get_timedate(&tm, 0);
>       s->tick_offset =3D mktimegm(&tm) -
>           qemu_clock_get_ns(rtc_clock) / NANOSECONDS_PER_SECOND;
> +}
>  =20
> +static void pl031_realize(DeviceState *dev, Error **errp)
> +{
> +    PL031State *s =3D PL031(dev);
>       s->timer =3D timer_new_ns(rtc_clock, pl031_interrupt, s);
>   }
>  =20
> @@ -321,6 +325,7 @@ static void pl031_class_init(ObjectClass *klass, void=
 *data)
>       DeviceClass *dc =3D DEVICE_CLASS(klass);
>  =20
>       dc->vmsd =3D &vmstate_pl031;
> +    dc->realize =3D pl031_realize;
>       device_class_set_props(dc, pl031_properties);
>   }
>  =20
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

