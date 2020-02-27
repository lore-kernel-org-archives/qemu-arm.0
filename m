Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4318181lfg;
        Thu, 27 Feb 2020 03:26:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqwZh4vCKqHzk6PqJV0gk+m8ET47geRHesu6ZsgtanEL7GlN9j0HfSO3dgoejhzDlxpAix/w
X-Received: by 2002:a05:620a:1f1:: with SMTP id x17mr4828763qkn.302.1582802802063;
        Thu, 27 Feb 2020 03:26:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582802802; cv=none;
        d=google.com; s=arc-20160816;
        b=a2pqpBP+acpCudzvmJ2P826exqv0jsF26i2yqiQtmfMt95H9mbXUr2E02SLyxrZ5yY
         m42xTrdfxcUlUtm8BjI5mY8y5JNuLHWiJa+6f5PcRxUmDNrE+8nU7MEtm4jEcKI2GdHL
         qlMrVPvOCEC440EsekLORxe9qGuL5Oz+VyjPvWwAuZF7RItiV03babZ+IBQsmhFCvVyx
         CtSg6dQfJkuE4dOk1U9VgzkuwWvazuF29UCNDQ1fymuOsdKUVHBkI9PdqitByOpeFpRa
         1XBH4c3AdM9DdWB83ZwDn3ODMDYBJRyRNI3SesaJExaB6Nf/hfQdU8adqRGjkO98d5jR
         V74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=Z7SGzUnflewfcAQEg605bYMa1MREY5RIVHSQxJo41yc=;
        b=giDOcsCsc472qRP+aazNSCd7vZh3ubS48HoD8cRlpnRSinxFoEoJF0NlfOnAhBQbxT
         vW7CsqCqXkwk5+jD04rZgArF61S8gWDOl/cQFPDNfRGixji5ZgJS2N1OZKKtMuqaqK2F
         P2DFn2a5VaTpNAx3DNSQgniScf8tw46XmaLVniWlY0Kurm1un11tg9V5EcGssOx8ODhE
         eTUfWPZMLWMyVDs2IXqlUSdNfvxaFHHJEhBzxEZa0AKCT11KK6aTDRcvYaD2boYG1h3f
         aa5sd1z6n1x54pRHpyOjQJxzTyVFfI46QtuWeYthZQ2dDl9ukhUC6jANSNVYLuEUk++x
         ED8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si952390qvo.5.2020.02.27.03.26.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 03:26:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7HJR-0003WG-GO
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 06:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38970)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j7HJG-0003Uh-FM
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 06:26:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j7HJD-0000xq-KB
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 06:26:30 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:36082 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j7HJD-0000ls-9E; Thu, 27 Feb 2020 06:26:27 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 6BA24523E58475D09CEE;
 Thu, 27 Feb 2020 19:26:18 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 27 Feb
 2020 19:26:10 +0800
Subject: Re: [PATCH v3 1/6] s390x: fix memleaks in cpu_finalize
To: Cornelia Huck <cohuck@redhat.com>
References: <20200227025055.14341-1-pannengyuan@huawei.com>
 <20200227025055.14341-2-pannengyuan@huawei.com>
 <20200227120649.50e6ea68.cohuck@redhat.com>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <50512b17-856b-f509-adb6-46015e86e000@huawei.com>
Date: Thu, 27 Feb 2020 19:25:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200227120649.50e6ea68.cohuck@redhat.com>
Content-Type: text/plain; charset="utf-8"
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com, David
 Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, euler.robot@huawei.com,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xCAYkC8iMK9A



On 2/27/2020 7:06 PM, Cornelia Huck wrote:
> On Thu, 27 Feb 2020 10:50:50 +0800
> Pan Nengyuan <pannengyuan@huawei.com> wrote:
>=20
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
y Philippe Mathieu-Daud=C3=83=C2=A9)
>> v3->v2:
>> - Also do the timer_free in unrealize, it seems more balance.
>> ---
>>  target/s390x/cpu.c | 22 ++++++++++++++++++----
>>  1 file changed, 18 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
>> index cf84d307c6..cc63c9db22 100644
>> --- a/target/s390x/cpu.c
>> +++ b/target/s390x/cpu.c
>> @@ -170,7 +170,12 @@ static void s390_cpu_realizefn(DeviceState *dev, =
Error **errp)
>>      S390CPUClass *scc =3D S390_CPU_GET_CLASS(dev);
>>  #if !defined(CONFIG_USER_ONLY)
>>      S390CPU *cpu =3D S390_CPU(dev);
>> +    cpu->env.tod_timer =3D
>> +        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_tod_timer, cpu);
>> +    cpu->env.cpu_timer =3D
>> +        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_cpu_timer, cpu);
>>  #endif
>=20
> It does not seem you addressed the comments I had last time, namely
> - memory leak on error (we do not go through unrealize if the device
>   was never completely realized)
> - coding style (initialization in middle of declaration section)

I am sorry, I misread the peter's reply and miss the codeing style too.

Apologies for you. I will change it.

Thanks.

>=20
>> +
>>      Error *err =3D NULL;
>> =20
>>      /* the model has to be realized before qemu_init_vcpu() due to kv=
m */
>=20
> .
>=20
