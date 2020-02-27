Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4164852lfg;
        Thu, 27 Feb 2020 00:58:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqyqg4Gr/XC+QhSrdvUCXTSgKLM1awoxhDp4UEmyETGpUSUrxpmY3gZw2lhe9noEfC6rSzZc
X-Received: by 2002:ac8:6f37:: with SMTP id i23mr3921105qtv.263.1582793922957;
        Thu, 27 Feb 2020 00:58:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582793922; cv=none;
        d=google.com; s=arc-20160816;
        b=QLK+gBiCgxFyMpihAuGuUnSXg2ad0ni6Sx3DXVQRbl1qcy/ZmSoQdPXLjwGgotTucv
         LEdZJZTLpA3LRbBJyteETpPNfhqTbIxlohDFUAqWycCkI3fl2PlMbRf8MD8Yxbe95Nyw
         z3bHn/rQNuGiKGc1H7vgtoYX/dJqPoi6WLyt94GhvV4ILaJ4vY/My+tiMTB06tAhLS0s
         IIdARiiC5CFMZ/HFacwHtKfJ09AiMlYMcbfjn/Mhspk18eZyisSmvdtYOD5L6xGuPSjY
         1Nk7FEeBkLJ07LneWYgGhRxyVjksihoMNfxeKvtHyftOaChN/y+s03bQovxNnluKCLtG
         FY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=vR9/szkLyx2gjGPy+1+JFnqtKbr+RoBYNAKCdzWtU4U=;
        b=AcJdtxdYV/835CL2eusZahgs1T+Ua0jr/jn40uC7eXA57VJFZzjCvclp1LbWEmGyyr
         XSO7G1kzcW1zIO+xamQdz7RqK42+LpqCpvPpkx0Zoul860LHm5OqdvrFScc9lzYJQo5b
         ph0thaW5Z2oLigIprHEW0hgiBAwTEQE4mQv8ElimAklPRsuOhlYQvXKKDFy5hdp7VjQr
         AglgOf+25AUPGVLwo5Rsa0egAH/VliSwUq7KK+68vv9oyn1SlFa3ZCk4qaV8iwjDeusf
         PxYRNjntMvRg9Z/2V8lxjQ3YMvZS/NWLdiPQZpr3m8qRJ8UgrBbxOukGBiMjwsV0Vt32
         szZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v129si1128619qki.101.2020.02.27.00.58.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 00:58:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7F0E-0003pL-BU
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 03:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33877)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j7F05-0003p5-UW
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 03:58:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j7F04-0005lo-Hb
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 03:58:33 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3176 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j7F04-0005RP-50; Thu, 27 Feb 2020 03:58:32 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 222E6A77A0A3E8399D1C;
 Thu, 27 Feb 2020 16:58:26 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 27 Feb
 2020 16:58:16 +0800
Subject: Re: [PATCH v3 1/6] s390x: fix memleaks in cpu_finalize
To: David Hildenbrand <david@redhat.com>, <peter.maydell@linaro.org>
References: <20200227025055.14341-1-pannengyuan@huawei.com>
 <20200227025055.14341-2-pannengyuan@huawei.com>
 <59af1e29-8075-a25c-dd80-e93cc21bb328@redhat.com>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <46d1fc23-6ef5-947f-becd-c3004a6b76bc@huawei.com>
Date: Thu, 27 Feb 2020 16:58:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <59af1e29-8075-a25c-dd80-e93cc21bb328@redhat.com>
Content-Type: text/plain; charset="utf-8"
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
X-TUID: 0wrW3rRNE7bu



On 2/27/2020 4:41 PM, David Hildenbrand wrote:
> On 27.02.20 03:50, Pan Nengyuan wrote:
>> This patch fix memleaks when we call tests/qtest/cpu-plug-test on s390=
x. The leak stack is as follow:
>>
>> Direct leak of 48 byte(s) in 1 object(s) allocated from:
>>     #0 0x7fb43c7cd970 in __interceptor_calloc (/lib64/libasan.so.5+0xe=
f970)
>>     #1 0x7fb43be2149d in g_malloc0 (/lib64/libglib-2.0.so.0+0x5249d)
>>     #2 0x558ba96da716 in timer_new_full /mnt/sdb/qemu-new/qemu/include=
/qemu/timer.h:530
>>     #3 0x558ba96da716 in timer_new /mnt/sdb/qemu-new/qemu/include/qemu=
/timer.h:551
>>     #4 0x558ba96da716 in timer_new_ns /mnt/sdb/qemu-new/qemu/include/q=
emu/timer.h:569
>>     #5 0x558ba96da716 in s390_cpu_initfn /mnt/sdb/qemu-new/qemu/target=
/s390x/cpu.c:285
>>     #6 0x558ba9c969ab in object_init_with_type /mnt/sdb/qemu-new/qemu/=
qom/object.c:372
>>     #7 0x558ba9c9eb5f in object_initialize_with_type /mnt/sdb/qemu-new=
/qemu/qom/object.c:516
>>     #8 0x558ba9c9f053 in object_new_with_type /mnt/sdb/qemu-new/qemu/q=
om/object.c:684
>>     #9 0x558ba967ede6 in s390x_new_cpu /mnt/sdb/qemu-new/qemu/hw/s390x=
/s390-virtio-ccw.c:64
>>     #10 0x558ba99764b3 in hmp_cpu_add /mnt/sdb/qemu-new/qemu/hw/core/m=
achine-hmp-cmds.c:57
>>     #11 0x558ba9b1c27f in handle_hmp_command /mnt/sdb/qemu-new/qemu/mo=
nitor/hmp.c:1082
>>     #12 0x558ba96c1b02 in qmp_human_monitor_command /mnt/sdb/qemu-new/=
qemu/monitor/misc.c:142
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
>> - Similarly to other cleanups, move timer_new into realize(Suggested b=
y Philippe Mathieu-Daud=C3=A9)
>> v3->v2:
>> - Also do the timer_free in unrealize, it seems more balance.
>> ---
>=20
>=20
> As I already said, I think this is init and not realize stuff. Do we
> have a convention now and documented that?
>=20
> Anyhow, I don't really care
> [...]
>=20
>=20
>> @@ -453,6 +466,7 @@ static void s390_cpu_class_init(ObjectClass *oc, v=
oid *data)
>> =20
>>      device_class_set_parent_realize(dc, s390_cpu_realizefn,
>>                                      &scc->parent_realize);
>> +    dc->unrealize =3D s390_cpu_unrealizefn;
>=20
> Shouldn't we use device_class_set_parent_unrealize?

We just only declare parent_realize field in S390CPUClass(), it seems not=
hing to do in parent_unrealize.

typedef struct S390CPUClass {
...
DeviceRealize parent_realize;    // no parent_unrealize;
...
}

So I think we can't use it.

Thanks.

>=20
>=20
