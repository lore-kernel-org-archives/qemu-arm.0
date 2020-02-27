Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4162598lfg;
        Thu, 27 Feb 2020 00:56:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqz94TmqcyS2yo1AD45CFQYkXiQC0+5602sUvgPME+HdJn1JvNFzVAMyzLTt5R/uIB1/6b8y
X-Received: by 2002:ac8:530c:: with SMTP id t12mr3388398qtn.83.1582793760823;
        Thu, 27 Feb 2020 00:56:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582793760; cv=none;
        d=google.com; s=arc-20160816;
        b=xbI9YqLsCNbQVy5GlG5Y3ji9TVyHens7D0Fl21U/7S1PNJ4vY1ScdXfpaWnIcfrzmK
         6XeP/os9+fa+lLJKhxqMUU+v5ski+77Je/bPGLFXV2WGUFX9FtoLgtnuxj1Gq0BZFa1O
         AqwBVpSIM4xzaTHLr1mvlmvzMKUDstZzJxQ3YXp4ugws90GbmvFDz6GE0FLCRrSSETi6
         VNI26xTofwx2m1teyaeSTMK4dIuTks6P2Ntmv3KrIy8/6I4as0M+i+R7s6rUktePM1Cs
         g4Ctwj9a1NMoHHSSGWHQgxsTWVT32dQhTnkqHIn0udcyHo3NlGxTUKe6QMTuCz82Y706
         3KRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=UFIoBLV8LN6KXnMOGR55IF/rKYy0/YvpI5E5W93PyrM=;
        b=KIilKdy551dtQeoYKQGqb0rQlCFurzZgY2KWismvRlur7kSxYD5sF4vxNs1KnCSGn8
         eOWaPSpqdzPA5qQ4iDIIfZbCpRLzyg17tCf2UUcO8x0/M9KlTu05i0N8/+dz85kzAnQa
         a2QsFe7+qT8cK+uRhmqHbBYH4IodFwkw7Wtep9+ZYa/OR4RQJ0BtLqjPMDQwx/DuZpIv
         7NvRxM+rKbLClLxKdl4pOcpZoydxNMwfPydg5epxq1ZfMnR4A2g5fG5yc4/vbzNbPDBX
         SFGzL/+Ww6BYYf0RKpSYutdMGQlpGqnHa8K+cpgsLsHrfekUqAO2hHYr9hm43gjKD26a
         vk7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BsD7FYm/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v35si1026081qtk.206.2020.02.27.00.56.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 00:56:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BsD7FYm/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7Exc-0001Pa-6U
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 03:56:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60267)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7ExS-0001L4-G6
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 03:55:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7ExR-00077W-9i
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 03:55:50 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60780
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7ExR-00074E-6J
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 03:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582793748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UFIoBLV8LN6KXnMOGR55IF/rKYy0/YvpI5E5W93PyrM=;
 b=BsD7FYm//Gq04APe7/bfo1YBsdXlS0wwFNa7hZ+TmRVA9z36namMabv9aA4hdgk22oP3IG
 NgpakFYTRVqVnahbZj3Twpmf7bHrEmu9HacBe2xWq4sj36mvFotb6W1HU2Vv9FZyvvN3Ah
 +IxZoRiL2za0n5TmC02lTyGw+2ZN0PY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-KuZEJ85gNneN6DKjOOtLmA-1; Thu, 27 Feb 2020 03:55:42 -0500
X-MC-Unique: KuZEJ85gNneN6DKjOOtLmA-1
Received: by mail-wr1-f70.google.com with SMTP id c6so999927wrm.18
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2020 00:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kD8h6BKhPgPJsZKOsFIr7rx01I3aF95aVsYiWOV+iUw=;
 b=kj1idHENlYXJnwJNY4wifuGwjXX1kSO06ER1ltBB6ZD10+7bI4Tq7/aj6jUnqsIlM9
 ei4IUGxZSNYn+wSeePiaDe7lrWzfPxQfRa8Up52GPkk31QqT6vMVBI3zZtR2z3F2x2Z8
 tEvCb/53EhU1o/mPO1a08lTmxZrUArgiYWf735iH+gUcfzeE0KxtXb1ayKrQ8/ds96E0
 7SSmkHLpNPZEMYlJ/DQ/9VVNISfD6WlBSm238HVBoGFaiIhxeORLI4+cWjglo3Eew1C0
 AOqo5jJf3Rbst643vdhV0pFMBk/jv9Dp+sz+Mn/qvHGBBSPdooW5MRTYRb2i+Le3Aog/
 ckgA==
X-Gm-Message-State: APjAAAULU5mwBdL+cPuwehsDxeik0nSxNDMXU5j1Pg9THCgjwxIuI3yr
 xeQpAFSgdwGRB7p1OLucs64AU96nZLH3EcbLX76x9F+jSz7kHZDgNk9jEy/v0UTCjFH2VKNbAaK
 gAIl/Hl/SROvx
X-Received: by 2002:a05:600c:54e:: with SMTP id
 k14mr3764677wmc.115.1582793740758; 
 Thu, 27 Feb 2020 00:55:40 -0800 (PST)
X-Received: by 2002:a05:600c:54e:: with SMTP id
 k14mr3764641wmc.115.1582793740359; 
 Thu, 27 Feb 2020 00:55:40 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id r28sm7442074wra.16.2020.02.27.00.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 00:55:39 -0800 (PST)
Subject: Re: [PATCH v3 1/6] s390x: fix memleaks in cpu_finalize
To: David Hildenbrand <david@redhat.com>,
 Pan Nengyuan <pannengyuan@huawei.com>, peter.maydell@linaro.org
References: <20200227025055.14341-1-pannengyuan@huawei.com>
 <20200227025055.14341-2-pannengyuan@huawei.com>
 <59af1e29-8075-a25c-dd80-e93cc21bb328@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <399dfb54-62b7-945b-9f68-4818d419f079@redhat.com>
Date: Thu, 27 Feb 2020 09:55:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <59af1e29-8075-a25c-dd80-e93cc21bb328@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: zhang.zhanghailiang@huawei.com, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 euler.robot@huawei.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DTOe8wvQxDXz

On 2/27/20 9:41 AM, David Hildenbrand wrote:
> On 27.02.20 03:50, Pan Nengyuan wrote:
>> This patch fix memleaks when we call tests/qtest/cpu-plug-test on s390x.=
 The leak stack is as follow:
>>
>> Direct leak of 48 byte(s) in 1 object(s) allocated from:
>>      #0 0x7fb43c7cd970 in __interceptor_calloc (/lib64/libasan.so.5+0xef=
970)
>>      #1 0x7fb43be2149d in g_malloc0 (/lib64/libglib-2.0.so.0+0x5249d)
>>      #2 0x558ba96da716 in timer_new_full /mnt/sdb/qemu-new/qemu/include/=
qemu/timer.h:530
>>      #3 0x558ba96da716 in timer_new /mnt/sdb/qemu-new/qemu/include/qemu/=
timer.h:551
>>      #4 0x558ba96da716 in timer_new_ns /mnt/sdb/qemu-new/qemu/include/qe=
mu/timer.h:569
>>      #5 0x558ba96da716 in s390_cpu_initfn /mnt/sdb/qemu-new/qemu/target/=
s390x/cpu.c:285
>>      #6 0x558ba9c969ab in object_init_with_type /mnt/sdb/qemu-new/qemu/q=
om/object.c:372
>>      #7 0x558ba9c9eb5f in object_initialize_with_type /mnt/sdb/qemu-new/=
qemu/qom/object.c:516
>>      #8 0x558ba9c9f053 in object_new_with_type /mnt/sdb/qemu-new/qemu/qo=
m/object.c:684
>>      #9 0x558ba967ede6 in s390x_new_cpu /mnt/sdb/qemu-new/qemu/hw/s390x/=
s390-virtio-ccw.c:64
>>      #10 0x558ba99764b3 in hmp_cpu_add /mnt/sdb/qemu-new/qemu/hw/core/ma=
chine-hmp-cmds.c:57
>>      #11 0x558ba9b1c27f in handle_hmp_command /mnt/sdb/qemu-new/qemu/mon=
itor/hmp.c:1082
>>      #12 0x558ba96c1b02 in qmp_human_monitor_command /mnt/sdb/qemu-new/q=
emu/monitor/misc.c:142
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
>> ---
>> Cc: Richard Henderson <rth@twiddle.net>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Cornelia Huck <cohuck@redhat.com>
>> Cc: qemu-s390x@nongnu.org
>> ---
>> v2->v1:
>> - Similarly to other cleanups, move timer_new into realize(Suggested by =
Philippe Mathieu-Daud=C3=A9)
>> v3->v2:
>> - Also do the timer_free in unrealize, it seems more balance.
>> ---
>=20
>=20
> As I already said, I think this is init and not realize stuff. Do we
> have a convention now and documented that?

The clearer doc I read so far is this post:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg680187.html
(but see the thread for more helpful comments)

Another thread that you might find interesting is "how to handle QOM=20
'container' objects whose contents depend on QOM properties?"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg511703.html

>=20
> Anyhow, I don't really care
> [...]

Well, looking at the time spent on these series and their review, having=20
it better documented might save time the whole community.

>=20
>> @@ -453,6 +466,7 @@ static void s390_cpu_class_init(ObjectClass *oc, voi=
d *data)
>>  =20
>>       device_class_set_parent_realize(dc, s390_cpu_realizefn,
>>                                       &scc->parent_realize);
>> +    dc->unrealize =3D s390_cpu_unrealizefn;
>=20
> Shouldn't we use device_class_set_parent_unrealize?
>=20
>=20

